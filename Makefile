include mkrules/rules.mk
include mkrules/header.mk

APP:=CCtv
FILES_C+=$(wildcard *.c)
OBJS+=$(subst .c,.o, $(FILES_C))

CC_OPTS=-g -Wall
LD_FLAGS= -lpthread

MODULES=fbshow video
FILES=./app/main.c
DIRS=\
     fbshow\
     video

$(APP):$(OBJS)
	gcc $^ -o $@ $(CC_OPTS)  $(LD_FLAGS)

clean:
	-rm *.o -r
	-rm $(APP)
	-rm *.d -r
	-rm -r $(LIBS)


.PHONY: clean
all:
	@echo "Get all resoureces include[$(INCLUDE)]....\n"
	@for dir in $(DIRS);\
	do\
		$(MAKE) -fMAKE.mk -C./app/$$dir all MODULE=$$dir;\
	done
	@$(CC) $(FILES) $(LIBS) $(INCLUDE) -o $(APP)


%.d:%.c
	set -e; rm -f $@; \
	$(CC) -MM $(CPPFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	-rm -f $@.$$$$
