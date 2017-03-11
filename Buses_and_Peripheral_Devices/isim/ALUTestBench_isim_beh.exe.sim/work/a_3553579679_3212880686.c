/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "T:/Lab3 - RAM_REG_ALU/Four-Digit_7-Seg_Controller/Mux8to1.vhd";



static void work_a_3553579679_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(15, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 6187);
    t4 = 1;
    if (3U == 3U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 6190);
    t4 = 1;
    if (3U == 3U)
        goto LAB13;

LAB14:    t4 = 0;

LAB15:    if (t4 != 0)
        goto LAB11;

LAB12:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 6193);
    t4 = 1;
    if (3U == 3U)
        goto LAB21;

LAB22:    t4 = 0;

LAB23:    if (t4 != 0)
        goto LAB19;

LAB20:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 6196);
    t4 = 1;
    if (3U == 3U)
        goto LAB29;

LAB30:    t4 = 0;

LAB31:    if (t4 != 0)
        goto LAB27;

LAB28:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 6199);
    t4 = 1;
    if (3U == 3U)
        goto LAB37;

LAB38:    t4 = 0;

LAB39:    if (t4 != 0)
        goto LAB35;

LAB36:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 6202);
    t4 = 1;
    if (3U == 3U)
        goto LAB45;

LAB46:    t4 = 0;

LAB47:    if (t4 != 0)
        goto LAB43;

LAB44:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 6205);
    t4 = 1;
    if (3U == 3U)
        goto LAB53;

LAB54:    t4 = 0;

LAB55:    if (t4 != 0)
        goto LAB51;

LAB52:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t1 = (t0 + 4032);
    t3 = (t1 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_fast_port(t1);

LAB3:    t1 = (t0 + 3952);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(16, ng0);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t8 = (t0 + 4032);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB3;

LAB5:    t5 = 0;

LAB8:    if (t5 < 3U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB11:    xsi_set_current_line(18, ng0);
    t8 = (t0 + 1192U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t8 = (t0 + 4032);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB3;

LAB13:    t5 = 0;

LAB16:    if (t5 < 3U)
        goto LAB17;
    else
        goto LAB15;

LAB17:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB14;

LAB18:    t5 = (t5 + 1);
    goto LAB16;

LAB19:    xsi_set_current_line(20, ng0);
    t8 = (t0 + 1352U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t8 = (t0 + 4032);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB3;

LAB21:    t5 = 0;

LAB24:    if (t5 < 3U)
        goto LAB25;
    else
        goto LAB23;

LAB25:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB22;

LAB26:    t5 = (t5 + 1);
    goto LAB24;

LAB27:    xsi_set_current_line(22, ng0);
    t8 = (t0 + 1512U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t8 = (t0 + 4032);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB3;

LAB29:    t5 = 0;

LAB32:    if (t5 < 3U)
        goto LAB33;
    else
        goto LAB31;

LAB33:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB30;

LAB34:    t5 = (t5 + 1);
    goto LAB32;

LAB35:    xsi_set_current_line(24, ng0);
    t8 = (t0 + 1672U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t8 = (t0 + 4032);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB3;

LAB37:    t5 = 0;

LAB40:    if (t5 < 3U)
        goto LAB41;
    else
        goto LAB39;

LAB41:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB38;

LAB42:    t5 = (t5 + 1);
    goto LAB40;

LAB43:    xsi_set_current_line(26, ng0);
    t8 = (t0 + 1832U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t8 = (t0 + 4032);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB3;

LAB45:    t5 = 0;

LAB48:    if (t5 < 3U)
        goto LAB49;
    else
        goto LAB47;

LAB49:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB46;

LAB50:    t5 = (t5 + 1);
    goto LAB48;

LAB51:    xsi_set_current_line(28, ng0);
    t8 = (t0 + 1992U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t8 = (t0 + 4032);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB3;

LAB53:    t5 = 0;

LAB56:    if (t5 < 3U)
        goto LAB57;
    else
        goto LAB55;

LAB57:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB54;

LAB58:    t5 = (t5 + 1);
    goto LAB56;

}


extern void work_a_3553579679_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3553579679_3212880686_p_0};
	xsi_register_didat("work_a_3553579679_3212880686", "isim/ALUTestBench_isim_beh.exe.sim/work/a_3553579679_3212880686.didat");
	xsi_register_executes(pe);
}