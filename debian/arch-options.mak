# -*- mode: makefile-gmake -*-

c_flags =
cxx_flags =

ifeq      (armel, $(DEB_HOST_ARCH))
  c_flags += -DDEBIAN_NO_HW_AES=1
else ifeq (kfreebsd-amd64, $(DEB_HOST_ARCH))
  cxx_flags += -Wno-error=conversion
else ifeq (kfreebsd-i386, $(DEB_HOST_ARCH))
  cxx_flags += -Wno-error=conversion
endif

ifneq ($(c_flags),)
  export DEB_CFLAGS_MAINT_APPEND = $(c_flags)
endif
ifneq ($(cxx_flags),)
  export DEB_CXXFLAGS_MAINT_APPEND = $(cxx_flags)
endif
