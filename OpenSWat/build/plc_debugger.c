/*
 * DEBUGGER code
 * 
 * On "publish", when buffer is free, debugger stores arbitrary variables 
 * content into, and mark this buffer as filled
 * 
 * 
 * Buffer content is read asynchronously, (from non real time part), 
 * and then buffer marked free again.
 *  
 * 
 * */
#ifdef TARGET_DEBUG_AND_RETAIN_DISABLE

void __init_debug    (void){}
void __cleanup_debug (void){}
void __retrieve_debug(void){}
void __publish_debug (void){}

#else

#include "iec_types_all.h"
#include "POUS.h"
/*for memcpy*/
#include <string.h>
#include <stdio.h>

#ifndef TARGET_ONLINE_DEBUG_DISABLE
#define BUFFER_SIZE 907

/* Atomically accessed variable for buffer state */
#define BUFFER_FREE 0
#define BUFFER_BUSY 1
static long buffer_state = BUFFER_FREE;

/* The buffer itself */
char debug_buffer[BUFFER_SIZE];

/* Buffer's cursor*/
static char* buffer_cursor = debug_buffer;
#endif

static unsigned int retain_offset = 0;
/***
 * Declare programs 
 **/
extern OPENSWAT RES0__INST0;

/***
 * Declare global variables from resources and conf 
 **/
extern       OPENSWAT   RES0__INST0;

typedef const struct {
    void *ptr;
    __IEC_types_enum type;
} dbgvardsc_t;

