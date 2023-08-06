/*
** Automatically generated from `reader.m'
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
INIT mercury__reader__init
ENDINIT
*/

#define MR_ALLOW_RESET
#include "mercury_imp.h"
#line 28 "Mercury\\cs\\reader.c"
#include "array.mh"

#line 31 "Mercury\\cs\\reader.c"
#line 32 "Mercury\\cs\\reader.c"
#include "bitmap.mh"

#line 35 "Mercury\\cs\\reader.c"
#line 36 "Mercury\\cs\\reader.c"
#include "dir.mh"

#line 39 "Mercury\\cs\\reader.c"
#line 40 "Mercury\\cs\\reader.c"
#include "io.mh"

#line 43 "Mercury\\cs\\reader.c"
#line 44 "Mercury\\cs\\reader.c"
#include "reader.mh"

#line 47 "Mercury\\cs\\reader.c"
#line 48 "Mercury\\cs\\reader.c"
#include "string.mh"

#line 51 "Mercury\\cs\\reader.c"
#line 52 "Mercury\\cs\\reader.c"
#include "time.mh"

#line 55 "Mercury\\cs\\reader.c"
#line 56 "Mercury\\cs\\reader.c"
#ifndef READER_DECL_GUARD
#define READER_DECL_GUARD

#line 60 "Mercury\\cs\\reader.c"
#line 61 "Mercury\\cs\\reader.c"

#endif
#line 64 "Mercury\\cs\\reader.c"

#ifdef _MSC_VER
#define MR_STATIC_LINKAGE extern
#else
#define MR_STATIC_LINKAGE static
#endif
MR_decl_label10(reader__readerMain_2_0, 2,3,6,4,8,10,12,14,15,18)
MR_def_extern_entry(reader__readerMain_2_0)



MR_decl_entry(io__write_string_3_0);
MR_decl_entry(dir__current_directory_3_0);
MR_decl_entry(fn__string__append_2_0);
MR_decl_entry(io__open_input_4_0);
MR_decl_entry(io__read_file_as_string_4_0);
MR_decl_entry(io__close_input_3_0);

MR_BEGIN_MODULE(reader_module0)
	MR_init_entry1(reader__readerMain_2_0);
	MR_INIT_PROC_LAYOUT_ADDR(mercury__reader__readerMain_2_0);
	MR_init_label10(reader__readerMain_2_0,2,3,6,4,8,10,12,14,15,18)
MR_BEGIN_CODE

/*-------------------------------------------------------------------------*/
/* code for 'readerMain'/2 mode 0 */
#ifdef MR_maybe_local_thread_engine_base
	#undef MR_maybe_local_thread_engine_base
	#define MR_maybe_local_thread_engine_base MR_local_thread_engine_base
#endif
MR_define_entry(mercury__reader__readerMain_2_0);
	MR_MAYBE_INIT_LOCAL_THREAD_ENGINE_BASE
	MR_incr_sp(2);
	MR_sv(2) = ((MR_Word) MR_succip);
	MR_r1 = ((MR_Word) MR_string_const("Hello!\n", 7));
	MR_np_call_localret_ent(io__write_string_3_0,
		reader__readerMain_2_0_i2);
MR_def_label(reader__readerMain_2_0, 2)
	MR_MAYBE_INIT_LOCAL_THREAD_ENGINE_BASE
	MR_np_call_localret_ent(dir__current_directory_3_0,
		reader__readerMain_2_0_i3);
MR_def_label(reader__readerMain_2_0, 3)
	MR_MAYBE_INIT_LOCAL_THREAD_ENGINE_BASE
	if (MR_INT_NE(MR_tag(MR_r1),0)) {
		MR_GOTO_LAB(reader__readerMain_2_0_i4);
	}
	MR_r1 = MR_tfield(0, MR_r1, 0);
	MR_r2 = ((MR_Word) MR_string_const("\n", 1));
	MR_np_call_localret_ent(fn__string__append_2_0,
		reader__readerMain_2_0_i6);
MR_def_label(reader__readerMain_2_0, 6)
	MR_MAYBE_INIT_LOCAL_THREAD_ENGINE_BASE
	MR_np_call_localret_ent(io__write_string_3_0,
		reader__readerMain_2_0_i8);
MR_def_label(reader__readerMain_2_0, 4)
	MR_MAYBE_INIT_LOCAL_THREAD_ENGINE_BASE
	MR_r1 = ((MR_Word) MR_string_const("Something wrong\n", 16));
	MR_np_call_localret_ent(io__write_string_3_0,
		reader__readerMain_2_0_i8);
