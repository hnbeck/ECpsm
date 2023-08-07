
package require fileutil

# where I am?
set currentFile  [file normalize [info script]]
set cd [file dirname $currentFile]
# source [file join $cd facts.tcl]
set filename [file join  $cd testfile.txt]

# GUI Helper
proc ScrolledListbox {parent args} {
    frame $parent
    eval {listbox $parent.list \
            -yscrollcommand [list $parent.sy set]  } $args
    scrollbar $parent.sy -orient vertical -command [list $parent.list yview]
    pack $parent.list -side left -fill x -expand true
    pack $parent.sy -side right -fill y
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
pack .left.cmd.read -side left
pack .left.cmd.write -side left
pack .left.cmd.generate -side left

frame .left.setup -borderwidth 10 
pack .left.setup -side top -fill x

label .left.setup.l -text File: -padx 5 -pady 5 -anchor w 
entry .left.setup.file -width 50 -textvariable filename
pack .left.setup.l -side top -fill x
pack .left.setup.file -side top

label .left.setup.lIndi -text Indicators -padx 5 -pady 5 -anchor w 
ScrolledListbox .left.setup.indicators -height 5 
pack .left.setup.lIndi -side top -fill x
pack .left.setup.indicators -side top -fill x

label .left.setup.lEffects -text Effects -padx 5 -pady 5 -anchor w 
ScrolledListbox .left.setup.effects -height 5 
pack .left.setup.lEffects -side top -fill x
pack .left.setup.effects -side top -fill x


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
