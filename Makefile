
##################################################################################

CC 						:= /usr/bin/cc
CXX 					:= /usr/bin/c++
CFLAGS 					+= -save-temps=obj
CFLAGS 					+= $(patsubst %,-I%,$(COMM_INC_PATH))
CFLAGS  				+= -DDEBUG -g -O -fPIC 
LDFLAGS 				+= -L./libs -Wl,-Bstatic -lusb -Wl,-Bdynamic -lpthread
O 						:= out
O_BINARY 				:= $(O)/binary
O_OBJ 					:= $(O)/objs

##################################################################################

USBNET_SO_C_FILES 		+= ./src/usbnet.c ./src/proto/protocol.c 
USBNET_SO_C_FILES 		+= ./src/proto/protobase.c ./src/shared/common.c

USBNET_C_FILES 			+= 
USBNET_C_FILES 			+= $(wildcard ./src/client/*.c)
USBNET_C_FILES 			+= $(wildcard ./src/proto/*.c)
USBNET_C_FILES 			+= $(wildcard ./src/shared/*.c)
USBNET_CPP_FILES 		+= $(wildcard ./src/client/*.cpp)
USBNET_CPP_FILES 		+= $(wildcard ./src/proto/*.cpp)
USBNET_CPP_FILES 		+= $(wildcard ./src/shared/*.cpp)

USBEXPORTD_C_FILES 		+= 
USBEXPORTD_C_FILES 		+= $(wildcard ./src/server/*.c)
USBEXPORTD_C_FILES 		+= $(wildcard ./src/proto/*.c)
USBEXPORTD_C_FILES 		+= $(wildcard ./src/shared/*.c)
USBEXPORTD_CPP_FILES 	+= $(wildcard ./src/server/*.cpp)
USBEXPORTD_CPP_FILES 	+= $(wildcard ./src/proto/*.cpp)
USBEXPORTD_CPP_FILES 	+= $(wildcard ./src/shared/*.cpp)

COMM_INC_PATH 			+= ./src/
COMM_INC_PATH 			+= ./src/client/
COMM_INC_PATH 			+= ./src/proto/
COMM_INC_PATH 			+= ./src/server/
COMM_INC_PATH 			+= ./src/shared/

USBNET_SO_OBJ_FILES		+= $(patsubst %.c, $(O_OBJ)/%.o, $(USBNET_SO_C_FILES))
USBNET_SO_DEPS			:= $(foreach dep,$(USBNET_SO_OBJ_FILES),$(dir $(dep)).$(notdir $(dep)).d)

USBNET_OBJ_FILES		+= $(patsubst %.c, $(O_OBJ)/%.o, $(USBNET_C_FILES))
USBNET_OBJ_FILES		+= $(patsubst %.cpp, $(O_OBJ)/%.o, $(USBNET_CPP_FILES))
USBNET_DEPS				:= $(foreach dep,$(USBNET_OBJ_FILES),$(dir $(dep)).$(notdir $(dep)).d)

USBEXPORTD_OBJ_FILES	+= $(patsubst %.c, $(O_OBJ)/%.o, $(USBEXPORTD_C_FILES))
USBEXPORTD_OBJ_FILES	+= $(patsubst %.cpp, $(O_OBJ)/%.o, $(USBEXPORTD_CPP_FILES))
USBEXPORTD_DEPS			:= $(foreach dep,$(USBNET_OBJ_FILES),$(dir $(dep)).$(notdir $(dep)).d)

##################################################################################

ifeq ($(V),1)
Q		= 
QCC 	= $(CC)
QCXX 	= $(CXX)
else
Q		= @
QCC 	= @echo "CC   $(notdir $@)" && $(CC)
QCXX 	= @echo "CXX  $(notdir $@)" && $(CXX)
endif

##################################################################################

.PHONY: all clean info .related_path libusbnet.so usbnet usbexportd

all: .related_path libusbnet.so usbnet usbexportd
	@echo "Build all targets ... done"
	@echo ""

.related_path:
	@test -e $(O) || mkdir -p $(O)
	@test -e $(O_BINARY) || mkdir -p $(O_BINARY)
	@test -e $(O_OBJ) || mkdir -p $(O_OBJ)

$(O_OBJ)/%.o : %.c
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	$(QCC) -c $(CFLAGS) -MD -MF "$(dir $@).$(notdir $@).d" -o "$@" "$<"

$(O_OBJ)/%.o : %.cpp
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	$(QCXX) -c $(CFLAGS) -MD -MF "$(dir $@).$(notdir $@).d" -o "$@" "$<"

libusbnet.so: $(USBNET_SO_OBJ_FILES)
	@echo "Linking $@ ..."
	$(QCC) -fPIC -g -shared -Wl,-soname,$@ -o $(O_BINARY)/$@ $^ -lusb
	@echo "Linking $@ ... done"
	@echo ""

usbnet: $(USBNET_OBJ_FILES)
	@echo "Linking $@ ..."
	$(QCXX) -o $(O_BINARY)/$@ $^ $(LDFLAGS) 
	@echo "Linking $@ ... done"
	@echo ""
	
usbexportd: $(USBEXPORTD_OBJ_FILES)
	@echo "Linking $@ ..."
	$(QCXX) -o $(O_BINARY)/$@ $^ $(LDFLAGS) 
	@echo "Linking $@ ... done"
	@echo ""

clean:
	@rm -rf $(O)
	@echo "Clean build done"

info:
	@echo USBNET_OBJ_FILES=$(USBNET_OBJ_FILES)
	@echo USBEXPORTD_OBJ_FILES=$(USBEXPORTD_OBJ_FILES)
