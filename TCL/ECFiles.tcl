
package require fileutil

# where I am?
set currentFile  [file normalize [info script]]
set cd [file dirname $currentFile]
# source [file join $cd facts.tcl]
set filename [file join  $cd testfile.txt]

# GUI Helper
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


###### create GUI

wm title . ECFiletester
wm minsize . 800 400 


frame .left -borderwidth 10 
frame .right -borderwidth 10
pack .left -side left -fill x -fill y
pack .right -side left -fill x

# left Panel
frame .left.cmd -borderwidth 10 
pack .left.cmd -side top -fill x

button .left.cmd.read -text Read -command Read
button .left.cmd.write -text Write -command Write
button .left.cmd.generate -text Generate -command GenPattern
button .left.cmd.clear -text Clear -command ClearFact
pack .left.cmd.read -side left
pack .left.cmd.write -side left
pack .left.cmd.generate -side left
pack .left.cmd.clear -sid left

frame .left.setup -borderwidth 10 
pack .left.setup -side top -fill x

label .left.setup.l -text File: -padx 5 -pady 5 -anchor w 
entry .left.setup.file -width 50 -textvariable filename
pack .left.setup.l -side top -fill x
pack .left.setup.file -side top

label .left.setup.lIndi -text Indicators -padx 5 -pady 5 -anchor w 
set IList [ScrolledListbox .left.setup.indicators SelectIndicator -height 5 -selectmode single]
pack .left.setup.lIndi -side top -fill x
pack .left.setup.indicators -side top -fill x


label .left.setup.lEffects -text Domain -padx 5 -pady 5 -anchor w
set EList [ScrolledListbox .left.setup.effects SelectEffect -height 5 -selectmode single] 
pack .left.setup.lEffects -side top -fill x
pack .left.setup.effects -side top -fill x

label .left.setup.lFact -text Fact -padx 5 -pady 5 -anchor w
set aFact [entry .left.setup.fact -width 50 -textvariable fact]
pack .left.setup.lFact -side top -fill x
pack .left.setup.fact -side top -fill x

# right side of GUI
frame .right.t1 -borderwidth 10
set tmp [text .right.t1.tmp -width 40 -height 8 -pady 10 -padx 10]
pack .right.t1.tmp -side left -fill x -expand true
pack .right.t1 -side top -fill x -expand true

label .right.l2 -text Output: -padx 10
pack .right.l2 -side top

## right panel
frame .right.t2 -borderwidth 10
set log [text .right.t2.log -width 40 -height 8 -pady 10 -padx 10]
pack .right.t2.log -side left -fill x -expand true
pack .right.t2 -side top -fill x -expand true

proc SelectIndicator {w y} {
    $w select set anchor [$w nearest $y]
    set id [$w get [$w curselect]]
    # take only the indicator part
    set indicator [string range $id 0 1 ]
    set effect [string range $id 4 end]
    if {$indicator ne " "} { $::aFact insert end [string trim $indicator]}
   
    FillEffects $effect
}

proc SelectEffect {w y} {
  $w select set anchor [$w nearest $y]
  set effect [$w get [$w curselect]]
  # combine indicator with effect
  set indicator [lindex $::fact end]
  set index  [expr { [$::aFact index end] -1}]
  $::aFact delete $index
  $::aFact insert end [join [list $effect $indicator] ""]
}

proc FillEffects {effectString} {

    set effectList [split $effectString " "]
    foreach item $effectList {
        $::EList insert end $item
    }

}

proc ClearFact {} {
    $::aFact delete 0 end
}

proc Write {} {
    set chan [open $::filename  w+]
    puts $chan [$::tmp get 1.0 end]
    close $chan
}

proc Read {} {
    set chan [open $::filename  r+]
    set content [read $chan]
    close $chan
    $::log insert end $content\n
}

proc GenPattern {} {

 createFact [list {P 1} {Q 10} {A 4}]

}

proc createFact {indicators} {
    set facts [dict create]
    foreach obj $indicators {
        set $facts [dict set facts [lindex $obj 1] [lindex $obj 0] ]
    }
    foreach item [dict keys $facts] {
        $::log insert end [join [list $item [dict get $facts $item]] ":"]
        $::log insert end "\n"
        
    }}

proc createIndicators {} {
    # set indicators [list P Q B A]
    set effects [dict create P [list 1 2 3 4 5 6 7 8 9 10]]
    dict set effects Q [list r f a l]
    dict set effects B [list + - 0]
    dict set effects A [list r f a l]

    #foreach item $indicators {
    #    $::IList insert end $item
    #}

    foreach item [dict keys $effects] {
        set domain [dict get $effects $item ]  
        set line [join [list $item $domain] " : "]
        $::IList insert end $line
    }
}

createIndicators