cmake_minimum_required(VERSION 2.4)

project(acc)

if(MSVC)
	# Create list of _FLAGS variables
	foreach(FLAGS_SUFFIX "" _DEBUG _RELEASE _MINSIZEREL _RELWITHDEBINFO)
		set(FLAGS_VARIABLES ${FLAGS_VARIABLES} CMAKE_C_FLAGS${FLAGS_SUFFIX} CMAKE_CXX_FLAGS${FLAGS_SUFFIX})
	endforeach()

	# Change compiler flags to use static runtime
	foreach(FLAGS_VARIABLE ${FLAGS_VARIABLES})
		if(${FLAGS_VARIABLE} MATCHES "/MD")
			string(REGEX REPLACE "/MD" "/MT" ${FLAGS_VARIABLE} "${${FLAGS_VARIABLE}}")
		endif()
	endforeach()
endif()

if (NOT APPLE AND NOT MSVC)
	# use static runtimes on Linux and MinGW
	set(CMAKE_C_STANDARD_LIBRARIES "${CMAKE_C_STANDARD_LIBRARIES} -static -static-libgcc -static-libstdc++")
	set(CMAKE_CXX_STANDARD_LIBRARIES "${CMAKE_CXX_STANDARD_LIBRARIES} -static -static-libgcc -static-libstdc++")
	set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static -static-libgcc -static-libstdc++")
endif()

add_executable(acc
	acc.c
	error.c
	misc.c
	parse.c
	pcode.c
	strlist.c
	symbol.c
	token.c
	common.h
	error.h
	misc.h
	parse.h
	pcode.h
	strlist.h
	symbol.h
	token.h
)

install(TARGETS acc DESTINATION bin)
