demo:
	@echo \# Got include dir [$(INCLUDE)]  
	mkdir -p $(OBJ_BASE_DIR)/$(MODULE)
	mkdir -p $(LIB_BASE_DIR)/$(MODULE)
	$(MAKE) -fMAKE.mk libs
	#$(MAKE) -fMAKE.mk obj
apps:
	$(MAKE) -f Makefile -C./src $(TARGET)
libs:
	#$@echo \# Got  module[$(MODULE)]...target[$(TARGET)]
	$(MAKE) -f Makefile -C./src/  $(TARGET) 
obj:
	$(MAKE) -f Makefile -C./src $(TARGET)
	
clean:
	$(MAKE) -fMAKE.mk libs TARGET=clean

all:demo
