transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/paula/semestre/Digital/lab00-psmedinadi22/src/solucion {/home/paula/semestre/Digital/lab00-psmedinadi22/src/solucion/sum1bcc.v}
vlog -vlog01compat -work work +incdir+/home/paula/semestre/Digital/lab00-psmedinadi22/src/solucion {/home/paula/semestre/Digital/lab00-psmedinadi22/src/solucion/sum4b.v}

vlog -vlog01compat -work work +incdir+/home/paula/semestre/Digital/lab00-psmedinadi22/lab01/../src/solucion {/home/paula/semestre/Digital/lab00-psmedinadi22/lab01/../src/solucion/sum4b_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  TB

add wave *
view structure
view signals
run -all