static dbgvardsc_t dbgvardsc[] = {
{&(RES0__INST0.USENSOR), BOOL_ENUM},
{&(RES0__INST0.SW), BOOL_ENUM},
{&(RES0__INST0.PB), BOOL_ENUM},
{&(RES0__INST0.SINPUT1), BOOL_ENUM},
{&(RES0__INST0.SINPUT2), BOOL_ENUM},
{&(RES0__INST0.SINPUT3), BOOL_ENUM},
{&(RES0__INST0.SINPUT4), BOOL_ENUM},
{&(RES0__INST0.SINPUT5), BOOL_ENUM},
{&(RES0__INST0.SINPUT6), BOOL_ENUM},
{&(RES0__INST0.SINPUT7), BOOL_ENUM},
{&(RES0__INST0.SINPUT8), BOOL_ENUM},
{&(RES0__INST0.SINPUT9), BOOL_ENUM},
{&(RES0__INST0.SINPUT10), BOOL_ENUM},
{&(RES0__INST0.SINPUT11), BOOL_ENUM},
{&(RES0__INST0.SINPUT12), BOOL_ENUM},
{&(RES0__INST0.SINPUT13), BOOL_ENUM},
{&(RES0__INST0.SINPUT14), BOOL_ENUM},
{&(RES0__INST0.SINPUT15), BOOL_ENUM},
{&(RES0__INST0.SINPUT16), BOOL_ENUM},
{&(RES0__INST0.SINPUT17), BOOL_ENUM},
{&(RES0__INST0.SINPUT18), BOOL_ENUM},
{&(RES0__INST0.SINPUT19), BOOL_ENUM},
{&(RES0__INST0.SINPUT20), BOOL_ENUM},
{&(RES0__INST0.SINPUT21), BOOL_ENUM},
{&(RES0__INST0.SINPUT22), BOOL_ENUM},
{&(RES0__INST0.SINPUT23), BOOL_ENUM},
{&(RES0__INST0.SINPUT24), BOOL_ENUM},
{&(RES0__INST0.SINPUT25), BOOL_ENUM},
{&(RES0__INST0.SINPUT26), BOOL_ENUM},
{&(RES0__INST0.SINPUT27), BOOL_ENUM},
{&(RES0__INST0.SINPUT28), BOOL_ENUM},
{&(RES0__INST0.SINPUT29), BOOL_ENUM},
{&(RES0__INST0.SINPUT30), BOOL_ENUM},
{&(RES0__INST0.SINPUT31), BOOL_ENUM},
{&(RES0__INST0.SINPUT32), BOOL_ENUM},
{&(RES0__INST0.SINPUT33), BOOL_ENUM},
{&(RES0__INST0.TEMPSENSOR1), UINT_ENUM},
{&(RES0__INST0.TEMPSENSOR2), UINT_ENUM},
{&(RES0__INST0.LED1), BOOL_ENUM},
{&(RES0__INST0.LED2), BOOL_ENUM},
{&(RES0__INST0.LED3), BOOL_ENUM},
{&(RES0__INST0.LED4), BOOL_ENUM},
{&(RES0__INST0.LED5), BOOL_ENUM},
{&(RES0__INST0.LED6), BOOL_ENUM},
{&(RES0__INST0.LED7), BOOL_ENUM},
{&(RES0__INST0.LED8), BOOL_ENUM},
{&(RES0__INST0.LED9), BOOL_ENUM},
{&(RES0__INST0.LED10), BOOL_ENUM},
{&(RES0__INST0.LED11), BOOL_ENUM},
{&(RES0__INST0.LED12), BOOL_ENUM},
{&(RES0__INST0.LED13), BOOL_ENUM},
{&(RES0__INST0.LED14), BOOL_ENUM},
{&(RES0__INST0.LED15), BOOL_ENUM},
{&(RES0__INST0.LED16), BOOL_ENUM},
{&(RES0__INST0.LED17), BOOL_ENUM},
{&(RES0__INST0.LED18), BOOL_ENUM},
{&(RES0__INST0.LED19), BOOL_ENUM},
{&(RES0__INST0.LED20), BOOL_ENUM},
{&(RES0__INST0.LED21), BOOL_ENUM},
{&(RES0__INST0.LED22), BOOL_ENUM},
{&(RES0__INST0.LED23), BOOL_ENUM},
{&(RES0__INST0.TOF0.EN), BOOL_ENUM},
{&(RES0__INST0.TOF0.ENO), BOOL_ENUM},
{&(RES0__INST0.TOF0.IN), BOOL_ENUM},
{&(RES0__INST0.TOF0.PT), TIME_ENUM},
{&(RES0__INST0.TOF0.Q), BOOL_ENUM},
{&(RES0__INST0.TOF0.ET), TIME_ENUM},
{&(RES0__INST0.TOF0.STATE), SINT_ENUM},
{&(RES0__INST0.TOF0.PREV_IN), BOOL_ENUM},
{&(RES0__INST0.TOF0.CURRENT_TIME), TIME_ENUM},
{&(RES0__INST0.TOF0.START_TIME), TIME_ENUM},
{&(RES0__INST0.TOF1.EN), BOOL_ENUM},
{&(RES0__INST0.TOF1.ENO), BOOL_ENUM},
{&(RES0__INST0.TOF1.IN), BOOL_ENUM},
{&(RES0__INST0.TOF1.PT), TIME_ENUM},
{&(RES0__INST0.TOF1.Q), BOOL_ENUM},
{&(RES0__INST0.TOF1.ET), TIME_ENUM},
{&(RES0__INST0.TOF1.STATE), SINT_ENUM},
{&(RES0__INST0.TOF1.PREV_IN), BOOL_ENUM},
{&(RES0__INST0.TOF1.CURRENT_TIME), TIME_ENUM},
{&(RES0__INST0.TOF1.START_TIME), TIME_ENUM},
{&(RES0__INST0.TOF11.EN), BOOL_ENUM},
{&(RES0__INST0.TOF11.ENO), BOOL_ENUM},
{&(RES0__INST0.TOF11.IN), BOOL_ENUM},
{&(RES0__INST0.TOF11.PT), TIME_ENUM},
{&(RES0__INST0.TOF11.Q), BOOL_ENUM},
{&(RES0__INST0.TOF11.ET), TIME_ENUM},
{&(RES0__INST0.TOF11.STATE), SINT_ENUM},
{&(RES0__INST0.TOF11.PREV_IN), BOOL_ENUM},
{&(RES0__INST0.TOF11.CURRENT_TIME), TIME_ENUM},
{&(RES0__INST0.TOF11.START_TIME), TIME_ENUM},
{&(RES0__INST0.TOF2.EN), BOOL_ENUM},
{&(RES0__INST0.TOF2.ENO), BOOL_ENUM},
{&(RES0__INST0.TOF2.IN), BOOL_ENUM},
{&(RES0__INST0.TOF2.PT), TIME_ENUM},
{&(RES0__INST0.TOF2.Q), BOOL_ENUM},
{&(RES0__INST0.TOF2.ET), TIME_ENUM},
{&(RES0__INST0.TOF2.STATE), SINT_ENUM},
{&(RES0__INST0.TOF2.PREV_IN), BOOL_ENUM},
{&(RES0__INST0.TOF2.CURRENT_TIME), TIME_ENUM},
{&(RES0__INST0.TOF2.START_TIME), TIME_ENUM},
{&(RES0__INST0.TOF3.EN), BOOL_ENUM},
{&(RES0__INST0.TOF3.ENO), BOOL_ENUM},
{&(RES0__INST0.TOF3.IN), BOOL_ENUM},
{&(RES0__INST0.TOF3.PT), TIME_ENUM},
{&(RES0__INST0.TOF3.Q), BOOL_ENUM},
{&(RES0__INST0.TOF3.ET), TIME_ENUM},
{&(RES0__INST0.TOF3.STATE), SINT_ENUM},
{&(RES0__INST0.TOF3.PREV_IN), BOOL_ENUM},
{&(RES0__INST0.TOF3.CURRENT_TIME), TIME_ENUM},
{&(RES0__INST0.TOF3.START_TIME), TIME_ENUM},
{&(RES0__INST0.TOF5.EN), BOOL_ENUM},
{&(RES0__INST0.TOF5.ENO), BOOL_ENUM},
{&(RES0__INST0.TOF5.IN), BOOL_ENUM},
{&(RES0__INST0.TOF5.PT), TIME_ENUM},
{&(RES0__INST0.TOF5.Q), BOOL_ENUM},
{&(RES0__INST0.TOF5.ET), TIME_ENUM},
{&(RES0__INST0.TOF5.STATE), SINT_ENUM},
{&(RES0__INST0.TOF5.PREV_IN), BOOL_ENUM},
{&(RES0__INST0.TOF5.CURRENT_TIME), TIME_ENUM},
{&(RES0__INST0.TOF5.START_TIME), TIME_ENUM},
{&(RES0__INST0.TOF6.EN), BOOL_ENUM},
{&(RES0__INST0.TOF6.ENO), BOOL_ENUM},
{&(RES0__INST0.TOF6.IN), BOOL_ENUM},
{&(RES0__INST0.TOF6.PT), TIME_ENUM},
{&(RES0__INST0.TOF6.Q), BOOL_ENUM},
{&(RES0__INST0.TOF6.ET), TIME_ENUM},
{&(RES0__INST0.TOF6.STATE), SINT_ENUM},
{&(RES0__INST0.TOF6.PREV_IN), BOOL_ENUM},
{&(RES0__INST0.TOF6.CURRENT_TIME), TIME_ENUM},
{&(RES0__INST0.TOF6.START_TIME), TIME_ENUM},
{&(RES0__INST0.TOF7.EN), BOOL_ENUM},
{&(RES0__INST0.TOF7.ENO), BOOL_ENUM},
{&(RES0__INST0.TOF7.IN), BOOL_ENUM},
{&(RES0__INST0.TOF7.PT), TIME_ENUM},
{&(RES0__INST0.TOF7.Q), BOOL_ENUM},
{&(RES0__INST0.TOF7.ET), TIME_ENUM},
{&(RES0__INST0.TOF7.STATE), SINT_ENUM},
{&(RES0__INST0.TOF7.PREV_IN), BOOL_ENUM},
{&(RES0__INST0.TOF7.CURRENT_TIME), TIME_ENUM},
{&(RES0__INST0.TOF7.START_TIME), TIME_ENUM},
{&(RES0__INST0.TOF4.EN), BOOL_ENUM},
{&(RES0__INST0.TOF4.ENO), BOOL_ENUM},
{&(RES0__INST0.TOF4.IN), BOOL_ENUM},
{&(RES0__INST0.TOF4.PT), TIME_ENUM},
{&(RES0__INST0.TOF4.Q), BOOL_ENUM},
{&(RES0__INST0.TOF4.ET), TIME_ENUM},
{&(RES0__INST0.TOF4.STATE), SINT_ENUM},
{&(RES0__INST0.TOF4.PREV_IN), BOOL_ENUM},
{&(RES0__INST0.TOF4.CURRENT_TIME), TIME_ENUM},
{&(RES0__INST0.TOF4.START_TIME), TIME_ENUM},
{&(RES0__INST0.TOF9.EN), BOOL_ENUM},
{&(RES0__INST0.TOF9.ENO), BOOL_ENUM},
{&(RES0__INST0.TOF9.IN), BOOL_ENUM},
{&(RES0__INST0.TOF9.PT), TIME_ENUM},
{&(RES0__INST0.TOF9.Q), BOOL_ENUM},
{&(RES0__INST0.TOF9.ET), TIME_ENUM},
{&(RES0__INST0.TOF9.STATE), SINT_ENUM},
{&(RES0__INST0.TOF9.PREV_IN), BOOL_ENUM},
{&(RES0__INST0.TOF9.CURRENT_TIME), TIME_ENUM},
{&(RES0__INST0.TOF9.START_TIME), TIME_ENUM},
{&(RES0__INST0.TOF10.EN), BOOL_ENUM},
{&(RES0__INST0.TOF10.ENO), BOOL_ENUM},
{&(RES0__INST0.TOF10.IN), BOOL_ENUM},
{&(RES0__INST0.TOF10.PT), TIME_ENUM},
{&(RES0__INST0.TOF10.Q), BOOL_ENUM},
{&(RES0__INST0.TOF10.ET), TIME_ENUM},
{&(RES0__INST0.TOF10.STATE), SINT_ENUM},
{&(RES0__INST0.TOF10.PREV_IN), BOOL_ENUM},
{&(RES0__INST0.TOF10.CURRENT_TIME), TIME_ENUM},
{&(RES0__INST0.TOF10.START_TIME), TIME_ENUM},
{&(RES0__INST0.TOF8.EN), BOOL_ENUM},
{&(RES0__INST0.TOF8.ENO), BOOL_ENUM},
{&(RES0__INST0.TOF8.IN), BOOL_ENUM},
{&(RES0__INST0.TOF8.PT), TIME_ENUM},
{&(RES0__INST0.TOF8.Q), BOOL_ENUM},
{&(RES0__INST0.TOF8.ET), TIME_ENUM},
{&(RES0__INST0.TOF8.STATE), SINT_ENUM},
{&(RES0__INST0.TOF8.PREV_IN), BOOL_ENUM},
{&(RES0__INST0.TOF8.CURRENT_TIME), TIME_ENUM},
{&(RES0__INST0.TOF8.START_TIME), TIME_ENUM},
{&(RES0__INST0.GE75_OUT), BOOL_ENUM},
{&(RES0__INST0.LE99_OUT), BOOL_ENUM},
{&(RES0__INST0.LT111_OUT), BOOL_ENUM},
{&(RES0__INST0.GE82_OUT), BOOL_ENUM}
};

