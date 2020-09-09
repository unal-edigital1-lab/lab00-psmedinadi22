transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/UECCI/Downloads/lab00-psmedinadi22/src {C:/Users/UECCI/Downloads/lab00-psmedinadi22/src/sum1bcc.v}

vlog -vlog01compat -work work +incdir+C:/Users/UECCI/Downloads/lab00-psmedinadi22/quartus/../src {C:/Users/UECCI/Downloads/lab00-psmedinadi22/quartus/../src/sum1bcc_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  SUMA

add wave *
view structure
view signals
run -all
