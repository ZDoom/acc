cmake_minimum_required(VERSION 2.4)

project(acc)

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
