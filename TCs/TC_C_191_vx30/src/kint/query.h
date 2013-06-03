#ifndef _QUERY_H
#define _QUERY_H

struct assoc {			/* A key-value pair */
  char *key;
  char *val;
};

typedef struct assoc *assoc_t;

/* Returns a newly allocated array of key-value pairs.  The final pair
   has NULL for its key and value.  All other pairs contain pointers
   to strings.

   This parser does not check for malformed query strings nor does it
   translate values such as the encoding space or hex encodings.
*/

assoc_t parse_query_string(const char *querystring);

#endif


