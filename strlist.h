
//**************************************************************************
//**
//** strlist.h
//**
//**************************************************************************

#ifndef __STRLIST_H__
#define __STRLIST_H__

// HEADER FILES ------------------------------------------------------------

#include "common.h"

// MACROS ------------------------------------------------------------------

// TYPES -------------------------------------------------------------------

// PUBLIC FUNCTION PROTOTYPES ----------------------------------------------

void STR_Init(void);
int STR_Find(char *name);
void STR_WriteStrings(void);
void STR_WriteList(void);
int STR_FindLanguage(char *name);
int STR_FindInLanguage(int language, char *name);
int STR_FindInList(int list, char *name);
int STR_FindInListInsensitive(int list, char *name);
int STR_AppendToList(int list, char *name);
const char *STR_GetString(int list, int index);
void STR_WriteChunk(int language, boolean encrypt);
void STR_WriteListChunk(int list, int id, boolean quad);
int STR_ListSize(int list);

// PUBLIC DATA DECLARATIONS ------------------------------------------------

extern int NumLanguages, NumStringLists;

#endif
