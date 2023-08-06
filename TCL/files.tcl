package require fileutil

set currentFile  [file normalize [info script]]
set cd [file dirname $currentFile]
set filename [join [list $cd "/testfile.txt"] ""]

wm title . ECFiletester
wm maxsize . 1600 1200 
frame .top -borderwidth 10
pack .top -side top -fill x
button .top.read -text Read -command Read
pack .top.read -side right
button .top.write -text Write -command Write
pack .top.write -side right

label .top.l -text File: -padx 5
entry .top.cmd -width 12 -textvariable filename
pack .top.l -side left
pack .top.cmd -side left -fill x -expand true

label .l -text Input: -padx 5
pack .l -side top

frame .t1 -borderwidth 10
set tmp [text .t1.tmp -width 80 -height 8 -pady 10 -padx 10]
pack .t1.tmp -side left -fill x -expand true
pack .t1 -side top -fill x -expand true

label .l2 -text Output: -padx 10
pack .l2 -side top

frame .t2 -borderwidth 10
set log [text .t2.log -width 80 -height 8 -pady 10 -padx 10]
pack .t2.log -side left -fill x -expand true
pack .t2 -side top -fill x -expand true


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
