set filelist [glob *.pdb]
set sortedfilelist [lsort -dictionary $filelist]
foreach file $sortedfilelist {
set filewhext [file rootname $file]
mol new $file

set strmolid [molinfo top]
set res_list [[atomselect top "segname PROA and name CA"] get index]
set n [llength $res_list]
set output [open "${filewhext}_hbonds.dat" w]
# hbonds calculation loop
for {set i 1} {$i <= $n} {incr i} {
    set sel1 [atomselect top "protein and resid $i"]
    set sel2 [atomselect top "segname HETA"]
    set hydbond1 [llength [lindex [measure hbonds 3.0 20 $sel1 $sel2] 0]]
    set hydbond2 [llength [lindex [measure hbonds 3.0 20 $sel2 $sel1] 0]]
    set hydbondtot [expr {$hydbond1 + $hydbond2}]
    puts $output "$i\t$hydbondtot"

}

close $output
mol delete all
}