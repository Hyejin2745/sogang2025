#-------------------------------------------------------------------------------
# Copyright (c) 2025 by Ando Ki.
# All rights are reserved by Ando Ki.
#-------------------------------------------------------------------------------
SHELL    = /bin/bash
MAKEFILE = Makefile
#-------------------------------------------------------------------------------
# COSIM_BFM  TRX_AXI BFM_AXI
#RUN_TYPE   ?= COSIM_BFM
RUN_TYPE   ?= TRX_AXI
#-------------------------------------------------------------------------------
ifeq ($(MAKECMDGOALS),$(findstring $(MAKECMDGOALS), sw hw run run_all run.all cosim run_dpi dpi_run))
    ifeq ($(RUN_TYPE),COSIM_BFM)
        ifndef XILINX_VIVADO
           $(error "XILINX_VIVADO" environment variable not defined.)
        endif
        ifndef COSIM_HOME
           $(error "COSIM_HOME" environment variable not defined.)
        endif
        PLATFORM  := $(shell uname -s | tr '[:upper:]' '[:lower:]')
        MACHINE   := $(shell uname -m)
        export DIR_COSIM_INC  := $(COSIM_HOME)/include
        export SIMULATOR      ?= xsim
        export DIR_COSIM_LIB  := $(COSIM_HOME)/lib/$(SIMULATOR)/$(PLATFORM)_$(MACHINE)
        ifeq ("$(wildcard $(DIR_COSIM_INC))", "")
             $(error $(DIR_COSIM_INC) not found.)
        endif
        ifeq ("$(wildcard $(DIR_COSIM_LIB))", "")
             $(error $(DIR_COSIM_LIB) not found.)
        endif
    else ifeq ($(RUN_TYPE),TRX_AXI)
        ifndef CONFMC_HOME
           $(error "CONFMC_HOME" environment variable not defined.)
        endif
        PLATFORM  := $(shell uname -s | tr '[:upper:]' '[:lower:]')
        MACHINE   := $(shell uname -m)
        export DIR_CONFMC_INC  := $(CONFMC_HOME)/include
        export DIR_CONFMC_LIB  := $(CONFMC_HOME)/lib/$(PLATFORM)_$(MACHINE)
        export DIR_CONFMC_BFM  := $(CONFMC_HOME)/hwlib/trx_axi/api/c
    endif
endif
export DIR_HW := ../../hw

#-------------------------------------------------------------------------------
LIB_BFM     = cosim_bfm
LIB_CONFMC  = conapi
#-------------------------------------------------------------------------------
TARGET   = test
CPP_SRCS = main.cpp
C_SRCS   = etc.c mem_test.c
OBJS     = $(CPP_SRCS:.cpp=.o) $(C_SRCS:.c=.o)
#-------------------------------------------------------------------------------
ifeq ($(RUN_TYPE),COSIM_BFM)
vpath %.h    src:$(DIR_COSIM_INC)
vpath %.c    src:$(DIR_COSIM_INC)
vpath %.hpp  src:$(DIR_COSIM_INC)
else ifeq ($(RUN_TYPE),TRX_AXI)
vpath %.h    src:$(DIR_CONFMC_BFM)
vpath %.c    src:$(DIR_CONFMC_BFM)
vpath %.hpp  src
endif
vpath %.cpp  src
#-------------------------------------------------------------------------------
CPP        = g++
CC         = gcc
CC_VERSION = $(shell gcc -dumpversion)
#-------------------------------------------------------------------------------
PLATFORM  = $(shell uname -s | tr '[:upper:]' '[:lower:]')
MACH      = $(shell uname -m)
C_USER_DEFS   = -D$(RUN_TYPE)
C_USER_DEFS  += -DRIGOR
ifeq ($(RUN_TYPE),COSIM_BFM)
C_USER_DEFS  += -DDEBUG
endif
C_USER_FLAGS  =
ifeq ($(PLATFORM),cygwin)
	C_USER_DEFS  += -DWIN32 -mno-cygwin
	C_USER_FLAGS +=
else ifeq ($(PLATFORM),mingw)
	C_USER_DEFS  += -DWIN32
	C_USER_FLAGS +=
