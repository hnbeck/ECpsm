###############################################################################
#
# TCL Script for testing and test file creation
# Author: Hans N. Beck
# Date: 08/2023
# (c)
###############################################################################
package require fileutil

# where I am?
set fileBase  [file normalize [info script]]
set cd [file dirname $fileBase]
# source [file join $cd facts.tcl]
set ruleFile [file join  $cd rules.txt]
set oddFile [file join  $cd odd.txt]


#### Helpers

# GUI Helper from the book of B B Welch from 1995
proc ScrolledListbox {parent handler args} {
    frame $parent
    eval {listbox $parent.list \
            -yscrollcommand [list $parent.sy set]  } $args
    scrollbar $parent.sy -orient vertical -command [list $parent.list yview]
    pack $parent.list -side left -fill x -expand true
    pack $parent.sy -side right -fill y

    bind $parent.list <ButtonRelease-1> [list $handler %W %y]
    return $parent.list
}

proc ScrolledTextbox {parent args} {
    frame $parent
    eval {text $parent.fileText \
            -yscrollcommand [list $parent.sy set] \
            -xscrollcommand [list $parent.sx set] } $args
    scrollbar $parent.sy -orient vertical -command [list $parent.fileText yview]
    scrollbar $parent.sx -orient horizontal -command [list $parent.fileText xview]
    pack $parent.sx -side bottom -fill x
    pack $parent.sy -side right -fill y
    pack $parent.fileText -side left -fill both -expand true
    return $parent.fileText
}


# what to do if Indicator is selected
proc SelectIndicator {w y} {
    $w select set anchor [$w nearest $y]
    set id [$w get [$w curselect]]
    # take only the indicator part
    set indicator [string range $id 0 1 ]
    set effect [string range $id 4 end]
    if {$indicator ne " "} { $::aFact insert end [string trim $indicator]}
    FillEffects $effect
}

# what to do if Effect is selected
proc SelectEffect {w y} {

  $w select set anchor [$w nearest $y]
  set effect [$w get [$w curselect]]
  # combine indicator with effect
  set indicator [string index $::fact end]
  set index  [expr { [$::aFact index end] -1}]
  $::aFact delete $index
  $::aFact insert end [join [list $effect $indicator] ""]
}

# fill the Effects if Indicator is selected
proc FillEffects {effectString} {
    $::EList delete 0 end
    set effectList [split $effectString " "]
    foreach item $effectList {
        $::EList insert end $item
    }
}

###### create GUI

wm title . ECFiletester
wm minsize . 800 400 

# main frame
frame .left -borderwidth 10 
frame .right -borderwidth 10
pack .left -side left -fill x -fill y
pack .right -side left -fill x

# left Panel
frame .left.cmd -borderwidth 10 
pack .left.cmd -side top -fill x

# buttons
button .left.cmd.add -text Add -command AddFact
button .left.cmd.read -text Read -command Read
button .left.cmd.write -text Write -command Write
button .left.cmd.generate -text Generate -command GenPattern
button .left.cmd.clear -text Clear -command ClearFact
pack .left.cmd.read -side left
pack .left.cmd.write -side left
pack .left.cmd.generate -side left
pack .left.cmd.clear -sid left
pack .left.cmd.add -sid left

checkbutton .left.cmd.ruleOption -text Rules -variable ruleFlag
pack .left.cmd.ruleOption -padx 10 

frame .left.setup -borderwidth 10 
pack .left.setup -side top -fill x

# File paths
label .left.setup.ruleFLabel -text Rules: -padx 5 -pady 5 -anchor w 
entry .left.setup.ruleF -width 50 -textvariable ruleFile
pack .left.setup.ruleFLabel -side top -fill x
pack .left.setup.ruleF -side top

label .left.setup.oddFLabel -text ODD: -padx 5 -pady 5 -anchor w 
entry .left.setup.oddF -width 50 -textvariable oddFile
pack .left.setup.oddFLabel -side top -fill x
pack .left.setup.oddF -side top

