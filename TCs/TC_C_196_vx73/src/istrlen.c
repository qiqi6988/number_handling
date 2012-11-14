/*******************************************
**
** Copyright (C) 2011 The MITRE Corporation. ALL RIGHTS RESERVED
**
** Author: Stephen Jones
** Date: 4/6/2012
**
** Base Test Program -- countlines.c
**
** Variant Test Case Program
**
** This helper function will replace normal strlen, but returns
** signed int instead of unsigned
**
*********************************************/

#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "istrlen.h"

#define DEBUG 0


short
istrlen(const char *s)
{
	const char *sc;

	for ( sc = s; *sc != '\0'; ++sc ) {
		if ( ! isascii(*sc) ) {
			return ENOTASCII;
		}
	}

	return (sc - s);

}
