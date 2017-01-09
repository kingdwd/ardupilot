	.syntax unified
	.cpu cortex-m4
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu fpv4-sp-d16
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"polygon.cpp"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text._Z15Polygon_outsideIiEbRK7Vector2IT_EPS3_j,"axG",%progbits,_Z15Polygon_outsideIiEbRK7Vector2IT_EPS3_j,comdat
	.align	1
	.weak	_Z15Polygon_outsideIiEbRK7Vector2IT_EPS3_j
	.hidden	_Z15Polygon_outsideIiEbRK7Vector2IT_EPS3_j
	.thumb
	.thumb_func
	.type	_Z15Polygon_outsideIiEbRK7Vector2IT_EPS3_j, %function
_Z15Polygon_outsideIiEbRK7Vector2IT_EPS3_j:
.LFB432:
	.file 1 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_Math/polygon.cpp"
	.loc 1 38 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.cfi_def_cfa_offset 32
	.cfi_offset 4, -32
	.cfi_offset 5, -28
	.cfi_offset 6, -24
	.cfi_offset 7, -20
	.cfi_offset 8, -16
	.cfi_offset 9, -12
	.cfi_offset 10, -8
	.cfi_offset 14, -4
.LBB2:
.LBB3:
	.loc 1 42 0
	add	ip, r2, #-1
.LVL1:
.LBE3:
	.loc 1 41 0
	movs	r3, #1
.LBB5:
	.loc 1 42 0
	mov	lr, #0
.LVL2:
.L2:
	.loc 1 42 0 is_stmt 0 discriminator 1
	cmp	lr, r2
	beq	.L20
	add	r4, r1, lr, lsl #3
