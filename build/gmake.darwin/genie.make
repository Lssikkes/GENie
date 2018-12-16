# GNU Make project makefile autogenerated by GENie
ifndef config
  config=release
endif

ifndef verbose
  SILENT = @
endif

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(MAKESHELL)))
  SHELLTYPE := posix
endif

ifeq (posix,$(SHELLTYPE))
  MKDIR = $(SILENT) mkdir -p "$(1)"
  COPY  = $(SILENT) cp -fR "$(1)" "$(2)"
  RM    = $(SILENT) rm -f "$(1)"
else
  MKDIR = $(SILENT) mkdir "$(subst /,\\,$(1))" 2> nul || exit 0
  COPY  = $(SILENT) copy /Y "$(subst /,\\,$(1))" "$(subst /,\\,$(2))"
  RM    = $(SILENT) del /F "$(subst /,\\,$(1))" 2> nul || exit 0
endif

CC  = gcc
CXX = g++
AR  = ar

ifndef RESCOMP
  ifdef WINDRES
    RESCOMP = $(WINDRES)
  else
    RESCOMP = windres
  endif
endif

MAKEFILE = genie.make

ifeq ($(config),release)
  OBJDIR              = obj/Release
  TARGETDIR           = ../../bin/darwin
  override TARGET              = $(TARGETDIR)/genie
  DEFINES            += -DNDEBUG -DLUA_COMPAT_MODULE -DLUA_USE_MACOSX
  INCLUDES           += -I"../../src/host/lua-5.3.0/src"
  ALL_CPPFLAGS       += $(CPPFLAGS) -MMD -MP -MP $(DEFINES) $(INCLUDES)
  ALL_ASMFLAGS       += $(ASMFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -Os -mmacosx-version-min=10.6
  ALL_CFLAGS         += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -Os -mmacosx-version-min=10.6
  ALL_CXXFLAGS       += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -Os -mmacosx-version-min=10.6
  ALL_OBJCFLAGS      += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -Os -mmacosx-version-min=10.6
  ALL_OBJCPPFLAGS    += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -Os -mmacosx-version-min=10.6
  ALL_RESFLAGS       += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS        += $(LDFLAGS) -L"." -mmacosx-version-min=10.6
  LIBDEPS            +=
  LDDEPS             +=
  LIBS               += $(LDDEPS) -framework CoreServices
  EXTERNAL_LIBS      +=
  LINKOBJS            = $(OBJECTS)
  LINKCMD             = $(CC) -o $(TARGET) $(LINKOBJS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  OBJECTS := \
	$(OBJDIR)/src/host/lua-5.3.0/src/lapi.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lauxlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lbaselib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lbitlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lcode.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lcorolib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lctype.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ldblib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ldebug.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ldo.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ldump.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lfunc.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lgc.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/linit.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/liolib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/llex.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lmathlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lmem.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/loadlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lobject.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lopcodes.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/loslib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lparser.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lstate.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lstring.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lstrlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ltable.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ltablib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ltm.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lundump.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lutf8lib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lvm.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lzio.o \
	$(OBJDIR)/src/host/os_chdir.o \
	$(OBJDIR)/src/host/os_copyfile.o \
	$(OBJDIR)/src/host/os_getcwd.o \
	$(OBJDIR)/src/host/os_is64bit.o \
	$(OBJDIR)/src/host/os_isdir.o \
	$(OBJDIR)/src/host/os_isfile.o \
	$(OBJDIR)/src/host/os_match.o \
	$(OBJDIR)/src/host/os_mkdir.o \
	$(OBJDIR)/src/host/os_pathsearch.o \
	$(OBJDIR)/src/host/os_rmdir.o \
	$(OBJDIR)/src/host/os_stat.o \
	$(OBJDIR)/src/host/os_ticks.o \
	$(OBJDIR)/src/host/os_uuid.o \
	$(OBJDIR)/src/host/path_getabsolute.o \
	$(OBJDIR)/src/host/path_getrelative.o \
	$(OBJDIR)/src/host/path_helpers.o \
	$(OBJDIR)/src/host/path_isabsolute.o \
	$(OBJDIR)/src/host/premake.o \
	$(OBJDIR)/src/host/premake_main.o \
	$(OBJDIR)/src/host/scripts.o \
	$(OBJDIR)/src/host/string_endswith.o \
	$(OBJDIR)/src/host/string_hash.o \

  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug)
  OBJDIR              = obj/Debug
  TARGETDIR           = ../../bin/darwin
  override TARGET              = $(TARGETDIR)/genie
  DEFINES            += -D_DEBUG -DLUA_COMPAT_MODULE -DLUA_USE_MACOSX
  INCLUDES           += -I"../../src/host/lua-5.3.0/src"
  ALL_CPPFLAGS       += $(CPPFLAGS) -MMD -MP -MP $(DEFINES) $(INCLUDES)
  ALL_ASMFLAGS       += $(ASMFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -g -mmacosx-version-min=10.6
  ALL_CFLAGS         += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -g -mmacosx-version-min=10.6
  ALL_CXXFLAGS       += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -g -mmacosx-version-min=10.6
  ALL_OBJCFLAGS      += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -g -mmacosx-version-min=10.6
  ALL_OBJCPPFLAGS    += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -g -mmacosx-version-min=10.6
  ALL_RESFLAGS       += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS        += $(LDFLAGS) -L"." -mmacosx-version-min=10.6
  LIBDEPS            +=
  LDDEPS             +=
  LIBS               += $(LDDEPS) -framework CoreServices
  EXTERNAL_LIBS      +=
  LINKOBJS            = $(OBJECTS)
  LINKCMD             = $(CC) -o $(TARGET) $(LINKOBJS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  OBJECTS := \
	$(OBJDIR)/src/host/lua-5.3.0/src/lapi.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lauxlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lbaselib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lbitlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lcode.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lcorolib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lctype.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ldblib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ldebug.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ldo.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ldump.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lfunc.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lgc.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/linit.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/liolib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/llex.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lmathlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lmem.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/loadlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lobject.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lopcodes.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/loslib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lparser.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lstate.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lstring.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lstrlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ltable.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ltablib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ltm.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lundump.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lutf8lib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lvm.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lzio.o \
	$(OBJDIR)/src/host/os_chdir.o \
	$(OBJDIR)/src/host/os_copyfile.o \
	$(OBJDIR)/src/host/os_getcwd.o \
	$(OBJDIR)/src/host/os_is64bit.o \
	$(OBJDIR)/src/host/os_isdir.o \
	$(OBJDIR)/src/host/os_isfile.o \
	$(OBJDIR)/src/host/os_match.o \
	$(OBJDIR)/src/host/os_mkdir.o \
	$(OBJDIR)/src/host/os_pathsearch.o \
	$(OBJDIR)/src/host/os_rmdir.o \
	$(OBJDIR)/src/host/os_stat.o \
	$(OBJDIR)/src/host/os_ticks.o \
	$(OBJDIR)/src/host/os_uuid.o \
	$(OBJDIR)/src/host/path_getabsolute.o \
	$(OBJDIR)/src/host/path_getrelative.o \
	$(OBJDIR)/src/host/path_helpers.o \
	$(OBJDIR)/src/host/path_isabsolute.o \
	$(OBJDIR)/src/host/premake.o \
	$(OBJDIR)/src/host/premake_main.o \
	$(OBJDIR)/src/host/scripts.o \
	$(OBJDIR)/src/host/string_endswith.o \
	$(OBJDIR)/src/host/string_hash.o \

  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),releaseuniv32)
  AR         = libtool
  OBJDIR              = obj/Universal32/Release
  TARGETDIR           = ../../bin/darwin
  override TARGET              = $(TARGETDIR)/genie
  DEFINES            += -DNDEBUG -DLUA_COMPAT_MODULE -DLUA_USE_MACOSX
  INCLUDES           += -I"../../src/host/lua-5.3.0/src"
  ALL_CPPFLAGS       += $(CPPFLAGS) -MMD -MP -MP $(DEFINES) $(INCLUDES)
  ALL_ASMFLAGS       += $(ASMFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -Os -arch i386 -arch ppc -mmacosx-version-min=10.6
  ALL_CFLAGS         += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -Os -arch i386 -arch ppc -mmacosx-version-min=10.6
  ALL_CXXFLAGS       += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -Os -arch i386 -arch ppc -mmacosx-version-min=10.6
  ALL_OBJCFLAGS      += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -Os -arch i386 -arch ppc -mmacosx-version-min=10.6
  ALL_OBJCPPFLAGS    += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -Os -arch i386 -arch ppc -mmacosx-version-min=10.6
  ALL_RESFLAGS       += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS        += $(LDFLAGS) -L"." -arch i386 -arch ppc -mmacosx-version-min=10.6
  LIBDEPS            +=
  LDDEPS             +=
  LIBS               += $(LDDEPS) -framework CoreServices
  EXTERNAL_LIBS      +=
  LINKOBJS            = $(OBJECTS)
  LINKCMD             = $(CC) -o $(TARGET) $(LINKOBJS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  OBJECTS := \
	$(OBJDIR)/src/host/lua-5.3.0/src/lapi.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lauxlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lbaselib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lbitlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lcode.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lcorolib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lctype.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ldblib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ldebug.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ldo.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ldump.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lfunc.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lgc.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/linit.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/liolib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/llex.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lmathlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lmem.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/loadlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lobject.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lopcodes.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/loslib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lparser.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lstate.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lstring.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lstrlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ltable.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ltablib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ltm.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lundump.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lutf8lib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lvm.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lzio.o \
	$(OBJDIR)/src/host/os_chdir.o \
	$(OBJDIR)/src/host/os_copyfile.o \
	$(OBJDIR)/src/host/os_getcwd.o \
	$(OBJDIR)/src/host/os_is64bit.o \
	$(OBJDIR)/src/host/os_isdir.o \
	$(OBJDIR)/src/host/os_isfile.o \
	$(OBJDIR)/src/host/os_match.o \
	$(OBJDIR)/src/host/os_mkdir.o \
	$(OBJDIR)/src/host/os_pathsearch.o \
	$(OBJDIR)/src/host/os_rmdir.o \
	$(OBJDIR)/src/host/os_stat.o \
	$(OBJDIR)/src/host/os_ticks.o \
	$(OBJDIR)/src/host/os_uuid.o \
	$(OBJDIR)/src/host/path_getabsolute.o \
	$(OBJDIR)/src/host/path_getrelative.o \
	$(OBJDIR)/src/host/path_helpers.o \
	$(OBJDIR)/src/host/path_isabsolute.o \
	$(OBJDIR)/src/host/premake.o \
	$(OBJDIR)/src/host/premake_main.o \
	$(OBJDIR)/src/host/scripts.o \
	$(OBJDIR)/src/host/string_endswith.o \
	$(OBJDIR)/src/host/string_hash.o \

  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debuguniv32)
  AR         = libtool
  OBJDIR              = obj/Universal32/Debug
  TARGETDIR           = ../../bin/darwin
  override TARGET              = $(TARGETDIR)/genie
  DEFINES            += -D_DEBUG -DLUA_COMPAT_MODULE -DLUA_USE_MACOSX
  INCLUDES           += -I"../../src/host/lua-5.3.0/src"
  ALL_CPPFLAGS       += $(CPPFLAGS) -MMD -MP -MP $(DEFINES) $(INCLUDES)
  ALL_ASMFLAGS       += $(ASMFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -g -arch i386 -arch ppc -mmacosx-version-min=10.6
  ALL_CFLAGS         += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -g -arch i386 -arch ppc -mmacosx-version-min=10.6
  ALL_CXXFLAGS       += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -g -arch i386 -arch ppc -mmacosx-version-min=10.6
  ALL_OBJCFLAGS      += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -g -arch i386 -arch ppc -mmacosx-version-min=10.6
  ALL_OBJCPPFLAGS    += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -Wall -Wextra -g -arch i386 -arch ppc -mmacosx-version-min=10.6
  ALL_RESFLAGS       += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS        += $(LDFLAGS) -L"." -arch i386 -arch ppc -mmacosx-version-min=10.6
  LIBDEPS            +=
  LDDEPS             +=
  LIBS               += $(LDDEPS) -framework CoreServices
  EXTERNAL_LIBS      +=
  LINKOBJS            = $(OBJECTS)
  LINKCMD             = $(CC) -o $(TARGET) $(LINKOBJS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  OBJECTS := \
	$(OBJDIR)/src/host/lua-5.3.0/src/lapi.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lauxlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lbaselib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lbitlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lcode.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lcorolib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lctype.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ldblib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ldebug.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ldo.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ldump.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lfunc.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lgc.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/linit.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/liolib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/llex.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lmathlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lmem.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/loadlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lobject.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lopcodes.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/loslib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lparser.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lstate.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lstring.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lstrlib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ltable.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ltablib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/ltm.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lundump.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lutf8lib.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lvm.o \
	$(OBJDIR)/src/host/lua-5.3.0/src/lzio.o \
	$(OBJDIR)/src/host/os_chdir.o \
	$(OBJDIR)/src/host/os_copyfile.o \
	$(OBJDIR)/src/host/os_getcwd.o \
	$(OBJDIR)/src/host/os_is64bit.o \
	$(OBJDIR)/src/host/os_isdir.o \
	$(OBJDIR)/src/host/os_isfile.o \
	$(OBJDIR)/src/host/os_match.o \
	$(OBJDIR)/src/host/os_mkdir.o \
	$(OBJDIR)/src/host/os_pathsearch.o \
	$(OBJDIR)/src/host/os_rmdir.o \
	$(OBJDIR)/src/host/os_stat.o \
	$(OBJDIR)/src/host/os_ticks.o \
	$(OBJDIR)/src/host/os_uuid.o \
	$(OBJDIR)/src/host/path_getabsolute.o \
	$(OBJDIR)/src/host/path_getrelative.o \
	$(OBJDIR)/src/host/path_helpers.o \
	$(OBJDIR)/src/host/path_isabsolute.o \
	$(OBJDIR)/src/host/premake.o \
	$(OBJDIR)/src/host/premake_main.o \
	$(OBJDIR)/src/host/scripts.o \
	$(OBJDIR)/src/host/string_endswith.o \
	$(OBJDIR)/src/host/string_hash.o \

  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJDIRS := \
	$(OBJDIR) \
	$(OBJDIR)/src/host \
	$(OBJDIR)/src/host/lua-5.3.0/src \

RESOURCES := \

.PHONY: clean prebuild prelink

all: $(OBJDIRS) $(TARGETDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LIBDEPS) $(EXTERNAL_LIBS) $(RESOURCES) | $(TARGETDIR) $(OBJDIRS)
	@echo Linking genie
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
	-$(call MKDIR,$(TARGETDIR))

$(OBJDIRS):
	@echo Creating $(@)
	-$(call MKDIR,$@)

clean:
	@echo Cleaning genie
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH) $(MAKEFILE) | $(OBJDIR)
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) -x c-header $(DEFINES) $(INCLUDES) -o "$@" -c "$<"

$(GCH_OBJC): $(PCH) $(MAKEFILE) | $(OBJDIR)
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_OBJCFLAGS) -x objective-c-header $(DEFINES) $(INCLUDES) -o "$@" -c "$<"
endif

$(OBJDIR)/src/host/lua-5.3.0/src/lapi.o: ../../src/host/lua-5.3.0/src/lapi.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lauxlib.o: ../../src/host/lua-5.3.0/src/lauxlib.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lbaselib.o: ../../src/host/lua-5.3.0/src/lbaselib.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lbitlib.o: ../../src/host/lua-5.3.0/src/lbitlib.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lcode.o: ../../src/host/lua-5.3.0/src/lcode.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lcorolib.o: ../../src/host/lua-5.3.0/src/lcorolib.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lctype.o: ../../src/host/lua-5.3.0/src/lctype.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/ldblib.o: ../../src/host/lua-5.3.0/src/ldblib.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/ldebug.o: ../../src/host/lua-5.3.0/src/ldebug.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/ldo.o: ../../src/host/lua-5.3.0/src/ldo.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/ldump.o: ../../src/host/lua-5.3.0/src/ldump.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lfunc.o: ../../src/host/lua-5.3.0/src/lfunc.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lgc.o: ../../src/host/lua-5.3.0/src/lgc.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/linit.o: ../../src/host/lua-5.3.0/src/linit.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/liolib.o: ../../src/host/lua-5.3.0/src/liolib.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/llex.o: ../../src/host/lua-5.3.0/src/llex.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lmathlib.o: ../../src/host/lua-5.3.0/src/lmathlib.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lmem.o: ../../src/host/lua-5.3.0/src/lmem.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/loadlib.o: ../../src/host/lua-5.3.0/src/loadlib.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lobject.o: ../../src/host/lua-5.3.0/src/lobject.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lopcodes.o: ../../src/host/lua-5.3.0/src/lopcodes.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/loslib.o: ../../src/host/lua-5.3.0/src/loslib.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lparser.o: ../../src/host/lua-5.3.0/src/lparser.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lstate.o: ../../src/host/lua-5.3.0/src/lstate.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lstring.o: ../../src/host/lua-5.3.0/src/lstring.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lstrlib.o: ../../src/host/lua-5.3.0/src/lstrlib.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/ltable.o: ../../src/host/lua-5.3.0/src/ltable.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/ltablib.o: ../../src/host/lua-5.3.0/src/ltablib.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/ltm.o: ../../src/host/lua-5.3.0/src/ltm.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lundump.o: ../../src/host/lua-5.3.0/src/lundump.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lutf8lib.o: ../../src/host/lua-5.3.0/src/lutf8lib.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lvm.o: ../../src/host/lua-5.3.0/src/lvm.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/lua-5.3.0/src/lzio.o: ../../src/host/lua-5.3.0/src/lzio.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host/lua-5.3.0/src
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/os_chdir.o: ../../src/host/os_chdir.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/os_copyfile.o: ../../src/host/os_copyfile.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/os_getcwd.o: ../../src/host/os_getcwd.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/os_is64bit.o: ../../src/host/os_is64bit.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/os_isdir.o: ../../src/host/os_isdir.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/os_isfile.o: ../../src/host/os_isfile.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/os_match.o: ../../src/host/os_match.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/os_mkdir.o: ../../src/host/os_mkdir.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/os_pathsearch.o: ../../src/host/os_pathsearch.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/os_rmdir.o: ../../src/host/os_rmdir.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/os_stat.o: ../../src/host/os_stat.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/os_ticks.o: ../../src/host/os_ticks.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/os_uuid.o: ../../src/host/os_uuid.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/path_getabsolute.o: ../../src/host/path_getabsolute.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/path_getrelative.o: ../../src/host/path_getrelative.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/path_helpers.o: ../../src/host/path_helpers.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/path_isabsolute.o: ../../src/host/path_isabsolute.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/premake.o: ../../src/host/premake.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/premake_main.o: ../../src/host/premake_main.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/scripts.o: ../../src/host/scripts.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/string_endswith.o: ../../src/host/string_endswith.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

$(OBJDIR)/src/host/string_hash.o: ../../src/host/string_hash.c $(GCH) $(MAKEFILE) | $(OBJDIR)/src/host
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
  -include $(OBJDIR)/$(notdir $(PCH))_objc.d
endif