else ifeq ($(PLATFORM),linux)
	C_USER_DEFS  +=
        ifeq ($(MACH),x86_64)
	    C_USER_FLAGS += -m64 -fPIC
        else
	    C_USER_FLAGS += -m32 -fPIC
        endif
else
	C_USER_DEFS  +=
	C_USER_FLAGS +=
endif
C_CFLAGS = -g -O0 -Werror -std=c++11 $(C_USER_DEFS) $(C_USER_FLAGS)
C_LFLAGS = -O0 $(C_USER_DEFS) $(C_USER_FLAGS)

CFLAGS   = $(C_CFLAGS) -Isrc
LDFLAGS  = $(C_LFLAGS)
LDLIBS   =

ifeq ($(RUN_TYPE),COSIM_BFM)
CFLAGS   += -I$(DIR_COSIM_INC)
LDLIBS   += -Wl,-Bstatic -L$(DIR_COSIM_LIB) -l$(LIB_BFM) -Wl,-Bdynamic
else ifeq ($(RUN_TYPE),TRX_AXI)
C_SRCS   += trx_axi_api.c
CFLAGS   += -I$(DIR_CONFMC_INC) -I$(DIR_CONFMC_BFM) `pkg-config --cflags libusb-1.0`
LDLIBS   += -L$(DIR_CONFMC_LIB) -l$(LIB_CONFMC) -Wl,-Bdynamic `pkg-config --libs libusb-1.0`
endif

#------------------------------------------------------------------------
OBJECTDIR := obj
DUMMY     := $(shell [ -d $(OBJECTDIR) ] || mkdir $(OBJECTDIR) )
$(OBJECTDIR)/%.o: %.c
	$(CPP) -c $(CFLAGS) $< -o $@ 2>&1 | tee -a compile.log
$(OBJECTDIR)/%.o: %.cpp
	$(CPP) -c $(CFLAGS) $< -o $@ 2>&1 | tee -a compile.log
#------------------------------------------------------------------------
.PHONY: all
all:

sw: $(TARGET)

$(TARGET): $(addprefix $(OBJECTDIR)/,$(OBJS))
	$(CPP) -o $(TARGET) $(LDFLAGS) $(addprefix $(OBJECTDIR)/,$(OBJS))\
		$(LDLIBS)

#-------------------------------------------------------------------------------
run:
	/bin/rm -f run.log
	./$(TARGET) --cid=0 --rigor=1 --verbose=0 --memtest=1\
		2>&1 | tee run.log

hw:
	make -C $(DIR_HW)/sim.fpga_zed/$(SIMULATOR) COSIM_BFM=1 elab

cosim run_dpi dpi_run:
	@if [ ! -z "`(ipcs -q | grep "^0x" | cut -d' ' -f 2) 2>/dev/null`" ]; then\
		echo "IPC message queue is still working. Use \"$$ ipcs -q\" and \"$$ ipcrm -q mid.\"";\
	fi
	@if [ -z "`which xelab 2>/dev/null`" ]; then\
		echo "xelab not found."; exit 1;\
	fi
	if [ ! -f $(TARGET) ]; then make; fi
	gnome-terminal --window -- bash -c "cd $(DIR_HW)/sim.fpga_zed/$(SIMULATOR);\
			make sim; bash"
	make run 2>&1 | tee run.log | sed '/ERROR/q'

#------------------------------------------------------------------------
program:
	bash ./program_fpga.sh $(DIR_HW)/impl/zed.confmc/fpga.bit

#------------------------------------------------------------------------
.PHONY: clean
clean:
	rm -rf $(OBJECTDIR)
	rm -f  compile.log run.log
	rm -f  *.o
	rm -f *stackdump
	rm -f *.exe.core
	rm -f compile.log
	rm -f lock_file*.txt
	rm -f run_confmc.log  run_cosim.log

.PHONY: cleanup clobber
cleanup clobber: clean
	rm -f $(TARGET) $(TARGET).exe
#	rm -f src/lenet5_params.h

.PHONY: cleanupall distclean
cleanupall distclean: cleanup

#----------------------------------------------------------------------------
# Revision history
#
# 2021.07.01: Started by Ando Ki (andoki@gmail.com)
#----------------------------------------------------------------------------
