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
static const char *ng0 = "T:/lab1nick/PCreg.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_674691591_3965413181(char *, char *, char *, char *, unsigned char );


static void work_a_4188165282_0625112718_p_0(char *t0)
{
    char t12[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1472U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 3472);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 5220);
    t6 = (t0 + 3552);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 1192U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t11 = (t4 == (unsigned char)3);
    if (t11 != 0)
        goto LAB7;

LAB9:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 <= (unsigned char)3);
    if (t4 != 0)
        goto LAB10;

LAB11:
LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 1032U);
    t6 = *((char **)t2);
    t2 = (t0 + 3552);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t6, 16U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB8;

LAB10:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1832U);
    t5 = *((char **)t1);
    t1 = (t0 + 5128U);
    t6 = ieee_p_3620187407_sub_674691591_3965413181(IEEE_P_3620187407, t12, t5, t1, (unsigned char)3);
    t7 = (t12 + 12U);
    t13 = *((unsigned int *)t7);
    t14 = (1U * t13);
    t11 = (16U != t14);
    if (t11 == 1)
        goto LAB12;

LAB13:    t8 = (t0 + 3552);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t15 = (t10 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t6, 16U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB8;

LAB12:    xsi_size_not_matching(16U, t14, 0);
    goto LAB13;

}


extern void work_a_4188165282_0625112718_init()
{
	static char *pe[] = {(void *)work_a_4188165282_0625112718_p_0};
	xsi_register_didat("work_a_4188165282_0625112718", "isim/processortest_isim_beh.exe.sim/work/a_4188165282_0625112718.didat");
	xsi_register_executes(pe);
}
