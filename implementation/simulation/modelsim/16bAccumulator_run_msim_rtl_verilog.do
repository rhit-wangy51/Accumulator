transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/reg16.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/alu16.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/mux1b16.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/se16.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/ze16.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/control.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/mux2b16.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/accumulatorFull.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/alu_sub.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/mux3b16.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/PC.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/shift_left.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/wires_subsystem.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/mux1b1.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/AccMemory.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/ze5.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangy51/Documents/Rose-Hulman/2022\ Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation {C:/Users/wangy51/Documents/Rose-Hulman/2022 Spring/CSSE232/Project/rhit-csse232-2122c-project-yellow-2122c-03/implementation/memory.v}

