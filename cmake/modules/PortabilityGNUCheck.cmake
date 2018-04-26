#
# This module setup common portability variables


INCLUDE (CheckIncludeFiles)
include(CheckIncludeFileCXX)
INCLUDE (CheckFunctionExists)
INCLUDE (CheckSymbolExists)
INCLUDE (CheckLibraryExists)
INCLUDE (CheckTypeSize)

##  C func
CHECK_INCLUDE_FILES (malloc.h HAVE_MALLOC_H)
CHECK_INCLUDE_FILES (string.h HAVE_STRING_H)
CHECK_INCLUDE_FILES (strings.h HAVE_STRINGS_H)
CHECK_INCLUDE_FILES (locale.h HAVE_LOCALE_H)
CHECK_INCLUDE_FILES(errno.h HAVE_ERRNO_H)
CHECK_INCLUDE_FILES(stdlib.h HAVE_STDLIB_H)


## C++ header files
CHECK_INCLUDE_FILE_CXX(ext/algorithm HAVE_EXT_ALGORITHM)
CHECK_INCLUDE_FILE_CXX(atomic HAVE_ATOMIC "-std=c++11")

## SYSTEM
CHECK_INCLUDE_FILES(sys/poll.h HAVE_SYS_POLL_H)
CHECK_INCLUDE_FILES(sys/select.h HAVE_SYS_SELECT_H)
CHECK_INCLUDE_FILES(sys/socket.h HAVE_SYS_SOCKET_H)
CHECK_INCLUDE_FILES(sys/time.h HAVE_SYS_TIME_H)
CHECK_INCLUDE_FILES(sys/uio.h HAVE_SYS_UIO_H)
CHECK_FUNCTION_EXISTS(setsockopt HAVE_SETSOCKOPT)


## size type
CHECK_TYPE_SIZE(int            DEF_SIZEOF_INT)
CHECK_TYPE_SIZE(long           DEF_SIZEOF_LONG)
CHECK_TYPE_SIZE(size_t         DEF_SIZEOF_SIZE_T)
CHECK_TYPE_SIZE(ssize_t        DEF_SIZEOF_SSIZE_T)
CHECK_TYPE_SIZE(off_t          DEF_SIZEOF_OFF_T)

## POSIX
CHECK_INCLUDE_FILES(unistd.h HAVE_UNISTD_H)
CHECK_INCLUDE_FILES(signal.h HAVE_SIGNAL_H)
CHECK_INCLUDE_FILES(fcntl.h HAVE_FCNTL_H)
CHECK_INCLUDE_FILES(termios.h HAVE_TERMIOS_H)
CHECK_FUNCTION_EXISTS(getpass HAVE_GETPASS)
CHECK_FUNCTION_EXISTS(gmtime_r HAVE_GMTIME_R)
CHECK_FUNCTION_EXISTS(gettimeofday HAVE_GETTIMEOFDAY)

CHECK_LIBRARY_EXISTS(rt clock_gettime "time.h" HAVE_CLOCK_GETTIME)

## Windows
SET(CMAKE_EXTRA_INCLUDE_FILES "windows.h")
CHECK_SYMBOL_EXISTS(SetConsoleMode "windows.h" HAVE_SETCONSOLEMODE)
SET(CMAKE_EXTRA_INCLUDE_FILES)

## BSD

##GNU EXT
#CHECK_FUNCTION_EXISTS(mempcpy HAVE_MEMPCPY_H)
CHECK_FUNCTION_EXISTS(strptime HAVE_STRPTIME_H)

#NET
CHECK_INCLUDE_FILES(netdb.h HAVE_NETDB_H)
CHECK_INCLUDE_FILES(arpa/inet.h HAVE_ARPA_INET_H)
CHECK_INCLUDE_FILES(netinet/in.h HAVE_NETINET_IN_H)
CHECK_INCLUDE_FILES(netinet/tcp.h HAVE_NETINET_TCP_H)

SET(CMAKE_EXTRA_INCLUDE_FILES "arpa/inet.h")

	CHECK_TYPE_SIZE(in_addr_t DEF_SIZEOF_IN_ADDR_T)
	if(DEF_SIZEOF_IN_ADDR_T)
	set(HAVE_IN_ADDR_T 1)
	endif(DEF_SIZEOF_IN_ADDR_T)

	CHECK_TYPE_SIZE(socklen_t DEF_SIZEOF_SOCKLEN_T)
	if(DEF_SIZEOF_SOCKLEN_T)
	set(HAVE_SOCKLEN_T 1)
	endif(DEF_SIZEOF_SOCKLEN_T)

        CHECK_FUNCTION_EXISTS(getaddrinfo HAVE_GETADDRINFO_H)

SET(CMAKE_EXTRA_INCLUDE_FILES)
