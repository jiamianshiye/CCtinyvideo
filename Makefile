CC=gcc

EXEC:=v4l2
FILES_C+=$(wildcard *.c)
OBJS+=$(subst .c,.o, $(FILES_C))

CC_OPTS=-g -Wall
LD_FLAGS= -lpthread

$(EXEC):$(OBJS)
	gcc $^ -o $@ $(CC_OPTS)  $(LD_FLAGS)

clean:
	-rm *.o -r
	-rm $(EXEC)
	-rm *.d -r

.PHONY: clean

sources = *.c 


all:clean	$(EXEC)


%.d:%.c
	set -e; rm -f $@; \
	$(CC) -MM $(CPPFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	-rm -f $@.$$$$
