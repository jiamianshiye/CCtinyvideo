include mkrules/rules.mk
include mkrules/header.mk
include mkrules/dyna.mk

APP:=CCtv
FILES_C+=$(wildcard *.c)
OBJS+=$(subst .c,.o, $(FILES_C))
OBJ_PATH=$(OBJ_BASE_DIR)

MODULES=fbshow video
FILES=./app/main.c

INCLUDE+=-I$(MOD_BASE_DIR)/fbshow/inc\
	-I$(MOD_BASE_DIR)/video/inc		

LIBS+= $(LIB_BASE_DIR)/fbshow/fbshow.a\
       $(LIB_BASE_DIR)/video/video.a

all:
	@echo "Get all resoureces include[$(INCLUDE)]......"
	@echo "List all lib files [$(LIBS)]...."
	#@echo "" > $(PRO_ROOT_PATH)/mkrules/dyna.mk
	@for dir in $(MODULES);\
	do\
		$(MAKE) -fMAKE.mk -C./app/$$dir all $(INCLUDE)  MODULE=$$dir;\
	done
	##@echo "List all lib files [$(LIBS)]...."
	@$(CC) $(FILES) $(LIBS) $(INCLUDE) -o $(APP)


clean:
	-rm -rf $(APP)
	-rm -rf $(LIBS)
	-rm -rf $(OBJ_PATH)
	-rm -rf $(LIB_BASE_DIR)
	##@echo "" > $(PRO_ROOT_PATH)/mkrules/dyna.mk

.PHONY: clean

%.d:%.c
	set -e; rm -f $@; \
	$(CC) -MM $(CPPFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	-rm -f $@.$$$$

export INCLUDE
export LIBS
