demo:
	@echo \# Got obj base dir OBJ[$(OBJ_BASE_DIR)] MODULE[$(MODULE)] 
	mkdir -p $(OBJ_BASE_DIR)/$(MODULE)
	mkdir -p $(LIB_BASE_DIR)/$(MODULE)
	$(MAKE) -fMAKE.mk libs
apps:
	$(MAKE) -f Makefile -C./src $(TARGET)
	@echo \# Got module [$(MODULE)]
libs:
	mkdir $()/lib/ -p
	$(MAKE) -f Makefile -C./src/  $(TARGET) 
	@echo \# Got  module[$(MODULE)]...target[$(TARGET)]
	@echo \# Got  include[$(INCLUDE)] 

clean:
	$(MAKE) -fMAKE.mk libs TARGET=clean

all:demo
