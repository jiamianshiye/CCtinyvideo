

# CCtinyvideo
# CCtinyvideo

obj file path: pro/obj/$(MODULE)/*.o

lib file path: pro/lib/$(MODULE)/*.a

third lib file path:pro/thirdpart/lib

value name define:

OBJ : 

OBJS : all objs files need to linked.

OBJ_PATH : obj file path

LIB_BASE_DIR : pro/lib
OBJ_BASE_DIR : pro/obj
EXE_BASE_DIR : pro/bin

   we need to mkdir in pro/ for lib obj and bin. 

SO_LIB = $(EXE_BASE_DIR)/lib$(MODULE).so
