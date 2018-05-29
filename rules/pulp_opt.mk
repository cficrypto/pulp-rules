ifdef cluster
override CONFIG_OPT += rt/cluster-start=true
endif

ifdef fc
override CONFIG_OPT += rt/fc-start=true
endif

ifdef platform
override CONFIG_OPT += platform=$(platform)
endif

ifdef system
override CONFIG_OPT += system=$(system)
endif

ifdef io
override CONFIG_OPT += rt/iodev=$(io)
endif

ifdef no-werror
override CONFIG_OPT += rt/werror=false gvsoc/werror=false
endif

ifdef libgomp
override CONFIG_OPT += rt/openmp-rt=libgomp
endif

ifdef boot
bridge ?= debug-bridge
override CONFIG_OPT += loader/bridge=$(bridge)
override CONFIG_OPT += loader/boot/mode=$(boot)
endif

ifdef bridge-commands
override CONFIG_OPT += debug-bridge/commands=$(bridge-commands)
endif

ifdef gdb
override PULP_TEMPLATE_ARGS += gdb($(gdb))
export PULP_TEMPLATE_ARGS
endif

ifdef bridge
override PULP_TEMPLATE_ARGS += debug-bridge($(bridge))
export PULP_TEMPLATE_ARGS
endif

help_generic:
	@echo "Generic options:"
	@echo "  platform=<name>      Specify the platform on which to launch the application."
	@echo "  io=<name>            Specify the device used for debug IOs (default, uart)."
	@echo "  no-werror=1          Deactivate errors on warnings for all modules"
	@echo "  boot=<boot>          Specify the boot mode (rom, jtag, rom_spi, rom_hyper)"
	@echo "  gdb=1                Activate GDB support"
	@echo "  bridge=<mode>        Activate debug bridge support with the specified mode (jtag)"

help_opt: help_generic help_opt_vsim help_opt_vp help_opt_rt

-include $(PULP_SDK_HOME)/install/rules/pulp_opt_vsim.mk
-include $(PULP_SDK_HOME)/install/rules/pulp_opt_vp.mk
-include $(PULP_SDK_HOME)/install/rules/pulp_opt_rt.mk