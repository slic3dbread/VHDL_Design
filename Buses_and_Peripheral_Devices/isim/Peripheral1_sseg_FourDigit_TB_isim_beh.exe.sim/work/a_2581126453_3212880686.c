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
static const char *ng0 = "T:/Lab4 - Buses and Peripheral Devices/Buses_and_Peripheral_Devices/sevensegdecoder.vhd";



static void work_a_2581126453_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int t13;
    int t14;
    char *t15;
    int t17;
    char *t18;
    int t20;
    char *t21;
    int t23;
    char *t24;
    int t26;
    char *t27;
    int t29;
    char *t30;
    int t32;
    char *t33;
    int t35;
    char *t36;
    int t38;
    char *t39;
    int t41;
    char *t42;
    int t44;
    char *t45;
    int t47;
    char *t48;
    int t50;
    char *t51;
    int t53;
    char *t54;
    char *t56;
    char *t57;
    char *t58;
    char *t59;
    char *t60;

LAB0:    xsi_set_current_line(18, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = (3 - 3);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 3552);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t7;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(19, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = (2 - 3);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 3616);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t7;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(20, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = (1 - 3);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 3680);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t7;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(21, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = (0 - 3);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 3744);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t7;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(24, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6160);
    t3 = xsi_mem_cmp(t1, t2, 4U);
    if (t3 == 1)
        goto LAB3;

LAB20:    t9 = (t0 + 6164);
    t13 = xsi_mem_cmp(t9, t2, 4U);
    if (t13 == 1)
        goto LAB4;

LAB21:    t11 = (t0 + 6168);
    t14 = xsi_mem_cmp(t11, t2, 4U);
    if (t14 == 1)
        goto LAB5;

LAB22:    t15 = (t0 + 6172);
    t17 = xsi_mem_cmp(t15, t2, 4U);
    if (t17 == 1)
        goto LAB6;

LAB23:    t18 = (t0 + 6176);
    t20 = xsi_mem_cmp(t18, t2, 4U);
    if (t20 == 1)
        goto LAB7;

LAB24:    t21 = (t0 + 6180);
    t23 = xsi_mem_cmp(t21, t2, 4U);
    if (t23 == 1)
        goto LAB8;

LAB25:    t24 = (t0 + 6184);
    t26 = xsi_mem_cmp(t24, t2, 4U);
    if (t26 == 1)
        goto LAB9;

LAB26:    t27 = (t0 + 6188);
    t29 = xsi_mem_cmp(t27, t2, 4U);
    if (t29 == 1)
        goto LAB10;

LAB27:    t30 = (t0 + 6192);
    t32 = xsi_mem_cmp(t30, t2, 4U);
    if (t32 == 1)
        goto LAB11;

LAB28:    t33 = (t0 + 6196);
    t35 = xsi_mem_cmp(t33, t2, 4U);
    if (t35 == 1)
        goto LAB12;

LAB29:    t36 = (t0 + 6200);
    t38 = xsi_mem_cmp(t36, t2, 4U);
    if (t38 == 1)
        goto LAB13;

LAB30:    t39 = (t0 + 6204);
    t41 = xsi_mem_cmp(t39, t2, 4U);
    if (t41 == 1)
        goto LAB14;

LAB31:    t42 = (t0 + 6208);
    t44 = xsi_mem_cmp(t42, t2, 4U);
    if (t44 == 1)
        goto LAB15;

LAB32:    t45 = (t0 + 6212);
    t47 = xsi_mem_cmp(t45, t2, 4U);
    if (t47 == 1)
        goto LAB16;

LAB33:    t48 = (t0 + 6216);
    t50 = xsi_mem_cmp(t48, t2, 4U);
    if (t50 == 1)
        goto LAB17;

LAB34:    t51 = (t0 + 6220);
    t53 = xsi_mem_cmp(t51, t2, 4U);
    if (t53 == 1)
        goto LAB18;

LAB35:
LAB19:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 6352);
    t8 = (t0 + 3808);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t8);

LAB2:    t1 = (t0 + 3472);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(26, ng0);
    t54 = (t0 + 6224);
    t56 = (t0 + 3808);
    t57 = (t56 + 56U);
    t58 = *((char **)t57);
    t59 = (t58 + 56U);
    t60 = *((char **)t59);
    memcpy(t60, t54, 8U);
    xsi_driver_first_trans_fast_port(t56);
    goto LAB2;

LAB4:    xsi_set_current_line(27, ng0);
    t1 = (t0 + 6232);
    t8 = (t0 + 3808);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB5:    xsi_set_current_line(28, ng0);
    t1 = (t0 + 6240);
    t8 = (t0 + 3808);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB6:    xsi_set_current_line(29, ng0);
    t1 = (t0 + 6248);
    t8 = (t0 + 3808);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB7:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 6256);
    t8 = (t0 + 3808);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB8:    xsi_set_current_line(31, ng0);
    t1 = (t0 + 6264);
    t8 = (t0 + 3808);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB9:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 6272);
    t8 = (t0 + 3808);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB10:    xsi_set_current_line(33, ng0);
    t1 = (t0 + 6280);
    t8 = (t0 + 3808);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB11:    xsi_set_current_line(34, ng0);
    t1 = (t0 + 6288);
    t8 = (t0 + 3808);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB12:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 6296);
    t8 = (t0 + 3808);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB13:    xsi_set_current_line(36, ng0);
    t1 = (t0 + 6304);
    t8 = (t0 + 3808);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB14:    xsi_set_current_line(37, ng0);
    t1 = (t0 + 6312);
    t8 = (t0 + 3808);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB15:    xsi_set_current_line(38, ng0);
    t1 = (t0 + 6320);
    t8 = (t0 + 3808);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB16:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 6328);
    t8 = (t0 + 3808);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB17:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 6336);
    t8 = (t0 + 3808);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB18:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 6344);
    t8 = (t0 + 3808);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB36:;
}


extern void work_a_2581126453_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2581126453_3212880686_p_0};
	xsi_register_didat("work_a_2581126453_3212880686", "isim/Peripheral1_sseg_FourDigit_TB_isim_beh.exe.sim/work/a_2581126453_3212880686.didat");
	xsi_register_executes(pe);
}
