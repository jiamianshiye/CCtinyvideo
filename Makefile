EXEC:=v4l2
all:	$(EXEC)

v4l2:	live.o video_capture.o	draw_framebuffer.o 
	gcc $^ -o $@

clean:
	rm *.o -r
	rm $(EXEC)
	rm *.d -r

.PHONY: clean

sources = *.c 

include $(sources:.c=.d)

%.d:%.c
	set -e; rm -f $@; \
	$(CC) -MM $(CPPFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$