typedef void(*__for_each_variable_do_fp)(dbgvardsc_t*);
void __for_each_variable_do(__for_each_variable_do_fp fp)
{
    unsigned int i;
    for(i = 0; i < sizeof(dbgvardsc)/sizeof(dbgvardsc_t); i++){
        dbgvardsc_t *dsc = &dbgvardsc[i];
        if(dsc->type != UNKNOWN_ENUM) 
            (*fp)(dsc);
    }
}

#define __Unpack_case_t(TYPENAME) \
        case TYPENAME##_ENUM :\
            *flags = ((__IEC_##TYPENAME##_t *)varp)->flags;\
            forced_value_p = *real_value_p = &((__IEC_##TYPENAME##_t *)varp)->value;\
            break;

#define __Unpack_case_p(TYPENAME)\
        case TYPENAME##_O_ENUM :\
            *flags = __IEC_OUTPUT_FLAG;\
        case TYPENAME##_P_ENUM :\
            *flags |= ((__IEC_##TYPENAME##_p *)varp)->flags;\
            *real_value_p = ((__IEC_##TYPENAME##_p *)varp)->value;\
            forced_value_p = &((__IEC_##TYPENAME##_p *)varp)->fvalue;\
            break;

void* UnpackVar(dbgvardsc_t *dsc, void **real_value_p, char *flags)
{
    void *varp = dsc->ptr;
    void *forced_value_p = NULL;
    *flags = 0;
    /* find data to copy*/
    switch(dsc->type){
        __ANY(__Unpack_case_t)
        __ANY(__Unpack_case_p)
    default:
        break;
    }
    if (*flags & __IEC_FORCE_FLAG)
        return forced_value_p;
    return *real_value_p;
}

void Remind(unsigned int offset, unsigned int count, void * p);

void RemindIterator(dbgvardsc_t *dsc)
{
    void *real_value_p = NULL;
    char flags = 0;
    UnpackVar(dsc, &real_value_p, &flags);

    if(flags & __IEC_RETAIN_FLAG){
        USINT size = __get_type_enum_size(dsc->type);
        /* compute next cursor positon*/
        unsigned int next_retain_offset = retain_offset + size;
        /* if buffer not full */
        Remind(retain_offset, size, real_value_p);
        /* increment cursor according size*/
        retain_offset = next_retain_offset;
    }
}

extern int CheckRetainBuffer(void);
extern void InitRetain(void);

void __init_debug(void)
{
    /* init local static vars */
#ifndef TARGET_ONLINE_DEBUG_DISABLE	
    buffer_cursor = debug_buffer;
    buffer_state = BUFFER_FREE;
#endif

    retain_offset = 0;
    InitRetain();
    /* Iterate over all variables to fill debug buffer */
    if(CheckRetainBuffer()){
    	__for_each_variable_do(RemindIterator);
    }else{
    	char mstr[] = "RETAIN memory invalid - defaults used";
        LogMessage(LOG_WARNING, mstr, sizeof(mstr));
    }
    retain_offset = 0;
}

extern void InitiateDebugTransfer(void);
extern void CleanupRetain(void);

extern unsigned long __tick;

void __cleanup_debug(void)
{
#ifndef TARGET_ONLINE_DEBUG_DISABLE	
    buffer_cursor = debug_buffer;
    InitiateDebugTransfer();
#endif    

    CleanupRetain();
}

void __retrieve_debug(void)
{
}


void Retain(unsigned int offset, unsigned int count, void * p);

static inline void BufferIterator(dbgvardsc_t *dsc, int do_debug)
{
    void *real_value_p = NULL;
    void *visible_value_p = NULL;
    char flags = 0;

    visible_value_p = UnpackVar(dsc, &real_value_p, &flags);

    if(flags & ( __IEC_DEBUG_FLAG | __IEC_RETAIN_FLAG)){
        USINT size = __get_type_enum_size(dsc->type);

#ifndef TARGET_ONLINE_DEBUG_DISABLE	
        if(flags & __IEC_DEBUG_FLAG){
            /* copy visible variable to buffer */;
            if(do_debug){
                /* compute next cursor positon.
                   No need to check overflow, as BUFFER_SIZE
                   is computed large enough */
		if((dsc->type == STRING_ENUM)   ||
		   (dsc->type == STRING_P_ENUM) ||
		   (dsc->type == STRING_O_ENUM)){
                    /* optimization for strings */
                    size = ((STRING*)visible_value_p)->len + 1;
                }
                char* next_cursor = buffer_cursor + size;
                /* copy data to the buffer */
                memcpy(buffer_cursor, visible_value_p, size);
                /* increment cursor according size*/
                buffer_cursor = next_cursor;
            }
            /* re-force real value of outputs (M and Q)*/
            if((flags & __IEC_FORCE_FLAG) && (flags & __IEC_OUTPUT_FLAG)){
                memcpy(real_value_p, visible_value_p, size);
            }
        }
#endif	

        if(flags & __IEC_RETAIN_FLAG){
            /* compute next cursor positon*/
            unsigned int next_retain_offset = retain_offset + size;
            /* if buffer not full */
            Retain(retain_offset, size, real_value_p);
            /* increment cursor according size*/
            retain_offset = next_retain_offset;
        }
    }
}

void DebugIterator(dbgvardsc_t *dsc){
    BufferIterator(dsc, 1);
}

void RetainIterator(dbgvardsc_t *dsc){
    BufferIterator(dsc, 0);
}


unsigned int retain_size = 0;

/* GetRetainSizeIterator */
void GetRetainSizeIterator(dbgvardsc_t *dsc)
{
    void *real_value_p = NULL;
    char flags = 0;
    UnpackVar(dsc, &real_value_p, &flags);

    if(flags & __IEC_RETAIN_FLAG){
        USINT size = __get_type_enum_size(dsc->type);
        /* Calc retain buffer size */
        retain_size += size;
    }
}

/* Return size of all retain variables */
unsigned int GetRetainSize(void)
{
    __for_each_variable_do(GetRetainSizeIterator);
    return retain_size;
}


extern void PLC_GetTime(IEC_TIME*);
extern int TryEnterDebugSection(void);
extern long AtomicCompareExchange(long*, long, long);
extern long long AtomicCompareExchange64(long long* , long long , long long);
extern void LeaveDebugSection(void);
extern void ValidateRetainBuffer(void);
extern void InValidateRetainBuffer(void);

void __publish_debug(void)
{
    retain_offset = 0;
    InValidateRetainBuffer();
    
#ifndef TARGET_ONLINE_DEBUG_DISABLE 
    /* Check there is no running debugger re-configuration */
    if(TryEnterDebugSection()){
        /* Lock buffer */
        long latest_state = AtomicCompareExchange(
            &buffer_state,
            BUFFER_FREE,
            BUFFER_BUSY);
            
        /* If buffer was free */
        if(latest_state == BUFFER_FREE)
        {
            /* Reset buffer cursor */
            buffer_cursor = debug_buffer;
            /* Iterate over all variables to fill debug buffer */
            __for_each_variable_do(DebugIterator);
            
            /* Leave debug section,
             * Trigger asynchronous transmission 
             * (returns immediately) */
            InitiateDebugTransfer(); /* size */
        }else{
            /* when not debugging, do only retain */
            __for_each_variable_do(RetainIterator);
        }
        LeaveDebugSection();
    }else
#endif
    {
        /* when not debugging, do only retain */
        __for_each_variable_do(RetainIterator);
    }
    ValidateRetainBuffer();
}

#ifndef TARGET_ONLINE_DEBUG_DISABLE
#define __RegisterDebugVariable_case_t(TYPENAME) \
        case TYPENAME##_ENUM :\
            ((__IEC_##TYPENAME##_t *)varp)->flags |= flags;\
            if(force)\
             ((__IEC_##TYPENAME##_t *)varp)->value = *((TYPENAME *)force);\
            break;
#define __RegisterDebugVariable_case_p(TYPENAME)\
        case TYPENAME##_P_ENUM :\
            ((__IEC_##TYPENAME##_p *)varp)->flags |= flags;\
            if(force)\
             ((__IEC_##TYPENAME##_p *)varp)->fvalue = *((TYPENAME *)force);\
            break;\
        case TYPENAME##_O_ENUM :\
            ((__IEC_##TYPENAME##_p *)varp)->flags |= flags;\
            if(force){\
             ((__IEC_##TYPENAME##_p *)varp)->fvalue = *((TYPENAME *)force);\
             *(((__IEC_##TYPENAME##_p *)varp)->value) = *((TYPENAME *)force);\
            }\
            break;
void RegisterDebugVariable(unsigned int idx, void* force)
{
    if(idx  < sizeof(dbgvardsc)/sizeof(dbgvardsc_t)){
        unsigned char flags = force ?
            __IEC_DEBUG_FLAG | __IEC_FORCE_FLAG :
            __IEC_DEBUG_FLAG;
        dbgvardsc_t *dsc = &dbgvardsc[idx];
        void *varp = dsc->ptr;
        switch(dsc->type){
            __ANY(__RegisterDebugVariable_case_t)
            __ANY(__RegisterDebugVariable_case_p)
        default:
            break;
        }
    }
}

#define __ResetDebugVariablesIterator_case_t(TYPENAME) \
        case TYPENAME##_ENUM :\
            ((__IEC_##TYPENAME##_t *)varp)->flags &= ~(__IEC_DEBUG_FLAG|__IEC_FORCE_FLAG);\
            break;

#define __ResetDebugVariablesIterator_case_p(TYPENAME)\
        case TYPENAME##_P_ENUM :\
        case TYPENAME##_O_ENUM :\
            ((__IEC_##TYPENAME##_p *)varp)->flags &= ~(__IEC_DEBUG_FLAG|__IEC_FORCE_FLAG);\
            break;

void ResetDebugVariablesIterator(dbgvardsc_t *dsc)
{
    /* force debug flag to 0*/
    void *varp = dsc->ptr;
    switch(dsc->type){
        __ANY(__ResetDebugVariablesIterator_case_t)
        __ANY(__ResetDebugVariablesIterator_case_p)
    default:
        break;
    }
}

void ResetDebugVariables(void)
{
    __for_each_variable_do(ResetDebugVariablesIterator);
}

void FreeDebugData(void)
{
    /* atomically mark buffer as free */
    AtomicCompareExchange(
        &buffer_state,
        BUFFER_BUSY,
        BUFFER_FREE);
}
int WaitDebugData(unsigned long *tick);
/* Wait until debug data ready and return pointer to it */
int GetDebugData(unsigned long *tick, unsigned long *size, void **buffer){
    int wait_error = WaitDebugData(tick);
    if(!wait_error){
        *size = buffer_cursor - debug_buffer;
        *buffer = debug_buffer;
    }
    return wait_error;
}
#endif
#endif

