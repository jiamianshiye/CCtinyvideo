demo:
	@echo \# Got obj base dir OBJ[$(OBJ_BASE_DIR)] MODULE[$(MODULE)] 
	mkdir -p $(OBJ_BASE_DIR)/$(MODULE)
	mkdir -p $(LIB_BASE_DIR)/$(MODULE)
	$(MAKE) -fMAKE.mk libs
apps:
	$(MAKE) -f Makefile -C./src $(TARGET)
	@echo \# Got module [$(MODULE)]
libs:
	$(MAKE) -f Makefile -C./src/  $(TARGET) 
	##@echo "LIBS+=$(LIB_BASE_DIR)/$(MODULE)/$(MODULE).a" >> $(PRO_ROOT_PATH)/mkrules/dyna.mk
	@echo \# Got  module[$(MODULE)]...target[$(TARGET)]
	@echo \# Got  include[$(INCLUDE)] 

clean:
	#@echo "" > $(PRO_ROOT_PATH)/mkrules/dyna.mk
	#$(MAKE) -fMAKE.mk TARGET=clean

all:demo

