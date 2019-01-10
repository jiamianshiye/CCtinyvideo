########################################
#### foot mk file make base compile rules.

OBJS = $(subst .c,.o, $(FILES))

OBJ_DIR = $(OBJ_BASE_DIR)/$(MODULE)
LIB_DIR = $(LIB_BASE_DIR)/$(MODULE)

vpath %.o $(OBJ_DIR)

LIB = $(MODULE).a
EXE = $(EXE_BASE_DIR)/$(MODULE).out
SO_LIB = $(EXE_BASE_DIR)/lib$(MODULE).so

%.o:%.c
	@echo \#$(MODULE) : Compiling $<, \n    obj dir[$(OBJ_DIR)] 
	@echo \#$(MODULE) : Compiling $<, \n INCLUDE[$(INCLUDE)]
	$(CC) $(CC_OPTS) $(INCLUDE) -o$(OBJ_DIR)/$@ $<
 
lib : $(LIB_DIR)/$(LIB)

$(LIB_DIR)/$(LIB) : $(OBJS)
	@echo \# [$(MODULE)] : Creating archive $(LIB), libdir[$(LIB_DIR)]
	$(AR) $(AR_OPTS) $(LIB_DIR)/$(LIB) $(OBJ_DIR)/*.o

obj: $(OBJS)



clean:
	@echo \# $(MODULE) : Deleting temp files
	-rm -f $(LIB_DIR)/$(LIB)
	-rm -f $(OBJ_DIR)/*.*

depend:
	-mkdir -p $(LIB_DIR)
	-mkdir -p $(OBJ_DIR)
	-mkdir -p $(EXE_BASE_DIR)
	@echo \# $(MODULE) : Building dependancies
	$(CC) $(INCLUDE) $(FILES) -M > MAKE.DEPEND


so:
	@echo \# $(MODULE) : Linking to .so
	$(LD) -shared -o $(OBJ_DIR)/*.o $(LIBS)
	

exe:
	@echo \# $(MODULE) : Linking execute file....
	$(LD) $(LD_OPTS) -o $(EXE) $(LIBS)
	@echo \# Final executable $(EXE)

-include MAKE.DEPEND
