/* Parses query string into key-value pairs. */

/* John D. Ramsdell -- March 28, 2012 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include "query.h"

static char *decode(const char *field);

/* See header file for function description. */
assoc_t
parse_query_string(const char *qs)
{
  assoc_t ans;
  if (!qs || !*qs) {		/* Query string is empty */
    ans = malloc(sizeof(struct assoc));
    ans->key = ans->val = NULL;
    return ans;
  }
  size_t len = strlen(qs);    /* Query string length */
  int seps = 0;		      /* Count the separators in the string */
  const char *cp = qs;
  for (; *cp; cp++)
    if (*cp == '&' || *cp == ';')
      seps++;
  /* Allocate space for answer */
  ans = malloc((seps + 2) * sizeof(struct assoc) + len + 1);
  ans[seps + 1].key = ans[seps + 1].val = NULL;
  char *q = memcpy(ans + seps + 2, qs, len + 1);

  /* Partition query string into keys and values. */
  int key = 1;			/* Am in a key? */
  char *f = q;			/* Current key or value */
  assoc_t a = ans;		/* Answer entry */
  char *qp = q;
  for (; *qp; qp++)		/* For each char in query string */
    switch (*qp) {
    case '&':			/* Field separator found */
    case ';':
      if (key) {		/* No value, so null value implied */
	a->key = f;
	a->val = "";
      }
      else
	a->val = f;		/* Else f has a value */
      *qp = '\0';		/* Mark end of f */
      f = qp + 1;		/* Move to next field  */
      key = 1;			/* Look for a key */
      a++;			/* in next extry */
      break;
    case '=':			/* Key-value separator */
      *qp = '\0';		/* Mark end of key */
      a->key = f;		/* Key is in f */
      f = qp + 1;		/* Move to next part of field */
      key = 0;			/* Look for a value */
      break;
    }
  if (key) {			/* On loop exit */
    a->key = f;			/* Looking for a key */
    a->val = "";		/* So null value implied */
  }
  else
    a->val = f;			/* Value is f */

  /* Need to check key-value pair syntax here */

  /* URL decode key-value pairs. */
  for (a = ans; a->key; a++) {
    char *s = decode(a->key);
    if (s) {
      strcpy(a->key, s);
      free(s);
    }
    else
      goto fail;
    s = decode(a->val);
    if (s) {
      strcpy(a->val, s);
      free(s);
    }
    else
      goto fail;
  }

  return ans;			/* Success */

 fail:				/* Error exit */
  free(ans);
  return NULL;
}

/* In a URL encoding, does this character need no translation? */
static int
leave(int c)
{
  if (isalnum(c))
    return 1;
  switch (c) {
  case '.':
  case ',':
  case '-':
  case '_':
  case '~':
    return 1;
  default:
    return 0;
  }
}

/* Returns a freshly allocated string with URL encoded characters
   replaced by what was encoded.  Returns NULL on error. */

static char *
decode(const char *field)
{
  if (!field)
    return NULL;
  char *copy = malloc(strlen(field) + 1);
  char *cp = copy;
  for (; *field; field++) {
    if (leave(*field))		/* No translation needed here */
      *cp++ = *field;
    else if (*field == '+')    /* Space is encode and the plus sign */
      *cp++ = ' ';
    else if (*field++ != '%') {	/* Else, a hex value is required */
      free(copy);
      return NULL;
    }
    else {
      unsigned int c;		/* Read two hex digits */
      int rc = sscanf(field, "%2x", &c);
      if (rc != 1) {
	free(copy);
	return NULL;
      }
      field += 1;
      *cp++ = c;		/* Insert hex encoded char */
    }
  }
  *cp = '\0';
  return copy;
}
