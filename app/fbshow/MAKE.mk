demo:
	@echo \# Got obj base dir OBJ[$(OBJ_BASE_DIR)] MODULE[$(MODULE)] 
	@echo \# Got include dir [$(INCLUDE)]  
	mkdir -p $(OBJ_BASE_DIR)/$(MODULE)
	mkdir -p $(LIB_BASE_DIR)/$(MODULE)
	$(MAKE) -fMAKE.mk libs
	#$(MAKE) -fMAKE.mk obj
apps:
	$(MAKE) -f Makefile -C./src $(TARGET)
	@echo \# Got module [$(MODULE)]
libs:
	@echo \# Got  module[$(MODULE)]...target[$(TARGET)]
	$(MAKE) -f Makefile -C./src/  $(TARGET) 
	@echo \# Got  include[$(INCLUDE)]
obj:
	$(MAKE) -f Makefile -C./src $(TARGET)
	
clean:
	$(MAKE) -fMAKE.mk libs TARGET=clean

all:demo
