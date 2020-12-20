#ifndef _ILLUMOS_ENDIAN_H
#define _ILLUMOS_ENDIAN_H

/*
 * Shims to make illumos' endian headers and macros compatible
 * with <sys/endian.h>
 */

# include <endian.h>

# define _COMPAT_LITTLE_ENDIAN 0x12345678
# define _COMPAT_BIG_ENDIAN 0x87654321

# ifdef _LITTLE_ENDIAN
#  define _BYTE_ORDER _COMPAT_LITTLE_ENDIAN
# endif
# ifdef _BIG_ENDIAN
#  define _BYTE_ORDER _COMPAT_BIG_ENDIAN
# endif

# undef _LITTLE_ENDIAN
# undef _BIG_ENDIAN
# define _LITTLE_ENDIAN _COMPAT_LITTLE_ENDIAN
# define _BIG_ENDIAN _COMPAT_BIG_ENDIAN

#endif /* _ILLUMOS_ENDIAN_H */
