#############################################
## header mk file defines base path rules.
CC = gcc
AR = ar
LD = gcc

LIB_BASE_DIR = $(PRO_ROOT_PATH)/lib
OBJ_BASE_DIR = $(PRO_ROOT_PATH)/obj
EXE_BASE_DIR = $(PRO_ROOT_PATH)/bin

MOD_BASE_DIR = $(PRO_ROOT_PATH)/app

CC_OPTS = -c -g -Wall

AR_OPTS = -rc
FILES = $(subst ./, , $(foreach dir,.,$(wildcard $(dir)/*.c)) )

export LIB_BASE_DIR
export OBJ_BASE_DIR
export EXE_BASE_DIR
export MOD_BASE_DIR
export PRO_LIBS
