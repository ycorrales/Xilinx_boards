
CERNBOX_DIR := /home/maps/cernbox/Course_and_Tutorial/FPGAExamples/VHDL/Zedboard
VIV_DIR := $(CURDIR)
VITIS_DIR := $(CURDIR)/vitis

clean_hog:
	@rm -rf Hog/Tcl/NA

clean_viv: clean_hog
	@cd $(VIV_DIR) && rm -rf *.jou *.log Projects SimulationLib .Xil nlviewcommon.logfile 

clean: clean_viv
	@cd $(VIV_DIR) && rm -rf bin/ 

# sync_viv_bin:
# 	@rsync -avu --delete $(VIV_DIR)/bin $(CERNBOX_DIR)/vivado/.
#
# sync_vitis_bin:
# 	@rsync -avu --delete $(VITIS_DIR)/bin $(CERNBOX_DIR)/vitis/.
