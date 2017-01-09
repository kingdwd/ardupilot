
using namespace std;

extern void clock_gettime(int mode, void *ptr);

#define __EXPORT __attribute__ ((visibility ("default")))
#define __PRIVATE __attribute__ ((visibility ("hidden")))

#define packed_struct __attribute__ ((packed))

#define _WANT_REGISTER_FINI 1
#define HAVE_INITFINI_ARRAY 1