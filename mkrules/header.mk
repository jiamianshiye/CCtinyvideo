#############################################
## header mk file defines base path rules.
CC = gcc
AR = ar
LD = gcc

LIB_BASE_DIR = $(PRO_ROOT_PATH)/lib
OBJ_BASE_DIR = $(PRO_ROOT_PATH)/obj
EXE_BASE_DIR = $(PRO_ROOT_PATH)/bin

CC_OPTS = -c -g -Wall

AR_OPTS = -rc
FILES = $(subst ./, , $(foreach dir,.,$(wildcard $(dir)/*.c)) )

LIB_DIR = $(LIB_BASE_DIR)

vpath %.a $(LIB_DIR)

