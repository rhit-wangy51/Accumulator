transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/CSSE232/rhit-csse232-2122c-project-yellow-2122c-03/implementation {D:/CSSE232/rhit-csse232-2122c-project-yellow-2122c-03/implementation/mem16.v}

