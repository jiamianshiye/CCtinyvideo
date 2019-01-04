demo:
	@echo \# Got obj base dir OBJ[$(OBJ_BASE_DIR)] MODULE[$(MODULE)] 
	mkdir -p $(OBJ_BASE_DIR)/$(MODULE)
	$(MAKE) -fMAKE.mk app TARGET=exe
apps:
	$(MAKE) -C./src $(TARGET)
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
