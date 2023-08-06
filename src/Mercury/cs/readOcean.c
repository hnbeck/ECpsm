/*
** Automatically generated from `readOcean.m'
** by the Mercury compiler,
** version 22.01.6
** configured for x86_64-w64-mingw32.
** Do not edit.
**
** The autoconfigured grade settings governing
** the generation of this C file were
**
** TAG_BITS=3
** UNBOXED_FLOAT=yes
** UNBOXED_INT64S=yes
** PREGENERATED_DIST=no
** HIGHLEVEL_CODE=no
**
** END_OF_C_GRADE_INFO
*/

/*
INIT mercury__readOcean__init
ENDINIT
*/

#define MR_ALLOW_RESET
#include "mercury_imp.h"
#line 28 "Mercury\\cs\\readOcean.c"
#include "array.mh"

#line 31 "Mercury\\cs\\readOcean.c"
#line 32 "Mercury\\cs\\readOcean.c"
#include "bitmap.mh"

#line 35 "Mercury\\cs\\readOcean.c"
#line 36 "Mercury\\cs\\readOcean.c"
#include "io.mh"

#line 39 "Mercury\\cs\\readOcean.c"
#line 40 "Mercury\\cs\\readOcean.c"
#include "readOcean.mh"

#line 43 "Mercury\\cs\\readOcean.c"
#line 44 "Mercury\\cs\\readOcean.c"
#include "string.mh"

#line 47 "Mercury\\cs\\readOcean.c"
#line 48 "Mercury\\cs\\readOcean.c"
#include "time.mh"

#line 51 "Mercury\\cs\\readOcean.c"
#line 52 "Mercury\\cs\\readOcean.c"
#ifndef READOCEAN_DECL_GUARD
#define READOCEAN_DECL_GUARD

#line 56 "Mercury\\cs\\readOcean.c"
#line 57 "Mercury\\cs\\readOcean.c"

#endif
#line 60 "Mercury\\cs\\readOcean.c"

#ifdef _MSC_VER
#define MR_STATIC_LINKAGE extern
#else
#define MR_STATIC_LINKAGE static
#endif
MR_def_extern_entry(main_2_0)



MR_decl_entry(reader__readerMain_2_0);

MR_BEGIN_MODULE(readOcean_module0)
	MR_init_entry1(main_2_0);
	MR_INIT_PROC_LAYOUT_ADDR(mercury__main_2_0);
MR_BEGIN_CODE

/*-------------------------------------------------------------------------*/
/* code for 'main'/2 mode 0 */
#ifdef MR_maybe_local_thread_engine_base
	#undef MR_maybe_local_thread_engine_base
	#define MR_maybe_local_thread_engine_base MR_local_thread_engine_base
#endif
MR_define_entry(mercury__main_2_0);
	MR_MAYBE_INIT_LOCAL_THREAD_ENGINE_BASE
	MR_np_tailcall_ent(reader__readerMain_2_0);
#ifdef MR_maybe_local_thread_engine_base
	#undef MR_maybe_local_thread_engine_base
	#define MR_maybe_local_thread_engine_base MR_thread_engine_base
#endif
MR_END_MODULE

static void mercury__readOcean_maybe_bunch_0(void)
{
	readOcean_module0();
}

/* suppress gcc -Wmissing-decls warnings */
void mercury__readOcean__init(void);
void mercury__readOcean__init_type_tables(void);
void mercury__readOcean__init_debugger(void);
#ifdef MR_DEEP_PROFILING
void mercury__readOcean__write_out_proc_statics(FILE *deep_fp, FILE *procrep_fp);
#endif
#ifdef MR_RECORD_TERM_SIZES
void mercury__readOcean__init_complexity_procs(void);
#endif
#ifdef MR_THREADSCOPE
void mercury__readOcean__init_threadscope_string_table(void);
#endif
const char *mercury__readOcean__grade_check(void);

void mercury__readOcean__init(void)
{
	static MR_bool done = MR_FALSE;
	if (done) {
		return;
	}
	done = MR_TRUE;
	mercury__readOcean_maybe_bunch_0();
	mercury__readOcean__init_debugger();
}

void mercury__readOcean__init_type_tables(void)
{
	static MR_bool done = MR_FALSE;
	if (done) {
		return;
	}
	done = MR_TRUE;
}


void mercury__readOcean__init_debugger(void)
{
	static MR_bool done = MR_FALSE;
	if (done) {
		return;
	}
	done = MR_TRUE;
}

#ifdef MR_DEEP_PROFILING

void mercury__readOcean__write_out_proc_statics(FILE *deep_fp, FILE *procrep_fp)
{
	MR_write_out_module_proc_reps_start(procrep_fp, &mercury_data__module_layout__readOcean);
	MR_write_out_module_proc_reps_end(procrep_fp);
}

#endif

#ifdef MR_RECORD_TERM_SIZES

void mercury__readOcean__init_complexity_procs(void)
{
}

#endif

#ifdef MR_THREADSCOPE

void mercury__readOcean__init_threadscope_string_table(void)
{
}

#endif

// Ensure everything is compiled with the same grade.
const char *mercury__readOcean__grade_check(void)
{
    return &MR_GRADE_VAR;
}
