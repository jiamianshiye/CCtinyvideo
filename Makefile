include mkrules/rules.mk
include mkrules/header.mk

APP:=CCtv
FILES_C+=$(wildcard *.c)
OBJS+=$(subst .c,.o, $(FILES_C))
OBJ_PATH=$(OBJ_BASE_DIR)
MODULES=fbshow video
FILES=./app/main.c
DIRS=\
     fbshow\
     video

INCLUDE+=-I$(MOD_BASE_DIR)/fbshow/inc\
	-I$(MOD_BASE_DIR)/video/inc		

all:
	@echo "Get all resoureces include[$(INCLUDE)].dirs[$(DIRS)].\n"
	@echo "List all lib files [$(PRO_LIBS)]...."
	@for dir in $(MODULES);\
	do\
		$(MAKE) -fMAKE.mk -C./app/$$dir all $(INCLUDE)  MODULE=$$dir;\
	done
	@echo "List all lib files [$(PRO_LIBS)]...."
	@$(CC) $(FILES) $(PRO_LIBS) $(INCLUDE) -o $(APP)

#$(APP):$(OBJS)
#	gcc $^ -o $@ $(CC_OPTS)  $(LD_FLAGS)

clean:
	-rm -rf $(APP)
	-rm -rf $(LIBS)
	-rm -rf $(OBJ_PATH)
	-rm -rf $(LIB_BASE_DIR)

.PHONY: clean

%.d:%.c
	set -e; rm -f $@; \
	$(CC) -MM $(CPPFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	-rm -f $@.$$$$

export INCLUDE
