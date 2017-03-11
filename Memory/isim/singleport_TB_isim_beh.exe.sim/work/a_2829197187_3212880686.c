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
static const char *ng0 = "T:/Lab3_3380/Lab3_memory/singleport_memory.vhd";



static void work_a_2829197187_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t3 = (31 - 4);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 2928U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t1, 5U);
    xsi_set_current_line(96, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t3 = (31 - 9);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 3048U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t1, 5U);
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t3 = (31 - 14);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 3168U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t1, 5U);
    xsi_set_current_line(98, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t3 = (31 - 19);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 3288U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t1, 5U);
    xsi_set_current_line(100, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t9 = *((unsigned char *)t2);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB5;

LAB6:    t8 = (unsigned char)0;

LAB7:    if (t8 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4840);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(101, ng0);
    t6 = (t0 + 2312U);
    t7 = *((char **)t6);
    t6 = (t0 + 7999);
    t13 = xsi_mem_cmp(t6, t7, 4U);
    if (t13 == 1)
        goto LAB9;

LAB13:    t14 = (t0 + 8003);
    t16 = xsi_mem_cmp(t14, t7, 4U);
    if (t16 == 1)
        goto LAB10;

LAB14:    t17 = (t0 + 8007);
    t19 = xsi_mem_cmp(t17, t7, 4U);
    if (t19 == 1)
        goto LAB11;

LAB15:
LAB12:    xsi_set_current_line(112, ng0);
    t1 = (t0 + 2928U);
    t2 = *((char **)t1);
    t1 = (t0 + 4936);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t12 = (t7 + 56U);
    t14 = *((char **)t12);
    memcpy(t14, t2, 5U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(113, ng0);
    t1 = (t0 + 8023);
    t6 = (t0 + 5000);
    t7 = (t6 + 56U);
    t12 = *((char **)t7);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t1, 4U);
    xsi_driver_first_trans_fast(t6);

LAB8:    goto LAB3;

LAB5:    t1 = (t0 + 1632U);
    t11 = xsi_signal_has_event(t1);
    t8 = t11;
    goto LAB7;

LAB9:    xsi_set_current_line(103, ng0);
    t20 = (t0 + 3048U);
    t21 = *((char **)t20);
    t20 = (t0 + 4936);
    t22 = (t20 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t21, 5U);
    xsi_driver_first_trans_fast(t20);
    xsi_set_current_line(104, ng0);
    t1 = (t0 + 8011);
    t6 = (t0 + 5000);
    t7 = (t6 + 56U);
    t12 = *((char **)t7);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t1, 4U);
    xsi_driver_first_trans_fast(t6);
    goto LAB8;

LAB10:    xsi_set_current_line(106, ng0);
    t1 = (t0 + 3168U);
    t2 = *((char **)t1);
    t1 = (t0 + 4936);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t12 = (t7 + 56U);
    t14 = *((char **)t12);
    memcpy(t14, t2, 5U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(107, ng0);
    t1 = (t0 + 8015);
    t6 = (t0 + 5000);
    t7 = (t6 + 56U);
    t12 = *((char **)t7);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t1, 4U);
    xsi_driver_first_trans_fast(t6);
    goto LAB8;

LAB11:    xsi_set_current_line(109, ng0);
    t1 = (t0 + 3288U);
    t2 = *((char **)t1);
    t1 = (t0 + 4936);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t12 = (t7 + 56U);
    t14 = *((char **)t12);
    memcpy(t14, t2, 5U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(110, ng0);
    t1 = (t0 + 8019);
    t6 = (t0 + 5000);
    t7 = (t6 + 56U);
    t12 = *((char **)t7);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t1, 4U);
    xsi_driver_first_trans_fast(t6);
    goto LAB8;

LAB16:;
}

static void work_a_2829197187_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(117, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 5064);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 4U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4856);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2829197187_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2829197187_3212880686_p_0,(void *)work_a_2829197187_3212880686_p_1};
	xsi_register_didat("work_a_2829197187_3212880686", "isim/singleport_TB_isim_beh.exe.sim/work/a_2829197187_3212880686.didat");
	xsi_register_executes(pe);
}
