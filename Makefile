# get the target for the compiler
target = $(strip $(shell $(CC) -dumpmachine))

# DOS and Windows executables should have the .exe extension.
# Other operating systems should be extension-less.

CC ?= gcc

ifeq ($(findstring mingw32,$(target)),mingw32)
EXENAME = acc.exe
else
ifeq ($(findstring djgpp,$(target)),djgpp)
EXENAME = acc.exe
else
EXENAME = acc
endif
endif

CFLAGS ?= -O2 -Wall -W
LDFLAGS ?= -s
VERNUM = 157

OBJS = \
	acc.o     \
	error.o   \
	misc.o    \
	parse.o   \
	pcode.o   \
	strlist.o \
	symbol.o  \
	token.o

SRCS = \
	acc.c		\
	error.c		\
	misc.c		\
	parse.c		\
	pcode.c		\
	strlist.c	\
	symbol.c	\
	token.c		\
	common.h	\
	error.h		\
	misc.h		\
	parse.h		\
	pcode.h		\
	strlist.h	\
	symbol.h	\
	token.h		\
	Makefile	\
	acc.dsp		\
	acc.dsw

ACS = \
	zcommon.acs	\
	zdefs.acs	\
	zspecial.acs \
	zwvars.acs

$(EXENAME) : $(OBJS)
	$(CC) $(OBJS) -o $(EXENAME) $(LDFLAGS)

acc.o: acc.c \
	common.h \
	error.h \
	misc.h \
	parse.h \
	pcode.h \
	strlist.h \
	symbol.h \
	token.h \
	

error.o: error.c \
	common.h \
	error.h \
	misc.h \
	token.h \
	

misc.o: misc.c \
	common.h \
	error.h \
	misc.h \
	

parse.o: parse.c \
	common.h \
	error.h \
	misc.h \
	parse.h \
	pcode.h \
	strlist.h \
	symbol.h \
	token.h \
	

pcode.o: pcode.c \
	common.h \
	error.h \
	misc.h \
	pcode.h \
	strlist.h \
	

strlist.o: strlist.c \
	common.h \
	error.h \
	misc.h \
	pcode.h \
	strlist.h \
	

symbol.o: symbol.c \
	common.h \
	error.h \
	misc.h \
	pcode.h \
	symbol.h \
	parse.h \
	

token.o: token.c \
	common.h \
	error.h \
	misc.h \
	pcode.h \
	symbol.h \
	token.h \
	parse.h \


clean:
	rm -f $(OBJS) $(EXENAME)

# These targets can only be made with MinGW's make and not DJGPP's, because
# they use Win32 tools.

zipsrc: $(SRCS)
	kzip /y acc$(VERNUM)-src.zip $(SRCS) "End User License ACC Source Code.doc"

zipbin: $(EXENAME) $(ACS)
	kzip /y acc$(VERNUM).zip $(EXENAME) $(ACS)

zipwbin: Release/acc.exe $(ACS)
	kzip /y acc$(VERNUM)win.zip Release/acc.exe $(ACS)