MR_def_label(reader__readerMain_2_0, 8)
	MR_MAYBE_INIT_LOCAL_THREAD_ENGINE_BASE
	MR_r1 = ((MR_Word) MR_string_const("C:/Dev/Workspace/MercuryTest/TCL/testfile.txt", 45));
	MR_np_call_localret_ent(io__open_input_4_0,
		reader__readerMain_2_0_i10);
MR_def_label(reader__readerMain_2_0, 10)
	MR_MAYBE_INIT_LOCAL_THREAD_ENGINE_BASE
	if (MR_INT_NE(MR_tag(MR_r1),1)) {
		MR_GOTO_LAB(reader__readerMain_2_0_i12);
	}
	MR_sv(1) = ((MR_Word) MR_string_const("", 0));
	MR_r1 = ((MR_Word) MR_string_const("Fail", 4));
	MR_np_call_localret_ent(io__write_string_3_0,
		reader__readerMain_2_0_i18);
MR_def_label(reader__readerMain_2_0, 12)
	MR_MAYBE_INIT_LOCAL_THREAD_ENGINE_BASE
	MR_sv(1) = MR_tfield(0, MR_r1, 0);
	MR_r1 = MR_sv(1);
	MR_np_call_localret_ent(io__read_file_as_string_4_0,
		reader__readerMain_2_0_i14);
MR_def_label(reader__readerMain_2_0, 14)
	MR_MAYBE_INIT_LOCAL_THREAD_ENGINE_BASE
	if (MR_INT_NE(MR_tag(MR_r1),0)) {
		MR_GOTO_LAB(reader__readerMain_2_0_i15);
	}
	{
	MR_Word MR_tempr1;
	MR_tempr1 = MR_sv(1);
	MR_sv(1) = MR_tfield(0, MR_r1, 0);
	MR_r1 = MR_tempr1;
	}
	MR_np_call_localret_ent(io__close_input_3_0,
		reader__readerMain_2_0_i18);
MR_def_label(reader__readerMain_2_0, 15)
	MR_MAYBE_INIT_LOCAL_THREAD_ENGINE_BASE
	{
	MR_Word MR_tempr1;
	MR_tempr1 = MR_sv(1);
	MR_sv(1) = ((MR_Word) MR_string_const("", 0));
	MR_r1 = MR_tempr1;
	}
	MR_np_call_localret_ent(io__close_input_3_0,
		reader__readerMain_2_0_i18);
MR_def_label(reader__readerMain_2_0, 18)
	MR_MAYBE_INIT_LOCAL_THREAD_ENGINE_BASE
	MR_r1 = MR_sv(1);
	MR_succip_word = MR_sv(2);
	MR_decr_sp(2);
	MR_np_tailcall_ent(io__write_string_3_0);
#ifdef MR_maybe_local_thread_engine_base
	#undef MR_maybe_local_thread_engine_base
	#define MR_maybe_local_thread_engine_base MR_thread_engine_base
#endif
MR_END_MODULE

static void mercury__reader_maybe_bunch_0(void)
{
	reader_module0();
}

/* suppress gcc -Wmissing-decls warnings */
void mercury__reader__init(void);
void mercury__reader__init_type_tables(void);
void mercury__reader__init_debugger(void);
#ifdef MR_DEEP_PROFILING
void mercury__reader__write_out_proc_statics(FILE *deep_fp, FILE *procrep_fp);
#endif
#ifdef MR_RECORD_TERM_SIZES
void mercury__reader__init_complexity_procs(void);
#endif
#ifdef MR_THREADSCOPE
void mercury__reader__init_threadscope_string_table(void);
#endif
const char *mercury__reader__grade_check(void);

void mercury__reader__init(void)
{
	static MR_bool done = MR_FALSE;
	if (done) {
		return;
	}
	done = MR_TRUE;
	mercury__reader_maybe_bunch_0();
	mercury__reader__init_debugger();
}

void mercury__reader__init_type_tables(void)
{
	static MR_bool done = MR_FALSE;
	if (done) {
		return;
	}
	done = MR_TRUE;
}


void mercury__reader__init_debugger(void)
{
	static MR_bool done = MR_FALSE;
	if (done) {
		return;
	}
	done = MR_TRUE;
}

#ifdef MR_DEEP_PROFILING

void mercury__reader__write_out_proc_statics(FILE *deep_fp, FILE *procrep_fp)
{
	MR_write_out_module_proc_reps_start(procrep_fp, &mercury_data__module_layout__reader);
	MR_write_out_module_proc_reps_end(procrep_fp);
}

#endif

#ifdef MR_RECORD_TERM_SIZES

void mercury__reader__init_complexity_procs(void)
{
}

#endif

#ifdef MR_THREADSCOPE

void mercury__reader__init_threadscope_string_table(void)
{
}

#endif

// Ensure everything is compiled with the same grade.
const char *mercury__reader__grade_check(void)
{
    return &MR_GRADE_VAR;
}