.LBB4:
	.loc 1 43 0 is_stmt 1
	ldr	r9, [r0, #4]
	ldr	r5, [r4, #4]
	add	r4, r1, ip, lsl #3
	cmp	r5, r9
	ldr	r7, [r4, #4]
	ite	gt
	movgt	r6, #0
	movle	r6, #1
	cmp	r7, r9
	ite	le
	movle	r4, #0
	movgt	r4, #1
	cmp	r6, r4
	bne	.L3
	.loc 1 47 0
	ldr	r4, [r1, lr, lsl #3]
	ldr	r6, [r0]
.LVL3:
	.loc 1 48 0
	ldr	ip, [r1, ip, lsl #3]
.LVL4:
	.loc 1 53 0
	subs	r6, r6, r4
.LVL5:
	ite	mi
	movmi	r8, #255
	movpl	r8, #1
	.loc 1 54 0
	subs	r4, ip, r4
.LVL6:
	.loc 1 50 0
	sub	r7, r7, r5
.LVL7:
	.loc 1 54 0
	ite	mi
	movmi	ip, #255
	movpl	ip, #1
.LVL8:
	.loc 1 55 0
	subs	r5, r9, r5
.LVL9:
	ite	mi
	movmi	r9, #255
	movpl	r9, #1
.LVL10:
	.loc 1 56 0
	cmp	r7, #0
	ite	lt
	movlt	r10, #255
	movge	r10, #1
.LVL11:
	.loc 1 57 0
	smulbb	r8, r10, r8
.LVL12:
	.loc 1 58 0
	smulbb	ip, r9, ip
.LVL13:
	sxtb	r8, r8
	sxtb	ip, ip
	.loc 1 60 0
	bge	.L8
	.loc 1 61 0
	cmp	r8, ip
	bgt	.L16
	.loc 1 63 0
	blt	.L3
	.loc 1 65 0
	smull	r6, r7, r6, r7
.LVL14:
	smull	r4, r5, r4, r5
.LVL15:
	cmp	r4, r6
	sbcs	r4, r5, r7
	b	.L18
.LVL16:
.L8:
	.loc 1 69 0
	cmp	r8, ip
	blt	.L16
	.loc 1 71 0
	bgt	.L3
	.loc 1 73 0
	smull	r6, r7, r6, r7
.LVL17:
	smull	r4, r5, r4, r5
.LVL18:
	cmp	r6, r4
	sbcs	r4, r7, r5
.LVL19:
.L18:
	bge	.L3
.L16:
	.loc 1 74 0
	eor	r3, r3, #1
.LVL20:
.L3:
.LBE4:
	.loc 1 42 0 discriminator 2
	mov	ip, lr
	add	lr, lr, #1
.LVL21:
	b	.L2
.L20:
.LBE5:
.LBE2:
	.loc 1 79 0
	mov	r0, r3
.LVL22:
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
	.cfi_endproc
.LFE432:
	.size	_Z15Polygon_outsideIiEbRK7Vector2IT_EPS3_j, .-_Z15Polygon_outsideIiEbRK7Vector2IT_EPS3_j
	.section	.text._Z16Polygon_completeIiEbPK7Vector2IT_Ej,"axG",%progbits,_Z16Polygon_completeIiEbPK7Vector2IT_Ej,comdat
	.align	1
	.weak	_Z16Polygon_completeIiEbPK7Vector2IT_Ej
	.hidden	_Z16Polygon_completeIiEbPK7Vector2IT_Ej
	.thumb
	.thumb_func
	.type	_Z16Polygon_completeIiEbPK7Vector2IT_Ej, %function
_Z16Polygon_completeIiEbPK7Vector2IT_Ej:
.LFB433:
	.loc 1 89 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL23:
	.loc 1 91 0
	cmp	r1, #3
	.loc 1 89 0
	mov	r3, r0
	.loc 1 91 0
	bls	.L22
	.loc 1 91 0 is_stmt 0 discriminator 1
	add	r0, r1, #536870912
.LVL24:
	subs	r0, r0, #1
	add	r0, r3, r0, lsl #3
	mov	r1, r3
.LVL25:
	b	_ZNK7Vector2IiEeqERKS0_
.LVL26:
.L22:
	.loc 1 92 0 is_stmt 1 discriminator 6
	movs	r0, #0
.LVL27:
	bx	lr
	.cfi_endproc
.LFE433:
	.size	_Z16Polygon_completeIiEbPK7Vector2IT_Ej, .-_Z16Polygon_completeIiEbPK7Vector2IT_Ej
	.section	.text._Z15Polygon_outsideIfEbRK7Vector2IT_EPS3_j,"axG",%progbits,_Z15Polygon_outsideIfEbRK7Vector2IT_EPS3_j,comdat
	.align	1
	.weak	_Z15Polygon_outsideIfEbRK7Vector2IT_EPS3_j
	.hidden	_Z15Polygon_outsideIfEbRK7Vector2IT_EPS3_j
	.thumb
	.thumb_func
	.type	_Z15Polygon_outsideIfEbRK7Vector2IT_EPS3_j, %function
_Z15Polygon_outsideIfEbRK7Vector2IT_EPS3_j:
.LFB434:
	.loc 1 38 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL28:
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	ip, r1, #4
.LBB6:
.LBB7:
	.loc 1 42 0
	subs	r4, r2, #1
.LVL29:
.LBE7:
	.loc 1 41 0
	movs	r3, #1
.LBB9:
	.loc 1 42 0
	mov	lr, #0
.LVL30:
.L24:
	.loc 1 42 0 is_stmt 0 discriminator 1
	cmp	lr, r2
	beq	.L41
.LBB8:
	.loc 1 43 0 is_stmt 1
	flds	s15, [r0, #4]
	flds	s13, [ip]
	add	r4, r1, r4, lsl #3
.LVL31:
	flds	s14, [r4, #4]
	fcmps	s13, s15
	fmstat
	fcmpes	s14, s15
	ite	le
	movle	r6, #1
	movgt	r6, #0
	fmstat
	ite	gt
	movgt	r5, #1
	movle	r5, #0
	cmp	r6, r5
	bne	.L25
	.loc 1 47 0
	flds	s10, [ip, #-4]
	flds	s11, [r0]
	fsubs	s11, s11, s10
	.loc 1 49 0
	fsubs	s15, s15, s13
	.loc 1 47 0
	ftosizs	s12, s11
	.loc 1 49 0
	ftosizs	s15, s15
	.loc 1 47 0
	fmrs	r6, s12	@ int
.LVL32:
	.loc 1 48 0
	flds	s12, [r4]
	fsubs	s12, s12, s10
	.loc 1 50 0
	fsubs	s14, s14, s13
	.loc 1 48 0
	ftosizs	s12, s12
	.loc 1 49 0
	fmrs	r5, s15	@ int
	.loc 1 48 0
	fmrs	r4, s12	@ int
.LVL33:
	.loc 1 50 0
	ftosizs	s15, s14
	.loc 1 53 0
	cmp	r6, #0
	ite	lt
	movlt	r9, #255
	movge	r9, #1
	.loc 1 50 0
	fmrs	r7, s15	@ int
.LVL34:
	.loc 1 54 0
	cmp	r4, #0
	ite	lt
	movlt	r8, #255
	movge	r8, #1
.LVL35:
	.loc 1 55 0
	cmp	r5, #0
	ite	lt
	movlt	r10, #255
	movge	r10, #1
.LVL36:
	.loc 1 56 0
	cmp	r7, #0
	ite	lt
	movlt	fp, #255
	movge	fp, #1
.LVL37:
	.loc 1 57 0
	smulbb	r9, fp, r9
.LVL38:
	.loc 1 58 0
	smulbb	r8, r10, r8
.LVL39:
	sxtb	r9, r9
	sxtb	r8, r8
	.loc 1 60 0
	bge	.L30
	.loc 1 61 0
	cmp	r9, r8
	bgt	.L38
	.loc 1 63 0
	blt	.L25
	.loc 1 65 0
	smull	r6, r7, r6, r7
.LVL40:
	smull	r4, r5, r4, r5
.LVL41:
	cmp	r4, r6
	sbcs	r4, r5, r7
	b	.L40
.LVL42:
.L30:
	.loc 1 69 0
	cmp	r9, r8
	blt	.L38
	.loc 1 71 0
	bgt	.L25
	.loc 1 73 0
	smull	r6, r7, r6, r7
.LVL43:
	smull	r4, r5, r4, r5
.LVL44:
	cmp	r6, r4
	sbcs	r4, r7, r5
.LVL45:
.L40:
	bge	.L25
.L38:
	.loc 1 74 0
	eor	r3, r3, #1
.LVL46:
.L25:
.LBE8:
	.loc 1 42 0 discriminator 2
	mov	r4, lr
	add	ip, ip, #8
	add	lr, lr, #1
.LVL47:
	b	.L24
.L41:
.LBE9:
.LBE6:
	.loc 1 79 0
	mov	r0, r3
.LVL48:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.cfi_endproc
.LFE434:
	.size	_Z15Polygon_outsideIfEbRK7Vector2IT_EPS3_j, .-_Z15Polygon_outsideIfEbRK7Vector2IT_EPS3_j
	.section	.text._Z16Polygon_completeIfEbPK7Vector2IT_Ej,"axG",%progbits,_Z16Polygon_completeIfEbPK7Vector2IT_Ej,comdat
	.align	1
	.weak	_Z16Polygon_completeIfEbPK7Vector2IT_Ej
	.hidden	_Z16Polygon_completeIfEbPK7Vector2IT_Ej
	.thumb
	.thumb_func
	.type	_Z16Polygon_completeIfEbPK7Vector2IT_Ej, %function
_Z16Polygon_completeIfEbPK7Vector2IT_Ej:
.LFB435:
	.loc 1 89 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL49:
	.loc 1 91 0
	cmp	r1, #3
	.loc 1 89 0
	mov	r3, r0
	.loc 1 91 0
	bls	.L43
	.loc 1 91 0 is_stmt 0 discriminator 1
	add	r0, r1, #536870912
.LVL50:
	subs	r0, r0, #1
	add	r0, r3, r0, lsl #3
	mov	r1, r3
.LVL51:
	b	_ZNK7Vector2IfEeqERKS0_
.LVL52:
.L43:
	.loc 1 92 0 is_stmt 1 discriminator 6
	movs	r0, #0
.LVL53:
	bx	lr
	.cfi_endproc
.LFE435:
	.size	_Z16Polygon_completeIfEbPK7Vector2IT_Ej, .-_Z16Polygon_completeIfEbPK7Vector2IT_Ej
	.text
.Letext0:
	.file 2 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/modules/PX4Firmware/Build/px4fmu-v2_APM.build/nuttx-export/include/cxx/cstddef"
	.file 3 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/modules/PX4Firmware/Build/px4fmu-v2_APM.build/nuttx-export/include/arch/math.h"
	.file 4 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/modules/PX4Firmware/Build/px4fmu-v2_APM.build/nuttx-export/include/arch/types.h"
	.file 5 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/modules/PX4Firmware/Build/px4fmu-v2_APM.build/nuttx-export/include/stdint.h"
	.file 6 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/modules/PX4Firmware/Build/px4fmu-v2_APM.build/nuttx-export/include/sys/types.h"
	.file 7 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_Math/vector2.h"
	.file 8 "<built-in>"
	.file 9 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/AP_HAL_Namespace.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xe4e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF1700
	.byte	0x4
	.4byte	.LASF1701
	.4byte	.LASF1702
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF1547
	.uleb128 0x4
	.4byte	.LASF1564
	.byte	0x3
	.byte	0x7d
	.4byte	0x42
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF1548
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1549
	.uleb128 0x5
	.ascii	"std\000"
	.byte	0x8
	.byte	0
	.4byte	0xd3
	.uleb128 0x6
	.byte	0x2
	.byte	0x38
	.4byte	0x1d4
	.uleb128 0x6
	.byte	0x2
	.byte	0x3d
	.4byte	0x37
	.uleb128 0x6
	.byte	0x2
	.byte	0x3e
	.4byte	0x1df
	.uleb128 0x6
	.byte	0x2
	.byte	0x40
	.4byte	0x1ea
	.uleb128 0x6
	.byte	0x2
	.byte	0x41
	.4byte	0x1f5
	.uleb128 0x6
	.byte	0x2
	.byte	0x42
	.4byte	0x200
	.uleb128 0x6
	.byte	0x2
	.byte	0x43
	.4byte	0x24d
	.uleb128 0x6
	.byte	0x2
	.byte	0x44
	.4byte	0x263
	.uleb128 0x6
	.byte	0x2
	.byte	0x45
	.4byte	0x242
	.uleb128 0x6
	.byte	0x2
	.byte	0x46
	.4byte	0x258
	.uleb128 0x6
	.byte	0x2
	.byte	0x47
	.4byte	0x20b
	.uleb128 0x6
	.byte	0x2
	.byte	0x48
	.4byte	0x216
	.uleb128 0x6
	.byte	0x2
	.byte	0x49
	.4byte	0x221
	.uleb128 0x6
	.byte	0x2
	.byte	0x4a
	.4byte	0x22c
	.uleb128 0x6
	.byte	0x2
	.byte	0x4b
	.4byte	0x237
	.uleb128 0x6
	.byte	0x2
	.byte	0x4d
	.4byte	0x26e
	.uleb128 0x6
	.byte	0x2
	.byte	0x4e
	.4byte	0x279
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.4byte	.LASF1550
	.uleb128 0x7
	.4byte	0x29
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1551
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1552
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1553
	.uleb128 0x3
	.byte	0x2
	.byte	0x10
	.4byte	.LASF1554
	.uleb128 0x3
	.byte	0x4
	.byte	0x10
	.4byte	.LASF1555
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF1556
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF1557
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1558
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF1559
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1560
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1561
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF1562
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF1563
	.uleb128 0x4
	.4byte	.LASF1565
	.byte	0x4
	.byte	0x44
	.4byte	0xdf
	.uleb128 0x4
	.4byte	.LASF1566
	.byte	0x4
	.byte	0x45
	.4byte	0xe6
	.uleb128 0x4
	.4byte	.LASF1567
	.byte	0x4
	.byte	0x47
	.4byte	0x102
	.uleb128 0x4
	.4byte	.LASF1568
	.byte	0x4
	.byte	0x48
	.4byte	0x109
	.uleb128 0x4
	.4byte	.LASF1569
	.byte	0x4
	.byte	0x4a
	.4byte	0x29
	.uleb128 0x4
	.4byte	.LASF1570
	.byte	0x4
	.byte	0x4b
	.4byte	0x110
	.uleb128 0x4
	.4byte	.LASF1571
	.byte	0x4
	.byte	0x4d
	.4byte	0x125
	.uleb128 0x4
	.4byte	.LASF1572
	.byte	0x5
	.byte	0xdb
	.4byte	0x13a
	.uleb128 0x4
	.4byte	.LASF1573
	.byte	0x5
	.byte	0xdc
	.4byte	0x145
	.uleb128 0x4
	.4byte	.LASF1574
	.byte	0x5
	.byte	0xde
	.4byte	0x150
	.uleb128 0x4
	.4byte	.LASF1575
	.byte	0x5
	.byte	0xdf
	.4byte	0x15b
	.uleb128 0x4
	.4byte	.LASF1576
	.byte	0x5
	.byte	0xe6
	.4byte	0x166
	.uleb128 0x4
	.4byte	.LASF1577
	.byte	0x5
	.byte	0xe7
	.4byte	0x171
	.uleb128 0x4
	.4byte	.LASF1578
	.byte	0x5
	.byte	0xea
	.4byte	0x17c
	.uleb128 0x4
	.4byte	.LASF1579
	.byte	0x6
	.byte	0x70
	.4byte	0x30
	.uleb128 0x4
	.4byte	.LASF1580
	.byte	0x6
	.byte	0x76
	.4byte	0x42
	.uleb128 0x4
	.4byte	.LASF1581
	.byte	0x6
	.byte	0x80
	.4byte	0x110
	.uleb128 0x4
	.4byte	.LASF1582
	.byte	0x6
	.byte	0x8a
	.4byte	0x1be
	.uleb128 0x4
	.4byte	.LASF1583
	.byte	0x6
	.byte	0x8b
	.4byte	0x1b3
	.uleb128 0x4
	.4byte	.LASF1584
	.byte	0x6
	.byte	0x92
	.4byte	0x19d
	.uleb128 0x4
	.4byte	.LASF1585
	.byte	0x6
	.byte	0x93
	.4byte	0x19d
	.uleb128 0x4
	.4byte	.LASF1586
	.byte	0x6
	.byte	0x97
	.4byte	0x1a8
	.uleb128 0x4
	.4byte	.LASF1587
	.byte	0x6
	.byte	0x9b
	.4byte	0x1a8
	.uleb128 0x4
	.4byte	.LASF1588
	.byte	0x6
	.byte	0xa1
	.4byte	0x19d
	.uleb128 0x4
	.4byte	.LASF1589
	.byte	0x6
	.byte	0xbf
	.4byte	0x1be
	.uleb128 0x4
	.4byte	.LASF1590
	.byte	0x6
	.byte	0xc0
	.4byte	0x1b3
	.uleb128 0x4
	.4byte	.LASF1591
	.byte	0x6
	.byte	0xc1
	.4byte	0x24d
	.uleb128 0x4
	.4byte	.LASF1592
	.byte	0x6
	.byte	0xcc
	.4byte	0x19d
	.uleb128 0x4
	.4byte	.LASF1593
	.byte	0x6
	.byte	0xd0
	.4byte	0x110
	.uleb128 0x4
	.4byte	.LASF1594
	.byte	0x6
	.byte	0xd1
	.4byte	0x1a8
	.uleb128 0x8
	.4byte	.LASF1703
	.byte	0x9
	.byte	0x6
	.uleb128 0x9
	.4byte	.LASF1704
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1595
	.uleb128 0x7
	.4byte	0x30
	.uleb128 0x7
	.4byte	0x192
	.uleb128 0xa
	.4byte	.LASF1656
	.byte	0x8
	.byte	0x7
	.byte	0x23
	.4byte	0x6db
	.uleb128 0xb
	.ascii	"x\000"
	.byte	0x7
	.byte	0x25
	.4byte	0x29
	.byte	0
	.uleb128 0xb
	.ascii	"y\000"
	.byte	0x7
	.byte	0x25
	.4byte	0x29
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF1596
	.byte	0x7
	.byte	0x28
	.4byte	0xb1b
	.4byte	0x2d4
	.4byte	0x2da
	.uleb128 0xd
	.4byte	0xb1b
	.byte	0
	.uleb128 0xc
	.4byte	.LASF1596
	.byte	0x7
	.byte	0x2d
	.4byte	0xb1b
	.4byte	0x2ed
	.4byte	0x2fd
	.uleb128 0xd
	.4byte	0xb1b
	.uleb128 0xe
	.4byte	0x29
	.uleb128 0xe
	.4byte	0x29
	.byte	0
	.uleb128 0xf
	.4byte	.LASF1597
	.byte	0x7
	.byte	0x32
	.4byte	.LASF1634
	.4byte	0x310
	.4byte	0x320
	.uleb128 0xd
	.4byte	0xb1b
	.uleb128 0xe
	.4byte	0x29
	.uleb128 0xe
	.4byte	0x29
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1598
	.byte	0x7
	.byte	0x38
	.4byte	.LASF1600
	.4byte	0xd3
	.4byte	0x337
	.4byte	0x342
	.uleb128 0xd
	.4byte	0xb21
	.uleb128 0xe
	.4byte	0xb2c
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1599
	.byte	0x7
	.byte	0x3b
	.4byte	.LASF1601
	.4byte	0xd3
	.4byte	0x359
	.4byte	0x364
	.uleb128 0xd
	.4byte	0xb21
	.uleb128 0xe
	.4byte	0xb2c
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1602
	.byte	0x7
	.byte	0x3e
	.4byte	.LASF1603
	.4byte	0x2a1
	.4byte	0x37b
	.4byte	0x381
	.uleb128 0xd
	.4byte	0xb21
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1604
	.byte	0x7
	.byte	0x41
	.4byte	.LASF1605
	.4byte	0x2a1
	.4byte	0x398
	.4byte	0x3a3
	.uleb128 0xd
	.4byte	0xb21
	.uleb128 0xe
	.4byte	0xb2c
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1602
	.byte	0x7
	.byte	0x44
	.4byte	.LASF1606
	.4byte	0x2a1
	.4byte	0x3ba
	.4byte	0x3c5
	.uleb128 0xd
	.4byte	0xb21
	.uleb128 0xe
	.4byte	0xb2c
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1607
	.byte	0x7
	.byte	0x47
	.4byte	.LASF1608
	.4byte	0x2a1
	.4byte	0x3dc
	.4byte	0x3e7
	.uleb128 0xd
	.4byte	0xb21
	.uleb128 0xe
	.4byte	0x29
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1609
	.byte	0x7
	.byte	0x4a
	.4byte	.LASF1610
	.4byte	0x2a1
	.4byte	0x3fe
	.4byte	0x409
	.uleb128 0xd
	.4byte	0xb21
	.uleb128 0xe
	.4byte	0x29
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1611
	.byte	0x7
	.byte	0x4d
	.4byte	.LASF1612
	.4byte	0xb32
	.4byte	0x420
	.4byte	0x42b
	.uleb128 0xd
	.4byte	0xb1b
	.uleb128 0xe
	.4byte	0xb2c
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1613
	.byte	0x7
	.byte	0x50
	.4byte	.LASF1614
	.4byte	0xb32
	.4byte	0x442
	.4byte	0x44d
	.uleb128 0xd
	.4byte	0xb1b
	.uleb128 0xe
	.4byte	0xb2c
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1615
	.byte	0x7
	.byte	0x53
	.4byte	.LASF1616
	.4byte	0xb32
	.4byte	0x464
	.4byte	0x46f
	.uleb128 0xd
	.4byte	0xb1b
	.uleb128 0xe
	.4byte	0x29
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1617
	.byte	0x7
	.byte	0x56
	.4byte	.LASF1618
	.4byte	0xb32
	.4byte	0x486
	.4byte	0x491
	.uleb128 0xd
	.4byte	0xb1b
	.uleb128 0xe
	.4byte	0x29
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1607
	.byte	0x7
	.byte	0x59
	.4byte	.LASF1619
	.4byte	0x29
	.4byte	0x4a8
	.4byte	0x4b3
	.uleb128 0xd
	.4byte	0xb21
	.uleb128 0xe
	.4byte	0xb2c
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1620
	.byte	0x7
	.byte	0x5c
	.4byte	.LASF1621
	.4byte	0x29
	.4byte	0x4ca
	.4byte	0x4d5
	.uleb128 0xd
	.4byte	0xb21
	.uleb128 0xe
	.4byte	0xb2c
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1622
	.byte	0x7
	.byte	0x5f
	.4byte	.LASF1623
	.4byte	0x30
	.4byte	0x4ec
	.4byte	0x4f7
	.uleb128 0xd
	.4byte	0xb21
	.uleb128 0xe
	.4byte	0xb2c
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1622
	.byte	0x7
	.byte	0x62
	.4byte	.LASF1624
	.4byte	0x29
	.4byte	0x50e
	.4byte	0x514
	.uleb128 0xd
	.4byte	0xb21
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1625
	.byte	0x7
	.byte	0x65
	.4byte	.LASF1626
	.4byte	0xd3
	.4byte	0x52b
	.4byte	0x531
	.uleb128 0xd
	.4byte	0xb21
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1627
	.byte	0x7
	.byte	0x68
	.4byte	.LASF1628
	.4byte	0xd3
	.4byte	0x548
	.4byte	0x54e
	.uleb128 0xd
	.4byte	0xb21
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1629
	.byte	0x7
	.byte	0x6b
	.4byte	.LASF1630
	.4byte	0xd3
	.4byte	0x565
	.4byte	0x56b
	.uleb128 0xd
	.4byte	0xb21
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1631
	.byte	0x7
	.byte	0x6d
	.4byte	.LASF1632
	.4byte	0xb38
	.4byte	0x582
	.4byte	0x58d
	.uleb128 0xd
	.4byte	0xb21
	.uleb128 0xe
	.4byte	0x192
	.byte	0
	.uleb128 0xf
	.4byte	.LASF1633
	.byte	0x7
	.byte	0x76
	.4byte	.LASF1635
	.4byte	0x5a0
	.4byte	0x5a6
	.uleb128 0xd
	.4byte	0xb1b
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1636
	.byte	0x7
	.byte	0x7c
	.4byte	.LASF1637
	.4byte	0x29
	.4byte	0x5bd
	.4byte	0x5c3
	.uleb128 0xd
	.4byte	0xb21
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1638
	.byte	0x7
	.byte	0x82
	.4byte	.LASF1639
	.4byte	0x30
	.4byte	0x5da
	.4byte	0x5e0
	.uleb128 0xd
	.4byte	0xb21
	.byte	0
	.uleb128 0xf
	.4byte	.LASF1640
	.byte	0x7
	.byte	0x85
	.4byte	.LASF1641
	.4byte	0x5f3
	.4byte	0x5f9
	.uleb128 0xd
	.4byte	0xb1b
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1642
	.byte	0x7
	.byte	0x8b
	.4byte	.LASF1643
	.4byte	0x2a1
	.4byte	0x610
	.4byte	0x616
	.uleb128 0xd
	.4byte	0xb21
	.byte	0
	.uleb128 0xf
	.4byte	.LASF1644
	.byte	0x7
	.byte	0x91
	.4byte	.LASF1645
	.4byte	0x629
	.4byte	0x634
	.uleb128 0xd
	.4byte	0xb1b
	.uleb128 0xe
	.4byte	0xb2c
	.byte	0
	.uleb128 0xf
	.4byte	.LASF1646
	.byte	0x7
	.byte	0x99
	.4byte	.LASF1647
	.4byte	0x647
	.4byte	0x652
	.uleb128 0xd
	.4byte	0xb1b
	.uleb128 0xe
	.4byte	0xb2c
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1648
	.byte	0x7
	.byte	0x9f
	.4byte	.LASF1649
	.4byte	0x2a1
	.4byte	0x669
	.4byte	0x674
	.uleb128 0xd
	.4byte	0xb1b
	.uleb128 0xe
	.4byte	0xb2c
	.byte	0
	.uleb128 0x11
	.4byte	.LASF1650
	.byte	0x7
	.byte	0xa6
	.4byte	.LASF1651
	.4byte	0x2a1
	.4byte	0x692
	.uleb128 0xe
	.4byte	0xb2c
	.uleb128 0xe
	.4byte	0xb2c
	.byte	0
	.uleb128 0x11
	.4byte	.LASF1652
	.byte	0x7
	.byte	0xb8
	.4byte	.LASF1653
	.4byte	0x2a1
	.4byte	0x6b5
	.uleb128 0xe
	.4byte	0xb2c
	.uleb128 0xe
	.4byte	0xb2c
	.uleb128 0xe
	.4byte	0xb2c
	.byte	0
	.uleb128 0x11
	.4byte	.LASF1654
	.byte	0x7
	.byte	0xd1
	.4byte	.LASF1655
	.4byte	0x30
	.4byte	0x6d3
	.uleb128 0xe
	.4byte	0xb2c
	.uleb128 0xe
	.4byte	0xb2c
	.byte	0
	.uleb128 0x12
	.ascii	"T\000"
	.4byte	0x29
	.byte	0
	.uleb128 0xa
	.4byte	.LASF1657
	.byte	0x8
	.byte	0x7
	.byte	0x23
	.4byte	0xb15
	.uleb128 0xb
	.ascii	"x\000"
	.byte	0x7
	.byte	0x25
	.4byte	0x30
	.byte	0
	.uleb128 0xb
	.ascii	"y\000"
	.byte	0x7
	.byte	0x25
	.4byte	0x30
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF1596
	.byte	0x7
	.byte	0x28
	.4byte	0xb3e
	.4byte	0x70e
	.4byte	0x714
	.uleb128 0xd
	.4byte	0xb3e
	.byte	0
	.uleb128 0xc
	.4byte	.LASF1596
	.byte	0x7
	.byte	0x2d
	.4byte	0xb3e
	.4byte	0x727
	.4byte	0x737
	.uleb128 0xd
	.4byte	0xb3e
	.uleb128 0xe
	.4byte	0x30
	.uleb128 0xe
	.4byte	0x30
	.byte	0
	.uleb128 0xf
	.4byte	.LASF1597
	.byte	0x7
	.byte	0x32
	.4byte	.LASF1658
	.4byte	0x74a
	.4byte	0x75a
	.uleb128 0xd
	.4byte	0xb3e
	.uleb128 0xe
	.4byte	0x30
	.uleb128 0xe
	.4byte	0x30
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1598
	.byte	0x7
	.byte	0x38
	.4byte	.LASF1659
	.4byte	0xd3
	.4byte	0x771
	.4byte	0x77c
	.uleb128 0xd
	.4byte	0xb44
	.uleb128 0xe
	.4byte	0xb4f
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1599
	.byte	0x7
	.byte	0x3b
	.4byte	.LASF1660
	.4byte	0xd3
	.4byte	0x793
	.4byte	0x79e
	.uleb128 0xd
	.4byte	0xb44
	.uleb128 0xe
	.4byte	0xb4f
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1602
	.byte	0x7
	.byte	0x3e
	.4byte	.LASF1661
	.4byte	0x6db
	.4byte	0x7b5
	.4byte	0x7bb
	.uleb128 0xd
	.4byte	0xb44
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1604
	.byte	0x7
	.byte	0x41
	.4byte	.LASF1662
	.4byte	0x6db
	.4byte	0x7d2
	.4byte	0x7dd
	.uleb128 0xd
	.4byte	0xb44
	.uleb128 0xe
	.4byte	0xb4f
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1602
	.byte	0x7
	.byte	0x44
	.4byte	.LASF1663
	.4byte	0x6db
	.4byte	0x7f4
	.4byte	0x7ff
	.uleb128 0xd
	.4byte	0xb44
	.uleb128 0xe
	.4byte	0xb4f
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1607
	.byte	0x7
	.byte	0x47
	.4byte	.LASF1664
	.4byte	0x6db
	.4byte	0x816
	.4byte	0x821
	.uleb128 0xd
	.4byte	0xb44
	.uleb128 0xe
	.4byte	0x30
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1609
	.byte	0x7
	.byte	0x4a
	.4byte	.LASF1665
	.4byte	0x6db
	.4byte	0x838
	.4byte	0x843
	.uleb128 0xd
	.4byte	0xb44
	.uleb128 0xe
	.4byte	0x30
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1611
	.byte	0x7
	.byte	0x4d
	.4byte	.LASF1666
	.4byte	0xb55
	.4byte	0x85a
	.4byte	0x865
	.uleb128 0xd
	.4byte	0xb3e
	.uleb128 0xe
	.4byte	0xb4f
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1613
	.byte	0x7
	.byte	0x50
	.4byte	.LASF1667
	.4byte	0xb55
	.4byte	0x87c
	.4byte	0x887
	.uleb128 0xd
	.4byte	0xb3e
	.uleb128 0xe
	.4byte	0xb4f
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1615
	.byte	0x7
	.byte	0x53
	.4byte	.LASF1668
	.4byte	0xb55
	.4byte	0x89e
	.4byte	0x8a9
	.uleb128 0xd
	.4byte	0xb3e
	.uleb128 0xe
	.4byte	0x30
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1617
	.byte	0x7
	.byte	0x56
	.4byte	.LASF1669
	.4byte	0xb55
	.4byte	0x8c0
	.4byte	0x8cb
	.uleb128 0xd
	.4byte	0xb3e
	.uleb128 0xe
	.4byte	0x30
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1607
	.byte	0x7
	.byte	0x59
	.4byte	.LASF1670
	.4byte	0x30
	.4byte	0x8e2
	.4byte	0x8ed
	.uleb128 0xd
	.4byte	0xb44
	.uleb128 0xe
	.4byte	0xb4f
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1620
	.byte	0x7
	.byte	0x5c
	.4byte	.LASF1671
	.4byte	0x30
	.4byte	0x904
	.4byte	0x90f
	.uleb128 0xd
	.4byte	0xb44
	.uleb128 0xe
	.4byte	0xb4f
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1622
	.byte	0x7
	.byte	0x5f
	.4byte	.LASF1672
	.4byte	0x30
	.4byte	0x926
	.4byte	0x931
	.uleb128 0xd
	.4byte	0xb44
	.uleb128 0xe
	.4byte	0xb4f
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1622
	.byte	0x7
	.byte	0x62
	.4byte	.LASF1673
	.4byte	0x30
	.4byte	0x948
	.4byte	0x94e
	.uleb128 0xd
	.4byte	0xb44
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1625
	.byte	0x7
	.byte	0x65
	.4byte	.LASF1674
	.4byte	0xd3
	.4byte	0x965
	.4byte	0x96b
	.uleb128 0xd
	.4byte	0xb44
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1627
	.byte	0x7
	.byte	0x68
	.4byte	.LASF1675
	.4byte	0xd3
	.4byte	0x982
	.4byte	0x988
	.uleb128 0xd
	.4byte	0xb44
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1629
	.byte	0x7
	.byte	0x6b
	.4byte	.LASF1676
	.4byte	0xd3
	.4byte	0x99f
	.4byte	0x9a5
	.uleb128 0xd
	.4byte	0xb44
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1631
	.byte	0x7
	.byte	0x6d
	.4byte	.LASF1677
	.4byte	0xb15
	.4byte	0x9bc
	.4byte	0x9c7
	.uleb128 0xd
	.4byte	0xb44
	.uleb128 0xe
	.4byte	0x192
	.byte	0
	.uleb128 0xf
	.4byte	.LASF1633
	.byte	0x7
	.byte	0x76
	.4byte	.LASF1678
	.4byte	0x9da
	.4byte	0x9e0
	.uleb128 0xd
	.4byte	0xb3e
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1636
	.byte	0x7
	.byte	0x7c
	.4byte	.LASF1679
	.4byte	0x30
	.4byte	0x9f7
	.4byte	0x9fd
	.uleb128 0xd
	.4byte	0xb44
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1638
	.byte	0x7
	.byte	0x82
	.4byte	.LASF1680
	.4byte	0x30
	.4byte	0xa14
	.4byte	0xa1a
	.uleb128 0xd
	.4byte	0xb44
	.byte	0
	.uleb128 0xf
	.4byte	.LASF1640
	.byte	0x7
	.byte	0x85
	.4byte	.LASF1681
	.4byte	0xa2d
	.4byte	0xa33
	.uleb128 0xd
	.4byte	0xb3e
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1642
	.byte	0x7
	.byte	0x8b
	.4byte	.LASF1682
	.4byte	0x6db
	.4byte	0xa4a
	.4byte	0xa50
	.uleb128 0xd
	.4byte	0xb44
	.byte	0
	.uleb128 0xf
	.4byte	.LASF1644
	.byte	0x7
	.byte	0x91
	.4byte	.LASF1683
	.4byte	0xa63
	.4byte	0xa6e
	.uleb128 0xd
	.4byte	0xb3e
	.uleb128 0xe
	.4byte	0xb4f
	.byte	0
	.uleb128 0xf
	.4byte	.LASF1646
	.byte	0x7
	.byte	0x99
	.4byte	.LASF1684
	.4byte	0xa81
	.4byte	0xa8c
	.uleb128 0xd
	.4byte	0xb3e
	.uleb128 0xe
	.4byte	0xb4f
	.byte	0
	.uleb128 0x10
	.4byte	.LASF1648
	.byte	0x7
	.byte	0x9f
	.4byte	.LASF1685
	.4byte	0x6db
	.4byte	0xaa3
	.4byte	0xaae
	.uleb128 0xd
	.4byte	0xb3e
	.uleb128 0xe
	.4byte	0xb4f
	.byte	0
	.uleb128 0x11
	.4byte	.LASF1650
	.byte	0x7
	.byte	0xa6
	.4byte	.LASF1686
	.4byte	0x6db
	.4byte	0xacc
	.uleb128 0xe
	.4byte	0xb4f
	.uleb128 0xe
	.4byte	0xb4f
	.byte	0
	.uleb128 0x11
	.4byte	.LASF1652
	.byte	0x7
	.byte	0xb8
	.4byte	.LASF1687
	.4byte	0x6db
	.4byte	0xaef
	.uleb128 0xe
	.4byte	0xb4f
	.uleb128 0xe
	.4byte	0xb4f
	.uleb128 0xe
	.4byte	0xb4f
	.byte	0
	.uleb128 0x11
	.4byte	.LASF1654
	.byte	0x7
	.byte	0xd1
	.4byte	.LASF1688
	.4byte	0x30
	.4byte	0xb0d
	.uleb128 0xe
	.4byte	0xb4f
	.uleb128 0xe
	.4byte	0xb4f
	.byte	0
	.uleb128 0x12
	.ascii	"T\000"
	.4byte	0x30
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.4byte	0x297
	.uleb128 0x14
	.byte	0x4
	.4byte	0x2a1
	.uleb128 0x14
	.byte	0x4
	.4byte	0xb27
	.uleb128 0x7
	.4byte	0x2a1
	.uleb128 0x13
	.byte	0x4
	.4byte	0xb27
	.uleb128 0x13
	.byte	0x4
	.4byte	0x2a1
	.uleb128 0x13
	.byte	0x4
	.4byte	0xda
	.uleb128 0x14
	.byte	0x4
	.4byte	0x6db
	.uleb128 0x14
	.byte	0x4
	.4byte	0xb4a
	.uleb128 0x7
	.4byte	0x6db
	.uleb128 0x13
	.byte	0x4
	.4byte	0xb4a
	.uleb128 0x13
	.byte	0x4
	.4byte	0x6db
	.uleb128 0x15
	.4byte	.LASF1693
	.byte	0x1
	.byte	0x26
	.4byte	.LASF1695
	.4byte	0xd3
	.4byte	.LFB432
	.4byte	.LFE432-.LFB432
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc70
	.uleb128 0x12
	.ascii	"T\000"
	.4byte	0x29
	.uleb128 0x16
	.ascii	"P\000"
	.byte	0x1
	.byte	0x26
	.4byte	0xc70
	.4byte	.LLST0
	.uleb128 0x17
	.ascii	"V\000"
	.byte	0x1
	.byte	0x26
	.4byte	0xb21
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x17
	.ascii	"n\000"
	.byte	0x1
	.byte	0x26
	.4byte	0x110
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x18
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x19
	.ascii	"i\000"
	.byte	0x1
	.byte	0x28
	.4byte	0x110
	.4byte	.LLST1
	.uleb128 0x19
	.ascii	"j\000"
	.byte	0x1
	.byte	0x28
	.4byte	0x110
	.4byte	.LLST2
	.uleb128 0x1a
	.4byte	.LASF1689
	.byte	0x1
	.byte	0x29
	.4byte	0xd3
	.4byte	.LLST3
	.uleb128 0x18
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x19
	.ascii	"dx1\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0x1b3
	.4byte	.LLST4
	.uleb128 0x19
	.ascii	"dx2\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0x1b3
	.4byte	.LLST5
	.uleb128 0x19
	.ascii	"dy1\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0x1b3
	.4byte	.LLST6
	.uleb128 0x19
	.ascii	"dy2\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0x1b3
	.4byte	.LLST7
	.uleb128 0x1a
	.4byte	.LASF1690
	.byte	0x1
	.byte	0x33
	.4byte	0x187
	.4byte	.LLST8
	.uleb128 0x1a
	.4byte	.LASF1691
	.byte	0x1
	.byte	0x33
	.4byte	0x187
	.4byte	.LLST9
	.uleb128 0x1a
	.4byte	.LASF1692
	.byte	0x1
	.byte	0x33
	.4byte	0x187
	.4byte	.LLST10
	.uleb128 0x1b
	.4byte	.LASF1699
	.byte	0x1
	.byte	0x33
	.4byte	0x187
	.uleb128 0x19
	.ascii	"m1\000"
	.byte	0x1
	.byte	0x33
	.4byte	0x187
	.4byte	.LLST11
	.uleb128 0x19
	.ascii	"m2\000"
	.byte	0x1
	.byte	0x33
	.4byte	0x187
	.4byte	.LLST12
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	0xb2c
	.uleb128 0x15
	.4byte	.LASF1694
	.byte	0x1
	.byte	0x59
	.4byte	.LASF1696
	.4byte	0xd3
	.4byte	.LFB433
	.4byte	.LFE433-.LFB433
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcd8
	.uleb128 0x12
	.ascii	"T\000"
	.4byte	0x29
	.uleb128 0x16
	.ascii	"V\000"
	.byte	0x1
	.byte	0x59
	.4byte	0xb21
	.4byte	.LLST13
	.uleb128 0x16
	.ascii	"n\000"
	.byte	0x1
	.byte	0x59
	.4byte	0x110
	.4byte	.LLST14
	.uleb128 0x1c
	.4byte	.LVL26
	.4byte	0x320
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xf
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x23
	.uleb128 0x1fffffff
	.byte	0x33
	.byte	0x24
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF1697
	.byte	0x1
	.byte	0x26
	.4byte	.LASF1698
	.4byte	0xd3
	.4byte	.LFB434
	.4byte	.LFE434-.LFB434
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xded
	.uleb128 0x12
	.ascii	"T\000"
	.4byte	0x30
	.uleb128 0x16
	.ascii	"P\000"
	.byte	0x1
	.byte	0x26
	.4byte	0xded
	.4byte	.LLST15
	.uleb128 0x17
	.ascii	"V\000"
	.byte	0x1
	.byte	0x26
	.4byte	0xb44
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x17
	.ascii	"n\000"
	.byte	0x1
	.byte	0x26
	.4byte	0x110
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x18
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x19
	.ascii	"i\000"
	.byte	0x1
	.byte	0x28
	.4byte	0x110
	.4byte	.LLST16
	.uleb128 0x19
	.ascii	"j\000"
	.byte	0x1
	.byte	0x28
	.4byte	0x110
	.4byte	.LLST17
	.uleb128 0x1a
	.4byte	.LASF1689
	.byte	0x1
	.byte	0x29
	.4byte	0xd3
	.4byte	.LLST18
	.uleb128 0x18
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.uleb128 0x19
	.ascii	"dx1\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0x1b3
	.4byte	.LLST19
	.uleb128 0x19
	.ascii	"dx2\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0x1b3
	.4byte	.LLST20
	.uleb128 0x19
	.ascii	"dy1\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0x1b3
	.4byte	.LLST21
	.uleb128 0x19
	.ascii	"dy2\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0x1b3
	.4byte	.LLST22
	.uleb128 0x1a
	.4byte	.LASF1690
	.byte	0x1
	.byte	0x33
	.4byte	0x187
	.4byte	.LLST23
	.uleb128 0x1a
	.4byte	.LASF1691
	.byte	0x1
	.byte	0x33
	.4byte	0x187
	.4byte	.LLST24
	.uleb128 0x1a
	.4byte	.LASF1692
	.byte	0x1
	.byte	0x33
	.4byte	0x187
	.4byte	.LLST25
	.uleb128 0x1b
	.4byte	.LASF1699
	.byte	0x1
	.byte	0x33
	.4byte	0x187
	.uleb128 0x19
	.ascii	"m1\000"
	.byte	0x1
	.byte	0x33
	.4byte	0x187
	.4byte	.LLST26
	.uleb128 0x19
	.ascii	"m2\000"
	.byte	0x1
	.byte	0x33
	.4byte	0x187
	.4byte	.LLST27
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	0xb4f
	.uleb128 0x1e
	.4byte	.LASF1705
	.byte	0x1
	.byte	0x59
	.4byte	.LASF1706
	.4byte	0xd3
	.4byte	.LFB435
	.4byte	.LFE435-.LFB435
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.ascii	"T\000"
	.4byte	0x30
	.uleb128 0x16
	.ascii	"V\000"
	.byte	0x1
	.byte	0x59
	.4byte	0xb44
	.4byte	.LLST28
	.uleb128 0x16
	.ascii	"n\000"
	.byte	0x1
	.byte	0x59
	.4byte	0x110
	.4byte	.LLST29
	.uleb128 0x1c
	.4byte	.LVL52
	.4byte	0x75a
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xf
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x23
	.uleb128 0x1fffffff
	.byte	0x33
	.byte	0x24
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x22
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x2119
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x3b
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2f
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL22
	.4byte	.LFE432
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL20
	.4byte	.LVL21
	.2byte	0x3
	.byte	0x7e
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL21
	.4byte	.LFE432
	.2byte	0x1
	.byte	0x5e
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL1
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL20
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL21
	.4byte	.LFE432
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LFE432
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL3
	.4byte	.LVL5
	.2byte	0x6
	.byte	0x76
	.sleb128 0
	.byte	0x74
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL14
	.4byte	.LVL16
	.2byte	0xd
	.byte	0x70
	.sleb128 0
	.byte	0x6
	.byte	0x7e
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x71
	.sleb128 0
	.byte	0x22
	.byte	0x6
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL17
	.4byte	.LVL20
	.2byte	0xd
	.byte	0x70
	.sleb128 0
	.byte	0x6
	.byte	0x7e
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x71
	.sleb128 0
	.byte	0x22
	.byte	0x6
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL4
	.4byte	.LVL6
	.2byte	0x6
	.byte	0x7c
	.sleb128 0
	.byte	0x74
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL16
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL4
	.4byte	.LVL9
	.2byte	0x6
	.byte	0x79
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL7
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL7
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL8
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL10
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL12
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL13
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL24
	.4byte	.LVL26-1
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL26-1
	.4byte	.LVL26
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL26
	.4byte	.LVL27
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL27
	.4byte	.LFE433
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL23
	.4byte	.LVL25
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL25
	.4byte	.LVL26
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL26
	.4byte	.LFE433
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL28
	.4byte	.LVL48
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL48
	.4byte	.LFE434
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL28
	.4byte	.LVL30
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL30
	.4byte	.LVL46
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL46
	.4byte	.LVL47
	.2byte	0x3
	.byte	0x7e
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL47
	.4byte	.LFE434
	.2byte	0x1
	.byte	0x5e
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL29
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL46
	.4byte	.LVL47
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL47
	.4byte	.LFE434
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL28
	.4byte	.LVL30
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL30
	.4byte	.LFE434
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL32
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL40
	.4byte	.LVL42
	.2byte	0x8
	.byte	0xf5
	.uleb128 0x4b
	.uleb128 0x30
	.byte	0xf7
	.uleb128 0x29
	.byte	0xf7
	.uleb128 0
	.byte	0x9f
	.4byte	.LVL42
	.4byte	.LVL43
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL43
	.4byte	.LVL46
	.2byte	0x8
	.byte	0xf5
	.uleb128 0x4b
	.uleb128 0x30
	.byte	0xf7
	.uleb128 0x29
	.byte	0xf7
	.uleb128 0
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL33
	.4byte	.LVL41
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL41
	.4byte	.LVL42
	.2byte	0x2
	.byte	0x90
	.uleb128 0x4c
	.4byte	.LVL42
	.4byte	.LVL44
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL44
	.4byte	.LVL46
	.2byte	0x2
	.byte	0x90
	.uleb128 0x4c
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL33
	.4byte	.LVL46
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL34
	.4byte	.LVL46
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL34
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL35
	.4byte	.LVL39
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL36
	.4byte	.LVL46
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST26:
	.4byte	.LVL38
	.4byte	.LVL45
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST27:
	.4byte	.LVL39
	.4byte	.LVL45
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST28:
	.4byte	.LVL49
	.4byte	.LVL50
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL50
	.4byte	.LVL52-1
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL52-1
	.4byte	.LVL52
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL52
	.4byte	.LVL53
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL53
	.4byte	.LFE435
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST29:
	.4byte	.LVL49
	.4byte	.LVL51
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL51
	.4byte	.LVL52
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL52
	.4byte	.LFE435
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x34
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB432
	.4byte	.LFE432-.LFB432
	.4byte	.LFB433
	.4byte	.LFE433-.LFB433
	.4byte	.LFB434
	.4byte	.LFE434-.LFB434
	.4byte	.LFB435
	.4byte	.LFE435-.LFB435
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB432
	.4byte	.LFE432
	.4byte	.LFB433
	.4byte	.LFE433
	.4byte	.LFB434
	.4byte	.LFE434
	.4byte	.LFB435
	.4byte	.LFE435
	.4byte	0
	.4byte	0
	.section	.debug_macro,"",%progbits
.Ldebug_macro0:
	.2byte	0x4
	.byte	0x2
	.4byte	.Ldebug_line0
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF0
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x5
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x5
	.uleb128 0x4
	.4byte	.LASF3
	.byte	0x5
	.uleb128 0x5
	.4byte	.LASF4
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF5
	.byte	0x5
	.uleb128 0x7
	.4byte	.LASF6
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF7
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF8
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF9
	.byte	0x5
	.uleb128 0xb
	.4byte	.LASF10
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF11
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF12
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF13
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF14
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF15
	.byte	0x5
	.uleb128 0x11
	.4byte	.LASF16
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF17
	.byte	0x5
	.uleb128 0x13
	.4byte	.LASF18
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF20
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF21
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF22
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF23
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF24
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF25
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF26
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF27
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF28
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF29
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF30
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF31
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF32
	.byte	0x5
	.uleb128 0x22
	.4byte	.LASF33
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF34
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF35
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF36
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF37
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF38
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF39
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF40
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF41
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF42
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF43
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF44
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF45
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF46
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF47
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF48
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF49
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF50
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF51
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF52
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF53
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF54
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF55
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF56
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF57
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF58
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF59
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF60
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF61
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF62
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF63
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF64
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF65
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF66
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF67
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF68
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF69
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF70
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF71
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF72
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF73
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF74
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF75
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF76
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF77
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF78
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF79
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF80
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF81
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF82
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF83
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF84
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF85
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF86
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF87
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF88
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF89
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF90
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF91
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF92
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF93
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF94
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF95
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF96
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF97
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF98
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF99
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF100
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF101
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF102
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF103
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF104
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF105
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF106
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF107
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF108
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF109
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF110
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF111
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF112
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF113
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF114
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF115
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF116
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF117
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF118
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF119
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF120
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF121
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF122
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF123
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF124
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF125
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF126
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF127
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF128
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF129
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF130
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF131
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF132
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF133
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF134
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF135
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF136
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF137
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF138
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF139
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF140
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF141
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF142
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF143
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF144
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF145
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF146
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF147
	.byte	0x5
	.uleb128 0x95
	.4byte	.LASF148
	.byte	0x5
	.uleb128 0x96
	.4byte	.LASF149
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF150
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF151
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF152
	.byte	0x5
	.uleb128 0x9a
	.4byte	.LASF153
	.byte	0x5
	.uleb128 0x9b
	.4byte	.LASF154
	.byte	0x5
	.uleb128 0x9c
	.4byte	.LASF155
	.byte	0x5
	.uleb128 0x9d
	.4byte	.LASF156
	.byte	0x5
	.uleb128 0x9e
	.4byte	.LASF157
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF158
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF159
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF160
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF161
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF162
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF163
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF164
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF165
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF166
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF167
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF168
	.byte	0x5
	.uleb128 0xaa
	.4byte	.LASF169
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF170
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF171
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF172
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF173
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF174
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF175
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF176
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF177
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF178
	.byte	0x5
	.uleb128 0xb4
	.4byte	.LASF179
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF180
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF181
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF182
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF183
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF184
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF185
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF186
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF187
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF188
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF189
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF190
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF191
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF192
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF193
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF194
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF195
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF196
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF197
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF198
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF199
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF200
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF201
	.byte	0x5
	.uleb128 0xcb
	.4byte	.LASF202
	.byte	0x5
	.uleb128 0xcc
	.4byte	.LASF203
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF204
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF205
	.byte	0x5
	.uleb128 0xcf
	.4byte	.LASF206
	.byte	0x5
	.uleb128 0xd0
	.4byte	.LASF207
	.byte	0x5
	.uleb128 0xd1
	.4byte	.LASF208
	.byte	0x5
	.uleb128 0xd2
	.4byte	.LASF209
	.byte	0x5
	.uleb128 0xd3
	.4byte	.LASF210
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF211
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF212
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF213
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF214
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF215
	.byte	0x5
	.uleb128 0xd9
	.4byte	.LASF216
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF217
	.byte	0x5
	.uleb128 0xdb
	.4byte	.LASF218
	.byte	0x5
	.uleb128 0xdc
	.4byte	.LASF219
	.byte	0x5
	.uleb128 0xdd
	.4byte	.LASF220
	.byte	0x5
	.uleb128 0xde
	.4byte	.LASF221
	.byte	0x5
	.uleb128 0xdf
	.4byte	.LASF222
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF223
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF224
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF225
	.byte	0x5
	.uleb128 0xe3
	.4byte	.LASF226
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF227
	.byte	0x5
	.uleb128 0xe5
	.4byte	.LASF228
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF229
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF230
	.byte	0x5
	.uleb128 0xe8
	.4byte	.LASF231
	.byte	0x5
	.uleb128 0xe9
	.4byte	.LASF232
	.byte	0x5
	.uleb128 0xea
	.4byte	.LASF233
	.byte	0x5
	.uleb128 0xeb
	.4byte	.LASF234
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF235
	.byte	0x5
	.uleb128 0xed
	.4byte	.LASF236
	.byte	0x5
	.uleb128 0xee
	.4byte	.LASF237
	.byte	0x5
	.uleb128 0xef
	.4byte	.LASF238
	.byte	0x5
	.uleb128 0xf0
	.4byte	.LASF239
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF240
	.byte	0x5
	.uleb128 0xf2
	.4byte	.LASF241
	.byte	0x5
	.uleb128 0xf3
	.4byte	.LASF242
	.byte	0x5
	.uleb128 0xf4
	.4byte	.LASF243
	.byte	0x5
	.uleb128 0xf5
	.4byte	.LASF244
	.byte	0x5
	.uleb128 0xf6
	.4byte	.LASF245
	.byte	0x5
	.uleb128 0xf7
	.4byte	.LASF246
	.byte	0x5
	.uleb128 0xf8
	.4byte	.LASF247
	.byte	0x5
	.uleb128 0xf9
	.4byte	.LASF248
	.byte	0x5
	.uleb128 0xfa
	.4byte	.LASF249
	.byte	0x5
	.uleb128 0xfb
	.4byte	.LASF250
	.byte	0x5
	.uleb128 0xfc
	.4byte	.LASF251
	.byte	0x5
	.uleb128 0xfd
	.4byte	.LASF252
	.byte	0x5
	.uleb128 0xfe
	.4byte	.LASF253
	.byte	0x5
	.uleb128 0xff
	.4byte	.LASF254
	.byte	0x5
	.uleb128 0x100
	.4byte	.LASF255
	.byte	0x5
	.uleb128 0x101
	.4byte	.LASF256
	.byte	0x5
	.uleb128 0x102
	.4byte	.LASF257
	.byte	0x5
	.uleb128 0x103
	.4byte	.LASF258
	.byte	0x5
	.uleb128 0x104
	.4byte	.LASF259
	.byte	0x5
	.uleb128 0x105
	.4byte	.LASF260
	.byte	0x5
	.uleb128 0x106
	.4byte	.LASF261
	.byte	0x5
	.uleb128 0x107
	.4byte	.LASF262
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF263
	.byte	0x5
	.uleb128 0x109
	.4byte	.LASF264
	.byte	0x5
	.uleb128 0x10a
	.4byte	.LASF265
	.byte	0x5
	.uleb128 0x10b
	.4byte	.LASF266
	.byte	0x5
	.uleb128 0x10c
	.4byte	.LASF267
	.byte	0x5
	.uleb128 0x10d
	.4byte	.LASF268
	.byte	0x5
	.uleb128 0x10e
	.4byte	.LASF269
	.byte	0x5
	.uleb128 0x10f
	.4byte	.LASF270
	.byte	0x5
	.uleb128 0x110
	.4byte	.LASF271
	.byte	0x5
	.uleb128 0x111
	.4byte	.LASF272
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF273
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF274
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF275
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF276
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF277
	.byte	0x5
	.uleb128 0x117
	.4byte	.LASF278
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF279
	.byte	0x5
	.uleb128 0x119
	.4byte	.LASF280
	.byte	0x5
	.uleb128 0x11a
	.4byte	.LASF281
	.byte	0x5
	.uleb128 0x11b
	.4byte	.LASF282
	.byte	0x5
	.uleb128 0x11c
	.4byte	.LASF283
	.byte	0x5
	.uleb128 0x11d
	.4byte	.LASF284
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF285
	.byte	0x5
	.uleb128 0x11f
	.4byte	.LASF286
	.byte	0x5
	.uleb128 0x120
	.4byte	.LASF287
	.byte	0x5
	.uleb128 0x121
	.4byte	.LASF288
	.byte	0x5
	.uleb128 0x122
	.4byte	.LASF289
	.byte	0x5
	.uleb128 0x123
	.4byte	.LASF290
	.byte	0x5
	.uleb128 0x124
	.4byte	.LASF291
	.byte	0x5
	.uleb128 0x125
	.4byte	.LASF292
	.byte	0x5
	.uleb128 0x126
	.4byte	.LASF293
	.byte	0x5
	.uleb128 0x127
	.4byte	.LASF294
	.byte	0x5
	.uleb128 0x128
	.4byte	.LASF295
	.byte	0x5
	.uleb128 0x129
	.4byte	.LASF296
	.byte	0x5
	.uleb128 0x12a
	.4byte	.LASF297
	.byte	0x5
	.uleb128 0x12b
	.4byte	.LASF298
	.byte	0x5
	.uleb128 0x12c
	.4byte	.LASF299
	.byte	0x5
	.uleb128 0x12d
	.4byte	.LASF300
	.byte	0x5
	.uleb128 0x12e
	.4byte	.LASF301
	.byte	0x5
	.uleb128 0x12f
	.4byte	.LASF302
	.byte	0x5
	.uleb128 0x130
	.4byte	.LASF303
	.byte	0x5
	.uleb128 0x131
	.4byte	.LASF304
	.byte	0x5
	.uleb128 0x132
	.4byte	.LASF305
	.byte	0x5
	.uleb128 0x133
	.4byte	.LASF306
	.byte	0x5
	.uleb128 0x134
	.4byte	.LASF307
	.byte	0x5
	.uleb128 0x135
	.4byte	.LASF308
	.byte	0x5
	.uleb128 0x136
	.4byte	.LASF309
	.byte	0x5
	.uleb128 0x137
	.4byte	.LASF310
	.byte	0x5
	.uleb128 0x138
	.4byte	.LASF311
	.byte	0x5
	.uleb128 0x139
	.4byte	.LASF312
	.byte	0x5
	.uleb128 0x13a
	.4byte	.LASF313
	.byte	0x5
	.uleb128 0x13b
	.4byte	.LASF314
	.byte	0x5
	.uleb128 0x13c
	.4byte	.LASF315
	.byte	0x5
	.uleb128 0x13d
	.4byte	.LASF316
	.byte	0x5
	.uleb128 0x13e
	.4byte	.LASF317
	.byte	0x5
	.uleb128 0x13f
	.4byte	.LASF318
	.byte	0x5
	.uleb128 0x140
	.4byte	.LASF319
	.byte	0x5
	.uleb128 0x141
	.4byte	.LASF320
	.byte	0x5
	.uleb128 0x142
	.4byte	.LASF321
	.byte	0x5
	.uleb128 0x143
	.4byte	.LASF322
	.byte	0x5
	.uleb128 0x144
	.4byte	.LASF323
	.byte	0x5
	.uleb128 0x145
	.4byte	.LASF324
	.byte	0x5
	.uleb128 0x146
	.4byte	.LASF325
	.byte	0x5
	.uleb128 0x147
	.4byte	.LASF326
	.byte	0x5
	.uleb128 0x148
	.4byte	.LASF327
	.byte	0x5
	.uleb128 0x149
	.4byte	.LASF328
	.byte	0x5
	.uleb128 0x14a
	.4byte	.LASF329
	.byte	0x5
	.uleb128 0x14b
	.4byte	.LASF330
	.byte	0x5
	.uleb128 0x14c
	.4byte	.LASF331
	.byte	0x5
	.uleb128 0x14d
	.4byte	.LASF332
	.byte	0x5
	.uleb128 0x14e
	.4byte	.LASF333
	.byte	0x5
	.uleb128 0x14f
	.4byte	.LASF334
	.byte	0x5
	.uleb128 0x150
	.4byte	.LASF335
	.byte	0x5
	.uleb128 0x151
	.4byte	.LASF336
	.byte	0x5
	.uleb128 0x152
	.4byte	.LASF337
	.byte	0x5
	.uleb128 0x153
	.4byte	.LASF338
	.byte	0x5
	.uleb128 0x154
	.4byte	.LASF339
	.byte	0x5
	.uleb128 0x155
	.4byte	.LASF340
	.byte	0x5
	.uleb128 0x156
	.4byte	.LASF341
	.byte	0x5
	.uleb128 0x157
	.4byte	.LASF342
	.byte	0x5
	.uleb128 0x158
	.4byte	.LASF343
	.byte	0x5
	.uleb128 0x159
	.4byte	.LASF344
	.byte	0x5
	.uleb128 0x15a
	.4byte	.LASF345
	.byte	0x5
	.uleb128 0x15b
	.4byte	.LASF346
	.byte	0x5
	.uleb128 0x15c
	.4byte	.LASF347
	.byte	0x5
	.uleb128 0x15d
	.4byte	.LASF348
	.byte	0x5
	.uleb128 0x15e
	.4byte	.LASF349
	.byte	0x5
	.uleb128 0x15f
	.4byte	.LASF350
	.byte	0x5
	.uleb128 0x160
	.4byte	.LASF351
	.byte	0x5
	.uleb128 0x161
	.4byte	.LASF352
	.byte	0x5
	.uleb128 0x162
	.4byte	.LASF353
	.byte	0x5
	.uleb128 0x163
	.4byte	.LASF354
	.byte	0x5
	.uleb128 0x164
	.4byte	.LASF355
	.byte	0x5
	.uleb128 0x165
	.4byte	.LASF356
	.byte	0x5
	.uleb128 0x166
	.4byte	.LASF357
	.byte	0x5
	.uleb128 0x167
	.4byte	.LASF358
	.byte	0x5
	.uleb128 0x168
	.4byte	.LASF359
	.byte	0x5
	.uleb128 0x169
	.4byte	.LASF360
	.byte	0x5
	.uleb128 0x16a
	.4byte	.LASF361
	.byte	0x5
	.uleb128 0x16b
	.4byte	.LASF362
	.byte	0x5
	.uleb128 0x16c
	.4byte	.LASF363
	.byte	0x5
	.uleb128 0x16d
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0x16e
	.4byte	.LASF365
	.byte	0x5
	.uleb128 0x16f
	.4byte	.LASF366
	.byte	0x5
	.uleb128 0x170
	.4byte	.LASF367
	.byte	0x5
	.uleb128 0x171
	.4byte	.LASF368
	.byte	0x5
	.uleb128 0x172
	.4byte	.LASF369
	.byte	0x5
	.uleb128 0x173
	.4byte	.LASF370
	.byte	0x5
	.uleb128 0x174
	.4byte	.LASF371
	.byte	0x5
	.uleb128 0x175
	.4byte	.LASF372
	.byte	0x5
	.uleb128 0x176
	.4byte	.LASF373
	.byte	0x5
	.uleb128 0x177
	.4byte	.LASF374
	.byte	0x5
	.uleb128 0x178
	.4byte	.LASF375
	.byte	0x5
	.uleb128 0x179
	.4byte	.LASF376
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF377
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF378
	.byte	0x5
	.uleb128 0x3
	.4byte	.LASF379
	.byte	0x5
	.uleb128 0x4
	.4byte	.LASF380
	.byte	0x5
	.uleb128 0x5
	.4byte	.LASF381
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF382
	.byte	0x5
	.uleb128 0x7
	.4byte	.LASF383
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF384
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF385
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF386
	.byte	0x5
	.uleb128 0xb
	.4byte	.LASF387
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF388
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF389
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF390
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF391
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF392
	.byte	0x5
	.uleb128 0x11
	.4byte	.LASF393
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF394
	.byte	0x5
	.uleb128 0x13
	.4byte	.LASF395
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF396
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF397
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF398
	.file 10 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/modules/PX4Firmware/src/include/visibility.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0xa
	.byte	0x7
	.4byte	.Ldebug_macro1
	.byte	0x4
	.file 11 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_Math/AP_Math.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xb
	.file 12 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_Common/missing/cmath"
	.byte	0x3
	.uleb128 0x3
	.uleb128 0xc
	.file 13 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/modules/PX4Firmware/Build/px4fmu-v2_APM.build/nuttx-export/include/cxx/cmath"
	.byte	0x3
	.uleb128 0x3
	.uleb128 0xd
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF404
	.file 14 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/modules/PX4Firmware/Build/px4fmu-v2_APM.build/nuttx-export/include/nuttx/config.h"
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0xe
	.byte	0x7
	.4byte	.Ldebug_macro2
	.byte	0x4
	.file 15 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/modules/PX4Firmware/Build/px4fmu-v2_APM.build/nuttx-export/include/nuttx/compiler.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0xf
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.file 16 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/modules/PX4Firmware/Build/px4fmu-v2_APM.build/nuttx-export/include/math.h"
	.byte	0x3
	.uleb128 0x2e
	.uleb128 0x10
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF761
	.byte	0x3
	.uleb128 0x34
	.uleb128 0x3
	.byte	0x5
	.uleb128 0x3
	.4byte	.LASF762
	.file 17 "/usr/local/gcc-arm-none-eabi-4_9-2014q4/arm-none-eabi/include/machine/ieeefp.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x11
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF763
	.byte	0x4
	.file 18 "/usr/local/gcc-arm-none-eabi-4_9-2014q4/arm-none-eabi/include/_ansi.h"
	.byte	0x3
	.uleb128 0x6
	.uleb128 0x12
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF764
	.file 19 "/usr/local/gcc-arm-none-eabi-4_9-2014q4/arm-none-eabi/include/newlib.h"
	.byte	0x3
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x7
	.4byte	.Ldebug_macro4
	.byte	0x4
	.file 20 "/usr/local/gcc-arm-none-eabi-4_9-2014q4/arm-none-eabi/include/sys/config.h"
	.byte	0x3
	.uleb128 0x10
	.uleb128 0x14
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF779
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x11
	.byte	0x4
	.file 21 "/usr/local/gcc-arm-none-eabi-4_9-2014q4/arm-none-eabi/include/sys/features.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x15
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro6
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro7
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro8
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF908
	.byte	0x4
	.file 22 "/usr/local/gcc-arm-none-eabi-4_9-2014q4/arm-none-eabi/include/c++/4.9.3/limits"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x16
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF909
	.file 23 "/usr/local/gcc-arm-none-eabi-4_9-2014q4/arm-none-eabi/include/c++/4.9.3/arm-none-eabi/armv7e-m/fpu/bits/c++config.h"
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0x17
	.byte	0x7
	.4byte	.Ldebug_macro9
	.file 24 "/usr/local/gcc-arm-none-eabi-4_9-2014q4/arm-none-eabi/include/c++/4.9.3/arm-none-eabi/armv7e-m/fpu/bits/os_defines.h"
	.byte	0x3
	.uleb128 0x1ae
	.uleb128 0x18
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF946
	.byte	0x4
	.file 25 "/usr/local/gcc-arm-none-eabi-4_9-2014q4/arm-none-eabi/include/c++/4.9.3/arm-none-eabi/armv7e-m/fpu/bits/cpu_defines.h"
	.byte	0x3
	.uleb128 0x1b1
	.uleb128 0x19
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF947
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro10
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro11
	.byte	0x4
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF1093
	.byte	0x3
	.uleb128 0x31
	.uleb128 0x4
	.byte	0x7
	.4byte	.Ldebug_macro12
	.byte	0x4
	.file 26 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/modules/PX4Firmware/Build/px4fmu-v2_APM.build/nuttx-export/include/limits.h"
	.byte	0x3
	.uleb128 0x32
	.uleb128 0x1a
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF1096
	.file 27 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/modules/PX4Firmware/Build/px4fmu-v2_APM.build/nuttx-export/include/arch/limits.h"
	.byte	0x3
	.uleb128 0x2f
	.uleb128 0x1b
	.byte	0x7
	.4byte	.Ldebug_macro13
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro14
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro15
	.byte	0x4
	.file 28 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_Common/missing/type_traits"
	.byte	0x3
	.uleb128 0x6
	.uleb128 0x1c
	.file 29 "/usr/local/gcc-arm-none-eabi-4_9-2014q4/arm-none-eabi/include/c++/4.9.3/type_traits"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x1d
	.byte	0x7
	.4byte	.Ldebug_macro16
	.byte	0x4
	.byte	0x4
	.file 30 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_Common/AP_Common.h"
	.byte	0x3
	.uleb128 0x8
	.uleb128 0x1e
	.file 31 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/AP_HAL_Boards.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x1f
	.byte	0x7
	.4byte	.Ldebug_macro17
	.file 32 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/board/px4.h"
	.byte	0x3
	.uleb128 0x83
	.uleb128 0x20
	.byte	0x7
	.4byte	.Ldebug_macro18
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro19
	.byte	0x4
	.file 33 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/modules/PX4Firmware/Build/px4fmu-v2_APM.build/nuttx-export/include/stdlib.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x21
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF1338
	.byte	0x3
	.uleb128 0x2d
	.uleb128 0x6
	.byte	0x7
	.4byte	.Ldebug_macro20
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro21
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro22
	.byte	0x4
	.file 34 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_Param/AP_Param.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x22
	.file 35 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/modules/PX4Firmware/Build/px4fmu-v2_APM.build/nuttx-export/include/stddef.h"
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x23
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF1381
	.byte	0x4
	.file 36 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/modules/PX4Firmware/Build/px4fmu-v2_APM.build/nuttx-export/include/string.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x24
	.byte	0x7
	.4byte	.Ldebug_macro23
	.byte	0x4
	.file 37 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/AP_HAL.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x25
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x9
	.file 38 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/utility/functor.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x26
	.byte	0x7
	.4byte	.Ldebug_macro24
	.byte	0x4
	.byte	0x4
	.file 39 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/AP_HAL_Macros.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x27
	.byte	0x7
	.4byte	.Ldebug_macro25
	.byte	0x4
	.file 40 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/AP_HAL_Main.h"
	.byte	0x3
	.uleb128 0x8
	.uleb128 0x28
	.file 41 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/HAL.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x29
	.file 42 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/AnalogIn.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x2a
	.file 43 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/modules/PX4Firmware/Build/px4fmu-v2_APM.build/nuttx-export/include/inttypes.h"
	.byte	0x3
	.uleb128 0x3
	.uleb128 0x2b
	.byte	0x7
	.4byte	.Ldebug_macro26
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro27
	.byte	0x4
	.file 44 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/GPIO.h"
	.byte	0x3
	.uleb128 0x6
	.uleb128 0x2c
	.byte	0x7
	.4byte	.Ldebug_macro28
	.byte	0x4
	.file 45 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/RCInput.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x2d
	.byte	0x7
	.4byte	.Ldebug_macro29
	.byte	0x4
	.file 46 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/RCOutput.h"
	.byte	0x3
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x7
	.4byte	.Ldebug_macro30
	.byte	0x4
	.file 47 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/SPIDevice.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x2f
	.file 48 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/Device.h"
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x30
	.byte	0x4
	.file 49 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/utility/OwnPtr.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x31
	.file 50 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_Common/missing/cstddef"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x32
	.byte	0x3
	.uleb128 0x3
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF1424
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 51 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/Storage.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0x33
	.byte	0x4
	.file 52 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/UARTDriver.h"
	.byte	0x3
	.uleb128 0xb
	.uleb128 0x34
	.file 53 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/utility/BetterStream.h"
	.byte	0x3
	.uleb128 0x8
	.uleb128 0x35
	.file 54 "/usr/local/gcc-arm-none-eabi-4_9-2014q4/lib/gcc/arm-none-eabi/4.9.3/include/stdarg.h"
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x36
	.byte	0x7
	.4byte	.Ldebug_macro31
	.byte	0x4
	.file 55 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/utility/Stream.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x37
	.file 56 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/utility/Print.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x38
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 57 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/system.h"
	.byte	0x3
	.uleb128 0xc
	.uleb128 0x39
	.byte	0x4
	.file 58 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/OpticalFlow.h"
	.byte	0x3
	.uleb128 0xd
	.uleb128 0x3a
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro32
	.byte	0x4
	.file 59 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/Scheduler.h"
	.byte	0x3
	.uleb128 0x11
	.uleb128 0x3b
	.byte	0x4
	.file 60 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/Semaphores.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x3c
	.byte	0x5
	.uleb128 0x5
	.4byte	.LASF1442
	.byte	0x4
	.file 61 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_HAL/Util.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x3d
	.byte	0x4
	.byte	0x4
	.file 62 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/StorageManager/StorageManager.h"
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x3e
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF1443
	.byte	0x4
	.file 63 "/usr/local/gcc-arm-none-eabi-4_9-2014q4/lib/gcc/arm-none-eabi/4.9.3/include/float.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x3f
	.byte	0x7
	.4byte	.Ldebug_macro33
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro34
	.byte	0x4
	.file 64 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_Math/definitions.h"
	.byte	0x3
	.uleb128 0xb
	.uleb128 0x40
	.byte	0x7
	.4byte	.Ldebug_macro35
	.byte	0x4
	.file 65 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_Math/edc.h"
	.byte	0x3
	.uleb128 0xc
	.uleb128 0x41
	.byte	0x4
	.file 66 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_Math/location.h"
	.byte	0x3
	.uleb128 0xd
	.uleb128 0x42
	.byte	0x3
	.uleb128 0x8
	.uleb128 0x7
	.byte	0x4
	.file 67 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_Math/vector3.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x43
	.file 68 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_Math/rotations.h"
	.byte	0x3
	.uleb128 0x39
	.uleb128 0x44
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro36
	.byte	0x4
	.file 69 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_Math/matrix3.h"
	.byte	0x3
	.uleb128 0xe
	.uleb128 0x45
	.byte	0x4
	.file 70 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_Math/polygon.h"
	.byte	0x3
	.uleb128 0xf
	.uleb128 0x46
	.byte	0x4
	.file 71 "/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/ardupilot/libraries/AP_Math/quaternion.h"
	.byte	0x3
	.uleb128 0x10
	.uleb128 0x47
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF1546
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.visibility.h.43.1de659b7653edeb8b931198e183da64c,comdat
.Ldebug_macro1:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF399
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF400
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF401
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF402
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF403
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.config.h.4.12e26926e292139013755a5a79af7437,comdat
.Ldebug_macro2:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4
	.4byte	.LASF405
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF406
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF407
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF408
	.byte	0x5
	.uleb128 0xb
	.4byte	.LASF409
	.byte	0x6
	.uleb128 0xc
	.4byte	.LASF410
	.byte	0x6
	.uleb128 0xd
	.4byte	.LASF411
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF412
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF413
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF414
	.byte	0x5
	.uleb128 0x11
	.4byte	.LASF415
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF416
	.byte	0x5
	.uleb128 0x13
	.4byte	.LASF417
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF418
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF419
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF420
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF421
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF422
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF423
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF424
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF425
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF426
	.byte	0x6
	.uleb128 0x1d
	.4byte	.LASF427
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF428
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF429
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF430
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF431
	.byte	0x5
	.uleb128 0x22
	.4byte	.LASF432
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF433
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF434
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF435
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF436
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF437
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF438
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF439
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF440
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF441
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF442
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF443
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF444
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF445
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF446
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF447
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF448
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF449
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF450
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF451
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF452
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF453
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF454
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF455
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF456
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF457
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF458
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF459
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF460
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF461
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF462
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF463
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF464
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF465
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF466
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF467
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF468
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF469
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF470
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF471
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF472
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF473
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF474
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF475
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF476
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF477
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF478
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF479
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF480
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF481
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF482
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF483
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF484
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF485
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF486
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF487
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF488
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF489
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF490
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF491
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF492
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF379
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF493
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF494
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF495
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF496
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF497
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF498
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF499
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF500
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF501
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF502
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF503
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF504
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF505
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF506
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF507
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF508
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF509
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF510
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF511
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF512
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF513
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF514
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF515
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF516
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF517
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF518
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF519
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF520
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF521
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF522
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF523
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF524
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF525
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF526
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF527
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF528
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF529
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF530
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF531
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF532
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF533
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF534
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF535
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF536
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF537
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF538
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF539
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF540
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF541
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF542
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF543
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF544
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF545
	.byte	0x5
	.uleb128 0x95
	.4byte	.LASF546
	.byte	0x5
	.uleb128 0x96
	.4byte	.LASF547
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF548
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF549
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF550
	.byte	0x5
	.uleb128 0x9a
	.4byte	.LASF551
	.byte	0x5
	.uleb128 0x9b
	.4byte	.LASF552
	.byte	0x5
	.uleb128 0x9c
	.4byte	.LASF553
	.byte	0x5
	.uleb128 0x9d
	.4byte	.LASF554
	.byte	0x5
	.uleb128 0x9e
	.4byte	.LASF555
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF556
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF557
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF558
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF559
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF560
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF561
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF562
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF563
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF564
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF565
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF566
	.byte	0x5
	.uleb128 0xaa
	.4byte	.LASF567
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF568
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF569
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF570
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF571
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF572
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF573
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF574
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF575
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF576
	.byte	0x5
	.uleb128 0xb4
	.4byte	.LASF577
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF578
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF579
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF580
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF581
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF582
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF583
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF584
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF585
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF586
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF587
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF588
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF589
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF590
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF591
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF592
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF593
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF594
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF595
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF596
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF597
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF598
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF599
	.byte	0x5
	.uleb128 0xcb
	.4byte	.LASF600
	.byte	0x5
	.uleb128 0xcc
	.4byte	.LASF601
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF602
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF603
	.byte	0x5
	.uleb128 0xcf
	.4byte	.LASF604
	.byte	0x5
	.uleb128 0xd0
	.4byte	.LASF605
	.byte	0x5
	.uleb128 0xd1
	.4byte	.LASF606
	.byte	0x5
	.uleb128 0xd2
	.4byte	.LASF607
	.byte	0x5
	.uleb128 0xd3
	.4byte	.LASF608
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF609
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF610
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF611
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF612
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF613
	.byte	0x5
	.uleb128 0xd9
	.4byte	.LASF614
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF615
	.byte	0x5
	.uleb128 0xdb
	.4byte	.LASF616
	.byte	0x5
	.uleb128 0xdc
	.4byte	.LASF617
	.byte	0x5
	.uleb128 0xdd
	.4byte	.LASF618
	.byte	0x5
	.uleb128 0xde
	.4byte	.LASF619
	.byte	0x5
	.uleb128 0xdf
	.4byte	.LASF620
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF621
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF622
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF623
	.byte	0x5
	.uleb128 0xe3
	.4byte	.LASF624
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF625
	.byte	0x5
	.uleb128 0xe5
	.4byte	.LASF626
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF627
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF628
	.byte	0x5
	.uleb128 0xe8
	.4byte	.LASF629
	.byte	0x5
	.uleb128 0xe9
	.4byte	.LASF630
	.byte	0x5
	.uleb128 0xea
	.4byte	.LASF631
	.byte	0x5
	.uleb128 0xeb
	.4byte	.LASF632
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF633
	.byte	0x5
	.uleb128 0xed
	.4byte	.LASF634
	.byte	0x5
	.uleb128 0xee
	.4byte	.LASF635
	.byte	0x5
	.uleb128 0xef
	.4byte	.LASF636
	.byte	0x5
	.uleb128 0xf0
	.4byte	.LASF637
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF638
	.byte	0x5
	.uleb128 0xf2
	.4byte	.LASF639
	.byte	0x5
	.uleb128 0xf3
	.4byte	.LASF640
	.byte	0x5
	.uleb128 0xf4
	.4byte	.LASF641
	.byte	0x5
	.uleb128 0xf5
	.4byte	.LASF642
	.byte	0x5
	.uleb128 0xf6
	.4byte	.LASF643
	.byte	0x5
	.uleb128 0xf7
	.4byte	.LASF644
	.byte	0x5
	.uleb128 0xf8
	.4byte	.LASF645
	.byte	0x5
	.uleb128 0xf9
	.4byte	.LASF646
	.byte	0x5
	.uleb128 0xfa
	.4byte	.LASF647
	.byte	0x5
	.uleb128 0xfb
	.4byte	.LASF648
	.byte	0x5
	.uleb128 0xfc
	.4byte	.LASF649
	.byte	0x5
	.uleb128 0xfd
	.4byte	.LASF650
	.byte	0x5
	.uleb128 0xfe
	.4byte	.LASF651
	.byte	0x5
	.uleb128 0xff
	.4byte	.LASF652
	.byte	0x5
	.uleb128 0x100
	.4byte	.LASF653
	.byte	0x5
	.uleb128 0x101
	.4byte	.LASF654
	.byte	0x5
	.uleb128 0x102
	.4byte	.LASF655
	.byte	0x5
	.uleb128 0x103
	.4byte	.LASF656
	.byte	0x5
	.uleb128 0x104
	.4byte	.LASF657
	.byte	0x5
	.uleb128 0x105
	.4byte	.LASF658
	.byte	0x5
	.uleb128 0x106
	.4byte	.LASF659
	.byte	0x5
	.uleb128 0x107
	.4byte	.LASF660
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF661
	.byte	0x5
	.uleb128 0x109
	.4byte	.LASF662
	.byte	0x5
	.uleb128 0x10a
	.4byte	.LASF663
	.byte	0x5
	.uleb128 0x10b
	.4byte	.LASF664
	.byte	0x5
	.uleb128 0x10c
	.4byte	.LASF665
	.byte	0x5
	.uleb128 0x10d
	.4byte	.LASF666
	.byte	0x5
	.uleb128 0x10e
	.4byte	.LASF667
	.byte	0x5
	.uleb128 0x10f
	.4byte	.LASF668
	.byte	0x5
	.uleb128 0x110
	.4byte	.LASF669
	.byte	0x5
	.uleb128 0x111
	.4byte	.LASF670
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF671
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF672
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF673
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF674
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF675
	.byte	0x5
	.uleb128 0x117
	.4byte	.LASF676
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF677
	.byte	0x5
	.uleb128 0x119
	.4byte	.LASF678
	.byte	0x5
	.uleb128 0x11a
	.4byte	.LASF679
	.byte	0x5
	.uleb128 0x11b
	.4byte	.LASF680
	.byte	0x5
	.uleb128 0x11c
	.4byte	.LASF681
	.byte	0x5
	.uleb128 0x11d
	.4byte	.LASF682
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF683
	.byte	0x5
	.uleb128 0x11f
	.4byte	.LASF684
	.byte	0x5
	.uleb128 0x120
	.4byte	.LASF685
	.byte	0x5
	.uleb128 0x121
	.4byte	.LASF686
	.byte	0x5
	.uleb128 0x122
	.4byte	.LASF687
	.byte	0x5
	.uleb128 0x123
	.4byte	.LASF688
	.byte	0x5
	.uleb128 0x124
	.4byte	.LASF689
	.byte	0x5
	.uleb128 0x125
	.4byte	.LASF690
	.byte	0x5
	.uleb128 0x126
	.4byte	.LASF691
	.byte	0x5
	.uleb128 0x127
	.4byte	.LASF692
	.byte	0x5
	.uleb128 0x128
	.4byte	.LASF693
	.byte	0x5
	.uleb128 0x129
	.4byte	.LASF694
	.byte	0x5
	.uleb128 0x12a
	.4byte	.LASF695
	.byte	0x5
	.uleb128 0x12b
	.4byte	.LASF696
	.byte	0x5
	.uleb128 0x12c
	.4byte	.LASF697
	.byte	0x5
	.uleb128 0x12d
	.4byte	.LASF698
	.byte	0x5
	.uleb128 0x12e
	.4byte	.LASF699
	.byte	0x5
	.uleb128 0x12f
	.4byte	.LASF700
	.byte	0x5
	.uleb128 0x130
	.4byte	.LASF701
	.byte	0x5
	.uleb128 0x131
	.4byte	.LASF702
	.byte	0x5
	.uleb128 0x132
	.4byte	.LASF703
	.byte	0x5
	.uleb128 0x133
	.4byte	.LASF704
	.byte	0x5
	.uleb128 0x134
	.4byte	.LASF705
	.byte	0x5
	.uleb128 0x1a0
	.4byte	.LASF706
	.byte	0x6
	.uleb128 0x1c9
	.4byte	.LASF707
	.byte	0x6
	.uleb128 0x1ca
	.4byte	.LASF708
	.byte	0x5
	.uleb128 0x1ce
	.4byte	.LASF709
	.byte	0x5
	.uleb128 0x1d3
	.4byte	.LASF710
	.byte	0x6
	.uleb128 0x1d9
	.4byte	.LASF711
	.byte	0x6
	.uleb128 0x1e1
	.4byte	.LASF712
	.byte	0x5
	.uleb128 0x1e2
	.4byte	.LASF703
	.byte	0x6
	.uleb128 0x1e8
	.4byte	.LASF713
	.byte	0x6
	.uleb128 0x1e9
	.4byte	.LASF714
	.byte	0x6
	.uleb128 0x1ea
	.4byte	.LASF715
	.byte	0x6
	.uleb128 0x1f0
	.4byte	.LASF716
	.byte	0x6
	.uleb128 0x1f6
	.4byte	.LASF411
	.byte	0x6
	.uleb128 0x1f7
	.4byte	.LASF717
	.byte	0x6
	.uleb128 0x1f8
	.4byte	.LASF718
	.byte	0x6
	.uleb128 0x1f9
	.4byte	.LASF719
	.byte	0x6
	.uleb128 0x1fa
	.4byte	.LASF720
	.byte	0x6
	.uleb128 0x1fb
	.4byte	.LASF721
	.byte	0x6
	.uleb128 0x1fc
	.4byte	.LASF722
	.byte	0x6
	.uleb128 0x1fd
	.4byte	.LASF723
	.byte	0x6
	.uleb128 0x1fe
	.4byte	.LASF724
	.byte	0x6
	.uleb128 0x1ff
	.4byte	.LASF725
	.byte	0x6
	.uleb128 0x200
	.4byte	.LASF726
	.byte	0x6
	.uleb128 0x201
	.4byte	.LASF727
	.byte	0x6
	.uleb128 0x202
	.4byte	.LASF728
	.byte	0x6
	.uleb128 0x203
	.4byte	.LASF729
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.compiler.h.37.f1f8c606d14df60f3991c66c1601b08c,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF730
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF731
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF732
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF733
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF734
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF735
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF736
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF737
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF738
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF739
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF740
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF741
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF742
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF743
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF744
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF745
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF746
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF747
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF748
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF749
	.byte	0x6
	.uleb128 0xbc
	.4byte	.LASF750
	.byte	0x6
	.uleb128 0xc0
	.4byte	.LASF751
	.byte	0x6
	.uleb128 0xc4
	.4byte	.LASF752
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF753
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF754
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF755
	.byte	0x5
	.uleb128 0xcf
	.4byte	.LASF756
	.byte	0x5
	.uleb128 0xd0
	.4byte	.LASF757
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF758
	.byte	0x5
	.uleb128 0x1e0
	.4byte	.LASF759
	.byte	0x6
	.uleb128 0x1e7
	.4byte	.LASF760
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.newlib.h.8.fe7d912fc917043c98742c35eddd8cff,comdat
.Ldebug_macro4:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF765
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF766
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF767
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF768
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF769
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF770
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF771
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF772
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF773
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF774
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF775
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF776
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF777
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF778
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.features.h.22.bee0aee4a3878f51861c775df98fa3ea,comdat
.Ldebug_macro5:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF780
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF781
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF782
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF783
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF784
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.config.h.216.7c012dffaa9f246a060295128de21af6,comdat
.Ldebug_macro6:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF785
	.byte	0x6
	.uleb128 0xde
	.4byte	.LASF786
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF787
	.byte	0x5
	.uleb128 0xf8
	.4byte	.LASF788
	.byte	0x5
	.uleb128 0xff
	.4byte	.LASF789
	.byte	0x5
	.uleb128 0x105
	.4byte	.LASF790
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._ansi.h.23.1ee1144430bedaab1a14c7b57a6c8384,comdat
.Ldebug_macro7:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF791
	.byte	0x5
	.uleb128 0x22
	.4byte	.LASF792
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF793
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF794
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF795
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF796
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF797
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF798
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF799
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF800
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF801
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF802
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF803
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF804
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF805
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF806
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF807
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF808
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF809
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF810
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF811
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF812
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF813
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF814
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF815
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.math.h.11.cf26cb7efde6f99ccd7e9b40ebd546f3,comdat
.Ldebug_macro8:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xb
	.4byte	.LASF816
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF817
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF818
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF819
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF820
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF821
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF822
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF823
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF824
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF825
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF826
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF827
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF828
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF829
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF830
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF831
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF832
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF833
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF834
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF835
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF836
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF837
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF838
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF839
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF840
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF841
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF842
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF843
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF844
	.byte	0x5
	.uleb128 0x1d0
	.4byte	.LASF845
	.byte	0x5
	.uleb128 0x1d4
	.4byte	.LASF846
	.byte	0x5
	.uleb128 0x1ef
	.4byte	.LASF847
	.byte	0x5
	.uleb128 0x1f0
	.4byte	.LASF848
	.byte	0x5
	.uleb128 0x1f1
	.4byte	.LASF849
	.byte	0x5
	.uleb128 0x1f2
	.4byte	.LASF850
	.byte	0x5
	.uleb128 0x1f3
	.4byte	.LASF851
	.byte	0x5
	.uleb128 0x1f4
	.4byte	.LASF852
	.byte	0x5
	.uleb128 0x1f8
	.4byte	.LASF853
	.byte	0x5
	.uleb128 0x1fa
	.4byte	.LASF854
	.byte	0x5
	.uleb128 0x1fb
	.4byte	.LASF855
	.byte	0x5
	.uleb128 0x1fc
	.4byte	.LASF856
	.byte	0x5
	.uleb128 0x1fd
	.4byte	.LASF857
	.byte	0x5
	.uleb128 0x1fe
	.4byte	.LASF858
	.byte	0x5
	.uleb128 0x1ff
	.4byte	.LASF859
	.byte	0x5
	.uleb128 0x200
	.4byte	.LASF860
	.byte	0x5
	.uleb128 0x201
	.4byte	.LASF861
	.byte	0x5
	.uleb128 0x202
	.4byte	.LASF862
	.byte	0x5
	.uleb128 0x203
	.4byte	.LASF863
	.byte	0x5
	.uleb128 0x204
	.4byte	.LASF864
	.byte	0x5
	.uleb128 0x205
	.4byte	.LASF865
	.byte	0x5
	.uleb128 0x206
	.4byte	.LASF866
	.byte	0x5
	.uleb128 0x207
	.4byte	.LASF867
	.byte	0x5
	.uleb128 0x208
	.4byte	.LASF868
	.byte	0x5
	.uleb128 0x209
	.4byte	.LASF869
	.byte	0x5
	.uleb128 0x20a
	.4byte	.LASF870
	.byte	0x5
	.uleb128 0x20b
	.4byte	.LASF871
	.byte	0x5
	.uleb128 0x20c
	.4byte	.LASF872
	.byte	0x5
	.uleb128 0x20d
	.4byte	.LASF873
	.byte	0x5
	.uleb128 0x20e
	.4byte	.LASF874
	.byte	0x5
	.uleb128 0x20f
	.4byte	.LASF875
	.byte	0x5
	.uleb128 0x210
	.4byte	.LASF876
	.byte	0x5
	.uleb128 0x211
	.4byte	.LASF877
	.byte	0x5
	.uleb128 0x214
	.4byte	.LASF878
	.byte	0x5
	.uleb128 0x215
	.4byte	.LASF879
	.byte	0x5
	.uleb128 0x216
	.4byte	.LASF880
	.byte	0x5
	.uleb128 0x217
	.4byte	.LASF881
	.byte	0x5
	.uleb128 0x218
	.4byte	.LASF882
	.byte	0x5
	.uleb128 0x219
	.4byte	.LASF883
	.byte	0x5
	.uleb128 0x21a
	.4byte	.LASF884
	.byte	0x5
	.uleb128 0x21b
	.4byte	.LASF885
	.byte	0x5
	.uleb128 0x21c
	.4byte	.LASF886
	.byte	0x5
	.uleb128 0x21d
	.4byte	.LASF887
	.byte	0x5
	.uleb128 0x21e
	.4byte	.LASF888
	.byte	0x5
	.uleb128 0x21f
	.4byte	.LASF889
	.byte	0x5
	.uleb128 0x220
	.4byte	.LASF890
	.byte	0x5
	.uleb128 0x221
	.4byte	.LASF891
	.byte	0x5
	.uleb128 0x222
	.4byte	.LASF892
	.byte	0x5
	.uleb128 0x223
	.4byte	.LASF893
	.byte	0x5
	.uleb128 0x224
	.4byte	.LASF894
	.byte	0x5
	.uleb128 0x225
	.4byte	.LASF895
	.byte	0x5
	.uleb128 0x226
	.4byte	.LASF896
	.byte	0x5
	.uleb128 0x227
	.4byte	.LASF897
	.byte	0x5
	.uleb128 0x228
	.4byte	.LASF898
	.byte	0x5
	.uleb128 0x229
	.4byte	.LASF899
	.byte	0x5
	.uleb128 0x22a
	.4byte	.LASF900
	.byte	0x5
	.uleb128 0x22b
	.4byte	.LASF901
	.byte	0x5
	.uleb128 0x237
	.4byte	.LASF902
	.byte	0x5
	.uleb128 0x238
	.4byte	.LASF903
	.byte	0x5
	.uleb128 0x23c
	.4byte	.LASF904
	.byte	0x5
	.uleb128 0x23d
	.4byte	.LASF905
	.byte	0x5
	.uleb128 0x23e
	.4byte	.LASF906
	.byte	0x5
	.uleb128 0x23f
	.4byte	.LASF907
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.cconfig.h.31.468279b4489fc9cc616833b2aab801d7,comdat
.Ldebug_macro9:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF910
	.byte	0x5
	.uleb128 0x22
	.4byte	.LASF911
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF912
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF913
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF914
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF915
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF916
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF917
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF918
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF919
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF920
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF921
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF922
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF923
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF924
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF925
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF926
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF927
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF928
	.byte	0x5
	.uleb128 0xf0
	.4byte	.LASF929
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF930
	.byte	0x5
	.uleb128 0x141
	.4byte	.LASF931
	.byte	0x5
	.uleb128 0x145
	.4byte	.LASF932
	.byte	0x5
	.uleb128 0x149
	.4byte	.LASF933
	.byte	0x5
	.uleb128 0x14d
	.4byte	.LASF934
	.byte	0x5
	.uleb128 0x151
	.4byte	.LASF935
	.byte	0x5
	.uleb128 0x155
	.4byte	.LASF936
	.byte	0x6
	.uleb128 0x15a
	.4byte	.LASF937
	.byte	0x5
	.uleb128 0x166
	.4byte	.LASF938
	.byte	0x5
	.uleb128 0x167
	.4byte	.LASF939
	.byte	0x5
	.uleb128 0x168
	.4byte	.LASF940
	.byte	0x5
	.uleb128 0x16d
	.4byte	.LASF941
	.byte	0x5
	.uleb128 0x19b
	.4byte	.LASF942
	.byte	0x5
	.uleb128 0x19e
	.4byte	.LASF943
	.byte	0x5
	.uleb128 0x1a2
	.4byte	.LASF944
	.byte	0x5
	.uleb128 0x1a3
	.4byte	.LASF945
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.cconfig.h.438.0ee5d34b3e727f6a3cae7b379f02759f,comdat
.Ldebug_macro10:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b6
	.4byte	.LASF948
	.byte	0x5
	.uleb128 0x1bd
	.4byte	.LASF949
	.byte	0x5
	.uleb128 0x1c8
	.4byte	.LASF950
	.byte	0x5
	.uleb128 0x1cf
	.4byte	.LASF951
	.byte	0x2
	.uleb128 0x1d2
	.ascii	"min\000"
	.byte	0x2
	.uleb128 0x1d3
	.ascii	"max\000"
	.byte	0x5
	.uleb128 0x1da
	.4byte	.LASF952
	.byte	0x5
	.uleb128 0x1e0
	.4byte	.LASF953
	.byte	0x5
	.uleb128 0x1e6
	.4byte	.LASF954
	.byte	0x5
	.uleb128 0x1e9
	.4byte	.LASF955
	.byte	0x5
	.uleb128 0x1ef
	.4byte	.LASF956
	.byte	0x5
	.uleb128 0x1fb
	.4byte	.LASF957
	.byte	0x5
	.uleb128 0x201
	.4byte	.LASF958
	.byte	0x5
	.uleb128 0x204
	.4byte	.LASF959
	.byte	0x5
	.uleb128 0x207
	.4byte	.LASF960
	.byte	0x5
	.uleb128 0x213
	.4byte	.LASF961
	.byte	0x5
	.uleb128 0x216
	.4byte	.LASF962
	.byte	0x5
	.uleb128 0x219
	.4byte	.LASF963
	.byte	0x5
	.uleb128 0x21c
	.4byte	.LASF964
	.byte	0x5
	.uleb128 0x222
	.4byte	.LASF965
	.byte	0x5
	.uleb128 0x225
	.4byte	.LASF966
	.byte	0x5
	.uleb128 0x228
	.4byte	.LASF967
	.byte	0x5
	.uleb128 0x22b
	.4byte	.LASF968
	.byte	0x5
	.uleb128 0x22e
	.4byte	.LASF969
	.byte	0x5
	.uleb128 0x231
	.4byte	.LASF970
	.byte	0x5
	.uleb128 0x234
	.4byte	.LASF971
	.byte	0x5
	.uleb128 0x237
	.4byte	.LASF972
	.byte	0x5
	.uleb128 0x23a
	.4byte	.LASF973
	.byte	0x5
	.uleb128 0x23d
	.4byte	.LASF974
	.byte	0x5
	.uleb128 0x240
	.4byte	.LASF975
	.byte	0x5
	.uleb128 0x243
	.4byte	.LASF976
	.byte	0x5
	.uleb128 0x246
	.4byte	.LASF977
	.byte	0x5
	.uleb128 0x249
	.4byte	.LASF978
	.byte	0x5
	.uleb128 0x24c
	.4byte	.LASF979
	.byte	0x5
	.uleb128 0x252
	.4byte	.LASF980
	.byte	0x5
	.uleb128 0x258
	.4byte	.LASF981
	.byte	0x5
	.uleb128 0x26a
	.4byte	.LASF982
	.byte	0x5
	.uleb128 0x26d
	.4byte	.LASF983
	.byte	0x5
	.uleb128 0x273
	.4byte	.LASF984
	.byte	0x5
	.uleb128 0x27f
	.4byte	.LASF985
	.byte	0x5
	.uleb128 0x285
	.4byte	.LASF986
	.byte	0x5
	.uleb128 0x288
	.4byte	.LASF987
	.byte	0x5
	.uleb128 0x28b
	.4byte	.LASF988
	.byte	0x5
	.uleb128 0x294
	.4byte	.LASF989
	.byte	0x5
	.uleb128 0x297
	.4byte	.LASF990
	.byte	0x5
	.uleb128 0x29a
	.4byte	.LASF991
	.byte	0x5
	.uleb128 0x2a0
	.4byte	.LASF992
	.byte	0x5
	.uleb128 0x2a3
	.4byte	.LASF993
	.byte	0x5
	.uleb128 0x2b8
	.4byte	.LASF994
	.byte	0x5
	.uleb128 0x2bb
	.4byte	.LASF995
	.byte	0x5
	.uleb128 0x2be
	.4byte	.LASF996
	.byte	0x5
	.uleb128 0x2d9
	.4byte	.LASF997
	.byte	0x5
	.uleb128 0x2dc
	.4byte	.LASF998
	.byte	0x5
	.uleb128 0x2e2
	.4byte	.LASF999
	.byte	0x5
	.uleb128 0x2e8
	.4byte	.LASF1000
	.byte	0x5
	.uleb128 0x2eb
	.4byte	.LASF1001
	.byte	0x5
	.uleb128 0x2ee
	.4byte	.LASF1002
	.byte	0x5
	.uleb128 0x2f7
	.4byte	.LASF1003
	.byte	0x5
	.uleb128 0x303
	.4byte	.LASF1004
	.byte	0x5
	.uleb128 0x31b
	.4byte	.LASF1005
	.byte	0x5
	.uleb128 0x31e
	.4byte	.LASF1006
	.byte	0x5
	.uleb128 0x327
	.4byte	.LASF1007
	.byte	0x5
	.uleb128 0x32a
	.4byte	.LASF1008
	.byte	0x5
	.uleb128 0x330
	.4byte	.LASF1009
	.byte	0x5
	.uleb128 0x333
	.4byte	.LASF1010
	.byte	0x5
	.uleb128 0x336
	.4byte	.LASF1011
	.byte	0x5
	.uleb128 0x339
	.4byte	.LASF1012
	.byte	0x5
	.uleb128 0x33f
	.4byte	.LASF1013
	.byte	0x5
	.uleb128 0x342
	.4byte	.LASF1014
	.byte	0x5
	.uleb128 0x345
	.4byte	.LASF1015
	.byte	0x5
	.uleb128 0x348
	.4byte	.LASF1016
	.byte	0x5
	.uleb128 0x364
	.4byte	.LASF1017
	.byte	0x5
	.uleb128 0x367
	.4byte	.LASF1018
	.byte	0x5
	.uleb128 0x370
	.4byte	.LASF1019
	.byte	0x5
	.uleb128 0x376
	.4byte	.LASF1020
	.byte	0x5
	.uleb128 0x379
	.4byte	.LASF1021
	.byte	0x5
	.uleb128 0x382
	.4byte	.LASF1022
	.byte	0x5
	.uleb128 0x385
	.4byte	.LASF1023
	.byte	0x5
	.uleb128 0x388
	.4byte	.LASF1024
	.byte	0x5
	.uleb128 0x391
	.4byte	.LASF1025
	.byte	0x5
	.uleb128 0x397
	.4byte	.LASF1026
	.byte	0x5
	.uleb128 0x39a
	.4byte	.LASF1027
	.byte	0x5
	.uleb128 0x39d
	.4byte	.LASF1028
	.byte	0x5
	.uleb128 0x3a0
	.4byte	.LASF1029
	.byte	0x5
	.uleb128 0x3a3
	.4byte	.LASF1030
	.byte	0x5
	.uleb128 0x3a6
	.4byte	.LASF1031
	.byte	0x5
	.uleb128 0x3a9
	.4byte	.LASF1032
	.byte	0x5
	.uleb128 0x3ac
	.4byte	.LASF1033
	.byte	0x5
	.uleb128 0x476
	.4byte	.LASF1034
	.byte	0x5
	.uleb128 0x47c
	.4byte	.LASF1035
	.byte	0x5
	.uleb128 0x47f
	.4byte	.LASF1036
	.byte	0x5
	.uleb128 0x482
	.4byte	.LASF1037
	.byte	0x5
	.uleb128 0x485
	.4byte	.LASF1038
	.byte	0x5
	.uleb128 0x488
	.4byte	.LASF1039
	.byte	0x5
	.uleb128 0x48b
	.4byte	.LASF1040
	.byte	0x5
	.uleb128 0x49d
	.4byte	.LASF1041
	.byte	0x5
	.uleb128 0x4a3
	.4byte	.LASF1042
	.byte	0x5
	.uleb128 0x4aa
	.4byte	.LASF1043
	.byte	0x5
	.uleb128 0x4b0
	.4byte	.LASF1044
	.byte	0x5
	.uleb128 0x4b5
	.4byte	.LASF1045
	.byte	0x5
	.uleb128 0x4bb
	.4byte	.LASF1046
	.byte	0x5
	.uleb128 0x4c1
	.4byte	.LASF1047
	.byte	0x5
	.uleb128 0x4c4
	.4byte	.LASF1048
	.byte	0x5
	.uleb128 0x4c7
	.4byte	.LASF1049
	.byte	0x5
	.uleb128 0x4e8
	.4byte	.LASF1050
	.byte	0x5
	.uleb128 0x4f0
	.4byte	.LASF1051
	.byte	0x5
	.uleb128 0x4f4
	.4byte	.LASF1052
	.byte	0x5
	.uleb128 0x4f8
	.4byte	.LASF1053
	.byte	0x5
	.uleb128 0x500
	.4byte	.LASF1054
	.byte	0x5
	.uleb128 0x514
	.4byte	.LASF1055
	.byte	0x5
	.uleb128 0x520
	.4byte	.LASF1056
	.byte	0x5
	.uleb128 0x533
	.4byte	.LASF1057
	.byte	0x5
	.uleb128 0x53c
	.4byte	.LASF1058
	.byte	0x5
	.uleb128 0x53f
	.4byte	.LASF1059
	.byte	0x5
	.uleb128 0x542
	.4byte	.LASF1060
	.byte	0x5
	.uleb128 0x548
	.4byte	.LASF1061
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.limits.80.19db7fee2e6bb8c9babae8f9ff21b81c,comdat
.Ldebug_macro11:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF1062
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF1063
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF1064
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF1065
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF1066
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF1067
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF1068
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF1069
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF1070
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF1071
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF1072
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF1073
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF1074
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF1075
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF1076
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF1077
	.byte	0x6
	.uleb128 0x656
	.4byte	.LASF1078
	.byte	0x6
	.uleb128 0x657
	.4byte	.LASF1079
	.byte	0x6
	.uleb128 0x658
	.4byte	.LASF1080
	.byte	0x6
	.uleb128 0x6a1
	.4byte	.LASF1081
	.byte	0x6
	.uleb128 0x6a2
	.4byte	.LASF1082
	.byte	0x6
	.uleb128 0x6a3
	.4byte	.LASF1083
	.byte	0x6
	.uleb128 0x6ec
	.4byte	.LASF1084
	.byte	0x6
	.uleb128 0x6ed
	.4byte	.LASF1085
	.byte	0x6
	.uleb128 0x6ee
	.4byte	.LASF1086
	.byte	0x6
	.uleb128 0x6f3
	.4byte	.LASF1087
	.byte	0x6
	.uleb128 0x6f4
	.4byte	.LASF1088
	.byte	0x6
	.uleb128 0x6f5
	.4byte	.LASF1089
	.byte	0x6
	.uleb128 0x6f6
	.4byte	.LASF1090
	.byte	0x6
	.uleb128 0x6f7
	.4byte	.LASF1091
	.byte	0x6
	.uleb128 0x6f8
	.4byte	.LASF1092
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.types.h.41.eb692b8619433ec38712e9885236d6aa,comdat
.Ldebug_macro12:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF1094
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF1095
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.limits.h.37.652b3bf04cc333c80b0908d4075d64b9,comdat
.Ldebug_macro13:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF1097
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF1098
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF1099
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF1100
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF1101
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF1102
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF1103
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF1104
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF1105
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF1106
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF1107
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF1108
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF1109
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF1110
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF1111
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF1112
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF1113
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF1114
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF1115
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF1116
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF1117
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF1118
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.limits.h.65.e7e4d60ed1e1e6d4a8f4eb01e0209d9f,comdat
.Ldebug_macro14:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF1119
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF1120
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF1121
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF1122
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF1123
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF1124
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF1125
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF1126
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF1127
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF1128
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF1129
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF1130
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF1131
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF1132
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF1133
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF1134
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF1135
	.byte	0x5
	.uleb128 0x95
	.4byte	.LASF1136
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF1137
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF1138
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF1139
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF1140
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF1141
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF1142
	.byte	0x5
	.uleb128 0xaa
	.4byte	.LASF1143
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF1144
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF1145
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF1146
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF1147
	.byte	0x5
	.uleb128 0xb4
	.4byte	.LASF1148
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF1149
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF1150
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF1151
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF1152
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF1153
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF1154
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF1155
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF1156
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF1157
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF1158
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF1159
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF1160
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF1161
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF1162
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF1163
	.byte	0x5
	.uleb128 0xcc
	.4byte	.LASF1164
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF1165
	.byte	0x5
	.uleb128 0xd1
	.4byte	.LASF1166
	.byte	0x5
	.uleb128 0xd2
	.4byte	.LASF1167
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdint.h.58.d44b1be671aeef57611c4ce7ef0eeb6c,comdat
.Ldebug_macro15:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF1168
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF1169
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF1170
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF1171
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF1172
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF1173
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF1174
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF1175
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF1176
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF1177
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF1178
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF1179
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF1180
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF1181
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF1182
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF1183
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF1184
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF1185
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF1186
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF1187
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF1188
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF1189
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF1190
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF1191
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF1192
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF1193
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF1194
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF1195
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF1196
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF1197
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF1198
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF1199
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF1200
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF1201
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF1202
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF1203
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF1204
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF1205
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF1206
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF1207
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF1208
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF1209
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF1210
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF1211
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF1212
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF1213
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF1214
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.type_traits.30.c4c40c86c21d73c13b8b1e8932d36c39,comdat
.Ldebug_macro16:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF1215
	.byte	0x5
	.uleb128 0x8c0
	.4byte	.LASF1216
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.AP_HAL_Boards.h.9.d7a94fffbf22d4c168c4bb502f769371,comdat
.Ldebug_macro17:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF1217
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF1218
	.byte	0x5
	.uleb128 0xb
	.4byte	.LASF1219
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF1220
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF1221
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF1222
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF1223
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF1224
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF1225
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF1226
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF1227
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF1228
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF1229
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF1230
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF1231
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF1232
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF1233
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF1234
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF1235
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF1236
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF1237
	.byte	0x5
	.uleb128 0x22
	.4byte	.LASF1238
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF1239
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF1240
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF1241
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF1242
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF1243
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF1244
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF1245
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF1246
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF1247
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF1248
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF1249
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF1250
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF1251
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF1252
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF1253
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF1254
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF1255
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF1256
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF1257
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF1258
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF1259
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF1260
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF1261
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF1262
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF1263
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF1264
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF1265
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF1266
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF1267
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF1268
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF1269
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF1270
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF1271
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF1272
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF1273
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF1274
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF1275
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF1276
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF1277
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF1278
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF1279
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF1280
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF1281
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF1282
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF1283
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF1284
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF1285
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF1286
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF1287
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF1288
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF1289
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF1290
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF1291
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF1292
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF1293
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF1294
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF1295
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF1296
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF1297
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF1298
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF1299
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.px4.h.3.89469563425a26a674e63599aa7ee0e8,comdat
.Ldebug_macro18:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.4byte	.LASF1300
	.byte	0x5
	.uleb128 0x4
	.4byte	.LASF1301
	.byte	0x5
	.uleb128 0x5
	.4byte	.LASF1302
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF1303
	.byte	0x5
	.uleb128 0x7
	.4byte	.LASF1304
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF1305
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF1306
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF1307
	.byte	0x5
	.uleb128 0xb
	.4byte	.LASF1308
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF1309
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF1310
	.byte	0x5
	.uleb128 0x13
	.4byte	.LASF1311
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF1312
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF1313
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF1314
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF1315
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF1316
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF1317
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF1318
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF1319
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF1320
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF1321
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF1322
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF1323
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF1324
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF1325
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF1326
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF1327
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF1328
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF1329
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF1330
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF1331
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF1332
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF1333
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.AP_HAL_Boards.h.153.521536e4a279f034a55dc080350db57e,comdat
.Ldebug_macro19:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF1334
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF1335
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF1336
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF1337
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.types.h.37.e35d5194dad36f833b1f863090d5f749,comdat
.Ldebug_macro20:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF1339
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF1340
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF1341
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF1342
	.byte	0x2
	.uleb128 0x54
	.ascii	"OK\000"
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF1343
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF1344
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF1345
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF1346
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF1347
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF1348
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF1349
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF1350
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF1351
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF1352
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF1353
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdlib.h.57.ac3e0e953606276eeab0c77793e05f6f,comdat
.Ldebug_macro21:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF1354
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF1355
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF1356
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF1357
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF1358
	.byte	0x6
	.uleb128 0x6b
	.4byte	.LASF760
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF759
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF1359
	.byte	0x5
	.uleb128 0x9e
	.4byte	.LASF1360
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF1361
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF1362
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF1363
	.byte	0x6
	.uleb128 0xc8
	.4byte	.LASF760
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.AP_Common.h.28.e98b1b4d87e4e043b686a03667e4a389,comdat
.Ldebug_macro22:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF1364
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF1365
	.byte	0x5
	.uleb128 0x22
	.4byte	.LASF1366
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF1367
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF1368
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF1369
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF1370
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF1371
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF1372
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF1373
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF1374
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF1375
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF1376
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF1377
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF1378
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF1379
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF1380
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.string.h.37.04495ea799777cb2d1f7218b953ca62f,comdat
.Ldebug_macro23:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF1382
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF1383
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF1384
	.byte	0x6
	.uleb128 0x3e
	.4byte	.LASF760
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF759
	.byte	0x6
	.uleb128 0x64
	.4byte	.LASF760
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.functor.h.22.02bd2878b130088ad1f0e4f26af6bf35,comdat
.Ldebug_macro24:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF1385
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF1386
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF1387
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF1388
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.AP_HAL_Macros.h.8.7fd0e97e83033f541bbaa58c47f95b9d,comdat
.Ldebug_macro25:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF1389
	.byte	0x5
	.uleb128 0x13
	.4byte	.LASF1390
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.inttypes.h.37.cd1ae06ca40d37a95b28b7d2eb31f6f8,comdat
.Ldebug_macro26:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF1391
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF759
	.byte	0x6
	.uleb128 0xb9
	.4byte	.LASF760
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.AnalogIn.h.55.bed44fc11fa4264d32eea2d2484e53b2,comdat
.Ldebug_macro27:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF1392
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF1393
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.GPIO.h.7.199edd2be91ee461c08ce51c959ad799,comdat
.Ldebug_macro28:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x7
	.4byte	.LASF1394
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF1395
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF1396
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF1397
	.byte	0x5
	.uleb128 0xb
	.4byte	.LASF1398
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF1399
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF1400
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.RCInput.h.5.a2bbc3805bde18e97f165246fccf7194,comdat
.Ldebug_macro29:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x5
	.4byte	.LASF1401
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF1402
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.RCOutput.h.5.f44d23a41259c194de1243f0a31e5a73,comdat
.Ldebug_macro30:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x5
	.4byte	.LASF1403
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF1404
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF1405
	.byte	0x5
	.uleb128 0xb
	.4byte	.LASF1406
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF1407
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF1408
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF1409
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF1410
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF1411
	.byte	0x5
	.uleb128 0x11
	.4byte	.LASF1412
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF1413
	.byte	0x5
	.uleb128 0x13
	.4byte	.LASF1414
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF1415
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF1416
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF1417
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF1418
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF1419
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF1420
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF1421
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF1422
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF1423
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdarg.h.31.72c3aa8d68b291953fa52b9471bcdff7,comdat
.Ldebug_macro31:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF1425
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF1426
	.byte	0x6
	.uleb128 0x22
	.4byte	.LASF1427
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF1428
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF1429
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF1430
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF1431
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF1432
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF1433
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF1434
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF1435
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF1436
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF1437
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF1438
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.AP_HAL_Main.h.22.22ab0921037ea366557df1a2c4f2a68e,comdat
.Ldebug_macro32:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF1439
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF1440
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF1441
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.float.h.29.9215738e51207c82f412ef161516eae8,comdat
.Ldebug_macro33:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF1444
	.byte	0x6
	.uleb128 0x20
	.4byte	.LASF1445
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF1446
	.byte	0x6
	.uleb128 0x24
	.4byte	.LASF1447
	.byte	0x6
	.uleb128 0x25
	.4byte	.LASF1448
	.byte	0x6
	.uleb128 0x26
	.4byte	.LASF1449
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF1450
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF1451
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF1452
	.byte	0x6
	.uleb128 0x32
	.4byte	.LASF1453
	.byte	0x6
	.uleb128 0x33
	.4byte	.LASF1454
	.byte	0x6
	.uleb128 0x34
	.4byte	.LASF1455
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF1456
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF1457
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF1458
	.byte	0x6
	.uleb128 0x3a
	.4byte	.LASF1459
	.byte	0x6
	.uleb128 0x3b
	.4byte	.LASF1460
	.byte	0x6
	.uleb128 0x3c
	.4byte	.LASF1461
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF1462
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF1463
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF1464
	.byte	0x6
	.uleb128 0x46
	.4byte	.LASF1465
	.byte	0x6
	.uleb128 0x47
	.4byte	.LASF1466
	.byte	0x6
	.uleb128 0x48
	.4byte	.LASF1467
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF1468
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF1469
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF1470
	.byte	0x6
	.uleb128 0x4e
	.4byte	.LASF1471
	.byte	0x6
	.uleb128 0x4f
	.4byte	.LASF1472
	.byte	0x6
	.uleb128 0x50
	.4byte	.LASF1473
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF1474
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF1475
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF1476
	.byte	0x6
	.uleb128 0x5a
	.4byte	.LASF1477
	.byte	0x6
	.uleb128 0x5b
	.4byte	.LASF1478
	.byte	0x6
	.uleb128 0x5c
	.4byte	.LASF1479
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF1480
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF1481
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF1482
	.byte	0x6
	.uleb128 0x65
	.4byte	.LASF1483
	.byte	0x6
	.uleb128 0x66
	.4byte	.LASF1484
	.byte	0x6
	.uleb128 0x67
	.4byte	.LASF1485
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF1486
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF1487
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF1488
	.byte	0x6
	.uleb128 0x6e
	.4byte	.LASF1489
	.byte	0x6
	.uleb128 0x6f
	.4byte	.LASF1490
	.byte	0x6
	.uleb128 0x70
	.4byte	.LASF1491
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF1492
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF1493
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF1494
	.byte	0x6
	.uleb128 0x76
	.4byte	.LASF1495
	.byte	0x6
	.uleb128 0x77
	.4byte	.LASF1496
	.byte	0x6
	.uleb128 0x78
	.4byte	.LASF1497
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF1498
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF1499
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF1500
	.byte	0x6
	.uleb128 0x7f
	.4byte	.LASF1501
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF1502
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.AP_Param.h.32.3b42c50fcbe8ed735a7b213b9415cae5,comdat
.Ldebug_macro34:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF1503
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF1504
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF1505
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF1506
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF1507
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF1508
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF1509
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF1510
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF1511
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF1512
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF1513
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF1514
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF1515
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF1516
	.byte	0x5
	.uleb128 0x2e7
	.4byte	.LASF1517
	.byte	0x5
	.uleb128 0x2f2
	.4byte	.LASF1518
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.definitions.h.20.1dd519e22f9b88c5b31c26cc12ac388d,comdat
.Ldebug_macro35:
	.2byte	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x14
	.4byte	.LASF1519
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF1520
	.byte	0x6
	.uleb128 0x19
	.4byte	.LASF1521
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF1522
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF1523
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF1524
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF1525
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF1526
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF1527
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF1528
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF1529
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF1530
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF1531
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF1532
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF1533
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF1534
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF1535
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF1536
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF1537
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF1538
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF1539
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF1540
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF1541
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF1542
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF1543
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.location.h.13.89d42fe256a6cdc0565115ad255a71db,comdat
.Ldebug_macro36:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF1544
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF1545
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF271:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF361:
	.ascii	"__thumb__ 1\000"
.LASF448:
	.ascii	"CONFIG_STM32_TIM1 1\000"
.LASF262:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF360:
	.ascii	"__APCS_32__ 1\000"
.LASF1426:
	.ascii	"_ANSI_STDARG_H_ \000"
.LASF1289:
	.ascii	"HAL_COMPASS_BH 10\000"
.LASF831:
	.ascii	"MATH_ERREXCEPT 2\000"
.LASF496:
	.ascii	"CONFIG_NSH_MMCSDSLOTNO 0\000"
.LASF124:
	.ascii	"__UINT_LEAST32_MAX__ 4294967295UL\000"
.LASF1626:
	.ascii	"_ZNK7Vector2IiE6is_nanEv\000"
.LASF167:
	.ascii	"__DBL_EPSILON__ double(2.2204460492503131e-16L)\000"
.LASF1418:
	.ascii	"CH_14 13\000"
.LASF727:
	.ascii	"CONFIG_DEBUG_GPIO\000"
.LASF1341:
	.ascii	"FALSE 0\000"
.LASF821:
	.ascii	"NAN (__builtin_nanf(\"\"))\000"
.LASF254:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF1652:
	.ascii	"closest_point\000"
.LASF1387:
	.ascii	"FUNCTOR_BIND(obj,func,rettype,...) Functor<rettype,"
	.ascii	" ## __VA_ARGS__>::bind<std::remove_reference<declty"
	.ascii	"pe(*obj)>::type, func>(obj)\000"
.LASF517:
	.ascii	"CONFIG_SIG_SIGALARM 3\000"
.LASF1009:
	.ascii	"_GLIBCXX_HAVE_STDALIGN_H 1\000"
.LASF601:
	.ascii	"CONFIG_USART6_2STOP 0\000"
.LASF888:
	.ascii	"M_SQRTPI_F 1.77245385090551602792981f\000"
.LASF537:
	.ascii	"CONFIG_I2C_TRANSFER 1\000"
.LASF1669:
	.ascii	"_ZN7Vector2IfEdVEf\000"
.LASF972:
	.ascii	"_GLIBCXX_HAVE_EOVERFLOW 1\000"
.LASF892:
	.ascii	"M_DEG_TO_RAD_F 0.01745329251994f\000"
.LASF1568:
	.ascii	"_uint16_t\000"
.LASF425:
	.ascii	"CONFIG_ARCH_HAVE_MPU 1\000"
.LASF844:
	.ascii	"isunordered(a,b) (__extension__ ({__typeof__(a) __a"
	.ascii	" = (a); __typeof__(b) __b = (b); fpclassify(__a) =="
	.ascii	" FP_NAN || fpclassify(__b) == FP_NAN;}))\000"
.LASF1003:
	.ascii	"_GLIBCXX_HAVE_MODFF 1\000"
.LASF148:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF996:
	.ascii	"_GLIBCXX_HAVE_LDEXPF 1\000"
.LASF1108:
	.ascii	"INT_MAX 2147483647\000"
.LASF949:
	.ascii	"_GLIBCXX_WEAK_DEFINITION \000"
.LASF490:
	.ascii	"CONFIG_ARCH_HAVE_INTERRUPTSTACK 1\000"
.LASF652:
	.ascii	"CONFIG_NUNGET_CHARS 2\000"
.LASF442:
	.ascii	"CONFIG_STM32_PWR 1\000"
.LASF1692:
	.ascii	"dy1s\000"
.LASF802:
	.ascii	"_VOID void\000"
.LASF1585:
	.ascii	"gid_t\000"
.LASF372:
	.ascii	"__ARM_PCS_VFP 1\000"
.LASF933:
	.ascii	"_GLIBCXX_BEGIN_NAMESPACE_ALGO \000"
.LASF583:
	.ascii	"CONFIG_USART3_TXBUFSIZE 300\000"
.LASF852:
	.ascii	"PLOSS 6\000"
.LASF302:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF971:
	.ascii	"_GLIBCXX_HAVE_ENOTSUP 1\000"
.LASF194:
	.ascii	"__DEC64_MIN_EXP__ (-382)\000"
.LASF796:
	.ascii	"_AND ,\000"
.LASF1185:
	.ascii	"UINT_LEAST16_MAX UINT16_MAX\000"
.LASF1501:
	.ascii	"FLT_ROUNDS\000"
.LASF804:
	.ascii	"_EXFUN(name,proto) name proto\000"
.LASF713:
	.ascii	"CONFIG_NET_TCP\000"
.LASF982:
	.ascii	"_GLIBCXX_HAVE_FLOAT_H 1\000"
.LASF0:
	.ascii	"__STDC__ 1\000"
.LASF1256:
	.ascii	"HAL_INS_HIL 4\000"
.LASF532:
	.ascii	"CONFIG_USERMAIN_STACKSIZE 2500\000"
.LASF243:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF790:
	.ascii	"_READ_WRITE_BUFSIZE_TYPE int\000"
.LASF1453:
	.ascii	"FLT_DIG\000"
.LASF309:
	.ascii	"__SA_FBIT__ 15\000"
.LASF398:
	.ascii	"PX4_MAIN ArduPilot_app_main\000"
.LASF660:
	.ascii	"CONFIG_ARCH_LOWPUTC 1\000"
.LASF319:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF739:
	.ascii	"noreturn_function __attribute__ ((noreturn))\000"
.LASF748:
	.ascii	"DSEG \000"
.LASF692:
	.ascii	"CONFIG_NSH_ROMFSSECTSIZE 128\000"
.LASF1439:
	.ascii	"AP_MAIN __EXPORT ArduPilot_main\000"
.LASF1699:
	.ascii	"dy2s\000"
.LASF1621:
	.ascii	"_ZNK7Vector2IiErmERKS0_\000"
.LASF505:
	.ascii	"CONFIG_DEV_CONSOLE 1\000"
.LASF49:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF1476:
	.ascii	"LDBL_MAX_EXP __LDBL_MAX_EXP__\000"
.LASF163:
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
.LASF1028:
	.ascii	"_GLIBCXX_HAVE_VFWSCANF 1\000"
.LASF613:
	.ascii	"CONFIG_UART8_2STOP 0\000"
.LASF930:
	.ascii	"_GLIBCXX_END_NAMESPACE_VERSION \000"
.LASF35:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF1705:
	.ascii	"Polygon_complete<float>\000"
.LASF838:
	.ascii	"signbit(__x) ((sizeof(__x) == sizeof(float)) ? __si"
	.ascii	"gnbitf(__x) : __signbitd(__x))\000"
.LASF853:
	.ascii	"MAXFLOAT 3.40282347e+38F\000"
.LASF880:
	.ascii	"M_LOG10E_F 0.43429448190325182765f\000"
.LASF1321:
	.ascii	"HAL_BARO_MS5611_SPI_EXT_NAME \"ms5611_ext\"\000"
.LASF376:
	.ascii	"__ELF__ 1\000"
.LASF17:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF1594:
	.ascii	"sa_family_t\000"
.LASF927:
	.ascii	"_GLIBCXX_EXTERN_TEMPLATE 1\000"
.LASF1544:
	.ascii	"LOCATION_SCALING_FACTOR 0.011131884502145034f\000"
.LASF570:
	.ascii	"CONFIG_USART1_BAUD 115200\000"
.LASF1557:
	.ascii	"short unsigned int\000"
.LASF1433:
	.ascii	"__va_copy(d,s) __builtin_va_copy(d,s)\000"
.LASF1307:
	.ascii	"HAL_BARO_DEFAULT HAL_BARO_PX4\000"
.LASF1405:
	.ascii	"CH_1 0\000"
.LASF96:
	.ascii	"__PTRDIFF_MAX__ 2147483647\000"
.LASF410:
	.ascii	"CONFIG_DEBUG\000"
.LASF803:
	.ascii	"_EXFUN_NOTHROW(name,proto) name proto _NOTHROW\000"
.LASF1427:
	.ascii	"__need___va_list\000"
.LASF1622:
	.ascii	"angle\000"
.LASF869:
	.ascii	"M_RAD_TO_DEG 57.2957795130823\000"
.LASF57:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF562:
	.ascii	"CONFIG_ARCH_HAVE_USART3 1\000"
.LASF730:
	.ascii	"__INCLUDE_NUTTX_COMPILER_H \000"
.LASF528:
	.ascii	"CONFIG_MAX_WDOGPARMS 2\000"
.LASF581:
	.ascii	"CONFIG_USART2_OFLOWCONTROL 1\000"
.LASF1208:
	.ascii	"INTMAX_MAX INT64_MAX\000"
.LASF1591:
	.ascii	"fpos_t\000"
.LASF66:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF1261:
	.ascii	"HAL_INS_L3GD20 10\000"
.LASF1186:
	.ascii	"INT_LEAST32_MIN INT32_MIN\000"
.LASF266:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF1091:
	.ascii	"__glibcxx_digits10\000"
.LASF455:
	.ascii	"CONFIG_STM32_USART2 1\000"
.LASF1201:
	.ascii	"INT_FAST64_MIN INT64_MIN\000"
.LASF1191:
	.ascii	"UINT_LEAST64_MAX UINT64_MAX\000"
.LASF155:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF114:
	.ascii	"__INT_LEAST16_MAX__ 32767\000"
.LASF89:
	.ascii	"__INT_MAX__ 2147483647\000"
.LASF1463:
	.ascii	"DBL_MIN_EXP __DBL_MIN_EXP__\000"
.LASF1215:
	.ascii	"_GLIBCXX_TYPE_TRAITS 1\000"
.LASF817:
	.ascii	"HUGE_VAL (__builtin_huge_val())\000"
.LASF1401:
	.ascii	"RC_INPUT_MIN_PULSEWIDTH 900\000"
.LASF950:
	.ascii	"_GLIBCXX_FAST_MATH 0\000"
.LASF1136:
	.ascii	"_POSIX_TIMER_MAX 32\000"
.LASF397:
	.ascii	"HAVE_OCLOEXEC 0\000"
.LASF471:
	.ascii	"CONFIG_USART2_RXDMA 1\000"
.LASF1107:
	.ascii	"INT_MIN (-INT_MAX - 1)\000"
.LASF980:
	.ascii	"_GLIBCXX_HAVE_EXPF 1\000"
.LASF1244:
	.ascii	"HAL_BOARD_SUBTYPE_PX4_V2 2001\000"
.LASF896:
	.ascii	"M_LN2LO_F 1.9082149292705877000E-10f\000"
.LASF32:
	.ascii	"__GNUG__ 4\000"
.LASF694:
	.ascii	"CONFIG_NSH_FATDEVNO 1\000"
.LASF472:
	.ascii	"CONFIG_USART3_RXDMA 1\000"
.LASF418:
	.ascii	"CONFIG_ARCH_FAMILY \"armv7-m\"\000"
.LASF1227:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_PXF 1002\000"
.LASF766:
	.ascii	"_NEWLIB_VERSION \"2.1.0\"\000"
.LASF1264:
	.ascii	"HAL_INS_MPU9250_I2C 13\000"
.LASF1131:
	.ascii	"_POSIX_STREAM_MAX CONFIG_NFILE_STREAMS\000"
.LASF1046:
	.ascii	"_GLIBCXX_SIZE_T_IS_UINT 1\000"
.LASF1029:
	.ascii	"_GLIBCXX_HAVE_VSWSCANF 1\000"
.LASF658:
	.ascii	"CONFIG_TASK_SPAWN_DEFAULT_STACKSIZE 2048\000"
.LASF951:
	.ascii	"__N(msgid) (msgid)\000"
.LASF974:
	.ascii	"_GLIBCXX_HAVE_EPERM 1\000"
.LASF719:
	.ascii	"CONFIG_DEBUG_PAGING\000"
.LASF1566:
	.ascii	"_uint8_t\000"
.LASF475:
	.ascii	"CONFIG_USART6_RXDMA 1\000"
.LASF901:
	.ascii	"M_INVLN2_F 1.4426950408889633870E0f\000"
.LASF684:
	.ascii	"CONFIG_NSH_STRERROR 1\000"
.LASF1260:
	.ascii	"HAL_INS_MPU9250_SPI 9\000"
.LASF1199:
	.ascii	"INT_FAST32_MAX INT32_MAX\000"
.LASF1216:
	.ascii	"_GLIBCXX_HAS_NESTED_TYPE(_NTYPE) template<typename "
	.ascii	"_Tp> class __has_ ##_NTYPE ##_helper { template<typ"
	.ascii	"ename _Up> struct _Wrap_type { }; template<typename"
	.ascii	" _Up> static true_type __test(_Wrap_type<typename _"
	.ascii	"Up::_NTYPE>*); template<typename _Up> static false_"
	.ascii	"type __test(...); public: typedef decltype(__test<_"
	.ascii	"Tp>(0)) type; }; template<typename _Tp> struct __ha"
	.ascii	"s_ ##_NTYPE : public __has_ ##_NTYPE ##_helper <typ"
	.ascii	"ename remove_cv<_Tp>::type>::type { };\000"
.LASF865:
	.ascii	"M_1_PI 0.31830988618379067154\000"
.LASF1610:
	.ascii	"_ZNK7Vector2IiEdvEi\000"
.LASF468:
	.ascii	"CONFIG_STM32_DMACAPABLE 1\000"
.LASF768:
	.ascii	"_WANT_REGISTER_FINI 1\000"
.LASF1486:
	.ascii	"FLT_MAX __FLT_MAX__\000"
.LASF170:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF769:
	.ascii	"_MB_LEN_MAX 1\000"
.LASF824:
	.ascii	"FP_INFINITE 1\000"
.LASF1543:
	.ascii	"USEC_PER_MSEC 1000ULL\000"
.LASF1305:
	.ascii	"HAL_PARAM_DEFAULTS_PATH \"/etc/defaults.parm\"\000"
.LASF1155:
	.ascii	"STREAM_MAX _POSIX_STREAM_MAX\000"
.LASF1436:
	.ascii	"_VA_LIST_DEFINED \000"
.LASF200:
	.ascii	"__DEC128_MANT_DIG__ 34\000"
.LASF1239:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_DISCO 1014\000"
.LASF620:
	.ascii	"CONFIG_CDCACM_EP0MAXPACKET 64\000"
.LASF793:
	.ascii	"_END_STD_C }\000"
.LASF1389:
	.ascii	"WARN_IF_UNUSED __attribute__ ((warn_unused_result))"
	.ascii	"\000"
.LASF842:
	.ascii	"islessequal(x,y) (__extension__ ({__typeof__(x) __x"
	.ascii	" = (x); __typeof__(y) __y = (y); !isunordered(__x,_"
	.ascii	"_y) && (__x <= __y);}))\000"
.LASF11:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF572:
	.ascii	"CONFIG_USART1_PARITY 0\000"
.LASF1545:
	.ascii	"LOCATION_SCALING_FACTOR_INV 89.83204953368922f\000"
.LASF1133:
	.ascii	"_POSIX_RTSIG_MAX 31\000"
.LASF1120:
	.ascii	"_POSIX_ARG_MAX 4096\000"
.LASF1630:
	.ascii	"_ZNK7Vector2IiE7is_zeroEv\000"
.LASF992:
	.ascii	"_GLIBCXX_HAVE_INT64_T_LONG_LONG 1\000"
.LASF610:
	.ascii	"CONFIG_UART8_BAUD 57600\000"
.LASF646:
	.ascii	"CONFIG_FS_BINFS 1\000"
.LASF715:
	.ascii	"CONFIG_NET_ICMP\000"
.LASF814:
	.ascii	"_NOINLINE __attribute__ ((__noinline__))\000"
.LASF1695:
	.ascii	"_Z15Polygon_outsideIiEbRK7Vector2IT_EPS3_j\000"
.LASF279:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF332:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 2\000"
.LASF63:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF762:
	.ascii	"_MATH_H_ \000"
.LASF1550:
	.ascii	"bool\000"
.LASF1681:
	.ascii	"_ZN7Vector2IfE9normalizeEv\000"
.LASF1253:
	.ascii	"HAL_BOARD_SUBTYPE_VRBRAIN_V54 4006\000"
.LASF615:
	.ascii	"CONFIG_SERIAL_OFLOWCONTROL 1\000"
.LASF630:
	.ascii	"CONFIG_CDCACM_NWRREQS 4\000"
.LASF1577:
	.ascii	"uint32_t\000"
.LASF1370:
	.ascii	"ToRad(x) radians(x)\000"
.LASF1461:
	.ascii	"LDBL_MIN_EXP\000"
.LASF1539:
	.ascii	"WGS84_E (sqrt(2 * WGS84_F - WGS84_F * WGS84_F))\000"
.LASF1040:
	.ascii	"_GLIBCXX_PACKAGE__GLIBCXX_VERSION \"version-unused\""
	.ascii	"\000"
.LASF41:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF723:
	.ascii	"CONFIG_DEBUG_BINFMT\000"
.LASF443:
	.ascii	"CONFIG_STM32_SDIO 1\000"
.LASF1373:
	.ascii	"LOCATION_ALT_MAX_M 83000\000"
.LASF960:
	.ascii	"_GLIBCXX_HAVE_COSHF 1\000"
.LASF846:
	.ascii	"__signgam_r(ptr) _REENT_SIGNGAM(ptr)\000"
.LASF1322:
	.ascii	"HAL_INS_MPU60x0_NAME \"mpu6000\"\000"
.LASF126:
	.ascii	"__UINT_LEAST64_MAX__ 18446744073709551615ULL\000"
.LASF123:
	.ascii	"__UINT16_C(c) c\000"
.LASF721:
	.ascii	"CONFIG_DEBUG_FS\000"
.LASF53:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF1576:
	.ascii	"int32_t\000"
.LASF808:
	.ascii	"_DEFUN_VOID(name) name(_NOARGS)\000"
.LASF737:
	.ascii	"weak_function __attribute__ ((weak))\000"
.LASF1342:
	.ascii	"NULL (0)\000"
.LASF622:
	.ascii	"CONFIG_CDCACM_EPINTIN_FSSIZE 64\000"
.LASF999:
	.ascii	"_GLIBCXX_HAVE_LOGF 1\000"
.LASF840:
	.ascii	"isgreaterequal(x,y) (__extension__ ({__typeof__(x) "
	.ascii	"__x = (x); __typeof__(y) __y = (y); !isunordered(__"
	.ascii	"x,__y) && (__x >= __y);}))\000"
.LASF1076:
	.ascii	"__glibcxx_digits10(T) (__glibcxx_digits (T) * 643L "
	.ascii	"/ 2136)\000"
.LASF1175:
	.ascii	"INT32_MAX 2147483647\000"
.LASF998:
	.ascii	"_GLIBCXX_HAVE_LOG10F 1\000"
.LASF623:
	.ascii	"CONFIG_CDCACM_EPINTIN_HSSIZE 64\000"
.LASF364:
	.ascii	"__ARMEL__ 1\000"
.LASF1270:
	.ascii	"HAL_BARO_BMP085 1\000"
.LASF935:
	.ascii	"_GLIBCXX_BEGIN_NAMESPACE_CONTAINER \000"
.LASF1587:
	.ascii	"ino_t\000"
.LASF378:
	.ascii	"__CUSTOM_FILE_IO__ 1\000"
.LASF1665:
	.ascii	"_ZNK7Vector2IfEdvEf\000"
.LASF513:
	.ascii	"CONFIG_SCHED_ATEXIT_MAX 1\000"
.LASF1093:
	.ascii	"__INCLUDE_STDINT_H \000"
.LASF584:
	.ascii	"CONFIG_USART3_BAUD 57600\000"
.LASF1212:
	.ascii	"UINTMAX_C(x) x ## ull\000"
.LASF1438:
	.ascii	"__va_list__ \000"
.LASF887:
	.ascii	"M_3PI_4_F 2.3561944901923448370E0f\000"
.LASF25:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF978:
	.ascii	"_GLIBCXX_HAVE_ETXTBSY 1\000"
.LASF1424:
	.ascii	"__INCLUDE_CXX_CSTDDEF \000"
.LASF46:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF133:
	.ascii	"__UINT_FAST16_MAX__ 4294967295U\000"
.LASF642:
	.ascii	"CONFIG_FAT_MAXFNAME 32\000"
.LASF1130:
	.ascii	"_POSIX_SSIZE_MAX INT_MAX\000"
.LASF681:
	.ascii	"CONFIG_NSH_BUILTIN_APPS 1\000"
.LASF1000:
	.ascii	"_GLIBCXX_HAVE_MACHINE_ENDIAN_H 1\000"
.LASF991:
	.ascii	"_GLIBCXX_HAVE_INT64_T 1\000"
.LASF1403:
	.ascii	"RC_OUTPUT_MIN_PULSEWIDTH 400\000"
.LASF1165:
	.ascii	"MQ_PRIO_MAX _POSIX_MQ_PRIO_MAX\000"
.LASF926:
	.ascii	"_GLIBCXX_THROW_OR_ABORT(_EXC) (__builtin_abort())\000"
.LASF285:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF550:
	.ascii	"CONFIG_MTD 1\000"
.LASF1235:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_BH 1010\000"
.LASF924:
	.ascii	"_GLIBCXX_THROW(_EXC) \000"
.LASF82:
	.ascii	"__cpp_attributes 200809\000"
.LASF722:
	.ascii	"CONFIG_DEBUG_LIB\000"
.LASF388:
	.ascii	"GIT_VERSION \"90516f10\"\000"
.LASF1117:
	.ascii	"PTR_MAX 2147483647\000"
.LASF714:
	.ascii	"CONFIG_NET_UDP\000"
.LASF390:
	.ascii	"NUTTX_GIT_VERSION \"be6ff61a\"\000"
.LASF923:
	.ascii	"_GLIBCXX_USE_NOEXCEPT noexcept\000"
.LASF369:
	.ascii	"__ARM_NEON_FP 4\000"
.LASF495:
	.ascii	"CONFIG_NSH_MMCSDMINOR 0\000"
.LASF580:
	.ascii	"CONFIG_USART2_IFLOWCONTROL 1\000"
.LASF248:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF764:
	.ascii	"_ANSIDECL_H_ \000"
.LASF47:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF1666:
	.ascii	"_ZN7Vector2IfEpLERKS0_\000"
.LASF120:
	.ascii	"__UINT_LEAST8_MAX__ 255\000"
.LASF1351:
	.ascii	"SCHED_PRIORITY_DEFAULT 100\000"
.LASF1343:
	.ascii	"OK 0\000"
.LASF564:
	.ascii	"CONFIG_MCU_SERIAL 1\000"
.LASF541:
	.ascii	"CONFIG_SPI_EXCHANGE 1\000"
.LASF136:
	.ascii	"__INTPTR_MAX__ 2147483647\000"
.LASF1283:
	.ascii	"HAL_COMPASS_VRBRAIN 4\000"
.LASF1319:
	.ascii	"HAL_BARO_MS5611_NAME \"ms5611\"\000"
.LASF1162:
	.ascii	"AIO_LISTIO_MAX _POSIX_AIO_LISTIO_MAX\000"
.LASF1316:
	.ascii	"HAL_GPIO_C_LED_PIN 25\000"
.LASF1442:
	.ascii	"HAL_SEMAPHORE_BLOCK_FOREVER 0\000"
.LASF1043:
	.ascii	"_GLIBCXX_FULLY_DYNAMIC_STRING 0\000"
.LASF113:
	.ascii	"__INT8_C(c) c\000"
.LASF1190:
	.ascii	"INT_LEAST64_MAX INT64_MAX\000"
.LASF1706:
	.ascii	"_Z16Polygon_completeIfEbPK7Vector2IT_Ej\000"
.LASF456:
	.ascii	"CONFIG_STM32_USART3 1\000"
.LASF373:
	.ascii	"__ARM_EABI__ 1\000"
.LASF1243:
	.ascii	"HAL_BOARD_SUBTYPE_PX4_V1 2000\000"
.LASF1105:
	.ascii	"SHRT_MAX 32767\000"
.LASF555:
	.ascii	"CONFIG_SERIAL 1\000"
.LASF612:
	.ascii	"CONFIG_UART8_PARITY 0\000"
.LASF648:
	.ascii	"CONFIG_GRAN 1\000"
.LASF1600:
	.ascii	"_ZNK7Vector2IiEeqERKS0_\000"
.LASF657:
	.ascii	"CONFIG_POSIX_SPAWN_PROXY_STACKSIZE 1024\000"
.LASF1318:
	.ascii	"HAL_GPIO_LED_OFF HIGH\000"
.LASF763:
	.ascii	"__IEEE_LITTLE_ENDIAN \000"
.LASF147:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF166:
	.ascii	"__DBL_MIN__ double(2.2250738585072014e-308L)\000"
.LASF8:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF675:
	.ascii	"CONFIG_HAVE_CXXINITIALIZE 1\000"
.LASF317:
	.ascii	"__USA_FBIT__ 16\000"
.LASF165:
	.ascii	"__DBL_MAX__ double(1.7976931348623157e+308L)\000"
.LASF608:
	.ascii	"CONFIG_UART8_RXBUFSIZE 300\000"
.LASF1361:
	.ascii	"atol(nptr) strtol((nptr), NULL, 10)\000"
.LASF62:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF465:
	.ascii	"CONFIG_STM32_FLASH_PREFETCH 1\000"
.LASF429:
	.ascii	"CONFIG_SDIO_DMA 1\000"
.LASF321:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF1358:
	.ascii	"environ get_environ_ptr()\000"
.LASF159:
	.ascii	"__DBL_DIG__ 15\000"
.LASF422:
	.ascii	"CONFIG_ARMV7M_CMNVECTOR 1\000"
.LASF1034:
	.ascii	"LT_OBJDIR \".libs/\"\000"
.LASF178:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF1448:
	.ascii	"DBL_MANT_DIG\000"
.LASF1658:
	.ascii	"_ZN7Vector2IfEclEff\000"
.LASF1096:
	.ascii	"__INCLUDE_LIMITS_H \000"
.LASF1196:
	.ascii	"INT_FAST16_MAX INT16_MAX\000"
.LASF71:
	.ascii	"__DEPRECATED 1\000"
.LASF725:
	.ascii	"CONFIG_DEBUG_USB\000"
.LASF1450:
	.ascii	"FLT_MANT_DIG __FLT_MANT_DIG__\000"
.LASF510:
	.ascii	"CONFIG_SDCLONE_DISABLE 1\000"
.LASF149:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF1037:
	.ascii	"_GLIBCXX_PACKAGE_STRING \"package-unused version-un"
	.ascii	"used\"\000"
.LASF322:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF139:
	.ascii	"__GCC_IEC_559_COMPLEX 0\000"
.LASF1313:
	.ascii	"HAL_IMU_TEMP_DEFAULT -1\000"
.LASF1220:
	.ascii	"HAL_BOARD_LINUX 7\000"
.LASF609:
	.ascii	"CONFIG_UART8_TXBUFSIZE 300\000"
.LASF568:
	.ascii	"CONFIG_USART1_RXBUFSIZE 128\000"
.LASF798:
	.ascii	"_CONST const\000"
.LASF905:
	.ascii	"_SVID_ __fdlibm_svid\000"
.LASF228:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF1179:
	.ascii	"UINT64_MAX 18446744073709551615ull\000"
.LASF324:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF683:
	.ascii	"CONFIG_NSH_FILEIOSIZE 512\000"
.LASF981:
	.ascii	"_GLIBCXX_HAVE_FABSF 1\000"
.LASF419:
	.ascii	"CONFIG_ARCH_CHIP \"stm32\"\000"
.LASF1683:
	.ascii	"_ZN7Vector2IfE7reflectERKS0_\000"
.LASF1383:
	.ascii	"bzero(s,n) (void)memset(s,0,n)\000"
.LASF791:
	.ascii	"_HAVE_STDC \000"
.LASF1517:
	.ascii	"AP_PARAMDEF(_t,_suffix,_pt) typedef AP_ParamT<_t, _"
	.ascii	"pt> AP_ ## _suffix;\000"
.LASF288:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF1326:
	.ascii	"HAL_INS_LSM9DS0_EXT_G_NAME \"lsm9ds0_ext_g\"\000"
.LASF1385:
	.ascii	"FUNCTOR_TYPEDEF(name,rettype,...) typedef Functor<r"
	.ascii	"ettype, ## __VA_ARGS__> name\000"
.LASF501:
	.ascii	"CONFIG_TASK_NAME_SIZE 24\000"
.LASF614:
	.ascii	"CONFIG_SERIAL_IFLOWCONTROL 1\000"
.LASF1053:
	.ascii	"_GLIBCXX_USE_C99_MATH 1\000"
.LASF900:
	.ascii	"M_LOG2_E_F _M_LN2_F\000"
.LASF404:
	.ascii	"__INCLUDE_CXX_CMATH \000"
.LASF1675:
	.ascii	"_ZNK7Vector2IfE6is_infEv\000"
.LASF1045:
	.ascii	"_GLIBCXX_PTRDIFF_T_IS_INT 1\000"
.LASF1365:
	.ascii	"UNUSED_FUNCTION __attribute__((unused))\000"
.LASF449:
	.ascii	"CONFIG_STM32_TIM3 1\000"
.LASF1633:
	.ascii	"zero\000"
.LASF1663:
	.ascii	"_ZNK7Vector2IfEmiERKS0_\000"
.LASF1592:
	.ascii	"blksize_t\000"
.LASF1625:
	.ascii	"is_nan\000"
.LASF1445:
	.ascii	"FLT_RADIX\000"
.LASF707:
	.ascii	"CONFIG_FS_READABLE\000"
.LASF1269:
	.ascii	"HAL_INS_AERO 18\000"
.LASF179:
	.ascii	"__LDBL_MAX__ 1.7976931348623157e+308L\000"
.LASF1247:
	.ascii	"HAL_BOARD_SUBTYPE_VRBRAIN_V45 4000\000"
.LASF280:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF1119:
	.ascii	"CONFIG_PATH_MAX (4*CONFIG_NAME_MAX + 1)\000"
.LASF729:
	.ascii	"CONFIG_DEBUG_STACK\000"
.LASF174:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF1200:
	.ascii	"UINT_FAST32_MAX UINT32_MAX\000"
.LASF161:
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
.LASF860:
	.ascii	"M_TWOPI (M_PI * 2.0)\000"
.LASF1607:
	.ascii	"operator*\000"
.LASF1604:
	.ascii	"operator+\000"
.LASF1602:
	.ascii	"operator-\000"
.LASF1379:
	.ascii	"UNUSED_RESULT(expr_) _UNUSED_RESULT(__unique_name_ "
	.ascii	"##__COUNTER__, expr_)\000"
.LASF1609:
	.ascii	"operator/\000"
.LASF1676:
	.ascii	"_ZNK7Vector2IfE7is_zeroEv\000"
.LASF761:
	.ascii	"__INCLUDE_NUTTX_MATH_H \000"
.LASF560:
	.ascii	"CONFIG_ARCH_HAVE_USART1 1\000"
.LASF747:
	.ascii	"NEAR \000"
.LASF462:
	.ascii	"CONFIG_STM32_ADC 1\000"
.LASF1459:
	.ascii	"FLT_MIN_EXP\000"
.LASF304:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF380:
	.ascii	"__PX4_NUTTX 1\000"
.LASF249:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF1529:
	.ascii	"RAD_TO_DEG_DOUBLE 57.295779513082322864647721871733"
	.ascii	"66546630859375\000"
.LASF1004:
	.ascii	"_GLIBCXX_HAVE_POWF 1\000"
.LASF1060:
	.ascii	"_GLIBCXX_VERBOSE 1\000"
.LASF1017:
	.ascii	"_GLIBCXX_HAVE_SYS_PARAM_H 1\000"
.LASF191:
	.ascii	"__DEC32_EPSILON__ 1E-6DF\000"
.LASF797:
	.ascii	"_NOARGS void\000"
.LASF1395:
	.ascii	"HAL_GPIO_OUTPUT 1\000"
.LASF1513:
	.ascii	"AP_SUBGROUPINFO(element,name,idx,thisclazz,elclazz)"
	.ascii	" { AP_PARAM_GROUP, idx, name, AP_VAROFFSET(thisclaz"
	.ascii	"z, element), { group_info : elclazz::var_info }, AP"
	.ascii	"_PARAM_FLAG_NESTED_OFFSET }\000"
.LASF858:
	.ascii	"M_LN10 2.30258509299404568402\000"
.LASF128:
	.ascii	"__INT_FAST8_MAX__ 2147483647\000"
.LASF569:
	.ascii	"CONFIG_USART1_TXBUFSIZE 32\000"
.LASF1564:
	.ascii	"double_t\000"
.LASF833:
	.ascii	"fpclassify(__x) ((sizeof(__x) == sizeof(float)) ? _"
	.ascii	"_fpclassifyf(__x) : __fpclassifyd(__x))\000"
.LASF1287:
	.ascii	"HAL_COMPASS_RASPILOT 8\000"
.LASF677:
	.ascii	"CONFIG_EXAMPLES_CDCACM 1\000"
.LASF854:
	.ascii	"M_E 2.7182818284590452354\000"
.LASF1538:
	.ascii	"WGS84_B (WGS84_A * (1 - WGS84_F))\000"
.LASF718:
	.ascii	"CONFIG_DEBUG_MM\000"
.LASF252:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF1390:
	.ascii	"NORETURN __attribute__ ((noreturn))\000"
.LASF1300:
	.ascii	"HAL_BOARD_NAME \"PX4\"\000"
.LASF340:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF48:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF152:
	.ascii	"__FLT_EPSILON__ 1.1920928955078125e-7F\000"
.LASF1565:
	.ascii	"_int8_t\000"
.LASF1087:
	.ascii	"__glibcxx_signed\000"
.LASF121:
	.ascii	"__UINT8_C(c) c\000"
.LASF81:
	.ascii	"__cpp_decltype 200707\000"
.LASF6:
	.ascii	"__VERSION__ \"4.9.3 20141119 (release) [ARM/embedde"
	.ascii	"d-4_9-branch revision 218278]\"\000"
.LASF1240:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_AERO 1015\000"
.LASF1481:
	.ascii	"DBL_MAX_10_EXP __DBL_MAX_10_EXP__\000"
.LASF493:
	.ascii	"CONFIG_ARCH_BOARD_CUSTOM 1\000"
.LASF1340:
	.ascii	"TRUE 1\000"
.LASF1056:
	.ascii	"_GLIBCXX_USE_LONG_LONG 1\000"
.LASF345:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF870:
	.ascii	"M_SQRT2 1.41421356237309504880\000"
.LASF1012:
	.ascii	"_GLIBCXX_HAVE_STDLIB_H 1\000"
.LASF447:
	.ascii	"CONFIG_STM32_SYSCFG 1\000"
.LASF1441:
	.ascii	"AP_HAL_MAIN_CALLBACKS(CALLBACKS) extern \"C\" { int"
	.ascii	" AP_MAIN(int argc, char* const argv[]); int AP_MAIN"
	.ascii	"(int argc, char* const argv[]) { hal.run(argc, argv"
	.ascii	", CALLBACKS); return 0; } }\000"
.LASF1662:
	.ascii	"_ZNK7Vector2IfEplERKS0_\000"
.LASF1432:
	.ascii	"va_copy(d,s) __builtin_va_copy(d,s)\000"
.LASF1198:
	.ascii	"INT_FAST32_MIN INT32_MIN\000"
.LASF244:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF836:
	.ascii	"isnan(y) (fpclassify(y) == FP_NAN)\000"
.LASF656:
	.ascii	"CONFIG_EOL_IS_EITHER_CRLF 1\000"
.LASF1051:
	.ascii	"_GLIBCXX_USE_C99_INTTYPES_TR1 1\000"
.LASF451:
	.ascii	"CONFIG_STM32_TIM9 1\000"
.LASF1552:
	.ascii	"unsigned char\000"
.LASF1299:
	.ascii	"HAL_CPU_CLASS_1000 4\000"
.LASF367:
	.ascii	"__ARM_FP 4\000"
.LASF91:
	.ascii	"__LONG_LONG_MAX__ 9223372036854775807LL\000"
.LASF1407:
	.ascii	"CH_3 2\000"
.LASF799:
	.ascii	"_VOLATILE volatile\000"
.LASF1063:
	.ascii	"__glibcxx_float_has_denorm_loss false\000"
.LASF26:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF1255:
	.ascii	"HAL_INS_MPU60XX_I2C 3\000"
.LASF549:
	.ascii	"CONFIG_MMCSD_SDIO 1\000"
.LASF1204:
	.ascii	"INTPTR_MIN PTR_MIN\000"
.LASF1286:
	.ascii	"HAL_COMPASS_HMC5843_MPU6000 7\000"
.LASF848:
	.ascii	"SING 2\000"
.LASF911:
	.ascii	"__GLIBCXX__ 20141119\000"
.LASF952:
	.ascii	"_GLIBCXX_HAVE_ACOSF 1\000"
.LASF144:
	.ascii	"__FLT_DIG__ 6\000"
.LASF1349:
	.ascii	"PRIOR_OTHER_MAX 255\000"
.LASF1100:
	.ascii	"SCHAR_MAX 127\000"
.LASF162:
	.ascii	"__DBL_MAX_EXP__ 1024\000"
.LASF1647:
	.ascii	"_ZN7Vector2IiE7projectERKS0_\000"
.LASF1536:
	.ascii	"WGS84_IF 298.257223563\000"
.LASF118:
	.ascii	"__INT_LEAST64_MAX__ 9223372036854775807LL\000"
.LASF275:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF238:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF392:
	.ascii	"UAVCAN 1\000"
.LASF1335:
	.ascii	"HAL_RANGEFINDER_LIGHTWARE_I2C_BUS 1\000"
.LASF1567:
	.ascii	"_int16_t\000"
.LASF558:
	.ascii	"CONFIG_ARCH_HAVE_UART7 1\000"
.LASF232:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF794:
	.ascii	"_NOTHROW __attribute__ ((__nothrow__))\000"
.LASF1466:
	.ascii	"DBL_MIN_10_EXP\000"
.LASF1114:
	.ascii	"LLONG_MAX 9223372036854775807LL\000"
.LASF868:
	.ascii	"M_DEG_TO_RAD 0.01745329251994\000"
.LASF524:
	.ascii	"CONFIG_NFILE_STREAMS 8\000"
.LASF74:
	.ascii	"__cpp_unicode_characters 200704\000"
.LASF204:
	.ascii	"__DEC128_MAX__ 9.999999999999999999999999999999999E"
	.ascii	"6144DL\000"
.LASF961:
	.ascii	"_GLIBCXX_HAVE_EBADMSG 1\000"
.LASF515:
	.ascii	"CONFIG_SIG_SIGUSR1 1\000"
.LASF553:
	.ascii	"CONFIG_MTD_RAMTRON 1\000"
.LASF1542:
	.ascii	"USEC_PER_SEC 1000000ULL\000"
.LASF434:
	.ascii	"CONFIG_STM32_ADC1 1\000"
.LASF1674:
	.ascii	"_ZNK7Vector2IfE6is_nanEv\000"
.LASF1104:
	.ascii	"SHRT_MIN (-SHRT_MAX - 1)\000"
.LASF1660:
	.ascii	"_ZNK7Vector2IfEneERKS0_\000"
.LASF770:
	.ascii	"HAVE_INITFINI_ARRAY 1\000"
.LASF1487:
	.ascii	"DBL_MAX __DBL_MAX__\000"
.LASF1338:
	.ascii	"__INCLUDE_STDLIB_H \000"
.LASF1680:
	.ascii	"_ZNK7Vector2IfE6lengthEv\000"
.LASF578:
	.ascii	"CONFIG_USART2_PARITY 0\000"
.LASF724:
	.ascii	"CONFIG_DEBUG_NET\000"
.LASF1025:
	.ascii	"_GLIBCXX_HAVE_TGMATH_H 1\000"
.LASF1590:
	.ascii	"off_t\000"
.LASF936:
	.ascii	"_GLIBCXX_END_NAMESPACE_CONTAINER \000"
.LASF281:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF466:
	.ascii	"CONFIG_STM32_JTAG_SW_ENABLE 1\000"
.LASF391:
	.ascii	"PX4_GIT_VERSION \"3df5644c\"\000"
.LASF201:
	.ascii	"__DEC128_MIN_EXP__ (-6142)\000"
.LASF1493:
	.ascii	"DBL_EPSILON __DBL_EPSILON__\000"
.LASF552:
	.ascii	"CONFIG_MTD_BYTE_WRITE 1\000"
.LASF164:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
.LASF18:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF444:
	.ascii	"CONFIG_STM32_SPI1 1\000"
.LASF452:
	.ascii	"CONFIG_STM32_TIM10 1\000"
.LASF543:
	.ascii	"CONFIG_RTC_DATETIME 1\000"
.LASF1277:
	.ascii	"HAL_BARO_MS5637_I2C 8\000"
.LASF1700:
	.ascii	"GNU C++ 4.9.3 20141119 (release) [ARM/embedded-4_9-"
	.ascii	"branch revision 218278] -fpreprocessed -mcpu=cortex"
	.ascii	"-m4 -mthumb -march=armv7e-m -mfpu=fpv4-sp-d16 -mflo"
	.ascii	"at-abi=hard -g3 -Os -std=gnu++11 -fno-exceptions -f"
	.ascii	"no-rtti -fno-threadsafe-statics -fno-strict-aliasin"
	.ascii	"g -fomit-frame-pointer -funsafe-math-optimizations "
	.ascii	"-fno-builtin-printf -ffunction-sections -fdata-sect"
	.ascii	"ions -fsingle-precision-constant -fvisibility=hidde"
	.ascii	"n\000"
.LASF782:
	.ascii	"__NEWLIB_MINOR__ 1\000"
.LASF801:
	.ascii	"_DOTS , ...\000"
.LASF913:
	.ascii	"_GLIBCXX_CONST __attribute__ ((__const__))\000"
.LASF1016:
	.ascii	"_GLIBCXX_HAVE_STRTOF 1\000"
.LASF1297:
	.ascii	"HAL_CPU_CLASS_16 1\000"
.LASF827:
	.ascii	"FP_NORMAL 4\000"
.LASF102:
	.ascii	"__SIG_ATOMIC_MAX__ 2147483647\000"
.LASF110:
	.ascii	"__UINT32_MAX__ 4294967295UL\000"
.LASF559:
	.ascii	"CONFIG_ARCH_HAVE_UART8 1\000"
.LASF36:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF1624:
	.ascii	"_ZNK7Vector2IiE5angleEv\000"
.LASF1081:
	.ascii	"__glibcxx_double_has_denorm_loss\000"
.LASF518:
	.ascii	"CONFIG_SIG_SIGCONDTIMEDOUT 16\000"
.LASF544:
	.ascii	"CONFIG_RTC_HSECLOCK 1\000"
.LASF482:
	.ascii	"CONFIG_SDIO_PRI 128\000"
.LASF507:
	.ascii	"CONFIG_SEM_PREALLOCHOLDERS 0\000"
.LASF97:
	.ascii	"__SIZE_MAX__ 4294967295U\000"
.LASF1640:
	.ascii	"normalize\000"
.LASF506:
	.ascii	"CONFIG_PRIORITY_INHERITANCE 1\000"
.LASF450:
	.ascii	"CONFIG_STM32_TIM4 1\000"
.LASF1628:
	.ascii	"_ZNK7Vector2IiE6is_infEv\000"
.LASF1092:
	.ascii	"__glibcxx_max_digits10\000"
.LASF1164:
	.ascii	"MQ_OPEN_MAX _POSIX_MQ_OPEN_MAX\000"
.LASF143:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF1135:
	.ascii	"_POSIX_DELAYTIMER_MAX 32\000"
.LASF758:
	.ascii	"CONFIG_CAN_PASS_STRUCTS 1\000"
.LASF272:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF1684:
	.ascii	"_ZN7Vector2IfE7projectERKS0_\000"
.LASF619:
	.ascii	"CONFIG_CDCACM 1\000"
.LASF1634:
	.ascii	"_ZN7Vector2IiEclEii\000"
.LASF492:
	.ascii	"CONFIG_BOOT_RUNFROMFLASH 1\000"
.LASF469:
	.ascii	"CONFIG_STM32_USART 1\000"
.LASF1032:
	.ascii	"_GLIBCXX_HAVE_WCSTOF 1\000"
.LASF1384:
	.ascii	"bcopy(b1,b2,len) (void)memmove(b2,b1,len)\000"
.LASF967:
	.ascii	"_GLIBCXX_HAVE_ENOSPC 1\000"
.LASF357:
	.ascii	"__ARM_ARCH_PROFILE 77\000"
.LASF273:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF1094:
	.ascii	"__ARCH_ARM_INCLUDE_TYPES_H \000"
.LASF1083:
	.ascii	"__glibcxx_double_tinyness_before\000"
.LASF845:
	.ascii	"signgam (*__signgam())\000"
.LASF921:
	.ascii	"_GLIBCXX_USE_CONSTEXPR constexpr\000"
.LASF189:
	.ascii	"__DEC32_MIN__ 1E-95DF\000"
.LASF297:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF145:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF1655:
	.ascii	"_ZN7Vector2IiE41closest_distance_between_radial_and"
	.ascii	"_pointERKS0_S2_\000"
.LASF135:
	.ascii	"__UINT_FAST64_MAX__ 18446744073709551615ULL\000"
.LASF29:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF127:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF218:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF711:
	.ascii	"CONFIG_NET\000"
.LASF142:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF1679:
	.ascii	"_ZNK7Vector2IfE14length_squaredEv\000"
.LASF633:
	.ascii	"CONFIG_CDCACM_RXBUFSIZE 600\000"
.LASF405:
	.ascii	"__INCLUDE_NUTTX_CONFIG_H \000"
.LASF485:
	.ascii	"CONFIG_ARCH_STACKDUMP 1\000"
.LASF792:
	.ascii	"_BEGIN_STD_C extern \"C\" {\000"
.LASF478:
	.ascii	"CONFIG_STM32_USART_SINGLEWIRE 1\000"
.LASF787:
	.ascii	"__RAND_MAX 0x7fffffff\000"
.LASF181:
	.ascii	"__LDBL_EPSILON__ 2.2204460492503131e-16L\000"
.LASF508:
	.ascii	"CONFIG_SEM_NNESTPRIO 8\000"
.LASF889:
	.ascii	"M_1_PI_F 0.31830988618379067154f\000"
.LASF920:
	.ascii	"_GLIBCXX_CONSTEXPR constexpr\000"
.LASF1645:
	.ascii	"_ZN7Vector2IiE7reflectERKS0_\000"
.LASF879:
	.ascii	"M_LOG2E_F 1.4426950408889634074f\000"
.LASF291:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF917:
	.ascii	"_GLIBCXX_USE_DEPRECATED 1\000"
.LASF318:
	.ascii	"__USA_IBIT__ 16\000"
.LASF261:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF1434:
	.ascii	"_VA_LIST_ \000"
.LASF1498:
	.ascii	"FLT_MIN __FLT_MIN__\000"
.LASF970:
	.ascii	"_GLIBCXX_HAVE_ENOTRECOVERABLE 1\000"
.LASF270:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF1238:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_NAVIO2 1013\000"
.LASF1102:
	.ascii	"CHAR_MIN 0\000"
.LASF877:
	.ascii	"M_INVLN2 1.4426950408889633870E0\000"
.LASF1233:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_MINLURE 1008\000"
.LASF830:
	.ascii	"MATH_ERRNO 1\000"
.LASF192:
	.ascii	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF\000"
.LASF1152:
	.ascii	"PATH_MAX _POSIX_PATH_MAX\000"
.LASF1393:
	.ascii	"ANALOG_INPUT_NONE 255\000"
.LASF943:
	.ascii	"_GLIBCXX_SYNCHRONIZATION_HAPPENS_AFTER(A) \000"
.LASF716:
	.ascii	"CONFIG_NFS\000"
.LASF812:
	.ascii	"_ATTRIBUTE(attrs) __attribute__ (attrs)\000"
.LASF898:
	.ascii	"M_SQRT3_F 1.73205080756887719000f\000"
.LASF1394:
	.ascii	"HAL_GPIO_INPUT 0\000"
.LASF976:
	.ascii	"_GLIBCXX_HAVE_ETIME 1\000"
.LASF891:
	.ascii	"M_2_SQRTPI_F 1.12837916709551257390f\000"
.LASF522:
	.ascii	"CONFIG_NPTHREAD_KEYS 4\000"
.LASF1127:
	.ascii	"_POSIX_OPEN_MAX CONFIG_NFILE_DESCRIPTORS\000"
.LASF1236:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_QFLIGHT 1011\000"
.LASF1021:
	.ascii	"_GLIBCXX_HAVE_SYS_TYPES_H 1\000"
.LASF13:
	.ascii	"__OPTIMIZE_SIZE__ 1\000"
.LASF1222:
	.ascii	"HAL_BOARD_QURT 9\000"
.LASF546:
	.ascii	"CONFIG_MMCSD 1\000"
.LASF1472:
	.ascii	"DBL_MAX_EXP\000"
.LASF1579:
	.ascii	"float32\000"
.LASF1187:
	.ascii	"INT_LEAST32_MAX INT32_MAX\000"
.LASF1241:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_DARK 1016\000"
.LASF1151:
	.ascii	"OPEN_MAX _POSIX_OPEN_MAX\000"
.LASF743:
	.ascii	"naked_function __attribute__ ((naked,no_instrument_"
	.ascii	"function))\000"
.LASF1202:
	.ascii	"INT_FAST64_MAX INT64_MAX\000"
.LASF1167:
	.ascii	"SEM_VALUE_MAX _POSIX_SEM_VALUE_MAX\000"
.LASF303:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF915:
	.ascii	"_GLIBCXX_HAVE_ATTRIBUTE_VISIBILITY 1\000"
.LASF1502:
	.ascii	"FLT_ROUNDS 1\000"
.LASF1388:
	.ascii	"FUNCTOR_BIND_MEMBER(func,rettype,...) Functor<retty"
	.ascii	"pe, ## __VA_ARGS__>::bind<std::remove_reference<dec"
	.ascii	"ltype(*this)>::type, func>(this)\000"
.LASF208:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF371:
	.ascii	"__ARM_ARCH_7EM__ 1\000"
.LASF1408:
	.ascii	"CH_4 3\000"
.LASF941:
	.ascii	"__glibcxx_assert(_Condition) \000"
.LASF625:
	.ascii	"CONFIG_CDCACM_EPBULKOUT_FSSIZE 64\000"
.LASF548:
	.ascii	"CONFIG_MMCSD_MULTIBLOCK_DISABLE 1\000"
.LASF334:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2\000"
.LASF1282:
	.ascii	"HAL_COMPASS_HIL 3\000"
.LASF43:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF1074:
	.ascii	"__glibcxx_max(T) (__glibcxx_signed (T) ? (((((T)1 <"
	.ascii	"< (__glibcxx_digits (T) - 1)) - 1) << 1) + 1) : ~(T"
	.ascii	")0)\000"
.LASF1650:
	.ascii	"perpendicular\000"
.LASF219:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF1115:
	.ascii	"ULLONG_MAX 18446744073709551615ULL\000"
.LASF1077:
	.ascii	"__glibcxx_max_digits10(T) (2 + (T) * 643L / 2136)\000"
.LASF1089:
	.ascii	"__glibcxx_max\000"
.LASF499:
	.ascii	"CONFIG_RR_INTERVAL 0\000"
.LASF1582:
	.ascii	"size_t\000"
.LASF338:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 2\000"
.LASF567:
	.ascii	"CONFIG_UART7_SERIAL_CONSOLE 1\000"
.LASF406:
	.ascii	"CONFIG_NUTTX_NEWCONFIG 1\000"
.LASF375:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF644:
	.ascii	"CONFIG_FAT_DMAMEMORY 1\000"
.LASF498:
	.ascii	"CONFIG_MSEC_PER_TICK 1\000"
.LASF1044:
	.ascii	"_GLIBCXX_HOSTED 1\000"
.LASF299:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF1573:
	.ascii	"uint8_t\000"
.LASF1382:
	.ascii	"__INCLUDE_STRING_H \000"
.LASF1195:
	.ascii	"INT_FAST16_MIN INT16_MIN\000"
.LASF70:
	.ascii	"__GXX_WEAK__ 1\000"
.LASF426:
	.ascii	"CONFIG_ARMV7M_TOOLCHAIN_GNU_EABI 1\000"
.LASF1266:
	.ascii	"HAL_INS_QFLIGHT 15\000"
.LASF516:
	.ascii	"CONFIG_SIG_SIGUSR2 2\000"
.LASF202:
	.ascii	"__DEC128_MAX_EXP__ 6145\000"
.LASF1451:
	.ascii	"DBL_MANT_DIG __DBL_MANT_DIG__\000"
.LASF1337:
	.ascii	"HAL_WITH_UAVCAN 0\000"
.LASF1480:
	.ascii	"FLT_MAX_10_EXP __FLT_MAX_10_EXP__\000"
.LASF944:
	.ascii	"_GLIBCXX_BEGIN_EXTERN_C extern \"C\" {\000"
.LASF1380:
	.ascii	"SITL_printf(fmt,args...) \000"
.LASF157:
	.ascii	"__FP_FAST_FMAF 1\000"
.LASF554:
	.ascii	"CONFIG_PIPES 1\000"
.LASF93:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF1402:
	.ascii	"RC_INPUT_MAX_PULSEWIDTH 2100\000"
.LASF76:
	.ascii	"__cpp_unicode_literals 200710\000"
.LASF1653:
	.ascii	"_ZN7Vector2IiE13closest_pointERKS0_S2_S2_\000"
.LASF1678:
	.ascii	"_ZN7Vector2IfE4zeroEv\000"
.LASF1303:
	.ascii	"HAL_BOARD_LOG_DIRECTORY \"/fs/microsd/APM/LOGS\"\000"
.LASF1194:
	.ascii	"UINT_FAST8_MAX UINT8_MAX\000"
.LASF116:
	.ascii	"__INT_LEAST32_MAX__ 2147483647L\000"
.LASF1327:
	.ascii	"HAL_INS_LSM9DS0_EXT_A_NAME \"lsm9ds0_ext_am\"\000"
.LASF931:
	.ascii	"_GLIBCXX_STD_A std\000"
.LASF1507:
	.ascii	"AP_PARAM_NO_SHIFT 8\000"
.LASF617:
	.ascii	"CONFIG_USBDEV_BUSPOWERED 1\000"
.LASF1129:
	.ascii	"_POSIX_PIPE_BUF 512\000"
.LASF1371:
	.ascii	"ToDeg(x) degrees(x)\000"
.LASF241:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF217:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF445:
	.ascii	"CONFIG_STM32_SPI2 1\000"
.LASF453:
	.ascii	"CONFIG_STM32_TIM11 1\000"
.LASF1429:
	.ascii	"va_start(v,l) __builtin_va_start(v,l)\000"
.LASF1593:
	.ascii	"socklen_t\000"
.LASF417:
	.ascii	"CONFIG_ARCH_CORTEXM4 1\000"
.LASF326:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF207:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF1646:
	.ascii	"project\000"
.LASF1176:
	.ascii	"UINT32_MAX 4294967295u\000"
.LASF407:
	.ascii	"CONFIG_HOST_OSX 1\000"
.LASF1464:
	.ascii	"LDBL_MIN_EXP __LDBL_MIN_EXP__\000"
.LASF1654:
	.ascii	"closest_distance_between_radial_and_point\000"
.LASF342:
	.ascii	"__GCC_HAVE_DWARF2_CFI_ASM 1\000"
.LASF773:
	.ascii	"_HAVE_CC_INHIBIT_LOOP_TO_LIBCALL 1\000"
.LASF1580:
	.ascii	"float64\000"
.LASF439:
	.ascii	"CONFIG_STM32_I2C1 1\000"
.LASF1668:
	.ascii	"_ZN7Vector2IfEmLEf\000"
.LASF100:
	.ascii	"__UINTMAX_MAX__ 18446744073709551615ULL\000"
.LASF1312:
	.ascii	"HAL_HAVE_IMU_HEATER 1\000"
.LASF1163:
	.ascii	"AIO_MAX _POSIX_AIO_MAX\000"
.LASF531:
	.ascii	"CONFIG_IDLETHREAD_STACKSIZE 1000\000"
.LASF545:
	.ascii	"CONFIG_WATCHDOG 1\000"
.LASF1696:
	.ascii	"_Z16Polygon_completeIiEbPK7Vector2IT_Ej\000"
.LASF596:
	.ascii	"CONFIG_USART6_RXBUFSIZE 300\000"
.LASF245:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF500:
	.ascii	"CONFIG_SCHED_INSTRUMENTATION 1\000"
.LASF1330:
	.ascii	"HAL_INS_ICM20608_NAME \"icm20608\"\000"
.LASF1224:
	.ascii	"HAL_BOARD_SUBTYPE_NONE -1\000"
.LASF294:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF1061:
	.ascii	"_GTHREAD_USE_MUTEX_TIMEDLOCK 1\000"
.LASF307:
	.ascii	"__HA_FBIT__ 7\000"
.LASF1357:
	.ascii	"MB_CUR_MAX 1\000"
.LASF264:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF68:
	.ascii	"__has_include(STR) __has_include__(STR)\000"
.LASF413:
	.ascii	"CONFIG_DEBUG_SYMBOLS 1\000"
.LASF203:
	.ascii	"__DEC128_MIN__ 1E-6143DL\000"
.LASF1237:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_PXFMINI 1012\000"
.LASF575:
	.ascii	"CONFIG_USART2_TXBUFSIZE 1100\000"
.LASF1315:
	.ascii	"HAL_GPIO_B_LED_PIN 26\000"
.LASF193:
	.ascii	"__DEC64_MANT_DIG__ 16\000"
.LASF504:
	.ascii	"CONFIG_START_DAY 1\000"
.LASF156:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF837:
	.ascii	"isnormal(y) (fpclassify(y) == FP_NORMAL)\000"
.LASF954:
	.ascii	"_GLIBCXX_HAVE_AS_SYMVER_DIRECTIVE 1\000"
.LASF509:
	.ascii	"CONFIG_FDCLONE_STDIO 1\000"
.LASF83:
	.ascii	"__cpp_rvalue_reference 200610\000"
.LASF327:
	.ascii	"__WCHAR_UNSIGNED__ 1\000"
.LASF1488:
	.ascii	"LDBL_MAX __LDBL_MAX__\000"
.LASF1026:
	.ascii	"_GLIBCXX_HAVE_UNISTD_H 1\000"
.LASF878:
	.ascii	"M_E_F 2.7182818284590452354f\000"
.LASF131:
	.ascii	"__INT_FAST64_MAX__ 9223372036854775807LL\000"
.LASF697:
	.ascii	"CONFIG_NSH_FATMOUNTPT \"/tmp\"\000"
.LASF1325:
	.ascii	"HAL_INS_LSM9DS0_A_NAME \"lsm9ds0_am\"\000"
.LASF1309:
	.ascii	"HAL_SERIAL0_BAUD_DEFAULT 115200\000"
.LASF732:
	.ascii	"CONFIG_CPP_HAVE_WARNING 1\000"
.LASF839:
	.ascii	"isgreater(x,y) (__extension__ ({__typeof__(x) __x ="
	.ascii	" (x); __typeof__(y) __y = (y); !isunordered(__x,__y"
	.ascii	") && (__x > __y);}))\000"
.LASF400:
	.ascii	"__EXPORT __attribute__ ((visibility (\"default\")))"
	.ascii	"\000"
.LASF1468:
	.ascii	"FLT_MIN_10_EXP __FLT_MIN_10_EXP__\000"
.LASF1618:
	.ascii	"_ZN7Vector2IiEdVEi\000"
.LASF414:
	.ascii	"CONFIG_ARCH_ARM 1\000"
.LASF90:
	.ascii	"__LONG_MAX__ 2147483647L\000"
.LASF28:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF1267:
	.ascii	"HAL_INS_QURT 16\000"
.LASF595:
	.ascii	"CONFIG_UART4_2STOP 0\000"
.LASF1068:
	.ascii	"__glibcxx_double_tinyness_before false\000"
.LASF1052:
	.ascii	"_GLIBCXX_USE_C99_INTTYPES_WCHAR_T_TR1 1\000"
.LASF1149:
	.ascii	"NAME_MAX _POSIX_NAME_MAX\000"
.LASF61:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF1097:
	.ascii	"__ARCH_ARM_INCLUDE_LIMITS_H \000"
.LASF1397:
	.ascii	"HAL_GPIO_INTERRUPT_LOW 0\000"
.LASF134:
	.ascii	"__UINT_FAST32_MAX__ 4294967295U\000"
.LASF257:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF158:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF1113:
	.ascii	"LLONG_MIN (-LLONG_MAX - 1)\000"
.LASF772:
	.ascii	"_HAVE_LONG_DOUBLE 1\000"
.LASF561:
	.ascii	"CONFIG_ARCH_HAVE_USART2 1\000"
.LASF918:
	.ascii	"_GLIBCXX_DEPRECATED __attribute__ ((__deprecated__)"
	.ascii	")\000"
.LASF348:
	.ascii	"__ARM_FEATURE_QBIT 1\000"
.LASF1072:
	.ascii	"__glibcxx_signed(T) ((T)(-1) < 0)\000"
.LASF125:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF607:
	.ascii	"CONFIG_UART7_2STOP 0\000"
.LASF1062:
	.ascii	"__glibcxx_integral_traps true\000"
.LASF1111:
	.ascii	"LONG_MAX 2147483647L\000"
.LASF250:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF690:
	.ascii	"CONFIG_NSH_INITSCRIPT \"init.d/rcS\"\000"
.LASF385:
	.ascii	"SKETCHNAME \"ArduPlane\"\000"
.LASF258:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF818:
	.ascii	"HUGE_VALF (__builtin_huge_valf())\000"
.LASF1231:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_BEBOP 1006\000"
.LASF221:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF1428:
	.ascii	"__GNUC_VA_LIST \000"
.LASF1284:
	.ascii	"HAL_COMPASS_AK8963_MPU9250 5\000"
.LASF1067:
	.ascii	"__glibcxx_double_traps false\000"
.LASF756:
	.ascii	"CONFIG_HAVE_DOUBLE 1\000"
.LASF477:
	.ascii	"CONFIG_SERIAL_DISABLE_REORDERING 1\000"
.LASF751:
	.ascii	"CONFIG_LONG_IS_NOT_INT\000"
.LASF720:
	.ascii	"CONFIG_DEBUG_DMA\000"
.LASF351:
	.ascii	"__ARM_32BIT_STATE 1\000"
.LASF674:
	.ascii	"CONFIG_HAVE_CXX 1\000"
.LASF1378:
	.ascii	"_UNUSED_RESULT(uniq_,expr_) do { decltype(expr_) un"
	.ascii	"iq_ __attribute__((unused)); uniq_ = expr_; } while"
	.ascii	" (0)\000"
.LASF592:
	.ascii	"CONFIG_UART4_BAUD 57600\000"
.LASF180:
	.ascii	"__LDBL_MIN__ 2.2250738585072014e-308L\000"
.LASF1013:
	.ascii	"_GLIBCXX_HAVE_STRERROR_R 1\000"
.LASF370:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF1667:
	.ascii	"_ZN7Vector2IfEmIERKS0_\000"
.LASF594:
	.ascii	"CONFIG_UART4_PARITY 0\000"
.LASF1126:
	.ascii	"_POSIX_NGROUPS_MAX 0\000"
.LASF691:
	.ascii	"CONFIG_NSH_ROMFSDEVNO 0\000"
.LASF781:
	.ascii	"__NEWLIB__ 2\000"
.LASF989:
	.ascii	"_GLIBCXX_HAVE_ICONV 1\000"
.LASF220:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF807:
	.ascii	"_DEFUN(name,arglist,args) name(args)\000"
.LASF700:
	.ascii	"CONFIG_SYSTEM_READLINE 1\000"
.LASF1033:
	.ascii	"_GLIBCXX_HAVE_WCTYPE_H 1\000"
.LASF906:
	.ascii	"_XOPEN_ __fdlibm_xopen\000"
.LASF1414:
	.ascii	"CH_10 9\000"
.LASF1339:
	.ascii	"__INCLUDE_SYS_TYPES_H \000"
.LASF138:
	.ascii	"__GCC_IEC_559 0\000"
.LASF650:
	.ascii	"CONFIG_STDIO_BUFFER_SIZE 32\000"
.LASF1479:
	.ascii	"LDBL_MAX_10_EXP\000"
.LASF731:
	.ascii	"CONFIG_CPP_HAVE_VARARGS 1\000"
.LASF1704:
	.ascii	"decltype(nullptr)\000"
.LASF223:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF582:
	.ascii	"CONFIG_USART3_RXBUFSIZE 300\000"
.LASF458:
	.ascii	"CONFIG_STM32_USART6 1\000"
.LASF1477:
	.ascii	"FLT_MAX_10_EXP\000"
.LASF1682:
	.ascii	"_ZNK7Vector2IfE10normalizedEv\000"
.LASF1066:
	.ascii	"__glibcxx_double_has_denorm_loss false\000"
.LASF1257:
	.ascii	"HAL_INS_PX4 5\000"
.LASF467:
	.ascii	"CONFIG_STM32_DISABLE_IDLE_SLEEP_DURING_DEBUG 1\000"
.LASF1110:
	.ascii	"LONG_MIN (-LONG_MAX - 1)\000"
.LASF1301:
	.ascii	"HAL_CPU_CLASS HAL_CPU_CLASS_150\000"
.LASF586:
	.ascii	"CONFIG_USART3_PARITY 0\000"
.LASF1184:
	.ascii	"INT_LEAST16_MAX INT16_MAX\000"
.LASF1447:
	.ascii	"FLT_MANT_DIG\000"
.LASF441:
	.ascii	"CONFIG_STM32_OTGFS 1\000"
.LASF1035:
	.ascii	"_GLIBCXX_PACKAGE_BUGREPORT \"\"\000"
.LASF1608:
	.ascii	"_ZNK7Vector2IiEmlEi\000"
.LASF670:
	.ascii	"CONFIG_SCHED_LPWORKPRIORITY 50\000"
.LASF1523:
	.ascii	"M_GOLDEN 1.6180339f\000"
.LASF1603:
	.ascii	"_ZNK7Vector2IiEngEv\000"
.LASF1225:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_NONE 1000\000"
.LASF10:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF778:
	.ascii	"_UNBUF_STREAM_OPT 1\000"
.LASF1275:
	.ascii	"HAL_BARO_HIL 6\000"
.LASF1631:
	.ascii	"operator[]\000"
.LASF86:
	.ascii	"__GXX_ABI_VERSION 1002\000"
.LASF525:
	.ascii	"CONFIG_NAME_MAX 32\000"
.LASF1694:
	.ascii	"Polygon_complete<int>\000"
.LASF59:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF224:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF1446:
	.ascii	"FLT_RADIX __FLT_RADIX__\000"
.LASF574:
	.ascii	"CONFIG_USART2_RXBUFSIZE 600\000"
.LASF1128:
	.ascii	"_POSIX_PATH_MAX CONFIG_PATH_MAX\000"
.LASF306:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF1249:
	.ascii	"HAL_BOARD_SUBTYPE_VRBRAIN_V52 4002\000"
.LASF1348:
	.ascii	"PRIOR_OTHER_MIN 0\000"
.LASF693:
	.ascii	"CONFIG_NSH_ARCHROMFS 1\000"
.LASF1475:
	.ascii	"DBL_MAX_EXP __DBL_MAX_EXP__\000"
.LASF1036:
	.ascii	"_GLIBCXX_PACKAGE_NAME \"package-unused\"\000"
.LASF1409:
	.ascii	"CH_5 4\000"
.LASF1116:
	.ascii	"PTR_MIN (-PTR_MAX - 1)\000"
.LASF1499:
	.ascii	"DBL_MIN __DBL_MIN__\000"
.LASF349:
	.ascii	"__ARM_FEATURE_SAT 1\000"
.LASF663:
	.ascii	"CONFIG_ARCH_MEMCPY 1\000"
.LASF1171:
	.ascii	"INT16_MIN (-INT16_MAX - 1)\000"
.LASF1213:
	.ascii	"SIZE_MAX UINT32_MAX\000"
.LASF1492:
	.ascii	"FLT_EPSILON __FLT_EPSILON__\000"
.LASF925:
	.ascii	"_GLIBCXX_NOTHROW _GLIBCXX_USE_NOEXCEPT\000"
.LASF1571:
	.ascii	"_int64_t\000"
.LASF150:
	.ascii	"__FLT_MAX__ 3.4028234663852886e+38F\000"
.LASF50:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF473:
	.ascii	"CONFIG_UART4_RXDMA 1\000"
.LASF1088:
	.ascii	"__glibcxx_min\000"
.LASF1635:
	.ascii	"_ZN7Vector2IiE4zeroEv\000"
.LASF474:
	.ascii	"CONFIG_UART5_RXDMA 1\000"
.LASF227:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF344:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF440:
	.ascii	"CONFIG_STM32_I2C2 1\000"
.LASF255:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF421:
	.ascii	"CONFIG_ARCH_HAVE_CMNVECTOR 1\000"
.LASF834:
	.ascii	"isfinite(__y) (__extension__ ({int __cy = fpclassif"
	.ascii	"y(__y); __cy != FP_INFINITE && __cy != FP_NAN;}))\000"
.LASF95:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF946:
	.ascii	"_GLIBCXX_OS_DEFINES 1\000"
.LASF895:
	.ascii	"M_SQRT1_2_F 0.70710678118654752440f\000"
.LASF629:
	.ascii	"CONFIG_CDCACM_EPBULKIN_HSSIZE 512\000"
.LASF928:
	.ascii	"_GLIBCXX_INLINE_VERSION 0\000"
.LASF1469:
	.ascii	"DBL_MIN_10_EXP __DBL_MIN_10_EXP__\000"
.LASF940:
	.ascii	"_GLIBCXX_END_NAMESPACE_LDBL \000"
.LASF1443:
	.ascii	"STORAGE_NUM_AREAS 13\000"
.LASF1055:
	.ascii	"_GLIBCXX_USE_GETTIMEOFDAY 1\000"
.LASF476:
	.ascii	"CONFIG_UART8_RXDMA 1\000"
.LASF1166:
	.ascii	"SEM_NSEMS_MAX _POSIX_SEM_NSEMS_MAX\000"
.LASF84:
	.ascii	"__cpp_variadic_templates 200704\000"
.LASF256:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF1139:
	.ascii	"_POSIX_AIO_MAX 1\000"
.LASF1251:
	.ascii	"HAL_BOARD_SUBTYPE_VRUBRAIN_V52 4004\000"
.LASF909:
	.ascii	"_GLIBCXX_NUMERIC_LIMITS 1\000"
.LASF216:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF182:
	.ascii	"__LDBL_DENORM_MIN__ 4.9406564584124654e-324L\000"
.LASF99:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF269:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF598:
	.ascii	"CONFIG_USART6_BAUD 57600\000"
.LASF997:
	.ascii	"_GLIBCXX_HAVE_LOCALE_H 1\000"
.LASF374:
	.ascii	"__ARM_ARCH_EXT_IDIV__ 1\000"
.LASF65:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF1058:
	.ascii	"_GLIBCXX_USE_TMPNAM 1\000"
.LASF1671:
	.ascii	"_ZNK7Vector2IfErmERKS0_\000"
.LASF1664:
	.ascii	"_ZNK7Vector2IfEmlEf\000"
.LASF1649:
	.ascii	"_ZN7Vector2IiE9projectedERKS0_\000"
.LASF666:
	.ascii	"CONFIG_SCHED_WORKPRIORITY 192\000"
.LASF1623:
	.ascii	"_ZNK7Vector2IiE5angleERKS0_\000"
.LASF1197:
	.ascii	"UINT_FAST16_MAX UINT16_MAX\000"
.LASF226:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF1049:
	.ascii	"_GLIBCXX_STDIO_SEEK_END 2\000"
.LASF1661:
	.ascii	"_ZNK7Vector2IfEngEv\000"
.LASF1336:
	.ascii	"HAL_COMPASS_HMC5843_I2C_ADDR 0x1E\000"
.LASF1503:
	.ascii	"AP_MAX_NAME_SIZE 16\000"
.LASF1599:
	.ascii	"operator!=\000"
.LASF1398:
	.ascii	"HAL_GPIO_INTERRUPT_HIGH 1\000"
.LASF1138:
	.ascii	"_POSIX_AIO_LISTIO_MAX 2\000"
.LASF23:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF1572:
	.ascii	"int8_t\000"
.LASF1203:
	.ascii	"UINT_FAST64_MAX UINT64_MAX\000"
.LASF968:
	.ascii	"_GLIBCXX_HAVE_ENOSR 1\000"
.LASF626:
	.ascii	"CONFIG_CDCACM_EPBULKOUT_HSSIZE 512\000"
.LASF1250:
	.ascii	"HAL_BOARD_SUBTYPE_VRUBRAIN_V51 4003\000"
.LASF1460:
	.ascii	"DBL_MIN_EXP\000"
.LASF712:
	.ascii	"CONFIG_NSOCKET_DESCRIPTORS\000"
.LASF1019:
	.ascii	"_GLIBCXX_HAVE_SYS_STAT_H 1\000"
.LASF1232:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_RASPILOT 1007\000"
.LASF470:
	.ascii	"CONFIG_STM32_RXDMA_BUFFER_SIZE_OVERRIDE 256\000"
.LASF534:
	.ascii	"CONFIG_PTHREAD_STACK_DEFAULT 2048\000"
.LASF292:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF1293:
	.ascii	"HAL_COMPASS_NAVIO2 14\000"
.LASF354:
	.ascii	"__ARM_FEATURE_SIMD32 1\000"
.LASF502:
	.ascii	"CONFIG_START_YEAR 1970\000"
.LASF437:
	.ascii	"CONFIG_STM32_DMA1 1\000"
.LASF300:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF784:
	.ascii	"__GNUC_PREREQ__(ma,mi) __GNUC_PREREQ(ma, mi)\000"
.LASF1333:
	.ascii	"HAL_COMPASS_HMC5843_NAME \"hmc5843\"\000"
.LASF979:
	.ascii	"_GLIBCXX_HAVE_EWOULDBLOCK 1\000"
.LASF1278:
	.ascii	"HAL_BARO_QFLIGHT 9\000"
.LASF680:
	.ascii	"CONFIG_NSH_LIBRARY 1\000"
.LASF1425:
	.ascii	"_STDARG_H \000"
.LASF209:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF362:
	.ascii	"__thumb2__ 1\000"
.LASF328:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1\000"
.LASF738:
	.ascii	"weak_const_function __attribute__ ((weak, __const__"
	.ascii	"))\000"
.LASF267:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF986:
	.ascii	"_GLIBCXX_HAVE_GETIPINFO 1\000"
.LASF274:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF1271:
	.ascii	"HAL_BARO_MS5611_I2C 2\000"
.LASF669:
	.ascii	"CONFIG_SCHED_LPWORK 1\000"
.LASF287:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF1010:
	.ascii	"_GLIBCXX_HAVE_STDBOOL_H 1\000"
.LASF641:
	.ascii	"CONFIG_FAT_LFN 1\000"
.LASF1123:
	.ascii	"_POSIX_MAX_CANON 255\000"
.LASF647:
	.ascii	"CONFIG_MM_REGIONS 2\000"
.LASF1555:
	.ascii	"char32_t\000"
.LASF389:
	.ascii	"MAVLINK_PROTOCOL_VERSION 2\000"
.LASF117:
	.ascii	"__INT32_C(c) c ## L\000"
.LASF284:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF1595:
	.ascii	"sizetype\000"
.LASF1005:
	.ascii	"_GLIBCXX_HAVE_SINF 1\000"
.LASF198:
	.ascii	"__DEC64_EPSILON__ 1E-15DD\000"
.LASF685:
	.ascii	"CONFIG_NSH_LINELEN 128\000"
.LASF741:
	.ascii	"packed_struct __attribute__ ((packed))\000"
.LASF965:
	.ascii	"_GLIBCXX_HAVE_ENODATA 1\000"
.LASF464:
	.ascii	"CONFIG_STM32_I2C 1\000"
.LASF188:
	.ascii	"__DEC32_MAX_EXP__ 97\000"
.LASF1505:
	.ascii	"AP_PARAM_FLAG_POINTER 2\000"
.LASF958:
	.ascii	"_GLIBCXX_HAVE_COMPLEX_H 1\000"
.LASF251:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF1597:
	.ascii	"operator()\000"
.LASF1410:
	.ascii	"CH_6 5\000"
.LASF1574:
	.ascii	"int16_t\000"
.LASF1070:
	.ascii	"__glibcxx_long_double_traps false\000"
.LASF1258:
	.ascii	"HAL_INS_L3G4200D 7\000"
.LASF1057:
	.ascii	"_GLIBCXX_USE_SC_NPROCESSORS_ONLN 1\000"
.LASF1362:
	.ascii	"atoll(nptr) strtoll((nptr), NULL, 10)\000"
.LASF1551:
	.ascii	"signed char\000"
.LASF1132:
	.ascii	"_POSIX_TZNAME_MAX 3\000"
.LASF1521:
	.ascii	"M_PI_2\000"
.LASF1146:
	.ascii	"LINK_MAX _POSIX_LINK_MAX\000"
.LASF1614:
	.ascii	"_ZN7Vector2IiEmIERKS0_\000"
.LASF1177:
	.ascii	"INT64_MIN (-INT64_MAX - 1ll)\000"
.LASF1065:
	.ascii	"__glibcxx_float_tinyness_before false\000"
.LASF621:
	.ascii	"CONFIG_CDCACM_EPINTIN 1\000"
.LASF779:
	.ascii	"__SYS_CONFIG_H__ \000"
.LASF1193:
	.ascii	"INT_FAST8_MAX INT8_MAX\000"
.LASF1178:
	.ascii	"INT64_MAX 9223372036854775807ll\000"
.LASF795:
	.ascii	"_PTR void *\000"
.LASF386:
	.ascii	"SKETCH_MAIN ArduPilot_main\000"
.LASF286:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF75:
	.ascii	"__cpp_raw_strings 200710\000"
.LASF24:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF37:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF709:
	.ascii	"CONFIG_FS_READABLE 1\000"
.LASF412:
	.ascii	"CONFIG_DEBUG_DMA 1\000"
.LASF785:
	.ascii	"_POINTER_INT long\000"
.LASF409:
	.ascii	"CONFIG_ARCH_MATH_H 1\000"
.LASF771:
	.ascii	"_ATEXIT_DYNAMIC_ALLOC 1\000"
.LASF1687:
	.ascii	"_ZN7Vector2IfE13closest_pointERKS0_S2_S2_\000"
.LASF938:
	.ascii	"_GLIBCXX_NAMESPACE_LDBL \000"
.LASF964:
	.ascii	"_GLIBCXX_HAVE_EIDRM 1\000"
.LASF861:
	.ascii	"M_PI_2 1.57079632679489661923\000"
.LASF1245:
	.ascii	"HAL_BOARD_SUBTYPE_PX4_V4 2002\000"
.LASF105:
	.ascii	"__INT16_MAX__ 32767\000"
.LASF1252:
	.ascii	"HAL_BOARD_SUBTYPE_VRCORE_V10 4005\000"
.LASF1688:
	.ascii	"_ZN7Vector2IfE41closest_distance_between_radial_and"
	.ascii	"_pointERKS0_S2_\000"
.LASF1496:
	.ascii	"DBL_MIN\000"
.LASF69:
	.ascii	"__has_include_next(STR) __has_include_next__(STR)\000"
.LASF1415:
	.ascii	"CH_11 10\000"
.LASF1181:
	.ascii	"INT_LEAST8_MAX INT8_MAX\000"
.LASF1643:
	.ascii	"_ZNK7Vector2IiE10normalizedEv\000"
.LASF402:
	.ascii	"__BEGIN_DECLS extern \"C\" {\000"
.LASF1553:
	.ascii	"wchar_t\000"
.LASF341:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 2\000"
.LASF565:
	.ascii	"CONFIG_STANDARD_SERIAL 1\000"
.LASF1525:
	.ascii	"MATH_CHECK_INDEXES 0\000"
.LASF1532:
	.ascii	"RADIUS_OF_EARTH 6378100\000"
.LASF864:
	.ascii	"M_SQRTPI 1.77245385090551602792981\000"
.LASF686:
	.ascii	"CONFIG_NSH_MAXARGUMENTS 12\000"
.LASF1246:
	.ascii	"HAL_BOARD_SUBTYPE_PX4_V3 2003\000"
.LASF547:
	.ascii	"CONFIG_MMCSD_NSLOTS 1\000"
.LASF1533:
	.ascii	"LATLON_TO_M 0.01113195f\000"
.LASF461:
	.ascii	"CONFIG_STM32_WWDG 1\000"
.LASF893:
	.ascii	"M_RAD_TO_DEG_F 57.2957795130823f\000"
.LASF540:
	.ascii	"CONFIG_SPI 1\000"
.LASF446:
	.ascii	"CONFIG_STM32_SPI4 1\000"
.LASF1279:
	.ascii	"HAL_BARO_QURT 10\000"
.LASF533:
	.ascii	"CONFIG_PTHREAD_STACK_MIN 512\000"
.LASF631:
	.ascii	"CONFIG_CDCACM_NRDREQS 4\000"
.LASF195:
	.ascii	"__DEC64_MAX_EXP__ 385\000"
.LASF988:
	.ascii	"_GLIBCXX_HAVE_HYPOT 1\000"
.LASF587:
	.ascii	"CONFIG_USART3_2STOP 0\000"
.LASF1359:
	.ascii	"_Exit(s) _exit(s)\000"
.LASF1375:
	.ascii	"LOWBYTE(i) ((uint8_t)(i))\000"
.LASF1285:
	.ascii	"HAL_COMPASS_AK8963_I2C 6\000"
.LASF343:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF653:
	.ascii	"CONFIG_LIB_HOMEDIR \"/\"\000"
.LASF1173:
	.ascii	"UINT16_MAX 65535u\000"
.LASF16:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF183:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF1367:
	.ascii	"NOINLINE __attribute__((noinline))\000"
.LASF573:
	.ascii	"CONFIG_USART1_2STOP 0\000"
.LASF962:
	.ascii	"_GLIBCXX_HAVE_ECANCELED 1\000"
.LASF1346:
	.ascii	"PRIOR_FIFO_MIN 0\000"
.LASF1217:
	.ascii	"HAL_BOARD_SITL 3\000"
.LASF1156:
	.ascii	"TZNAME_MAX _POSIX_TZNAME_MAX\000"
.LASF78:
	.ascii	"__cpp_lambdas 200907\000"
.LASF132:
	.ascii	"__UINT_FAST8_MAX__ 4294967295U\000"
.LASF914:
	.ascii	"_GLIBCXX_NORETURN __attribute__ ((__noreturn__))\000"
.LASF661:
	.ascii	"CONFIG_LIB_SENDFILE_BUFSIZE 512\000"
.LASF1041:
	.ascii	"STDC_HEADERS 1\000"
.LASF377:
	.ascii	"__USES_INITFINI__ 1\000"
.LASF337:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 2\000"
.LASF908:
	.ascii	"GLIBC_FIX_NEEDED 0\000"
.LASF1288:
	.ascii	"HAL_COMPASS_AK8963_MPU9250_I2C 9\000"
.LASF1140:
	.ascii	"_POSIX_MQ_OPEN_MAX 8\000"
.LASF643:
	.ascii	"CONFIG_FS_FATTIME 1\000"
.LASF427:
	.ascii	"CONFIG_ARMV7M_STACKCHECK\000"
.LASF323:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF85:
	.ascii	"__cpp_alias_templates 200704\000"
.LASF1651:
	.ascii	"_ZN7Vector2IiE13perpendicularERKS0_S2_\000"
.LASF1020:
	.ascii	"_GLIBCXX_HAVE_SYS_TIME_H 1\000"
.LASF481:
	.ascii	"CONFIG_STM32_I2CTIMEOMS 10\000"
.LASF215:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF1356:
	.ascii	"MAX_RAND 32767\000"
.LASF514:
	.ascii	"CONFIG_USER_ENTRYPOINT nsh_main\000"
.LASF919:
	.ascii	"_GLIBCXX_ABI_TAG_CXX11 __attribute ((__abi_tag__ (\""
	.ascii	"cxx11\")))\000"
.LASF850:
	.ascii	"UNDERFLOW 4\000"
.LASF1637:
	.ascii	"_ZNK7Vector2IiE14length_squaredEv\000"
.LASF1079:
	.ascii	"__glibcxx_float_traps\000"
.LASF77:
	.ascii	"__cpp_user_defined_literals 200809\000"
.LASF1570:
	.ascii	"_uint32_t\000"
.LASF383:
	.ascii	"TESTS_MATHLIB_DISABLE 1\000"
.LASF873:
	.ascii	"M_LN2HI 6.9314718036912381649E-1\000"
.LASF825:
	.ascii	"FP_ZERO 2\000"
.LASF705:
	.ascii	"CONFIG_APPS_DIR \"../apps\"\000"
.LASF1527:
	.ascii	"RAD_TO_DEG (180.0f / M_PI)\000"
.LASF1514:
	.ascii	"AP_SUBGROUPPTR(element,name,idx,thisclazz,elclazz) "
	.ascii	"{ AP_PARAM_GROUP, idx, name, AP_VAROFFSET(thisclazz"
	.ascii	", element), { group_info : elclazz::var_info }, AP_"
	.ascii	"PARAM_FLAG_POINTER }\000"
.LASF942:
	.ascii	"_GLIBCXX_SYNCHRONIZATION_HAPPENS_BEFORE(A) \000"
.LASF301:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF58:
	.ascii	"__INT_FAST8_TYPE__ int\000"
.LASF698:
	.ascii	"CONFIG_NSH_CONSOLE 1\000"
.LASF589:
	.ascii	"CONFIG_USART3_OFLOWCONTROL 1\000"
.LASF1011:
	.ascii	"_GLIBCXX_HAVE_STDINT_H 1\000"
.LASF1345:
	.ascii	"PRIOR_RR_MAX 255\000"
.LASF1298:
	.ascii	"HAL_CPU_CLASS_150 3\000"
.LASF668:
	.ascii	"CONFIG_SCHED_WORKSTACKSIZE 1600\000"
.LASF829:
	.ascii	"FP_ILOGBNAN INT_MAX\000"
.LASF1048:
	.ascii	"_GLIBCXX_STDIO_SEEK_CUR 1\000"
.LASF129:
	.ascii	"__INT_FAST16_MAX__ 2147483647\000"
.LASF1006:
	.ascii	"_GLIBCXX_HAVE_SINHF 1\000"
.LASF542:
	.ascii	"CONFIG_RTC 1\000"
.LASF2:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF101:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF199:
	.ascii	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD\000"
.LASF1391:
	.ascii	"__INCLUDE_INTTYPES_H \000"
.LASF1350:
	.ascii	"SCHED_PRIORITY_MAX 255\000"
.LASF265:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF438:
	.ascii	"CONFIG_STM32_DMA2 1\000"
.LASF899:
	.ascii	"M_IVLN10_F 0.43429448190325182765f\000"
.LASF811:
	.ascii	"_PARAMS(paramlist) paramlist\000"
.LASF676:
	.ascii	"CONFIG_BUILTIN_PROXY_STACKSIZE 1024\000"
.LASF1559:
	.ascii	"long int\000"
.LASF800:
	.ascii	"_SIGNED signed\000"
.LASF903:
	.ascii	"_LIB_VERSION __fdlib_version\000"
.LASF1207:
	.ascii	"INTMAX_MIN INT64_MIN\000"
.LASF169:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF1183:
	.ascii	"INT_LEAST16_MIN INT16_MIN\000"
.LASF863:
	.ascii	"M_3PI_4 2.3561944901923448370E0\000"
.LASF703:
	.ascii	"CONFIG_NSOCKET_DESCRIPTORS 0\000"
.LASF329:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1\000"
.LASF1454:
	.ascii	"DBL_DIG\000"
.LASF744:
	.ascii	"inline_function __attribute__ ((always_inline,no_in"
	.ascii	"strument_function))\000"
.LASF511:
	.ascii	"CONFIG_SCHED_WAITPID 1\000"
.LASF530:
	.ascii	"CONFIG_PREALLOC_TIMERS 50\000"
.LASF1500:
	.ascii	"LDBL_MIN __LDBL_MIN__\000"
.LASF34:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF635:
	.ascii	"CONFIG_CDCACM_VENDORID 0x26ac\000"
.LASF1416:
	.ascii	"CH_12 11\000"
.LASF333:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2\000"
.LASF1417:
	.ascii	"CH_13 12\000"
.LASF1659:
	.ascii	"_ZNK7Vector2IfEeqERKS0_\000"
.LASF325:
	.ascii	"__GNUC_STDC_INLINE__ 1\000"
.LASF1304:
	.ascii	"HAL_BOARD_TERRAIN_DIRECTORY \"/fs/microsd/APM/TERRA"
	.ascii	"IN\"\000"
.LASF1038:
	.ascii	"_GLIBCXX_PACKAGE_TARNAME \"libstdc++\"\000"
.LASF1125:
	.ascii	"_POSIX_NAME_MAX CONFIG_NAME_MAX\000"
.LASF1082:
	.ascii	"__glibcxx_double_traps\000"
.LASF379:
	.ascii	"CONFIG_ARCH_BOARD_PX4FMU_V2 1\000"
.LASF1421:
	.ascii	"CH_17 16\000"
.LASF1314:
	.ascii	"HAL_GPIO_A_LED_PIN 27\000"
.LASF1170:
	.ascii	"UINT8_MAX 255\000"
.LASF704:
	.ascii	"CONFIG_STM32_FLASH_CONFIG_I 1\000"
.LASF754:
	.ascii	"CONFIG_HAVE_LONG_LONG 1\000"
.LASF350:
	.ascii	"__ARM_FEATURE_UNALIGNED 1\000"
.LASF305:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF688:
	.ascii	"CONFIG_NSH_ROMFSETC 1\000"
.LASF733:
	.ascii	"CONFIG_HAVE_FUNCTIONNAME 1\000"
.LASF529:
	.ascii	"CONFIG_PREALLOC_WDOGS 50\000"
.LASF1118:
	.ascii	"UPTR_MAX 4294967295U\000"
.LASF1354:
	.ascii	"EXIT_SUCCESS 0\000"
.LASF104:
	.ascii	"__INT8_MAX__ 127\000"
.LASF1482:
	.ascii	"LDBL_MAX_10_EXP __LDBL_MAX_10_EXP__\000"
.LASF1411:
	.ascii	"CH_7 6\000"
.LASF1141:
	.ascii	"_POSIX_MQ_PRIO_MAX UCHAR_MAX\000"
.LASF678:
	.ascii	"CONFIG_EXAMPLES_MOUNT 1\000"
.LASF571:
	.ascii	"CONFIG_USART1_BITS 8\000"
.LASF1606:
	.ascii	"_ZNK7Vector2IiEmiERKS0_\000"
.LASF9:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF436:
	.ascii	"CONFIG_STM32_CCMDATARAM 1\000"
.LASF1174:
	.ascii	"INT32_MIN (-INT32_MAX - 1)\000"
.LASF745:
	.ascii	"noinline_function __attribute__ ((noinline))\000"
.LASF247:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF289:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF1214:
	.ascii	"RSIZE_MAX UINT32_MAX\000"
.LASF278:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF735:
	.ascii	"CONFIG_HAVE_WEAKFUNCTIONS 1\000"
.LASF809:
	.ascii	"_CAST_VOID (void)\000"
.LASF1369:
	.ascii	"FMT_SCANF(a,b) __attribute__((format(scanf, a, b)))"
	.ascii	"\000"
.LASF1471:
	.ascii	"FLT_MAX_EXP\000"
.LASF237:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF173:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF672:
	.ascii	"CONFIG_SCHED_LPWORKSTACKSIZE 1600\000"
.LASF40:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF742:
	.ascii	"reentrant_function \000"
.LASF866:
	.ascii	"M_2_PI 0.63661977236758134308\000"
.LASF336:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 2\000"
.LASF479:
	.ascii	"CONFIG_STM32_SPI_DMA 1\000"
.LASF1064:
	.ascii	"__glibcxx_float_traps false\000"
.LASF235:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF822:
	.ascii	"FLT_EVAL_METHOD 0\000"
.LASF881:
	.ascii	"M_LN2_F _M_LN2_F\000"
.LASF31:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF1615:
	.ascii	"operator*=\000"
.LASF539:
	.ascii	"CONFIG_I2C_RESET 1\000"
.LASF1644:
	.ascii	"reflect\000"
.LASF356:
	.ascii	"__ARM_SIZEOF_WCHAR_T 32\000"
.LASF1563:
	.ascii	"long double\000"
.LASF655:
	.ascii	"CONFIG_LIB_RAND_ORDER 1\000"
.LASF352:
	.ascii	"__ARM_FEATURE_LDREX 7\000"
.LASF38:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF746:
	.ascii	"FAR \000"
.LASF1098:
	.ascii	"CHAR_BIT 8\000"
.LASF1504:
	.ascii	"AP_PARAM_FLAG_NESTED_OFFSET 1\000"
.LASF566:
	.ascii	"CONFIG_SERIAL_NPOLLWAITERS 2\000"
.LASF659:
	.ascii	"CONFIG_LIBC_STRERROR 1\000"
.LASF519:
	.ascii	"CONFIG_SIG_SIGWORK 4\000"
.LASF536:
	.ascii	"CONFIG_I2C 1\000"
.LASF577:
	.ascii	"CONFIG_USART2_BITS 8\000"
.LASF673:
	.ascii	"CONFIG_C99_BOOL8 1\000"
.LASF649:
	.ascii	"CONFIG_BUILTIN 1\000"
.LASF876:
	.ascii	"M_LOG2_E _M_LN2\000"
.LASF1150:
	.ascii	"NGROUPS_MAX _POSIX_NGROUPS_MAX\000"
.LASF783:
	.ascii	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_M"
	.ascii	"INOR__ >= ((maj) << 16) + (min))\000"
.LASF1153:
	.ascii	"PIPE_BUF _POSIX_PIPE_BUF\000"
.LASF1657:
	.ascii	"Vector2<float>\000"
.LASF1560:
	.ascii	"long unsigned int\000"
.LASF1485:
	.ascii	"LDBL_MAX\000"
.LASF859:
	.ascii	"M_PI 3.14159265358979323846\000"
.LASF1474:
	.ascii	"FLT_MAX_EXP __FLT_MAX_EXP__\000"
.LASF1589:
	.ascii	"blkcnt_t\000"
.LASF749:
	.ascii	"CODE \000"
.LASF1535:
	.ascii	"WGS84_A 6378137.0\000"
.LASF1611:
	.ascii	"operator+=\000"
.LASF401:
	.ascii	"__PRIVATE __attribute__ ((visibility (\"hidden\")))"
	.ascii	"\000"
.LASF1396:
	.ascii	"HAL_GPIO_ALT 2\000"
.LASF973:
	.ascii	"_GLIBCXX_HAVE_EOWNERDEAD 1\000"
.LASF229:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF664:
	.ascii	"CONFIG_SCHED_WORKQUEUE 1\000"
.LASF1596:
	.ascii	"Vector2\000"
.LASF239:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF603:
	.ascii	"CONFIG_UART7_TXBUFSIZE 300\000"
.LASF1145:
	.ascii	"CHILD_MAX _POSIX_CHILD_MAX\000"
.LASF682:
	.ascii	"CONFIG_NSH_CODECS_BUFSIZE 128\000"
.LASF339:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 1\000"
.LASF1030:
	.ascii	"_GLIBCXX_HAVE_VWSCANF 1\000"
.LASF1494:
	.ascii	"LDBL_EPSILON __LDBL_EPSILON__\000"
.LASF236:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF512:
	.ascii	"CONFIG_SCHED_ATEXIT 1\000"
.LASF945:
	.ascii	"_GLIBCXX_END_EXTERN_C }\000"
.LASF1311:
	.ascii	"HAL_STORAGE_SIZE 16384\000"
.LASF1157:
	.ascii	"RTSIG_MAX _POSIX_RTSIG_MAX\000"
.LASF1484:
	.ascii	"DBL_MAX\000"
.LASF1549:
	.ascii	"char\000"
.LASF835:
	.ascii	"isinf(y) (fpclassify(y) == FP_INFINITE)\000"
.LASF585:
	.ascii	"CONFIG_USART3_BITS 8\000"
.LASF706:
	.ascii	"CONFIG_DRAM_END (CONFIG_DRAM_START+CONFIG_DRAM_SIZE"
	.ascii	")\000"
.LASF765:
	.ascii	"__NEWLIB_H__ 1\000"
.LASF969:
	.ascii	"_GLIBCXX_HAVE_ENOSTR 1\000"
.LASF1364:
	.ascii	"PACKED __attribute__((__packed__))\000"
.LASF1612:
	.ascii	"_ZN7Vector2IiEpLERKS0_\000"
.LASF108:
	.ascii	"__UINT8_MAX__ 255\000"
.LASF282:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF1632:
	.ascii	"_ZNK7Vector2IiEixEh\000"
.LASF432:
	.ascii	"CONFIG_STM32_STM32F40XX 1\000"
.LASF1347:
	.ascii	"PRIOR_FIFO_MAX 255\000"
.LASF185:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF1137:
	.ascii	"_POSIX_CLOCKRES_MIN ((CONFIG_MSEC_PER_TICK)*1000000"
	.ascii	")\000"
.LASF347:
	.ascii	"__ARM_FEATURE_DSP 1\000"
.LASF662:
	.ascii	"CONFIG_ARCH_OPTIMIZED_FUNCTIONS 1\000"
.LASF1430:
	.ascii	"va_end(v) __builtin_va_end(v)\000"
.LASF1265:
	.ascii	"HAL_INS_BH 14\000"
.LASF240:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF563:
	.ascii	"CONFIG_ARCH_HAVE_USART6 1\000"
.LASF283:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF1366:
	.ascii	"OPTIMIZE(level) __attribute__((optimize(level)))\000"
.LASF172:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF242:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF1206:
	.ascii	"UINTPTR_MAX UPTR_MAX\000"
.LASF1613:
	.ascii	"operator-=\000"
.LASF806:
	.ascii	"_EXFNPTR(name,proto) (* name) proto\000"
.LASF1007:
	.ascii	"_GLIBCXX_HAVE_SLEEP 1\000"
.LASF106:
	.ascii	"__INT32_MAX__ 2147483647L\000"
.LASF73:
	.ascii	"__cpp_binary_literals 201304\000"
.LASF1522:
	.ascii	"M_PI_2 (M_PI / 2)\000"
.LASF1272:
	.ascii	"HAL_BARO_MS5611_SPI 3\000"
.LASF1280:
	.ascii	"HAL_COMPASS_HMC5843 1\000"
.LASF628:
	.ascii	"CONFIG_CDCACM_EPBULKIN_FSSIZE 64\000"
.LASF298:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF640:
	.ascii	"CONFIG_FAT_LCNAMES 1\000"
.LASF862:
	.ascii	"M_PI_4 0.78539816339744830962\000"
.LASF1218:
	.ascii	"HAL_BOARD_SMACCM 4\000"
.LASF1248:
	.ascii	"HAL_BOARD_SUBTYPE_VRBRAIN_V51 4001\000"
.LASF1520:
	.ascii	"M_PI (3.141592653589793f)\000"
.LASF805:
	.ascii	"_EXPARM(name,proto) (* name) proto\000"
.LASF1400:
	.ascii	"HAL_GPIO_INTERRUPT_RISING 3\000"
.LASF1473:
	.ascii	"LDBL_MAX_EXP\000"
.LASF1537:
	.ascii	"WGS84_F (1.0 / WGS84_IF)\000"
.LASF987:
	.ascii	"_GLIBCXX_HAVE_GETS 1\000"
.LASF293:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF717:
	.ascii	"CONFIG_DEBUG_SCHED\000"
.LASF463:
	.ascii	"CONFIG_STM32_SPI 1\000"
.LASF433:
	.ascii	"CONFIG_STM32_STM32F427 1\000"
.LASF1075:
	.ascii	"__glibcxx_digits(T) (sizeof(T) * __CHAR_BIT__ - __g"
	.ascii	"libcxx_signed (T))\000"
.LASF1368:
	.ascii	"FMT_PRINTF(a,b) __attribute__((format(printf, a, b)"
	.ascii	"))\000"
.LASF259:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF87:
	.ascii	"__SCHAR_MAX__ 127\000"
.LASF488:
	.ascii	"CONFIG_DRAM_START 0x20000000\000"
.LASF912:
	.ascii	"_GLIBCXX_PURE __attribute__ ((__pure__))\000"
.LASF27:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF1192:
	.ascii	"INT_FAST8_MIN INT8_MIN\000"
.LASF1015:
	.ascii	"_GLIBCXX_HAVE_STRING_H 1\000"
.LASF225:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF1530:
	.ascii	"RadiansToCentiDegrees(x) (static_cast<float>(x) * R"
	.ascii	"AD_TO_DEG * static_cast<float>(100))\000"
.LASF64:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF103:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF1295:
	.ascii	"HAL_COMPASS_AERO 16\000"
.LASF755:
	.ascii	"CONFIG_HAVE_FLOAT 1\000"
.LASF1377:
	.ascii	"ARRAY_SIZE(_arr) sizeof(_ARRAY_SIZE_HELPER(_arr))\000"
.LASF708:
	.ascii	"CONFIG_FS_WRITABLE\000"
.LASF959:
	.ascii	"_GLIBCXX_HAVE_COSF 1\000"
.LASF1042:
	.ascii	"_GLIBCXX_ATOMIC_BUILTINS 1\000"
.LASF1440:
	.ascii	"AP_HAL_MAIN() AP_HAL::HAL::FunCallbacks callbacks(s"
	.ascii	"etup, loop); extern \"C\" { int AP_MAIN(int argc, c"
	.ascii	"har* const argv[]); int AP_MAIN(int argc, char* con"
	.ascii	"st argv[]) { hal.run(argc, argv, &callbacks); retur"
	.ascii	"n 0; } }\000"
.LASF1229:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_ZYNQ 1004\000"
.LASF497:
	.ascii	"CONFIG_MMCSD_HAVE_SDIOWAIT_WRCOMPLETE 1\000"
.LASF1412:
	.ascii	"CH_8 7\000"
.LASF1677:
	.ascii	"_ZNK7Vector2IfEixEh\000"
.LASF44:
	.ascii	"__INT32_TYPE__ long int\000"
.LASF1617:
	.ascii	"operator/=\000"
.LASF1519:
	.ascii	"M_PI\000"
.LASF1188:
	.ascii	"UINT_LEAST32_MAX UINT32_MAX\000"
.LASF253:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF1431:
	.ascii	"va_arg(v,l) __builtin_va_arg(v,l)\000"
.LASF1180:
	.ascii	"INT_LEAST8_MIN INT8_MIN\000"
.LASF79:
	.ascii	"__cpp_constexpr 200704\000"
.LASF1234:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_ERLEBRAIN2 1009\000"
.LASF789:
	.ascii	"_READ_WRITE_RETURN_TYPE int\000"
.LASF234:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF897:
	.ascii	"M_LN2HI_F 6.9314718036912381649E-1f\000"
.LASF1223:
	.ascii	"HAL_BOARD_EMPTY 99\000"
.LASF1047:
	.ascii	"_GLIBCXX_STDIO_EOF -1\000"
.LASF67:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF753:
	.ascii	"CONFIG_HAVE_INLINE 1\000"
.LASF823:
	.ascii	"FP_NAN 0\000"
.LASF15:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF995:
	.ascii	"_GLIBCXX_HAVE_LC_MESSAGES 1\000"
.LASF957:
	.ascii	"_GLIBCXX_HAVE_CEILF 1\000"
.LASF1205:
	.ascii	"INTPTR_MAX PTR_MIN\000"
.LASF1263:
	.ascii	"HAL_INS_RASPILOT 12\000"
.LASF1386:
	.ascii	"FUNCTOR_DECLARE(name,rettype,...) Functor<rettype, "
	.ascii	"## __VA_ARGS__> name\000"
.LASF1308:
	.ascii	"HAL_COMPASS_DEFAULT HAL_COMPASS_PX4\000"
.LASF956:
	.ascii	"_GLIBCXX_HAVE_ATANF 1\000"
.LASF1148:
	.ascii	"MAX_INPUT _POSIX_MAX_INPUT\000"
.LASF856:
	.ascii	"M_LOG10E 0.43429448190325182765\000"
.LASF857:
	.ascii	"M_LN2 _M_LN2\000"
.LASF494:
	.ascii	"CONFIG_ARCH_BOARD \"\"\000"
.LASF231:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF1211:
	.ascii	"INTMAX_C(x) x ## ll\000"
.LASF1490:
	.ascii	"DBL_EPSILON\000"
.LASF599:
	.ascii	"CONFIG_USART6_BITS 8\000"
.LASF1673:
	.ascii	"_ZNK7Vector2IfE5angleEv\000"
.LASF1109:
	.ascii	"UINT_MAX 4294967295U\000"
.LASF843:
	.ascii	"islessgreater(x,y) (__extension__ ({__typeof__(x) _"
	.ascii	"_x = (x); __typeof__(y) __y = (y); !isunordered(__x"
	.ascii	",__y) && (__x < __y || __x > __y);}))\000"
.LASF403:
	.ascii	"__END_DECLS }\000"
.LASF1022:
	.ascii	"_GLIBCXX_HAVE_S_ISREG 1\000"
.LASF109:
	.ascii	"__UINT16_MAX__ 65535\000"
.LASF597:
	.ascii	"CONFIG_USART6_TXBUFSIZE 300\000"
.LASF355:
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 1\000"
.LASF1419:
	.ascii	"CH_15 14\000"
.LASF119:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF977:
	.ascii	"_GLIBCXX_HAVE_ETIMEDOUT 1\000"
.LASF1578:
	.ascii	"int64_t\000"
.LASF757:
	.ascii	"CONFIG_HAVE_LONG_DOUBLE 1\000"
.LASF1423:
	.ascii	"CH_NONE 255\000"
.LASF311:
	.ascii	"__DA_FBIT__ 31\000"
.LASF1353:
	.ascii	"SCHED_PRIORITY_IDLE 0\000"
.LASF1112:
	.ascii	"ULONG_MAX 4294967295UL\000"
.LASF604:
	.ascii	"CONFIG_UART7_BAUD 57600\000"
.LASF883:
	.ascii	"M_PI_F 3.14159265358979323846f\000"
.LASF331:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 2\000"
.LASF1228:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_NAVIO 1003\000"
.LASF197:
	.ascii	"__DEC64_MAX__ 9.999999999999999E384DD\000"
.LASF955:
	.ascii	"_GLIBCXX_HAVE_ATAN2F 1\000"
.LASF92:
	.ascii	"__WCHAR_MAX__ 4294967295U\000"
.LASF1374:
	.ascii	"BIT_IS_SET(value,bitnumber) (((value) & (1U<<(bitnu"
	.ascii	"mber))) != 0)\000"
.LASF1281:
	.ascii	"HAL_COMPASS_PX4 2\000"
.LASF1516:
	.ascii	"AP_VAREND { AP_PARAM_NONE, \"\", 0, nullptr, { grou"
	.ascii	"p_info : nullptr } }\000"
.LASF312:
	.ascii	"__DA_IBIT__ 32\000"
.LASF832:
	.ascii	"math_errhandling MATH_ERRNO\000"
.LASF816:
	.ascii	"_M_LN2 0.693147180559945309417\000"
.LASF295:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF366:
	.ascii	"__VFP_FP__ 1\000"
.LASF1656:
	.ascii	"Vector2<int>\000"
.LASF1219:
	.ascii	"HAL_BOARD_PX4 5\000"
.LASF1489:
	.ascii	"FLT_EPSILON\000"
.LASF30:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF1095:
	.ascii	"__INT64_DEFINED \000"
.LASF112:
	.ascii	"__INT_LEAST8_MAX__ 127\000"
.LASF627:
	.ascii	"CONFIG_CDCACM_EPBULKIN 2\000"
.LASF1352:
	.ascii	"SCHED_PRIORITY_MIN 1\000"
.LASF767:
	.ascii	"_WANT_IO_LONG_LONG 1\000"
.LASF146:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF1548:
	.ascii	"double\000"
.LASF1392:
	.ascii	"ANALOG_INPUT_BOARD_VCC 254\000"
.LASF1344:
	.ascii	"PRIOR_RR_MIN 0\000"
.LASF740:
	.ascii	"farcall_function __attribute__ ((long_call))\000"
.LASF632:
	.ascii	"CONFIG_CDCACM_BULKIN_REQLEN 96\000"
.LASF233:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF1027:
	.ascii	"_GLIBCXX_HAVE_USLEEP 1\000"
.LASF624:
	.ascii	"CONFIG_CDCACM_EPBULKOUT 3\000"
.LASF483:
	.ascii	"CONFIG_ARCH_DMA 1\000"
.LASF1273:
	.ascii	"HAL_BARO_MS5607_I2C 4\000"
.LASF1685:
	.ascii	"_ZN7Vector2IfE9projectedERKS0_\000"
.LASF1:
	.ascii	"__cplusplus 201103L\000"
.LASF994:
	.ascii	"_GLIBCXX_HAVE_ISWBLANK 1\000"
.LASF1483:
	.ascii	"FLT_MAX\000"
.LASF21:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF1583:
	.ascii	"ssize_t\000"
.LASF176:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF637:
	.ascii	"CONFIG_CDCACM_VENDORSTR \"3D Robotics\"\000"
.LASF1605:
	.ascii	"_ZNK7Vector2IiEplERKS0_\000"
.LASF1616:
	.ascii	"_ZN7Vector2IiEmLEi\000"
.LASF902:
	.ascii	"_LIB_VERSION_TYPE enum __fdlibm_version\000"
.LASF963:
	.ascii	"_GLIBCXX_HAVE_ECHILD 1\000"
.LASF695:
	.ascii	"CONFIG_NSH_FATSECTSIZE 512\000"
.LASF424:
	.ascii	"CONFIG_ARCH_FPU 1\000"
.LASF1329:
	.ascii	"HAL_INS_MPU9250_EXT_NAME \"mpu9250_ext\"\000"
.LASF855:
	.ascii	"M_LOG2E 1.4426950408889634074\000"
.LASF1636:
	.ascii	"length_squared\000"
.LASF1172:
	.ascii	"INT16_MAX 32767\000"
.LASF130:
	.ascii	"__INT_FAST32_MAX__ 2147483647\000"
.LASF107:
	.ascii	"__INT64_MAX__ 9223372036854775807LL\000"
.LASF399:
	.ascii	"__SYSTEMLIB_VISIBILITY_H \000"
.LASF576:
	.ascii	"CONFIG_USART2_BAUD 57600\000"
.LASF72:
	.ascii	"__GXX_EXPERIMENTAL_CXX0X__ 1\000"
.LASF1497:
	.ascii	"LDBL_MIN\000"
.LASF1363:
	.ascii	"atof(nptr) strtod((nptr), NULL)\000"
.LASF408:
	.ascii	"CONFIG_RAW_BINARY 1\000"
.LASF14:
	.ascii	"__OPTIMIZE__ 1\000"
.LASF320:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF486:
	.ascii	"CONFIG_ARCH_HAVE_RAMVECTORS 1\000"
.LASF780:
	.ascii	"_SYS_FEATURES_H \000"
.LASF358:
	.ascii	"__arm__ 1\000"
.LASF1085:
	.ascii	"__glibcxx_long_double_traps\000"
.LASF654:
	.ascii	"CONFIG_LIBC_FLOATINGPOINT 1\000"
.LASF1268:
	.ascii	"HAL_INS_BBBMINI 17\000"
.LASF484:
	.ascii	"CONFIG_ARCH_HAVE_VFORK 1\000"
.LASF1124:
	.ascii	"_POSIX_MAX_INPUT 255\000"
.LASF526:
	.ascii	"CONFIG_PREALLOC_MQ_MSGS 4\000"
.LASF431:
	.ascii	"CONFIG_ARCH_CHIP_STM32F427V 1\000"
.LASF1320:
	.ascii	"HAL_BARO_MS5611_SPI_INT_NAME \"ms5611_int\"\000"
.LASF1084:
	.ascii	"__glibcxx_long_double_has_denorm_loss\000"
.LASF1106:
	.ascii	"USHRT_MAX 65535U\000"
.LASF416:
	.ascii	"CONFIG_ARCH_CHIP_STM32 1\000"
.LASF813:
	.ascii	"_ELIDABLE_INLINE static __inline__\000"
.LASF910:
	.ascii	"_GLIBCXX_CXX_CONFIG_H 1\000"
.LASF1467:
	.ascii	"LDBL_MIN_10_EXP\000"
.LASF1294:
	.ascii	"HAL_COMPASS_NAVIO 15\000"
.LASF1018:
	.ascii	"_GLIBCXX_HAVE_SYS_RESOURCE_H 1\000"
.LASF775:
	.ascii	"_FVWRITE_IN_STREAMIO 1\000"
.LASF1601:
	.ascii	"_ZNK7Vector2IiEneERKS0_\000"
.LASF42:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF1296:
	.ascii	"HAL_LINUX_HEAT_PWM 1\000"
.LASF639:
	.ascii	"CONFIG_FS_FAT 1\000"
.LASF330:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1\000"
.LASF1465:
	.ascii	"FLT_MIN_10_EXP\000"
.LASF1639:
	.ascii	"_ZNK7Vector2IiE6lengthEv\000"
.LASF1230:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_BBBMINI 1005\000"
.LASF786:
	.ascii	"__RAND_MAX\000"
.LASF487:
	.ascii	"CONFIG_BOARD_LOOPSPERMSEC 16717\000"
.LASF907:
	.ascii	"_POSIX_ __fdlibm_posix\000"
.LASF1143:
	.ascii	"_POSIX_SEM_VALUE_MAX 0x7fff\000"
.LASF260:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF1456:
	.ascii	"FLT_DIG __FLT_DIG__\000"
.LASF60:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF457:
	.ascii	"CONFIG_STM32_UART4 1\000"
.LASF1159:
	.ascii	"DELAYTIMER_MAX _POSIX_DELAYTIMER_MAX\000"
.LASF1310:
	.ascii	"CONFIG_HAL_BOARD_SUBTYPE HAL_BOARD_SUBTYPE_PX4_V2\000"
.LASF263:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF1086:
	.ascii	"__glibcxx_long_double_tinyness_before\000"
.LASF1158:
	.ascii	"SIGQUEUE_MAX _POSIX_SIGQUEUE_MAX\000"
.LASF1512:
	.ascii	"AP_NESTEDGROUPINFO(clazz,idx) { AP_PARAM_GROUP, idx"
	.ascii	", \"\", 0, { group_info : clazz::var_info }, 0 }\000"
.LASF480:
	.ascii	"CONFIG_STM32_I2CTIMEOSEC 0\000"
.LASF423:
	.ascii	"CONFIG_ARCH_HAVE_FPU 1\000"
.LASF671:
	.ascii	"CONFIG_SCHED_LPWORKPERIOD 50000\000"
.LASF867:
	.ascii	"M_2_SQRTPI 1.12837916709551257390\000"
.LASF1160:
	.ascii	"TIMER_MAX _POSIX_TIMER_MAX\000"
.LASF1629:
	.ascii	"is_zero\000"
.LASF1534:
	.ascii	"LATLON_TO_CM 1.113195f\000"
.LASF1413:
	.ascii	"CH_9 8\000"
.LASF953:
	.ascii	"_GLIBCXX_HAVE_ASINF 1\000"
.LASF1526:
	.ascii	"DEG_TO_RAD (M_PI / 180.0f)\000"
.LASF593:
	.ascii	"CONFIG_UART4_BITS 8\000"
.LASF381:
	.ascii	"CONFIG_WCHAR_BUILTIN 1\000"
.LASF268:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF1620:
	.ascii	"operator%\000"
.LASF1581:
	.ascii	"mode_t\000"
.LASF1189:
	.ascii	"INT_LEAST64_MIN INT64_MIN\000"
.LASF196:
	.ascii	"__DEC64_MIN__ 1E-383DD\000"
.LASF115:
	.ascii	"__INT16_C(c) c\000"
.LASF1569:
	.ascii	"_int32_t\000"
.LASF826:
	.ascii	"FP_SUBNORMAL 3\000"
.LASF847:
	.ascii	"DOMAIN 1\000"
.LASF947:
	.ascii	"_GLIBCXX_CPU_DEFINES 1\000"
.LASF638:
	.ascii	"CONFIG_CDCACM_PRODUCTSTR \"PX4 FMU v2.x\"\000"
.LASF1562:
	.ascii	"long long unsigned int\000"
.LASF19:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF1638:
	.ascii	"length\000"
.LASF1008:
	.ascii	"_GLIBCXX_HAVE_SQRTF 1\000"
.LASF1588:
	.ascii	"pid_t\000"
.LASF736:
	.ascii	"weak_alias(name,aliasname) extern __typeof (name) a"
	.ascii	"liasname __attribute__ ((weak, alias (#name)));\000"
.LASF1182:
	.ascii	"UINT_LEAST8_MAX UINT8_MAX\000"
.LASF1306:
	.ascii	"HAL_INS_DEFAULT HAL_INS_PX4\000"
.LASF1103:
	.ascii	"CHAR_MAX UCHAR_MAX\000"
.LASF1059:
	.ascii	"_GLIBCXX_USE_WCHAR_T 1\000"
.LASF1584:
	.ascii	"uid_t\000"
.LASF420:
	.ascii	"CONFIG_ARMV7M_USEBASEPRI 1\000"
.LASF886:
	.ascii	"M_PI_4_F 0.78539816339744830962f\000"
.LASF214:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF1547:
	.ascii	"float\000"
.LASF687:
	.ascii	"CONFIG_NSH_NESTDEPTH 8\000"
.LASF1221:
	.ascii	"HAL_BOARD_VRBRAIN 8\000"
.LASF503:
	.ascii	"CONFIG_START_MONTH 1\000"
.LASF538:
	.ascii	"CONFIG_ARCH_HAVE_I2CRESET 1\000"
.LASF111:
	.ascii	"__UINT64_MAX__ 18446744073709551615ULL\000"
.LASF1226:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_ERLEBOARD 1001\000"
.LASF1323:
	.ascii	"HAL_INS_MPU60x0_EXT_NAME \"mpu6000_ext\"\000"
.LASF430:
	.ascii	"CONFIG_SDIO_DMAPRIO 0x00010000\000"
.LASF929:
	.ascii	"_GLIBCXX_BEGIN_NAMESPACE_VERSION \000"
.LASF1435:
	.ascii	"_VA_LIST \000"
.LASF1541:
	.ascii	"NSEC_PER_USEC 1000ULL\000"
.LASF1449:
	.ascii	"LDBL_MANT_DIG\000"
.LASF459:
	.ascii	"CONFIG_STM32_UART7 1\000"
.LASF211:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF12:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF1515:
	.ascii	"AP_GROUPEND { AP_PARAM_NONE, 0xFF, \"\", 0, { group"
	.ascii	"_info : nullptr } }\000"
.LASF94:
	.ascii	"__WINT_MAX__ 4294967295U\000"
.LASF151:
	.ascii	"__FLT_MIN__ 1.1754943508222875e-38F\000"
.LASF51:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF98:
	.ascii	"__INTMAX_MAX__ 9223372036854775807LL\000"
.LASF212:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF1002:
	.ascii	"_GLIBCXX_HAVE_MBSTATE_T 1\000"
.LASF523:
	.ascii	"CONFIG_NFILE_DESCRIPTORS 50\000"
.LASF985:
	.ascii	"_GLIBCXX_HAVE_FREXPF 1\000"
.LASF1292:
	.ascii	"HAL_COMPASS_BBBMINI 13\000"
.LASF335:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2\000"
.LASF1071:
	.ascii	"__glibcxx_long_double_tinyness_before false\000"
.LASF1317:
	.ascii	"HAL_GPIO_LED_ON LOW\000"
.LASF346:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF1689:
	.ascii	"outside\000"
.LASF1023:
	.ascii	"_GLIBCXX_HAVE_TANF 1\000"
.LASF948:
	.ascii	"_GLIBCXX_PSEUDO_VISIBILITY(V) \000"
.LASF966:
	.ascii	"_GLIBCXX_HAVE_ENOLINK 1\000"
.LASF937:
	.ascii	"_GLIBCXX_LONG_DOUBLE_COMPAT\000"
.LASF1510:
	.ascii	"AP_GROUPINFO_FLAGS(name,idx,clazz,element,def,flags"
	.ascii	") { AP_CLASSTYPE(clazz, element), idx, name, AP_VAR"
	.ascii	"OFFSET(clazz, element), {def_value : def}, flags }\000"
.LASF1334:
	.ascii	"HAL_OS_SOCKETS 0\000"
.LASF1276:
	.ascii	"HAL_BARO_VRBRAIN 7\000"
.LASF411:
	.ascii	"CONFIG_DEBUG_VERBOSE\000"
.LASF1437:
	.ascii	"_VA_LIST_T_H \000"
.LASF734:
	.ascii	"CONFIG_HAVE_FILENAME 1\000"
.LASF1078:
	.ascii	"__glibcxx_float_has_denorm_loss\000"
.LASF851:
	.ascii	"TLOSS 5\000"
.LASF1274:
	.ascii	"HAL_BARO_PX4 5\000"
.LASF122:
	.ascii	"__UINT_LEAST16_MAX__ 65535\000"
.LASF160:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF1575:
	.ascii	"uint16_t\000"
.LASF527:
	.ascii	"CONFIG_MQ_MAXMSGSIZE 32\000"
.LASF1524:
	.ascii	"M_2PI (M_PI * 2)\000"
.LASF1147:
	.ascii	"MAX_CANON _POSIX_MAX_CANON\000"
.LASF1701:
	.ascii	"/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/a"
	.ascii	"rdupilot/libraries/AP_Math/polygon.cpp\000"
.LASF1031:
	.ascii	"_GLIBCXX_HAVE_WCHAR_H 1\000"
.LASF1506:
	.ascii	"AP_PARAM_FLAG_ENABLE 4\000"
.LASF1470:
	.ascii	"LDBL_MIN_10_EXP __LDBL_MIN_10_EXP__\000"
.LASF882:
	.ascii	"M_LN10_F 2.30258509299404568402f\000"
.LASF1693:
	.ascii	"Polygon_outside<int>\000"
.LASF177:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF634:
	.ascii	"CONFIG_CDCACM_TXBUFSIZE 8000\000"
.LASF520:
	.ascii	"CONFIG_MAX_TASKS 32\000"
.LASF535:
	.ascii	"CONFIG_DEV_NULL 1\000"
.LASF874:
	.ascii	"M_SQRT3 1.73205080756887719000\000"
.LASF788:
	.ascii	"__IMPORT \000"
.LASF7:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF1457:
	.ascii	"DBL_DIG __DBL_DIG__\000"
.LASF1406:
	.ascii	"CH_2 1\000"
.LASF45:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF168:
	.ascii	"__DBL_DENORM_MIN__ double(4.9406564584124654e-324L)"
	.ascii	"\000"
.LASF313:
	.ascii	"__TA_FBIT__ 63\000"
.LASF190:
	.ascii	"__DEC32_MAX__ 9.999999E96DF\000"
.LASF1254:
	.ascii	"HAL_INS_MPU60XX_SPI 2\000"
.LASF1491:
	.ascii	"LDBL_EPSILON\000"
.LASF1080:
	.ascii	"__glibcxx_float_tinyness_before\000"
.LASF551:
	.ascii	"CONFIG_MTD_PARTITION 1\000"
.LASF752:
	.ascii	"CONFIG_PTR_IS_NOT_INT\000"
.LASF56:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF88:
	.ascii	"__SHRT_MAX__ 32767\000"
.LASF1586:
	.ascii	"dev_t\000"
.LASF602:
	.ascii	"CONFIG_UART7_RXBUFSIZE 300\000"
.LASF815:
	.ascii	"_NOINLINE_STATIC _NOINLINE static\000"
.LASF1161:
	.ascii	"CLOCKRES_MIN _POSIX_CLOCKRES_MIN\000"
.LASF588:
	.ascii	"CONFIG_USART3_IFLOWCONTROL 1\000"
.LASF810:
	.ascii	"_LONG_DOUBLE long double\000"
.LASF1122:
	.ascii	"_POSIX_LINK_MAX 8\000"
.LASF820:
	.ascii	"INFINITY (__builtin_inff())\000"
.LASF308:
	.ascii	"__HA_IBIT__ 8\000"
.LASF314:
	.ascii	"__TA_IBIT__ 64\000"
.LASF1478:
	.ascii	"DBL_MAX_10_EXP\000"
.LASF1168:
	.ascii	"INT8_MIN (-INT8_MAX - 1)\000"
.LASF983:
	.ascii	"_GLIBCXX_HAVE_FLOORF 1\000"
.LASF557:
	.ascii	"CONFIG_ARCH_HAVE_UART4 1\000"
.LASF556:
	.ascii	"CONFIG_SERIAL_REMOVABLE 1\000"
.LASF290:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF984:
	.ascii	"_GLIBCXX_HAVE_FMODF 1\000"
.LASF1561:
	.ascii	"long long int\000"
.LASF140:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF310:
	.ascii	"__SA_IBIT__ 16\000"
.LASF1324:
	.ascii	"HAL_INS_LSM9DS0_G_NAME \"lsm9ds0_g\"\000"
.LASF1069:
	.ascii	"__glibcxx_long_double_has_denorm_loss false\000"
.LASF1495:
	.ascii	"FLT_MIN\000"
.LASF777:
	.ascii	"_WIDE_ORIENT 1\000"
.LASF1355:
	.ascii	"EXIT_FAILURE 1\000"
.LASF1376:
	.ascii	"HIGHBYTE(i) ((uint8_t)(((uint16_t)(i))>>8))\000"
.LASF315:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF1073:
	.ascii	"__glibcxx_min(T) (__glibcxx_signed (T) ? -__glibcxx"
	.ascii	"_max (T) - 1 : (T)0)\000"
.LASF849:
	.ascii	"OVERFLOW 3\000"
.LASF246:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF206:
	.ascii	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000"
	.ascii	"000000001E-6143DL\000"
.LASF636:
	.ascii	"CONFIG_CDCACM_PRODUCTID 0x0011\000"
.LASF353:
	.ascii	"__ARM_FEATURE_CLZ 1\000"
.LASF1619:
	.ascii	"_ZNK7Vector2IiEmlERKS0_\000"
.LASF395:
	.ascii	"HAVE_ENDIAN_H 0\000"
.LASF368:
	.ascii	"__ARM_FEATURE_FMA 1\000"
.LASF1531:
	.ascii	"GRAVITY_MSS 9.80665f\000"
.LASF187:
	.ascii	"__DEC32_MIN_EXP__ (-94)\000"
.LASF276:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF885:
	.ascii	"M_PI_2_F 1.57079632679489661923f\000"
.LASF1642:
	.ascii	"normalized\000"
.LASF1360:
	.ascii	"atoi(nptr) strtol((nptr), NULL, 10)\000"
.LASF1169:
	.ascii	"INT8_MAX 127\000"
.LASF428:
	.ascii	"CONFIG_SERIAL_TERMIOS 1\000"
.LASF990:
	.ascii	"_GLIBCXX_HAVE_IEEEFP_H 1\000"
.LASF359:
	.ascii	"__ARM_ARCH 7\000"
.LASF1528:
	.ascii	"DEG_TO_RAD_DOUBLE 0.0174532925199432954743716805978"
	.ascii	"692718781530857086181640625\000"
.LASF1703:
	.ascii	"AP_HAL\000"
.LASF702:
	.ascii	"CONFIG_SYSTEM_SYSINFO 1\000"
.LASF1134:
	.ascii	"_POSIX_SIGQUEUE_MAX 32\000"
.LASF491:
	.ascii	"CONFIG_ARCH_INTERRUPTSTACK 750\000"
.LASF993:
	.ascii	"_GLIBCXX_HAVE_INTTYPES_H 1\000"
.LASF1697:
	.ascii	"Polygon_outside<float>\000"
.LASF1690:
	.ascii	"dx1s\000"
.LASF1627:
	.ascii	"is_inf\000"
.LASF171:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF175:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF904:
	.ascii	"_IEEE_ __fdlibm_ieee\000"
.LASF679:
	.ascii	"CONFIG_EXAMPLES_NSH 1\000"
.LASF186:
	.ascii	"__DEC32_MANT_DIG__ 7\000"
.LASF760:
	.ascii	"EXTERN\000"
.LASF922:
	.ascii	"_GLIBCXX_NOEXCEPT noexcept\000"
.LASF689:
	.ascii	"CONFIG_NSH_ROMFSMOUNTPT \"/etc\"\000"
.LASF871:
	.ascii	"M_SQRT1_2 0.70710678118654752440\000"
.LASF819:
	.ascii	"HUGE_VALL (__builtin_huge_vall())\000"
.LASF137:
	.ascii	"__UINTPTR_MAX__ 4294967295U\000"
.LASF213:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF1099:
	.ascii	"SCHAR_MIN (-SCHAR_MAX - 1)\000"
.LASF141:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF184:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF776:
	.ascii	"_FSEEK_OPTIMIZATION 1\000"
.LASF1546:
	.ascii	"sign(x) ((x)<0 ? -1 : 1)\000"
.LASF1291:
	.ascii	"HAL_COMPASS_QURT 12\000"
.LASF728:
	.ascii	"CONFIG_DEBUG_SPI\000"
.LASF210:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF80:
	.ascii	"__cpp_static_assert 200410\000"
.LASF415:
	.ascii	"CONFIG_ARCH \"arm\"\000"
.LASF1381:
	.ascii	"__INCLUDE_STDDEF_H \000"
.LASF1422:
	.ascii	"CH_18 17\000"
.LASF1014:
	.ascii	"_GLIBCXX_HAVE_STRINGS_H 1\000"
.LASF1121:
	.ascii	"_POSIX_CHILD_MAX 6\000"
.LASF651:
	.ascii	"CONFIG_STDIO_LINEBUFFER 1\000"
.LASF1702:
	.ascii	"/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-git/a"
	.ascii	"rdupilot/modules/PX4Firmware/Build/px4fmu-v2_APM.bu"
	.ascii	"ild/mnt/disk_d/src/quad-copter/ardu-copter/3.4.2-gi"
	.ascii	"t/ardupilot\000"
.LASF1691:
	.ascii	"dx2s\000"
.LASF384:
	.ascii	"CONFIG_HAL_BOARD HAL_BOARD_PX4\000"
.LASF841:
	.ascii	"isless(x,y) (__extension__ ({__typeof__(x) __x = (x"
	.ascii	"); __typeof__(y) __y = (y); !isunordered(__x,__y) &"
	.ascii	"& (__x < __y);}))\000"
.LASF22:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF1259:
	.ascii	"HAL_INS_VRBRAIN 8\000"
.LASF605:
	.ascii	"CONFIG_UART7_BITS 8\000"
.LASF1328:
	.ascii	"HAL_INS_MPU9250_NAME \"mpu9250\"\000"
.LASF1050:
	.ascii	"_GLIBCXX_USE_C99_CTYPE_TR1 1\000"
.LASF1508:
	.ascii	"AP_VAROFFSET(type,element) (((ptrdiff_t)(&((const t"
	.ascii	"ype *)1)->element))-1)\000"
.LASF1698:
	.ascii	"_Z15Polygon_outsideIfEbRK7Vector2IT_EPS3_j\000"
.LASF1262:
	.ascii	"HAL_INS_LSM9DS0 11\000"
.LASF1209:
	.ascii	"UINTMAX_MIN UINT64_MIN\000"
.LASF154:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF277:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF365:
	.ascii	"__THUMBEL__ 1\000"
.LASF1144:
	.ascii	"ARG_MAX _POSIX_ARG_MAX\000"
.LASF1554:
	.ascii	"char16_t\000"
.LASF1455:
	.ascii	"LDBL_DIG\000"
.LASF710:
	.ascii	"CONFIG_FS_WRITABLE 1\000"
.LASF1518:
	.ascii	"AP_PARAMDEFV(_t,_suffix,_pt) typedef AP_ParamV<_t, "
	.ascii	"_pt> AP_ ## _suffix;\000"
.LASF916:
	.ascii	"_GLIBCXX_VISIBILITY(V) __attribute__ ((__visibility"
	.ascii	"__ (#V)))\000"
.LASF828:
	.ascii	"FP_ILOGB0 (-INT_MAX)\000"
.LASF296:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF590:
	.ascii	"CONFIG_UART4_RXBUFSIZE 300\000"
.LASF875:
	.ascii	"M_IVLN10 0.43429448190325182765\000"
.LASF1672:
	.ascii	"_ZNK7Vector2IfE5angleERKS0_\000"
.LASF1331:
	.ascii	"HAL_INS_ICM20608_AM_NAME \"icm20608-am\"\000"
.LASF20:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF460:
	.ascii	"CONFIG_STM32_UART8 1\000"
.LASF205:
	.ascii	"__DEC128_EPSILON__ 1E-33DL\000"
.LASF33:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF1458:
	.ascii	"LDBL_DIG __LDBL_DIG__\000"
.LASF1039:
	.ascii	"_GLIBCXX_PACKAGE_URL \"\"\000"
.LASF1154:
	.ascii	"SSIZE_MAX _POSIX_SSIZE_MAX\000"
.LASF54:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF975:
	.ascii	"_GLIBCXX_HAVE_EPROTO 1\000"
.LASF1242:
	.ascii	"HAL_BOARD_SUBTYPE_LINUX_URUS 1017\000"
.LASF521:
	.ascii	"CONFIG_MAX_TASK_ARGS 10\000"
.LASF1598:
	.ascii	"operator==\000"
.LASF39:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF454:
	.ascii	"CONFIG_STM32_USART1 1\000"
.LASF696:
	.ascii	"CONFIG_NSH_FATNSECTORS 1024\000"
.LASF1648:
	.ascii	"projected\000"
.LASF611:
	.ascii	"CONFIG_UART8_BITS 8\000"
.LASF1404:
	.ascii	"RC_OUTPUT_MAX_PULSEWIDTH 2100\000"
.LASF222:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF1142:
	.ascii	"_POSIX_SEM_NSEMS_MAX INT_MAX\000"
.LASF591:
	.ascii	"CONFIG_UART4_TXBUFSIZE 300\000"
.LASF1558:
	.ascii	"unsigned int\000"
.LASF1540:
	.ascii	"NSEC_PER_SEC 1000000000ULL\000"
.LASF1290:
	.ascii	"HAL_COMPASS_QFLIGHT 11\000"
.LASF1399:
	.ascii	"HAL_GPIO_INTERRUPT_FALLING 2\000"
.LASF894:
	.ascii	"M_SQRT2_F 1.41421356237309504880f\000"
.LASF1670:
	.ascii	"_ZNK7Vector2IfEmlERKS0_\000"
.LASF1210:
	.ascii	"UINTMAX_MAX UINT64_MAX\000"
.LASF1420:
	.ascii	"CH_16 15\000"
.LASF884:
	.ascii	"M_TWOPI_F (M_PI_F * 2.0f)\000"
.LASF726:
	.ascii	"CONFIG_DEBUG_GRAPHICS\000"
.LASF393:
	.ascii	"__STDC_FORMAT_MACROS 1\000"
.LASF1090:
	.ascii	"__glibcxx_digits\000"
.LASF316:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF1686:
	.ascii	"_ZN7Vector2IfE13perpendicularERKS0_S2_\000"
.LASF1452:
	.ascii	"LDBL_MANT_DIG __LDBL_MANT_DIG__\000"
.LASF382:
	.ascii	"ARDUPILOT_BUILD 1\000"
.LASF939:
	.ascii	"_GLIBCXX_BEGIN_NAMESPACE_LDBL \000"
.LASF394:
	.ascii	"HAVE_STD_NULLPTR_T 0\000"
.LASF1302:
	.ascii	"HAL_OS_POSIX_IO 1\000"
.LASF1556:
	.ascii	"short int\000"
.LASF606:
	.ascii	"CONFIG_UART7_PARITY 0\000"
.LASF645:
	.ascii	"CONFIG_FS_ROMFS 1\000"
.LASF750:
	.ascii	"CONFIG_SMALL_MEMORY\000"
.LASF4:
	.ascii	"__GNUC_MINOR__ 9\000"
.LASF872:
	.ascii	"M_LN2LO 1.9082149292705877000E-10\000"
.LASF435:
	.ascii	"CONFIG_STM32_BKPSRAM 1\000"
.LASF667:
	.ascii	"CONFIG_SCHED_WORKPERIOD 5000\000"
.LASF1054:
	.ascii	"_GLIBCXX_USE_C99_STDINT_TR1 1\000"
.LASF55:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF1511:
	.ascii	"AP_GROUPINFO(name,idx,clazz,element,def) AP_GROUPIN"
	.ascii	"FO_FLAGS(name, idx, clazz, element, def, 0)\000"
.LASF774:
	.ascii	"_LDBL_EQ_DBL 1\000"
.LASF1101:
	.ascii	"UCHAR_MAX 255\000"
.LASF1332:
	.ascii	"HAL_INS_ICM20608_EXT_NAME \"icm20608_ext\"\000"
.LASF3:
	.ascii	"__GNUC__ 4\000"
.LASF1462:
	.ascii	"FLT_MIN_EXP __FLT_MIN_EXP__\000"
.LASF1509:
	.ascii	"AP_CLASSTYPE(clazz,element) ((uint8_t)(((const claz"
	.ascii	"z *) 1)->element.vtype))\000"
.LASF396:
	.ascii	"HAVE_BYTESWAP_H 0\000"
.LASF1444:
	.ascii	"_FLOAT_H___ \000"
.LASF890:
	.ascii	"M_2_PI_F 0.63661977236758134308f\000"
.LASF759:
	.ascii	"EXTERN extern \"C\"\000"
.LASF701:
	.ascii	"CONFIG_READLINE_ECHO 1\000"
.LASF153:
	.ascii	"__FLT_DENORM_MIN__ 1.4012984643248171e-45F\000"
.LASF618:
	.ascii	"CONFIG_USBDEV_MAXPOWER 500\000"
.LASF1024:
	.ascii	"_GLIBCXX_HAVE_TANHF 1\000"
.LASF600:
	.ascii	"CONFIG_USART6_PARITY 0\000"
.LASF489:
	.ascii	"CONFIG_DRAM_SIZE 262144\000"
.LASF52:
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
.LASF665:
	.ascii	"CONFIG_SCHED_HPWORK 1\000"
.LASF363:
	.ascii	"__ARM_ARCH_ISA_THUMB 2\000"
.LASF934:
	.ascii	"_GLIBCXX_END_NAMESPACE_ALGO \000"
.LASF1641:
	.ascii	"_ZN7Vector2IiE9normalizeEv\000"
.LASF932:
	.ascii	"_GLIBCXX_STD_C std\000"
.LASF1001:
	.ascii	"_GLIBCXX_HAVE_MACHINE_PARAM_H 1\000"
.LASF1372:
	.ascii	"DEFINE_BYTE_ARRAY_METHODS inline uint8_t &operator["
	.ascii	"](size_t i) { return reinterpret_cast<uint8_t *>(th"
	.ascii	"is)[i]; } inline uint8_t operator[](size_t i) const"
	.ascii	" { return reinterpret_cast<const uint8_t *>(this)[i"
	.ascii	"]; }\000"
.LASF699:
	.ascii	"CONFIG_NSH_ARCHINIT 1\000"
.LASF616:
	.ascii	"CONFIG_USBDEV 1\000"
.LASF387:
	.ascii	"APM_BUILD_DIRECTORY APM_BUILD_ArduPlane\000"
.LASF230:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF579:
	.ascii	"CONFIG_USART2_2STOP 0\000"
.LASF5:
	.ascii	"__GNUC_PATCHLEVEL__ 3\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20141119 (release) [ARM/embedded-4_9-branch revision 218278]"
