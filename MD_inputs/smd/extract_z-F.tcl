set file [open cbc11_C11.out r]
set output [open cbc11_C11-F_100.dat w]

### Gather input from user.
#puts "Enter a value for n_x:"
#set nx [gets stdin]
#puts "Enter a value for n_y:"
#set ny [gets stdin]
#puts "Enter a value for n_z:"
#set nz [gets stdin]

##for cbc pulled from benzene ring in 15 A water box
set nx 0.081
set ny 0.069
set nz 0.99

### Loop over all lines of the log file
set file [open cbc11_C11.out r]
while { [gets $file line] != -1 } {

### Determine if a line contains SMD output. If so, write the
### timestep followed by f(dot)n to the output file
  if {[lindex $line 0] == "SMD"} {
      puts $output "[expr $nx*[lindex $line 2] + $ny*[lindex $line 3] + $nz*[lindex $line 4]] [expr $nx*[lindex $line 5] + $ny*[lindex $line 6] + $nz*[lindex $line 7]]"
    }
  }

### Close the log file and the output .dat file
close $file
close $output
