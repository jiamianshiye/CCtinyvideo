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

INCLUDE+=
$(APP):$(OBJS)
	gcc $^ -o $@ $(CC_OPTS)  $(LD_FLAGS)

all:
	@echo "Get all resoureces include[$(INCLUDE)].dirs[$(DIRS)].\n"
	@for dir in $(MODULES);\
	do\
		$(MAKE) -fMAKE.mk -C./app/$$dir all MODULE=$$dir;\
	done
	$(MAKE)  -fMAKE.mk -C./app/ all
	@$(CC) $(FILES) $(LIBS) $(INCLUDE) -o $(APP)

clean:
	-rm $(APP)
	-rm -r $(LIBS)
	-rm -r $(OBJ_PATH)


.PHONY: clean

%.d:%.c
	set -e; rm -f $@; \
	$(CC) -MM $(CPPFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	-rm -f $@.$$$$
