demo:
	@echo \# Got obj base dir 
	mkdir -p $(OBJ)/$(MODULE)
	$(MAKE) -fMAKE.mk libs
apps:
	$(MAKE) -f Makefile -C./src $(TARGET)
	@echo \# Got module [$(MODULE)]
libs:
	mkdir $(DO_MAKE_BASE)/lib/ -p
	$(MAKE) -f Makefile -C./src/  $(TARGET) 
	@echo \# Got  module[$(MODULE)]...target[$(TARGET)]
	
clean:
	$(MAKE) -fMAKE.mk libs TARGET=clean

all:demo
