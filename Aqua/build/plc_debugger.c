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
#define BUFFER_SIZE 1772

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
extern GENERAL RES0__INSTANCE0;

/***
 * Declare global variables from resources and conf 
 **/
extern       GENERAL   RES0__INSTANCE0;

typedef const struct {
    void *ptr;
    __IEC_types_enum type;
} dbgvardsc_t;

static dbgvardsc_t dbgvardsc[] = {
{&(RES0__INSTANCE0.TAMPON_CHAUFFAGE.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.TAMPON_CHAUFFAGE.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.TAMPON_CHAUFFAGE.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.TAMPON_CHAUFFAGE.PT), TIME_ENUM},
{&(RES0__INSTANCE0.TAMPON_CHAUFFAGE.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.TAMPON_CHAUFFAGE.ET), TIME_ENUM},
{&(RES0__INSTANCE0.TAMPON_CHAUFFAGE.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.TAMPON_CHAUFFAGE.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.TAMPON_CHAUFFAGE.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.TAMPON_CHAUFFAGE.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_OVERFLOW.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_OVERFLOW.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_OVERFLOW.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_OVERFLOW.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_OVERFLOW.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_OVERFLOW.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_OVERFLOW.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_OVERFLOW.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_OVERFLOW.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_OVERFLOW.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_DRAIN.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_DRAIN.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_DRAIN.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_DRAIN.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_DRAIN.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_DRAIN.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_DRAIN.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_DRAIN.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_DRAIN.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_DRAIN.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON_3_EXTRA.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON_3_EXTRA.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON_3_EXTRA.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON_3_EXTRA.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON_3_EXTRA.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON_3_EXTRA.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON_3_EXTRA.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON_3_EXTRA.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON_3_EXTRA.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SAVON_3_EXTRA.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SANI.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SANI.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SANI.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SANI.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SANI.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SANI.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SANI.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SANI.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SANI.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_POMPE_SANI.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_LAVAGE.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_LAVAGE.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_LAVAGE.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_LAVAGE.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_LAVAGE.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_LAVAGE.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_LAVAGE.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_LAVAGE.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_LAVAGE.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_LAVAGE.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_PRE_WASH.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_PRE_WASH.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_PRE_WASH.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_PRE_WASH.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_PRE_WASH.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_PRE_WASH.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_PRE_WASH.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_PRE_WASH.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_PRE_WASH.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_PRE_WASH.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_DELAI_VIDANGE.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_DELAI_VIDANGE.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_DELAI_VIDANGE.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_DELAI_VIDANGE.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_DELAI_VIDANGE.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_DELAI_VIDANGE.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_DELAI_VIDANGE.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_DELAI_VIDANGE.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_DELAI_VIDANGE.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_DELAI_VIDANGE.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_HOT_RINSE.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_HOT_RINSE.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_HOT_RINSE.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_HOT_RINSE.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_HOT_RINSE.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_HOT_RINSE.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_HOT_RINSE.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_HOT_RINSE.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_HOT_RINSE.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_HOT_RINSE.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_ASSAIN.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_ASSAIN.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_ASSAIN.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_ASSAIN.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_ASSAIN.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_ASSAIN.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_ASSAIN.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_ASSAIN.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_ASSAIN.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_ASSAIN.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.DELAI_MOTEUR.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.DELAI_MOTEUR.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.DELAI_MOTEUR.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.DELAI_MOTEUR.PT), TIME_ENUM},
{&(RES0__INSTANCE0.DELAI_MOTEUR.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.DELAI_MOTEUR.ET), TIME_ENUM},
{&(RES0__INSTANCE0.DELAI_MOTEUR.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.DELAI_MOTEUR.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.DELAI_MOTEUR.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.DELAI_MOTEUR.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_1.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_1.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_1.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_1.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_1.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_1.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_1.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_1.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_1.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_1.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_3.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_3.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_3.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_3.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_3.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_3.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_3.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_3.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_3.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_3.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_2.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_2.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_2.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_2.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_2.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_2.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_2.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_2.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_2.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_LAVAGE_2.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_PRE_LAVAGE_3.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_PRE_LAVAGE_3.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_PRE_LAVAGE_3.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_PRE_LAVAGE_3.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_PRE_LAVAGE_3.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_PRE_LAVAGE_3.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_PRE_LAVAGE_3.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_BRAS_PRE_LAVAGE_3.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_PRE_LAVAGE_3.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_PRE_LAVAGE_3.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_1.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_1.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_1.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_1.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_1.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_1.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_1.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_1.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_1.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_1.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_2.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_2.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_2.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_2.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_2.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_2.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_2.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_2.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_2.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_2.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_3.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_3.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_3.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_3.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_3.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_3.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_3.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_3.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_3.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_ASSAIN_3.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_1.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_1.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_1.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_1.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_1.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_1.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_1.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_1.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_1.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_1.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_2.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_2.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_2.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_2.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_2.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_2.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_2.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_2.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_2.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_2.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_3.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_3.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_3.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_3.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_3.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_3.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_3.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_3.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_3.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_BRAS_HOT_RINCE_3.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_ALARME_FIN_DE_CYCLE.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_ALARME_FIN_DE_CYCLE.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.T_ALARME_FIN_DE_CYCLE.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_ALARME_FIN_DE_CYCLE.PT), TIME_ENUM},
{&(RES0__INSTANCE0.T_ALARME_FIN_DE_CYCLE.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.T_ALARME_FIN_DE_CYCLE.ET), TIME_ENUM},
{&(RES0__INSTANCE0.T_ALARME_FIN_DE_CYCLE.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.T_ALARME_FIN_DE_CYCLE.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.T_ALARME_FIN_DE_CYCLE.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.T_ALARME_FIN_DE_CYCLE.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.URGENCE0.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.ST12), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.ST13), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.ST14), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.ST15), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.DEPART), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.URGENCES), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.M_DRAINAGE), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.M_STEP_1), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.__step_list[0].X), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.__debug_transition_list[0]), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.__step_list[1].X), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.__debug_transition_list[1]), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.__step_list[2].X), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.__debug_transition_list[2]), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.__step_list[3].X), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCE0.__debug_transition_list[3]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.ST1), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.ST2), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.ST3), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.ST4), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.ST5), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.ST6), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.ST7), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.ST8), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.ST9), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.ST10), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.ST11), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.ST16), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.ST17), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.ST18), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.M_LAVAGE), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.M_RINSE), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.M_HOT_RINSE), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.M_P_SAVON), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.M_P_ASSAIN), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.M_DRAINAGE), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.M_DELAI_VIDANGE), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.M_FLOTTE), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.DEPART), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.WATER_SAVER), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.CYCLE_3), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.URGENCEZ), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.BOOSTER_READY), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.HEATER), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__step_list[0].X), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[0]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__step_list[1].X), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[1]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__step_list[2].X), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[2]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__step_list[3].X), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[3]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__step_list[4].X), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[4]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__step_list[5].X), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[5]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__step_list[6].X), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[6]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__step_list[7].X), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[7]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__step_list[8].X), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[8]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__step_list[9].X), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[9]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[10]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__step_list[10].X), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[11]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[12]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__step_list[11].X), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[13]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__step_list[12].X), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[14]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__step_list[13].X), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[15]), BOOL_ENUM},
{&(RES0__INSTANCE0.PRINCIPAL0.__debug_transition_list[16]), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_1), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_2), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_3), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_4), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_5), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_6), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_7), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_8), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_9), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_10), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_11), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_12), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_13), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_14), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_15), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_16), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_17), BOOL_ENUM},
{&(RES0__INSTANCE0.STEP_18), BOOL_ENUM},
{&(RES0__INSTANCE0.DEPART), BOOL_ENUM},
{&(RES0__INSTANCE0.CYCLE_1), BOOL_ENUM},
{&(RES0__INSTANCE0.WATER_SAVER), BOOL_ENUM},
{&(RES0__INSTANCE0.CYCLE_3), BOOL_ENUM},
{&(RES0__INSTANCE0.URGENCEL), BOOL_ENUM},
{&(RES0__INSTANCE0.COUVERT), BOOL_ENUM},
{&(RES0__INSTANCE0.FLOTTE_BASSIN_BAS), BOOL_ENUM},
{&(RES0__INSTANCE0.FLOTTE_BOOSTER), BOOL_ENUM},
{&(RES0__INSTANCE0.FLOTTE_BASSIN_HAUT), BOOL_ENUM},
{&(RES0__INSTANCE0.SELECTEUR_LO_LEVEL), BOOL_ENUM},
{&(RES0__INSTANCE0.BOOSTER_READY), BOOL_ENUM},
{&(RES0__INSTANCE0.HEATER), BOOL_ENUM},
{&(RES0__INSTANCE0.MOTEUR), BOOL_ENUM},
{&(RES0__INSTANCE0.DRAIN), BOOL_ENUM},
{&(RES0__INSTANCE0.BUZZER), BOOL_ENUM},
{&(RES0__INSTANCE0.CHAUFFAGE), BOOL_ENUM},
{&(RES0__INSTANCE0.EAU_BOOSTER), BOOL_ENUM},
{&(RES0__INSTANCE0.EAU_FRAICHE), BOOL_ENUM},
{&(RES0__INSTANCE0.POMPE_SAVON), BOOL_ENUM},
{&(RES0__INSTANCE0.POMPE_ASSAIN), BOOL_ENUM},
{&(RES0__INSTANCE0.LUMIERE_VERTE), BOOL_ENUM},
{&(RES0__INSTANCE0.LUMIERE_JAUNE), BOOL_ENUM},
{&(RES0__INSTANCE0.BRAS_DE_LAVAGE), BOOL_ENUM},
{&(RES0__INSTANCE0.UNUSED0), BOOL_ENUM},
{&(RES0__INSTANCE0.UNUSED1), BOOL_ENUM},
{&(RES0__INSTANCE0.UNUSED2), BOOL_ENUM},
{&(RES0__INSTANCE0.M_LAVAGE), BOOL_ENUM},
{&(RES0__INSTANCE0.M_RINSE), BOOL_ENUM},
{&(RES0__INSTANCE0.M_HOT_RINSE), BOOL_ENUM},
{&(RES0__INSTANCE0.M_P_SAVON), BOOL_ENUM},
{&(RES0__INSTANCE0.M_P_ASSAIN), BOOL_ENUM},
{&(RES0__INSTANCE0.M_DRAINAGE), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_1), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_2), BOOL_ENUM},
{&(RES0__INSTANCE0.M_DRAIN), BOOL_ENUM},
{&(RES0__INSTANCE0.M_FICTIVE), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_3), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_4), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_5), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_6), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_7), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_8), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_9), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_10), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_11), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_12), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_13), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_14), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_15), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_16), BOOL_ENUM},
{&(RES0__INSTANCE0.M_DELAI_VIDANGE), BOOL_ENUM},
{&(RES0__INSTANCE0.M_DELAI_MOTEUR), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_17), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_18), BOOL_ENUM},
{&(RES0__INSTANCE0.M_TAMPON_CHAUFFAGE), BOOL_ENUM},
{&(RES0__INSTANCE0.M_BRAS), BOOL_ENUM},
{&(RES0__INSTANCE0.M_BRAS_2), BOOL_ENUM},
{&(RES0__INSTANCE0.M_STEP_22), BOOL_ENUM},
{&(RES0__INSTANCE0.M_OVERFLOW), BOOL_ENUM},
{&(RES0__INSTANCE0.M_ALARM_OVERFLOW), BOOL_ENUM},
{&(RES0__INSTANCE0.M_FIN_DE_CYCLE), BOOL_ENUM},
{&(RES0__INSTANCE0.M_FLOTTE), BOOL_ENUM},
{&(RES0__INSTANCE0.M_BRAS_3), BOOL_ENUM},
{&(RES0__INSTANCE0.SB_INTERGRAFCET), BOOL_ENUM},
{&(RES0__INSTANCE0.SB_FIRSTRUN), BOOL_ENUM}
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

