#write each frame in a pdb file

mol new input.psf
mol addfile input.dcd

pbc wrap -all -compound res -center com -centersel protein

for {set i 0} {$i < 3001} {incr i} {
         [atomselect top all frame $i] writepdb "cbc_frame${i}.pdb"
 }