# Indicators and effects listboxes
label .left.setup.lIndi -text Indicators -padx 5 -pady 5 -anchor w 
set IList [ScrolledListbox .left.setup.indicators SelectIndicator -height 4 -selectmode single]
pack .left.setup.lIndi -side top -fill x
pack .left.setup.indicators -side top -fill x

label .left.setup.lEffects -text Effects -padx 5 -pady 5 -anchor w
set EList [ScrolledListbox .left.setup.effects SelectEffect -height 4 -selectmode single] 
pack .left.setup.lEffects -side top -fill x
pack .left.setup.effects -side top -fill x

label .left.setup.lFact -text Facts -padx 5 -pady 5 -anchor w
set aFact [entry .left.setup.fact -width 50 -textvariable fact]
pack .left.setup.lFact -side top -fill x
pack .left.setup.fact -side top -fill x

bind Listbox <KeyRelease> [list SpaceBar %W %y %A]

####  right side of GUI
frame .right.t1 -borderwidth 10
label .right.t1.lRule -text {Rule input:} -padx 10 -anchor w
set ruleInput  [ScrolledTextbox .right.t1.ruleIn  -width 40 -height 5 -pady 10 -padx 10 -wrap none]
pack .right.t1.lRule -side top
pack .right.t1.ruleIn -side bottom -fill x -expand true
pack .right.t1 -side top -fill x -expand true

frame .right.t2 -borderwidth 10
label .right.t2.lOdd -text {ODD input:} -padx 10 -anchor w
set oddInput  [ScrolledTextbox .right.t2.oddIn  -width 40 -height 5 -pady 10 -padx 10 -wrap none]
pack .right.t2.lOdd -side top
pack .right.t2.oddIn -side bottom -fill x -expand true
pack .right.t2 -side top -fill x -expand true

## right panel
frame .right.t3 -borderwidth 10
label .right.t3.l2 -text Output: -padx 10 -anchor w
set output [ScrolledTextbox  .right.t3.output  -width 40 -height 5 -pady 10 -padx 10 -wrap none]
pack .right.t3.l2 -side top
pack .right.t3.output -side top -fill x -expand true
pack .right.t3 -side top -fill x -expand true

proc SpaceBar {w y a} {

    if {$::ruleFlag} {
        if {$a eq " "} {
                $::aFact insert end ">"
        }
    }
    
   
}

proc ClearFact {} {
    $::aFact delete 0 end
}

proc AddFact {} {
    $::output insert end $::fact\n
    ClearFact
}

proc Write {} {
    # if the fact contains a ">" its a rule
    # an odd otherwise
    if { [string first > $::fact 0] eq -1 } {
        set chan [open $::oddFile  w+]
        puts $chan $::fact
    } else {
        set chan [open $::ruleFile  w+]
        puts $chan $::fact
    }
  
    close $chan
}

proc Read {} {
    set chan [open $::ruleFile  r+]
    set content [read $chan]
    close $chan
    $::ruleInput insert end $content\n

    set chan [open $::oddFile  r+]
    set content [read $chan]
    close $chan
    $::oddInput insert end $content\n
}

# write an example file content (only in text box, 
# you have to press "Write" to save it in file
proc GenPattern {} {

 createFact [list {P 1} {Q 10} {A 4}]

}

proc createFact {indicators} {
    set facts [dict create]
    foreach obj $indicators {
        set $facts [dict set facts [lindex $obj 1] [lindex $obj 0] ]
    }
    foreach item [dict keys $facts] {
        $::output insert end [join [list $item [dict get $facts $item]] ":"]
        $::output insert end "\n"
        
    }}

proc createIndicators {} {
    # Create indicator list including its domain
    # TODO should be readable from file in future
    set effects [dict create P [list 1 2 3 4 5 6 7 8 9 10]]
    dict set effects Q [list r f a l]
    dict set effects B [list + - 0]
    dict set effects A [list r f a l]

    foreach item [dict keys $effects] {
        set domain [dict get $effects $item ]  
        set line [join [list $item $domain] " : "]
        $::IList insert end $line
    }
}

createIndicators