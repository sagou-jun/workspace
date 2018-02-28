
FunctionCallTest.o:     file format elf32-v850


Disassembly of section .text:

00000000 <_ResetVector>:
       0:	80 07 00 02 	jr	200 <_Bootup>
	...

00000010 <SYSERR>:
	...

00000020 <HVTRAP>:
	...

00000030 <FETRAP>:
	...

00000040 <TRAP0>:
	...

00000050 <TRAP1>:
	...

00000060 <RIE>:
	...

00000070 <FPPFPI>:
	...

00000080 <UCPOP>:
	...

00000090 <MIP>:
	...

000000a0 <PIE>:
	...

000000b0 <DEBUG>:
	...

000000c0 <MAE>:
	...

000000d0 <RFU>:
	...

000000e0 <FENMI>:
	...

000000f0 <FEINT>:
	...

00000100 <EIINTn0>:
	...

00000110 <EIINTn1>:
	...

00000120 <EIINTn2>:
	...

00000130 <EIINTn3>:
	...

00000140 <EIINTn4>:
	...

00000150 <EIINTn5>:
	...

00000160 <EIINTn6>:
	...

00000170 <EIINTn7>:
	...

00000180 <EIINTn8>:
	...

00000190 <EIINTn9>:
	...

000001a0 <EIINTn10>:
	...

000001b0 <EIINTn11>:
	...

000001c0 <EIINTn12>:
	...

000001d0 <EIINTn13>:
	...

000001e0 <EIINTn14>:
	...

000001f0 <EIINTn15>:
     1f0:	80 07 7e 00 	jr	26e <GoHalt>
	...

00000200 <_Bootup>:
     200:	00 08       	mov	r0, r1
     202:	00 10       	mov	r0, r2
     204:	00 18       	mov	r0, sp
     206:	00 20       	mov	r0, gp
     208:	00 28       	mov	r0, r5
     20a:	00 30       	mov	r0, r6
     20c:	00 38       	mov	r0, r7
     20e:	00 40       	mov	r0, r8
     210:	00 48       	mov	r0, r9
     212:	00 50       	mov	r0, r10
     214:	00 58       	mov	r0, r11
     216:	00 60       	mov	r0, r12
     218:	00 68       	mov	r0, r13
     21a:	00 70       	mov	r0, r14
     21c:	00 78       	mov	r0, r15
     21e:	00 80       	mov	r0, r16
     220:	00 88       	mov	r0, r17
     222:	00 90       	mov	r0, r18
     224:	00 98       	mov	r0, r19
     226:	00 a0       	mov	r0, r20
     228:	00 a8       	mov	r0, r21
     22a:	00 b0       	mov	r0, r22
     22c:	00 b8       	mov	r0, r23
     22e:	00 c0       	mov	r0, r24
     230:	00 c8       	mov	r0, r25
     232:	00 d0       	mov	r0, r26
     234:	00 d8       	mov	r0, r27
     236:	00 e0       	mov	r0, r28
     238:	00 e8       	mov	r0, r29
     23a:	00 f0       	mov	r0, ep
     23c:	00 f8       	mov	r0, lp
     23e:	40 56 00 00 	movhi	0, r0, r10
     242:	2a 56 74 02 	movea	628, r10, r10
     246:	80 ff 04 00 	jarl	24a <_Bootup+0x4a>, lp
     24a:	44 fa       	add	4, lp
     24c:	6a 00       	jmp	[r10]
     24e:	e0 5f 40 10 	stsr	sr0, r11, 2
     252:	90 5a       	shr	16, r11
     254:	cb 5e 07 00 	andi	7, r11, r11
     258:	61 5a       	cmp	1, r11
     25a:	aa 0d       	bne	26e <GoHalt>

0000025c <PE1>:
     25c:	40 56 00 00 	movhi	0, r0, r10
     260:	2a 56 8c 02 	movea	652, r10, r10
     264:	80 ff 04 00 	jarl	268 <PE1+0xc>, lp
     268:	44 fa       	add	4, lp
     26a:	6a 00       	jmp	[r10]
     26c:	95 05       	br	26e <GoHalt>

0000026e <GoHalt>:
     26e:	e0 07 20 01 	halt	
     272:	e5 fd       	br	26e <GoHalt>

00000274 <_EnableCopro>:
     274:	e5 67 40 00 	stsr	sr5, r12, 0
     278:	2d 06 00 00 	mov	0x10000, r13
     27c:	01 00 
     27e:	0d 61       	or	r13, r12
     280:	ec 2f 20 00 	ldsr	r12, sr5, 0
     284:	7f 00       	jmp	[lp]

00000286 <_Halt>:
     286:	e0 07 20 01 	halt	
     28a:	7f 00       	jmp	[lp]

0000028c <_start>:
     28c:	20 a6 ff 00 	movea	255, r0, r20
     290:	35 06 ff ff 	mov	0xffff, r21
     294:	00 00 
     296:	23 06 f0 ff 	mov	0xfedffff0, sp
     29a:	df fe 
     29c:	3e 06 80 08 	mov	0xfedf0880, ep
     2a0:	df fe 
     2a2:	24 06 80 88 	mov	0xfedf8880, gp
     2a6:	df fe 
     2a8:	26 06 64 78 	mov	0x7864, r6
     2ac:	00 00 
     2ae:	e6 a7 20 00 	ldsr	r6, sr20, 0
     2b2:	e5 37 40 00 	stsr	sr5, r6, 0
     2b6:	40 3e 03 00 	movhi	3, r0, r7
     2ba:	07 31       	or	r7, r6
     2bc:	e6 2f 20 00 	ldsr	r6, sr5, 0
     2c0:	26 06 88 08 	mov	0xfedf0888, r6
     2c4:	df fe 
     2c6:	27 06 d8 08 	mov	0xfedf08d8, r7
     2ca:	df fe 
     2cc:	66 07 01 00 	st.w	r0, 0[r6]
     2d0:	06 36 04 00 	addi	4, r6, r6
     2d4:	e7 31       	cmp	r7, r6
     2d6:	b1 fd       	bl	2cc <_start+0x40>
     2d8:	80 ff 7e 03 	jarl	656 <___main>, lp
     2dc:	03 1e f0 ff 	addi	-16, sp, sp
     2e0:	00 32       	mov	0, r6
     2e2:	00 3a       	mov	0, r7
     2e4:	00 42       	mov	0, r8
     2e6:	80 ff 70 01 	jarl	456 <_main>, lp
     2ea:	0a 30       	mov	r10, r6
     2ec:	80 ff 10 02 	jarl	4fc <_exit>, lp

000002f0 <_test>:
     2f0:	5c 1a       	add	-4, sp
     2f2:	63 ef 01 00 	st.w	r29, 0[sp]
     2f6:	50 1a       	add	-16, sp
     2f8:	03 e8       	mov	sp, r29
     2fa:	7d 37 0d 00 	st.w	r6, 12[r29]
     2fe:	7d 3f 09 00 	st.w	r7, 8[r29]
     302:	bd 07 0f 40 	st.dw	r8, 0[r29]
     306:	00 00 
     308:	3d 5f 0d 00 	ld.w	12[r29], r11
     30c:	3d 57 09 00 	ld.w	8[r29], r10
     310:	cb 51       	add	r11, r10
     312:	e0 57 52 64 	cvtf.wd	r10, r12
     316:	3d 57 01 00 	ld.w	0[r29], r10
     31a:	3d 5f 05 00 	ld.w	4[r29], r11
     31e:	ec 57 70 54 	addf.d	r12, r10, r10
     322:	e1 57 50 54 	trncf.dw	r10, r10
     326:	1d 18       	mov	r29, sp
     328:	23 ef 11 00 	ld.w	16[sp], r29
     32c:	03 1e 14 00 	addi	20, sp, sp
     330:	7f 00       	jmp	[lp]

00000332 <_fn1>:
     332:	58 1a       	add	-8, sp
     334:	63 ff 05 00 	st.w	lp, 4[sp]
     338:	63 ef 01 00 	st.w	r29, 0[sp]
     33c:	58 1a       	add	-8, sp
     33e:	03 e8       	mov	sp, r29
     340:	7d 37 05 00 	st.w	r6, 4[r29]
     344:	7d 3f 01 00 	st.w	r7, 0[r29]
     348:	3d 57 01 00 	ld.w	0[r29], r10
     34c:	60 52       	cmp	0, r10
     34e:	92 15       	be	370 <_fn1+0x3e>
     350:	3d 57 01 00 	ld.w	0[r29], r10
     354:	5f 52       	add	-1, r10
     356:	3d 37 05 00 	ld.w	4[r29], r6
     35a:	0a 38       	mov	r10, r7
     35c:	2a 06 32 03 	mov	0x332, r10
     360:	00 00 
     362:	ea c7 60 f9 	jarl	[r10], lp
     366:	0a 58       	mov	r10, r11
     368:	3d 57 05 00 	ld.w	4[r29], r10
     36c:	cb 51       	add	r11, r10
     36e:	a5 05       	br	372 <_fn1+0x40>
     370:	01 52       	mov	1, r10
     372:	1d 18       	mov	r29, sp
     374:	23 ff 0d 00 	ld.w	12[sp], lp
     378:	23 ef 09 00 	ld.w	8[sp], r29
     37c:	03 1e 10 00 	addi	16, sp, sp
     380:	7f 00       	jmp	[lp]

00000382 <_fn2>:
     382:	5c 1a       	add	-4, sp
     384:	63 ef 01 00 	st.w	r29, 0[sp]
     388:	03 1e e4 ff 	addi	-28, sp, sp
     38c:	03 e8       	mov	sp, r29
     38e:	bd 07 8f 30 	st.dw	r6, 8[r29]
     392:	00 00 
     394:	bd 07 0f 40 	st.dw	r8, 0[r29]
     398:	00 00 
     39a:	00 52       	mov	0, r10
     39c:	00 5a       	mov	0, r11
     39e:	bd 07 0f 51 	st.dw	r10, 16[r29]
     3a2:	00 00 
     3a4:	7d 07 19 00 	st.w	r0, 24[r29]
     3a8:	85 25       	br	3e8 <_fn2+0x66>
     3aa:	3d 57 19 00 	ld.w	24[r29], r10
     3ae:	e0 57 52 64 	cvtf.wd	r10, r12
     3b2:	3d 57 09 00 	ld.w	8[r29], r10
     3b6:	3d 5f 0d 00 	ld.w	12[r29], r11
     3ba:	ec 57 74 64 	mulf.d	r12, r10, r12
     3be:	3d 57 01 00 	ld.w	0[r29], r10
     3c2:	3d 5f 05 00 	ld.w	4[r29], r11
     3c6:	ea 67 7e 64 	divf.d	r10, r12, r12
     3ca:	3d 57 11 00 	ld.w	16[r29], r10
     3ce:	3d 5f 15 00 	ld.w	20[r29], r11
     3d2:	ea 67 70 54 	addf.d	r10, r12, r10
     3d6:	7d 57 11 00 	st.w	r10, 16[r29]
     3da:	7d 5f 15 00 	st.w	r11, 20[r29]
     3de:	3d 57 19 00 	ld.w	24[r29], r10
     3e2:	41 52       	add	1, r10
     3e4:	7d 57 19 00 	st.w	r10, 24[r29]
     3e8:	3d 57 19 00 	ld.w	24[r29], r10
     3ec:	69 52       	cmp	9, r10
     3ee:	e7 dd       	ble	3aa <_fn2+0x28>
     3f0:	3d 57 11 00 	ld.w	16[r29], r10
     3f4:	3d 5f 15 00 	ld.w	20[r29], r11
     3f8:	0a 60       	mov	r10, r12
     3fa:	0b 68       	mov	r11, r13
     3fc:	0c 50       	mov	r12, r10
     3fe:	0d 58       	mov	r13, r11
     400:	1d 18       	mov	r29, sp
     402:	23 ef 1d 00 	ld.w	28[sp], r29
     406:	03 1e 20 00 	addi	32, sp, sp
     40a:	7f 00       	jmp	[lp]

0000040c <_fn3>:
     40c:	58 1a       	add	-8, sp
     40e:	63 ff 05 00 	st.w	lp, 4[sp]
     412:	63 ef 01 00 	st.w	r29, 0[sp]
     416:	03 e8       	mov	sp, r29
     418:	2a 06 d0 08 	mov	0xfedf08d0, r10
     41c:	df fe 
     41e:	2a 57 01 00 	ld.w	0[r10], r10
     422:	60 52       	cmp	0, r10
     424:	a2 15       	be	448 <_fn3+0x3c>
     426:	2a 06 d0 08 	mov	0xfedf08d0, r10
     42a:	df fe 
     42c:	2a 57 01 00 	ld.w	0[r10], r10
     430:	0a 5e ff ff 	addi	-1, r10, r11
     434:	2a 06 d0 08 	mov	0xfedf08d0, r10
     438:	df fe 
     43a:	6a 5f 01 00 	st.w	r11, 0[r10]
     43e:	2a 06 0c 04 	mov	0x40c, r10
     442:	00 00 
     444:	ea c7 60 f9 	jarl	[r10], lp
     448:	1d 18       	mov	r29, sp
     44a:	23 ff 05 00 	ld.w	4[sp], lp
     44e:	23 ef 01 00 	ld.w	0[sp], r29
     452:	48 1a       	add	8, sp
     454:	7f 00       	jmp	[lp]

00000456 <_main>:
     456:	58 1a       	add	-8, sp
     458:	63 ff 05 00 	st.w	lp, 4[sp]
     45c:	63 ef 01 00 	st.w	r29, 0[sp]
     460:	03 1e e8 ff 	addi	-24, sp, sp
     464:	03 e8       	mov	sp, r29
     466:	01 32       	mov	1, r6
     468:	03 3a       	mov	3, r7
     46a:	28 06 a4 70 	mov	0xa3d70a4, r8
     46e:	3d 0a 
     470:	29 06 d7 a3 	mov	0x4012a3d7, r9
     474:	12 40 
     476:	2a 06 f0 02 	mov	0x2f0, r10
     47a:	00 00 
     47c:	ea c7 60 f9 	jarl	[r10], lp
     480:	20 36 19 00 	movea	25, r0, r6
     484:	04 3a       	mov	4, r7
     486:	2a 06 32 03 	mov	0x332, r10
     48a:	00 00 
     48c:	ea c7 60 f9 	jarl	[r10], lp
     490:	7d 57 15 00 	st.w	r10, 20[r29]
     494:	00 32       	mov	0, r6
     496:	40 3e 00 40 	movhi	16384, r0, r7
     49a:	00 42       	mov	0, r8
     49c:	40 4e 10 40 	movhi	16400, r0, r9
     4a0:	2a 06 82 03 	mov	0x382, r10
     4a4:	00 00 
     4a6:	ea c7 60 f9 	jarl	[r10], lp
     4aa:	bd 07 cf 50 	st.dw	r10, 12[r29]
     4ae:	00 00 
     4b0:	2a 06 d0 08 	mov	0xfedf08d0, r10
     4b4:	df fe 
     4b6:	05 5a       	mov	5, r11
     4b8:	6a 5f 01 00 	st.w	r11, 0[r10]
     4bc:	2a 06 0c 04 	mov	0x40c, r10
     4c0:	00 00 
     4c2:	ea c7 60 f9 	jarl	[r10], lp
     4c6:	3d 57 15 00 	ld.w	20[r29], r10
     4ca:	63 57 01 00 	st.w	r10, 0[sp]
     4ce:	bd 07 c9 50 	ld.dw	12[r29], r10
     4d2:	00 00 
     4d4:	a3 07 4f 50 	st.dw	r10, 4[sp]
     4d8:	00 00 
     4da:	26 06 04 79 	mov	0x7904, r6
     4de:	00 00 
     4e0:	2a 06 bc 05 	mov	0x5bc, r10
     4e4:	00 00 
     4e6:	ea c7 60 f9 	jarl	[r10], lp
     4ea:	00 52       	mov	0, r10
     4ec:	1d 18       	mov	r29, sp
     4ee:	23 ff 1d 00 	ld.w	28[sp], lp
     4f2:	23 ef 19 00 	ld.w	24[sp], r29
     4f6:	03 1e 20 00 	addi	32, sp, sp
     4fa:	7f 00       	jmp	[lp]

000004fc <_exit>:
     4fc:	58 1a       	add	-8, sp
     4fe:	63 ff 05 00 	st.w	lp, 4[sp]
     502:	63 ef 01 00 	st.w	r29, 0[sp]
     506:	5c 1a       	add	-4, sp
     508:	03 e8       	mov	sp, r29
     50a:	7d 37 01 00 	st.w	r6, 0[r29]
     50e:	2a 06 fc 7f 	mov	0xffff7ffc, r10
     512:	ff ff 
     514:	3d 5f 01 00 	ld.w	0[r29], r11
     518:	cb 00       	zxh	r11
     51a:	6a 5f 00 00 	st.h	r11, 0[r10]
     51e:	2a 06 fe 7f 	mov	0xffff7ffe, r10
     522:	ff ff 
     524:	20 5e 10 00 	movea	16, r0, r11
     528:	6a 5f 00 00 	st.h	r11, 0[r10]
     52c:	2a 06 86 02 	mov	0x286, r10
     530:	00 00 
     532:	ea c7 60 f9 	jarl	[r10], lp
     536:	b5 fd       	br	52c <_exit+0x30>

00000538 <_sim_printf>:
     538:	58 1a       	add	-8, sp
     53a:	63 ff 05 00 	st.w	lp, 4[sp]
     53e:	63 ef 01 00 	st.w	r29, 0[sp]
     542:	03 1e 70 ff 	addi	-144, sp, sp
     546:	03 e8       	mov	sp, r29
     548:	7d 37 05 00 	st.w	r6, 4[r29]
     54c:	7d 3f 01 00 	st.w	r7, 0[r29]
     550:	1d 56 08 00 	addi	8, r29, r10
     554:	0a 30       	mov	r10, r6
     556:	20 3e 80 00 	movea	128, r0, r7
     55a:	3d 47 05 00 	ld.w	4[r29], r8
     55e:	3d 4f 01 00 	ld.w	0[r29], r9
     562:	2a 06 06 07 	mov	0x706, r10
     566:	00 00 
     568:	ea c7 60 f9 	jarl	[r10], lp
     56c:	7d 57 89 00 	st.w	r10, 136[r29]
     570:	7d 07 8d 00 	st.w	r0, 140[r29]
     574:	c5 15       	br	59c <_sim_printf+0x64>
     576:	2a 06 e0 7f 	mov	0xffff7fe0, r10
     57a:	ff ff 
     57c:	1d 66 08 00 	addi	8, r29, r12
     580:	3d 5f 8d 00 	ld.w	140[r29], r11
     584:	cc 59       	add	r12, r11
     586:	0b 5f 00 00 	ld.b	0[r11], r11
     58a:	d8 5a       	shl	24, r11
     58c:	b8 5a       	sar	24, r11
     58e:	4a 5f 00 00 	st.b	r11, 0[r10]
     592:	3d 57 8d 00 	ld.w	140[r29], r10
     596:	41 52       	add	1, r10
     598:	7d 57 8d 00 	st.w	r10, 140[r29]
     59c:	3d 5f 8d 00 	ld.w	140[r29], r11
     5a0:	3d 57 89 00 	ld.w	136[r29], r10
     5a4:	ea 59       	cmp	r10, r11
     5a6:	86 ed       	blt	576 <_sim_printf+0x3e>
     5a8:	3d 57 89 00 	ld.w	136[r29], r10
     5ac:	1d 18       	mov	r29, sp
     5ae:	23 ff 95 00 	ld.w	148[sp], lp
     5b2:	23 ef 91 00 	ld.w	144[sp], r29
     5b6:	03 1e 98 00 	addi	152, sp, sp
     5ba:	7f 00       	jmp	[lp]

000005bc <_my_printf>:
     5bc:	58 1a       	add	-8, sp
     5be:	63 ff 05 00 	st.w	lp, 4[sp]
     5c2:	63 ef 01 00 	st.w	r29, 0[sp]
     5c6:	54 1a       	add	-12, sp
     5c8:	03 e8       	mov	sp, r29
     5ca:	7d 37 01 00 	st.w	r6, 0[r29]
     5ce:	20 5e 14 00 	movea	20, r0, r11
     5d2:	dd 59       	add	r29, r11
     5d4:	1d 56 04 00 	addi	4, r29, r10
     5d8:	6a 5f 01 00 	st.w	r11, 0[r10]
     5dc:	3d 57 05 00 	ld.w	4[r29], r10
     5e0:	3d 37 01 00 	ld.w	0[r29], r6
     5e4:	0a 38       	mov	r10, r7
     5e6:	2a 06 38 05 	mov	0x538, r10
     5ea:	00 00 
     5ec:	ea c7 60 f9 	jarl	[r10], lp
     5f0:	7d 57 09 00 	st.w	r10, 8[r29]
     5f4:	3d 57 09 00 	ld.w	8[r29], r10
     5f8:	1d 18       	mov	r29, sp
     5fa:	23 ff 11 00 	ld.w	16[sp], lp
     5fe:	23 ef 0d 00 	ld.w	12[sp], r29
     602:	03 1e 14 00 	addi	20, sp, sp
     606:	7f 00       	jmp	[lp]

00000608 <_GetCycleCount>:
     608:	5c 1a       	add	-4, sp
     60a:	63 ef 01 00 	st.w	r29, 0[sp]
     60e:	58 1a       	add	-8, sp
     610:	03 e8       	mov	sp, r29
     612:	32 06 f0 7f 	mov	0xffff7ff0, r18
     616:	ff ff 
     618:	32 97 01 00 	ld.w	0[r18], r18
     61c:	7d 97 05 00 	st.w	r18, 4[r29]
     620:	32 06 f4 7f 	mov	0xffff7ff4, r18
     624:	ff ff 
     626:	32 97 01 00 	ld.w	0[r18], r18
     62a:	7d 97 01 00 	st.w	r18, 0[r29]
     62e:	3d 87 01 00 	ld.w	0[r29], r16
     632:	00 8a       	mov	0, r17
     634:	10 68       	mov	r16, r13
     636:	c0 6a       	shl	0, r13
     638:	00 62       	mov	0, r12
     63a:	3d 57 05 00 	ld.w	4[r29], r10
     63e:	00 5a       	mov	0, r11
     640:	0c 70       	mov	r12, r14
     642:	0a 71       	or	r10, r14
     644:	0d 78       	mov	r13, r15
     646:	0b 79       	or	r11, r15
     648:	0f 58       	mov	r15, r11
     64a:	0e 50       	mov	r14, r10
     64c:	1d 18       	mov	r29, sp
     64e:	23 ef 09 00 	ld.w	8[sp], r29
     652:	4c 1a       	add	12, sp
     654:	7f 00       	jmp	[lp]

00000656 <___main>:
     656:	0e 02       	callt	14
     658:	2a 06 88 08 	mov	0xfedf0888, r10
     65c:	df fe 
     65e:	2a 57 01 00 	ld.w	0[r10], r10
     662:	60 52       	cmp	0, r10
     664:	8a 1d       	bne	694 <___main+0x3e>
     666:	01 5a       	mov	1, r11
     668:	2a 06 88 08 	mov	0xfedf0888, r10
     66c:	df fe 
     66e:	6a 5f 01 00 	st.w	r11, 0[r10]
     672:	2a 06 80 08 	mov	0xfedf0880, r10
     676:	df fe 
     678:	2b 06 80 08 	mov	0xfedf0880, r11
     67c:	df fe 
     67e:	ea 59       	cmp	r10, r11
     680:	a3 0d       	bnh	694 <___main+0x3e>
     682:	0b e8       	mov	r11, r29
     684:	0a e0       	mov	r10, r28
     686:	3d 57 fd ff 	ld.w	-4[r29], r10
     68a:	ea c7 60 f9 	jarl	[r10], lp
     68e:	5c ea       	add	-4, r29
     690:	fc e9       	cmp	r28, r29
     692:	ab fd       	bh	686 <___main+0x30>
     694:	0f 02       	callt	15

00000696 <__vsnprintf_r>:
     696:	0e 02       	callt	14
     698:	03 1e 98 ff 	addi	-104, sp, sp
     69c:	06 e0       	mov	r6, r28
     69e:	08 e8       	mov	r8, r29
     6a0:	60 42       	cmp	0, r8
     6a2:	fe 05       	bge	6b0 <__vsnprintf_r+0x1a>
     6a4:	20 56 8b 00 	movea	139, r0, r10
     6a8:	66 57 01 00 	st.w	r10, 0[r6]
     6ac:	1f 52       	mov	-1, r10
     6ae:	95 2d       	br	700 <__vsnprintf_r+0x6a>
     6b0:	20 56 08 02 	movea	520, r0, r10
     6b4:	63 57 0c 00 	st.h	r10, 12[sp]
     6b8:	63 3f 01 00 	st.w	r7, 0[sp]
     6bc:	63 3f 11 00 	st.w	r7, 16[sp]
     6c0:	60 42       	cmp	0, r8
     6c2:	c2 05       	be	6ca <__vsnprintf_r+0x34>
     6c4:	08 56 ff ff 	addi	-1, r8, r10
     6c8:	a5 05       	br	6cc <__vsnprintf_r+0x36>
     6ca:	00 52       	mov	0, r10
     6cc:	63 57 09 00 	st.w	r10, 8[sp]
     6d0:	63 57 15 00 	st.w	r10, 20[sp]
     6d4:	1f 52       	mov	-1, r10
     6d6:	63 57 0e 00 	st.h	r10, 14[sp]
     6da:	1c 30       	mov	r28, r6
     6dc:	03 38       	mov	sp, r7
     6de:	09 40       	mov	r9, r8
     6e0:	23 4f 75 00 	ld.w	116[sp], r9
     6e4:	80 ff 42 00 	jarl	726 <__svfprintf_r>, lp
     6e8:	7f 52       	cmp	-1, r10
     6ea:	de 05       	bge	6f4 <__vsnprintf_r+0x5e>
     6ec:	20 5e 8b 00 	movea	139, r0, r11
     6f0:	7c 5f 01 00 	st.w	r11, 0[r28]
     6f4:	60 ea       	cmp	0, r29
     6f6:	d2 05       	be	700 <__vsnprintf_r+0x6a>
     6f8:	23 5f 01 00 	ld.w	0[sp], r11
     6fc:	4b 07 00 00 	st.b	r0, 0[r11]
     700:	03 1e 68 00 	addi	104, sp, sp
     704:	0f 02       	callt	15

00000706 <_vsnprintf>:
     706:	12 02       	callt	18
     708:	5c 1a       	add	-4, sp
     70a:	06 60       	mov	r6, r12
     70c:	07 58       	mov	r7, r11
     70e:	08 50       	mov	r8, r10
     710:	63 4f 01 00 	st.w	r9, 0[sp]
     714:	24 37 01 80 	ld.w	-32768[gp], r6
     718:	0c 38       	mov	r12, r7
     71a:	0b 40       	mov	r11, r8
     71c:	0a 48       	mov	r10, r9
     71e:	bf ff 78 ff 	jarl	696 <__vsnprintf_r>, lp
     722:	44 1a       	add	4, sp
     724:	13 02       	callt	19

00000726 <__svfprintf_r>:
     726:	00 02       	callt	0
     728:	03 1e fc fe 	addi	-260, sp, sp
     72c:	06 b8       	mov	r6, r23
     72e:	07 c0       	mov	r7, r24
     730:	08 d8       	mov	r8, r27
     732:	63 4f 29 00 	st.w	r9, 40[sp]
     736:	80 ff fa 31 	jarl	3930 <__localeconv_r>, lp
     73a:	2a 57 01 00 	ld.w	0[r10], r10
     73e:	63 57 41 00 	st.w	r10, 64[sp]
     742:	0a 30       	mov	r10, r6
     744:	80 ff 14 44 	jarl	4b58 <_strlen>, lp
     748:	63 57 4d 00 	st.w	r10, 76[sp]
     74c:	63 07 49 00 	st.w	r0, 72[sp]
     750:	63 07 45 00 	st.w	r0, 68[sp]
     754:	d8 ff 0c 00 	tst1	7, 12[r24]
     758:	c2 1d       	be	790 <__svfprintf_r+0x6a>
     75a:	38 57 11 00 	ld.w	16[r24], r10
     75e:	60 52       	cmp	0, r10
     760:	8a 1d       	bne	790 <__svfprintf_r+0x6a>
     762:	17 30       	mov	r23, r6
     764:	20 3e 40 00 	movea	64, r0, r7
     768:	80 ff ee 31 	jarl	3956 <__malloc_r>, lp
     76c:	78 57 01 00 	st.w	r10, 0[r24]
     770:	78 57 11 00 	st.w	r10, 16[r24]
     774:	60 52       	cmp	0, r10
     776:	9a 0d       	bne	788 <__svfprintf_r+0x62>
     778:	0c 52       	mov	12, r10
     77a:	77 57 01 00 	st.w	r10, 0[r23]
     77e:	1f 32       	mov	-1, r6
     780:	63 37 25 00 	st.w	r6, 36[sp]
     784:	80 07 94 1a 	jr	2218 <__svfprintf_r+0x1af2>
     788:	20 56 40 00 	movea	64, r0, r10
     78c:	78 57 15 00 	st.w	r10, 20[r24]
     790:	03 ee a8 00 	addi	168, sp, r29
     794:	63 ef e9 00 	st.w	r29, 232[sp]
     798:	63 07 f1 00 	st.w	r0, 240[sp]
     79c:	63 07 ed 00 	st.w	r0, 236[sp]
     7a0:	63 07 3d 00 	st.w	r0, 60[sp]
     7a4:	63 07 39 00 	st.w	r0, 56[sp]
     7a8:	63 07 55 00 	st.w	r0, 84[sp]
     7ac:	63 07 51 00 	st.w	r0, 80[sp]
     7b0:	63 07 25 00 	st.w	r0, 36[sp]
     7b4:	03 56 74 00 	addi	116, sp, r10
     7b8:	63 57 15 00 	st.w	r10, 20[sp]
     7bc:	c5 05       	br	7c4 <__svfprintf_r+0x9e>
     7be:	03 ee a8 00 	addi	168, sp, r29
     7c2:	19 d8       	mov	r25, r27
     7c4:	1b 57 00 00 	ld.b	0[r27], r10
     7c8:	60 52       	cmp	0, r10
     7ca:	a2 15       	be	7ee <__svfprintf_r+0xc8>
     7cc:	20 5e 25 00 	movea	37, r0, r11
     7d0:	eb 51       	cmp	r11, r10
     7d2:	82 15       	be	7f2 <__svfprintf_r+0xcc>
     7d4:	1b 56 01 00 	addi	1, r27, r10
     7d8:	1b e0       	mov	r27, r28
     7da:	0b 60       	mov	r11, r12
     7dc:	41 e2       	add	1, r28
     7de:	0a 5f 00 00 	ld.b	0[r10], r11
     7e2:	60 5a       	cmp	0, r11
     7e4:	82 0d       	be	7f4 <__svfprintf_r+0xce>
     7e6:	41 52       	add	1, r10
     7e8:	ec 59       	cmp	r12, r11
     7ea:	9a fd       	bne	7dc <__svfprintf_r+0xb6>
     7ec:	c5 05       	br	7f4 <__svfprintf_r+0xce>
     7ee:	1b e0       	mov	r27, r28
     7f0:	a5 05       	br	7f4 <__svfprintf_r+0xce>
     7f2:	1b e0       	mov	r27, r28
     7f4:	1c d0       	mov	r28, r26
     7f6:	bb d1       	sub	r27, r26
     7f8:	c2 25       	be	840 <__svfprintf_r+0x11a>
     7fa:	7d df 01 00 	st.w	r27, 0[r29]
     7fe:	7d d7 05 00 	st.w	r26, 4[r29]
     802:	23 57 f1 00 	ld.w	240[sp], r10
     806:	da 51       	add	r26, r10
     808:	63 57 f1 00 	st.w	r10, 240[sp]
     80c:	23 57 ed 00 	ld.w	236[sp], r10
     810:	41 52       	add	1, r10
     812:	63 57 ed 00 	st.w	r10, 236[sp]
     816:	67 52       	cmp	7, r10
     818:	bf 05       	bgt	81e <__svfprintf_r+0xf8>
     81a:	48 ea       	add	8, r29
     81c:	d5 0d       	br	836 <__svfprintf_r+0x110>
     81e:	17 30       	mov	r23, r6
     820:	18 38       	mov	r24, r7
     822:	20 46 e8 00 	movea	232, r0, r8
     826:	c3 41       	add	sp, r8
     828:	80 ff 52 43 	jarl	4b7a <___ssprint_r>, lp
     82c:	60 52       	cmp	0, r10
     82e:	ea 07 cb 19 	bne	21f8 <__svfprintf_r+0x1ad2>
     832:	03 ee a8 00 	addi	168, sp, r29
     836:	23 5f 25 00 	ld.w	36[sp], r11
     83a:	da 59       	add	r26, r11
     83c:	63 5f 25 00 	st.w	r11, 36[sp]
     840:	1c 57 00 00 	ld.b	0[r28], r10
     844:	60 52       	cmp	0, r10
     846:	e2 07 97 19 	be	21dc <__svfprintf_r+0x1ab6>
     84a:	1c ce 01 00 	addi	1, r28, r25
     84e:	43 07 03 01 	st.b	r0, 259[sp]
     852:	00 72       	mov	0, r14
     854:	1f 62       	mov	-1, r12
     856:	63 67 19 00 	st.w	r12, 24[sp]
     85a:	63 07 2d 00 	st.w	r0, 44[sp]
     85e:	00 b2       	mov	0, r22
     860:	20 5e 20 00 	movea	32, r0, r11
     864:	20 6e 5a 00 	movea	90, r0, r13
     868:	2c 06 ac 08 	mov	0x8ac, r12
     86c:	00 00 
     86e:	20 9e 2a 00 	movea	42, r0, r19
     872:	1f 7a       	mov	-1, r15
     874:	20 96 6c 00 	movea	108, r0, r18
     878:	20 8e 68 00 	movea	104, r0, r17
     87c:	20 86 2b 00 	movea	43, r0, r16
     880:	85 0d       	br	890 <__svfprintf_r+0x16a>
     882:	63 57 29 00 	st.w	r10, 40[sp]
     886:	d5 05       	br	890 <__svfprintf_r+0x16a>
     888:	63 57 29 00 	st.w	r10, 40[sp]
     88c:	63 7f 19 00 	st.w	r15, 24[sp]
     890:	19 af 00 00 	ld.b	0[r25], r21
     894:	41 ca       	add	1, r25
     896:	15 50       	mov	r21, r10
     898:	ab 51       	sub	r11, r10
     89a:	ed 51       	cmp	r13, r10
     89c:	eb 07 bf 0d 	bh	165a <__svfprintf_r+0xf34>
     8a0:	c1 52       	shl	1, r10
     8a2:	cc 51       	add	r12, r10
     8a4:	2a 57 00 00 	ld.h	0[r10], r10
     8a8:	cc 51       	add	r12, r10
     8aa:	6a 00       	jmp	[r10]
     8ac:	d4 00       	zxh	r20
     8ae:	ae 0d       	bge	8c2 <__svfprintf_r+0x19c>
     8b0:	ae 0d       	bge	8c4 <__svfprintf_r+0x19e>
     8b2:	dc 00       	zxh	r28
     8b4:	ae 0d       	bge	8c8 <__svfprintf_r+0x1a2>
     8b6:	ae 0d       	bge	8ca <__svfprintf_r+0x1a4>
     8b8:	ae 0d       	bge	8cc <__svfprintf_r+0x1a6>
     8ba:	e4 ff ae 0d 	divf.s4	wr4, wr31, wr1
     8be:	ae 0d       	bge	8d2 <__svfprintf_r+0x1ac>
     8c0:	e2 00       	sxh	r2
     8c2:	0c 01       	or	r12, r0
     8c4:	ae 0d       	bge	8d8 <__svfprintf_r+0x1b2>
     8c6:	04 01       	or	gp, r0
     8c8:	12 01       	or	r18, r0
     8ca:	ae 0d       	bge	8de <__svfprintf_r+0x1b8>
     8cc:	70 01       	tst	r16, r0
     8ce:	78 01       	tst	r24, r0
     8d0:	78 01       	tst	r24, r0
     8d2:	78 01       	tst	r24, r0
     8d4:	78 01       	tst	r24, r0
     8d6:	78 01       	tst	r24, r0
     8d8:	78 01       	tst	r24, r0
     8da:	78 01       	tst	r24, r0
     8dc:	78 01       	tst	r24, r0
     8de:	78 01       	tst	r24, r0
     8e0:	ae 0d       	bge	8f4 <__svfprintf_r+0x1ce>
     8e2:	ae 0d       	bge	8f6 <__svfprintf_r+0x1d0>
     8e4:	ae 0d       	bge	8f8 <__svfprintf_r+0x1d2>
     8e6:	ae 0d       	bge	8fa <__svfprintf_r+0x1d4>
     8e8:	ae 0d       	bge	8fc <__svfprintf_r+0x1d6>
     8ea:	ae 0d       	bge	8fe <__svfprintf_r+0x1d8>
     8ec:	ae 0d       	bge	900 <__svfprintf_r+0x1da>
     8ee:	ba 02       	sar	26, r0
     8f0:	ae 0d       	bge	904 <__svfprintf_r+0x1de>
     8f2:	ea 01       	cmp	r10, r0
     8f4:	0e 02       	callt	14
     8f6:	ba 02       	sar	26, r0
     8f8:	ba 02       	sar	26, r0
     8fa:	ba 02       	sar	26, r0
     8fc:	ae 0d       	bge	910 <__svfprintf_r+0x1ea>
     8fe:	ae 0d       	bge	912 <__svfprintf_r+0x1ec>
     900:	ae 0d       	bge	914 <__svfprintf_r+0x1ee>
     902:	ae 0d       	bge	916 <__svfprintf_r+0x1f0>
     904:	9e 01       	subr	ep, r0
     906:	ae 0d       	bge	91a <__svfprintf_r+0x1f4>
     908:	ae 0d       	bge	91c <__svfprintf_r+0x1f6>
     90a:	1c 0a       	mov	-4, r1
     90c:	ae 0d       	bge	920 <__svfprintf_r+0x1fa>
     90e:	ae 0d       	bge	922 <__svfprintf_r+0x1fc>
     910:	ae 0d       	bge	924 <__svfprintf_r+0x1fe>
     912:	e0 0a       	mulh	0, r1
     914:	ae 0d       	bge	928 <__svfprintf_r+0x202>
     916:	4a 0b       	sld.b	74[ep], r1
     918:	ae 0d       	bge	92c <__svfprintf_r+0x206>
     91a:	ae 0d       	bge	92e <__svfprintf_r+0x208>
     91c:	be 00       	sxb	ep
     91e:	ae 0d       	bge	932 <__svfprintf_r+0x20c>
     920:	ae 0d       	bge	934 <__svfprintf_r+0x20e>
     922:	ae 0d       	bge	936 <__svfprintf_r+0x210>
     924:	ae 0d       	bge	938 <__svfprintf_r+0x212>
     926:	ae 0d       	bge	93a <__svfprintf_r+0x214>
     928:	ae 0d       	bge	93c <__svfprintf_r+0x216>
     92a:	ae 0d       	bge	93e <__svfprintf_r+0x218>
     92c:	ae 0d       	bge	940 <__svfprintf_r+0x21a>
     92e:	ba 02       	sar	26, r0
     930:	ae 0d       	bge	944 <__svfprintf_r+0x21e>
     932:	ea 01       	cmp	r10, r0
     934:	b6 00       	sxb	r22
     936:	ba 02       	sar	26, r0
     938:	ba 02       	sar	26, r0
     93a:	ba 02       	sar	26, r0
     93c:	a6 01       	sub	r6, r0
     93e:	b6 00       	sxb	r22
     940:	e2 01       	cmp	r2, r0
     942:	ae 0d       	bge	956 <__svfprintf_r+0x230>
     944:	c0 01       	add	r0, r0
     946:	ae 0d       	bge	95a <__svfprintf_r+0x234>
     948:	76 09       	tst	r22, r1
     94a:	20 0a       	satadd	0, r1
     94c:	a8 0a       	sar	8, r1
     94e:	da 01       	add	r26, r0
     950:	ae 0d       	bge	964 <__svfprintf_r+0x23e>
     952:	e0 0a       	mulh	0, r1
     954:	e4 ff 4e 0b 	.long	0x0b4effe4
     958:	ae 0d       	bge	96c <__svfprintf_r+0x246>
     95a:	ae 0d       	bge	96e <__svfprintf_r+0x248>
     95c:	d0 0b       	sst.b	r1, 80[ep]
     95e:	ae 0d       	bge	972 <__svfprintf_r+0x24c>
     960:	e4 ff 43 77 	ld.hu	30530[gp], lp
     964:	03 01       	or	sp, r0
     966:	80 07 5c 01 	jr	ac2 <__svfprintf_r+0x39c>
     96a:	43 77 03 01 	st.b	r14, 259[sp]
     96e:	16 50       	mov	r22, r10
     970:	15 60       	mov	r21, r12
     972:	2d 06 3a 79 	mov	0x793a, r13
     976:	00 00 
     978:	63 6f 55 00 	st.w	r13, 84[sp]
     97c:	80 07 12 0b 	jr	148e <__svfprintf_r+0xd68>
     980:	60 72       	cmp	0, r14
     982:	ee 5f 34 73 	cmov	nz, r14, r11, r14
     986:	d5 85       	br	890 <__svfprintf_r+0x16a>
     988:	96 b6 01 00 	ori	1, r22, r22
     98c:	a5 85       	br	890 <__svfprintf_r+0x16a>
     98e:	23 57 29 00 	ld.w	40[sp], r10
     992:	44 52       	add	4, r10
     994:	23 37 29 00 	ld.w	40[sp], r6
     998:	26 37 01 00 	ld.w	0[r6], r6
     99c:	63 37 2d 00 	st.w	r6, 44[sp]
     9a0:	60 32       	cmp	0, r6
     9a2:	fe 07 e1 fe 	bge	882 <__svfprintf_r+0x15c>
     9a6:	80 31       	subr	r0, r6
     9a8:	63 37 2d 00 	st.w	r6, 44[sp]
     9ac:	63 57 29 00 	st.w	r10, 40[sp]
     9b0:	96 b6 04 00 	ori	4, r22, r22
     9b4:	bf 07 dc fe 	jr	890 <__svfprintf_r+0x16a>
     9b8:	10 70       	mov	r16, r14
     9ba:	bf 07 d6 fe 	jr	890 <__svfprintf_r+0x16a>
     9be:	19 af 00 00 	ld.b	0[r25], r21
     9c2:	41 ca       	add	1, r25
     9c4:	f3 a9       	cmp	r19, r21
     9c6:	f2 05       	be	9d4 <__svfprintf_r+0x2ae>
     9c8:	15 36 d0 ff 	addi	-48, r21, r6
     9cc:	69 32       	cmp	9, r6
     9ce:	b3 15       	bnh	9f4 <__svfprintf_r+0x2ce>
     9d0:	00 52       	mov	0, r10
     9d2:	e5 1d       	br	a0e <__svfprintf_r+0x2e8>
     9d4:	23 57 29 00 	ld.w	40[sp], r10
     9d8:	44 52       	add	4, r10
     9da:	23 37 29 00 	ld.w	40[sp], r6
     9de:	26 37 01 00 	ld.w	0[r6], r6
     9e2:	63 37 19 00 	st.w	r6, 24[sp]
     9e6:	60 32       	cmp	0, r6
     9e8:	f6 07 a1 fe 	blt	888 <__svfprintf_r+0x162>
     9ec:	63 57 29 00 	st.w	r10, 40[sp]
     9f0:	bf 07 a0 fe 	jr	890 <__svfprintf_r+0x16a>
     9f4:	00 52       	mov	0, r10
     9f6:	0a 38       	mov	r10, r7
     9f8:	ca 39       	add	r10, r7
     9fa:	c3 52       	shl	3, r10
     9fc:	c7 51       	add	r7, r10
     9fe:	c6 51       	add	r6, r10
     a00:	19 af 00 00 	ld.b	0[r25], r21
     a04:	41 ca       	add	1, r25
     a06:	15 36 d0 ff 	addi	-48, r21, r6
     a0a:	69 32       	cmp	9, r6
     a0c:	d3 f5       	bnh	9f6 <__svfprintf_r+0x2d0>
     a0e:	60 52       	cmp	0, r10
     a10:	ea 7f 3c 53 	cmov	ge, r10, r15, r10
     a14:	63 57 19 00 	st.w	r10, 24[sp]
     a18:	bf 07 7e fe 	jr	896 <__svfprintf_r+0x170>
     a1c:	96 b6 80 00 	ori	128, r22, r22
     a20:	bf 07 70 fe 	jr	890 <__svfprintf_r+0x16a>
     a24:	00 52       	mov	0, r10
     a26:	0a 30       	mov	r10, r6
     a28:	ca 31       	add	r10, r6
     a2a:	c3 52       	shl	3, r10
     a2c:	c6 51       	add	r6, r10
     a2e:	15 ae d0 ff 	addi	-48, r21, r21
     a32:	d5 51       	add	r21, r10
     a34:	19 af 00 00 	ld.b	0[r25], r21
     a38:	41 ca       	add	1, r25
     a3a:	15 36 d0 ff 	addi	-48, r21, r6
     a3e:	69 32       	cmp	9, r6
     a40:	b3 f5       	bnh	a26 <__svfprintf_r+0x300>
     a42:	63 57 2d 00 	st.w	r10, 44[sp]
     a46:	bf 07 50 fe 	jr	896 <__svfprintf_r+0x170>
     a4a:	96 b6 08 00 	ori	8, r22, r22
     a4e:	bf 07 42 fe 	jr	890 <__svfprintf_r+0x16a>
     a52:	19 57 00 00 	ld.b	0[r25], r10
     a56:	f1 51       	cmp	r17, r10
     a58:	ea 05       	bne	a64 <__svfprintf_r+0x33e>
     a5a:	41 ca       	add	1, r25
     a5c:	96 b6 00 02 	ori	512, r22, r22
     a60:	bf 07 30 fe 	jr	890 <__svfprintf_r+0x16a>
     a64:	96 b6 40 00 	ori	64, r22, r22
     a68:	bf 07 28 fe 	jr	890 <__svfprintf_r+0x16a>
     a6c:	19 57 00 00 	ld.b	0[r25], r10
     a70:	f2 51       	cmp	r18, r10
     a72:	ea 05       	bne	a7e <__svfprintf_r+0x358>
     a74:	41 ca       	add	1, r25
     a76:	96 b6 20 00 	ori	32, r22, r22
     a7a:	bf 07 16 fe 	jr	890 <__svfprintf_r+0x16a>
     a7e:	96 b6 10 00 	ori	16, r22, r22
     a82:	bf 07 0e fe 	jr	890 <__svfprintf_r+0x16a>
     a86:	96 b6 20 00 	ori	32, r22, r22
     a8a:	bf 07 06 fe 	jr	890 <__svfprintf_r+0x16a>
     a8e:	96 b6 20 00 	ori	32, r22, r22
     a92:	bf 07 fe fd 	jr	890 <__svfprintf_r+0x16a>
     a96:	23 5f 29 00 	ld.w	40[sp], r11
     a9a:	2b 57 01 00 	ld.w	0[r11], r10
     a9e:	43 57 80 00 	st.b	r10, 128[sp]
     aa2:	43 07 03 01 	st.b	r0, 259[sp]
     aa6:	44 5a       	add	4, r11
     aa8:	63 5f 29 00 	st.w	r11, 40[sp]
     aac:	01 62       	mov	1, r12
     aae:	63 67 21 00 	st.w	r12, 32[sp]
     ab2:	03 a6 80 00 	addi	128, sp, r20
     ab6:	80 07 ce 17 	jr	2284 <__svfprintf_r+0x1b5e>
     aba:	43 77 03 01 	st.b	r14, 259[sp]
     abe:	96 b6 10 00 	ori	16, r22, r22
     ac2:	d6 56 20 00 	andi	32, r22, r10
     ac6:	b2 0d       	be	adc <__svfprintf_r+0x3b6>
     ac8:	23 6f 29 00 	ld.w	40[sp], r13
     acc:	2d df 01 00 	ld.w	0[r13], r27
     ad0:	2d e7 05 00 	ld.w	4[r13], r28
     ad4:	48 6a       	add	8, r13
     ad6:	63 6f 29 00 	st.w	r13, 40[sp]
     ada:	95 35       	br	b3c <__svfprintf_r+0x416>
     adc:	d6 56 10 00 	andi	16, r22, r10
     ae0:	b2 0d       	be	af6 <__svfprintf_r+0x3d0>
     ae2:	23 77 29 00 	ld.w	40[sp], r14
     ae6:	2e df 01 00 	ld.w	0[r14], r27
     aea:	1b e0       	mov	r27, r28
     aec:	bf e2       	sar	31, r28
     aee:	44 72       	add	4, r14
     af0:	63 77 29 00 	st.w	r14, 40[sp]
     af4:	c5 25       	br	b3c <__svfprintf_r+0x416>
     af6:	d6 56 40 00 	andi	64, r22, r10
     afa:	b2 0d       	be	b10 <__svfprintf_r+0x3ea>
     afc:	23 37 29 00 	ld.w	40[sp], r6
     b00:	26 e7 00 00 	ld.h	0[r6], r28
     b04:	1c d8       	mov	r28, r27
     b06:	bf e2       	sar	31, r28
     b08:	44 32       	add	4, r6
     b0a:	63 37 29 00 	st.w	r6, 40[sp]
     b0e:	f5 15       	br	b3c <__svfprintf_r+0x416>
     b10:	d6 56 00 02 	andi	512, r22, r10
     b14:	b2 0d       	be	b2a <__svfprintf_r+0x404>
     b16:	23 57 29 00 	ld.w	40[sp], r10
     b1a:	0a e7 00 00 	ld.b	0[r10], r28
     b1e:	1c d8       	mov	r28, r27
     b20:	bf e2       	sar	31, r28
     b22:	44 52       	add	4, r10
     b24:	63 57 29 00 	st.w	r10, 40[sp]
     b28:	a5 0d       	br	b3c <__svfprintf_r+0x416>
     b2a:	23 5f 29 00 	ld.w	40[sp], r11
     b2e:	2b df 01 00 	ld.w	0[r11], r27
     b32:	1b e0       	mov	r27, r28
     b34:	bf e2       	sar	31, r28
     b36:	44 5a       	add	4, r11
     b38:	63 5f 29 00 	st.w	r11, 40[sp]
     b3c:	60 e2       	cmp	0, r28
     b3e:	e6 05       	blt	b4a <__svfprintf_r+0x424>
     b40:	23 5f 19 00 	ld.w	24[sp], r11
     b44:	01 52       	mov	1, r10
     b46:	80 07 e8 09 	jr	152e <__svfprintf_r+0xe08>
     b4a:	80 d9       	subr	r0, r27
     b4c:	ea 57 00 00 	setf	nz, r10
     b50:	80 e1       	subr	r0, r28
     b52:	aa e1       	sub	r10, r28
     b54:	20 56 2d 00 	movea	45, r0, r10
     b58:	43 57 03 01 	st.b	r10, 259[sp]
     b5c:	23 5f 19 00 	ld.w	24[sp], r11
     b60:	01 52       	mov	1, r10
     b62:	80 07 cc 09 	jr	152e <__svfprintf_r+0xe08>
     b66:	23 d7 19 00 	ld.w	24[sp], r26
     b6a:	63 b7 1d 00 	st.w	r22, 28[sp]
     b6e:	15 e0       	mov	r21, r28
     b70:	43 77 03 01 	st.b	r14, 259[sp]
     b74:	d6 56 08 00 	andi	8, r22, r10
     b78:	b2 15       	be	b9e <__svfprintf_r+0x478>
     b7a:	23 67 29 00 	ld.w	40[sp], r12
     b7e:	2c 67 01 00 	ld.w	0[r12], r12
     b82:	63 67 49 00 	st.w	r12, 72[sp]
     b86:	23 6f 29 00 	ld.w	40[sp], r13
     b8a:	2d 6f 05 00 	ld.w	4[r13], r13
     b8e:	63 6f 45 00 	st.w	r13, 68[sp]
     b92:	23 77 29 00 	ld.w	40[sp], r14
     b96:	48 72       	add	8, r14
     b98:	63 77 29 00 	st.w	r14, 40[sp]
     b9c:	a5 15       	br	bc0 <__svfprintf_r+0x49a>
     b9e:	23 37 29 00 	ld.w	40[sp], r6
     ba2:	26 37 01 00 	ld.w	0[r6], r6
     ba6:	63 37 49 00 	st.w	r6, 72[sp]
     baa:	23 57 29 00 	ld.w	40[sp], r10
     bae:	2a 57 05 00 	ld.w	4[r10], r10
     bb2:	63 57 45 00 	st.w	r10, 68[sp]
     bb6:	23 5f 29 00 	ld.w	40[sp], r11
     bba:	48 5a       	add	8, r11
     bbc:	63 5f 29 00 	st.w	r11, 40[sp]
     bc0:	23 37 49 00 	ld.w	72[sp], r6
     bc4:	23 3f 45 00 	ld.w	68[sp], r7
     bc8:	80 ff 38 3e 	jarl	4a00 <___fpclassifyd>, lp
     bcc:	61 52       	cmp	1, r10
     bce:	ea 25       	bne	c1a <__svfprintf_r+0x4f4>
     bd0:	23 37 49 00 	ld.w	72[sp], r6
     bd4:	23 3f 45 00 	ld.w	68[sp], r7
     bd8:	00 42       	mov	0, r8
     bda:	00 4a       	mov	0, r9
     bdc:	80 ff 90 66 	jarl	726c <___ltdf2>, lp
     be0:	60 52       	cmp	0, r10
     be2:	de 05       	bge	bec <__svfprintf_r+0x4c6>
     be4:	20 56 2d 00 	movea	45, r0, r10
     be8:	43 57 03 01 	st.b	r10, 259[sp]
     bec:	2a 06 19 79 	mov	0x7919, r10
     bf0:	00 00 
     bf2:	2b 06 1d 79 	mov	0x791d, r11
     bf6:	00 00 
     bf8:	20 a6 47 00 	movea	71, r0, r20
     bfc:	f4 e1       	cmp	r20, r28
     bfe:	eb 57 3e a3 	cmov	gt, r11, r10, r20
     c02:	23 b7 1d 00 	ld.w	28[sp], r22
     c06:	20 66 7f ff 	movea	-129, r0, r12
     c0a:	4c b1       	and	r12, r22
     c0c:	03 6a       	mov	3, r13
     c0e:	63 6f 21 00 	st.w	r13, 32[sp]
     c12:	63 07 19 00 	st.w	r0, 24[sp]
     c16:	80 07 84 0a 	jr	169a <__svfprintf_r+0xf74>
     c1a:	23 37 49 00 	ld.w	72[sp], r6
     c1e:	23 3f 45 00 	ld.w	68[sp], r7
     c22:	80 ff de 3d 	jarl	4a00 <___fpclassifyd>, lp
     c26:	60 52       	cmp	0, r10
     c28:	8a 1d       	bne	c58 <__svfprintf_r+0x532>
     c2a:	2a 06 21 79 	mov	0x7921, r10
     c2e:	00 00 
     c30:	2b 06 25 79 	mov	0x7925, r11
     c34:	00 00 
     c36:	20 a6 47 00 	movea	71, r0, r20
     c3a:	f4 e1       	cmp	r20, r28
     c3c:	eb 57 3e a3 	cmov	gt, r11, r10, r20
     c40:	23 b7 1d 00 	ld.w	28[sp], r22
     c44:	20 76 7f ff 	movea	-129, r0, r14
     c48:	4e b1       	and	r14, r22
     c4a:	03 32       	mov	3, r6
     c4c:	63 37 21 00 	st.w	r6, 32[sp]
     c50:	63 07 19 00 	st.w	r0, 24[sp]
     c54:	80 07 46 0a 	jr	169a <__svfprintf_r+0xf74>
     c58:	20 56 61 00 	movea	97, r0, r10
     c5c:	ea e1       	cmp	r10, r28
     c5e:	f2 05       	be	c6c <__svfprintf_r+0x546>
     c60:	20 56 41 00 	movea	65, r0, r10
     c64:	ea e1       	cmp	r10, r28
     c66:	ca 25       	bne	cae <__svfprintf_r+0x588>
     c68:	80 07 ba 15 	jr	2222 <__svfprintf_r+0x1afc>
     c6c:	20 56 30 00 	movea	48, r0, r10
     c70:	43 57 7e 00 	st.b	r10, 126[sp]
     c74:	20 56 78 00 	movea	120, r0, r10
     c78:	43 57 7f 00 	st.b	r10, 127[sp]
     c7c:	23 57 1d 00 	ld.w	28[sp], r10
     c80:	8a b6 02 00 	ori	2, r10, r22
     c84:	20 56 27 00 	movea	39, r0, r10
     c88:	ea d1       	cmp	r10, r26
     c8a:	f7 25       	ble	cd8 <__svfprintf_r+0x5b2>
     c8c:	17 30       	mov	r23, r6
     c8e:	1a 3e 01 00 	addi	1, r26, r7
     c92:	80 ff c4 2c 	jarl	3956 <__malloc_r>, lp
     c96:	63 57 39 00 	st.w	r10, 56[sp]
     c9a:	60 52       	cmp	0, r10
     c9c:	9a 25       	bne	cde <__svfprintf_r+0x5b8>
     c9e:	38 57 0c 00 	ld.h	12[r24], r10
     ca2:	8a 56 40 00 	ori	64, r10, r10
     ca6:	78 57 0c 00 	st.h	r10, 12[r24]
     caa:	80 07 5e 15 	jr	2208 <__svfprintf_r+0x1ae2>
     cae:	7f d2       	cmp	-1, r26
     cb0:	a2 1d       	be	ce4 <__svfprintf_r+0x5be>
     cb2:	20 56 67 00 	movea	103, r0, r10
     cb6:	ea e1       	cmp	r10, r28
     cb8:	d2 05       	be	cc2 <__svfprintf_r+0x59c>
     cba:	20 56 47 00 	movea	71, r0, r10
     cbe:	ea e1       	cmp	r10, r28
     cc0:	fa 15       	bne	cee <__svfprintf_r+0x5c8>
     cc2:	60 d2       	cmp	0, r26
     cc4:	fb df 24 a3 	cmov	z, r27, r27, r20
     cc8:	23 5f 19 00 	ld.w	24[sp], r11
     ccc:	60 d2       	cmp	0, r26
     cce:	e1 5f 04 5b 	cmov	z, 1, r11, r11
     cd2:	63 5f 19 00 	st.w	r11, 24[sp]
     cd6:	d5 0d       	br	cf0 <__svfprintf_r+0x5ca>
     cd8:	03 a6 80 00 	addi	128, sp, r20
     cdc:	a5 0d       	br	cf0 <__svfprintf_r+0x5ca>
     cde:	23 a7 39 00 	ld.w	56[sp], r20
     ce2:	f5 05       	br	cf0 <__svfprintf_r+0x5ca>
     ce4:	1b a0       	mov	r27, r20
     ce6:	06 62       	mov	6, r12
     ce8:	63 67 19 00 	st.w	r12, 24[sp]
     cec:	a5 05       	br	cf0 <__svfprintf_r+0x5ca>
     cee:	1b a0       	mov	r27, r20
     cf0:	96 b6 00 01 	ori	256, r22, r22
     cf4:	23 d7 49 00 	ld.w	72[sp], r26
     cf8:	23 6f 45 00 	ld.w	68[sp], r13
     cfc:	63 6f 1d 00 	st.w	r13, 28[sp]
     d00:	60 6a       	cmp	0, r13
     d02:	be 0d       	bge	d18 <__svfprintf_r+0x5f2>
     d04:	40 76 00 80 	movhi	-32768, r0, r14
     d08:	ce 69       	add	r14, r13
     d0a:	63 6f 1d 00 	st.w	r13, 28[sp]
     d0e:	20 36 2d 00 	movea	45, r0, r6
     d12:	63 37 61 00 	st.w	r6, 96[sp]
     d16:	b5 05       	br	d1c <__svfprintf_r+0x5f6>
     d18:	63 07 61 00 	st.w	r0, 96[sp]
     d1c:	20 56 61 00 	movea	97, r0, r10
     d20:	ea e1       	cmp	r10, r28
     d22:	e2 05       	be	d2e <__svfprintf_r+0x608>
     d24:	20 56 41 00 	movea	65, r0, r10
     d28:	ea e1       	cmp	r10, r28
     d2a:	ea 07 0f 02 	bne	f38 <__svfprintf_r+0x812>
     d2e:	1a 30       	mov	r26, r6
     d30:	23 3f 1d 00 	ld.w	28[sp], r7
     d34:	03 46 fc 00 	addi	252, sp, r8
     d38:	80 ff 3e 3d 	jarl	4a76 <_frexp>, lp
     d3c:	0a 30       	mov	r10, r6
     d3e:	0b 38       	mov	r11, r7
     d40:	00 42       	mov	0, r8
     d42:	40 4e c0 3f 	movhi	16320, r0, r9
     d46:	80 ff 08 60 	jarl	6d4e <___muldf3>, lp
     d4a:	63 57 31 00 	st.w	r10, 48[sp]
     d4e:	63 5f 35 00 	st.w	r11, 52[sp]
     d52:	01 da       	mov	1, r27
     d54:	0a 30       	mov	r10, r6
     d56:	0b 38       	mov	r11, r7
     d58:	00 42       	mov	0, r8
     d5a:	00 4a       	mov	0, r9
     d5c:	80 ff 02 64 	jarl	715e <___nedf2>, lp
     d60:	60 52       	cmp	0, r10
     d62:	aa 05       	bne	d66 <__svfprintf_r+0x640>
     d64:	00 da       	mov	0, r27
     d66:	9b 00       	zxb	r27
     d68:	60 da       	cmp	0, r27
     d6a:	ca 05       	bne	d72 <__svfprintf_r+0x64c>
     d6c:	01 52       	mov	1, r10
     d6e:	63 57 fd 00 	st.w	r10, 252[sp]
     d72:	2a 06 29 79 	mov	0x7929, r10
     d76:	00 00 
     d78:	2b 06 3a 79 	mov	0x793a, r11
     d7c:	00 00 
     d7e:	20 66 61 00 	movea	97, r0, r12
     d82:	ec e1       	cmp	r12, r28
     d84:	eb 57 34 53 	cmov	nz, r11, r10, r10
     d88:	63 57 1d 00 	st.w	r10, 28[sp]
     d8c:	23 d7 19 00 	ld.w	24[sp], r26
     d90:	5f d2       	add	-1, r26
     d92:	14 d8       	mov	r20, r27
     d94:	63 cf 3d 00 	st.w	r25, 60[sp]
     d98:	63 af 59 00 	st.w	r21, 88[sp]
     d9c:	63 a7 65 00 	st.w	r20, 100[sp]
     da0:	63 ef 69 00 	st.w	r29, 104[sp]
     da4:	16 a0       	mov	r22, r20
     da6:	1a c8       	mov	r26, r25
     da8:	1c a8       	mov	r28, r21
     daa:	17 b0       	mov	r23, r22
     dac:	18 b8       	mov	r24, r23
     dae:	23 e7 31 00 	ld.w	48[sp], r28
     db2:	23 ef 35 00 	ld.w	52[sp], r29
     db6:	a5 05       	br	dba <__svfprintf_r+0x694>
     db8:	1a d8       	mov	r26, r27
     dba:	1c 30       	mov	r28, r6
     dbc:	1d 38       	mov	r29, r7
     dbe:	00 42       	mov	0, r8
     dc0:	40 4e 30 40 	movhi	16432, r0, r9
     dc4:	80 ff 8a 5f 	jarl	6d4e <___muldf3>, lp
     dc8:	0a e8       	mov	r10, r29
     dca:	0b e0       	mov	r11, r28
     dcc:	0a 30       	mov	r10, r6
     dce:	0b 38       	mov	r11, r7
     dd0:	80 ff 8c 65 	jarl	735c <___fixdfsi>, lp
     dd4:	0a c0       	mov	r10, r24
     dd6:	0a 30       	mov	r10, r6
     dd8:	80 ff ee 64 	jarl	72c6 <___floatsidf>, lp
     ddc:	1d 30       	mov	r29, r6
     dde:	1c 38       	mov	r28, r7
     de0:	0a 40       	mov	r10, r8
     de2:	0b 48       	mov	r11, r9
     de4:	80 ff 0e 5f 	jarl	6cf2 <___subdf3>, lp
     de8:	0a e0       	mov	r10, r28
     dea:	0b e8       	mov	r11, r29
     dec:	23 67 1d 00 	ld.w	28[sp], r12
     df0:	d8 61       	add	r24, r12
     df2:	0c 67 00 00 	ld.b	0[r12], r12
     df6:	5b 67 00 00 	st.b	r12, 0[r27]
     dfa:	1b d6 01 00 	addi	1, r27, r26
     dfe:	63 cf 21 00 	st.w	r25, 32[sp]
     e02:	7f ca       	cmp	-1, r25
     e04:	92 25       	be	e46 <__svfprintf_r+0x720>
     e06:	5f ca       	add	-1, r25
     e08:	0a 30       	mov	r10, r6
     e0a:	0b 38       	mov	r11, r7
     e0c:	00 42       	mov	0, r8
     e0e:	00 4a       	mov	0, r9
     e10:	80 ff 4e 63 	jarl	715e <___nedf2>, lp
     e14:	60 52       	cmp	0, r10
     e16:	9a d5       	bne	db8 <__svfprintf_r+0x692>
     e18:	23 cf 3d 00 	ld.w	60[sp], r25
     e1c:	63 c7 5d 00 	st.w	r24, 92[sp]
     e20:	17 c0       	mov	r23, r24
     e22:	16 b8       	mov	r22, r23
     e24:	14 b0       	mov	r20, r22
     e26:	23 a7 65 00 	ld.w	100[sp], r20
     e2a:	63 e7 31 00 	st.w	r28, 48[sp]
     e2e:	15 e0       	mov	r21, r28
     e30:	23 af 59 00 	ld.w	88[sp], r21
     e34:	63 ef 35 00 	st.w	r29, 52[sp]
     e38:	23 ef 69 00 	ld.w	104[sp], r29
     e3c:	63 d7 59 00 	st.w	r26, 88[sp]
     e40:	63 df 3d 00 	st.w	r27, 60[sp]
     e44:	f5 15       	br	e72 <__svfprintf_r+0x74c>
     e46:	23 cf 3d 00 	ld.w	60[sp], r25
     e4a:	63 c7 5d 00 	st.w	r24, 92[sp]
     e4e:	17 c0       	mov	r23, r24
     e50:	16 b8       	mov	r22, r23
     e52:	14 b0       	mov	r20, r22
     e54:	23 a7 65 00 	ld.w	100[sp], r20
     e58:	63 57 31 00 	st.w	r10, 48[sp]
     e5c:	15 e0       	mov	r21, r28
     e5e:	23 af 59 00 	ld.w	88[sp], r21
     e62:	63 5f 35 00 	st.w	r11, 52[sp]
     e66:	23 ef 69 00 	ld.w	104[sp], r29
     e6a:	63 d7 59 00 	st.w	r26, 88[sp]
     e6e:	63 df 3d 00 	st.w	r27, 60[sp]
     e72:	23 37 31 00 	ld.w	48[sp], r6
     e76:	23 3f 35 00 	ld.w	52[sp], r7
     e7a:	00 42       	mov	0, r8
     e7c:	40 4e e0 3f 	movhi	16352, r0, r9
     e80:	80 ff 38 63 	jarl	71b8 <___gtdf2>, lp
     e84:	60 52       	cmp	0, r10
     e86:	ef 15       	bgt	eb2 <__svfprintf_r+0x78c>
     e88:	23 37 31 00 	ld.w	48[sp], r6
     e8c:	23 3f 35 00 	ld.w	52[sp], r7
     e90:	00 42       	mov	0, r8
     e92:	40 4e e0 3f 	movhi	16352, r0, r9
     e96:	80 ff 6e 62 	jarl	7104 <___eqdf2>, lp
     e9a:	60 52       	cmp	0, r10
     e9c:	ea 05       	bne	ea8 <__svfprintf_r+0x782>
     e9e:	23 5f 5d 00 	ld.w	92[sp], r11
     ea2:	cb 56 01 00 	andi	1, r11, r10
     ea6:	ea 05       	bne	eb2 <__svfprintf_r+0x78c>
     ea8:	23 67 21 00 	ld.w	32[sp], r12
     eac:	60 62       	cmp	0, r12
     eae:	de 2d       	bge	f08 <__svfprintf_r+0x7e2>
     eb0:	f5 3d       	br	f2e <__svfprintf_r+0x808>
     eb2:	23 6f 3d 00 	ld.w	60[sp], r13
     eb6:	63 6f 79 00 	st.w	r13, 120[sp]
     eba:	0d 57 00 00 	ld.b	0[r13], r10
     ebe:	23 77 1d 00 	ld.w	28[sp], r14
     ec2:	0e 5f 0f 00 	ld.b	15[r14], r11
     ec6:	ea 59       	cmp	r10, r11
     ec8:	aa 15       	bne	eec <__svfprintf_r+0x7c6>
     eca:	20 66 30 00 	movea	48, r0, r12
     ece:	0e 68       	mov	r14, r13
     ed0:	5b 67 00 00 	st.b	r12, 0[r27]
     ed4:	23 57 79 00 	ld.w	120[sp], r10
     ed8:	0a de ff ff 	addi	-1, r10, r27
     edc:	63 df 79 00 	st.w	r27, 120[sp]
     ee0:	0a 57 ff ff 	ld.b	-1[r10], r10
     ee4:	0d 5f 0f 00 	ld.b	15[r13], r11
     ee8:	ea 59       	cmp	r10, r11
     eea:	b2 f5       	be	ed0 <__svfprintf_r+0x7aa>
     eec:	20 5e 39 00 	movea	57, r0, r11
     ef0:	eb 51       	cmp	r11, r10
     ef2:	ea 05       	bne	efe <__svfprintf_r+0x7d8>
     ef4:	23 37 1d 00 	ld.w	28[sp], r6
     ef8:	06 57 0a 00 	ld.b	10[r6], r10
     efc:	b5 05       	br	f02 <__svfprintf_r+0x7dc>
     efe:	41 52       	add	1, r10
     f00:	aa 00       	sxb	r10
     f02:	5b 57 00 00 	st.b	r10, 0[r27]
     f06:	c5 15       	br	f2e <__svfprintf_r+0x808>
     f08:	23 5f 59 00 	ld.w	88[sp], r11
     f0c:	23 57 21 00 	ld.w	32[sp], r10
     f10:	ca 59       	add	r10, r11
     f12:	41 5a       	add	1, r11
     f14:	20 56 30 00 	movea	48, r0, r10
     f18:	5a 57 00 00 	st.b	r10, 0[r26]
     f1c:	41 d2       	add	1, r26
     f1e:	eb d1       	cmp	r11, r26
     f20:	ca fd       	bne	f18 <__svfprintf_r+0x7f2>
     f22:	23 d7 21 00 	ld.w	32[sp], r26
     f26:	41 d2       	add	1, r26
     f28:	23 5f 59 00 	ld.w	88[sp], r11
     f2c:	cb d1       	add	r11, r26
     f2e:	b4 d1       	sub	r20, r26
     f30:	63 d7 3d 00 	st.w	r26, 60[sp]
     f34:	80 07 0a 01 	jr	103e <__svfprintf_r+0x918>
     f38:	20 56 66 00 	movea	102, r0, r10
     f3c:	ea e1       	cmp	r10, r28
     f3e:	e2 07 f5 12 	be	2232 <__svfprintf_r+0x1b0c>
     f42:	20 56 46 00 	movea	70, r0, r10
     f46:	ea e1       	cmp	r10, r28
     f48:	e2 07 eb 12 	be	2232 <__svfprintf_r+0x1b0c>
     f4c:	20 56 65 00 	movea	101, r0, r10
     f50:	ea e1       	cmp	r10, r28
     f52:	d2 05       	be	f5c <__svfprintf_r+0x836>
     f54:	20 56 45 00 	movea	69, r0, r10
     f58:	ea e1       	cmp	r10, r28
     f5a:	fa 05       	bne	f68 <__svfprintf_r+0x842>
     f5c:	23 67 19 00 	ld.w	24[sp], r12
     f60:	41 62       	add	1, r12
     f62:	63 67 21 00 	st.w	r12, 32[sp]
     f66:	d5 05       	br	f70 <__svfprintf_r+0x84a>
     f68:	23 6f 19 00 	ld.w	24[sp], r13
     f6c:	63 6f 21 00 	st.w	r13, 32[sp]
     f70:	02 52       	mov	2, r10
     f72:	63 57 01 00 	st.w	r10, 0[sp]
     f76:	23 77 21 00 	ld.w	32[sp], r14
     f7a:	63 77 05 00 	st.w	r14, 4[sp]
     f7e:	03 56 fc 00 	addi	252, sp, r10
     f82:	63 57 09 00 	st.w	r10, 8[sp]
     f86:	20 36 74 00 	movea	116, r0, r6
     f8a:	c3 31       	add	sp, r6
     f8c:	63 37 0d 00 	st.w	r6, 12[sp]
     f90:	03 56 78 00 	addi	120, sp, r10
     f94:	63 57 11 00 	st.w	r10, 16[sp]
     f98:	17 30       	mov	r23, r6
     f9a:	1a 40       	mov	r26, r8
     f9c:	23 4f 1d 00 	ld.w	28[sp], r9
     fa0:	80 ff 84 14 	jarl	2424 <__dtoa_r>, lp
     fa4:	0a a0       	mov	r10, r20
     fa6:	20 56 67 00 	movea	103, r0, r10
     faa:	ea e1       	cmp	r10, r28
     fac:	d2 05       	be	fb6 <__svfprintf_r+0x890>
     fae:	20 56 47 00 	movea	71, r0, r10
     fb2:	ea e1       	cmp	r10, r28
     fb4:	ca 05       	bne	fbc <__svfprintf_r+0x896>
     fb6:	d6 56 01 00 	andi	1, r22, r10
     fba:	d2 3d       	be	1034 <__svfprintf_r+0x90e>
     fbc:	23 df 21 00 	ld.w	32[sp], r27
     fc0:	d4 d9       	add	r20, r27
     fc2:	20 56 66 00 	movea	102, r0, r10
     fc6:	ea e1       	cmp	r10, r28
     fc8:	d2 05       	be	fd2 <__svfprintf_r+0x8ac>
     fca:	20 56 46 00 	movea	70, r0, r10
     fce:	ea e1       	cmp	r10, r28
     fd0:	9a 1d       	bne	1002 <__svfprintf_r+0x8dc>
     fd2:	14 5f 00 00 	ld.b	0[r20], r11
     fd6:	20 56 30 00 	movea	48, r0, r10
     fda:	ea 59       	cmp	r10, r11
     fdc:	8a 15       	bne	ffc <__svfprintf_r+0x8d6>
     fde:	1a 30       	mov	r26, r6
     fe0:	23 3f 1d 00 	ld.w	28[sp], r7
     fe4:	00 42       	mov	0, r8
     fe6:	00 4a       	mov	0, r9
     fe8:	80 ff 76 61 	jarl	715e <___nedf2>, lp
     fec:	60 52       	cmp	0, r10
     fee:	f2 05       	be	ffc <__svfprintf_r+0x8d6>
     ff0:	01 52       	mov	1, r10
     ff2:	23 5f 21 00 	ld.w	32[sp], r11
     ff6:	ab 51       	sub	r11, r10
     ff8:	63 57 fd 00 	st.w	r10, 252[sp]
     ffc:	23 57 fd 00 	ld.w	252[sp], r10
    1000:	ca d9       	add	r10, r27
    1002:	1a 30       	mov	r26, r6
    1004:	23 3f 1d 00 	ld.w	28[sp], r7
    1008:	00 42       	mov	0, r8
    100a:	00 4a       	mov	0, r9
    100c:	80 ff f8 60 	jarl	7104 <___eqdf2>, lp
    1010:	60 52       	cmp	0, r10
    1012:	ca 05       	bne	101a <__svfprintf_r+0x8f4>
    1014:	63 df 79 00 	st.w	r27, 120[sp]
    1018:	e5 0d       	br	1034 <__svfprintf_r+0x90e>
    101a:	23 57 79 00 	ld.w	120[sp], r10
    101e:	fb 51       	cmp	r27, r10
    1020:	a9 0d       	bnl	1034 <__svfprintf_r+0x90e>
    1022:	20 5e 30 00 	movea	48, r0, r11
    1026:	4a 5f 00 00 	st.b	r11, 0[r10]
    102a:	41 52       	add	1, r10
    102c:	63 57 79 00 	st.w	r10, 120[sp]
    1030:	fb 51       	cmp	r27, r10
    1032:	aa fd       	bne	1026 <__svfprintf_r+0x900>
    1034:	23 57 79 00 	ld.w	120[sp], r10
    1038:	b4 51       	sub	r20, r10
    103a:	63 57 3d 00 	st.w	r10, 60[sp]
    103e:	20 56 67 00 	movea	103, r0, r10
    1042:	ea e1       	cmp	r10, r28
    1044:	d2 05       	be	104e <__svfprintf_r+0x928>
    1046:	20 56 47 00 	movea	71, r0, r10
    104a:	ea e1       	cmp	r10, r28
    104c:	da 0d       	bne	1066 <__svfprintf_r+0x940>
    104e:	23 57 fd 00 	ld.w	252[sp], r10
    1052:	7d 52       	cmp	-3, r10
    1054:	e6 05       	blt	1060 <__svfprintf_r+0x93a>
    1056:	23 67 19 00 	ld.w	24[sp], r12
    105a:	ea 61       	cmp	r10, r12
    105c:	ee 07 19 12 	bge	2274 <__svfprintf_r+0x1b4e>
    1060:	1c ae fe ff 	addi	-2, r28, r21
    1064:	e5 05       	br	1070 <__svfprintf_r+0x94a>
    1066:	20 56 46 00 	movea	70, r0, r10
    106a:	ea e1       	cmp	r10, r28
    106c:	e2 07 11 12 	be	227c <__svfprintf_r+0x1b56>
    1070:	20 56 65 00 	movea	101, r0, r10
    1074:	ea a9       	cmp	r10, r21
    1076:	9f 7d       	bgt	1168 <__svfprintf_r+0xa42>
    1078:	23 57 fd 00 	ld.w	252[sp], r10
    107c:	5f 52       	add	-1, r10
    107e:	63 57 fd 00 	st.w	r10, 252[sp]
    1082:	20 5e 61 00 	movea	97, r0, r11
    1086:	eb a9       	cmp	r11, r21
    1088:	92 0d       	be	109a <__svfprintf_r+0x974>
    108a:	20 5e 41 00 	movea	65, r0, r11
    108e:	eb a9       	cmp	r11, r21
    1090:	e2 5f 00 00 	setf	z, r11
    1094:	60 5a       	cmp	0, r11
    1096:	f2 05       	be	10a4 <__svfprintf_r+0x97e>
    1098:	a5 05       	br	109c <__svfprintf_r+0x976>
    109a:	01 5a       	mov	1, r11
    109c:	15 66 0f 00 	addi	15, r21, r12
    10a0:	ac 00       	sxb	r12
    10a2:	b5 05       	br	10a8 <__svfprintf_r+0x982>
    10a4:	15 60       	mov	r21, r12
    10a6:	ac 00       	sxb	r12
    10a8:	43 67 f5 00 	st.b	r12, 245[sp]
    10ac:	60 52       	cmp	0, r10
    10ae:	fe 05       	bge	10bc <__svfprintf_r+0x996>
    10b0:	80 51       	subr	r0, r10
    10b2:	20 66 2d 00 	movea	45, r0, r12
    10b6:	43 67 f6 00 	st.b	r12, 246[sp]
    10ba:	d5 05       	br	10c4 <__svfprintf_r+0x99e>
    10bc:	20 66 2b 00 	movea	43, r0, r12
    10c0:	43 67 f6 00 	st.b	r12, 246[sp]
    10c4:	69 52       	cmp	9, r10
    10c6:	87 2d       	ble	1116 <__svfprintf_r+0x9f0>
    10c8:	20 66 74 00 	movea	116, r0, r12
    10cc:	c3 61       	add	sp, r12
    10ce:	0a 5a       	mov	10, r11
    10d0:	a5 05       	br	10d4 <__svfprintf_r+0x9ae>
    10d2:	0e 60       	mov	r14, r12
    10d4:	0c 76 ff ff 	addi	-1, r12, r14
    10d8:	eb 57 c0 6a 	div	r11, r10, r13
    10dc:	0d 6e 30 00 	addi	48, r13, r13
    10e0:	4c 6f ff ff 	st.b	r13, -1[r12]
    10e4:	69 52       	cmp	9, r10
    10e6:	ef f5       	bgt	10d2 <__svfprintf_r+0x9ac>
    10e8:	0c 5e fe ff 	addi	-2, r12, r11
    10ec:	0a 56 30 00 	addi	48, r10, r10
    10f0:	4c 57 fe ff 	st.b	r10, -2[r12]
    10f4:	23 6f 15 00 	ld.w	20[sp], r13
    10f8:	ed 59       	cmp	r13, r11
    10fa:	89 25       	bnl	113a <__svfprintf_r+0xa14>
    10fc:	03 56 f7 00 	addi	247, sp, r10
    1100:	0b 67 00 00 	ld.b	0[r11], r12
    1104:	4a 67 00 00 	st.b	r12, 0[r10]
    1108:	41 52       	add	1, r10
    110a:	41 5a       	add	1, r11
    110c:	23 77 15 00 	ld.w	20[sp], r14
    1110:	ee 59       	cmp	r14, r11
    1112:	f1 f5       	bl	1100 <__svfprintf_r+0x9da>
    1114:	d5 15       	br	113e <__svfprintf_r+0xa18>
    1116:	60 5a       	cmp	0, r11
    1118:	8a 0d       	bne	1128 <__svfprintf_r+0xa02>
    111a:	20 5e 30 00 	movea	48, r0, r11
    111e:	43 5f f7 00 	st.b	r11, 247[sp]
    1122:	03 5e f8 00 	addi	248, sp, r11
    1126:	b5 05       	br	112c <__svfprintf_r+0xa06>
    1128:	03 5e f7 00 	addi	247, sp, r11
    112c:	0a 56 30 00 	addi	48, r10, r10
    1130:	4b 57 00 00 	st.b	r10, 0[r11]
    1134:	0b 56 01 00 	addi	1, r11, r10
    1138:	b5 05       	br	113e <__svfprintf_r+0xa18>
    113a:	03 56 f7 00 	addi	247, sp, r10
    113e:	03 5e f5 00 	addi	245, sp, r11
    1142:	ab 51       	sub	r11, r10
    1144:	63 57 51 00 	st.w	r10, 80[sp]
    1148:	23 37 3d 00 	ld.w	60[sp], r6
    114c:	c6 51       	add	r6, r10
    114e:	63 57 21 00 	st.w	r10, 32[sp]
    1152:	61 32       	cmp	1, r6
    1154:	cf 05       	bgt	115c <__svfprintf_r+0xa36>
    1156:	d6 56 01 00 	andi	1, r22, r10
    115a:	82 55       	be	11fa <__svfprintf_r+0xad4>
    115c:	23 57 21 00 	ld.w	32[sp], r10
    1160:	41 52       	add	1, r10
    1162:	63 57 21 00 	st.w	r10, 32[sp]
    1166:	a5 4d       	br	11fa <__svfprintf_r+0xad4>
    1168:	20 56 66 00 	movea	102, r0, r10
    116c:	ea a9       	cmp	r10, r21
    116e:	ca 25       	bne	11b6 <__svfprintf_r+0xa90>
    1170:	23 5f fd 00 	ld.w	252[sp], r11
    1174:	63 5f 21 00 	st.w	r11, 32[sp]
    1178:	60 5a       	cmp	0, r11
    117a:	97 15       	ble	119c <__svfprintf_r+0xa76>
    117c:	23 67 19 00 	ld.w	24[sp], r12
    1180:	60 62       	cmp	0, r12
    1182:	ca 05       	bne	118a <__svfprintf_r+0xa64>
    1184:	d6 56 01 00 	andi	1, r22, r10
    1188:	92 3d       	be	11fa <__svfprintf_r+0xad4>
    118a:	23 57 19 00 	ld.w	24[sp], r10
    118e:	41 52       	add	1, r10
    1190:	23 6f 21 00 	ld.w	32[sp], r13
    1194:	ca 69       	add	r10, r13
    1196:	63 6f 21 00 	st.w	r13, 32[sp]
    119a:	85 35       	br	11fa <__svfprintf_r+0xad4>
    119c:	23 77 19 00 	ld.w	24[sp], r14
    11a0:	60 72       	cmp	0, r14
    11a2:	ca 05       	bne	11aa <__svfprintf_r+0xa84>
    11a4:	d6 56 01 00 	andi	1, r22, r10
    11a8:	e2 25       	be	11f4 <__svfprintf_r+0xace>
    11aa:	23 37 19 00 	ld.w	24[sp], r6
    11ae:	42 32       	add	2, r6
    11b0:	63 37 21 00 	st.w	r6, 32[sp]
    11b4:	b5 25       	br	11fa <__svfprintf_r+0xad4>
    11b6:	23 57 fd 00 	ld.w	252[sp], r10
    11ba:	63 57 21 00 	st.w	r10, 32[sp]
    11be:	23 5f 3d 00 	ld.w	60[sp], r11
    11c2:	eb 51       	cmp	r11, r10
    11c4:	a6 0d       	blt	11d8 <__svfprintf_r+0xab2>
    11c6:	d6 56 01 00 	andi	1, r22, r10
    11ca:	82 1d       	be	11fa <__svfprintf_r+0xad4>
    11cc:	23 67 21 00 	ld.w	32[sp], r12
    11d0:	41 62       	add	1, r12
    11d2:	63 67 21 00 	st.w	r12, 32[sp]
    11d6:	a5 15       	br	11fa <__svfprintf_r+0xad4>
    11d8:	23 6f 21 00 	ld.w	32[sp], r13
    11dc:	60 6a       	cmp	0, r13
    11de:	cf 05       	bgt	11e6 <__svfprintf_r+0xac0>
    11e0:	02 52       	mov	2, r10
    11e2:	ad 51       	sub	r13, r10
    11e4:	a5 05       	br	11e8 <__svfprintf_r+0xac2>
    11e6:	01 52       	mov	1, r10
    11e8:	23 77 3d 00 	ld.w	60[sp], r14
    11ec:	ca 71       	add	r10, r14
    11ee:	63 77 21 00 	st.w	r14, 32[sp]
    11f2:	c5 05       	br	11fa <__svfprintf_r+0xad4>
    11f4:	01 32       	mov	1, r6
    11f6:	63 37 21 00 	st.w	r6, 32[sp]
    11fa:	23 57 61 00 	ld.w	96[sp], r10
    11fe:	60 52       	cmp	0, r10
    1200:	e2 07 7b 04 	be	167a <__svfprintf_r+0xf54>
    1204:	20 56 2d 00 	movea	45, r0, r10
    1208:	43 57 03 01 	st.b	r10, 259[sp]
    120c:	23 5f 21 00 	ld.w	32[sp], r11
    1210:	60 5a       	cmp	0, r11
    1212:	eb 07 3c 5b 	cmov	ge, r11, r0, r11
    1216:	63 5f 1d 00 	st.w	r11, 28[sp]
    121a:	63 07 19 00 	st.w	r0, 24[sp]
    121e:	80 07 96 04 	jr	16b4 <__svfprintf_r+0xf8e>
    1222:	43 77 03 01 	st.b	r14, 259[sp]
    1226:	d6 56 20 00 	andi	32, r22, r10
    122a:	a2 15       	be	124e <__svfprintf_r+0xb28>
    122c:	23 67 29 00 	ld.w	40[sp], r12
    1230:	2c 57 01 00 	ld.w	0[r12], r10
    1234:	23 6f 25 00 	ld.w	36[sp], r13
    1238:	6a 6f 01 00 	st.w	r13, 0[r10]
    123c:	0d 58       	mov	r13, r11
    123e:	bf 5a       	sar	31, r11
    1240:	6a 5f 05 00 	st.w	r11, 4[r10]
    1244:	44 62       	add	4, r12
    1246:	63 67 29 00 	st.w	r12, 40[sp]
    124a:	bf 07 78 f5 	jr	7c2 <__svfprintf_r+0x9c>
    124e:	d6 56 10 00 	andi	16, r22, r10
    1252:	e2 0d       	be	126e <__svfprintf_r+0xb48>
    1254:	23 77 29 00 	ld.w	40[sp], r14
    1258:	2e 57 01 00 	ld.w	0[r14], r10
    125c:	23 37 25 00 	ld.w	36[sp], r6
    1260:	6a 37 01 00 	st.w	r6, 0[r10]
    1264:	44 72       	add	4, r14
    1266:	63 77 29 00 	st.w	r14, 40[sp]
    126a:	bf 07 58 f5 	jr	7c2 <__svfprintf_r+0x9c>
    126e:	d6 56 40 00 	andi	64, r22, r10
    1272:	e2 0d       	be	128e <__svfprintf_r+0xb68>
    1274:	23 5f 29 00 	ld.w	40[sp], r11
    1278:	2b 57 01 00 	ld.w	0[r11], r10
    127c:	23 67 25 00 	ld.w	36[sp], r12
    1280:	6a 67 00 00 	st.h	r12, 0[r10]
    1284:	44 5a       	add	4, r11
    1286:	63 5f 29 00 	st.w	r11, 40[sp]
    128a:	bf 07 38 f5 	jr	7c2 <__svfprintf_r+0x9c>
    128e:	d6 b6 00 02 	andi	512, r22, r22
    1292:	e2 0d       	be	12ae <__svfprintf_r+0xb88>
    1294:	23 6f 29 00 	ld.w	40[sp], r13
    1298:	2d 57 01 00 	ld.w	0[r13], r10
    129c:	23 77 25 00 	ld.w	36[sp], r14
    12a0:	4a 77 00 00 	st.b	r14, 0[r10]
    12a4:	44 6a       	add	4, r13
    12a6:	63 6f 29 00 	st.w	r13, 40[sp]
    12aa:	bf 07 18 f5 	jr	7c2 <__svfprintf_r+0x9c>
    12ae:	23 37 29 00 	ld.w	40[sp], r6
    12b2:	26 57 01 00 	ld.w	0[r6], r10
    12b6:	23 5f 25 00 	ld.w	36[sp], r11
    12ba:	6a 5f 01 00 	st.w	r11, 0[r10]
    12be:	44 32       	add	4, r6
    12c0:	63 37 29 00 	st.w	r6, 40[sp]
    12c4:	bf 07 fe f4 	jr	7c2 <__svfprintf_r+0x9c>
    12c8:	96 b6 10 00 	ori	16, r22, r22
    12cc:	d6 56 20 00 	andi	32, r22, r10
    12d0:	d2 0d       	be	12ea <__svfprintf_r+0xbc4>
    12d2:	23 67 29 00 	ld.w	40[sp], r12
    12d6:	2c df 01 00 	ld.w	0[r12], r27
    12da:	2c e7 05 00 	ld.w	4[r12], r28
    12de:	48 62       	add	8, r12
    12e0:	63 67 29 00 	st.w	r12, 40[sp]
    12e4:	00 52       	mov	0, r10
    12e6:	80 07 40 02 	jr	1526 <__svfprintf_r+0xe00>
    12ea:	d6 56 10 00 	andi	16, r22, r10
    12ee:	c2 0d       	be	1306 <__svfprintf_r+0xbe0>
    12f0:	23 6f 29 00 	ld.w	40[sp], r13
    12f4:	2d df 01 00 	ld.w	0[r13], r27
    12f8:	00 e2       	mov	0, r28
    12fa:	44 6a       	add	4, r13
    12fc:	63 6f 29 00 	st.w	r13, 40[sp]
    1300:	00 52       	mov	0, r10
    1302:	80 07 24 02 	jr	1526 <__svfprintf_r+0xe00>
    1306:	d6 56 40 00 	andi	64, r22, r10
    130a:	c2 0d       	be	1322 <__svfprintf_r+0xbfc>
    130c:	23 77 29 00 	ld.w	40[sp], r14
    1310:	ee df 01 00 	ld.hu	0[r14], r27
    1314:	00 e2       	mov	0, r28
    1316:	44 72       	add	4, r14
    1318:	63 77 29 00 	st.w	r14, 40[sp]
    131c:	00 52       	mov	0, r10
    131e:	80 07 08 02 	jr	1526 <__svfprintf_r+0xe00>
    1322:	d6 56 00 02 	andi	512, r22, r10
    1326:	c2 0d       	be	133e <__svfprintf_r+0xc18>
    1328:	23 37 29 00 	ld.w	40[sp], r6
    132c:	86 df 01 00 	ld.bu	0[r6], r27
    1330:	00 e2       	mov	0, r28
    1332:	44 32       	add	4, r6
    1334:	63 37 29 00 	st.w	r6, 40[sp]
    1338:	00 52       	mov	0, r10
    133a:	80 07 ec 01 	jr	1526 <__svfprintf_r+0xe00>
    133e:	23 57 29 00 	ld.w	40[sp], r10
    1342:	2a df 01 00 	ld.w	0[r10], r27
    1346:	00 e2       	mov	0, r28
    1348:	44 52       	add	4, r10
    134a:	63 57 29 00 	st.w	r10, 40[sp]
    134e:	00 52       	mov	0, r10
    1350:	80 07 d6 01 	jr	1526 <__svfprintf_r+0xe00>
    1354:	23 5f 29 00 	ld.w	40[sp], r11
    1358:	2b df 01 00 	ld.w	0[r11], r27
    135c:	00 e2       	mov	0, r28
    135e:	96 b6 02 00 	ori	2, r22, r22
    1362:	20 56 30 00 	movea	48, r0, r10
    1366:	43 57 7e 00 	st.b	r10, 126[sp]
    136a:	20 56 78 00 	movea	120, r0, r10
    136e:	43 57 7f 00 	st.b	r10, 127[sp]
    1372:	44 5a       	add	4, r11
    1374:	63 5f 29 00 	st.w	r11, 40[sp]
    1378:	2c 06 29 79 	mov	0x7929, r12
    137c:	00 00 
    137e:	63 67 55 00 	st.w	r12, 84[sp]
    1382:	02 52       	mov	2, r10
    1384:	20 ae 78 00 	movea	120, r0, r21
    1388:	80 07 9e 01 	jr	1526 <__svfprintf_r+0xe00>
    138c:	23 e7 19 00 	ld.w	24[sp], r28
    1390:	23 57 29 00 	ld.w	40[sp], r10
    1394:	43 07 03 01 	st.b	r0, 259[sp]
    1398:	0a 68       	mov	r10, r13
    139a:	44 6a       	add	4, r13
    139c:	63 6f 29 00 	st.w	r13, 40[sp]
    13a0:	2a a7 01 00 	ld.w	0[r10], r20
    13a4:	60 a2       	cmp	0, r20
    13a6:	ba 0d       	bne	13bc <__svfprintf_r+0xc96>
    13a8:	66 e2       	cmp	6, r28
    13aa:	e6 e7 16 73 	cmov	h, 6, r28, r14
    13ae:	63 77 21 00 	st.w	r14, 32[sp]
    13b2:	34 06 65 79 	mov	0x7965, r20
    13b6:	00 00 
    13b8:	80 07 cc 0e 	jr	2284 <__svfprintf_r+0x1b5e>
    13bc:	60 e2       	cmp	0, r28
    13be:	b6 15       	blt	13e4 <__svfprintf_r+0xcbe>
    13c0:	14 30       	mov	r20, r6
    13c2:	00 3a       	mov	0, r7
    13c4:	1c 40       	mov	r28, r8
    13c6:	80 ff 16 2c 	jarl	3fdc <_memchr>, lp
    13ca:	60 52       	cmp	0, r10
    13cc:	e2 07 b5 02 	be	1680 <__svfprintf_r+0xf5a>
    13d0:	b4 51       	sub	r20, r10
    13d2:	63 57 21 00 	st.w	r10, 32[sp]
    13d6:	fc 51       	cmp	r28, r10
    13d8:	ef 07 b7 02 	bgt	168e <__svfprintf_r+0xf68>
    13dc:	63 07 19 00 	st.w	r0, 24[sp]
    13e0:	80 07 ba 02 	jr	169a <__svfprintf_r+0xf74>
    13e4:	14 30       	mov	r20, r6
    13e6:	80 ff 72 37 	jarl	4b58 <_strlen>, lp
    13ea:	63 57 21 00 	st.w	r10, 32[sp]
    13ee:	63 07 19 00 	st.w	r0, 24[sp]
    13f2:	80 07 a8 02 	jr	169a <__svfprintf_r+0xf74>
    13f6:	96 b6 10 00 	ori	16, r22, r22
    13fa:	d6 56 20 00 	andi	32, r22, r10
    13fe:	d2 0d       	be	1418 <__svfprintf_r+0xcf2>
    1400:	23 37 29 00 	ld.w	40[sp], r6
    1404:	26 df 01 00 	ld.w	0[r6], r27
    1408:	26 e7 05 00 	ld.w	4[r6], r28
    140c:	48 32       	add	8, r6
    140e:	63 37 29 00 	st.w	r6, 40[sp]
    1412:	01 52       	mov	1, r10
    1414:	80 07 12 01 	jr	1526 <__svfprintf_r+0xe00>
    1418:	d6 56 10 00 	andi	16, r22, r10
    141c:	c2 0d       	be	1434 <__svfprintf_r+0xd0e>
    141e:	23 57 29 00 	ld.w	40[sp], r10
    1422:	2a df 01 00 	ld.w	0[r10], r27
    1426:	00 e2       	mov	0, r28
    1428:	44 52       	add	4, r10
    142a:	63 57 29 00 	st.w	r10, 40[sp]
    142e:	01 52       	mov	1, r10
    1430:	80 07 f6 00 	jr	1526 <__svfprintf_r+0xe00>
    1434:	d6 56 40 00 	andi	64, r22, r10
    1438:	b2 0d       	be	144e <__svfprintf_r+0xd28>
    143a:	23 5f 29 00 	ld.w	40[sp], r11
    143e:	eb df 01 00 	ld.hu	0[r11], r27
    1442:	00 e2       	mov	0, r28
    1444:	44 5a       	add	4, r11
    1446:	63 5f 29 00 	st.w	r11, 40[sp]
    144a:	01 52       	mov	1, r10
    144c:	d5 6d       	br	1526 <__svfprintf_r+0xe00>
    144e:	d6 56 00 02 	andi	512, r22, r10
    1452:	b2 0d       	be	1468 <__svfprintf_r+0xd42>
    1454:	23 67 29 00 	ld.w	40[sp], r12
    1458:	8c df 01 00 	ld.bu	0[r12], r27
    145c:	00 e2       	mov	0, r28
    145e:	44 62       	add	4, r12
    1460:	63 67 29 00 	st.w	r12, 40[sp]
    1464:	01 52       	mov	1, r10
    1466:	85 65       	br	1526 <__svfprintf_r+0xe00>
    1468:	23 6f 29 00 	ld.w	40[sp], r13
    146c:	2d df 01 00 	ld.w	0[r13], r27
    1470:	00 e2       	mov	0, r28
    1472:	44 6a       	add	4, r13
    1474:	63 6f 29 00 	st.w	r13, 40[sp]
    1478:	01 52       	mov	1, r10
    147a:	e5 55       	br	1526 <__svfprintf_r+0xe00>
    147c:	43 77 03 01 	st.b	r14, 259[sp]
    1480:	16 50       	mov	r22, r10
    1482:	15 60       	mov	r21, r12
    1484:	2e 06 29 79 	mov	0x7929, r14
    1488:	00 00 
    148a:	63 77 55 00 	st.w	r14, 84[sp]
    148e:	ca 5e 20 00 	andi	32, r10, r11
    1492:	b2 0d       	be	14a8 <__svfprintf_r+0xd82>
    1494:	23 37 29 00 	ld.w	40[sp], r6
    1498:	26 df 01 00 	ld.w	0[r6], r27
    149c:	26 e7 05 00 	ld.w	4[r6], r28
    14a0:	48 32       	add	8, r6
    14a2:	63 37 29 00 	st.w	r6, 40[sp]
    14a6:	d5 2d       	br	1500 <__svfprintf_r+0xdda>
    14a8:	ca 5e 10 00 	andi	16, r10, r11
    14ac:	a2 0d       	be	14c0 <__svfprintf_r+0xd9a>
    14ae:	23 5f 29 00 	ld.w	40[sp], r11
    14b2:	2b df 01 00 	ld.w	0[r11], r27
    14b6:	00 e2       	mov	0, r28
    14b8:	44 5a       	add	4, r11
    14ba:	63 5f 29 00 	st.w	r11, 40[sp]
    14be:	95 25       	br	1500 <__svfprintf_r+0xdda>
    14c0:	ca 5e 40 00 	andi	64, r10, r11
    14c4:	a2 0d       	be	14d8 <__svfprintf_r+0xdb2>
    14c6:	23 6f 29 00 	ld.w	40[sp], r13
    14ca:	ed df 01 00 	ld.hu	0[r13], r27
    14ce:	00 e2       	mov	0, r28
    14d0:	44 6a       	add	4, r13
    14d2:	63 6f 29 00 	st.w	r13, 40[sp]
    14d6:	d5 15       	br	1500 <__svfprintf_r+0xdda>
    14d8:	ca 5e 00 02 	andi	512, r10, r11
    14dc:	a2 0d       	be	14f0 <__svfprintf_r+0xdca>
    14de:	23 77 29 00 	ld.w	40[sp], r14
    14e2:	8e df 01 00 	ld.bu	0[r14], r27
    14e6:	00 e2       	mov	0, r28
    14e8:	44 72       	add	4, r14
    14ea:	63 77 29 00 	st.w	r14, 40[sp]
    14ee:	95 0d       	br	1500 <__svfprintf_r+0xdda>
    14f0:	23 37 29 00 	ld.w	40[sp], r6
    14f4:	26 df 01 00 	ld.w	0[r6], r27
    14f8:	00 e2       	mov	0, r28
    14fa:	44 32       	add	4, r6
    14fc:	63 37 29 00 	st.w	r6, 40[sp]
    1500:	ca 5e 01 00 	andi	1, r10, r11
    1504:	e2 0d       	be	1520 <__svfprintf_r+0xdfa>
    1506:	1b 58       	mov	r27, r11
    1508:	1c 59       	or	r28, r11
    150a:	d2 0d       	be	1524 <__svfprintf_r+0xdfe>
    150c:	20 5e 30 00 	movea	48, r0, r11
    1510:	43 5f 7e 00 	st.b	r11, 126[sp]
    1514:	43 67 7f 00 	st.b	r12, 127[sp]
    1518:	8a b6 02 00 	ori	2, r10, r22
    151c:	02 52       	mov	2, r10
    151e:	c5 05       	br	1526 <__svfprintf_r+0xe00>
    1520:	02 52       	mov	2, r10
    1522:	a5 05       	br	1526 <__svfprintf_r+0xe00>
    1524:	02 52       	mov	2, r10
    1526:	43 07 03 01 	st.b	r0, 259[sp]
    152a:	23 5f 19 00 	ld.w	24[sp], r11
    152e:	60 5a       	cmp	0, r11
    1530:	c6 05       	blt	1538 <__svfprintf_r+0xe12>
    1532:	20 66 7f ff 	movea	-129, r0, r12
    1536:	4c b1       	and	r12, r22
    1538:	1b 60       	mov	r27, r12
    153a:	1c 61       	or	r28, r12
    153c:	ba 05       	bne	1542 <__svfprintf_r+0xe1c>
    153e:	60 5a       	cmp	0, r11
    1540:	d2 75       	be	162a <__svfprintf_r+0xf04>
    1542:	61 52       	cmp	1, r10
    1544:	d2 05       	be	154e <__svfprintf_r+0xe28>
    1546:	c1 0d       	bl	155e <__svfprintf_r+0xe38>
    1548:	62 52       	cmp	2, r10
    154a:	fa 65       	bne	1618 <__svfprintf_r+0xef2>
    154c:	e5 4d       	br	15e8 <__svfprintf_r+0xec2>
    154e:	60 e2       	cmp	0, r28
    1550:	aa 2d       	bne	15a4 <__svfprintf_r+0xe7e>
    1552:	ba 05       	bne	1558 <__svfprintf_r+0xe32>
    1554:	69 da       	cmp	9, r27
    1556:	fb 25       	bh	15a4 <__svfprintf_r+0xe7e>
    1558:	03 d6 a8 00 	addi	168, sp, r26
    155c:	f5 3d       	br	15da <__svfprintf_r+0xeb4>
    155e:	03 5e a8 00 	addi	168, sp, r11
    1562:	a5 05       	br	1566 <__svfprintf_r+0xe40>
    1564:	14 58       	mov	r20, r11
    1566:	0b a6 ff ff 	addi	-1, r11, r20
    156a:	db 6e 07 00 	andi	7, r27, r13
    156e:	0d 6e 30 00 	addi	48, r13, r13
    1572:	4b 6f ff ff 	st.b	r13, -1[r11]
    1576:	1c 60       	mov	r28, r12
    1578:	dd 62       	shl	29, r12
    157a:	1b 50       	mov	r27, r10
    157c:	83 52       	shr	3, r10
    157e:	0c 51       	or	r12, r10
    1580:	1c 60       	mov	r28, r12
    1582:	83 62       	shr	3, r12
    1584:	0a d8       	mov	r10, r27
    1586:	0c e0       	mov	r12, r28
    1588:	0c 51       	or	r12, r10
    158a:	da ed       	bne	1564 <__svfprintf_r+0xe3e>
    158c:	d6 56 01 00 	andi	1, r22, r10
    1590:	f2 5d       	be	164e <__svfprintf_r+0xf28>
    1592:	20 56 30 00 	movea	48, r0, r10
    1596:	ea 69       	cmp	r10, r13
    1598:	b2 5d       	be	164e <__svfprintf_r+0xf28>
    159a:	0b a6 fe ff 	addi	-2, r11, r20
    159e:	4b 57 fe ff 	st.b	r10, -2[r11]
    15a2:	e5 55       	br	164e <__svfprintf_r+0xf28>
    15a4:	03 d6 a8 00 	addi	168, sp, r26
    15a8:	0a a2       	mov	10, r20
    15aa:	5f d2       	add	-1, r26
    15ac:	1b 30       	mov	r27, r6
    15ae:	1c 38       	mov	r28, r7
    15b0:	14 40       	mov	r20, r8
    15b2:	00 4a       	mov	0, r9
    15b4:	80 ff 18 50 	jarl	65cc <___umoddi3>, lp
    15b8:	0a 56 30 00 	addi	48, r10, r10
    15bc:	5a 57 00 00 	st.b	r10, 0[r26]
    15c0:	1b 30       	mov	r27, r6
    15c2:	1c 38       	mov	r28, r7
    15c4:	14 40       	mov	r20, r8
    15c6:	00 4a       	mov	0, r9
    15c8:	80 ff 1a 4c 	jarl	61e2 <___udivdi3>, lp
    15cc:	0a d8       	mov	r10, r27
    15ce:	0b e0       	mov	r11, r28
    15d0:	60 5a       	cmp	0, r11
    15d2:	ca ed       	bne	15aa <__svfprintf_r+0xe84>
    15d4:	ba 05       	bne	15da <__svfprintf_r+0xeb4>
    15d6:	69 52       	cmp	9, r10
    15d8:	9b ed       	bh	15aa <__svfprintf_r+0xe84>
    15da:	1a a6 ff ff 	addi	-1, r26, r20
    15de:	1b de 30 00 	addi	48, r27, r27
    15e2:	5a df ff ff 	st.b	r27, -1[r26]
    15e6:	c5 35       	br	164e <__svfprintf_r+0xf28>
    15e8:	03 a6 a8 00 	addi	168, sp, r20
    15ec:	23 67 55 00 	ld.w	84[sp], r12
    15f0:	5f a2       	add	-1, r20
    15f2:	db 56 0f 00 	andi	15, r27, r10
    15f6:	cc 51       	add	r12, r10
    15f8:	0a 57 00 00 	ld.b	0[r10], r10
    15fc:	54 57 00 00 	st.b	r10, 0[r20]
    1600:	1c 58       	mov	r28, r11
    1602:	dc 5a       	shl	28, r11
    1604:	1b 50       	mov	r27, r10
    1606:	84 52       	shr	4, r10
    1608:	0b 51       	or	r11, r10
    160a:	1c 58       	mov	r28, r11
    160c:	84 5a       	shr	4, r11
    160e:	0a d8       	mov	r10, r27
    1610:	0b e0       	mov	r11, r28
    1612:	0b 51       	or	r11, r10
    1614:	ea ed       	bne	15f0 <__svfprintf_r+0xeca>
    1616:	c5 1d       	br	164e <__svfprintf_r+0xf28>
    1618:	34 06 4b 79 	mov	0x794b, r20
    161c:	00 00 
    161e:	14 30       	mov	r20, r6
    1620:	80 ff 38 35 	jarl	4b58 <_strlen>, lp
    1624:	63 57 21 00 	st.w	r10, 32[sp]
    1628:	95 3d       	br	169a <__svfprintf_r+0xf74>
    162a:	60 52       	cmp	0, r10
    162c:	ca 0d       	bne	1644 <__svfprintf_r+0xf1e>
    162e:	d6 56 01 00 	andi	1, r22, r10
    1632:	c2 0d       	be	164a <__svfprintf_r+0xf24>
    1634:	20 56 30 00 	movea	48, r0, r10
    1638:	43 57 a7 00 	st.b	r10, 167[sp]
    163c:	20 a6 a7 00 	movea	167, r0, r20
    1640:	c3 a1       	add	sp, r20
    1642:	e5 05       	br	164e <__svfprintf_r+0xf28>
    1644:	03 a6 a8 00 	addi	168, sp, r20
    1648:	b5 05       	br	164e <__svfprintf_r+0xf28>
    164a:	03 a6 a8 00 	addi	168, sp, r20
    164e:	03 56 a8 00 	addi	168, sp, r10
    1652:	b4 51       	sub	r20, r10
    1654:	63 57 21 00 	st.w	r10, 32[sp]
    1658:	95 25       	br	169a <__svfprintf_r+0xf74>
    165a:	43 77 03 01 	st.b	r14, 259[sp]
    165e:	60 aa       	cmp	0, r21
    1660:	e2 07 7d 0b 	be	21dc <__svfprintf_r+0x1ab6>
    1664:	43 af 80 00 	st.b	r21, 128[sp]
    1668:	43 07 03 01 	st.b	r0, 259[sp]
    166c:	01 32       	mov	1, r6
    166e:	63 37 21 00 	st.w	r6, 32[sp]
    1672:	03 a6 80 00 	addi	128, sp, r20
    1676:	80 07 0e 0c 	jr	2284 <__svfprintf_r+0x1b5e>
    167a:	63 07 19 00 	st.w	r0, 24[sp]
    167e:	e5 0d       	br	169a <__svfprintf_r+0xf74>
    1680:	23 57 19 00 	ld.w	24[sp], r10
    1684:	63 57 21 00 	st.w	r10, 32[sp]
    1688:	63 07 19 00 	st.w	r0, 24[sp]
    168c:	f5 05       	br	169a <__svfprintf_r+0xf74>
    168e:	23 5f 19 00 	ld.w	24[sp], r11
    1692:	63 5f 21 00 	st.w	r11, 32[sp]
    1696:	63 07 19 00 	st.w	r0, 24[sp]
    169a:	23 67 21 00 	ld.w	32[sp], r12
    169e:	23 6f 19 00 	ld.w	24[sp], r13
    16a2:	ed 61       	cmp	r13, r12
    16a4:	ec 6f 3c 63 	cmov	ge, r12, r13, r12
    16a8:	63 67 1d 00 	st.w	r12, 28[sp]
    16ac:	03 57 03 01 	ld.b	259[sp], r10
    16b0:	60 52       	cmp	0, r10
    16b2:	e2 05       	be	16be <__svfprintf_r+0xf98>
    16b4:	23 77 1d 00 	ld.w	28[sp], r14
    16b8:	41 72       	add	1, r14
    16ba:	63 77 1d 00 	st.w	r14, 28[sp]
    16be:	d6 36 02 00 	andi	2, r22, r6
    16c2:	63 37 31 00 	st.w	r6, 48[sp]
    16c6:	e2 05       	be	16d2 <__svfprintf_r+0xfac>
    16c8:	23 57 1d 00 	ld.w	28[sp], r10
    16cc:	42 52       	add	2, r10
    16ce:	63 57 1d 00 	st.w	r10, 28[sp]
    16d2:	d6 5e 84 00 	andi	132, r22, r11
    16d6:	63 5f 35 00 	st.w	r11, 52[sp]
    16da:	ba 55       	bne	1780 <__svfprintf_r+0x105a>
    16dc:	23 e7 2d 00 	ld.w	44[sp], r28
    16e0:	23 67 1d 00 	ld.w	28[sp], r12
    16e4:	ac e1       	sub	r12, r28
    16e6:	60 e2       	cmp	0, r28
    16e8:	c7 4d       	ble	1780 <__svfprintf_r+0x105a>
    16ea:	20 56 10 00 	movea	16, r0, r10
    16ee:	ea e1       	cmp	r10, r28
    16f0:	f7 25       	ble	173e <__svfprintf_r+0x1018>
    16f2:	3a 06 6e 79 	mov	0x796e, r26
    16f6:	00 00 
    16f8:	0a d8       	mov	r10, r27
    16fa:	7d d7 01 00 	st.w	r26, 0[r29]
    16fe:	7d df 05 00 	st.w	r27, 4[r29]
    1702:	23 57 f1 00 	ld.w	240[sp], r10
    1706:	0a 56 10 00 	addi	16, r10, r10
    170a:	63 57 f1 00 	st.w	r10, 240[sp]
    170e:	23 57 ed 00 	ld.w	236[sp], r10
    1712:	41 52       	add	1, r10
    1714:	63 57 ed 00 	st.w	r10, 236[sp]
    1718:	67 52       	cmp	7, r10
    171a:	bf 05       	bgt	1720 <__svfprintf_r+0xffa>
    171c:	48 ea       	add	8, r29
    171e:	d5 0d       	br	1738 <__svfprintf_r+0x1012>
    1720:	17 30       	mov	r23, r6
    1722:	18 38       	mov	r24, r7
    1724:	20 46 e8 00 	movea	232, r0, r8
    1728:	c3 41       	add	sp, r8
    172a:	80 ff 50 34 	jarl	4b7a <___ssprint_r>, lp
    172e:	60 52       	cmp	0, r10
    1730:	ea 07 c9 0a 	bne	21f8 <__svfprintf_r+0x1ad2>
    1734:	03 ee a8 00 	addi	168, sp, r29
    1738:	50 e2       	add	-16, r28
    173a:	fb e1       	cmp	r27, r28
    173c:	ff dd       	bgt	16fa <__svfprintf_r+0xfd4>
    173e:	2a 06 6e 79 	mov	0x796e, r10
    1742:	00 00 
    1744:	7d 57 01 00 	st.w	r10, 0[r29]
    1748:	7d e7 05 00 	st.w	r28, 4[r29]
    174c:	23 57 f1 00 	ld.w	240[sp], r10
    1750:	ca e1       	add	r10, r28
    1752:	63 e7 f1 00 	st.w	r28, 240[sp]
    1756:	23 57 ed 00 	ld.w	236[sp], r10
    175a:	41 52       	add	1, r10
    175c:	63 57 ed 00 	st.w	r10, 236[sp]
    1760:	67 52       	cmp	7, r10
    1762:	bf 05       	bgt	1768 <__svfprintf_r+0x1042>
    1764:	48 ea       	add	8, r29
    1766:	d5 0d       	br	1780 <__svfprintf_r+0x105a>
    1768:	17 30       	mov	r23, r6
    176a:	18 38       	mov	r24, r7
    176c:	20 46 e8 00 	movea	232, r0, r8
    1770:	c3 41       	add	sp, r8
    1772:	80 ff 08 34 	jarl	4b7a <___ssprint_r>, lp
    1776:	60 52       	cmp	0, r10
    1778:	ea 07 81 0a 	bne	21f8 <__svfprintf_r+0x1ad2>
    177c:	03 ee a8 00 	addi	168, sp, r29
    1780:	03 57 03 01 	ld.b	259[sp], r10
    1784:	60 52       	cmp	0, r10
    1786:	a2 25       	be	17ca <__svfprintf_r+0x10a4>
    1788:	03 56 03 01 	addi	259, sp, r10
    178c:	7d 57 01 00 	st.w	r10, 0[r29]
    1790:	01 52       	mov	1, r10
    1792:	7d 57 05 00 	st.w	r10, 4[r29]
    1796:	23 57 f1 00 	ld.w	240[sp], r10
    179a:	41 52       	add	1, r10
    179c:	63 57 f1 00 	st.w	r10, 240[sp]
    17a0:	23 57 ed 00 	ld.w	236[sp], r10
    17a4:	41 52       	add	1, r10
    17a6:	63 57 ed 00 	st.w	r10, 236[sp]
    17aa:	67 52       	cmp	7, r10
    17ac:	bf 05       	bgt	17b2 <__svfprintf_r+0x108c>
    17ae:	48 ea       	add	8, r29
    17b0:	d5 0d       	br	17ca <__svfprintf_r+0x10a4>
    17b2:	17 30       	mov	r23, r6
    17b4:	18 38       	mov	r24, r7
    17b6:	20 46 e8 00 	movea	232, r0, r8
    17ba:	c3 41       	add	sp, r8
    17bc:	80 ff be 33 	jarl	4b7a <___ssprint_r>, lp
    17c0:	60 52       	cmp	0, r10
    17c2:	ea 07 37 0a 	bne	21f8 <__svfprintf_r+0x1ad2>
    17c6:	03 ee a8 00 	addi	168, sp, r29
    17ca:	23 6f 31 00 	ld.w	48[sp], r13
    17ce:	60 6a       	cmp	0, r13
    17d0:	a2 25       	be	1814 <__svfprintf_r+0x10ee>
    17d2:	03 56 7e 00 	addi	126, sp, r10
    17d6:	7d 57 01 00 	st.w	r10, 0[r29]
    17da:	02 52       	mov	2, r10
    17dc:	7d 57 05 00 	st.w	r10, 4[r29]
    17e0:	23 57 f1 00 	ld.w	240[sp], r10
    17e4:	42 52       	add	2, r10
    17e6:	63 57 f1 00 	st.w	r10, 240[sp]
    17ea:	23 57 ed 00 	ld.w	236[sp], r10
    17ee:	41 52       	add	1, r10
    17f0:	63 57 ed 00 	st.w	r10, 236[sp]
    17f4:	67 52       	cmp	7, r10
    17f6:	bf 05       	bgt	17fc <__svfprintf_r+0x10d6>
    17f8:	48 ea       	add	8, r29
    17fa:	d5 0d       	br	1814 <__svfprintf_r+0x10ee>
    17fc:	17 30       	mov	r23, r6
    17fe:	18 38       	mov	r24, r7
    1800:	20 46 e8 00 	movea	232, r0, r8
    1804:	c3 41       	add	sp, r8
    1806:	80 ff 74 33 	jarl	4b7a <___ssprint_r>, lp
    180a:	60 52       	cmp	0, r10
    180c:	ea 07 ed 09 	bne	21f8 <__svfprintf_r+0x1ad2>
    1810:	03 ee a8 00 	addi	168, sp, r29
    1814:	20 56 80 00 	movea	128, r0, r10
    1818:	23 77 35 00 	ld.w	52[sp], r14
    181c:	ea 71       	cmp	r10, r14
    181e:	ba 55       	bne	18c4 <__svfprintf_r+0x119e>
    1820:	23 e7 2d 00 	ld.w	44[sp], r28
    1824:	23 37 1d 00 	ld.w	28[sp], r6
    1828:	a6 e1       	sub	r6, r28
    182a:	60 e2       	cmp	0, r28
    182c:	c7 4d       	ble	18c4 <__svfprintf_r+0x119e>
    182e:	20 56 10 00 	movea	16, r0, r10
    1832:	ea e1       	cmp	r10, r28
    1834:	f7 25       	ble	1882 <__svfprintf_r+0x115c>
    1836:	3a 06 7e 79 	mov	0x797e, r26
    183a:	00 00 
    183c:	0a d8       	mov	r10, r27
    183e:	7d d7 01 00 	st.w	r26, 0[r29]
    1842:	7d df 05 00 	st.w	r27, 4[r29]
    1846:	23 57 f1 00 	ld.w	240[sp], r10
    184a:	0a 56 10 00 	addi	16, r10, r10
    184e:	63 57 f1 00 	st.w	r10, 240[sp]
    1852:	23 57 ed 00 	ld.w	236[sp], r10
    1856:	41 52       	add	1, r10
    1858:	63 57 ed 00 	st.w	r10, 236[sp]
    185c:	67 52       	cmp	7, r10
    185e:	bf 05       	bgt	1864 <__svfprintf_r+0x113e>
    1860:	48 ea       	add	8, r29
    1862:	d5 0d       	br	187c <__svfprintf_r+0x1156>
    1864:	17 30       	mov	r23, r6
    1866:	18 38       	mov	r24, r7
    1868:	20 46 e8 00 	movea	232, r0, r8
    186c:	c3 41       	add	sp, r8
    186e:	80 ff 0c 33 	jarl	4b7a <___ssprint_r>, lp
    1872:	60 52       	cmp	0, r10
    1874:	ea 07 85 09 	bne	21f8 <__svfprintf_r+0x1ad2>
    1878:	03 ee a8 00 	addi	168, sp, r29
    187c:	50 e2       	add	-16, r28
    187e:	fb e1       	cmp	r27, r28
    1880:	ff dd       	bgt	183e <__svfprintf_r+0x1118>
    1882:	2a 06 7e 79 	mov	0x797e, r10
    1886:	00 00 
    1888:	7d 57 01 00 	st.w	r10, 0[r29]
    188c:	7d e7 05 00 	st.w	r28, 4[r29]
    1890:	23 57 f1 00 	ld.w	240[sp], r10
    1894:	ca e1       	add	r10, r28
    1896:	63 e7 f1 00 	st.w	r28, 240[sp]
    189a:	23 57 ed 00 	ld.w	236[sp], r10
    189e:	41 52       	add	1, r10
    18a0:	63 57 ed 00 	st.w	r10, 236[sp]
    18a4:	67 52       	cmp	7, r10
    18a6:	bf 05       	bgt	18ac <__svfprintf_r+0x1186>
    18a8:	48 ea       	add	8, r29
    18aa:	d5 0d       	br	18c4 <__svfprintf_r+0x119e>
    18ac:	17 30       	mov	r23, r6
    18ae:	18 38       	mov	r24, r7
    18b0:	20 46 e8 00 	movea	232, r0, r8
    18b4:	c3 41       	add	sp, r8
    18b6:	80 ff c4 32 	jarl	4b7a <___ssprint_r>, lp
    18ba:	60 52       	cmp	0, r10
    18bc:	ea 07 3d 09 	bne	21f8 <__svfprintf_r+0x1ad2>
    18c0:	03 ee a8 00 	addi	168, sp, r29
    18c4:	23 e7 19 00 	ld.w	24[sp], r28
    18c8:	23 57 21 00 	ld.w	32[sp], r10
    18cc:	aa e1       	sub	r10, r28
    18ce:	60 e2       	cmp	0, r28
    18d0:	c7 4d       	ble	1968 <__svfprintf_r+0x1242>
    18d2:	20 56 10 00 	movea	16, r0, r10
    18d6:	ea e1       	cmp	r10, r28
    18d8:	f7 25       	ble	1926 <__svfprintf_r+0x1200>
    18da:	3a 06 7e 79 	mov	0x797e, r26
    18de:	00 00 
    18e0:	0a d8       	mov	r10, r27
    18e2:	7d d7 01 00 	st.w	r26, 0[r29]
    18e6:	7d df 05 00 	st.w	r27, 4[r29]
    18ea:	23 57 f1 00 	ld.w	240[sp], r10
    18ee:	0a 56 10 00 	addi	16, r10, r10
    18f2:	63 57 f1 00 	st.w	r10, 240[sp]
    18f6:	23 57 ed 00 	ld.w	236[sp], r10
    18fa:	41 52       	add	1, r10
    18fc:	63 57 ed 00 	st.w	r10, 236[sp]
    1900:	67 52       	cmp	7, r10
    1902:	bf 05       	bgt	1908 <__svfprintf_r+0x11e2>
    1904:	48 ea       	add	8, r29
    1906:	d5 0d       	br	1920 <__svfprintf_r+0x11fa>
    1908:	17 30       	mov	r23, r6
    190a:	18 38       	mov	r24, r7
    190c:	20 46 e8 00 	movea	232, r0, r8
    1910:	c3 41       	add	sp, r8
    1912:	80 ff 68 32 	jarl	4b7a <___ssprint_r>, lp
    1916:	60 52       	cmp	0, r10
    1918:	ea 07 e1 08 	bne	21f8 <__svfprintf_r+0x1ad2>
    191c:	03 ee a8 00 	addi	168, sp, r29
    1920:	50 e2       	add	-16, r28
    1922:	fb e1       	cmp	r27, r28
    1924:	ff dd       	bgt	18e2 <__svfprintf_r+0x11bc>
    1926:	2a 06 7e 79 	mov	0x797e, r10
    192a:	00 00 
    192c:	7d 57 01 00 	st.w	r10, 0[r29]
    1930:	7d e7 05 00 	st.w	r28, 4[r29]
    1934:	23 57 f1 00 	ld.w	240[sp], r10
    1938:	ca e1       	add	r10, r28
    193a:	63 e7 f1 00 	st.w	r28, 240[sp]
    193e:	23 57 ed 00 	ld.w	236[sp], r10
    1942:	41 52       	add	1, r10
    1944:	63 57 ed 00 	st.w	r10, 236[sp]
    1948:	67 52       	cmp	7, r10
    194a:	bf 05       	bgt	1950 <__svfprintf_r+0x122a>
    194c:	48 ea       	add	8, r29
    194e:	d5 0d       	br	1968 <__svfprintf_r+0x1242>
    1950:	17 30       	mov	r23, r6
    1952:	18 38       	mov	r24, r7
    1954:	20 46 e8 00 	movea	232, r0, r8
    1958:	c3 41       	add	sp, r8
    195a:	80 ff 20 32 	jarl	4b7a <___ssprint_r>, lp
    195e:	60 52       	cmp	0, r10
    1960:	ea 07 99 08 	bne	21f8 <__svfprintf_r+0x1ad2>
    1964:	03 ee a8 00 	addi	168, sp, r29
    1968:	d6 56 00 01 	andi	256, r22, r10
    196c:	ca 25       	bne	19b4 <__svfprintf_r+0x128e>
    196e:	7d a7 01 00 	st.w	r20, 0[r29]
    1972:	23 5f 21 00 	ld.w	32[sp], r11
    1976:	7d 5f 05 00 	st.w	r11, 4[r29]
    197a:	23 57 f1 00 	ld.w	240[sp], r10
    197e:	cb 51       	add	r11, r10
    1980:	63 57 f1 00 	st.w	r10, 240[sp]
    1984:	23 57 ed 00 	ld.w	236[sp], r10
    1988:	41 52       	add	1, r10
    198a:	63 57 ed 00 	st.w	r10, 236[sp]
    198e:	67 52       	cmp	7, r10
    1990:	cf 05       	bgt	1998 <__svfprintf_r+0x1272>
    1992:	48 ea       	add	8, r29
    1994:	80 07 50 07 	jr	20e4 <__svfprintf_r+0x19be>
    1998:	17 30       	mov	r23, r6
    199a:	18 38       	mov	r24, r7
    199c:	20 46 e8 00 	movea	232, r0, r8
    19a0:	c3 41       	add	sp, r8
    19a2:	80 ff d8 31 	jarl	4b7a <___ssprint_r>, lp
    19a6:	60 52       	cmp	0, r10
    19a8:	ea 07 51 08 	bne	21f8 <__svfprintf_r+0x1ad2>
    19ac:	03 ee a8 00 	addi	168, sp, r29
    19b0:	80 07 34 07 	jr	20e4 <__svfprintf_r+0x19be>
    19b4:	20 56 65 00 	movea	101, r0, r10
    19b8:	ea a9       	cmp	r10, r21
    19ba:	e7 07 13 05 	ble	1ecc <__svfprintf_r+0x17a6>
    19be:	23 37 49 00 	ld.w	72[sp], r6
    19c2:	23 3f 45 00 	ld.w	68[sp], r7
    19c6:	00 42       	mov	0, r8
    19c8:	00 4a       	mov	0, r9
    19ca:	80 ff 3a 57 	jarl	7104 <___eqdf2>, lp
    19ce:	60 52       	cmp	0, r10
    19d0:	ea 07 4f 01 	bne	1b1e <__svfprintf_r+0x13f8>
    19d4:	2a 06 6c 79 	mov	0x796c, r10
    19d8:	00 00 
    19da:	7d 57 01 00 	st.w	r10, 0[r29]
    19de:	01 52       	mov	1, r10
    19e0:	7d 57 05 00 	st.w	r10, 4[r29]
    19e4:	23 57 f1 00 	ld.w	240[sp], r10
    19e8:	41 52       	add	1, r10
    19ea:	63 57 f1 00 	st.w	r10, 240[sp]
    19ee:	23 57 ed 00 	ld.w	236[sp], r10
    19f2:	41 52       	add	1, r10
    19f4:	63 57 ed 00 	st.w	r10, 236[sp]
    19f8:	67 52       	cmp	7, r10
    19fa:	bf 05       	bgt	1a00 <__svfprintf_r+0x12da>
    19fc:	48 ea       	add	8, r29
    19fe:	d5 0d       	br	1a18 <__svfprintf_r+0x12f2>
    1a00:	17 30       	mov	r23, r6
    1a02:	18 38       	mov	r24, r7
    1a04:	20 46 e8 00 	movea	232, r0, r8
    1a08:	c3 41       	add	sp, r8
    1a0a:	80 ff 70 31 	jarl	4b7a <___ssprint_r>, lp
    1a0e:	60 52       	cmp	0, r10
    1a10:	ea 07 e9 07 	bne	21f8 <__svfprintf_r+0x1ad2>
    1a14:	03 ee a8 00 	addi	168, sp, r29
    1a18:	23 57 fd 00 	ld.w	252[sp], r10
    1a1c:	23 67 3d 00 	ld.w	60[sp], r12
    1a20:	ea 61       	cmp	r10, r12
    1a22:	df 05       	bgt	1a2c <__svfprintf_r+0x1306>
    1a24:	d6 56 01 00 	andi	1, r22, r10
    1a28:	e2 07 bd 06 	be	20e4 <__svfprintf_r+0x19be>
    1a2c:	23 6f 41 00 	ld.w	64[sp], r13
    1a30:	7d 6f 01 00 	st.w	r13, 0[r29]
    1a34:	23 77 4d 00 	ld.w	76[sp], r14
    1a38:	7d 77 05 00 	st.w	r14, 4[r29]
    1a3c:	23 57 f1 00 	ld.w	240[sp], r10
    1a40:	ce 51       	add	r14, r10
    1a42:	63 57 f1 00 	st.w	r10, 240[sp]
    1a46:	23 57 ed 00 	ld.w	236[sp], r10
    1a4a:	41 52       	add	1, r10
    1a4c:	63 57 ed 00 	st.w	r10, 236[sp]
    1a50:	67 52       	cmp	7, r10
    1a52:	bf 05       	bgt	1a58 <__svfprintf_r+0x1332>
    1a54:	48 ea       	add	8, r29
    1a56:	d5 0d       	br	1a70 <__svfprintf_r+0x134a>
    1a58:	17 30       	mov	r23, r6
    1a5a:	18 38       	mov	r24, r7
    1a5c:	20 46 e8 00 	movea	232, r0, r8
    1a60:	c3 41       	add	sp, r8
    1a62:	80 ff 18 31 	jarl	4b7a <___ssprint_r>, lp
    1a66:	60 52       	cmp	0, r10
    1a68:	ea 07 91 07 	bne	21f8 <__svfprintf_r+0x1ad2>
    1a6c:	03 ee a8 00 	addi	168, sp, r29
    1a70:	23 e7 3d 00 	ld.w	60[sp], r28
    1a74:	5f e2       	add	-1, r28
    1a76:	60 e2       	cmp	0, r28
    1a78:	e7 07 6d 06 	ble	20e4 <__svfprintf_r+0x19be>
    1a7c:	20 56 10 00 	movea	16, r0, r10
    1a80:	ea e1       	cmp	r10, r28
    1a82:	a7 2d       	ble	1ad6 <__svfprintf_r+0x13b0>
    1a84:	3a 06 7e 79 	mov	0x797e, r26
    1a88:	00 00 
    1a8a:	0a d8       	mov	r10, r27
    1a8c:	35 06 7a 4b 	mov	0x4b7a, r21
    1a90:	00 00 
    1a92:	7d d7 01 00 	st.w	r26, 0[r29]
    1a96:	7d df 05 00 	st.w	r27, 4[r29]
    1a9a:	23 57 f1 00 	ld.w	240[sp], r10
    1a9e:	0a 56 10 00 	addi	16, r10, r10
    1aa2:	63 57 f1 00 	st.w	r10, 240[sp]
    1aa6:	23 57 ed 00 	ld.w	236[sp], r10
    1aaa:	41 52       	add	1, r10
    1aac:	63 57 ed 00 	st.w	r10, 236[sp]
    1ab0:	67 52       	cmp	7, r10
    1ab2:	bf 05       	bgt	1ab8 <__svfprintf_r+0x1392>
    1ab4:	48 ea       	add	8, r29
    1ab6:	d5 0d       	br	1ad0 <__svfprintf_r+0x13aa>
    1ab8:	17 30       	mov	r23, r6
    1aba:	18 38       	mov	r24, r7
    1abc:	20 46 e8 00 	movea	232, r0, r8
    1ac0:	c3 41       	add	sp, r8
    1ac2:	f5 c7 60 f9 	jarl	[r21], lp
    1ac6:	60 52       	cmp	0, r10
    1ac8:	ea 07 31 07 	bne	21f8 <__svfprintf_r+0x1ad2>
    1acc:	03 ee a8 00 	addi	168, sp, r29
    1ad0:	50 e2       	add	-16, r28
    1ad2:	fb e1       	cmp	r27, r28
    1ad4:	ff dd       	bgt	1a92 <__svfprintf_r+0x136c>
    1ad6:	2a 06 7e 79 	mov	0x797e, r10
    1ada:	00 00 
    1adc:	7d 57 01 00 	st.w	r10, 0[r29]
    1ae0:	7d e7 05 00 	st.w	r28, 4[r29]
    1ae4:	23 57 f1 00 	ld.w	240[sp], r10
    1ae8:	ca e1       	add	r10, r28
    1aea:	63 e7 f1 00 	st.w	r28, 240[sp]
    1aee:	23 57 ed 00 	ld.w	236[sp], r10
    1af2:	41 52       	add	1, r10
    1af4:	63 57 ed 00 	st.w	r10, 236[sp]
    1af8:	67 52       	cmp	7, r10
    1afa:	cf 05       	bgt	1b02 <__svfprintf_r+0x13dc>
    1afc:	48 ea       	add	8, r29
    1afe:	80 07 e6 05 	jr	20e4 <__svfprintf_r+0x19be>
    1b02:	17 30       	mov	r23, r6
    1b04:	18 38       	mov	r24, r7
    1b06:	20 46 e8 00 	movea	232, r0, r8
    1b0a:	c3 41       	add	sp, r8
    1b0c:	80 ff 6e 30 	jarl	4b7a <___ssprint_r>, lp
    1b10:	60 52       	cmp	0, r10
    1b12:	ea 07 e7 06 	bne	21f8 <__svfprintf_r+0x1ad2>
    1b16:	03 ee a8 00 	addi	168, sp, r29
    1b1a:	80 07 ca 05 	jr	20e4 <__svfprintf_r+0x19be>
    1b1e:	23 57 fd 00 	ld.w	252[sp], r10
    1b22:	60 52       	cmp	0, r10
    1b24:	ef 07 91 01 	bgt	1cb4 <__svfprintf_r+0x158e>
    1b28:	2a 06 6c 79 	mov	0x796c, r10
    1b2c:	00 00 
    1b2e:	7d 57 01 00 	st.w	r10, 0[r29]
    1b32:	01 52       	mov	1, r10
    1b34:	7d 57 05 00 	st.w	r10, 4[r29]
    1b38:	23 57 f1 00 	ld.w	240[sp], r10
    1b3c:	41 52       	add	1, r10
    1b3e:	63 57 f1 00 	st.w	r10, 240[sp]
    1b42:	23 57 ed 00 	ld.w	236[sp], r10
    1b46:	41 52       	add	1, r10
    1b48:	63 57 ed 00 	st.w	r10, 236[sp]
    1b4c:	67 52       	cmp	7, r10
    1b4e:	bf 05       	bgt	1b54 <__svfprintf_r+0x142e>
    1b50:	48 ea       	add	8, r29
    1b52:	d5 0d       	br	1b6c <__svfprintf_r+0x1446>
    1b54:	17 30       	mov	r23, r6
    1b56:	18 38       	mov	r24, r7
    1b58:	20 46 e8 00 	movea	232, r0, r8
    1b5c:	c3 41       	add	sp, r8
    1b5e:	80 ff 1c 30 	jarl	4b7a <___ssprint_r>, lp
    1b62:	60 52       	cmp	0, r10
    1b64:	ea 07 95 06 	bne	21f8 <__svfprintf_r+0x1ad2>
    1b68:	03 ee a8 00 	addi	168, sp, r29
    1b6c:	23 57 fd 00 	ld.w	252[sp], r10
    1b70:	60 52       	cmp	0, r10
    1b72:	9a 0d       	bne	1b84 <__svfprintf_r+0x145e>
    1b74:	23 37 3d 00 	ld.w	60[sp], r6
    1b78:	60 32       	cmp	0, r6
    1b7a:	da 05       	bne	1b84 <__svfprintf_r+0x145e>
    1b7c:	d6 56 01 00 	andi	1, r22, r10
    1b80:	e2 07 65 05 	be	20e4 <__svfprintf_r+0x19be>
    1b84:	23 57 41 00 	ld.w	64[sp], r10
    1b88:	7d 57 01 00 	st.w	r10, 0[r29]
    1b8c:	23 5f 4d 00 	ld.w	76[sp], r11
    1b90:	7d 5f 05 00 	st.w	r11, 4[r29]
    1b94:	23 57 f1 00 	ld.w	240[sp], r10
    1b98:	cb 51       	add	r11, r10
    1b9a:	63 57 f1 00 	st.w	r10, 240[sp]
    1b9e:	23 57 ed 00 	ld.w	236[sp], r10
    1ba2:	41 52       	add	1, r10
    1ba4:	63 57 ed 00 	st.w	r10, 236[sp]
    1ba8:	67 52       	cmp	7, r10
    1baa:	bf 05       	bgt	1bb0 <__svfprintf_r+0x148a>
    1bac:	48 ea       	add	8, r29
    1bae:	d5 0d       	br	1bc8 <__svfprintf_r+0x14a2>
    1bb0:	17 30       	mov	r23, r6
    1bb2:	18 38       	mov	r24, r7
    1bb4:	20 46 e8 00 	movea	232, r0, r8
    1bb8:	c3 41       	add	sp, r8
    1bba:	80 ff c0 2f 	jarl	4b7a <___ssprint_r>, lp
    1bbe:	60 52       	cmp	0, r10
    1bc0:	ea 07 39 06 	bne	21f8 <__svfprintf_r+0x1ad2>
    1bc4:	03 ee a8 00 	addi	168, sp, r29
    1bc8:	23 e7 fd 00 	ld.w	252[sp], r28
    1bcc:	80 e1       	subr	r0, r28
    1bce:	60 e2       	cmp	0, r28
    1bd0:	f7 4d       	ble	1c6e <__svfprintf_r+0x1548>
    1bd2:	20 56 10 00 	movea	16, r0, r10
    1bd6:	ea e1       	cmp	r10, r28
    1bd8:	a7 2d       	ble	1c2c <__svfprintf_r+0x1506>
    1bda:	3a 06 7e 79 	mov	0x797e, r26
    1bde:	00 00 
    1be0:	0a d8       	mov	r10, r27
    1be2:	35 06 7a 4b 	mov	0x4b7a, r21
    1be6:	00 00 
    1be8:	7d d7 01 00 	st.w	r26, 0[r29]
    1bec:	7d df 05 00 	st.w	r27, 4[r29]
    1bf0:	23 57 f1 00 	ld.w	240[sp], r10
    1bf4:	0a 56 10 00 	addi	16, r10, r10
    1bf8:	63 57 f1 00 	st.w	r10, 240[sp]
    1bfc:	23 57 ed 00 	ld.w	236[sp], r10
    1c00:	41 52       	add	1, r10
    1c02:	63 57 ed 00 	st.w	r10, 236[sp]
    1c06:	67 52       	cmp	7, r10
    1c08:	bf 05       	bgt	1c0e <__svfprintf_r+0x14e8>
    1c0a:	48 ea       	add	8, r29
    1c0c:	d5 0d       	br	1c26 <__svfprintf_r+0x1500>
    1c0e:	17 30       	mov	r23, r6
    1c10:	18 38       	mov	r24, r7
    1c12:	20 46 e8 00 	movea	232, r0, r8
    1c16:	c3 41       	add	sp, r8
    1c18:	f5 c7 60 f9 	jarl	[r21], lp
    1c1c:	60 52       	cmp	0, r10
    1c1e:	ea 07 db 05 	bne	21f8 <__svfprintf_r+0x1ad2>
    1c22:	03 ee a8 00 	addi	168, sp, r29
    1c26:	50 e2       	add	-16, r28
    1c28:	fb e1       	cmp	r27, r28
    1c2a:	ff dd       	bgt	1be8 <__svfprintf_r+0x14c2>
    1c2c:	2a 06 7e 79 	mov	0x797e, r10
    1c30:	00 00 
    1c32:	7d 57 01 00 	st.w	r10, 0[r29]
    1c36:	7d e7 05 00 	st.w	r28, 4[r29]
    1c3a:	23 57 f1 00 	ld.w	240[sp], r10
    1c3e:	ca e1       	add	r10, r28
    1c40:	63 e7 f1 00 	st.w	r28, 240[sp]
    1c44:	23 57 ed 00 	ld.w	236[sp], r10
    1c48:	41 52       	add	1, r10
    1c4a:	63 57 ed 00 	st.w	r10, 236[sp]
    1c4e:	67 52       	cmp	7, r10
    1c50:	bf 05       	bgt	1c56 <__svfprintf_r+0x1530>
    1c52:	48 ea       	add	8, r29
    1c54:	d5 0d       	br	1c6e <__svfprintf_r+0x1548>
    1c56:	17 30       	mov	r23, r6
    1c58:	18 38       	mov	r24, r7
    1c5a:	20 46 e8 00 	movea	232, r0, r8
    1c5e:	c3 41       	add	sp, r8
    1c60:	80 ff 1a 2f 	jarl	4b7a <___ssprint_r>, lp
    1c64:	60 52       	cmp	0, r10
    1c66:	ea 07 93 05 	bne	21f8 <__svfprintf_r+0x1ad2>
    1c6a:	03 ee a8 00 	addi	168, sp, r29
    1c6e:	7d a7 01 00 	st.w	r20, 0[r29]
    1c72:	23 67 3d 00 	ld.w	60[sp], r12
    1c76:	7d 67 05 00 	st.w	r12, 4[r29]
    1c7a:	23 57 f1 00 	ld.w	240[sp], r10
    1c7e:	cc 51       	add	r12, r10
    1c80:	63 57 f1 00 	st.w	r10, 240[sp]
    1c84:	23 57 ed 00 	ld.w	236[sp], r10
    1c88:	41 52       	add	1, r10
    1c8a:	63 57 ed 00 	st.w	r10, 236[sp]
    1c8e:	67 52       	cmp	7, r10
    1c90:	cf 05       	bgt	1c98 <__svfprintf_r+0x1572>
    1c92:	48 ea       	add	8, r29
    1c94:	80 07 50 04 	jr	20e4 <__svfprintf_r+0x19be>
    1c98:	17 30       	mov	r23, r6
    1c9a:	18 38       	mov	r24, r7
    1c9c:	20 46 e8 00 	movea	232, r0, r8
    1ca0:	c3 41       	add	sp, r8
    1ca2:	80 ff d8 2e 	jarl	4b7a <___ssprint_r>, lp
    1ca6:	60 52       	cmp	0, r10
    1ca8:	ea 07 51 05 	bne	21f8 <__svfprintf_r+0x1ad2>
    1cac:	03 ee a8 00 	addi	168, sp, r29
    1cb0:	80 07 34 04 	jr	20e4 <__svfprintf_r+0x19be>
    1cb4:	23 6f 3d 00 	ld.w	60[sp], r13
    1cb8:	ea 69       	cmp	r10, r13
    1cba:	ef 07 41 01 	bgt	1dfa <__svfprintf_r+0x16d4>
    1cbe:	7d a7 01 00 	st.w	r20, 0[r29]
    1cc2:	7d 6f 05 00 	st.w	r13, 4[r29]
    1cc6:	23 57 f1 00 	ld.w	240[sp], r10
    1cca:	cd 51       	add	r13, r10
    1ccc:	63 57 f1 00 	st.w	r10, 240[sp]
    1cd0:	23 57 ed 00 	ld.w	236[sp], r10
    1cd4:	41 52       	add	1, r10
    1cd6:	63 57 ed 00 	st.w	r10, 236[sp]
    1cda:	67 52       	cmp	7, r10
    1cdc:	bf 05       	bgt	1ce2 <__svfprintf_r+0x15bc>
    1cde:	48 ea       	add	8, r29
    1ce0:	d5 0d       	br	1cfa <__svfprintf_r+0x15d4>
    1ce2:	17 30       	mov	r23, r6
    1ce4:	18 38       	mov	r24, r7
    1ce6:	20 46 e8 00 	movea	232, r0, r8
    1cea:	c3 41       	add	sp, r8
    1cec:	80 ff 8e 2e 	jarl	4b7a <___ssprint_r>, lp
    1cf0:	60 52       	cmp	0, r10
    1cf2:	ea 07 07 05 	bne	21f8 <__svfprintf_r+0x1ad2>
    1cf6:	03 ee a8 00 	addi	168, sp, r29
    1cfa:	23 e7 fd 00 	ld.w	252[sp], r28
    1cfe:	23 77 3d 00 	ld.w	60[sp], r14
    1d02:	ae e1       	sub	r14, r28
    1d04:	60 e2       	cmp	0, r28
    1d06:	f7 4d       	ble	1da4 <__svfprintf_r+0x167e>
    1d08:	20 56 10 00 	movea	16, r0, r10
    1d0c:	ea e1       	cmp	r10, r28
    1d0e:	a7 2d       	ble	1d62 <__svfprintf_r+0x163c>
    1d10:	3a 06 7e 79 	mov	0x797e, r26
    1d14:	00 00 
    1d16:	0a d8       	mov	r10, r27
    1d18:	35 06 7a 4b 	mov	0x4b7a, r21
    1d1c:	00 00 
    1d1e:	7d d7 01 00 	st.w	r26, 0[r29]
    1d22:	7d df 05 00 	st.w	r27, 4[r29]
    1d26:	23 57 f1 00 	ld.w	240[sp], r10
    1d2a:	0a 56 10 00 	addi	16, r10, r10
    1d2e:	63 57 f1 00 	st.w	r10, 240[sp]
    1d32:	23 57 ed 00 	ld.w	236[sp], r10
    1d36:	41 52       	add	1, r10
    1d38:	63 57 ed 00 	st.w	r10, 236[sp]
    1d3c:	67 52       	cmp	7, r10
    1d3e:	bf 05       	bgt	1d44 <__svfprintf_r+0x161e>
    1d40:	48 ea       	add	8, r29
    1d42:	d5 0d       	br	1d5c <__svfprintf_r+0x1636>
    1d44:	17 30       	mov	r23, r6
    1d46:	18 38       	mov	r24, r7
    1d48:	20 46 e8 00 	movea	232, r0, r8
    1d4c:	c3 41       	add	sp, r8
    1d4e:	f5 c7 60 f9 	jarl	[r21], lp
    1d52:	60 52       	cmp	0, r10
    1d54:	ea 07 a5 04 	bne	21f8 <__svfprintf_r+0x1ad2>
    1d58:	03 ee a8 00 	addi	168, sp, r29
    1d5c:	50 e2       	add	-16, r28
    1d5e:	fb e1       	cmp	r27, r28
    1d60:	ff dd       	bgt	1d1e <__svfprintf_r+0x15f8>
    1d62:	2a 06 7e 79 	mov	0x797e, r10
    1d66:	00 00 
    1d68:	7d 57 01 00 	st.w	r10, 0[r29]
    1d6c:	7d e7 05 00 	st.w	r28, 4[r29]
    1d70:	23 57 f1 00 	ld.w	240[sp], r10
    1d74:	ca e1       	add	r10, r28
    1d76:	63 e7 f1 00 	st.w	r28, 240[sp]
    1d7a:	23 57 ed 00 	ld.w	236[sp], r10
    1d7e:	41 52       	add	1, r10
    1d80:	63 57 ed 00 	st.w	r10, 236[sp]
    1d84:	67 52       	cmp	7, r10
    1d86:	bf 05       	bgt	1d8c <__svfprintf_r+0x1666>
    1d88:	48 ea       	add	8, r29
    1d8a:	d5 0d       	br	1da4 <__svfprintf_r+0x167e>
    1d8c:	17 30       	mov	r23, r6
    1d8e:	18 38       	mov	r24, r7
    1d90:	20 46 e8 00 	movea	232, r0, r8
    1d94:	c3 41       	add	sp, r8
    1d96:	80 ff e4 2d 	jarl	4b7a <___ssprint_r>, lp
    1d9a:	60 52       	cmp	0, r10
    1d9c:	ea 07 5d 04 	bne	21f8 <__svfprintf_r+0x1ad2>
    1da0:	03 ee a8 00 	addi	168, sp, r29
    1da4:	d6 56 01 00 	andi	1, r22, r10
    1da8:	e2 07 3d 03 	be	20e4 <__svfprintf_r+0x19be>
    1dac:	23 37 41 00 	ld.w	64[sp], r6
    1db0:	7d 37 01 00 	st.w	r6, 0[r29]
    1db4:	23 57 4d 00 	ld.w	76[sp], r10
    1db8:	7d 57 05 00 	st.w	r10, 4[r29]
    1dbc:	23 57 f1 00 	ld.w	240[sp], r10
    1dc0:	23 5f 4d 00 	ld.w	76[sp], r11
    1dc4:	cb 51       	add	r11, r10
    1dc6:	63 57 f1 00 	st.w	r10, 240[sp]
    1dca:	23 57 ed 00 	ld.w	236[sp], r10
    1dce:	41 52       	add	1, r10
    1dd0:	63 57 ed 00 	st.w	r10, 236[sp]
    1dd4:	67 52       	cmp	7, r10
    1dd6:	cf 05       	bgt	1dde <__svfprintf_r+0x16b8>
    1dd8:	48 ea       	add	8, r29
    1dda:	80 07 0a 03 	jr	20e4 <__svfprintf_r+0x19be>
    1dde:	17 30       	mov	r23, r6
    1de0:	18 38       	mov	r24, r7
    1de2:	20 46 e8 00 	movea	232, r0, r8
    1de6:	c3 41       	add	sp, r8
    1de8:	80 ff 92 2d 	jarl	4b7a <___ssprint_r>, lp
    1dec:	60 52       	cmp	0, r10
    1dee:	ea 07 0b 04 	bne	21f8 <__svfprintf_r+0x1ad2>
    1df2:	03 ee a8 00 	addi	168, sp, r29
    1df6:	80 07 ee 02 	jr	20e4 <__svfprintf_r+0x19be>
    1dfa:	7d a7 01 00 	st.w	r20, 0[r29]
    1dfe:	7d 57 05 00 	st.w	r10, 4[r29]
    1e02:	23 5f f1 00 	ld.w	240[sp], r11
    1e06:	cb 51       	add	r11, r10
    1e08:	63 57 f1 00 	st.w	r10, 240[sp]
    1e0c:	23 57 ed 00 	ld.w	236[sp], r10
    1e10:	41 52       	add	1, r10
    1e12:	63 57 ed 00 	st.w	r10, 236[sp]
    1e16:	67 52       	cmp	7, r10
    1e18:	bf 05       	bgt	1e1e <__svfprintf_r+0x16f8>
    1e1a:	48 ea       	add	8, r29
    1e1c:	d5 0d       	br	1e36 <__svfprintf_r+0x1710>
    1e1e:	17 30       	mov	r23, r6
    1e20:	18 38       	mov	r24, r7
    1e22:	20 46 e8 00 	movea	232, r0, r8
    1e26:	c3 41       	add	sp, r8
    1e28:	80 ff 52 2d 	jarl	4b7a <___ssprint_r>, lp
    1e2c:	60 52       	cmp	0, r10
    1e2e:	ea 07 cb 03 	bne	21f8 <__svfprintf_r+0x1ad2>
    1e32:	03 ee a8 00 	addi	168, sp, r29
    1e36:	23 e7 fd 00 	ld.w	252[sp], r28
    1e3a:	23 67 41 00 	ld.w	64[sp], r12
    1e3e:	7d 67 01 00 	st.w	r12, 0[r29]
    1e42:	23 6f 4d 00 	ld.w	76[sp], r13
    1e46:	7d 6f 05 00 	st.w	r13, 4[r29]
    1e4a:	23 57 f1 00 	ld.w	240[sp], r10
    1e4e:	cd 51       	add	r13, r10
    1e50:	63 57 f1 00 	st.w	r10, 240[sp]
    1e54:	23 57 ed 00 	ld.w	236[sp], r10
    1e58:	41 52       	add	1, r10
    1e5a:	63 57 ed 00 	st.w	r10, 236[sp]
    1e5e:	67 52       	cmp	7, r10
    1e60:	bf 05       	bgt	1e66 <__svfprintf_r+0x1740>
    1e62:	48 ea       	add	8, r29
    1e64:	d5 0d       	br	1e7e <__svfprintf_r+0x1758>
    1e66:	17 30       	mov	r23, r6
    1e68:	18 38       	mov	r24, r7
    1e6a:	20 46 e8 00 	movea	232, r0, r8
    1e6e:	c3 41       	add	sp, r8
    1e70:	80 ff 0a 2d 	jarl	4b7a <___ssprint_r>, lp
    1e74:	60 52       	cmp	0, r10
    1e76:	ea 07 83 03 	bne	21f8 <__svfprintf_r+0x1ad2>
    1e7a:	03 ee a8 00 	addi	168, sp, r29
    1e7e:	d4 e1       	add	r20, r28
    1e80:	7d e7 01 00 	st.w	r28, 0[r29]
    1e84:	23 57 fd 00 	ld.w	252[sp], r10
    1e88:	23 77 3d 00 	ld.w	60[sp], r14
    1e8c:	8e 51       	subr	r14, r10
    1e8e:	7d 57 05 00 	st.w	r10, 4[r29]
    1e92:	23 5f f1 00 	ld.w	240[sp], r11
    1e96:	cb 51       	add	r11, r10
    1e98:	63 57 f1 00 	st.w	r10, 240[sp]
    1e9c:	23 57 ed 00 	ld.w	236[sp], r10
    1ea0:	41 52       	add	1, r10
    1ea2:	63 57 ed 00 	st.w	r10, 236[sp]
    1ea6:	67 52       	cmp	7, r10
    1ea8:	cf 05       	bgt	1eb0 <__svfprintf_r+0x178a>
    1eaa:	48 ea       	add	8, r29
    1eac:	80 07 38 02 	jr	20e4 <__svfprintf_r+0x19be>
    1eb0:	17 30       	mov	r23, r6
    1eb2:	18 38       	mov	r24, r7
    1eb4:	20 46 e8 00 	movea	232, r0, r8
    1eb8:	c3 41       	add	sp, r8
    1eba:	80 ff c0 2c 	jarl	4b7a <___ssprint_r>, lp
    1ebe:	60 52       	cmp	0, r10
    1ec0:	ea 07 39 03 	bne	21f8 <__svfprintf_r+0x1ad2>
    1ec4:	03 ee a8 00 	addi	168, sp, r29
    1ec8:	80 07 1c 02 	jr	20e4 <__svfprintf_r+0x19be>
    1ecc:	23 37 3d 00 	ld.w	60[sp], r6
    1ed0:	61 32       	cmp	1, r6
    1ed2:	df 05       	bgt	1edc <__svfprintf_r+0x17b6>
    1ed4:	d6 56 01 00 	andi	1, r22, r10
    1ed8:	e2 07 8b 01 	be	2062 <__svfprintf_r+0x193c>
    1edc:	7d a7 01 00 	st.w	r20, 0[r29]
    1ee0:	01 52       	mov	1, r10
    1ee2:	7d 57 05 00 	st.w	r10, 4[r29]
    1ee6:	23 57 f1 00 	ld.w	240[sp], r10
    1eea:	41 52       	add	1, r10
    1eec:	63 57 f1 00 	st.w	r10, 240[sp]
    1ef0:	23 57 ed 00 	ld.w	236[sp], r10
    1ef4:	41 52       	add	1, r10
    1ef6:	63 57 ed 00 	st.w	r10, 236[sp]
    1efa:	67 52       	cmp	7, r10
    1efc:	bf 05       	bgt	1f02 <__svfprintf_r+0x17dc>
    1efe:	48 ea       	add	8, r29
    1f00:	d5 0d       	br	1f1a <__svfprintf_r+0x17f4>
    1f02:	17 30       	mov	r23, r6
    1f04:	18 38       	mov	r24, r7
    1f06:	20 46 e8 00 	movea	232, r0, r8
    1f0a:	c3 41       	add	sp, r8
    1f0c:	80 ff 6e 2c 	jarl	4b7a <___ssprint_r>, lp
    1f10:	60 52       	cmp	0, r10
    1f12:	ea 07 e7 02 	bne	21f8 <__svfprintf_r+0x1ad2>
    1f16:	03 ee a8 00 	addi	168, sp, r29
    1f1a:	23 57 41 00 	ld.w	64[sp], r10
    1f1e:	7d 57 01 00 	st.w	r10, 0[r29]
    1f22:	23 5f 4d 00 	ld.w	76[sp], r11
    1f26:	7d 5f 05 00 	st.w	r11, 4[r29]
    1f2a:	23 57 f1 00 	ld.w	240[sp], r10
    1f2e:	cb 51       	add	r11, r10
    1f30:	63 57 f1 00 	st.w	r10, 240[sp]
    1f34:	23 57 ed 00 	ld.w	236[sp], r10
    1f38:	41 52       	add	1, r10
    1f3a:	63 57 ed 00 	st.w	r10, 236[sp]
    1f3e:	67 52       	cmp	7, r10
    1f40:	bf 05       	bgt	1f46 <__svfprintf_r+0x1820>
    1f42:	48 ea       	add	8, r29
    1f44:	d5 0d       	br	1f5e <__svfprintf_r+0x1838>
    1f46:	17 30       	mov	r23, r6
    1f48:	18 38       	mov	r24, r7
    1f4a:	20 46 e8 00 	movea	232, r0, r8
    1f4e:	c3 41       	add	sp, r8
    1f50:	80 ff 2a 2c 	jarl	4b7a <___ssprint_r>, lp
    1f54:	60 52       	cmp	0, r10
    1f56:	ea 07 a3 02 	bne	21f8 <__svfprintf_r+0x1ad2>
    1f5a:	03 ee a8 00 	addi	168, sp, r29
    1f5e:	23 37 49 00 	ld.w	72[sp], r6
    1f62:	23 3f 45 00 	ld.w	68[sp], r7
    1f66:	00 42       	mov	0, r8
    1f68:	00 4a       	mov	0, r9
    1f6a:	80 ff f4 51 	jarl	715e <___nedf2>, lp
    1f6e:	60 52       	cmp	0, r10
    1f70:	d2 25       	be	1fba <__svfprintf_r+0x1894>
    1f72:	41 a2       	add	1, r20
    1f74:	7d a7 01 00 	st.w	r20, 0[r29]
    1f78:	23 57 3d 00 	ld.w	60[sp], r10
    1f7c:	5f 52       	add	-1, r10
    1f7e:	7d 57 05 00 	st.w	r10, 4[r29]
    1f82:	23 5f f1 00 	ld.w	240[sp], r11
    1f86:	cb 51       	add	r11, r10
    1f88:	63 57 f1 00 	st.w	r10, 240[sp]
    1f8c:	23 57 ed 00 	ld.w	236[sp], r10
    1f90:	41 52       	add	1, r10
    1f92:	63 57 ed 00 	st.w	r10, 236[sp]
    1f96:	67 52       	cmp	7, r10
    1f98:	cf 05       	bgt	1fa0 <__svfprintf_r+0x187a>
    1f9a:	48 ea       	add	8, r29
    1f9c:	80 07 04 01 	jr	20a0 <__svfprintf_r+0x197a>
    1fa0:	17 30       	mov	r23, r6
    1fa2:	18 38       	mov	r24, r7
    1fa4:	20 46 e8 00 	movea	232, r0, r8
    1fa8:	c3 41       	add	sp, r8
    1faa:	80 ff d0 2b 	jarl	4b7a <___ssprint_r>, lp
    1fae:	60 52       	cmp	0, r10
    1fb0:	ea 07 49 02 	bne	21f8 <__svfprintf_r+0x1ad2>
    1fb4:	03 ee a8 00 	addi	168, sp, r29
    1fb8:	c5 75       	br	20a0 <__svfprintf_r+0x197a>
    1fba:	23 e7 3d 00 	ld.w	60[sp], r28
    1fbe:	5f e2       	add	-1, r28
    1fc0:	60 e2       	cmp	0, r28
    1fc2:	f7 6d       	ble	20a0 <__svfprintf_r+0x197a>
    1fc4:	20 56 10 00 	movea	16, r0, r10
    1fc8:	ea e1       	cmp	r10, r28
    1fca:	a7 2d       	ble	201e <__svfprintf_r+0x18f8>
    1fcc:	3a 06 7e 79 	mov	0x797e, r26
    1fd0:	00 00 
    1fd2:	0a d8       	mov	r10, r27
    1fd4:	35 06 7a 4b 	mov	0x4b7a, r21
    1fd8:	00 00 
    1fda:	7d d7 01 00 	st.w	r26, 0[r29]
    1fde:	7d df 05 00 	st.w	r27, 4[r29]
    1fe2:	23 57 f1 00 	ld.w	240[sp], r10
    1fe6:	0a 56 10 00 	addi	16, r10, r10
    1fea:	63 57 f1 00 	st.w	r10, 240[sp]
    1fee:	23 57 ed 00 	ld.w	236[sp], r10
    1ff2:	41 52       	add	1, r10
    1ff4:	63 57 ed 00 	st.w	r10, 236[sp]
    1ff8:	67 52       	cmp	7, r10
    1ffa:	bf 05       	bgt	2000 <__svfprintf_r+0x18da>
    1ffc:	48 ea       	add	8, r29
    1ffe:	d5 0d       	br	2018 <__svfprintf_r+0x18f2>
    2000:	17 30       	mov	r23, r6
    2002:	18 38       	mov	r24, r7
    2004:	20 46 e8 00 	movea	232, r0, r8
    2008:	c3 41       	add	sp, r8
    200a:	f5 c7 60 f9 	jarl	[r21], lp
    200e:	60 52       	cmp	0, r10
    2010:	ea 07 e9 01 	bne	21f8 <__svfprintf_r+0x1ad2>
    2014:	03 ee a8 00 	addi	168, sp, r29
    2018:	50 e2       	add	-16, r28
    201a:	fb e1       	cmp	r27, r28
    201c:	ff dd       	bgt	1fda <__svfprintf_r+0x18b4>
    201e:	2a 06 7e 79 	mov	0x797e, r10
    2022:	00 00 
    2024:	7d 57 01 00 	st.w	r10, 0[r29]
    2028:	7d e7 05 00 	st.w	r28, 4[r29]
    202c:	23 57 f1 00 	ld.w	240[sp], r10
    2030:	ca e1       	add	r10, r28
    2032:	63 e7 f1 00 	st.w	r28, 240[sp]
    2036:	23 57 ed 00 	ld.w	236[sp], r10
    203a:	41 52       	add	1, r10
    203c:	63 57 ed 00 	st.w	r10, 236[sp]
    2040:	67 52       	cmp	7, r10
    2042:	bf 05       	bgt	2048 <__svfprintf_r+0x1922>
    2044:	48 ea       	add	8, r29
    2046:	d5 2d       	br	20a0 <__svfprintf_r+0x197a>
    2048:	17 30       	mov	r23, r6
    204a:	18 38       	mov	r24, r7
    204c:	20 46 e8 00 	movea	232, r0, r8
    2050:	c3 41       	add	sp, r8
    2052:	80 ff 28 2b 	jarl	4b7a <___ssprint_r>, lp
    2056:	60 52       	cmp	0, r10
    2058:	ea 07 a1 01 	bne	21f8 <__svfprintf_r+0x1ad2>
    205c:	03 ee a8 00 	addi	168, sp, r29
    2060:	85 25       	br	20a0 <__svfprintf_r+0x197a>
    2062:	7d a7 01 00 	st.w	r20, 0[r29]
    2066:	01 52       	mov	1, r10
    2068:	7d 57 05 00 	st.w	r10, 4[r29]
    206c:	23 57 f1 00 	ld.w	240[sp], r10
    2070:	41 52       	add	1, r10
    2072:	63 57 f1 00 	st.w	r10, 240[sp]
    2076:	23 57 ed 00 	ld.w	236[sp], r10
    207a:	41 52       	add	1, r10
    207c:	63 57 ed 00 	st.w	r10, 236[sp]
    2080:	67 52       	cmp	7, r10
    2082:	bf 05       	bgt	2088 <__svfprintf_r+0x1962>
    2084:	48 ea       	add	8, r29
    2086:	d5 0d       	br	20a0 <__svfprintf_r+0x197a>
    2088:	17 30       	mov	r23, r6
    208a:	18 38       	mov	r24, r7
    208c:	20 46 e8 00 	movea	232, r0, r8
    2090:	c3 41       	add	sp, r8
    2092:	80 ff e8 2a 	jarl	4b7a <___ssprint_r>, lp
    2096:	60 52       	cmp	0, r10
    2098:	ea 07 61 01 	bne	21f8 <__svfprintf_r+0x1ad2>
    209c:	03 ee a8 00 	addi	168, sp, r29
    20a0:	03 56 f5 00 	addi	245, sp, r10
    20a4:	7d 57 01 00 	st.w	r10, 0[r29]
    20a8:	23 67 51 00 	ld.w	80[sp], r12
    20ac:	7d 67 05 00 	st.w	r12, 4[r29]
    20b0:	23 57 f1 00 	ld.w	240[sp], r10
    20b4:	cc 51       	add	r12, r10
    20b6:	63 57 f1 00 	st.w	r10, 240[sp]
    20ba:	23 57 ed 00 	ld.w	236[sp], r10
    20be:	41 52       	add	1, r10
    20c0:	63 57 ed 00 	st.w	r10, 236[sp]
    20c4:	67 52       	cmp	7, r10
    20c6:	bf 05       	bgt	20cc <__svfprintf_r+0x19a6>
    20c8:	48 ea       	add	8, r29
    20ca:	d5 0d       	br	20e4 <__svfprintf_r+0x19be>
    20cc:	17 30       	mov	r23, r6
    20ce:	18 38       	mov	r24, r7
    20d0:	20 46 e8 00 	movea	232, r0, r8
    20d4:	c3 41       	add	sp, r8
    20d6:	80 ff a4 2a 	jarl	4b7a <___ssprint_r>, lp
    20da:	60 52       	cmp	0, r10
    20dc:	ea 07 1d 01 	bne	21f8 <__svfprintf_r+0x1ad2>
    20e0:	03 ee a8 00 	addi	168, sp, r29
    20e4:	d6 b6 04 00 	andi	4, r22, r22
    20e8:	82 55       	be	2188 <__svfprintf_r+0x1a62>
    20ea:	23 e7 2d 00 	ld.w	44[sp], r28
    20ee:	23 6f 1d 00 	ld.w	28[sp], r13
    20f2:	ad e1       	sub	r13, r28
    20f4:	60 e2       	cmp	0, r28
    20f6:	97 4d       	ble	2188 <__svfprintf_r+0x1a62>
    20f8:	20 56 10 00 	movea	16, r0, r10
    20fc:	ea e1       	cmp	r10, r28
    20fe:	97 2d       	ble	2150 <__svfprintf_r+0x1a2a>
    2100:	3a 06 6e 79 	mov	0x796e, r26
    2104:	00 00 
    2106:	0a d8       	mov	r10, r27
    2108:	36 06 7a 4b 	mov	0x4b7a, r22
    210c:	00 00 
    210e:	7d d7 01 00 	st.w	r26, 0[r29]
    2112:	7d df 05 00 	st.w	r27, 4[r29]
    2116:	23 57 f1 00 	ld.w	240[sp], r10
    211a:	0a 56 10 00 	addi	16, r10, r10
    211e:	63 57 f1 00 	st.w	r10, 240[sp]
    2122:	23 57 ed 00 	ld.w	236[sp], r10
    2126:	41 52       	add	1, r10
    2128:	63 57 ed 00 	st.w	r10, 236[sp]
    212c:	67 52       	cmp	7, r10
    212e:	bf 05       	bgt	2134 <__svfprintf_r+0x1a0e>
    2130:	48 ea       	add	8, r29
    2132:	c5 0d       	br	214a <__svfprintf_r+0x1a24>
    2134:	17 30       	mov	r23, r6
    2136:	18 38       	mov	r24, r7
    2138:	20 46 e8 00 	movea	232, r0, r8
    213c:	c3 41       	add	sp, r8
    213e:	f6 c7 60 f9 	jarl	[r22], lp
    2142:	60 52       	cmp	0, r10
    2144:	aa 5d       	bne	21f8 <__svfprintf_r+0x1ad2>
    2146:	03 ee a8 00 	addi	168, sp, r29
    214a:	50 e2       	add	-16, r28
    214c:	fb e1       	cmp	r27, r28
    214e:	8f e5       	bgt	210e <__svfprintf_r+0x19e8>
    2150:	2a 06 6e 79 	mov	0x796e, r10
    2154:	00 00 
    2156:	7d 57 01 00 	st.w	r10, 0[r29]
    215a:	7d e7 05 00 	st.w	r28, 4[r29]
    215e:	23 57 f1 00 	ld.w	240[sp], r10
    2162:	ca e1       	add	r10, r28
    2164:	63 e7 f1 00 	st.w	r28, 240[sp]
    2168:	23 57 ed 00 	ld.w	236[sp], r10
    216c:	41 52       	add	1, r10
    216e:	63 57 ed 00 	st.w	r10, 236[sp]
    2172:	67 52       	cmp	7, r10
    2174:	a7 0d       	ble	2188 <__svfprintf_r+0x1a62>
    2176:	17 30       	mov	r23, r6
    2178:	18 38       	mov	r24, r7
    217a:	20 46 e8 00 	movea	232, r0, r8
    217e:	c3 41       	add	sp, r8
    2180:	80 ff fa 29 	jarl	4b7a <___ssprint_r>, lp
    2184:	60 52       	cmp	0, r10
    2186:	9a 3d       	bne	21f8 <__svfprintf_r+0x1ad2>
    2188:	23 77 1d 00 	ld.w	28[sp], r14
    218c:	23 37 2d 00 	ld.w	44[sp], r6
    2190:	e6 71       	cmp	r6, r14
    2192:	ee 37 3c 53 	cmov	ge, r14, r6, r10
    2196:	23 5f 25 00 	ld.w	36[sp], r11
    219a:	ca 59       	add	r10, r11
    219c:	63 5f 25 00 	st.w	r11, 36[sp]
    21a0:	23 57 f1 00 	ld.w	240[sp], r10
    21a4:	60 52       	cmp	0, r10
    21a6:	a2 0d       	be	21ba <__svfprintf_r+0x1a94>
    21a8:	17 30       	mov	r23, r6
    21aa:	18 38       	mov	r24, r7
    21ac:	20 46 e8 00 	movea	232, r0, r8
    21b0:	c3 41       	add	sp, r8
    21b2:	80 ff c8 29 	jarl	4b7a <___ssprint_r>, lp
    21b6:	60 52       	cmp	0, r10
    21b8:	8a 25       	bne	21f8 <__svfprintf_r+0x1ad2>
    21ba:	63 07 ed 00 	st.w	r0, 236[sp]
    21be:	23 67 39 00 	ld.w	56[sp], r12
    21c2:	60 62       	cmp	0, r12
    21c4:	f2 07 fb e5 	be	7be <__svfprintf_r+0x98>
    21c8:	17 30       	mov	r23, r6
    21ca:	0c 38       	mov	r12, r7
    21cc:	80 ff a0 14 	jarl	366c <__free_r>, lp
    21d0:	63 07 39 00 	st.w	r0, 56[sp]
    21d4:	03 ee a8 00 	addi	168, sp, r29
    21d8:	bf 07 ea e5 	jr	7c2 <__svfprintf_r+0x9c>
    21dc:	23 57 f1 00 	ld.w	240[sp], r10
    21e0:	60 52       	cmp	0, r10
    21e2:	92 0d       	be	21f4 <__svfprintf_r+0x1ace>
    21e4:	17 30       	mov	r23, r6
    21e6:	18 38       	mov	r24, r7
    21e8:	03 46 e8 00 	addi	232, sp, r8
    21ec:	80 ff 8e 29 	jarl	4b7a <___ssprint_r>, lp
    21f0:	60 52       	cmp	0, r10
    21f2:	ba 05       	bne	21f8 <__svfprintf_r+0x1ad2>
    21f4:	63 07 ed 00 	st.w	r0, 236[sp]
    21f8:	23 6f 39 00 	ld.w	56[sp], r13
    21fc:	60 6a       	cmp	0, r13
    21fe:	d2 05       	be	2208 <__svfprintf_r+0x1ae2>
    2200:	17 30       	mov	r23, r6
    2202:	0d 38       	mov	r13, r7
    2204:	80 ff 68 14 	jarl	366c <__free_r>, lp
    2208:	23 77 25 00 	ld.w	36[sp], r14
    220c:	d8 f7 0c 00 	tst1	6, 12[r24]
    2210:	ff 77 14 73 	cmov	nz, -1, r14, r14
    2214:	63 77 25 00 	st.w	r14, 36[sp]
    2218:	23 57 25 00 	ld.w	36[sp], r10
    221c:	03 1e 04 01 	addi	260, sp, sp
    2220:	01 02       	callt	1
    2222:	20 56 30 00 	movea	48, r0, r10
    2226:	43 57 7e 00 	st.b	r10, 126[sp]
    222a:	20 56 58 00 	movea	88, r0, r10
    222e:	bf 07 4a ea 	jr	c78 <__svfprintf_r+0x552>
    2232:	03 52       	mov	3, r10
    2234:	63 57 01 00 	st.w	r10, 0[sp]
    2238:	23 37 19 00 	ld.w	24[sp], r6
    223c:	63 37 05 00 	st.w	r6, 4[sp]
    2240:	03 56 fc 00 	addi	252, sp, r10
    2244:	63 57 09 00 	st.w	r10, 8[sp]
    2248:	20 56 74 00 	movea	116, r0, r10
    224c:	c3 51       	add	sp, r10
    224e:	63 57 0d 00 	st.w	r10, 12[sp]
    2252:	03 56 78 00 	addi	120, sp, r10
    2256:	63 57 11 00 	st.w	r10, 16[sp]
    225a:	17 30       	mov	r23, r6
    225c:	1a 40       	mov	r26, r8
    225e:	23 4f 1d 00 	ld.w	28[sp], r9
    2262:	80 ff c2 01 	jarl	2424 <__dtoa_r>, lp
    2266:	0a a0       	mov	r10, r20
    2268:	23 5f 19 00 	ld.w	24[sp], r11
    226c:	63 5f 21 00 	st.w	r11, 32[sp]
    2270:	bf 07 3e ed 	jr	fae <__svfprintf_r+0x888>
    2274:	20 ae 67 00 	movea	103, r0, r21
    2278:	bf 07 f0 ee 	jr	1168 <__svfprintf_r+0xa42>
    227c:	20 ae 66 00 	movea	102, r0, r21
    2280:	bf 07 e8 ee 	jr	1168 <__svfprintf_r+0xa42>
    2284:	23 67 21 00 	ld.w	32[sp], r12
    2288:	60 62       	cmp	0, r12
    228a:	ec 07 3c 63 	cmov	ge, r12, r0, r12
    228e:	63 67 1d 00 	st.w	r12, 28[sp]
    2292:	63 07 19 00 	st.w	r0, 24[sp]
    2296:	bf 07 28 f4 	jr	16be <__svfprintf_r+0xf98>

0000229a <_quorem>:
    229a:	04 02       	callt	4
    229c:	06 d0       	mov	r6, r26
    229e:	27 9f 11 00 	ld.w	16[r7], r19
    22a2:	26 57 11 00 	ld.w	16[r6], r10
    22a6:	ea 99       	cmp	r10, r19
    22a8:	ef 07 79 01 	bgt	2420 <_quorem+0x186>
    22ac:	07 ee 14 00 	addi	20, r7, r29
    22b0:	13 e6 ff ff 	addi	-1, r19, r28
    22b4:	1c 30       	mov	r28, r6
    22b6:	13 56 04 00 	addi	4, r19, r10
    22ba:	c2 52       	shl	2, r10
    22bc:	07 d8       	mov	r7, r27
    22be:	ca d9       	add	r10, r27
    22c0:	1a c6 14 00 	addi	20, r26, r24
    22c4:	1a 58       	mov	r26, r11
    22c6:	ca 59       	add	r10, r11
    22c8:	3b 57 01 00 	ld.w	0[r27], r10
    22cc:	41 52       	add	1, r10
    22ce:	2b bf 01 00 	ld.w	0[r11], r23
    22d2:	ea bf c2 52 	divu	r10, r23, r10
    22d6:	17 c8       	mov	r23, r25
    22d8:	60 ba       	cmp	0, r23
    22da:	f2 55       	be	2388 <_quorem+0xee>
    22dc:	1d 58       	mov	r29, r11
    22de:	18 50       	mov	r24, r10
    22e0:	00 92       	mov	0, r18
    22e2:	00 8a       	mov	0, r17
    22e4:	2b 87 01 00 	ld.w	0[r11], r16
    22e8:	44 5a       	add	4, r11
    22ea:	d0 7e ff ff 	andi	65535, r16, r15
    22ee:	f9 7f 20 02 	mul	r25, r15, r0
    22f2:	d2 79       	add	r18, r15
    22f4:	0f 60       	mov	r15, r12
    22f6:	90 62       	shr	16, r12
    22f8:	90 82       	shr	16, r16
    22fa:	f9 87 20 02 	mul	r25, r16, r0
    22fe:	0c 70       	mov	r12, r14
    2300:	d0 71       	add	r16, r14
    2302:	0e 90       	mov	r14, r18
    2304:	90 92       	shr	16, r18
    2306:	2a 6f 01 00 	ld.w	0[r10], r13
    230a:	cd 66 ff ff 	andi	65535, r13, r12
    230e:	d1 61       	add	r17, r12
    2310:	cf 7e ff ff 	andi	65535, r15, r15
    2314:	af 61       	sub	r15, r12
    2316:	90 6a       	shr	16, r13
    2318:	ce 76 ff ff 	andi	65535, r14, r14
    231c:	ae 69       	sub	r14, r13
    231e:	0c 78       	mov	r12, r15
    2320:	b0 7a       	sar	16, r15
    2322:	cf 69       	add	r15, r13
    2324:	0d 88       	mov	r13, r17
    2326:	b0 8a       	sar	16, r17
    2328:	d0 6a       	shl	16, r13
    232a:	cc 66 ff ff 	andi	65535, r12, r12
    232e:	0c 69       	or	r12, r13
    2330:	6a 6f 01 00 	st.w	r13, 0[r10]
    2334:	44 52       	add	4, r10
    2336:	eb d9       	cmp	r11, r27
    2338:	e9 d5       	bnl	22e4 <_quorem+0x4a>
    233a:	06 56 05 00 	addi	5, r6, r10
    233e:	c2 52       	shl	2, r10
    2340:	da 51       	add	r26, r10
    2342:	2a 57 01 00 	ld.w	0[r10], r10
    2346:	60 52       	cmp	0, r10
    2348:	8a 25       	bne	2388 <_quorem+0xee>
    234a:	06 56 05 00 	addi	5, r6, r10
    234e:	c2 52       	shl	2, r10
    2350:	da 51       	add	r26, r10
    2352:	0a 5e fc ff 	addi	-4, r10, r11
    2356:	eb c1       	cmp	r11, r24
    2358:	e9 15       	bnl	2384 <_quorem+0xea>
    235a:	2a 5f fd ff 	ld.w	-4[r10], r11
    235e:	60 5a       	cmp	0, r11
    2360:	aa 15       	bne	2384 <_quorem+0xea>
    2362:	58 52       	add	-8, r10
    2364:	13 66 fe ff 	addi	-2, r19, r12
    2368:	0a 58       	mov	r10, r11
    236a:	b8 59       	sub	r24, r11
    236c:	43 5a       	add	3, r11
    236e:	82 5a       	shr	2, r11
    2370:	0c 98       	mov	r12, r19
    2372:	ab 99       	sub	r11, r19
    2374:	5f e2       	add	-1, r28
    2376:	f3 e1       	cmp	r19, r28
    2378:	e2 05       	be	2384 <_quorem+0xea>
    237a:	5c 52       	add	-4, r10
    237c:	2a 5f 05 00 	ld.w	4[r10], r11
    2380:	60 5a       	cmp	0, r11
    2382:	92 fd       	be	2374 <_quorem+0xda>
    2384:	7a e7 11 00 	st.w	r28, 16[r26]
    2388:	1a 30       	mov	r26, r6
    238a:	80 ff da 21 	jarl	4564 <___mcmp>, lp
    238e:	60 52       	cmp	0, r10
    2390:	e6 45       	blt	241c <_quorem+0x182>
    2392:	17 ce 01 00 	addi	1, r23, r25
    2396:	18 50       	mov	r24, r10
    2398:	00 72       	mov	0, r14
    239a:	3d 6f 01 00 	ld.w	0[r29], r13
    239e:	44 ea       	add	4, r29
    23a0:	2a 67 01 00 	ld.w	0[r10], r12
    23a4:	cc 5e ff ff 	andi	65535, r12, r11
    23a8:	ce 59       	add	r14, r11
    23aa:	cd 7e ff ff 	andi	65535, r13, r15
    23ae:	af 59       	sub	r15, r11
    23b0:	90 62       	shr	16, r12
    23b2:	90 6a       	shr	16, r13
    23b4:	ad 61       	sub	r13, r12
    23b6:	0b 70       	mov	r11, r14
    23b8:	b0 72       	sar	16, r14
    23ba:	ce 61       	add	r14, r12
    23bc:	0c 70       	mov	r12, r14
    23be:	b0 72       	sar	16, r14
    23c0:	d0 62       	shl	16, r12
    23c2:	cb 5e ff ff 	andi	65535, r11, r11
    23c6:	0b 61       	or	r11, r12
    23c8:	6a 67 01 00 	st.w	r12, 0[r10]
    23cc:	44 52       	add	4, r10
    23ce:	fd d9       	cmp	r29, r27
    23d0:	d9 e5       	bnl	239a <_quorem+0x100>
    23d2:	1c 56 05 00 	addi	5, r28, r10
    23d6:	c2 52       	shl	2, r10
    23d8:	da 51       	add	r26, r10
    23da:	2a 57 01 00 	ld.w	0[r10], r10
    23de:	60 52       	cmp	0, r10
    23e0:	ea 1d       	bne	241c <_quorem+0x182>
    23e2:	1c 56 05 00 	addi	5, r28, r10
    23e6:	c2 52       	shl	2, r10
    23e8:	da 51       	add	r26, r10
    23ea:	0a 66 fc ff 	addi	-4, r10, r12
    23ee:	ec c1       	cmp	r12, r24
    23f0:	c9 15       	bnl	2418 <_quorem+0x17e>
    23f2:	2a 5f fd ff 	ld.w	-4[r10], r11
    23f6:	60 5a       	cmp	0, r11
    23f8:	8a 15       	bne	2418 <_quorem+0x17e>
    23fa:	58 52       	add	-8, r10
    23fc:	0a 60       	mov	r10, r12
    23fe:	b8 61       	sub	r24, r12
    2400:	43 62       	add	3, r12
    2402:	1c 5a       	mov	-4, r11
    2404:	4b 61       	and	r11, r12
    2406:	8a 61       	subr	r10, r12
    2408:	5f e2       	add	-1, r28
    240a:	ec 51       	cmp	r12, r10
    240c:	e2 05       	be	2418 <_quorem+0x17e>
    240e:	5c 52       	add	-4, r10
    2410:	2a 5f 05 00 	ld.w	4[r10], r11
    2414:	60 5a       	cmp	0, r11
    2416:	92 fd       	be	2408 <_quorem+0x16e>
    2418:	7a e7 11 00 	st.w	r28, 16[r26]
    241c:	19 50       	mov	r25, r10
    241e:	a5 05       	br	2422 <_quorem+0x188>
    2420:	00 52       	mov	0, r10
    2422:	05 02       	callt	5

00002424 <__dtoa_r>:
    2424:	00 02       	callt	0
    2426:	03 1e 90 ff 	addi	-112, sp, sp
    242a:	06 d8       	mov	r6, r27
    242c:	08 c0       	mov	r8, r24
    242e:	09 e8       	mov	r9, r29
    2430:	23 e7 a9 00 	ld.w	168[sp], r28
    2434:	63 47 09 00 	st.w	r8, 8[sp]
    2438:	09 d0       	mov	r9, r26
    243a:	26 57 41 00 	ld.w	64[r6], r10
    243e:	60 52       	cmp	0, r10
    2440:	c2 15       	be	2468 <__dtoa_r+0x44>
    2442:	26 5f 45 00 	ld.w	68[r6], r11
    2446:	6a 5f 05 00 	st.w	r11, 4[r10]
    244a:	26 57 41 00 	ld.w	64[r6], r10
    244e:	26 67 45 00 	ld.w	68[r6], r12
    2452:	01 5a       	mov	1, r11
    2454:	ec 5f c0 00 	shl	r12, r11
    2458:	6a 5f 09 00 	st.w	r11, 8[r10]
    245c:	3b 3f 41 00 	ld.w	64[r27], r7
    2460:	80 ff 38 1c 	jarl	4098 <__Bfree>, lp
    2464:	7b 07 41 00 	st.w	r0, 64[r27]
    2468:	60 d2       	cmp	0, r26
    246a:	9e 0d       	bge	247c <__dtoa_r+0x58>
    246c:	01 52       	mov	1, r10
    246e:	7c 57 01 00 	st.w	r10, 0[r28]
    2472:	3a 06 ff ff 	mov	0x7fffffff, r26
    2476:	ff 7f 
    2478:	5d d1       	and	r29, r26
    247a:	b5 05       	br	2480 <__dtoa_r+0x5c>
    247c:	7c 07 01 00 	st.w	r0, 0[r28]
    2480:	1a b8       	mov	r26, r23
    2482:	40 5e f0 7f 	movhi	32752, r0, r11
    2486:	5a 59       	and	r26, r11
    2488:	40 56 f0 7f 	movhi	32752, r0, r10
    248c:	ea 59       	cmp	r10, r11
    248e:	8a 35       	bne	24ee <__dtoa_r+0xca>
    2490:	20 56 0f 27 	movea	9999, r0, r10
    2494:	23 5f a5 00 	ld.w	164[sp], r11
    2498:	6b 57 01 00 	st.w	r10, 0[r11]
    249c:	23 67 09 00 	ld.w	8[sp], r12
    24a0:	60 62       	cmp	0, r12
    24a2:	fa 0d       	bne	24c0 <__dtoa_r+0x9c>
    24a4:	2a 06 ff ff 	mov	0xfffff, r10
    24a8:	0f 00 
    24aa:	4a b9       	and	r10, r23
    24ac:	2a 06 97 79 	mov	0x7997, r10
    24b0:	00 00 
    24b2:	2b 06 8e 79 	mov	0x798e, r11
    24b6:	00 00 
    24b8:	60 ba       	cmp	0, r23
    24ba:	eb 57 24 bb 	cmov	z, r11, r10, r23
    24be:	c5 05       	br	24c6 <__dtoa_r+0xa2>
    24c0:	37 06 97 79 	mov	0x7997, r23
    24c4:	00 00 
    24c6:	23 5f ad 00 	ld.w	172[sp], r11
    24ca:	60 5a       	cmp	0, r11
    24cc:	e2 07 63 10 	be	352e <__dtoa_r+0x110a>
    24d0:	17 57 03 00 	ld.b	3[r23], r10
    24d4:	60 52       	cmp	0, r10
    24d6:	c2 05       	be	24de <__dtoa_r+0xba>
    24d8:	17 56 08 00 	addi	8, r23, r10
    24dc:	b5 05       	br	24e2 <__dtoa_r+0xbe>
    24de:	17 56 03 00 	addi	3, r23, r10
    24e2:	23 67 ad 00 	ld.w	172[sp], r12
    24e6:	6c 57 01 00 	st.w	r10, 0[r12]
    24ea:	80 07 44 10 	jr	352e <__dtoa_r+0x110a>
    24ee:	18 e0       	mov	r24, r28
    24f0:	1a b0       	mov	r26, r22
    24f2:	01 ea       	mov	1, r29
    24f4:	18 30       	mov	r24, r6
    24f6:	1a 38       	mov	r26, r7
    24f8:	00 42       	mov	0, r8
    24fa:	00 4a       	mov	0, r9
    24fc:	80 ff 62 4c 	jarl	715e <___nedf2>, lp
    2500:	60 52       	cmp	0, r10
    2502:	aa 05       	bne	2506 <__dtoa_r+0xe2>
    2504:	00 ea       	mov	0, r29
    2506:	9d 00       	zxb	r29
    2508:	60 ea       	cmp	0, r29
    250a:	da 15       	bne	2534 <__dtoa_r+0x110>
    250c:	01 52       	mov	1, r10
    250e:	23 5f a5 00 	ld.w	164[sp], r11
    2512:	6b 57 01 00 	st.w	r10, 0[r11]
    2516:	23 67 ad 00 	ld.w	172[sp], r12
    251a:	60 62       	cmp	0, r12
    251c:	e2 07 0d 10 	be	3528 <__dtoa_r+0x1104>
    2520:	2a 06 9c 79 	mov	0x799c, r10
    2524:	00 00 
    2526:	6c 57 01 00 	st.w	r10, 0[r12]
    252a:	37 06 9b 79 	mov	0x799b, r23
    252e:	00 00 
    2530:	80 07 fe 0f 	jr	352e <__dtoa_r+0x110a>
    2534:	03 56 68 00 	addi	104, sp, r10
    2538:	63 57 01 00 	st.w	r10, 0[sp]
    253c:	03 56 6c 00 	addi	108, sp, r10
    2540:	63 57 05 00 	st.w	r10, 4[sp]
    2544:	1b 30       	mov	r27, r6
    2546:	1c 40       	mov	r28, r8
    2548:	16 48       	mov	r22, r9
    254a:	80 ff 58 22 	jarl	47a2 <___d2b>, lp
    254e:	0a c8       	mov	r10, r25
    2550:	17 50       	mov	r23, r10
    2552:	94 52       	shr	20, r10
    2554:	ca 56 ff 07 	andi	2047, r10, r10
    2558:	92 15       	be	257a <__dtoa_r+0x156>
    255a:	63 e7 1d 00 	st.w	r28, 28[sp]
    255e:	2b 06 ff ff 	mov	0xfffff, r11
    2562:	0f 00 
    2564:	4b b1       	and	r11, r22
    2566:	40 66 f0 3f 	movhi	16368, r0, r12
    256a:	16 61       	or	r22, r12
    256c:	63 67 31 00 	st.w	r12, 48[sp]
    2570:	0a be 01 fc 	addi	-1023, r10, r23
    2574:	63 07 41 00 	st.w	r0, 64[sp]
    2578:	c5 2d       	br	25d0 <__dtoa_r+0x1ac>
    257a:	23 57 69 00 	ld.w	104[sp], r10
    257e:	23 ef 6d 00 	ld.w	108[sp], r29
    2582:	ca e9       	add	r10, r29
    2584:	1d 5e 32 04 	addi	1074, r29, r11
    2588:	20 56 20 00 	movea	32, r0, r10
    258c:	ea 59       	cmp	r10, r11
    258e:	d7 0d       	ble	25a8 <__dtoa_r+0x184>
    2590:	1d 56 12 04 	addi	1042, r29, r10
    2594:	18 30       	mov	r24, r6
    2596:	ea 37 80 00 	shr	r10, r6
    259a:	20 56 0e fc 	movea	-1010, r0, r10
    259e:	bd 51       	sub	r29, r10
    25a0:	ea bf c0 00 	shl	r10, r23
    25a4:	17 31       	or	r23, r6
    25a6:	f5 05       	br	25b4 <__dtoa_r+0x190>
    25a8:	20 56 ee fb 	movea	-1042, r0, r10
    25ac:	bd 51       	sub	r29, r10
    25ae:	18 30       	mov	r24, r6
    25b0:	ea 37 c0 00 	shl	r10, r6
    25b4:	80 ff 42 4e 	jarl	73f6 <___floatunsidf>, lp
    25b8:	63 57 1d 00 	st.w	r10, 28[sp]
    25bc:	40 56 10 fe 	movhi	-496, r0, r10
    25c0:	cb 51       	add	r11, r10
    25c2:	63 57 31 00 	st.w	r10, 48[sp]
    25c6:	1d be ff ff 	addi	-1, r29, r23
    25ca:	01 5a       	mov	1, r11
    25cc:	63 5f 41 00 	st.w	r11, 64[sp]
    25d0:	23 37 1d 00 	ld.w	28[sp], r6
    25d4:	23 3f 31 00 	ld.w	48[sp], r7
    25d8:	00 42       	mov	0, r8
    25da:	40 4e f8 3f 	movhi	16376, r0, r9
    25de:	80 ff 14 47 	jarl	6cf2 <___subdf3>, lp
    25e2:	3d 06 4e 6d 	mov	0x6d4e, r29
    25e6:	00 00 
    25e8:	0a 30       	mov	r10, r6
    25ea:	0b 38       	mov	r11, r7
    25ec:	28 06 61 43 	mov	0x636f4361, r8
    25f0:	6f 63 
    25f2:	29 06 a7 87 	mov	0x3fd287a7, r9
    25f6:	d2 3f 
    25f8:	fd c7 60 f9 	jarl	[r29], lp
    25fc:	3c 06 a2 6c 	mov	0x6ca2, r28
    2600:	00 00 
    2602:	0a 30       	mov	r10, r6
    2604:	0b 38       	mov	r11, r7
    2606:	28 06 b3 c8 	mov	0x8b60c8b3, r8
    260a:	60 8b 
    260c:	29 06 28 8a 	mov	0x3fc68a28, r9
    2610:	c6 3f 
    2612:	fc c7 60 f9 	jarl	[r28], lp
    2616:	0a b0       	mov	r10, r22
    2618:	0b a8       	mov	r11, r21
    261a:	17 30       	mov	r23, r6
    261c:	80 ff aa 4c 	jarl	72c6 <___floatsidf>, lp
    2620:	0a 30       	mov	r10, r6
    2622:	0b 38       	mov	r11, r7
    2624:	28 06 fb 79 	mov	0x509f79fb, r8
    2628:	9f 50 
    262a:	29 06 13 44 	mov	0x3fd34413, r9
    262e:	d3 3f 
    2630:	fd c7 60 f9 	jarl	[r29], lp
    2634:	16 30       	mov	r22, r6
    2636:	15 38       	mov	r21, r7
    2638:	0a 40       	mov	r10, r8
    263a:	0b 48       	mov	r11, r9
    263c:	fc c7 60 f9 	jarl	[r28], lp
    2640:	0a e8       	mov	r10, r29
    2642:	0b e0       	mov	r11, r28
    2644:	0a 30       	mov	r10, r6
    2646:	0b 38       	mov	r11, r7
    2648:	80 ff 14 4d 	jarl	735c <___fixdfsi>, lp
    264c:	63 57 15 00 	st.w	r10, 20[sp]
    2650:	1d 30       	mov	r29, r6
    2652:	1c 38       	mov	r28, r7
    2654:	00 42       	mov	0, r8
    2656:	00 4a       	mov	0, r9
    2658:	80 ff 14 4c 	jarl	726c <___ltdf2>, lp
    265c:	60 52       	cmp	0, r10
    265e:	ae 15       	bge	2682 <__dtoa_r+0x25e>
    2660:	23 37 15 00 	ld.w	20[sp], r6
    2664:	80 ff 62 4c 	jarl	72c6 <___floatsidf>, lp
    2668:	0a 30       	mov	r10, r6
    266a:	0b 38       	mov	r11, r7
    266c:	1d 40       	mov	r29, r8
    266e:	1c 48       	mov	r28, r9
    2670:	80 ff ee 4a 	jarl	715e <___nedf2>, lp
    2674:	60 52       	cmp	0, r10
    2676:	e2 05       	be	2682 <__dtoa_r+0x25e>
    2678:	23 67 15 00 	ld.w	20[sp], r12
    267c:	5f 62       	add	-1, r12
    267e:	63 67 15 00 	st.w	r12, 20[sp]
    2682:	20 56 16 00 	movea	22, r0, r10
    2686:	23 5f 15 00 	ld.w	20[sp], r11
    268a:	ea 59       	cmp	r10, r11
    268c:	9b 1d       	bh	26be <__dtoa_r+0x29a>
    268e:	0b 50       	mov	r11, r10
    2690:	c3 52       	shl	3, r10
    2692:	2c 06 34 7a 	mov	0x7a34, r12
    2696:	00 00 
    2698:	cc 51       	add	r12, r10
    269a:	2a 37 01 00 	ld.w	0[r10], r6
    269e:	2a 3f 05 00 	ld.w	4[r10], r7
    26a2:	18 40       	mov	r24, r8
    26a4:	1a 48       	mov	r26, r9
    26a6:	80 ff 12 4b 	jarl	71b8 <___gtdf2>, lp
    26aa:	60 52       	cmp	0, r10
    26ac:	d7 0d       	ble	26c6 <__dtoa_r+0x2a2>
    26ae:	23 57 15 00 	ld.w	20[sp], r10
    26b2:	5f 52       	add	-1, r10
    26b4:	63 57 15 00 	st.w	r10, 20[sp]
    26b8:	63 07 35 00 	st.w	r0, 52[sp]
    26bc:	f5 05       	br	26ca <__dtoa_r+0x2a6>
    26be:	01 5a       	mov	1, r11
    26c0:	63 5f 35 00 	st.w	r11, 52[sp]
    26c4:	b5 05       	br	26ca <__dtoa_r+0x2a6>
    26c6:	63 07 35 00 	st.w	r0, 52[sp]
    26ca:	23 b7 6d 00 	ld.w	108[sp], r22
    26ce:	b7 b1       	sub	r23, r22
    26d0:	5f b2       	add	-1, r22
    26d2:	60 b2       	cmp	0, r22
    26d4:	de 05       	bge	26de <__dtoa_r+0x2ba>
    26d6:	16 a0       	mov	r22, r20
    26d8:	80 a1       	subr	r0, r20
    26da:	00 b2       	mov	0, r22
    26dc:	a5 05       	br	26e0 <__dtoa_r+0x2bc>
    26de:	00 a2       	mov	0, r20
    26e0:	23 67 15 00 	ld.w	20[sp], r12
    26e4:	60 62       	cmp	0, r12
    26e6:	f6 05       	blt	26f4 <__dtoa_r+0x2d0>
    26e8:	cc b1       	add	r12, r22
    26ea:	63 67 2d 00 	st.w	r12, 44[sp]
    26ee:	63 07 21 00 	st.w	r0, 32[sp]
    26f2:	95 0d       	br	2704 <__dtoa_r+0x2e0>
    26f4:	23 57 15 00 	ld.w	20[sp], r10
    26f8:	aa a1       	sub	r10, r20
    26fa:	80 51       	subr	r0, r10
    26fc:	63 57 21 00 	st.w	r10, 32[sp]
    2700:	63 07 2d 00 	st.w	r0, 44[sp]
    2704:	23 5f 9d 00 	ld.w	156[sp], r11
    2708:	69 5a       	cmp	9, r11
    270a:	eb 07 2d 0e 	bh	3536 <__dtoa_r+0x1112>
    270e:	65 5a       	cmp	5, r11
    2710:	e7 05       	ble	271c <__dtoa_r+0x2f8>
    2712:	5c 5a       	add	-4, r11
    2714:	63 5f 9d 00 	st.w	r11, 156[sp]
    2718:	00 ea       	mov	0, r29
    271a:	a5 05       	br	271e <__dtoa_r+0x2fa>
    271c:	01 ea       	mov	1, r29
    271e:	23 67 9d 00 	ld.w	156[sp], r12
    2722:	65 62       	cmp	5, r12
    2724:	fb 35       	bh	2792 <__dtoa_r+0x36e>
    2726:	0c 50       	mov	r12, r10
    2728:	c1 52       	shl	1, r10
    272a:	2b 06 3a 27 	mov	0x273a, r11
    272e:	00 00 
    2730:	cb 51       	add	r11, r10
    2732:	2a 57 00 00 	ld.h	0[r10], r10
    2736:	cb 51       	add	r11, r10
    2738:	6a 00       	jmp	[r10]
    273a:	16 0e 16 0e 	addi	3606, r22, r1
    273e:	1c 00       	synci	
    2740:	36 00       	not	r22, r0
    2742:	14 00       	ldv.qw	0[r20], wr0
    2744:	0c 00       	ldv.qw	0[r12], wr0
    2746:	01 52       	mov	1, r10
    2748:	63 57 25 00 	st.w	r10, 36[sp]
    274c:	c5 15       	br	2774 <__dtoa_r+0x350>
    274e:	01 5a       	mov	1, r11
    2750:	63 5f 25 00 	st.w	r11, 36[sp]
    2754:	b5 05       	br	275a <__dtoa_r+0x336>
    2756:	63 07 25 00 	st.w	r0, 36[sp]
    275a:	23 67 a1 00 	ld.w	160[sp], r12
    275e:	60 62       	cmp	0, r12
    2760:	e7 07 07 0e 	ble	3566 <__dtoa_r+0x1142>
    2764:	63 67 29 00 	st.w	r12, 40[sp]
    2768:	63 67 19 00 	st.w	r12, 24[sp]
    276c:	0c b8       	mov	r12, r23
    276e:	a5 1d       	br	27a2 <__dtoa_r+0x37e>
    2770:	63 07 25 00 	st.w	r0, 36[sp]
    2774:	23 57 a1 00 	ld.w	160[sp], r10
    2778:	23 5f 15 00 	ld.w	20[sp], r11
    277c:	cb 51       	add	r11, r10
    277e:	63 57 29 00 	st.w	r10, 40[sp]
    2782:	0a b8       	mov	r10, r23
    2784:	41 ba       	add	1, r23
    2786:	60 ba       	cmp	0, r23
    2788:	e7 07 ef 0d 	ble	3576 <__dtoa_r+0x1152>
    278c:	63 bf 19 00 	st.w	r23, 24[sp]
    2790:	95 0d       	br	27a2 <__dtoa_r+0x37e>
    2792:	01 62       	mov	1, r12
    2794:	63 67 25 00 	st.w	r12, 36[sp]
    2798:	1f 52       	mov	-1, r10
    279a:	63 57 29 00 	st.w	r10, 40[sp]
    279e:	63 57 19 00 	st.w	r10, 24[sp]
    27a2:	7b 07 45 00 	st.w	r0, 68[r27]
    27a6:	20 56 17 00 	movea	23, r0, r10
    27aa:	ea b9       	cmp	r10, r23
    27ac:	d3 0d       	bnh	27c6 <__dtoa_r+0x3a2>
    27ae:	00 62       	mov	0, r12
    27b0:	04 52       	mov	4, r10
    27b2:	41 62       	add	1, r12
    27b4:	0a 58       	mov	r10, r11
    27b6:	ca 59       	add	r10, r11
    27b8:	0b 50       	mov	r11, r10
    27ba:	0b 5e 14 00 	addi	20, r11, r11
    27be:	f7 59       	cmp	r23, r11
    27c0:	93 fd       	bnh	27b2 <__dtoa_r+0x38e>
    27c2:	7b 67 45 00 	st.w	r12, 68[r27]
    27c6:	1b 30       	mov	r27, r6
    27c8:	3b 3f 45 00 	ld.w	68[r27], r7
    27cc:	80 ff 62 18 	jarl	402e <__Balloc>, lp
    27d0:	0a b8       	mov	r10, r23
    27d2:	7b 57 41 00 	st.w	r10, 64[r27]
    27d6:	23 5f 19 00 	ld.w	24[sp], r11
    27da:	63 5f 39 00 	st.w	r11, 56[sp]
    27de:	6e 5a       	cmp	14, r11
    27e0:	eb 07 2b 05 	bh	2d0a <__dtoa_r+0x8e6>
    27e4:	60 ea       	cmp	0, r29
    27e6:	e2 07 25 05 	be	2d0a <__dtoa_r+0x8e6>
    27ea:	18 30       	mov	r24, r6
    27ec:	1a 38       	mov	r26, r7
    27ee:	63 c7 1d 00 	st.w	r24, 28[sp]
    27f2:	63 d7 31 00 	st.w	r26, 48[sp]
    27f6:	23 67 15 00 	ld.w	20[sp], r12
    27fa:	60 62       	cmp	0, r12
    27fc:	d7 55       	ble	28a6 <__dtoa_r+0x482>
    27fe:	cc 56 0f 00 	andi	15, r12, r10
    2802:	c3 52       	shl	3, r10
    2804:	2b 06 34 7a 	mov	0x7a34, r11
    2808:	00 00 
    280a:	cb 51       	add	r11, r10
    280c:	2a c7 01 00 	ld.w	0[r10], r24
    2810:	2a af 05 00 	ld.w	4[r10], r21
    2814:	0c e8       	mov	r12, r29
    2816:	a4 ea       	sar	4, r29
    2818:	dd 56 10 00 	andi	16, r29, r10
    281c:	b2 15       	be	2842 <__dtoa_r+0x41e>
    281e:	dd ee 0f 00 	andi	15, r29, r29
    2822:	2a 06 0c 7a 	mov	0x7a0c, r10
    2826:	00 00 
    2828:	2a 47 21 00 	ld.w	32[r10], r8
    282c:	2a 4f 25 00 	ld.w	36[r10], r9
    2830:	80 ff 5e 47 	jarl	6f8e <___divdf3>, lp
    2834:	63 57 09 00 	st.w	r10, 8[sp]
    2838:	0b d0       	mov	r11, r26
    283a:	03 62       	mov	3, r12
    283c:	63 67 3d 00 	st.w	r12, 60[sp]
    2840:	c5 05       	br	2848 <__dtoa_r+0x424>
    2842:	02 52       	mov	2, r10
    2844:	63 57 3d 00 	st.w	r10, 60[sp]
    2848:	60 ea       	cmp	0, r29
    284a:	b2 25       	be	2890 <__dtoa_r+0x46c>
    284c:	3c 06 0c 7a 	mov	0x7a0c, r28
    2850:	00 00 
    2852:	18 50       	mov	r24, r10
    2854:	14 c0       	mov	r20, r24
    2856:	16 a0       	mov	r22, r20
    2858:	19 b0       	mov	r25, r22
    285a:	1b c8       	mov	r27, r25
    285c:	23 df 3d 00 	ld.w	60[sp], r27
    2860:	15 58       	mov	r21, r11
    2862:	dd 66 01 00 	andi	1, r29, r12
    2866:	92 0d       	be	2878 <__dtoa_r+0x454>
    2868:	41 da       	add	1, r27
    286a:	0a 30       	mov	r10, r6
    286c:	0b 38       	mov	r11, r7
    286e:	bc 07 09 40 	ld.dw	0[r28], r8
    2872:	00 00 
    2874:	80 ff da 44 	jarl	6d4e <___muldf3>, lp
    2878:	a1 ea       	sar	1, r29
    287a:	48 e2       	add	8, r28
    287c:	60 ea       	cmp	0, r29
    287e:	aa f5       	bne	2862 <__dtoa_r+0x43e>
    2880:	63 df 3d 00 	st.w	r27, 60[sp]
    2884:	19 d8       	mov	r25, r27
    2886:	16 c8       	mov	r22, r25
    2888:	14 b0       	mov	r20, r22
    288a:	18 a0       	mov	r24, r20
    288c:	0a c0       	mov	r10, r24
    288e:	0b a8       	mov	r11, r21
    2890:	23 37 09 00 	ld.w	8[sp], r6
    2894:	1a 38       	mov	r26, r7
    2896:	18 40       	mov	r24, r8
    2898:	15 48       	mov	r21, r9
    289a:	80 ff f4 46 	jarl	6f8e <___divdf3>, lp
    289e:	63 57 09 00 	st.w	r10, 8[sp]
    28a2:	0b d0       	mov	r11, r26
    28a4:	a5 45       	br	2928 <__dtoa_r+0x504>
    28a6:	23 ef 15 00 	ld.w	20[sp], r29
    28aa:	80 e9       	subr	r0, r29
    28ac:	f2 35       	be	291a <__dtoa_r+0x4f6>
    28ae:	dd 56 0f 00 	andi	15, r29, r10
    28b2:	c3 52       	shl	3, r10
    28b4:	2b 06 34 7a 	mov	0x7a34, r11
    28b8:	00 00 
    28ba:	cb 51       	add	r11, r10
    28bc:	2a 47 01 00 	ld.w	0[r10], r8
    28c0:	2a 4f 05 00 	ld.w	4[r10], r9
    28c4:	80 ff 8a 44 	jarl	6d4e <___muldf3>, lp
    28c8:	0a 60       	mov	r10, r12
    28ca:	0b d0       	mov	r11, r26
    28cc:	63 67 09 00 	st.w	r12, 8[sp]
    28d0:	a4 ea       	sar	4, r29
    28d2:	82 2d       	be	2922 <__dtoa_r+0x4fe>
    28d4:	3c 06 0c 7a 	mov	0x7a0c, r28
    28d8:	00 00 
    28da:	02 62       	mov	2, r12
    28dc:	63 67 3d 00 	st.w	r12, 60[sp]
    28e0:	3a 06 4e 6d 	mov	0x6d4e, r26
    28e4:	00 00 
    28e6:	19 c0       	mov	r25, r24
    28e8:	1b c8       	mov	r27, r25
    28ea:	0c d8       	mov	r12, r27
    28ec:	dd 66 01 00 	andi	1, r29, r12
    28f0:	92 0d       	be	2902 <__dtoa_r+0x4de>
    28f2:	41 da       	add	1, r27
    28f4:	0a 30       	mov	r10, r6
    28f6:	0b 38       	mov	r11, r7
    28f8:	bc 07 09 40 	ld.dw	0[r28], r8
    28fc:	00 00 
    28fe:	fa c7 60 f9 	jarl	[r26], lp
    2902:	a1 ea       	sar	1, r29
    2904:	48 e2       	add	8, r28
    2906:	60 ea       	cmp	0, r29
    2908:	aa f5       	bne	28ec <__dtoa_r+0x4c8>
    290a:	63 df 3d 00 	st.w	r27, 60[sp]
    290e:	19 d8       	mov	r25, r27
    2910:	18 c8       	mov	r24, r25
    2912:	63 57 09 00 	st.w	r10, 8[sp]
    2916:	0b d0       	mov	r11, r26
    2918:	85 0d       	br	2928 <__dtoa_r+0x504>
    291a:	02 52       	mov	2, r10
    291c:	63 57 3d 00 	st.w	r10, 60[sp]
    2920:	c5 05       	br	2928 <__dtoa_r+0x504>
    2922:	02 5a       	mov	2, r11
    2924:	63 5f 3d 00 	st.w	r11, 60[sp]
    2928:	23 67 35 00 	ld.w	52[sp], r12
    292c:	60 62       	cmp	0, r12
    292e:	e2 2d       	be	298a <__dtoa_r+0x566>
    2930:	23 ef 09 00 	ld.w	8[sp], r29
    2934:	1d 30       	mov	r29, r6
    2936:	1a 38       	mov	r26, r7
    2938:	00 42       	mov	0, r8
    293a:	40 4e f0 3f 	movhi	16368, r0, r9
    293e:	80 ff 2e 49 	jarl	726c <___ltdf2>, lp
    2942:	60 52       	cmp	0, r10
    2944:	ce 2d       	bge	299c <__dtoa_r+0x578>
    2946:	23 57 19 00 	ld.w	24[sp], r10
    294a:	60 52       	cmp	0, r10
    294c:	97 35       	ble	29ae <__dtoa_r+0x58a>
    294e:	23 5f 29 00 	ld.w	40[sp], r11
    2952:	60 5a       	cmp	0, r11
    2954:	e7 07 ab 03 	ble	2cfe <__dtoa_r+0x8da>
    2958:	23 67 15 00 	ld.w	20[sp], r12
    295c:	5f 62       	add	-1, r12
    295e:	63 67 49 00 	st.w	r12, 72[sp]
    2962:	1d 30       	mov	r29, r6
    2964:	1a 38       	mov	r26, r7
    2966:	00 42       	mov	0, r8
    2968:	40 4e 24 40 	movhi	16420, r0, r9
    296c:	80 ff e2 43 	jarl	6d4e <___muldf3>, lp
    2970:	63 57 09 00 	st.w	r10, 8[sp]
    2974:	0b d0       	mov	r11, r26
    2976:	23 57 3d 00 	ld.w	60[sp], r10
    297a:	41 52       	add	1, r10
    297c:	63 57 3d 00 	st.w	r10, 60[sp]
    2980:	23 5f 29 00 	ld.w	40[sp], r11
    2984:	63 5f 45 00 	st.w	r11, 68[sp]
    2988:	b5 1d       	br	29be <__dtoa_r+0x59a>
    298a:	23 67 15 00 	ld.w	20[sp], r12
    298e:	63 67 49 00 	st.w	r12, 72[sp]
    2992:	23 57 19 00 	ld.w	24[sp], r10
    2996:	63 57 45 00 	st.w	r10, 68[sp]
    299a:	a5 15       	br	29be <__dtoa_r+0x59a>
    299c:	23 5f 15 00 	ld.w	20[sp], r11
    29a0:	63 5f 49 00 	st.w	r11, 72[sp]
    29a4:	23 67 19 00 	ld.w	24[sp], r12
    29a8:	63 67 45 00 	st.w	r12, 68[sp]
    29ac:	95 0d       	br	29be <__dtoa_r+0x59a>
    29ae:	23 57 15 00 	ld.w	20[sp], r10
    29b2:	63 57 49 00 	st.w	r10, 72[sp]
    29b6:	23 5f 19 00 	ld.w	24[sp], r11
    29ba:	63 5f 45 00 	st.w	r11, 68[sp]
    29be:	23 37 3d 00 	ld.w	60[sp], r6
    29c2:	80 ff 04 49 	jarl	72c6 <___floatsidf>, lp
    29c6:	0a 30       	mov	r10, r6
    29c8:	0b 38       	mov	r11, r7
    29ca:	23 47 09 00 	ld.w	8[sp], r8
    29ce:	1a 48       	mov	r26, r9
    29d0:	80 ff 7e 43 	jarl	6d4e <___muldf3>, lp
    29d4:	0a 30       	mov	r10, r6
    29d6:	0b 38       	mov	r11, r7
    29d8:	00 42       	mov	0, r8
    29da:	40 4e 1c 40 	movhi	16412, r0, r9
    29de:	80 ff c4 42 	jarl	6ca2 <___adddf3>, lp
    29e2:	0a e8       	mov	r10, r29
    29e4:	40 e6 c0 fc 	movhi	-832, r0, r28
    29e8:	cb e1       	add	r11, r28
    29ea:	23 67 45 00 	ld.w	68[sp], r12
    29ee:	60 62       	cmp	0, r12
    29f0:	9a 25       	bne	2a32 <__dtoa_r+0x60e>
    29f2:	23 37 09 00 	ld.w	8[sp], r6
    29f6:	1a 38       	mov	r26, r7
    29f8:	00 42       	mov	0, r8
    29fa:	40 4e 14 40 	movhi	16404, r0, r9
    29fe:	80 ff f4 42 	jarl	6cf2 <___subdf3>, lp
    2a02:	0a d0       	mov	r10, r26
    2a04:	0b c0       	mov	r11, r24
    2a06:	0a 30       	mov	r10, r6
    2a08:	0b 38       	mov	r11, r7
    2a0a:	1d 40       	mov	r29, r8
    2a0c:	1c 48       	mov	r28, r9
    2a0e:	80 ff aa 47 	jarl	71b8 <___gtdf2>, lp
    2a12:	60 52       	cmp	0, r10
    2a14:	ef 07 9f 07 	bgt	31b2 <__dtoa_r+0xd8e>
    2a18:	1a 30       	mov	r26, r6
    2a1a:	18 38       	mov	r24, r7
    2a1c:	1d 40       	mov	r29, r8
    2a1e:	40 4e 00 80 	movhi	-32768, r0, r9
    2a22:	dc 49       	add	r28, r9
    2a24:	80 ff 48 48 	jarl	726c <___ltdf2>, lp
    2a28:	60 52       	cmp	0, r10
    2a2a:	e6 07 61 07 	blt	318a <__dtoa_r+0xd66>
    2a2e:	80 07 d0 02 	jr	2cfe <__dtoa_r+0x8da>
    2a32:	23 57 25 00 	ld.w	36[sp], r10
    2a36:	60 52       	cmp	0, r10
    2a38:	e2 07 85 01 	be	2bbc <__dtoa_r+0x798>
    2a3c:	23 57 45 00 	ld.w	68[sp], r10
    2a40:	c3 52       	shl	3, r10
    2a42:	2b 06 2c 7a 	mov	0x7a2c, r11
    2a46:	00 00 
    2a48:	cb 51       	add	r11, r10
    2a4a:	00 32       	mov	0, r6
    2a4c:	40 3e e0 3f 	movhi	16352, r0, r7
    2a50:	2a 47 01 00 	ld.w	0[r10], r8
    2a54:	2a 4f 05 00 	ld.w	4[r10], r9
    2a58:	80 ff 36 45 	jarl	6f8e <___divdf3>, lp
    2a5c:	0a 30       	mov	r10, r6
    2a5e:	0b 38       	mov	r11, r7
    2a60:	1d 40       	mov	r29, r8
    2a62:	1c 48       	mov	r28, r9
    2a64:	80 ff 8e 42 	jarl	6cf2 <___subdf3>, lp
    2a68:	0a c0       	mov	r10, r24
    2a6a:	0b a8       	mov	r11, r21
    2a6c:	23 37 09 00 	ld.w	8[sp], r6
    2a70:	1a 38       	mov	r26, r7
    2a72:	80 ff ea 48 	jarl	735c <___fixdfsi>, lp
    2a76:	0a e0       	mov	r10, r28
    2a78:	0a 30       	mov	r10, r6
    2a7a:	80 ff 4c 48 	jarl	72c6 <___floatsidf>, lp
    2a7e:	23 37 09 00 	ld.w	8[sp], r6
    2a82:	1a 38       	mov	r26, r7
    2a84:	0a 40       	mov	r10, r8
    2a86:	0b 48       	mov	r11, r9
    2a88:	80 ff 6a 42 	jarl	6cf2 <___subdf3>, lp
    2a8c:	0a e8       	mov	r10, r29
    2a8e:	0b d0       	mov	r11, r26
    2a90:	63 57 3d 00 	st.w	r10, 60[sp]
    2a94:	63 5f 4d 00 	st.w	r11, 76[sp]
    2a98:	1c 56 30 00 	addi	48, r28, r10
    2a9c:	57 57 00 00 	st.b	r10, 0[r23]
    2aa0:	17 e6 01 00 	addi	1, r23, r28
    2aa4:	63 c7 51 00 	st.w	r24, 80[sp]
    2aa8:	63 af 55 00 	st.w	r21, 84[sp]
    2aac:	1d 30       	mov	r29, r6
    2aae:	0b 38       	mov	r11, r7
    2ab0:	18 40       	mov	r24, r8
    2ab2:	15 48       	mov	r21, r9
    2ab4:	80 ff b8 47 	jarl	726c <___ltdf2>, lp
    2ab8:	60 52       	cmp	0, r10
    2aba:	e6 07 31 0a 	blt	34ea <__dtoa_r+0x10c6>
    2abe:	00 32       	mov	0, r6
    2ac0:	40 3e f0 3f 	movhi	16368, r0, r7
    2ac4:	1d 40       	mov	r29, r8
    2ac6:	1a 48       	mov	r26, r9
    2ac8:	80 ff 2a 42 	jarl	6cf2 <___subdf3>, lp
    2acc:	18 30       	mov	r24, r6
    2ace:	15 38       	mov	r21, r7
    2ad0:	0a 40       	mov	r10, r8
    2ad2:	0b 48       	mov	r11, r9
    2ad4:	80 ff e4 46 	jarl	71b8 <___gtdf2>, lp
    2ad8:	60 52       	cmp	0, r10
    2ada:	ef 07 8f 03 	bgt	2e68 <__dtoa_r+0xa44>
    2ade:	23 67 45 00 	ld.w	68[sp], r12
    2ae2:	61 62       	cmp	1, r12
    2ae4:	e7 07 1b 02 	ble	2cfe <__dtoa_r+0x8da>
    2ae8:	d7 61       	add	r23, r12
    2aea:	63 67 09 00 	st.w	r12, 8[sp]
    2aee:	63 a7 61 00 	st.w	r20, 96[sp]
    2af2:	63 b7 65 00 	st.w	r22, 100[sp]
    2af6:	63 cf 45 00 	st.w	r25, 68[sp]
    2afa:	63 bf 59 00 	st.w	r23, 88[sp]
    2afe:	63 df 5d 00 	st.w	r27, 92[sp]
    2b02:	23 b7 3d 00 	ld.w	60[sp], r22
    2b06:	23 bf 4d 00 	ld.w	76[sp], r23
    2b0a:	23 a7 51 00 	ld.w	80[sp], r20
    2b0e:	23 af 55 00 	ld.w	84[sp], r21
    2b12:	e5 15       	br	2b3e <__dtoa_r+0x71a>
    2b14:	00 32       	mov	0, r6
    2b16:	40 3e f0 3f 	movhi	16368, r0, r7
    2b1a:	1d 40       	mov	r29, r8
    2b1c:	1b 48       	mov	r27, r9
    2b1e:	80 ff d4 41 	jarl	6cf2 <___subdf3>, lp
    2b22:	0a 30       	mov	r10, r6
    2b24:	0b 38       	mov	r11, r7
    2b26:	1a 40       	mov	r26, r8
    2b28:	19 48       	mov	r25, r9
    2b2a:	80 ff 42 47 	jarl	726c <___ltdf2>, lp
    2b2e:	60 52       	cmp	0, r10
    2b30:	e6 07 43 03 	blt	2e72 <__dtoa_r+0xa4e>
    2b34:	23 57 09 00 	ld.w	8[sp], r10
    2b38:	ea e1       	cmp	r10, r28
    2b3a:	e2 07 b1 01 	be	2cea <__dtoa_r+0x8c6>
    2b3e:	14 30       	mov	r20, r6
    2b40:	15 38       	mov	r21, r7
    2b42:	00 42       	mov	0, r8
    2b44:	40 4e 24 40 	movhi	16420, r0, r9
    2b48:	80 ff 06 42 	jarl	6d4e <___muldf3>, lp
    2b4c:	0a d0       	mov	r10, r26
    2b4e:	0b c8       	mov	r11, r25
    2b50:	0a a0       	mov	r10, r20
    2b52:	0b a8       	mov	r11, r21
    2b54:	16 30       	mov	r22, r6
    2b56:	17 38       	mov	r23, r7
    2b58:	00 42       	mov	0, r8
    2b5a:	40 4e 24 40 	movhi	16420, r0, r9
    2b5e:	80 ff f0 41 	jarl	6d4e <___muldf3>, lp
    2b62:	0a e8       	mov	r10, r29
    2b64:	0b d8       	mov	r11, r27
    2b66:	0a 30       	mov	r10, r6
    2b68:	0b 38       	mov	r11, r7
    2b6a:	80 ff f2 47 	jarl	735c <___fixdfsi>, lp
    2b6e:	0a c0       	mov	r10, r24
    2b70:	0a 30       	mov	r10, r6
    2b72:	80 ff 54 47 	jarl	72c6 <___floatsidf>, lp
    2b76:	1d 30       	mov	r29, r6
    2b78:	1b 38       	mov	r27, r7
    2b7a:	0a 40       	mov	r10, r8
    2b7c:	0b 48       	mov	r11, r9
    2b7e:	80 ff 74 41 	jarl	6cf2 <___subdf3>, lp
    2b82:	0a e8       	mov	r10, r29
    2b84:	0b d8       	mov	r11, r27
    2b86:	0a b0       	mov	r10, r22
    2b88:	0b b8       	mov	r11, r23
    2b8a:	18 c6 30 00 	addi	48, r24, r24
    2b8e:	5c c7 00 00 	st.b	r24, 0[r28]
    2b92:	41 e2       	add	1, r28
    2b94:	0a 30       	mov	r10, r6
    2b96:	0b 38       	mov	r11, r7
    2b98:	1a 40       	mov	r26, r8
    2b9a:	19 48       	mov	r25, r9
    2b9c:	80 ff d0 46 	jarl	726c <___ltdf2>, lp
    2ba0:	60 52       	cmp	0, r10
    2ba2:	9e bd       	bge	2b14 <__dtoa_r+0x6f0>
    2ba4:	23 cf 45 00 	ld.w	68[sp], r25
    2ba8:	23 bf 59 00 	ld.w	88[sp], r23
    2bac:	23 df 5d 00 	ld.w	92[sp], r27
    2bb0:	23 57 49 00 	ld.w	72[sp], r10
    2bb4:	63 57 15 00 	st.w	r10, 20[sp]
    2bb8:	80 07 48 09 	jr	3500 <__dtoa_r+0x10dc>
    2bbc:	23 57 45 00 	ld.w	68[sp], r10
    2bc0:	c3 52       	shl	3, r10
    2bc2:	2b 06 2c 7a 	mov	0x7a2c, r11
    2bc6:	00 00 
    2bc8:	cb 51       	add	r11, r10
    2bca:	2a 37 01 00 	ld.w	0[r10], r6
    2bce:	2a 3f 05 00 	ld.w	4[r10], r7
    2bd2:	1d 40       	mov	r29, r8
    2bd4:	1c 48       	mov	r28, r9
    2bd6:	80 ff 78 41 	jarl	6d4e <___muldf3>, lp
    2bda:	63 57 3d 00 	st.w	r10, 60[sp]
    2bde:	63 5f 4d 00 	st.w	r11, 76[sp]
    2be2:	23 37 09 00 	ld.w	8[sp], r6
    2be6:	1a 38       	mov	r26, r7
    2be8:	80 ff 74 47 	jarl	735c <___fixdfsi>, lp
    2bec:	0a e8       	mov	r10, r29
    2bee:	0a 30       	mov	r10, r6
    2bf0:	80 ff d6 46 	jarl	72c6 <___floatsidf>, lp
    2bf4:	23 37 09 00 	ld.w	8[sp], r6
    2bf8:	1a 38       	mov	r26, r7
    2bfa:	0a 40       	mov	r10, r8
    2bfc:	0b 48       	mov	r11, r9
    2bfe:	80 ff f4 40 	jarl	6cf2 <___subdf3>, lp
    2c02:	0a c0       	mov	r10, r24
    2c04:	0b d0       	mov	r11, r26
    2c06:	1d ee 30 00 	addi	48, r29, r29
    2c0a:	57 ef 00 00 	st.b	r29, 0[r23]
    2c0e:	17 e6 01 00 	addi	1, r23, r28
    2c12:	23 67 45 00 	ld.w	68[sp], r12
    2c16:	61 62       	cmp	1, r12
    2c18:	ba 35       	bne	2c7e <__dtoa_r+0x85a>
    2c1a:	23 37 3d 00 	ld.w	60[sp], r6
    2c1e:	23 3f 4d 00 	ld.w	76[sp], r7
    2c22:	00 42       	mov	0, r8
    2c24:	40 4e e0 3f 	movhi	16352, r0, r9
    2c28:	80 ff 7a 40 	jarl	6ca2 <___adddf3>, lp
    2c2c:	0a 30       	mov	r10, r6
    2c2e:	0b 38       	mov	r11, r7
    2c30:	18 40       	mov	r24, r8
    2c32:	1a 48       	mov	r26, r9
    2c34:	80 ff 38 46 	jarl	726c <___ltdf2>, lp
    2c38:	60 52       	cmp	0, r10
    2c3a:	e6 07 4f 02 	blt	2e88 <__dtoa_r+0xa64>
    2c3e:	00 32       	mov	0, r6
    2c40:	40 3e e0 3f 	movhi	16352, r0, r7
    2c44:	23 47 3d 00 	ld.w	60[sp], r8
    2c48:	23 4f 4d 00 	ld.w	76[sp], r9
    2c4c:	80 ff a6 40 	jarl	6cf2 <___subdf3>, lp
    2c50:	0a 30       	mov	r10, r6
    2c52:	0b 38       	mov	r11, r7
    2c54:	18 40       	mov	r24, r8
    2c56:	1a 48       	mov	r26, r9
    2c58:	80 ff 60 45 	jarl	71b8 <___gtdf2>, lp
    2c5c:	60 52       	cmp	0, r10
    2c5e:	87 55       	ble	2cfe <__dtoa_r+0x8da>
    2c60:	1c 50       	mov	r28, r10
    2c62:	20 66 30 00 	movea	48, r0, r12
    2c66:	0a e0       	mov	r10, r28
    2c68:	5f 52       	add	-1, r10
    2c6a:	0a 5f 00 00 	ld.b	0[r10], r11
    2c6e:	ec 59       	cmp	r12, r11
    2c70:	b2 fd       	be	2c66 <__dtoa_r+0x842>
    2c72:	23 57 49 00 	ld.w	72[sp], r10
    2c76:	63 57 15 00 	st.w	r10, 20[sp]
    2c7a:	80 07 86 08 	jr	3500 <__dtoa_r+0x10dc>
    2c7e:	01 ea       	mov	1, r29
    2c80:	63 a7 09 00 	st.w	r20, 8[sp]
    2c84:	1c a0       	mov	r28, r20
    2c86:	1b a8       	mov	r27, r21
    2c88:	16 c0       	mov	r22, r24
    2c8a:	23 b7 45 00 	ld.w	68[sp], r22
    2c8e:	19 d0       	mov	r25, r26
    2c90:	0a 30       	mov	r10, r6
    2c92:	0b 38       	mov	r11, r7
    2c94:	00 42       	mov	0, r8
    2c96:	40 4e 24 40 	movhi	16420, r0, r9
    2c9a:	80 ff b4 40 	jarl	6d4e <___muldf3>, lp
    2c9e:	0a e0       	mov	r10, r28
    2ca0:	0b d8       	mov	r11, r27
    2ca2:	0a 30       	mov	r10, r6
    2ca4:	0b 38       	mov	r11, r7
    2ca6:	80 ff b6 46 	jarl	735c <___fixdfsi>, lp
    2caa:	0a c8       	mov	r10, r25
    2cac:	0a 30       	mov	r10, r6
    2cae:	80 ff 18 46 	jarl	72c6 <___floatsidf>, lp
    2cb2:	1c 30       	mov	r28, r6
    2cb4:	1b 38       	mov	r27, r7
    2cb6:	0a 40       	mov	r10, r8
    2cb8:	0b 48       	mov	r11, r9
    2cba:	80 ff 38 40 	jarl	6cf2 <___subdf3>, lp
    2cbe:	17 60       	mov	r23, r12
    2cc0:	dd 61       	add	r29, r12
    2cc2:	19 ce 30 00 	addi	48, r25, r25
    2cc6:	4c cf 00 00 	st.b	r25, 0[r12]
    2cca:	41 ea       	add	1, r29
    2ccc:	fd b1       	cmp	r29, r22
    2cce:	9a e5       	bne	2c90 <__dtoa_r+0x86c>
    2cd0:	18 b0       	mov	r24, r22
    2cd2:	1a c8       	mov	r26, r25
    2cd4:	14 e0       	mov	r20, r28
    2cd6:	23 a7 09 00 	ld.w	8[sp], r20
    2cda:	15 d8       	mov	r21, r27
    2cdc:	0a c0       	mov	r10, r24
    2cde:	0b d0       	mov	r11, r26
    2ce0:	23 57 45 00 	ld.w	68[sp], r10
    2ce4:	5f 52       	add	-1, r10
    2ce6:	ca e1       	add	r10, r28
    2ce8:	95 9d       	br	2c1a <__dtoa_r+0x7f6>
    2cea:	23 a7 61 00 	ld.w	96[sp], r20
    2cee:	23 b7 65 00 	ld.w	100[sp], r22
    2cf2:	23 cf 45 00 	ld.w	68[sp], r25
    2cf6:	23 bf 59 00 	ld.w	88[sp], r23
    2cfa:	23 df 5d 00 	ld.w	92[sp], r27
    2cfe:	23 5f 1d 00 	ld.w	28[sp], r11
    2d02:	63 5f 09 00 	st.w	r11, 8[sp]
    2d06:	23 d7 31 00 	ld.w	48[sp], r26
    2d0a:	23 57 69 00 	ld.w	104[sp], r10
    2d0e:	60 52       	cmp	0, r10
    2d10:	e6 07 29 02 	blt	2f38 <__dtoa_r+0xb14>
    2d14:	23 67 15 00 	ld.w	20[sp], r12
    2d18:	6e 62       	cmp	14, r12
    2d1a:	ef 07 1f 02 	bgt	2f38 <__dtoa_r+0xb14>
    2d1e:	0c 50       	mov	r12, r10
    2d20:	c3 52       	shl	3, r10
    2d22:	2b 06 34 7a 	mov	0x7a34, r11
    2d26:	00 00 
    2d28:	cb 51       	add	r11, r10
    2d2a:	2a a7 01 00 	ld.w	0[r10], r20
    2d2e:	2a af 05 00 	ld.w	4[r10], r21
    2d32:	23 67 a1 00 	ld.w	160[sp], r12
    2d36:	60 62       	cmp	0, r12
    2d38:	a6 2d       	blt	2d8c <__dtoa_r+0x968>
    2d3a:	23 37 09 00 	ld.w	8[sp], r6
    2d3e:	1a 38       	mov	r26, r7
    2d40:	14 40       	mov	r20, r8
    2d42:	15 48       	mov	r21, r9
    2d44:	80 ff 4a 42 	jarl	6f8e <___divdf3>, lp
    2d48:	0a 30       	mov	r10, r6
    2d4a:	0b 38       	mov	r11, r7
    2d4c:	80 ff 10 46 	jarl	735c <___fixdfsi>, lp
    2d50:	0a c0       	mov	r10, r24
    2d52:	0a 30       	mov	r10, r6
    2d54:	80 ff 72 45 	jarl	72c6 <___floatsidf>, lp
    2d58:	0a 30       	mov	r10, r6
    2d5a:	0b 38       	mov	r11, r7
    2d5c:	14 40       	mov	r20, r8
    2d5e:	15 48       	mov	r21, r9
    2d60:	80 ff ee 3f 	jarl	6d4e <___muldf3>, lp
    2d64:	23 37 09 00 	ld.w	8[sp], r6
    2d68:	1a 38       	mov	r26, r7
    2d6a:	0a 40       	mov	r10, r8
    2d6c:	0b 48       	mov	r11, r9
    2d6e:	80 ff 84 3f 	jarl	6cf2 <___subdf3>, lp
    2d72:	0a 40       	mov	r10, r8
    2d74:	0b 48       	mov	r11, r9
    2d76:	18 66 30 00 	addi	48, r24, r12
    2d7a:	57 67 00 00 	st.b	r12, 0[r23]
    2d7e:	17 e6 01 00 	addi	1, r23, r28
    2d82:	23 67 19 00 	ld.w	24[sp], r12
    2d86:	61 62       	cmp	1, r12
    2d88:	aa 25       	bne	2dcc <__dtoa_r+0x9a8>
    2d8a:	c5 45       	br	2e12 <__dtoa_r+0x9ee>
    2d8c:	23 57 19 00 	ld.w	24[sp], r10
    2d90:	60 52       	cmp	0, r10
    2d92:	cf d5       	bgt	2d3a <__dtoa_r+0x916>
    2d94:	e6 07 ff 03 	blt	3192 <__dtoa_r+0xd6e>
    2d98:	14 30       	mov	r20, r6
    2d9a:	15 38       	mov	r21, r7
    2d9c:	00 42       	mov	0, r8
    2d9e:	40 4e 14 40 	movhi	16404, r0, r9
    2da2:	80 ff ac 3f 	jarl	6d4e <___muldf3>, lp
    2da6:	0a 30       	mov	r10, r6
    2da8:	0b 38       	mov	r11, r7
    2daa:	23 47 09 00 	ld.w	8[sp], r8
    2dae:	1a 48       	mov	r26, r9
    2db0:	80 ff 62 44 	jarl	7212 <___gedf2>, lp
    2db4:	60 52       	cmp	0, r10
    2db6:	ee 07 e5 03 	bge	319a <__dtoa_r+0xd76>
    2dba:	23 5f 15 00 	ld.w	20[sp], r11
    2dbe:	63 5f 49 00 	st.w	r11, 72[sp]
    2dc2:	00 aa       	mov	0, r21
    2dc4:	63 07 1d 00 	st.w	r0, 28[sp]
    2dc8:	80 07 fa 03 	jr	31c2 <__dtoa_r+0xd9e>
    2dcc:	0a 30       	mov	r10, r6
    2dce:	0b 38       	mov	r11, r7
    2dd0:	00 42       	mov	0, r8
    2dd2:	40 4e 24 40 	movhi	16420, r0, r9
    2dd6:	80 ff 78 3f 	jarl	6d4e <___muldf3>, lp
    2dda:	0a b0       	mov	r10, r22
    2ddc:	0b d0       	mov	r11, r26
    2dde:	01 ea       	mov	1, r29
    2de0:	0a 30       	mov	r10, r6
    2de2:	0b 38       	mov	r11, r7
    2de4:	00 42       	mov	0, r8
    2de6:	00 4a       	mov	0, r9
    2de8:	80 ff 76 43 	jarl	715e <___nedf2>, lp
    2dec:	60 52       	cmp	0, r10
    2dee:	aa 05       	bne	2df2 <__dtoa_r+0x9ce>
    2df0:	00 ea       	mov	0, r29
    2df2:	9d 00       	zxb	r29
    2df4:	60 ea       	cmp	0, r29
    2df6:	e2 07 0b 07 	be	3500 <__dtoa_r+0x10dc>
    2dfa:	17 ee 02 00 	addi	2, r23, r29
    2dfe:	23 e7 39 00 	ld.w	56[sp], r28
    2e02:	d7 e1       	add	r23, r28
    2e04:	63 cf 11 00 	st.w	r25, 16[sp]
    2e08:	63 bf 19 00 	st.w	r23, 24[sp]
    2e0c:	1c c8       	mov	r28, r25
    2e0e:	1b b8       	mov	r27, r23
    2e10:	95 6d       	br	2ee2 <__dtoa_r+0xabe>
    2e12:	08 30       	mov	r8, r6
    2e14:	09 38       	mov	r9, r7
    2e16:	80 ff 8c 3e 	jarl	6ca2 <___adddf3>, lp
    2e1a:	0a e8       	mov	r10, r29
    2e1c:	0b d0       	mov	r11, r26
    2e1e:	14 30       	mov	r20, r6
    2e20:	15 38       	mov	r21, r7
    2e22:	0a 40       	mov	r10, r8
    2e24:	0b 48       	mov	r11, r9
    2e26:	80 ff 46 44 	jarl	726c <___ltdf2>, lp
    2e2a:	60 52       	cmp	0, r10
    2e2c:	d6 35       	blt	2e96 <__dtoa_r+0xa72>
    2e2e:	14 30       	mov	r20, r6
    2e30:	15 38       	mov	r21, r7
    2e32:	1d 40       	mov	r29, r8
    2e34:	1a 48       	mov	r26, r9
    2e36:	80 ff ce 42 	jarl	7104 <___eqdf2>, lp
    2e3a:	60 52       	cmp	0, r10
    2e3c:	ea 07 c5 06 	bne	3500 <__dtoa_r+0x10dc>
    2e40:	d8 c6 01 00 	andi	1, r24, r24
    2e44:	9a 2d       	bne	2e96 <__dtoa_r+0xa72>
    2e46:	80 07 ba 06 	jr	3500 <__dtoa_r+0x10dc>
    2e4a:	1c 56 ff ff 	addi	-1, r28, r10
    2e4e:	ea b9       	cmp	r10, r23
    2e50:	9a 25       	bne	2e92 <__dtoa_r+0xa6e>
    2e52:	23 67 15 00 	ld.w	20[sp], r12
    2e56:	41 62       	add	1, r12
    2e58:	63 67 15 00 	st.w	r12, 20[sp]
    2e5c:	20 56 30 00 	movea	48, r0, r10
    2e60:	5c 57 ff ff 	st.b	r10, -1[r28]
    2e64:	1c 50       	mov	r28, r10
    2e66:	f5 1d       	br	2ea4 <__dtoa_r+0xa80>
    2e68:	23 57 49 00 	ld.w	72[sp], r10
    2e6c:	63 57 15 00 	st.w	r10, 20[sp]
    2e70:	b5 15       	br	2e96 <__dtoa_r+0xa72>
    2e72:	23 cf 45 00 	ld.w	68[sp], r25
    2e76:	23 bf 59 00 	ld.w	88[sp], r23
    2e7a:	23 df 5d 00 	ld.w	92[sp], r27
    2e7e:	23 5f 49 00 	ld.w	72[sp], r11
    2e82:	63 5f 15 00 	st.w	r11, 20[sp]
    2e86:	85 0d       	br	2e96 <__dtoa_r+0xa72>
    2e88:	23 67 49 00 	ld.w	72[sp], r12
    2e8c:	63 67 15 00 	st.w	r12, 20[sp]
    2e90:	b5 05       	br	2e96 <__dtoa_r+0xa72>
    2e92:	0a e0       	mov	r10, r28
    2e94:	b5 05       	br	2e9a <__dtoa_r+0xa76>
    2e96:	20 5e 39 00 	movea	57, r0, r11
    2e9a:	1c 57 ff ff 	ld.b	-1[r28], r10
    2e9e:	eb 51       	cmp	r11, r10
    2ea0:	d2 d5       	be	2e4a <__dtoa_r+0xa26>
    2ea2:	1c 50       	mov	r28, r10
    2ea4:	0a 5f ff ff 	ld.b	-1[r10], r11
    2ea8:	41 5a       	add	1, r11
    2eaa:	4a 5f ff ff 	st.b	r11, -1[r10]
    2eae:	80 07 52 06 	jr	3500 <__dtoa_r+0x10dc>
    2eb2:	0a 30       	mov	r10, r6
    2eb4:	0b 38       	mov	r11, r7
    2eb6:	00 42       	mov	0, r8
    2eb8:	40 4e 24 40 	movhi	16420, r0, r9
    2ebc:	80 ff 92 3e 	jarl	6d4e <___muldf3>, lp
    2ec0:	0a b0       	mov	r10, r22
    2ec2:	0b d0       	mov	r11, r26
    2ec4:	41 ea       	add	1, r29
    2ec6:	01 e2       	mov	1, r28
    2ec8:	0a 30       	mov	r10, r6
    2eca:	0b 38       	mov	r11, r7
    2ecc:	00 42       	mov	0, r8
    2ece:	00 4a       	mov	0, r9
    2ed0:	80 ff 8e 42 	jarl	715e <___nedf2>, lp
    2ed4:	60 52       	cmp	0, r10
    2ed6:	aa 05       	bne	2eda <__dtoa_r+0xab6>
    2ed8:	00 e2       	mov	0, r28
    2eda:	9c 00       	zxb	r28
    2edc:	60 e2       	cmp	0, r28
    2ede:	e2 07 17 06 	be	34f4 <__dtoa_r+0x10d0>
    2ee2:	16 30       	mov	r22, r6
    2ee4:	1a 38       	mov	r26, r7
    2ee6:	14 40       	mov	r20, r8
    2ee8:	15 48       	mov	r21, r9
    2eea:	80 ff a4 40 	jarl	6f8e <___divdf3>, lp
    2eee:	0a 30       	mov	r10, r6
    2ef0:	0b 38       	mov	r11, r7
    2ef2:	80 ff 6a 44 	jarl	735c <___fixdfsi>, lp
    2ef6:	0a c0       	mov	r10, r24
    2ef8:	0a 30       	mov	r10, r6
    2efa:	80 ff cc 43 	jarl	72c6 <___floatsidf>, lp
    2efe:	0a 30       	mov	r10, r6
    2f00:	0b 38       	mov	r11, r7
    2f02:	14 40       	mov	r20, r8
    2f04:	15 48       	mov	r21, r9
    2f06:	80 ff 48 3e 	jarl	6d4e <___muldf3>, lp
    2f0a:	16 30       	mov	r22, r6
    2f0c:	1a 38       	mov	r26, r7
    2f0e:	0a 40       	mov	r10, r8
    2f10:	0b 48       	mov	r11, r9
    2f12:	80 ff e0 3d 	jarl	6cf2 <___subdf3>, lp
    2f16:	0a 40       	mov	r10, r8
    2f18:	0b 48       	mov	r11, r9
    2f1a:	1d d8       	mov	r29, r27
    2f1c:	18 66 30 00 	addi	48, r24, r12
    2f20:	5d 67 ff ff 	st.b	r12, -1[r29]
    2f24:	f9 e9       	cmp	r25, r29
    2f26:	ea c5       	bne	2eb2 <__dtoa_r+0xa8e>
    2f28:	23 cf 11 00 	ld.w	16[sp], r25
    2f2c:	1d e0       	mov	r29, r28
    2f2e:	17 d8       	mov	r23, r27
    2f30:	23 bf 19 00 	ld.w	24[sp], r23
    2f34:	bf 07 de fe 	jr	2e12 <__dtoa_r+0x9ee>
    2f38:	23 5f 25 00 	ld.w	36[sp], r11
    2f3c:	60 5a       	cmp	0, r11
    2f3e:	82 45       	be	2fbe <__dtoa_r+0xb9a>
    2f40:	23 67 9d 00 	ld.w	156[sp], r12
    2f44:	61 62       	cmp	1, r12
    2f46:	cf 15       	bgt	2f6e <__dtoa_r+0xb4a>
    2f48:	23 5f 41 00 	ld.w	64[sp], r11
    2f4c:	60 5a       	cmp	0, r11
    2f4e:	f2 05       	be	2f5c <__dtoa_r+0xb38>
    2f50:	0a 56 33 04 	addi	1075, r10, r10
    2f54:	23 e7 21 00 	ld.w	32[sp], r28
    2f58:	14 e8       	mov	r20, r29
    2f5a:	95 2d       	br	2fac <__dtoa_r+0xb88>
    2f5c:	23 57 6d 00 	ld.w	108[sp], r10
    2f60:	20 5e 36 00 	movea	54, r0, r11
    2f64:	8b 51       	subr	r11, r10
    2f66:	23 e7 21 00 	ld.w	32[sp], r28
    2f6a:	14 e8       	mov	r20, r29
    2f6c:	85 25       	br	2fac <__dtoa_r+0xb88>
    2f6e:	23 e7 19 00 	ld.w	24[sp], r28
    2f72:	5f e2       	add	-1, r28
    2f74:	23 67 21 00 	ld.w	32[sp], r12
    2f78:	fc 61       	cmp	r28, r12
    2f7a:	b6 05       	blt	2f80 <__dtoa_r+0xb5c>
    2f7c:	8c e1       	subr	r12, r28
    2f7e:	c5 0d       	br	2f96 <__dtoa_r+0xb72>
    2f80:	23 57 21 00 	ld.w	32[sp], r10
    2f84:	9c 51       	subr	r28, r10
    2f86:	23 5f 2d 00 	ld.w	44[sp], r11
    2f8a:	ca 59       	add	r10, r11
    2f8c:	63 5f 2d 00 	st.w	r11, 44[sp]
    2f90:	63 e7 21 00 	st.w	r28, 32[sp]
    2f94:	00 e2       	mov	0, r28
    2f96:	23 67 19 00 	ld.w	24[sp], r12
    2f9a:	60 62       	cmp	0, r12
    2f9c:	de 05       	bge	2fa6 <__dtoa_r+0xb82>
    2f9e:	0c e8       	mov	r12, r29
    2fa0:	94 e9       	subr	r20, r29
    2fa2:	00 52       	mov	0, r10
    2fa4:	c5 05       	br	2fac <__dtoa_r+0xb88>
    2fa6:	14 e8       	mov	r20, r29
    2fa8:	23 57 19 00 	ld.w	24[sp], r10
    2fac:	ca a1       	add	r10, r20
    2fae:	ca b1       	add	r10, r22
    2fb0:	1b 30       	mov	r27, r6
    2fb2:	01 3a       	mov	1, r7
    2fb4:	80 ff fa 12 	jarl	42ae <___i2b>, lp
    2fb8:	63 57 1d 00 	st.w	r10, 28[sp]
    2fbc:	e5 05       	br	2fc8 <__dtoa_r+0xba4>
    2fbe:	23 e7 21 00 	ld.w	32[sp], r28
    2fc2:	14 e8       	mov	r20, r29
    2fc4:	63 07 1d 00 	st.w	r0, 28[sp]
    2fc8:	60 ea       	cmp	0, r29
    2fca:	97 0d       	ble	2fdc <__dtoa_r+0xbb8>
    2fcc:	60 b2       	cmp	0, r22
    2fce:	f7 05       	ble	2fdc <__dtoa_r+0xbb8>
    2fd0:	fd b1       	cmp	r29, r22
    2fd2:	f6 ef 2e 53 	cmov	le, r22, r29, r10
    2fd6:	aa a1       	sub	r10, r20
    2fd8:	aa e9       	sub	r10, r29
    2fda:	aa b1       	sub	r10, r22
    2fdc:	23 57 21 00 	ld.w	32[sp], r10
    2fe0:	60 52       	cmp	0, r10
    2fe2:	b7 2d       	ble	3038 <__dtoa_r+0xc14>
    2fe4:	23 5f 25 00 	ld.w	36[sp], r11
    2fe8:	60 5a       	cmp	0, r11
    2fea:	82 25       	be	302a <__dtoa_r+0xc06>
    2fec:	60 e2       	cmp	0, r28
    2fee:	c7 15       	ble	3016 <__dtoa_r+0xbf2>
    2ff0:	1b 30       	mov	r27, r6
    2ff2:	23 3f 1d 00 	ld.w	28[sp], r7
    2ff6:	1c 40       	mov	r28, r8
    2ff8:	80 ff 14 14 	jarl	440c <___pow5mult>, lp
    2ffc:	63 57 1d 00 	st.w	r10, 28[sp]
    3000:	1b 30       	mov	r27, r6
    3002:	0a 38       	mov	r10, r7
    3004:	19 40       	mov	r25, r8
    3006:	80 ff be 12 	jarl	42c4 <___multiply>, lp
    300a:	0a c0       	mov	r10, r24
    300c:	1b 30       	mov	r27, r6
    300e:	19 38       	mov	r25, r7
    3010:	80 ff 88 10 	jarl	4098 <__Bfree>, lp
    3014:	18 c8       	mov	r24, r25
    3016:	23 47 21 00 	ld.w	32[sp], r8
    301a:	bc 41       	sub	r28, r8
    301c:	e2 0d       	be	3038 <__dtoa_r+0xc14>
    301e:	1b 30       	mov	r27, r6
    3020:	19 38       	mov	r25, r7
    3022:	80 ff ea 13 	jarl	440c <___pow5mult>, lp
    3026:	0a c8       	mov	r10, r25
    3028:	85 0d       	br	3038 <__dtoa_r+0xc14>
    302a:	1b 30       	mov	r27, r6
    302c:	19 38       	mov	r25, r7
    302e:	23 47 21 00 	ld.w	32[sp], r8
    3032:	80 ff da 13 	jarl	440c <___pow5mult>, lp
    3036:	0a c8       	mov	r10, r25
    3038:	1b 30       	mov	r27, r6
    303a:	01 3a       	mov	1, r7
    303c:	80 ff 72 12 	jarl	42ae <___i2b>, lp
    3040:	0a a8       	mov	r10, r21
    3042:	23 67 2d 00 	ld.w	44[sp], r12
    3046:	60 62       	cmp	0, r12
    3048:	f7 05       	ble	3056 <__dtoa_r+0xc32>
    304a:	1b 30       	mov	r27, r6
    304c:	0a 38       	mov	r10, r7
    304e:	0c 40       	mov	r12, r8
    3050:	80 ff bc 13 	jarl	440c <___pow5mult>, lp
    3054:	0a a8       	mov	r10, r21
    3056:	23 57 9d 00 	ld.w	156[sp], r10
    305a:	61 52       	cmp	1, r10
    305c:	af 15       	bgt	3080 <__dtoa_r+0xc5c>
    305e:	23 5f 09 00 	ld.w	8[sp], r11
    3062:	60 5a       	cmp	0, r11
    3064:	8a 15       	bne	3084 <__dtoa_r+0xc60>
    3066:	2a 06 ff ff 	mov	0xfffff, r10
    306a:	0f 00 
    306c:	5a 51       	and	r26, r10
    306e:	da 0d       	bne	3088 <__dtoa_r+0xc64>
    3070:	40 66 f0 7f 	movhi	32752, r0, r12
    3074:	4c d1       	and	r12, r26
    3076:	b2 0d       	be	308c <__dtoa_r+0xc68>
    3078:	41 a2       	add	1, r20
    307a:	41 b2       	add	1, r22
    307c:	01 e2       	mov	1, r28
    307e:	85 0d       	br	308e <__dtoa_r+0xc6a>
    3080:	00 e2       	mov	0, r28
    3082:	e5 05       	br	308e <__dtoa_r+0xc6a>
    3084:	00 e2       	mov	0, r28
    3086:	c5 05       	br	308e <__dtoa_r+0xc6a>
    3088:	00 e2       	mov	0, r28
    308a:	a5 05       	br	308e <__dtoa_r+0xc6a>
    308c:	00 e2       	mov	0, r28
    308e:	23 57 2d 00 	ld.w	44[sp], r10
    3092:	60 52       	cmp	0, r10
    3094:	e2 0d       	be	30b0 <__dtoa_r+0xc8c>
    3096:	35 57 11 00 	ld.w	16[r21], r10
    309a:	44 52       	add	4, r10
    309c:	c2 52       	shl	2, r10
    309e:	d5 51       	add	r21, r10
    30a0:	2a 37 01 00 	ld.w	0[r10], r6
    30a4:	80 ff 4a 11 	jarl	41ee <___hi0bits>, lp
    30a8:	20 5e 20 00 	movea	32, r0, r11
    30ac:	8b 51       	subr	r11, r10
    30ae:	a5 05       	br	30b2 <__dtoa_r+0xc8e>
    30b0:	01 52       	mov	1, r10
    30b2:	d6 51       	add	r22, r10
    30b4:	ca 56 1f 00 	andi	31, r10, r10
    30b8:	82 15       	be	30d8 <__dtoa_r+0xcb4>
    30ba:	20 5e 20 00 	movea	32, r0, r11
    30be:	aa 59       	sub	r10, r11
    30c0:	64 5a       	cmp	4, r11
    30c2:	87 0d       	ble	30d2 <__dtoa_r+0xcae>
    30c4:	20 5e 1c 00 	movea	28, r0, r11
    30c8:	8b 51       	subr	r11, r10
    30ca:	ca a1       	add	r10, r20
    30cc:	ca e9       	add	r10, r29
    30ce:	ca b1       	add	r10, r22
    30d0:	95 0d       	br	30e2 <__dtoa_r+0xcbe>
    30d2:	63 5a       	cmp	3, r11
    30d4:	ff 05       	bgt	30e2 <__dtoa_r+0xcbe>
    30d6:	0b 50       	mov	r11, r10
    30d8:	0a 56 1c 00 	addi	28, r10, r10
    30dc:	ca a1       	add	r10, r20
    30de:	ca e9       	add	r10, r29
    30e0:	ca b1       	add	r10, r22
    30e2:	60 a2       	cmp	0, r20
    30e4:	f7 05       	ble	30f2 <__dtoa_r+0xcce>
    30e6:	1b 30       	mov	r27, r6
    30e8:	19 38       	mov	r25, r7
    30ea:	14 40       	mov	r20, r8
    30ec:	80 ff b8 13 	jarl	44a4 <___lshift>, lp
    30f0:	0a c8       	mov	r10, r25
    30f2:	60 b2       	cmp	0, r22
    30f4:	f7 05       	ble	3102 <__dtoa_r+0xcde>
    30f6:	1b 30       	mov	r27, r6
    30f8:	15 38       	mov	r21, r7
    30fa:	16 40       	mov	r22, r8
    30fc:	80 ff a8 13 	jarl	44a4 <___lshift>, lp
    3100:	0a a8       	mov	r10, r21
    3102:	23 5f 35 00 	ld.w	52[sp], r11
    3106:	60 5a       	cmp	0, r11
    3108:	92 2d       	be	315a <__dtoa_r+0xd36>
    310a:	19 30       	mov	r25, r6
    310c:	15 38       	mov	r21, r7
    310e:	80 ff 56 14 	jarl	4564 <___mcmp>, lp
    3112:	60 52       	cmp	0, r10
    3114:	be 25       	bge	315a <__dtoa_r+0xd36>
    3116:	23 67 15 00 	ld.w	20[sp], r12
    311a:	5f 62       	add	-1, r12
    311c:	63 67 15 00 	st.w	r12, 20[sp]
    3120:	1b 30       	mov	r27, r6
    3122:	19 38       	mov	r25, r7
    3124:	0a 42       	mov	10, r8
    3126:	00 4a       	mov	0, r9
    3128:	80 ff 94 0f 	jarl	40bc <___multadd>, lp
    312c:	0a c8       	mov	r10, r25
    312e:	23 57 25 00 	ld.w	36[sp], r10
    3132:	60 52       	cmp	0, r10
    3134:	f2 0d       	be	3152 <__dtoa_r+0xd2e>
    3136:	1b 30       	mov	r27, r6
    3138:	23 3f 1d 00 	ld.w	28[sp], r7
    313c:	0a 42       	mov	10, r8
    313e:	00 4a       	mov	0, r9
    3140:	80 ff 7c 0f 	jarl	40bc <___multadd>, lp
    3144:	63 57 1d 00 	st.w	r10, 28[sp]
    3148:	23 5f 29 00 	ld.w	40[sp], r11
    314c:	63 5f 19 00 	st.w	r11, 24[sp]
    3150:	d5 05       	br	315a <__dtoa_r+0xd36>
    3152:	23 67 29 00 	ld.w	40[sp], r12
    3156:	63 67 19 00 	st.w	r12, 24[sp]
    315a:	23 57 19 00 	ld.w	24[sp], r10
    315e:	60 52       	cmp	0, r10
    3160:	ff 3d       	bgt	31de <__dtoa_r+0xdba>
    3162:	23 5f 9d 00 	ld.w	156[sp], r11
    3166:	62 5a       	cmp	2, r11
    3168:	b7 3d       	ble	31de <__dtoa_r+0xdba>
    316a:	60 52       	cmp	0, r10
    316c:	a6 1d       	blt	31a0 <__dtoa_r+0xd7c>
    316e:	1b 30       	mov	r27, r6
    3170:	15 38       	mov	r21, r7
    3172:	05 42       	mov	5, r8
    3174:	00 4a       	mov	0, r9
    3176:	80 ff 46 0f 	jarl	40bc <___multadd>, lp
    317a:	0a a8       	mov	r10, r21
    317c:	19 30       	mov	r25, r6
    317e:	0a 38       	mov	r10, r7
    3180:	80 ff e4 13 	jarl	4564 <___mcmp>, lp
    3184:	60 52       	cmp	0, r10
    3186:	af 1d       	bgt	31ba <__dtoa_r+0xd96>
    3188:	c5 0d       	br	31a0 <__dtoa_r+0xd7c>
    318a:	00 aa       	mov	0, r21
    318c:	63 07 1d 00 	st.w	r0, 28[sp]
    3190:	85 0d       	br	31a0 <__dtoa_r+0xd7c>
    3192:	00 aa       	mov	0, r21
    3194:	63 07 1d 00 	st.w	r0, 28[sp]
    3198:	c5 05       	br	31a0 <__dtoa_r+0xd7c>
    319a:	00 aa       	mov	0, r21
    319c:	63 07 1d 00 	st.w	r0, 28[sp]
    31a0:	23 67 a1 00 	ld.w	160[sp], r12
    31a4:	2c 60       	not	r12, r12
    31a6:	63 67 15 00 	st.w	r12, 20[sp]
    31aa:	17 e0       	mov	r23, r28
    31ac:	00 d2       	mov	0, r26
    31ae:	80 07 10 03 	jr	34be <__dtoa_r+0x109a>
    31b2:	00 aa       	mov	0, r21
    31b4:	63 07 1d 00 	st.w	r0, 28[sp]
    31b8:	d5 05       	br	31c2 <__dtoa_r+0xd9e>
    31ba:	23 57 15 00 	ld.w	20[sp], r10
    31be:	63 57 49 00 	st.w	r10, 72[sp]
    31c2:	20 56 31 00 	movea	49, r0, r10
    31c6:	57 57 00 00 	st.b	r10, 0[r23]
    31ca:	17 e6 01 00 	addi	1, r23, r28
    31ce:	23 5f 49 00 	ld.w	72[sp], r11
    31d2:	41 5a       	add	1, r11
    31d4:	63 5f 15 00 	st.w	r11, 20[sp]
    31d8:	00 d2       	mov	0, r26
    31da:	80 07 e4 02 	jr	34be <__dtoa_r+0x109a>
    31de:	23 67 25 00 	ld.w	36[sp], r12
    31e2:	60 62       	cmp	0, r12
    31e4:	e2 07 11 02 	be	33f4 <__dtoa_r+0xfd0>
    31e8:	60 ea       	cmp	0, r29
    31ea:	97 0d       	ble	31fc <__dtoa_r+0xdd8>
    31ec:	1b 30       	mov	r27, r6
    31ee:	23 3f 1d 00 	ld.w	28[sp], r7
    31f2:	1d 40       	mov	r29, r8
    31f4:	80 ff b0 12 	jarl	44a4 <___lshift>, lp
    31f8:	63 57 1d 00 	st.w	r10, 28[sp]
    31fc:	60 e2       	cmp	0, r28
    31fe:	c2 1d       	be	3236 <__dtoa_r+0xe12>
    3200:	1b 30       	mov	r27, r6
    3202:	23 57 1d 00 	ld.w	28[sp], r10
    3206:	2a 3f 05 00 	ld.w	4[r10], r7
    320a:	80 ff 24 0e 	jarl	402e <__Balloc>, lp
    320e:	0a e8       	mov	r10, r29
    3210:	23 5f 1d 00 	ld.w	28[sp], r11
    3214:	2b 47 11 00 	ld.w	16[r11], r8
    3218:	42 42       	add	2, r8
    321a:	0a 36 0c 00 	addi	12, r10, r6
    321e:	0b 38       	mov	r11, r7
    3220:	4c 3a       	add	12, r7
    3222:	c2 42       	shl	2, r8
    3224:	80 ff ec 0d 	jarl	4010 <_memcpy>, lp
    3228:	1b 30       	mov	r27, r6
    322a:	1d 38       	mov	r29, r7
    322c:	01 42       	mov	1, r8
    322e:	80 ff 76 12 	jarl	44a4 <___lshift>, lp
    3232:	0a c0       	mov	r10, r24
    3234:	b5 05       	br	323a <__dtoa_r+0xe16>
    3236:	23 c7 1d 00 	ld.w	28[sp], r24
    323a:	23 d7 1d 00 	ld.w	28[sp], r26
    323e:	01 b2       	mov	1, r22
    3240:	23 67 09 00 	ld.w	8[sp], r12
    3244:	56 61       	and	r22, r12
    3246:	63 67 1d 00 	st.w	r12, 28[sp]
    324a:	63 bf 21 00 	st.w	r23, 32[sp]
    324e:	19 30       	mov	r25, r6
    3250:	15 38       	mov	r21, r7
    3252:	bf ff 48 f0 	jarl	229a <_quorem>, lp
    3256:	63 57 09 00 	st.w	r10, 8[sp]
    325a:	0a 56 30 00 	addi	48, r10, r10
    325e:	63 57 0d 00 	st.w	r10, 12[sp]
    3262:	19 30       	mov	r25, r6
    3264:	1a 38       	mov	r26, r7
    3266:	80 ff fe 12 	jarl	4564 <___mcmp>, lp
    326a:	0a a0       	mov	r10, r20
    326c:	1b 30       	mov	r27, r6
    326e:	15 38       	mov	r21, r7
    3270:	18 40       	mov	r24, r8
    3272:	80 ff 2c 13 	jarl	459e <___mdiff>, lp
    3276:	0a e0       	mov	r10, r28
    3278:	2a 57 0d 00 	ld.w	12[r10], r10
    327c:	60 52       	cmp	0, r10
    327e:	ea 07 05 03 	bne	3582 <__dtoa_r+0x115e>
    3282:	19 30       	mov	r25, r6
    3284:	1c 38       	mov	r28, r7
    3286:	80 ff de 12 	jarl	4564 <___mcmp>, lp
    328a:	0a e8       	mov	r10, r29
    328c:	1b 30       	mov	r27, r6
    328e:	1c 38       	mov	r28, r7
    3290:	80 ff 08 0e 	jarl	4098 <__Bfree>, lp
    3294:	60 ea       	cmp	0, r29
    3296:	9a 25       	bne	32d8 <__dtoa_r+0xeb4>
    3298:	23 5f 9d 00 	ld.w	156[sp], r11
    329c:	60 5a       	cmp	0, r11
    329e:	da 1d       	bne	32d8 <__dtoa_r+0xeb4>
    32a0:	23 67 1d 00 	ld.w	28[sp], r12
    32a4:	60 62       	cmp	0, r12
    32a6:	9a 1d       	bne	32d8 <__dtoa_r+0xeb4>
    32a8:	23 b7 0d 00 	ld.w	12[sp], r22
    32ac:	17 e0       	mov	r23, r28
    32ae:	23 bf 21 00 	ld.w	32[sp], r23
    32b2:	1c 50       	mov	r28, r10
    32b4:	20 5e 39 00 	movea	57, r0, r11
    32b8:	eb b1       	cmp	r11, r22
    32ba:	d2 5d       	be	3374 <__dtoa_r+0xf50>
    32bc:	60 a2       	cmp	0, r20
    32be:	d7 05       	ble	32c8 <__dtoa_r+0xea4>
    32c0:	23 5f 09 00 	ld.w	8[sp], r11
    32c4:	0b b6 31 00 	addi	49, r11, r22
    32c8:	4a b7 00 00 	st.b	r22, 0[r10]
    32cc:	0a e6 01 00 	addi	1, r10, r28
    32d0:	63 c7 1d 00 	st.w	r24, 28[sp]
    32d4:	80 07 ea 01 	jr	34be <__dtoa_r+0x109a>
    32d8:	60 a2       	cmp	0, r20
    32da:	d6 15       	blt	3304 <__dtoa_r+0xee0>
    32dc:	9a 45       	bne	335e <__dtoa_r+0xf3a>
    32de:	23 67 9d 00 	ld.w	156[sp], r12
    32e2:	60 62       	cmp	0, r12
    32e4:	da 3d       	bne	335e <__dtoa_r+0xf3a>
    32e6:	23 57 1d 00 	ld.w	28[sp], r10
    32ea:	60 52       	cmp	0, r10
    32ec:	9a 3d       	bne	335e <__dtoa_r+0xf3a>
    32ee:	23 b7 0d 00 	ld.w	12[sp], r22
    32f2:	63 ef 11 00 	st.w	r29, 16[sp]
    32f6:	17 e0       	mov	r23, r28
    32f8:	23 bf 21 00 	ld.w	32[sp], r23
    32fc:	16 a0       	mov	r22, r20
    32fe:	1c e8       	mov	r28, r29
    3300:	19 38       	mov	r25, r7
    3302:	b5 0d       	br	3318 <__dtoa_r+0xef4>
    3304:	23 b7 0d 00 	ld.w	12[sp], r22
    3308:	63 ef 11 00 	st.w	r29, 16[sp]
    330c:	17 e0       	mov	r23, r28
    330e:	23 bf 21 00 	ld.w	32[sp], r23
    3312:	16 a0       	mov	r22, r20
    3314:	1c e8       	mov	r28, r29
    3316:	19 38       	mov	r25, r7
    3318:	23 5f 11 00 	ld.w	16[sp], r11
    331c:	60 5a       	cmp	0, r11
    331e:	87 1d       	ble	334e <__dtoa_r+0xf2a>
    3320:	1b 30       	mov	r27, r6
    3322:	01 42       	mov	1, r8
    3324:	80 ff 80 11 	jarl	44a4 <___lshift>, lp
    3328:	0a c8       	mov	r10, r25
    332a:	0a 30       	mov	r10, r6
    332c:	15 38       	mov	r21, r7
    332e:	80 ff 36 12 	jarl	4564 <___mcmp>, lp
    3332:	60 52       	cmp	0, r10
    3334:	df 05       	bgt	333e <__dtoa_r+0xf1a>
    3336:	ca 0d       	bne	334e <__dtoa_r+0xf2a>
    3338:	d4 56 01 00 	andi	1, r20, r10
    333c:	92 0d       	be	334e <__dtoa_r+0xf2a>
    333e:	20 56 39 00 	movea	57, r0, r10
    3342:	ea a1       	cmp	r10, r20
    3344:	82 1d       	be	3374 <__dtoa_r+0xf50>
    3346:	23 67 09 00 	ld.w	8[sp], r12
    334a:	0c b6 31 00 	addi	49, r12, r22
    334e:	5d b7 00 00 	st.b	r22, 0[r29]
    3352:	1d e6 01 00 	addi	1, r29, r28
    3356:	63 c7 1d 00 	st.w	r24, 28[sp]
    335a:	80 07 64 01 	jr	34be <__dtoa_r+0x109a>
    335e:	60 ea       	cmp	0, r29
    3360:	b7 1d       	ble	3396 <__dtoa_r+0xf72>
    3362:	23 b7 0d 00 	ld.w	12[sp], r22
    3366:	17 e0       	mov	r23, r28
    3368:	23 bf 21 00 	ld.w	32[sp], r23
    336c:	20 56 39 00 	movea	57, r0, r10
    3370:	ea b1       	cmp	r10, r22
    3372:	aa 0d       	bne	3386 <__dtoa_r+0xf62>
    3374:	20 56 39 00 	movea	57, r0, r10
    3378:	5c 57 00 00 	st.b	r10, 0[r28]
    337c:	41 e2       	add	1, r28
    337e:	63 c7 1d 00 	st.w	r24, 28[sp]
    3382:	80 07 16 01 	jr	3498 <__dtoa_r+0x1074>
    3386:	41 b2       	add	1, r22
    3388:	5c b7 00 00 	st.b	r22, 0[r28]
    338c:	41 e2       	add	1, r28
    338e:	63 c7 1d 00 	st.w	r24, 28[sp]
    3392:	80 07 2c 01 	jr	34be <__dtoa_r+0x109a>
    3396:	23 57 0d 00 	ld.w	12[sp], r10
    339a:	57 57 00 00 	st.b	r10, 0[r23]
    339e:	41 ba       	add	1, r23
    33a0:	23 5f 19 00 	ld.w	24[sp], r11
    33a4:	eb b1       	cmp	r11, r22
    33a6:	92 55       	be	3448 <__dtoa_r+0x1024>
    33a8:	1b 30       	mov	r27, r6
    33aa:	19 38       	mov	r25, r7
    33ac:	0a 42       	mov	10, r8
    33ae:	00 4a       	mov	0, r9
    33b0:	80 ff 0c 0d 	jarl	40bc <___multadd>, lp
    33b4:	0a c8       	mov	r10, r25
    33b6:	f8 d1       	cmp	r24, r26
    33b8:	aa 0d       	bne	33cc <__dtoa_r+0xfa8>
    33ba:	1b 30       	mov	r27, r6
    33bc:	1a 38       	mov	r26, r7
    33be:	0a 42       	mov	10, r8
    33c0:	00 4a       	mov	0, r9
    33c2:	80 ff fa 0c 	jarl	40bc <___multadd>, lp
    33c6:	0a d0       	mov	r10, r26
    33c8:	0a c0       	mov	r10, r24
    33ca:	a5 15       	br	33ee <__dtoa_r+0xfca>
    33cc:	1b 30       	mov	r27, r6
    33ce:	1a 38       	mov	r26, r7
    33d0:	0a 42       	mov	10, r8
    33d2:	00 4a       	mov	0, r9
    33d4:	3d 06 bc 40 	mov	0x40bc, r29
    33d8:	00 00 
    33da:	fd c7 60 f9 	jarl	[r29], lp
    33de:	0a d0       	mov	r10, r26
    33e0:	1b 30       	mov	r27, r6
    33e2:	18 38       	mov	r24, r7
    33e4:	0a 42       	mov	10, r8
    33e6:	00 4a       	mov	0, r9
    33e8:	fd c7 60 f9 	jarl	[r29], lp
    33ec:	0a c0       	mov	r10, r24
    33ee:	41 b2       	add	1, r22
    33f0:	bf 07 5e fe 	jr	324e <__dtoa_r+0xe2a>
    33f4:	17 e8       	mov	r23, r29
    33f6:	01 e2       	mov	1, r28
    33f8:	3a 06 9a 22 	mov	0x229a, r26
    33fc:	00 00 
    33fe:	0a c2       	mov	10, r24
    3400:	34 06 bc 40 	mov	0x40bc, r20
    3404:	00 00 
    3406:	17 b0       	mov	r23, r22
    3408:	23 bf 19 00 	ld.w	24[sp], r23
    340c:	19 30       	mov	r25, r6
    340e:	15 38       	mov	r21, r7
    3410:	fa c7 60 f9 	jarl	[r26], lp
    3414:	0a 56 30 00 	addi	48, r10, r10
    3418:	5d 57 00 00 	st.b	r10, 0[r29]
    341c:	41 ea       	add	1, r29
    341e:	f7 e1       	cmp	r23, r28
    3420:	b6 0d       	blt	3436 <__dtoa_r+0x1012>
    3422:	16 b8       	mov	r22, r23
    3424:	0a b0       	mov	r10, r22
    3426:	23 67 19 00 	ld.w	24[sp], r12
    342a:	60 62       	cmp	0, r12
    342c:	e1 67 0e e3 	cmov	le, 1, r12, r28
    3430:	d7 e1       	add	r23, r28
    3432:	00 d2       	mov	0, r26
    3434:	95 15       	br	3456 <__dtoa_r+0x1032>
    3436:	1b 30       	mov	r27, r6
    3438:	19 38       	mov	r25, r7
    343a:	18 40       	mov	r24, r8
    343c:	00 4a       	mov	0, r9
    343e:	f4 c7 60 f9 	jarl	[r20], lp
    3442:	0a c8       	mov	r10, r25
    3444:	41 e2       	add	1, r28
    3446:	b5 e5       	br	340c <__dtoa_r+0xfe8>
    3448:	23 b7 0d 00 	ld.w	12[sp], r22
    344c:	17 e0       	mov	r23, r28
    344e:	23 bf 21 00 	ld.w	32[sp], r23
    3452:	63 c7 1d 00 	st.w	r24, 28[sp]
    3456:	1b 30       	mov	r27, r6
    3458:	19 38       	mov	r25, r7
    345a:	01 42       	mov	1, r8
    345c:	80 ff 48 10 	jarl	44a4 <___lshift>, lp
    3460:	0a c8       	mov	r10, r25
    3462:	0a 30       	mov	r10, r6
    3464:	15 38       	mov	r21, r7
    3466:	80 ff fe 10 	jarl	4564 <___mcmp>, lp
    346a:	60 52       	cmp	0, r10
    346c:	ef 15       	bgt	3498 <__dtoa_r+0x1074>
    346e:	fa 1d       	bne	34ac <__dtoa_r+0x1088>
    3470:	d6 b6 01 00 	andi	1, r22, r22
    3474:	aa 15       	bne	3498 <__dtoa_r+0x1074>
    3476:	b5 1d       	br	34ac <__dtoa_r+0x1088>
    3478:	1c 56 ff ff 	addi	-1, r28, r10
    347c:	ea b9       	cmp	r10, r23
    347e:	ba 0d       	bne	3494 <__dtoa_r+0x1070>
    3480:	23 57 15 00 	ld.w	20[sp], r10
    3484:	41 52       	add	1, r10
    3486:	63 57 15 00 	st.w	r10, 20[sp]
    348a:	20 56 31 00 	movea	49, r0, r10
    348e:	5c 57 ff ff 	st.b	r10, -1[r28]
    3492:	e5 15       	br	34be <__dtoa_r+0x109a>
    3494:	0a e0       	mov	r10, r28
    3496:	b5 05       	br	349c <__dtoa_r+0x1078>
    3498:	20 5e 39 00 	movea	57, r0, r11
    349c:	1c 57 ff ff 	ld.b	-1[r28], r10
    34a0:	eb 51       	cmp	r11, r10
    34a2:	b2 ed       	be	3478 <__dtoa_r+0x1054>
    34a4:	41 52       	add	1, r10
    34a6:	5c 57 ff ff 	st.b	r10, -1[r28]
    34aa:	a5 0d       	br	34be <__dtoa_r+0x109a>
    34ac:	1c 50       	mov	r28, r10
    34ae:	20 66 30 00 	movea	48, r0, r12
    34b2:	0a e0       	mov	r10, r28
    34b4:	5f 52       	add	-1, r10
    34b6:	0a 5f 00 00 	ld.b	0[r10], r11
    34ba:	ec 59       	cmp	r12, r11
    34bc:	b2 fd       	be	34b2 <__dtoa_r+0x108e>
    34be:	1b 30       	mov	r27, r6
    34c0:	15 38       	mov	r21, r7
    34c2:	80 ff d6 0b 	jarl	4098 <__Bfree>, lp
    34c6:	23 5f 1d 00 	ld.w	28[sp], r11
    34ca:	60 5a       	cmp	0, r11
    34cc:	a2 1d       	be	3500 <__dtoa_r+0x10dc>
    34ce:	60 d2       	cmp	0, r26
    34d0:	f2 05       	be	34de <__dtoa_r+0x10ba>
    34d2:	eb d1       	cmp	r11, r26
    34d4:	d2 05       	be	34de <__dtoa_r+0x10ba>
    34d6:	1b 30       	mov	r27, r6
    34d8:	1a 38       	mov	r26, r7
    34da:	80 ff be 0b 	jarl	4098 <__Bfree>, lp
    34de:	1b 30       	mov	r27, r6
    34e0:	23 3f 1d 00 	ld.w	28[sp], r7
    34e4:	80 ff b4 0b 	jarl	4098 <__Bfree>, lp
    34e8:	c5 0d       	br	3500 <__dtoa_r+0x10dc>
    34ea:	23 67 49 00 	ld.w	72[sp], r12
    34ee:	63 67 15 00 	st.w	r12, 20[sp]
    34f2:	f5 05       	br	3500 <__dtoa_r+0x10dc>
    34f4:	23 cf 11 00 	ld.w	16[sp], r25
    34f8:	1b e0       	mov	r27, r28
    34fa:	17 d8       	mov	r23, r27
    34fc:	23 bf 19 00 	ld.w	24[sp], r23
    3500:	1b 30       	mov	r27, r6
    3502:	19 38       	mov	r25, r7
    3504:	80 ff 94 0b 	jarl	4098 <__Bfree>, lp
    3508:	5c 07 00 00 	st.b	r0, 0[r28]
    350c:	23 57 15 00 	ld.w	20[sp], r10
    3510:	41 52       	add	1, r10
    3512:	23 5f a5 00 	ld.w	164[sp], r11
    3516:	6b 57 01 00 	st.w	r10, 0[r11]
    351a:	23 67 ad 00 	ld.w	172[sp], r12
    351e:	60 62       	cmp	0, r12
    3520:	f2 05       	be	352e <__dtoa_r+0x110a>
    3522:	6c e7 01 00 	st.w	r28, 0[r12]
    3526:	c5 05       	br	352e <__dtoa_r+0x110a>
    3528:	37 06 9b 79 	mov	0x799b, r23
    352c:	00 00 
    352e:	17 50       	mov	r23, r10
    3530:	03 1e 70 00 	addi	112, sp, sp
    3534:	01 02       	callt	1
    3536:	01 ea       	mov	1, r29
    3538:	63 07 9d 00 	st.w	r0, 156[sp]
    353c:	63 ef 25 00 	st.w	r29, 36[sp]
    3540:	1f 52       	mov	-1, r10
    3542:	63 57 29 00 	st.w	r10, 40[sp]
    3546:	63 57 19 00 	st.w	r10, 24[sp]
    354a:	63 07 a1 00 	st.w	r0, 160[sp]
    354e:	e5 15       	br	357a <__dtoa_r+0x1156>
    3550:	01 5a       	mov	1, r11
    3552:	63 5f 25 00 	st.w	r11, 36[sp]
    3556:	1f 62       	mov	-1, r12
    3558:	63 67 29 00 	st.w	r12, 40[sp]
    355c:	63 67 19 00 	st.w	r12, 24[sp]
    3560:	63 07 a1 00 	st.w	r0, 160[sp]
    3564:	b5 0d       	br	357a <__dtoa_r+0x1156>
    3566:	01 52       	mov	1, r10
    3568:	63 57 29 00 	st.w	r10, 40[sp]
    356c:	63 57 19 00 	st.w	r10, 24[sp]
    3570:	63 57 a1 00 	st.w	r10, 160[sp]
    3574:	b5 05       	br	357a <__dtoa_r+0x1156>
    3576:	63 bf 19 00 	st.w	r23, 24[sp]
    357a:	7b 07 45 00 	st.w	r0, 68[r27]
    357e:	bf 07 48 f2 	jr	27c6 <__dtoa_r+0x3a2>
    3582:	1b 30       	mov	r27, r6
    3584:	1c 38       	mov	r28, r7
    3586:	80 ff 12 0b 	jarl	4098 <__Bfree>, lp
    358a:	01 ea       	mov	1, r29
    358c:	bf 07 4c fd 	jr	32d8 <__dtoa_r+0xeb4>

00003590 <__malloc_trim_r>:
    3590:	0c 02       	callt	12
    3592:	06 e8       	mov	r6, r29
    3594:	07 d8       	mov	r7, r27
    3596:	80 ff 94 0a 	jarl	402a <___malloc_lock>, lp
    359a:	2a 06 74 04 	mov	0xfedf0474, r10
    359e:	df fe 
    35a0:	2a 57 09 00 	ld.w	8[r10], r10
    35a4:	2a e7 05 00 	ld.w	4[r10], r28
    35a8:	1c 52       	mov	-4, r10
    35aa:	4a e1       	and	r10, r28
    35ac:	1c 56 ef 0f 	addi	4079, r28, r10
    35b0:	8a d9       	subr	r10, r27
    35b2:	20 56 00 f0 	movea	-4096, r0, r10
    35b6:	4a d9       	and	r10, r27
    35b8:	ca d9       	add	r10, r27
    35ba:	20 56 ff 0f 	movea	4095, r0, r10
    35be:	ea d9       	cmp	r10, r27
    35c0:	ef 05       	bgt	35cc <__malloc_trim_r+0x3c>
    35c2:	1d 30       	mov	r29, r6
    35c4:	80 ff 68 0a 	jarl	402c <___malloc_unlock>, lp
    35c8:	00 52       	mov	0, r10
    35ca:	85 55       	br	366a <__malloc_trim_r+0xda>
    35cc:	1d 30       	mov	r29, r6
    35ce:	00 3a       	mov	0, r7
    35d0:	80 ff 12 15 	jarl	4ae2 <__sbrk_r>, lp
    35d4:	2b 06 74 04 	mov	0xfedf0474, r11
    35d8:	df fe 
    35da:	2b 5f 09 00 	ld.w	8[r11], r11
    35de:	dc 59       	add	r28, r11
    35e0:	eb 51       	cmp	r11, r10
    35e2:	e2 05       	be	35ee <__malloc_trim_r+0x5e>
    35e4:	1d 30       	mov	r29, r6
    35e6:	80 ff 46 0a 	jarl	402c <___malloc_unlock>, lp
    35ea:	00 52       	mov	0, r10
    35ec:	f5 3d       	br	366a <__malloc_trim_r+0xda>
    35ee:	1d 30       	mov	r29, r6
    35f0:	1b 38       	mov	r27, r7
    35f2:	80 39       	subr	r0, r7
    35f4:	80 ff ee 14 	jarl	4ae2 <__sbrk_r>, lp
    35f8:	7f 52       	cmp	-1, r10
    35fa:	aa 25       	bne	363e <__malloc_trim_r+0xae>
    35fc:	1d 30       	mov	r29, r6
    35fe:	00 3a       	mov	0, r7
    3600:	80 ff e2 14 	jarl	4ae2 <__sbrk_r>, lp
    3604:	2b 06 74 04 	mov	0xfedf0474, r11
    3608:	df fe 
    360a:	2b 5f 09 00 	ld.w	8[r11], r11
    360e:	0a 60       	mov	r10, r12
    3610:	ab 61       	sub	r11, r12
    3612:	6f 62       	cmp	15, r12
    3614:	87 15       	ble	3634 <__malloc_trim_r+0xa4>
    3616:	2d 06 6c 04 	mov	0xfedf046c, r13
    361a:	df fe 
    361c:	2d 6f 01 00 	ld.w	0[r13], r13
    3620:	ad 51       	sub	r13, r10
    3622:	2d 06 98 08 	mov	0xfedf0898, r13
    3626:	df fe 
    3628:	6d 57 01 00 	st.w	r10, 0[r13]
    362c:	8c 66 01 00 	ori	1, r12, r12
    3630:	6b 67 05 00 	st.w	r12, 4[r11]
    3634:	1d 30       	mov	r29, r6
    3636:	80 ff f6 09 	jarl	402c <___malloc_unlock>, lp
    363a:	00 52       	mov	0, r10
    363c:	f5 15       	br	366a <__malloc_trim_r+0xda>
    363e:	2a 06 74 04 	mov	0xfedf0474, r10
    3642:	df fe 
    3644:	2a 57 09 00 	ld.w	8[r10], r10
    3648:	bb e1       	sub	r27, r28
    364a:	9c e6 01 00 	ori	1, r28, r28
    364e:	6a e7 05 00 	st.w	r28, 4[r10]
    3652:	2a 06 98 08 	mov	0xfedf0898, r10
    3656:	df fe 
    3658:	2a 5f 01 00 	ld.w	0[r10], r11
    365c:	8b d9       	subr	r11, r27
    365e:	6a df 01 00 	st.w	r27, 0[r10]
    3662:	1d 30       	mov	r29, r6
    3664:	80 ff c8 09 	jarl	402c <___malloc_unlock>, lp
    3668:	01 52       	mov	1, r10
    366a:	0d 02       	callt	13

0000366c <__free_r>:
    366c:	0e 02       	callt	14
    366e:	06 e0       	mov	r6, r28
    3670:	07 e8       	mov	r7, r29
    3672:	60 3a       	cmp	0, r7
    3674:	e2 07 4d 02 	be	38c0 <__free_r+0x254>
    3678:	80 ff b2 09 	jarl	402a <___malloc_lock>, lp
    367c:	1d 66 f8 ff 	addi	-8, r29, r12
    3680:	3d 77 fd ff 	ld.w	-4[r29], r14
    3684:	1e 52       	mov	-2, r10
    3686:	4e 51       	and	r14, r10
    3688:	0c 58       	mov	r12, r11
    368a:	ca 59       	add	r10, r11
    368c:	2b 6f 05 00 	ld.w	4[r11], r13
    3690:	1c 7a       	mov	-4, r15
    3692:	4f 69       	and	r15, r13
    3694:	2f 06 74 04 	mov	0xfedf0474, r15
    3698:	df fe 
    369a:	2f 7f 09 00 	ld.w	8[r15], r15
    369e:	eb 79       	cmp	r11, r15
    36a0:	ea 2d       	bne	36fc <__free_r+0x90>
    36a2:	cd 51       	add	r13, r10
    36a4:	ce 76 01 00 	andi	1, r14, r14
    36a8:	da 0d       	bne	36c2 <__free_r+0x56>
    36aa:	3d 5f f9 ff 	ld.w	-8[r29], r11
    36ae:	ab 61       	sub	r11, r12
    36b0:	cb 51       	add	r11, r10
    36b2:	2c 5f 0d 00 	ld.w	12[r12], r11
    36b6:	2c 6f 09 00 	ld.w	8[r12], r13
    36ba:	6d 5f 0d 00 	st.w	r11, 12[r13]
    36be:	6b 6f 09 00 	st.w	r13, 8[r11]
    36c2:	8a 5e 01 00 	ori	1, r10, r11
    36c6:	6c 5f 05 00 	st.w	r11, 4[r12]
    36ca:	2b 06 74 04 	mov	0xfedf0474, r11
    36ce:	df fe 
    36d0:	6b 67 09 00 	st.w	r12, 8[r11]
    36d4:	2b 06 70 04 	mov	0xfedf0470, r11
    36d8:	df fe 
    36da:	2b 5f 01 00 	ld.w	0[r11], r11
    36de:	eb 51       	cmp	r11, r10
    36e0:	91 0d       	bl	36f2 <__free_r+0x86>
    36e2:	1c 30       	mov	r28, r6
    36e4:	2a 06 c8 08 	mov	0xfedf08c8, r10
    36e8:	df fe 
    36ea:	2a 3f 01 00 	ld.w	0[r10], r7
    36ee:	bf ff a2 fe 	jarl	3590 <__malloc_trim_r>, lp
    36f2:	1c 30       	mov	r28, r6
    36f4:	80 ff 38 09 	jarl	402c <___malloc_unlock>, lp
    36f8:	80 07 c8 01 	jr	38c0 <__free_r+0x254>
    36fc:	6b 6f 05 00 	st.w	r13, 4[r11]
    3700:	ce 76 01 00 	andi	1, r14, r14
    3704:	ca 15       	bne	372c <__free_r+0xc0>
    3706:	3d 77 f9 ff 	ld.w	-8[r29], r14
    370a:	ae 61       	sub	r14, r12
    370c:	ce 51       	add	r14, r10
    370e:	2c 77 09 00 	ld.w	8[r12], r14
    3712:	2f 06 7c 04 	mov	0xfedf047c, r15
    3716:	df fe 
    3718:	ef 71       	cmp	r15, r14
    371a:	b2 0d       	be	3730 <__free_r+0xc4>
    371c:	2c 7f 0d 00 	ld.w	12[r12], r15
    3720:	6e 7f 0d 00 	st.w	r15, 12[r14]
    3724:	6f 77 09 00 	st.w	r14, 8[r15]
    3728:	00 72       	mov	0, r14
    372a:	c5 05       	br	3732 <__free_r+0xc6>
    372c:	00 72       	mov	0, r14
    372e:	a5 05       	br	3732 <__free_r+0xc6>
    3730:	01 72       	mov	1, r14
    3732:	0b 78       	mov	r11, r15
    3734:	cd 79       	add	r13, r15
    3736:	cf c7 04 00 	tst1	0, 4[r15]
    373a:	fa 25       	bne	3788 <__free_r+0x11c>
    373c:	cd 51       	add	r13, r10
    373e:	60 72       	cmp	0, r14
    3740:	ca 1d       	bne	3778 <__free_r+0x10c>
    3742:	2b 7f 09 00 	ld.w	8[r11], r15
    3746:	2d 06 7c 04 	mov	0xfedf047c, r13
    374a:	df fe 
    374c:	ed 79       	cmp	r13, r15
    374e:	da 15       	bne	3778 <__free_r+0x10c>
    3750:	2b 06 74 04 	mov	0xfedf0474, r11
    3754:	df fe 
    3756:	6b 67 15 00 	st.w	r12, 20[r11]
    375a:	6b 67 11 00 	st.w	r12, 16[r11]
    375e:	6c 6f 0d 00 	st.w	r13, 12[r12]
    3762:	6c 6f 09 00 	st.w	r13, 8[r12]
    3766:	8a 5e 01 00 	ori	1, r10, r11
    376a:	6c 5f 05 00 	st.w	r11, 4[r12]
    376e:	ca 61       	add	r10, r12
    3770:	6c 57 01 00 	st.w	r10, 0[r12]
    3774:	80 07 46 01 	jr	38ba <__free_r+0x24e>
    3778:	2b 6f 0d 00 	ld.w	12[r11], r13
    377c:	2b 5f 09 00 	ld.w	8[r11], r11
    3780:	6b 6f 0d 00 	st.w	r13, 12[r11]
    3784:	6d 5f 09 00 	st.w	r11, 8[r13]
    3788:	8a 5e 01 00 	ori	1, r10, r11
    378c:	6c 5f 05 00 	st.w	r11, 4[r12]
    3790:	0c 58       	mov	r12, r11
    3792:	ca 59       	add	r10, r11
    3794:	6b 57 01 00 	st.w	r10, 0[r11]
    3798:	60 72       	cmp	0, r14
    379a:	ea 07 21 01 	bne	38ba <__free_r+0x24e>
    379e:	20 5e ff 01 	movea	511, r0, r11
    37a2:	eb 51       	cmp	r11, r10
    37a4:	fb 1d       	bh	37e2 <__free_r+0x176>
    37a6:	83 52       	shr	3, r10
    37a8:	0a 58       	mov	r10, r11
    37aa:	a2 5a       	sar	2, r11
    37ac:	01 6a       	mov	1, r13
    37ae:	eb 6f c0 00 	shl	r11, r13
    37b2:	2b 06 74 04 	mov	0xfedf0474, r11
    37b6:	df fe 
    37b8:	2b 5f 05 00 	ld.w	4[r11], r11
    37bc:	0b 69       	or	r11, r13
    37be:	2b 06 74 04 	mov	0xfedf0474, r11
    37c2:	df fe 
    37c4:	6b 6f 05 00 	st.w	r13, 4[r11]
    37c8:	c3 52       	shl	3, r10
    37ca:	cb 51       	add	r11, r10
    37cc:	2a 5f 09 00 	ld.w	8[r10], r11
    37d0:	6c 57 0d 00 	st.w	r10, 12[r12]
    37d4:	6c 5f 09 00 	st.w	r11, 8[r12]
    37d8:	6a 67 09 00 	st.w	r12, 8[r10]
    37dc:	6b 67 0d 00 	st.w	r12, 12[r11]
    37e0:	d5 6d       	br	38ba <__free_r+0x24e>
    37e2:	0a 58       	mov	r10, r11
    37e4:	89 5a       	shr	9, r11
    37e6:	ca 05       	bne	37ee <__free_r+0x182>
    37e8:	0a 68       	mov	r10, r13
    37ea:	83 6a       	shr	3, r13
    37ec:	c5 2d       	br	3844 <__free_r+0x1d8>
    37ee:	64 5a       	cmp	4, r11
    37f0:	eb 05       	bh	37fc <__free_r+0x190>
    37f2:	0a 68       	mov	r10, r13
    37f4:	86 6a       	shr	6, r13
    37f6:	0d 6e 38 00 	addi	56, r13, r13
    37fa:	d5 25       	br	3844 <__free_r+0x1d8>
    37fc:	20 6e 14 00 	movea	20, r0, r13
    3800:	ed 59       	cmp	r13, r11
    3802:	cb 05       	bh	380a <__free_r+0x19e>
    3804:	0b 6e 5b 00 	addi	91, r11, r13
    3808:	e5 1d       	br	3844 <__free_r+0x1d8>
    380a:	20 6e 54 00 	movea	84, r0, r13
    380e:	ed 59       	cmp	r13, r11
    3810:	eb 05       	bh	381c <__free_r+0x1b0>
    3812:	0a 68       	mov	r10, r13
    3814:	8c 6a       	shr	12, r13
    3816:	0d 6e 6e 00 	addi	110, r13, r13
    381a:	d5 15       	br	3844 <__free_r+0x1d8>
    381c:	20 6e 54 01 	movea	340, r0, r13
    3820:	ed 59       	cmp	r13, r11
    3822:	eb 05       	bh	382e <__free_r+0x1c2>
    3824:	0a 68       	mov	r10, r13
    3826:	8f 6a       	shr	15, r13
    3828:	0d 6e 77 00 	addi	119, r13, r13
    382c:	c5 0d       	br	3844 <__free_r+0x1d8>
    382e:	20 6e 54 05 	movea	1364, r0, r13
    3832:	ed 59       	cmp	r13, r11
    3834:	eb 05       	bh	3840 <__free_r+0x1d4>
    3836:	0a 68       	mov	r10, r13
    3838:	92 6a       	shr	18, r13
    383a:	0d 6e 7c 00 	addi	124, r13, r13
    383e:	b5 05       	br	3844 <__free_r+0x1d8>
    3840:	20 6e 7e 00 	movea	126, r0, r13
    3844:	0d 70       	mov	r13, r14
    3846:	c3 72       	shl	3, r14
    3848:	2b 06 74 04 	mov	0xfedf0474, r11
    384c:	df fe 
    384e:	cb 71       	add	r11, r14
    3850:	2e 5f 09 00 	ld.w	8[r14], r11
    3854:	ee 59       	cmp	r14, r11
    3856:	82 0d       	be	3866 <__free_r+0x1fa>
    3858:	2b 6f 05 00 	ld.w	4[r11], r13
    385c:	1c 7a       	mov	-4, r15
    385e:	4f 69       	and	r15, r13
    3860:	ed 51       	cmp	r13, r10
    3862:	81 1d       	bl	3892 <__free_r+0x226>
    3864:	95 25       	br	38a6 <__free_r+0x23a>
    3866:	0d 50       	mov	r13, r10
    3868:	60 6a       	cmp	0, r13
    386a:	be 05       	bge	3870 <__free_r+0x204>
    386c:	0d 56 03 00 	addi	3, r13, r10
    3870:	a2 52       	sar	2, r10
    3872:	01 6a       	mov	1, r13
    3874:	ea 6f c0 00 	shl	r10, r13
    3878:	2a 06 74 04 	mov	0xfedf0474, r10
    387c:	df fe 
    387e:	2a 57 05 00 	ld.w	4[r10], r10
    3882:	0a 69       	or	r10, r13
    3884:	2a 06 74 04 	mov	0xfedf0474, r10
    3888:	df fe 
    388a:	6a 6f 05 00 	st.w	r13, 4[r10]
    388e:	0b 50       	mov	r11, r10
    3890:	d5 0d       	br	38aa <__free_r+0x23e>
    3892:	2b 5f 09 00 	ld.w	8[r11], r11
    3896:	eb 71       	cmp	r11, r14
    3898:	f2 05       	be	38a6 <__free_r+0x23a>
    389a:	2b 6f 05 00 	ld.w	4[r11], r13
    389e:	1c 7a       	mov	-4, r15
    38a0:	4f 69       	and	r15, r13
    38a2:	ed 51       	cmp	r13, r10
    38a4:	f1 f5       	bl	3892 <__free_r+0x226>
    38a6:	2b 57 0d 00 	ld.w	12[r11], r10
    38aa:	6c 57 0d 00 	st.w	r10, 12[r12]
    38ae:	6c 5f 09 00 	st.w	r11, 8[r12]
    38b2:	6a 67 09 00 	st.w	r12, 8[r10]
    38b6:	6b 67 0d 00 	st.w	r12, 12[r11]
    38ba:	1c 30       	mov	r28, r6
    38bc:	80 ff 70 07 	jarl	402c <___malloc_unlock>, lp
    38c0:	0f 02       	callt	15

000038c2 <__setlocale_r>:
    38c2:	10 02       	callt	16
    38c4:	08 e8       	mov	r8, r29
    38c6:	60 42       	cmp	0, r8
    38c8:	e2 1d       	be	3904 <__setlocale_r+0x42>
    38ca:	08 30       	mov	r8, r6
    38cc:	27 06 a2 79 	mov	0x79a2, r7
    38d0:	00 00 
    38d2:	80 ff 50 12 	jarl	4b22 <_strcmp>, lp
    38d6:	60 52       	cmp	0, r10
    38d8:	a2 1d       	be	390c <__setlocale_r+0x4a>
    38da:	1d 30       	mov	r29, r6
    38dc:	27 06 a0 79 	mov	0x79a0, r7
    38e0:	00 00 
    38e2:	80 ff 40 12 	jarl	4b22 <_strcmp>, lp
    38e6:	60 52       	cmp	0, r10
    38e8:	e2 15       	be	3914 <__setlocale_r+0x52>
    38ea:	1d 30       	mov	r29, r6
    38ec:	27 06 a8 79 	mov	0x79a8, r7
    38f0:	00 00 
    38f2:	80 ff 30 12 	jarl	4b22 <_strcmp>, lp
    38f6:	2b 06 a0 79 	mov	0x79a0, r11
    38fa:	00 00 
    38fc:	60 52       	cmp	0, r10
    38fe:	eb 07 24 53 	cmov	z, r11, r0, r10
    3902:	c5 0d       	br	391a <__setlocale_r+0x58>
    3904:	2a 06 a0 79 	mov	0x79a0, r10
    3908:	00 00 
    390a:	85 0d       	br	391a <__setlocale_r+0x58>
    390c:	2a 06 a0 79 	mov	0x79a0, r10
    3910:	00 00 
    3912:	c5 05       	br	391a <__setlocale_r+0x58>
    3914:	2a 06 a0 79 	mov	0x79a0, r10
    3918:	00 00 
    391a:	11 02       	callt	17

0000391c <___locale_charset>:
    391c:	2a 06 2c 04 	mov	0xfedf042c, r10
    3920:	df fe 
    3922:	7f 00       	jmp	[lp]

00003924 <___locale_msgcharset>:
    3924:	2a 06 4c 04 	mov	0xfedf044c, r10
    3928:	df fe 
    392a:	7f 00       	jmp	[lp]

0000392c <___locale_cjk_lang>:
    392c:	00 52       	mov	0, r10
    392e:	7f 00       	jmp	[lp]

00003930 <__localeconv_r>:
    3930:	2a 06 ac 79 	mov	0x79ac, r10
    3934:	00 00 
    3936:	7f 00       	jmp	[lp]

00003938 <_setlocale>:
    3938:	12 02       	callt	18
    393a:	06 50       	mov	r6, r10
    393c:	07 40       	mov	r7, r8
    393e:	24 37 01 80 	ld.w	-32768[gp], r6
    3942:	0a 38       	mov	r10, r7
    3944:	bf ff 7e ff 	jarl	38c2 <__setlocale_r>, lp
    3948:	13 02       	callt	19

0000394a <_localeconv>:
    394a:	12 02       	callt	18
    394c:	24 37 01 80 	ld.w	-32768[gp], r6
    3950:	bf ff e0 ff 	jarl	3930 <__localeconv_r>, lp
    3954:	13 02       	callt	19

00003956 <__malloc_r>:
    3956:	06 02       	callt	6
    3958:	06 d8       	mov	r6, r27
    395a:	07 e6 0b 00 	addi	11, r7, r28
    395e:	20 56 16 00 	movea	22, r0, r10
    3962:	ea e1       	cmp	r10, r28
    3964:	e3 05       	bnh	3970 <__malloc_r+0x1a>
    3966:	18 52       	mov	-8, r10
    3968:	4a e1       	and	r10, r28
    396a:	60 e2       	cmp	0, r28
    396c:	ce 05       	bge	3974 <__malloc_r+0x1e>
    396e:	d5 05       	br	3978 <__malloc_r+0x22>
    3970:	20 e6 10 00 	movea	16, r0, r28
    3974:	e7 e1       	cmp	r7, r28
    3976:	f9 05       	bnl	3984 <__malloc_r+0x2e>
    3978:	0c 52       	mov	12, r10
    397a:	7b 57 01 00 	st.w	r10, 0[r27]
    397e:	00 52       	mov	0, r10
    3980:	80 07 5a 06 	jr	3fda <__malloc_r+0x684>
    3984:	1b 30       	mov	r27, r6
    3986:	80 ff a4 06 	jarl	402a <___malloc_lock>, lp
    398a:	20 56 f7 01 	movea	503, r0, r10
    398e:	ea e1       	cmp	r10, r28
    3990:	db 2d       	bh	39ea <__malloc_r+0x94>
    3992:	1c 70       	mov	r28, r14
    3994:	83 72       	shr	3, r14
    3996:	2a 06 74 04 	mov	0xfedf0474, r10
    399a:	df fe 
    399c:	dc 51       	add	r28, r10
    399e:	2a ef 0d 00 	ld.w	12[r10], r29
    39a2:	ea e9       	cmp	r10, r29
    39a4:	fa 05       	bne	39b2 <__malloc_r+0x5c>
    39a6:	1d 56 08 00 	addi	8, r29, r10
    39aa:	3d ef 15 00 	ld.w	20[r29], r29
    39ae:	fd 51       	cmp	r29, r10
    39b0:	b2 1d       	be	39e6 <__malloc_r+0x90>
    39b2:	3d 57 05 00 	ld.w	4[r29], r10
    39b6:	1c 5a       	mov	-4, r11
    39b8:	4b 51       	and	r11, r10
    39ba:	3d 5f 0d 00 	ld.w	12[r29], r11
    39be:	3d 67 09 00 	ld.w	8[r29], r12
    39c2:	6c 5f 0d 00 	st.w	r11, 12[r12]
    39c6:	6b 67 09 00 	st.w	r12, 8[r11]
    39ca:	dd 51       	add	r29, r10
    39cc:	2a 5f 05 00 	ld.w	4[r10], r11
    39d0:	8b 5e 01 00 	ori	1, r11, r11
    39d4:	6a 5f 05 00 	st.w	r11, 4[r10]
    39d8:	1b 30       	mov	r27, r6
    39da:	80 ff 52 06 	jarl	402c <___malloc_unlock>, lp
    39de:	1d 56 08 00 	addi	8, r29, r10
    39e2:	80 07 f8 05 	jr	3fda <__malloc_r+0x684>
    39e6:	42 72       	add	2, r14
    39e8:	e5 6d       	br	3ac4 <__malloc_r+0x16e>
    39ea:	1c 70       	mov	r28, r14
    39ec:	89 72       	shr	9, r14
    39ee:	ca 05       	bne	39f6 <__malloc_r+0xa0>
    39f0:	1c 70       	mov	r28, r14
    39f2:	83 72       	shr	3, r14
    39f4:	c5 2d       	br	3a4c <__malloc_r+0xf6>
    39f6:	64 72       	cmp	4, r14
    39f8:	eb 05       	bh	3a04 <__malloc_r+0xae>
    39fa:	1c 70       	mov	r28, r14
    39fc:	86 72       	shr	6, r14
    39fe:	0e 76 38 00 	addi	56, r14, r14
    3a02:	d5 25       	br	3a4c <__malloc_r+0xf6>
    3a04:	20 56 14 00 	movea	20, r0, r10
    3a08:	ea 71       	cmp	r10, r14
    3a0a:	cb 05       	bh	3a12 <__malloc_r+0xbc>
    3a0c:	0e 76 5b 00 	addi	91, r14, r14
    3a10:	e5 1d       	br	3a4c <__malloc_r+0xf6>
    3a12:	20 56 54 00 	movea	84, r0, r10
    3a16:	ea 71       	cmp	r10, r14
    3a18:	eb 05       	bh	3a24 <__malloc_r+0xce>
    3a1a:	1c 70       	mov	r28, r14
    3a1c:	8c 72       	shr	12, r14
    3a1e:	0e 76 6e 00 	addi	110, r14, r14
    3a22:	d5 15       	br	3a4c <__malloc_r+0xf6>
    3a24:	20 56 54 01 	movea	340, r0, r10
    3a28:	ea 71       	cmp	r10, r14
    3a2a:	eb 05       	bh	3a36 <__malloc_r+0xe0>
    3a2c:	1c 70       	mov	r28, r14
    3a2e:	8f 72       	shr	15, r14
    3a30:	0e 76 77 00 	addi	119, r14, r14
    3a34:	c5 0d       	br	3a4c <__malloc_r+0xf6>
    3a36:	20 56 54 05 	movea	1364, r0, r10
    3a3a:	ea 71       	cmp	r10, r14
    3a3c:	eb 05       	bh	3a48 <__malloc_r+0xf2>
    3a3e:	1c 70       	mov	r28, r14
    3a40:	92 72       	shr	18, r14
    3a42:	0e 76 7c 00 	addi	124, r14, r14
    3a46:	b5 05       	br	3a4c <__malloc_r+0xf6>
    3a48:	20 76 7e 00 	movea	126, r0, r14
    3a4c:	0e 60       	mov	r14, r12
    3a4e:	c3 62       	shl	3, r12
    3a50:	2f 06 74 04 	mov	0xfedf0474, r15
    3a54:	df fe 
    3a56:	cf 61       	add	r15, r12
    3a58:	2c ef 0d 00 	ld.w	12[r12], r29
    3a5c:	fd 61       	cmp	r29, r12
    3a5e:	a2 35       	be	3ac2 <__malloc_r+0x16c>
    3a60:	3d 5f 05 00 	ld.w	4[r29], r11
    3a64:	1c 52       	mov	-4, r10
    3a66:	4a 59       	and	r10, r11
    3a68:	0b 50       	mov	r11, r10
    3a6a:	bc 51       	sub	r28, r10
    3a6c:	6f 52       	cmp	15, r10
    3a6e:	cf 0d       	bgt	3a86 <__malloc_r+0x130>
    3a70:	60 52       	cmp	0, r10
    3a72:	c6 25       	blt	3aba <__malloc_r+0x164>
    3a74:	d5 0d       	br	3a8e <__malloc_r+0x138>
    3a76:	3d 5f 05 00 	ld.w	4[r29], r11
    3a7a:	1c 7a       	mov	-4, r15
    3a7c:	4f 59       	and	r15, r11
    3a7e:	0b 50       	mov	r11, r10
    3a80:	bc 51       	sub	r28, r10
    3a82:	6f 52       	cmp	15, r10
    3a84:	b7 05       	ble	3a8a <__malloc_r+0x134>
    3a86:	5f 72       	add	-1, r14
    3a88:	d5 1d       	br	3ac2 <__malloc_r+0x16c>
    3a8a:	60 52       	cmp	0, r10
    3a8c:	f6 15       	blt	3aba <__malloc_r+0x164>
    3a8e:	3d 57 0d 00 	ld.w	12[r29], r10
    3a92:	3d 67 09 00 	ld.w	8[r29], r12
    3a96:	6c 57 0d 00 	st.w	r10, 12[r12]
    3a9a:	6a 67 09 00 	st.w	r12, 8[r10]
    3a9e:	dd 59       	add	r29, r11
    3aa0:	2b 57 05 00 	ld.w	4[r11], r10
    3aa4:	8a 56 01 00 	ori	1, r10, r10
    3aa8:	6b 57 05 00 	st.w	r10, 4[r11]
    3aac:	1b 30       	mov	r27, r6
    3aae:	80 ff 7e 05 	jarl	402c <___malloc_unlock>, lp
    3ab2:	1d 56 08 00 	addi	8, r29, r10
    3ab6:	80 07 24 05 	jr	3fda <__malloc_r+0x684>
    3aba:	3d ef 0d 00 	ld.w	12[r29], r29
    3abe:	fd 61       	cmp	r29, r12
    3ac0:	ba dd       	bne	3a76 <__malloc_r+0x120>
    3ac2:	41 72       	add	1, r14
    3ac4:	2a 06 74 04 	mov	0xfedf0474, r10
    3ac8:	df fe 
    3aca:	2a ef 11 00 	ld.w	16[r10], r29
    3ace:	2a 06 7c 04 	mov	0xfedf047c, r10
    3ad2:	df fe 
    3ad4:	ea e9       	cmp	r10, r29
    3ad6:	e2 07 ab 01 	be	3c80 <__malloc_r+0x32a>
    3ada:	3d 5f 05 00 	ld.w	4[r29], r11
    3ade:	1c 52       	mov	-4, r10
    3ae0:	4a 59       	and	r10, r11
    3ae2:	0b 50       	mov	r11, r10
    3ae4:	bc 51       	sub	r28, r10
    3ae6:	0a 68       	mov	r10, r13
    3ae8:	6f 52       	cmp	15, r10
    3aea:	b7 25       	ble	3b30 <__malloc_r+0x1da>
    3aec:	1d 58       	mov	r29, r11
    3aee:	dc 59       	add	r28, r11
    3af0:	9c e6 01 00 	ori	1, r28, r28
    3af4:	7d e7 05 00 	st.w	r28, 4[r29]
    3af8:	2c 06 74 04 	mov	0xfedf0474, r12
    3afc:	df fe 
    3afe:	6c 5f 15 00 	st.w	r11, 20[r12]
    3b02:	6c 5f 11 00 	st.w	r11, 16[r12]
    3b06:	2c 06 7c 04 	mov	0xfedf047c, r12
    3b0a:	df fe 
    3b0c:	6b 67 0d 00 	st.w	r12, 12[r11]
    3b10:	6b 67 09 00 	st.w	r12, 8[r11]
    3b14:	8a 66 01 00 	ori	1, r10, r12
    3b18:	6b 67 05 00 	st.w	r12, 4[r11]
    3b1c:	ca 59       	add	r10, r11
    3b1e:	6b 57 01 00 	st.w	r10, 0[r11]
    3b22:	1b 30       	mov	r27, r6
    3b24:	80 ff 08 05 	jarl	402c <___malloc_unlock>, lp
    3b28:	1d 56 08 00 	addi	8, r29, r10
    3b2c:	80 07 ae 04 	jr	3fda <__malloc_r+0x684>
    3b30:	2a 06 74 04 	mov	0xfedf0474, r10
    3b34:	df fe 
    3b36:	2c 06 7c 04 	mov	0xfedf047c, r12
    3b3a:	df fe 
    3b3c:	6a 67 15 00 	st.w	r12, 20[r10]
    3b40:	6a 67 11 00 	st.w	r12, 16[r10]
    3b44:	60 6a       	cmp	0, r13
    3b46:	f6 0d       	blt	3b64 <__malloc_r+0x20e>
    3b48:	dd 59       	add	r29, r11
    3b4a:	2b 57 05 00 	ld.w	4[r11], r10
    3b4e:	8a 56 01 00 	ori	1, r10, r10
    3b52:	6b 57 05 00 	st.w	r10, 4[r11]
    3b56:	1b 30       	mov	r27, r6
    3b58:	80 ff d4 04 	jarl	402c <___malloc_unlock>, lp
    3b5c:	1d 56 08 00 	addi	8, r29, r10
    3b60:	80 07 7a 04 	jr	3fda <__malloc_r+0x684>
    3b64:	20 56 ff 01 	movea	511, r0, r10
    3b68:	ea 59       	cmp	r10, r11
    3b6a:	fb 1d       	bh	3ba8 <__malloc_r+0x252>
    3b6c:	83 5a       	shr	3, r11
    3b6e:	0b 50       	mov	r11, r10
    3b70:	a2 52       	sar	2, r10
    3b72:	01 62       	mov	1, r12
    3b74:	ea 67 c0 00 	shl	r10, r12
    3b78:	2a 06 74 04 	mov	0xfedf0474, r10
    3b7c:	df fe 
    3b7e:	2a 57 05 00 	ld.w	4[r10], r10
    3b82:	0a 61       	or	r10, r12
    3b84:	2a 06 74 04 	mov	0xfedf0474, r10
    3b88:	df fe 
    3b8a:	6a 67 05 00 	st.w	r12, 4[r10]
    3b8e:	c3 5a       	shl	3, r11
    3b90:	cb 51       	add	r11, r10
    3b92:	2a 5f 09 00 	ld.w	8[r10], r11
    3b96:	7d 57 0d 00 	st.w	r10, 12[r29]
    3b9a:	7d 5f 09 00 	st.w	r11, 8[r29]
    3b9e:	6a ef 09 00 	st.w	r29, 8[r10]
    3ba2:	6b ef 0d 00 	st.w	r29, 12[r11]
    3ba6:	d5 6d       	br	3c80 <__malloc_r+0x32a>
    3ba8:	0b 50       	mov	r11, r10
    3baa:	89 52       	shr	9, r10
    3bac:	ca 05       	bne	3bb4 <__malloc_r+0x25e>
    3bae:	0b 60       	mov	r11, r12
    3bb0:	83 62       	shr	3, r12
    3bb2:	c5 2d       	br	3c0a <__malloc_r+0x2b4>
    3bb4:	64 52       	cmp	4, r10
    3bb6:	eb 05       	bh	3bc2 <__malloc_r+0x26c>
    3bb8:	0b 60       	mov	r11, r12
    3bba:	86 62       	shr	6, r12
    3bbc:	0c 66 38 00 	addi	56, r12, r12
    3bc0:	d5 25       	br	3c0a <__malloc_r+0x2b4>
    3bc2:	20 66 14 00 	movea	20, r0, r12
    3bc6:	ec 51       	cmp	r12, r10
    3bc8:	cb 05       	bh	3bd0 <__malloc_r+0x27a>
    3bca:	0a 66 5b 00 	addi	91, r10, r12
    3bce:	e5 1d       	br	3c0a <__malloc_r+0x2b4>
    3bd0:	20 66 54 00 	movea	84, r0, r12
    3bd4:	ec 51       	cmp	r12, r10
    3bd6:	eb 05       	bh	3be2 <__malloc_r+0x28c>
    3bd8:	0b 60       	mov	r11, r12
    3bda:	8c 62       	shr	12, r12
    3bdc:	0c 66 6e 00 	addi	110, r12, r12
    3be0:	d5 15       	br	3c0a <__malloc_r+0x2b4>
    3be2:	20 66 54 01 	movea	340, r0, r12
    3be6:	ec 51       	cmp	r12, r10
    3be8:	eb 05       	bh	3bf4 <__malloc_r+0x29e>
    3bea:	0b 60       	mov	r11, r12
    3bec:	8f 62       	shr	15, r12
    3bee:	0c 66 77 00 	addi	119, r12, r12
    3bf2:	c5 0d       	br	3c0a <__malloc_r+0x2b4>
    3bf4:	20 66 54 05 	movea	1364, r0, r12
    3bf8:	ec 51       	cmp	r12, r10
    3bfa:	eb 05       	bh	3c06 <__malloc_r+0x2b0>
    3bfc:	0b 60       	mov	r11, r12
    3bfe:	92 62       	shr	18, r12
    3c00:	0c 66 7c 00 	addi	124, r12, r12
    3c04:	b5 05       	br	3c0a <__malloc_r+0x2b4>
    3c06:	20 66 7e 00 	movea	126, r0, r12
    3c0a:	0c 68       	mov	r12, r13
    3c0c:	c3 6a       	shl	3, r13
    3c0e:	2f 06 74 04 	mov	0xfedf0474, r15
    3c12:	df fe 
    3c14:	cf 69       	add	r15, r13
    3c16:	2d 57 09 00 	ld.w	8[r13], r10
    3c1a:	ed 51       	cmp	r13, r10
    3c1c:	82 0d       	be	3c2c <__malloc_r+0x2d6>
    3c1e:	2a 67 05 00 	ld.w	4[r10], r12
    3c22:	1c 7a       	mov	-4, r15
    3c24:	4f 61       	and	r15, r12
    3c26:	ec 59       	cmp	r12, r11
    3c28:	81 1d       	bl	3c58 <__malloc_r+0x302>
    3c2a:	95 25       	br	3c6c <__malloc_r+0x316>
    3c2c:	0c 58       	mov	r12, r11
    3c2e:	60 62       	cmp	0, r12
    3c30:	be 05       	bge	3c36 <__malloc_r+0x2e0>
    3c32:	0c 5e 03 00 	addi	3, r12, r11
    3c36:	a2 5a       	sar	2, r11
    3c38:	01 62       	mov	1, r12
    3c3a:	eb 67 c0 00 	shl	r11, r12
    3c3e:	2b 06 74 04 	mov	0xfedf0474, r11
    3c42:	df fe 
    3c44:	2b 5f 05 00 	ld.w	4[r11], r11
    3c48:	0b 61       	or	r11, r12
    3c4a:	2b 06 74 04 	mov	0xfedf0474, r11
    3c4e:	df fe 
    3c50:	6b 67 05 00 	st.w	r12, 4[r11]
    3c54:	0a 58       	mov	r10, r11
    3c56:	d5 0d       	br	3c70 <__malloc_r+0x31a>
    3c58:	2a 57 09 00 	ld.w	8[r10], r10
    3c5c:	ea 69       	cmp	r10, r13
    3c5e:	f2 05       	be	3c6c <__malloc_r+0x316>
    3c60:	2a 67 05 00 	ld.w	4[r10], r12
    3c64:	1c 7a       	mov	-4, r15
    3c66:	4f 61       	and	r15, r12
    3c68:	ec 59       	cmp	r12, r11
    3c6a:	f1 f5       	bl	3c58 <__malloc_r+0x302>
    3c6c:	2a 5f 0d 00 	ld.w	12[r10], r11
    3c70:	7d 5f 0d 00 	st.w	r11, 12[r29]
    3c74:	7d 57 09 00 	st.w	r10, 8[r29]
    3c78:	6b ef 09 00 	st.w	r29, 8[r11]
    3c7c:	6a ef 0d 00 	st.w	r29, 12[r10]
    3c80:	0e 50       	mov	r14, r10
    3c82:	60 72       	cmp	0, r14
    3c84:	be 05       	bge	3c8a <__malloc_r+0x334>
    3c86:	0e 56 03 00 	addi	3, r14, r10
    3c8a:	a2 52       	sar	2, r10
    3c8c:	01 6a       	mov	1, r13
    3c8e:	ea 6f c0 00 	shl	r10, r13
    3c92:	2a 06 74 04 	mov	0xfedf0474, r10
    3c96:	df fe 
    3c98:	2a 5f 05 00 	ld.w	4[r10], r11
    3c9c:	eb 69       	cmp	r11, r13
    3c9e:	eb 07 4f 01 	bh	3dec <__malloc_r+0x496>
    3ca2:	0d 50       	mov	r13, r10
    3ca4:	4b 51       	and	r11, r10
    3ca6:	fa 0d       	bne	3cc4 <__malloc_r+0x36e>
    3ca8:	1c 52       	mov	-4, r10
    3caa:	4a 71       	and	r10, r14
    3cac:	44 72       	add	4, r14
    3cae:	0d 50       	mov	r13, r10
    3cb0:	cd 51       	add	r13, r10
    3cb2:	0a 68       	mov	r10, r13
    3cb4:	4b 51       	and	r11, r10
    3cb6:	fa 05       	bne	3cc4 <__malloc_r+0x36e>
    3cb8:	44 72       	add	4, r14
    3cba:	0d 50       	mov	r13, r10
    3cbc:	cd 51       	add	r13, r10
    3cbe:	0a 68       	mov	r10, r13
    3cc0:	4b 51       	and	r11, r10
    3cc2:	b2 fd       	be	3cb8 <__malloc_r+0x362>
    3cc4:	32 06 74 04 	mov	0xfedf0474, r18
    3cc8:	df fe 
    3cca:	0e 88       	mov	r14, r17
    3ccc:	c3 8a       	shl	3, r17
    3cce:	2b 06 74 04 	mov	0xfedf0474, r11
    3cd2:	df fe 
    3cd4:	cb 89       	add	r11, r17
    3cd6:	11 78       	mov	r17, r15
    3cd8:	0e 80       	mov	r14, r16
    3cda:	2f ef 0d 00 	ld.w	12[r15], r29
    3cde:	fd 79       	cmp	r29, r15
    3ce0:	c2 5d       	be	3d98 <__malloc_r+0x442>
    3ce2:	3d 5f 05 00 	ld.w	4[r29], r11
    3ce6:	1c 52       	mov	-4, r10
    3ce8:	4a 59       	and	r10, r11
    3cea:	0b 50       	mov	r11, r10
    3cec:	bc 51       	sub	r28, r10
    3cee:	0a 60       	mov	r10, r12
    3cf0:	6f 52       	cmp	15, r10
    3cf2:	df 0d       	bgt	3d0c <__malloc_r+0x3b6>
    3cf4:	60 52       	cmp	0, r10
    3cf6:	d6 4d       	blt	3d90 <__malloc_r+0x43a>
    3cf8:	e5 35       	br	3d64 <__malloc_r+0x40e>
    3cfa:	3d 5f 05 00 	ld.w	4[r29], r11
    3cfe:	1c 52       	mov	-4, r10
    3d00:	4a 59       	and	r10, r11
    3d02:	0b 50       	mov	r11, r10
    3d04:	bc 51       	sub	r28, r10
    3d06:	0a 60       	mov	r10, r12
    3d08:	6f 52       	cmp	15, r10
    3d0a:	b7 2d       	ble	3d60 <__malloc_r+0x40a>
    3d0c:	1d 58       	mov	r29, r11
    3d0e:	dc 59       	add	r28, r11
    3d10:	9c e6 01 00 	ori	1, r28, r28
    3d14:	7d e7 05 00 	st.w	r28, 4[r29]
    3d18:	3d 6f 0d 00 	ld.w	12[r29], r13
    3d1c:	3d 77 09 00 	ld.w	8[r29], r14
    3d20:	6e 6f 0d 00 	st.w	r13, 12[r14]
    3d24:	6d 77 09 00 	st.w	r14, 8[r13]
    3d28:	2d 06 74 04 	mov	0xfedf0474, r13
    3d2c:	df fe 
    3d2e:	6d 5f 15 00 	st.w	r11, 20[r13]
    3d32:	6d 5f 11 00 	st.w	r11, 16[r13]
    3d36:	2d 06 7c 04 	mov	0xfedf047c, r13
    3d3a:	df fe 
    3d3c:	6b 6f 0d 00 	st.w	r13, 12[r11]
    3d40:	6b 6f 09 00 	st.w	r13, 8[r11]
    3d44:	8c 66 01 00 	ori	1, r12, r12
    3d48:	6b 67 05 00 	st.w	r12, 4[r11]
    3d4c:	ca 59       	add	r10, r11
    3d4e:	6b 57 01 00 	st.w	r10, 0[r11]
    3d52:	1b 30       	mov	r27, r6
    3d54:	80 ff d8 02 	jarl	402c <___malloc_unlock>, lp
    3d58:	1d 56 08 00 	addi	8, r29, r10
    3d5c:	80 07 7e 02 	jr	3fda <__malloc_r+0x684>
    3d60:	60 52       	cmp	0, r10
    3d62:	f6 15       	blt	3d90 <__malloc_r+0x43a>
    3d64:	dd 59       	add	r29, r11
    3d66:	2b 57 05 00 	ld.w	4[r11], r10
    3d6a:	8a 56 01 00 	ori	1, r10, r10
    3d6e:	6b 57 05 00 	st.w	r10, 4[r11]
    3d72:	3d 57 0d 00 	ld.w	12[r29], r10
    3d76:	3d 5f 09 00 	ld.w	8[r29], r11
    3d7a:	6b 57 0d 00 	st.w	r10, 12[r11]
    3d7e:	6a 5f 09 00 	st.w	r11, 8[r10]
    3d82:	1b 30       	mov	r27, r6
    3d84:	80 ff a8 02 	jarl	402c <___malloc_unlock>, lp
    3d88:	1d 56 08 00 	addi	8, r29, r10
    3d8c:	80 07 4e 02 	jr	3fda <__malloc_r+0x684>
    3d90:	3d ef 0d 00 	ld.w	12[r29], r29
    3d94:	fd 79       	cmp	r29, r15
    3d96:	aa b5       	bne	3cfa <__malloc_r+0x3a4>
    3d98:	48 7a       	add	8, r15
    3d9a:	41 82       	add	1, r16
    3d9c:	d0 56 03 00 	andi	3, r16, r10
    3da0:	da 9d       	bne	3cda <__malloc_r+0x384>
    3da2:	ce 56 03 00 	andi	3, r14, r10
    3da6:	8a 0d       	bne	3db6 <__malloc_r+0x460>
    3da8:	2d 58       	not	r13, r11
    3daa:	32 57 05 00 	ld.w	4[r18], r10
    3dae:	4b 51       	and	r11, r10
    3db0:	72 57 05 00 	st.w	r10, 4[r18]
    3db4:	85 0d       	br	3dc4 <__malloc_r+0x46e>
    3db6:	5f 72       	add	-1, r14
    3db8:	11 56 f8 ff 	addi	-8, r17, r10
    3dbc:	31 8f 01 00 	ld.w	0[r17], r17
    3dc0:	ea 89       	cmp	r10, r17
    3dc2:	82 f5       	be	3da2 <__malloc_r+0x44c>
    3dc4:	0d 58       	mov	r13, r11
    3dc6:	cd 59       	add	r13, r11
    3dc8:	0b 68       	mov	r11, r13
    3dca:	32 57 05 00 	ld.w	4[r18], r10
    3dce:	ea 59       	cmp	r10, r11
    3dd0:	eb 0d       	bh	3dec <__malloc_r+0x496>
    3dd2:	60 5a       	cmp	0, r11
    3dd4:	c2 0d       	be	3dec <__malloc_r+0x496>
    3dd6:	4a 59       	and	r10, r11
    3dd8:	fa 05       	bne	3de6 <__malloc_r+0x490>
    3dda:	44 82       	add	4, r16
    3ddc:	0d 58       	mov	r13, r11
    3dde:	cd 59       	add	r13, r11
    3de0:	0b 68       	mov	r11, r13
    3de2:	4a 59       	and	r10, r11
    3de4:	b2 fd       	be	3dda <__malloc_r+0x484>
    3de6:	10 70       	mov	r16, r14
    3de8:	bf 07 e2 fe 	jr	3cca <__malloc_r+0x374>
    3dec:	2a 06 74 04 	mov	0xfedf0474, r10
    3df0:	df fe 
    3df2:	2a ef 09 00 	ld.w	8[r10], r29
    3df6:	3d cf 05 00 	ld.w	4[r29], r25
    3dfa:	1c 5a       	mov	-4, r11
    3dfc:	4b c9       	and	r11, r25
    3dfe:	f9 e1       	cmp	r25, r28
    3e00:	eb 05       	bh	3e0c <__malloc_r+0x4b6>
    3e02:	19 50       	mov	r25, r10
    3e04:	bc 51       	sub	r28, r10
    3e06:	6f 52       	cmp	15, r10
    3e08:	ef 07 a9 01 	bgt	3fb0 <__malloc_r+0x65a>
    3e0c:	2a 06 c8 08 	mov	0xfedf08c8, r10
    3e10:	df fe 
    3e12:	2a c7 01 00 	ld.w	0[r10], r24
    3e16:	dc c1       	add	r28, r24
    3e18:	2a 06 6c 04 	mov	0xfedf046c, r10
    3e1c:	df fe 
    3e1e:	2a 57 01 00 	ld.w	0[r10], r10
    3e22:	7f 52       	cmp	-1, r10
    3e24:	ca 05       	bne	3e2c <__malloc_r+0x4d6>
    3e26:	18 c6 10 00 	addi	16, r24, r24
    3e2a:	e5 05       	br	3e36 <__malloc_r+0x4e0>
    3e2c:	18 c6 0f 10 	addi	4111, r24, r24
    3e30:	20 7e 00 f0 	movea	-4096, r0, r15
    3e34:	4f c1       	and	r15, r24
    3e36:	1b 30       	mov	r27, r6
    3e38:	18 38       	mov	r24, r7
    3e3a:	80 ff a8 0c 	jarl	4ae2 <__sbrk_r>, lp
    3e3e:	0a d0       	mov	r10, r26
    3e40:	7f 52       	cmp	-1, r10
    3e42:	e2 07 49 01 	be	3f8a <__malloc_r+0x634>
    3e46:	1d 50       	mov	r29, r10
    3e48:	d9 51       	add	r25, r10
    3e4a:	fa 51       	cmp	r26, r10
    3e4c:	f3 05       	bnh	3e5a <__malloc_r+0x504>
    3e4e:	2b 06 74 04 	mov	0xfedf0474, r11
    3e52:	df fe 
    3e54:	eb e9       	cmp	r11, r29
    3e56:	ea 07 35 01 	bne	3f8a <__malloc_r+0x634>
    3e5a:	2b 06 98 08 	mov	0xfedf0898, r11
    3e5e:	df fe 
    3e60:	2b 67 01 00 	ld.w	0[r11], r12
    3e64:	d8 61       	add	r24, r12
    3e66:	6b 67 01 00 	st.w	r12, 0[r11]
    3e6a:	fa 51       	cmp	r26, r10
    3e6c:	8a 15       	bne	3e8c <__malloc_r+0x536>
    3e6e:	ca 5e ff 0f 	andi	4095, r10, r11
    3e72:	da 0d       	bne	3e8c <__malloc_r+0x536>
    3e74:	2a 06 74 04 	mov	0xfedf0474, r10
    3e78:	df fe 
    3e7a:	2a 57 09 00 	ld.w	8[r10], r10
    3e7e:	18 58       	mov	r24, r11
    3e80:	d9 59       	add	r25, r11
    3e82:	8b 5e 01 00 	ori	1, r11, r11
    3e86:	6a 5f 05 00 	st.w	r11, 4[r10]
    3e8a:	b5 65       	br	3f50 <__malloc_r+0x5fa>
    3e8c:	2b 06 6c 04 	mov	0xfedf046c, r11
    3e90:	df fe 
    3e92:	2b 5f 01 00 	ld.w	0[r11], r11
    3e96:	7f 5a       	cmp	-1, r11
    3e98:	fa 05       	bne	3ea6 <__malloc_r+0x550>
    3e9a:	2a 06 6c 04 	mov	0xfedf046c, r10
    3e9e:	df fe 
    3ea0:	6a d7 01 00 	st.w	r26, 0[r10]
    3ea4:	85 0d       	br	3eb4 <__malloc_r+0x55e>
    3ea6:	9a 51       	subr	r26, r10
    3ea8:	ca 61       	add	r10, r12
    3eaa:	2a 06 98 08 	mov	0xfedf0898, r10
    3eae:	df fe 
    3eb0:	6a 67 01 00 	st.w	r12, 0[r10]
    3eb4:	da 56 07 00 	andi	7, r26, r10
    3eb8:	d2 05       	be	3ec2 <__malloc_r+0x56c>
    3eba:	08 5a       	mov	8, r11
    3ebc:	8b 51       	subr	r11, r10
    3ebe:	ca d1       	add	r10, r26
    3ec0:	a5 05       	br	3ec4 <__malloc_r+0x56e>
    3ec2:	00 52       	mov	0, r10
    3ec4:	0a 56 00 10 	addi	4096, r10, r10
    3ec8:	1a 58       	mov	r26, r11
    3eca:	d8 59       	add	r24, r11
    3ecc:	cb 5e ff 0f 	andi	4095, r11, r11
    3ed0:	0a c0       	mov	r10, r24
    3ed2:	ab c1       	sub	r11, r24
    3ed4:	1b 30       	mov	r27, r6
    3ed6:	18 38       	mov	r24, r7
    3ed8:	80 ff 0a 0c 	jarl	4ae2 <__sbrk_r>, lp
    3edc:	7f 52       	cmp	-1, r10
    3ede:	ba 05       	bne	3ee4 <__malloc_r+0x58e>
    3ee0:	1a 50       	mov	r26, r10
    3ee2:	00 c2       	mov	0, r24
    3ee4:	2b 06 98 08 	mov	0xfedf0898, r11
    3ee8:	df fe 
    3eea:	2b 67 01 00 	ld.w	0[r11], r12
    3eee:	d8 61       	add	r24, r12
    3ef0:	6b 67 01 00 	st.w	r12, 0[r11]
    3ef4:	2b 06 74 04 	mov	0xfedf0474, r11
    3ef8:	df fe 
    3efa:	6b d7 09 00 	st.w	r26, 8[r11]
    3efe:	ba 51       	sub	r26, r10
    3f00:	d8 51       	add	r24, r10
    3f02:	8a 56 01 00 	ori	1, r10, r10
    3f06:	7a 57 05 00 	st.w	r10, 4[r26]
    3f0a:	eb e9       	cmp	r11, r29
    3f0c:	a2 25       	be	3f50 <__malloc_r+0x5fa>
    3f0e:	6f ca       	cmp	15, r25
    3f10:	fb 05       	bh	3f1e <__malloc_r+0x5c8>
    3f12:	2b 57 09 00 	ld.w	8[r11], r10
    3f16:	01 5a       	mov	1, r11
    3f18:	6a 5f 05 00 	st.w	r11, 4[r10]
    3f1c:	f5 35       	br	3f8a <__malloc_r+0x634>
    3f1e:	19 56 f4 ff 	addi	-12, r25, r10
    3f22:	18 5a       	mov	-8, r11
    3f24:	4b 51       	and	r11, r10
    3f26:	1d 58       	mov	r29, r11
    3f28:	ca 59       	add	r10, r11
    3f2a:	05 62       	mov	5, r12
    3f2c:	6b 67 05 00 	st.w	r12, 4[r11]
    3f30:	6b 67 09 00 	st.w	r12, 8[r11]
    3f34:	3d 5f 05 00 	ld.w	4[r29], r11
    3f38:	cb 5e 01 00 	andi	1, r11, r11
    3f3c:	0a 59       	or	r10, r11
    3f3e:	7d 5f 05 00 	st.w	r11, 4[r29]
    3f42:	6f 52       	cmp	15, r10
    3f44:	e3 05       	bnh	3f50 <__malloc_r+0x5fa>
    3f46:	1b 30       	mov	r27, r6
    3f48:	1d 3e 08 00 	addi	8, r29, r7
    3f4c:	bf ff 20 f7 	jarl	366c <__free_r>, lp
    3f50:	2a 06 98 08 	mov	0xfedf0898, r10
    3f54:	df fe 
    3f56:	2a 57 01 00 	ld.w	0[r10], r10
    3f5a:	2b 06 c4 08 	mov	0xfedf08c4, r11
    3f5e:	df fe 
    3f60:	2b 5f 01 00 	ld.w	0[r11], r11
    3f64:	eb 51       	cmp	r11, r10
    3f66:	e3 05       	bnh	3f72 <__malloc_r+0x61c>
    3f68:	2b 06 c4 08 	mov	0xfedf08c4, r11
    3f6c:	df fe 
    3f6e:	6b 57 01 00 	st.w	r10, 0[r11]
    3f72:	2b 06 c0 08 	mov	0xfedf08c0, r11
    3f76:	df fe 
    3f78:	2b 5f 01 00 	ld.w	0[r11], r11
    3f7c:	eb 51       	cmp	r11, r10
    3f7e:	e3 05       	bnh	3f8a <__malloc_r+0x634>
    3f80:	2b 06 c0 08 	mov	0xfedf08c0, r11
    3f84:	df fe 
    3f86:	6b 57 01 00 	st.w	r10, 0[r11]
    3f8a:	2a 06 74 04 	mov	0xfedf0474, r10
    3f8e:	df fe 
    3f90:	2a 57 09 00 	ld.w	8[r10], r10
    3f94:	2a 57 05 00 	ld.w	4[r10], r10
    3f98:	1c 7a       	mov	-4, r15
    3f9a:	4f 51       	and	r15, r10
    3f9c:	ea e1       	cmp	r10, r28
    3f9e:	cb 05       	bh	3fa6 <__malloc_r+0x650>
    3fa0:	bc 51       	sub	r28, r10
    3fa2:	6f 52       	cmp	15, r10
    3fa4:	ef 05       	bgt	3fb0 <__malloc_r+0x65a>
    3fa6:	1b 30       	mov	r27, r6
    3fa8:	80 ff 84 00 	jarl	402c <___malloc_unlock>, lp
    3fac:	00 52       	mov	0, r10
    3fae:	e5 15       	br	3fda <__malloc_r+0x684>
    3fb0:	2b 06 74 04 	mov	0xfedf0474, r11
    3fb4:	df fe 
    3fb6:	2b ef 09 00 	ld.w	8[r11], r29
    3fba:	9c 66 01 00 	ori	1, r28, r12
    3fbe:	7d 67 05 00 	st.w	r12, 4[r29]
    3fc2:	dd e1       	add	r29, r28
    3fc4:	6b e7 09 00 	st.w	r28, 8[r11]
    3fc8:	8a 56 01 00 	ori	1, r10, r10
    3fcc:	7c 57 05 00 	st.w	r10, 4[r28]
    3fd0:	1b 30       	mov	r27, r6
    3fd2:	80 ff 5a 00 	jarl	402c <___malloc_unlock>, lp
    3fd6:	1d 56 08 00 	addi	8, r29, r10
    3fda:	07 02       	callt	7

00003fdc <_memchr>:
    3fdc:	60 42       	cmp	0, r8
    3fde:	d2 15       	be	4008 <_memchr+0x2c>
    3fe0:	87 00       	zxb	r7
    3fe2:	86 57 01 00 	ld.bu	0[r6], r10
    3fe6:	e7 51       	cmp	r7, r10
    3fe8:	a2 15       	be	400c <_memchr+0x30>
    3fea:	06 5e 01 00 	addi	1, r6, r11
    3fee:	c6 41       	add	r6, r8
    3ff0:	06 50       	mov	r6, r10
    3ff2:	f5 05       	br	4000 <_memchr+0x24>
    3ff4:	41 52       	add	1, r10
    3ff6:	41 5a       	add	1, r11
    3ff8:	ab 67 ff ff 	ld.bu	-1[r11], r12
    3ffc:	e7 61       	cmp	r7, r12
    3ffe:	82 0d       	be	400e <_memchr+0x32>
    4000:	e8 59       	cmp	r8, r11
    4002:	9a fd       	bne	3ff4 <_memchr+0x18>
    4004:	00 52       	mov	0, r10
    4006:	c5 05       	br	400e <_memchr+0x32>
    4008:	00 52       	mov	0, r10
    400a:	a5 05       	br	400e <_memchr+0x32>
    400c:	06 50       	mov	r6, r10
    400e:	7f 00       	jmp	[lp]

00004010 <_memcpy>:
    4010:	06 50       	mov	r6, r10
    4012:	60 42       	cmp	0, r8
    4014:	a2 0d       	be	4028 <_memcpy+0x18>
    4016:	06 58       	mov	r6, r11
    4018:	07 67 00 00 	ld.b	0[r7], r12
    401c:	4b 67 00 00 	st.b	r12, 0[r11]
    4020:	41 5a       	add	1, r11
    4022:	41 3a       	add	1, r7
    4024:	5f 42       	add	-1, r8
    4026:	9a fd       	bne	4018 <_memcpy+0x8>
    4028:	7f 00       	jmp	[lp]

0000402a <___malloc_lock>:
    402a:	7f 00       	jmp	[lp]

0000402c <___malloc_unlock>:
    402c:	7f 00       	jmp	[lp]

0000402e <__Balloc>:
    402e:	0c 02       	callt	12
    4030:	06 e8       	mov	r6, r29
    4032:	07 e0       	mov	r7, r28
    4034:	26 57 4d 00 	ld.w	76[r6], r10
    4038:	60 52       	cmp	0, r10
    403a:	aa 0d       	bne	404e <__Balloc+0x20>
    403c:	04 3a       	mov	4, r7
    403e:	20 46 21 00 	movea	33, r0, r8
    4042:	80 ff 64 19 	jarl	59a6 <__calloc_r>, lp
    4046:	7d 57 4d 00 	st.w	r10, 76[r29]
    404a:	60 52       	cmp	0, r10
    404c:	c2 25       	be	4094 <__Balloc+0x66>
    404e:	1c 50       	mov	r28, r10
    4050:	c2 52       	shl	2, r10
    4052:	3d 5f 4d 00 	ld.w	76[r29], r11
    4056:	ca 59       	add	r10, r11
    4058:	2b 57 01 00 	ld.w	0[r11], r10
    405c:	60 52       	cmp	0, r10
    405e:	e2 05       	be	406a <__Balloc+0x3c>
    4060:	2a 67 01 00 	ld.w	0[r10], r12
    4064:	6b 67 01 00 	st.w	r12, 0[r11]
    4068:	95 15       	br	408a <__Balloc+0x5c>
    406a:	01 3a       	mov	1, r7
    406c:	07 d8       	mov	r7, r27
    406e:	fc df c0 00 	shl	r28, r27
    4072:	1b 46 05 00 	addi	5, r27, r8
    4076:	1d 30       	mov	r29, r6
    4078:	c2 42       	shl	2, r8
    407a:	80 ff 2c 19 	jarl	59a6 <__calloc_r>, lp
    407e:	60 52       	cmp	0, r10
    4080:	b2 0d       	be	4096 <__Balloc+0x68>
    4082:	6a e7 05 00 	st.w	r28, 4[r10]
    4086:	6a df 09 00 	st.w	r27, 8[r10]
    408a:	6a 07 11 00 	st.w	r0, 16[r10]
    408e:	6a 07 0d 00 	st.w	r0, 12[r10]
    4092:	a5 05       	br	4096 <__Balloc+0x68>
    4094:	00 52       	mov	0, r10
    4096:	0d 02       	callt	13

00004098 <__Bfree>:
    4098:	60 3a       	cmp	0, r7
    409a:	82 15       	be	40ba <__Bfree+0x22>
    409c:	27 57 05 00 	ld.w	4[r7], r10
    40a0:	c2 52       	shl	2, r10
    40a2:	26 5f 4d 00 	ld.w	76[r6], r11
    40a6:	ca 59       	add	r10, r11
    40a8:	2b 5f 01 00 	ld.w	0[r11], r11
    40ac:	67 5f 01 00 	st.w	r11, 0[r7]
    40b0:	26 5f 4d 00 	ld.w	76[r6], r11
    40b4:	cb 51       	add	r11, r10
    40b6:	6a 3f 01 00 	st.w	r7, 0[r10]
    40ba:	7f 00       	jmp	[lp]

000040bc <___multadd>:
    40bc:	08 02       	callt	8
    40be:	06 d0       	mov	r6, r26
    40c0:	07 d8       	mov	r7, r27
    40c2:	27 e7 11 00 	ld.w	16[r7], r28
    40c6:	07 56 14 00 	addi	20, r7, r10
    40ca:	00 5a       	mov	0, r11
    40cc:	2a 77 01 00 	ld.w	0[r10], r14
    40d0:	ce 66 ff ff 	andi	65535, r14, r12
    40d4:	e8 67 20 02 	mul	r8, r12, r0
    40d8:	c9 61       	add	r9, r12
    40da:	0c 78       	mov	r12, r15
    40dc:	90 7a       	shr	16, r15
    40de:	90 72       	shr	16, r14
    40e0:	e8 77 20 02 	mul	r8, r14, r0
    40e4:	0f 68       	mov	r15, r13
    40e6:	ce 69       	add	r14, r13
    40e8:	0d e8       	mov	r13, r29
    40ea:	90 ea       	shr	16, r29
    40ec:	1d 48       	mov	r29, r9
    40ee:	d0 6a       	shl	16, r13
    40f0:	cc 66 ff ff 	andi	65535, r12, r12
    40f4:	cc 69       	add	r12, r13
    40f6:	6a 6f 01 00 	st.w	r13, 0[r10]
    40fa:	44 52       	add	4, r10
    40fc:	41 5a       	add	1, r11
    40fe:	eb e1       	cmp	r11, r28
    4100:	ef e5       	bgt	40cc <___multadd+0x10>
    4102:	60 ea       	cmp	0, r29
    4104:	c2 25       	be	414c <___multadd+0x90>
    4106:	3b 57 09 00 	ld.w	8[r27], r10
    410a:	ea e1       	cmp	r10, r28
    410c:	f6 15       	blt	413a <___multadd+0x7e>
    410e:	3b 3f 05 00 	ld.w	4[r27], r7
    4112:	1a 30       	mov	r26, r6
    4114:	41 3a       	add	1, r7
    4116:	bf ff 18 ff 	jarl	402e <__Balloc>, lp
    411a:	0a c8       	mov	r10, r25
    411c:	3b 47 11 00 	ld.w	16[r27], r8
    4120:	42 42       	add	2, r8
    4122:	0a 36 0c 00 	addi	12, r10, r6
    4126:	1b 3e 0c 00 	addi	12, r27, r7
    412a:	c2 42       	shl	2, r8
    412c:	bf ff e4 fe 	jarl	4010 <_memcpy>, lp
    4130:	1a 30       	mov	r26, r6
    4132:	1b 38       	mov	r27, r7
    4134:	bf ff 64 ff 	jarl	4098 <__Bfree>, lp
    4138:	19 d8       	mov	r25, r27
    413a:	1c 56 05 00 	addi	5, r28, r10
    413e:	c2 52       	shl	2, r10
    4140:	db 51       	add	r27, r10
    4142:	6a ef 01 00 	st.w	r29, 0[r10]
    4146:	41 e2       	add	1, r28
    4148:	7b e7 11 00 	st.w	r28, 16[r27]
    414c:	1b 50       	mov	r27, r10
    414e:	09 02       	callt	9

00004150 <___s2b>:
    4150:	02 02       	callt	2
    4152:	06 d8       	mov	r6, r27
    4154:	07 e0       	mov	r7, r28
    4156:	08 b8       	mov	r8, r23
    4158:	09 d0       	mov	r9, r26
    415a:	09 5e 08 00 	addi	8, r9, r11
    415e:	09 52       	mov	9, r10
    4160:	ea 5f c0 52 	div	r10, r11, r10
    4164:	61 5a       	cmp	1, r11
    4166:	87 0d       	ble	4176 <___s2b+0x26>
    4168:	01 52       	mov	1, r10
    416a:	00 3a       	mov	0, r7
    416c:	ca 51       	add	r10, r10
    416e:	41 3a       	add	1, r7
    4170:	ea 59       	cmp	r10, r11
    4172:	df fd       	bgt	416c <___s2b+0x1c>
    4174:	a5 05       	br	4178 <___s2b+0x28>
    4176:	00 3a       	mov	0, r7
    4178:	1b 30       	mov	r27, r6
    417a:	bf ff b4 fe 	jarl	402e <__Balloc>, lp
    417e:	23 5f 25 00 	ld.w	36[sp], r11
    4182:	6a 5f 15 00 	st.w	r11, 20[r10]
    4186:	01 5a       	mov	1, r11
    4188:	6a 5f 11 00 	st.w	r11, 16[r10]
    418c:	69 ba       	cmp	9, r23
    418e:	a7 1d       	ble	41c2 <___s2b+0x72>
    4190:	1c b6 09 00 	addi	9, r28, r22
    4194:	d7 e1       	add	r23, r28
    4196:	16 e8       	mov	r22, r29
    4198:	0a ca       	mov	10, r25
    419a:	38 06 bc 40 	mov	0x40bc, r24
    419e:	00 00 
    41a0:	1d 4f 00 00 	ld.b	0[r29], r9
    41a4:	41 ea       	add	1, r29
    41a6:	1b 30       	mov	r27, r6
    41a8:	0a 38       	mov	r10, r7
    41aa:	19 40       	mov	r25, r8
    41ac:	09 4e d0 ff 	addi	-48, r9, r9
    41b0:	f8 c7 60 f9 	jarl	[r24], lp
    41b4:	fc e9       	cmp	r28, r29
    41b6:	da f5       	bne	41a0 <___s2b+0x50>
    41b8:	16 e0       	mov	r22, r28
    41ba:	d7 e1       	add	r23, r28
    41bc:	58 e2       	add	-8, r28
    41be:	17 e8       	mov	r23, r29
    41c0:	b5 05       	br	41c6 <___s2b+0x76>
    41c2:	4a e2       	add	10, r28
    41c4:	09 ea       	mov	9, r29
    41c6:	fd d1       	cmp	r29, r26
    41c8:	a7 15       	ble	41ec <___s2b+0x9c>
    41ca:	0a ca       	mov	10, r25
    41cc:	38 06 bc 40 	mov	0x40bc, r24
    41d0:	00 00 
    41d2:	1c 4f 00 00 	ld.b	0[r28], r9
    41d6:	41 e2       	add	1, r28
    41d8:	1b 30       	mov	r27, r6
    41da:	0a 38       	mov	r10, r7
    41dc:	19 40       	mov	r25, r8
    41de:	09 4e d0 ff 	addi	-48, r9, r9
    41e2:	f8 c7 60 f9 	jarl	[r24], lp
    41e6:	41 ea       	add	1, r29
    41e8:	fd d1       	cmp	r29, r26
    41ea:	cf f5       	bgt	41d2 <___s2b+0x82>
    41ec:	03 02       	callt	3

000041ee <___hi0bits>:
    41ee:	40 56 ff ff 	movhi	-1, r0, r10
    41f2:	46 51       	and	r6, r10
    41f4:	da 05       	bne	41fe <___hi0bits+0x10>
    41f6:	d0 32       	shl	16, r6
    41f8:	20 56 10 00 	movea	16, r0, r10
    41fc:	a5 05       	br	4200 <___hi0bits+0x12>
    41fe:	00 52       	mov	0, r10
    4200:	40 5e 00 ff 	movhi	-256, r0, r11
    4204:	46 59       	and	r6, r11
    4206:	ba 05       	bne	420c <___hi0bits+0x1e>
    4208:	48 52       	add	8, r10
    420a:	c8 32       	shl	8, r6
    420c:	40 5e 00 f0 	movhi	-4096, r0, r11
    4210:	46 59       	and	r6, r11
    4212:	ba 05       	bne	4218 <___hi0bits+0x2a>
    4214:	44 52       	add	4, r10
    4216:	c4 32       	shl	4, r6
    4218:	40 5e 00 c0 	movhi	-16384, r0, r11
    421c:	46 59       	and	r6, r11
    421e:	ba 05       	bne	4224 <___hi0bits+0x36>
    4220:	42 52       	add	2, r10
    4222:	c2 32       	shl	2, r6
    4224:	60 32       	cmp	0, r6
    4226:	96 0d       	blt	4238 <___hi0bits+0x4a>
    4228:	40 5e 00 40 	movhi	16384, r0, r11
    422c:	4b 31       	and	r11, r6
    422e:	b2 05       	be	4234 <___hi0bits+0x46>
    4230:	41 52       	add	1, r10
    4232:	b5 05       	br	4238 <___hi0bits+0x4a>
    4234:	20 56 20 00 	movea	32, r0, r10
    4238:	7f 00       	jmp	[lp]

0000423a <___lo0bits>:
    423a:	26 5f 01 00 	ld.w	0[r6], r11
    423e:	cb 56 07 00 	andi	7, r11, r10
    4242:	92 15       	be	4264 <___lo0bits+0x2a>
    4244:	cb 56 01 00 	andi	1, r11, r10
    4248:	ea 2d       	bne	42a4 <___lo0bits+0x6a>
    424a:	cb 56 02 00 	andi	2, r11, r10
    424e:	e2 05       	be	425a <___lo0bits+0x20>
    4250:	81 5a       	shr	1, r11
    4252:	66 5f 01 00 	st.w	r11, 0[r6]
    4256:	01 52       	mov	1, r10
    4258:	a5 2d       	br	42ac <___lo0bits+0x72>
    425a:	82 5a       	shr	2, r11
    425c:	66 5f 01 00 	st.w	r11, 0[r6]
    4260:	02 52       	mov	2, r10
    4262:	d5 25       	br	42ac <___lo0bits+0x72>
    4264:	cb 56 ff ff 	andi	65535, r11, r10
    4268:	da 05       	bne	4272 <___lo0bits+0x38>
    426a:	90 5a       	shr	16, r11
    426c:	20 56 10 00 	movea	16, r0, r10
    4270:	a5 05       	br	4274 <___lo0bits+0x3a>
    4272:	00 52       	mov	0, r10
    4274:	cb 66 ff 00 	andi	255, r11, r12
    4278:	ba 05       	bne	427e <___lo0bits+0x44>
    427a:	48 52       	add	8, r10
    427c:	88 5a       	shr	8, r11
    427e:	cb 66 0f 00 	andi	15, r11, r12
    4282:	ba 05       	bne	4288 <___lo0bits+0x4e>
    4284:	44 52       	add	4, r10
    4286:	84 5a       	shr	4, r11
    4288:	cb 66 03 00 	andi	3, r11, r12
    428c:	ba 05       	bne	4292 <___lo0bits+0x58>
    428e:	42 52       	add	2, r10
    4290:	82 5a       	shr	2, r11
    4292:	cb 66 01 00 	andi	1, r11, r12
    4296:	ca 05       	bne	429e <___lo0bits+0x64>
    4298:	81 5a       	shr	1, r11
    429a:	f2 05       	be	42a8 <___lo0bits+0x6e>
    429c:	41 52       	add	1, r10
    429e:	66 5f 01 00 	st.w	r11, 0[r6]
    42a2:	d5 05       	br	42ac <___lo0bits+0x72>
    42a4:	00 52       	mov	0, r10
    42a6:	b5 05       	br	42ac <___lo0bits+0x72>
    42a8:	20 56 20 00 	movea	32, r0, r10
    42ac:	7f 00       	jmp	[lp]

000042ae <___i2b>:
    42ae:	10 02       	callt	16
    42b0:	07 e8       	mov	r7, r29
    42b2:	01 3a       	mov	1, r7
    42b4:	bf ff 7a fd 	jarl	402e <__Balloc>, lp
    42b8:	6a ef 15 00 	st.w	r29, 20[r10]
    42bc:	01 62       	mov	1, r12
    42be:	6a 67 11 00 	st.w	r12, 16[r10]
    42c2:	11 02       	callt	17

000042c4 <___multiply>:
    42c4:	08 02       	callt	8
    42c6:	07 e0       	mov	r7, r28
    42c8:	08 d8       	mov	r8, r27
    42ca:	27 5f 11 00 	ld.w	16[r7], r11
    42ce:	28 57 11 00 	ld.w	16[r8], r10
    42d2:	ea 59       	cmp	r10, r11
    42d4:	be 05       	bge	42da <___multiply+0x16>
    42d6:	08 e0       	mov	r8, r28
    42d8:	07 d8       	mov	r7, r27
    42da:	3c 3f 05 00 	ld.w	4[r28], r7
    42de:	3c d7 11 00 	ld.w	16[r28], r26
    42e2:	3b cf 11 00 	ld.w	16[r27], r25
    42e6:	1a e8       	mov	r26, r29
    42e8:	d9 e9       	add	r25, r29
    42ea:	3c 57 09 00 	ld.w	8[r28], r10
    42ee:	ea e9       	cmp	r10, r29
    42f0:	a7 05       	ble	42f4 <___multiply+0x30>
    42f2:	41 3a       	add	1, r7
    42f4:	bf ff 3a fd 	jarl	402e <__Balloc>, lp
    42f8:	0a 46 14 00 	addi	20, r10, r8
    42fc:	1d 30       	mov	r29, r6
    42fe:	1d 96 05 00 	addi	5, r29, r18
    4302:	c2 92       	shl	2, r18
    4304:	ca 91       	add	r10, r18
    4306:	f2 41       	cmp	r18, r8
    4308:	f9 05       	bnl	4316 <___multiply+0x52>
    430a:	08 58       	mov	r8, r11
    430c:	6b 07 01 00 	st.w	r0, 0[r11]
    4310:	44 5a       	add	4, r11
    4312:	eb 91       	cmp	r11, r18
    4314:	cb fd       	bh	430c <___multiply+0x48>
    4316:	1c 9e 14 00 	addi	20, r28, r19
    431a:	45 d2       	add	5, r26
    431c:	c2 d2       	shl	2, r26
    431e:	da e1       	add	r26, r28
    4320:	1b 3e 14 00 	addi	20, r27, r7
    4324:	45 ca       	add	5, r25
    4326:	c2 ca       	shl	2, r25
    4328:	d9 d9       	add	r25, r27
    432a:	fb 39       	cmp	r27, r7
    432c:	b9 5d       	bnl	43e2 <___multiply+0x11e>
    432e:	e7 87 01 00 	ld.hu	0[r7], r16
    4332:	60 82       	cmp	0, r16
    4334:	92 2d       	be	4386 <___multiply+0xc2>
    4336:	08 58       	mov	r8, r11
    4338:	13 60       	mov	r19, r12
    433a:	00 8a       	mov	0, r17
    433c:	a5 05       	br	4340 <___multiply+0x7c>
    433e:	0d 58       	mov	r13, r11
    4340:	2c 77 01 00 	ld.w	0[r12], r14
    4344:	2b 7f 01 00 	ld.w	0[r11], r15
    4348:	cf 6e ff ff 	andi	65535, r15, r13
    434c:	cd 89       	add	r13, r17
    434e:	ce 6e ff ff 	andi	65535, r14, r13
    4352:	f0 6f 20 02 	mul	r16, r13, r0
    4356:	d1 69       	add	r17, r13
    4358:	90 72       	shr	16, r14
    435a:	f0 77 20 02 	mul	r16, r14, r0
    435e:	90 7a       	shr	16, r15
    4360:	cf 71       	add	r15, r14
    4362:	0d 88       	mov	r13, r17
    4364:	90 8a       	shr	16, r17
    4366:	d1 71       	add	r17, r14
    4368:	44 62       	add	4, r12
    436a:	0e 88       	mov	r14, r17
    436c:	90 8a       	shr	16, r17
    436e:	d0 72       	shl	16, r14
    4370:	cd 6e ff ff 	andi	65535, r13, r13
    4374:	0d 71       	or	r13, r14
    4376:	6b 77 01 00 	st.w	r14, 0[r11]
    437a:	0b 6e 04 00 	addi	4, r11, r13
    437e:	ec e1       	cmp	r12, r28
    4380:	fb dd       	bh	433e <___multiply+0x7a>
    4382:	6b 8f 05 00 	st.w	r17, 4[r11]
    4386:	e7 7f 03 00 	ld.hu	2[r7], r15
    438a:	60 7a       	cmp	0, r15
    438c:	f2 25       	be	43da <___multiply+0x116>
    438e:	28 6f 01 00 	ld.w	0[r8], r13
    4392:	08 58       	mov	r8, r11
    4394:	13 60       	mov	r19, r12
    4396:	00 82       	mov	0, r16
    4398:	0b 88       	mov	r11, r17
    439a:	ec 77 01 00 	ld.hu	0[r12], r14
    439e:	ef 77 20 02 	mul	r15, r14, r0
    43a2:	eb 4f 03 00 	ld.hu	2[r11], r9
    43a6:	c9 71       	add	r9, r14
    43a8:	d0 71       	add	r16, r14
    43aa:	0e 80       	mov	r14, r16
    43ac:	d0 82       	shl	16, r16
    43ae:	cd 6e ff ff 	andi	65535, r13, r13
    43b2:	10 69       	or	r16, r13
    43b4:	6b 6f 01 00 	st.w	r13, 0[r11]
    43b8:	eb 87 05 00 	ld.hu	4[r11], r16
    43bc:	ec 6f 03 00 	ld.hu	2[r12], r13
    43c0:	ef 6f 20 02 	mul	r15, r13, r0
    43c4:	d0 69       	add	r16, r13
    43c6:	90 72       	shr	16, r14
    43c8:	ce 69       	add	r14, r13
    43ca:	44 62       	add	4, r12
    43cc:	0d 80       	mov	r13, r16
    43ce:	90 82       	shr	16, r16
    43d0:	44 5a       	add	4, r11
    43d2:	ec e1       	cmp	r12, r28
    43d4:	ab e5       	bh	4398 <___multiply+0xd4>
    43d6:	71 6f 05 00 	st.w	r13, 4[r17]
    43da:	44 3a       	add	4, r7
    43dc:	44 42       	add	4, r8
    43de:	e7 d9       	cmp	r7, r27
    43e0:	fb a5       	bh	432e <___multiply+0x6a>
    43e2:	60 ea       	cmp	0, r29
    43e4:	97 15       	ble	4406 <___multiply+0x142>
    43e6:	45 32       	add	5, r6
    43e8:	c2 32       	shl	2, r6
    43ea:	0a 58       	mov	r10, r11
    43ec:	c6 59       	add	r6, r11
    43ee:	2b 5f fd ff 	ld.w	-4[r11], r11
    43f2:	60 5a       	cmp	0, r11
    43f4:	9a 0d       	bne	4406 <___multiply+0x142>
    43f6:	58 92       	add	-8, r18
    43f8:	5f ea       	add	-1, r29
    43fa:	e2 05       	be	4406 <___multiply+0x142>
    43fc:	5c 92       	add	-4, r18
    43fe:	32 5f 05 00 	ld.w	4[r18], r11
    4402:	60 5a       	cmp	0, r11
    4404:	a2 fd       	be	43f8 <___multiply+0x134>
    4406:	6a ef 11 00 	st.w	r29, 16[r10]
    440a:	09 02       	callt	9

0000440c <___pow5mult>:
    440c:	04 02       	callt	4
    440e:	06 d0       	mov	r6, r26
    4410:	07 d8       	mov	r7, r27
    4412:	08 e8       	mov	r8, r29
    4414:	c8 56 03 00 	andi	3, r8, r10
    4418:	c2 0d       	be	4430 <___pow5mult+0x24>
    441a:	c2 52       	shl	2, r10
    441c:	2b 06 f8 7a 	mov	0x7af8, r11
    4420:	00 00 
    4422:	cb 51       	add	r11, r10
    4424:	2a 47 01 00 	ld.w	0[r10], r8
    4428:	00 4a       	mov	0, r9
    442a:	bf ff 92 fc 	jarl	40bc <___multadd>, lp
    442e:	0a d8       	mov	r10, r27
    4430:	a2 ea       	sar	2, r29
    4432:	f2 35       	be	44a0 <___pow5mult+0x94>
    4434:	3a e7 49 00 	ld.w	72[r26], r28
    4438:	60 e2       	cmp	0, r28
    443a:	ea 0d       	bne	4456 <___pow5mult+0x4a>
    443c:	1a 30       	mov	r26, r6
    443e:	20 3e 71 02 	movea	625, r0, r7
    4442:	bf ff 6c fe 	jarl	42ae <___i2b>, lp
    4446:	0a e0       	mov	r10, r28
    4448:	7a 57 49 00 	st.w	r10, 72[r26]
    444c:	6a 07 01 00 	st.w	r0, 0[r10]
    4450:	b5 05       	br	4456 <___pow5mult+0x4a>
    4452:	0a e0       	mov	r10, r28
    4454:	f5 05       	br	4462 <___pow5mult+0x56>
    4456:	38 06 c4 42 	mov	0x42c4, r24
    445a:	00 00 
    445c:	37 06 98 40 	mov	0x4098, r23
    4460:	00 00 
    4462:	dd 56 01 00 	andi	1, r29, r10
    4466:	c2 0d       	be	447e <___pow5mult+0x72>
    4468:	1a 30       	mov	r26, r6
    446a:	1b 38       	mov	r27, r7
    446c:	1c 40       	mov	r28, r8
    446e:	f8 c7 60 f9 	jarl	[r24], lp
    4472:	0a c8       	mov	r10, r25
    4474:	1a 30       	mov	r26, r6
    4476:	1b 38       	mov	r27, r7
    4478:	f7 c7 60 f9 	jarl	[r23], lp
    447c:	19 d8       	mov	r25, r27
    447e:	a1 ea       	sar	1, r29
    4480:	82 15       	be	44a0 <___pow5mult+0x94>
    4482:	3c 57 01 00 	ld.w	0[r28], r10
    4486:	60 52       	cmp	0, r10
    4488:	da e5       	bne	4452 <___pow5mult+0x46>
    448a:	1a 30       	mov	r26, r6
    448c:	1c 38       	mov	r28, r7
    448e:	1c 40       	mov	r28, r8
    4490:	f8 c7 60 f9 	jarl	[r24], lp
    4494:	7c 57 01 00 	st.w	r10, 0[r28]
    4498:	6a 07 01 00 	st.w	r0, 0[r10]
    449c:	0a e0       	mov	r10, r28
    449e:	a5 e5       	br	4462 <___pow5mult+0x56>
    44a0:	1b 50       	mov	r27, r10
    44a2:	05 02       	callt	5

000044a4 <___lshift>:
    44a4:	04 02       	callt	4
    44a6:	06 c8       	mov	r6, r25
    44a8:	07 d8       	mov	r7, r27
    44aa:	08 c0       	mov	r8, r24
    44ac:	08 e8       	mov	r8, r29
    44ae:	a5 ea       	sar	5, r29
    44b0:	27 3f 05 00 	ld.w	4[r7], r7
    44b4:	3b bf 11 00 	ld.w	16[r27], r23
    44b8:	dd b9       	add	r29, r23
    44ba:	17 e6 01 00 	addi	1, r23, r28
    44be:	3b 57 09 00 	ld.w	8[r27], r10
    44c2:	ea e1       	cmp	r10, r28
    44c4:	d7 05       	ble	44ce <___lshift+0x2a>
    44c6:	41 3a       	add	1, r7
    44c8:	ca 51       	add	r10, r10
    44ca:	ea e1       	cmp	r10, r28
    44cc:	df fd       	bgt	44c6 <___lshift+0x22>
    44ce:	19 30       	mov	r25, r6
    44d0:	bf ff 5e fb 	jarl	402e <__Balloc>, lp
    44d4:	0a d0       	mov	r10, r26
    44d6:	0a 56 14 00 	addi	20, r10, r10
    44da:	60 ea       	cmp	0, r29
    44dc:	c7 0d       	ble	44f4 <___lshift+0x50>
    44de:	00 5a       	mov	0, r11
    44e0:	6a 07 01 00 	st.w	r0, 0[r10]
    44e4:	44 52       	add	4, r10
    44e6:	41 5a       	add	1, r11
    44e8:	fd 59       	cmp	r29, r11
    44ea:	ba fd       	bne	44e0 <___lshift+0x3c>
    44ec:	45 ea       	add	5, r29
    44ee:	c2 ea       	shl	2, r29
    44f0:	1a 50       	mov	r26, r10
    44f2:	dd 51       	add	r29, r10
    44f4:	1b 5e 14 00 	addi	20, r27, r11
    44f8:	3b 6f 11 00 	ld.w	16[r27], r13
    44fc:	45 6a       	add	5, r13
    44fe:	c2 6a       	shl	2, r13
    4500:	db 69       	add	r27, r13
    4502:	d8 c6 1f 00 	andi	31, r24, r24
    4506:	e2 1d       	be	4542 <___lshift+0x9e>
    4508:	20 7e 20 00 	movea	32, r0, r15
    450c:	b8 79       	sub	r24, r15
    450e:	00 62       	mov	0, r12
    4510:	a5 05       	br	4514 <___lshift+0x70>
    4512:	0e 50       	mov	r14, r10
    4514:	2b 77 01 00 	ld.w	0[r11], r14
    4518:	f8 77 c0 00 	shl	r24, r14
    451c:	0e 61       	or	r14, r12
    451e:	6a 67 01 00 	st.w	r12, 0[r10]
    4522:	0a 76 04 00 	addi	4, r10, r14
    4526:	2b 67 01 00 	ld.w	0[r11], r12
    452a:	ef 67 80 00 	shr	r15, r12
    452e:	44 5a       	add	4, r11
    4530:	eb 69       	cmp	r11, r13
    4532:	8b f5       	bh	4512 <___lshift+0x6e>
    4534:	6a 67 05 00 	st.w	r12, 4[r10]
    4538:	60 62       	cmp	0, r12
    453a:	c2 0d       	be	4552 <___lshift+0xae>
    453c:	17 e6 02 00 	addi	2, r23, r28
    4540:	95 0d       	br	4552 <___lshift+0xae>
    4542:	2b 67 01 00 	ld.w	0[r11], r12
    4546:	6a 67 01 00 	st.w	r12, 0[r10]
    454a:	44 52       	add	4, r10
    454c:	44 5a       	add	4, r11
    454e:	eb 69       	cmp	r11, r13
    4550:	9b fd       	bh	4542 <___lshift+0x9e>
    4552:	5f e2       	add	-1, r28
    4554:	7a e7 11 00 	st.w	r28, 16[r26]
    4558:	19 30       	mov	r25, r6
    455a:	1b 38       	mov	r27, r7
    455c:	bf ff 3c fb 	jarl	4098 <__Bfree>, lp
    4560:	1a 50       	mov	r26, r10
    4562:	05 02       	callt	5

00004564 <___mcmp>:
    4564:	26 57 11 00 	ld.w	16[r6], r10
    4568:	27 5f 11 00 	ld.w	16[r7], r11
    456c:	ab 51       	sub	r11, r10
    456e:	fa 15       	bne	459c <___mcmp+0x38>
    4570:	06 6e 14 00 	addi	20, r6, r13
    4574:	45 5a       	add	5, r11
    4576:	c2 5a       	shl	2, r11
    4578:	cb 31       	add	r11, r6
    457a:	cb 39       	add	r11, r7
    457c:	5c 3a       	add	-4, r7
    457e:	26 67 fd ff 	ld.w	-4[r6], r12
    4582:	27 5f 01 00 	ld.w	0[r7], r11
    4586:	eb 61       	cmp	r11, r12
    4588:	e2 05       	be	4594 <___mcmp+0x30>
    458a:	1f 52       	mov	-1, r10
    458c:	eb 61       	cmp	r11, r12
    458e:	e1 57 12 53 	cmov	nc/nl, 1, r10, r10
    4592:	d5 05       	br	459c <___mcmp+0x38>
    4594:	5c 32       	add	-4, r6
    4596:	5c 3a       	add	-4, r7
    4598:	e6 69       	cmp	r6, r13
    459a:	a1 f5       	bl	457e <___mcmp+0x1a>
    459c:	7f 00       	jmp	[lp]

0000459e <___mdiff>:
    459e:	0a 02       	callt	10
    45a0:	06 d8       	mov	r6, r27
    45a2:	07 e8       	mov	r7, r29
    45a4:	08 e0       	mov	r8, r28
    45a6:	07 30       	mov	r7, r6
    45a8:	08 38       	mov	r8, r7
    45aa:	bf ff ba ff 	jarl	4564 <___mcmp>, lp
    45ae:	60 52       	cmp	0, r10
    45b0:	ba 0d       	bne	45c6 <___mdiff+0x28>
    45b2:	1b 30       	mov	r27, r6
    45b4:	00 3a       	mov	0, r7
    45b6:	bf ff 78 fa 	jarl	402e <__Balloc>, lp
    45ba:	01 5a       	mov	1, r11
    45bc:	6a 5f 11 00 	st.w	r11, 16[r10]
    45c0:	6a 07 15 00 	st.w	r0, 20[r10]
    45c4:	c5 6d       	br	469c <___mdiff+0xfe>
    45c6:	60 52       	cmp	0, r10
    45c8:	b6 05       	blt	45ce <___mdiff+0x30>
    45ca:	00 d2       	mov	0, r26
    45cc:	d5 05       	br	45d6 <___mdiff+0x38>
    45ce:	1d 50       	mov	r29, r10
    45d0:	1c e8       	mov	r28, r29
    45d2:	0a e0       	mov	r10, r28
    45d4:	01 d2       	mov	1, r26
    45d6:	1b 30       	mov	r27, r6
    45d8:	3d 3f 05 00 	ld.w	4[r29], r7
    45dc:	bf ff 52 fa 	jarl	402e <__Balloc>, lp
    45e0:	6a d7 0d 00 	st.w	r26, 12[r10]
    45e4:	3d 87 11 00 	ld.w	16[r29], r16
    45e8:	1d 5e 14 00 	addi	20, r29, r11
    45ec:	10 66 05 00 	addi	5, r16, r12
    45f0:	c2 62       	shl	2, r12
    45f2:	cc e9       	add	r12, r29
    45f4:	1c 76 14 00 	addi	20, r28, r14
    45f8:	3c 67 11 00 	ld.w	16[r28], r12
    45fc:	45 62       	add	5, r12
    45fe:	c2 62       	shl	2, r12
    4600:	cc e1       	add	r12, r28
    4602:	0a 66 14 00 	addi	20, r10, r12
    4606:	00 6a       	mov	0, r13
    4608:	2b 8f 01 00 	ld.w	0[r11], r17
    460c:	2e 97 01 00 	ld.w	0[r14], r18
    4610:	d1 7e ff ff 	andi	65535, r17, r15
    4614:	cf 69       	add	r15, r13
    4616:	d2 9e ff ff 	andi	65535, r18, r19
    461a:	0d 78       	mov	r13, r15
    461c:	b3 79       	sub	r19, r15
    461e:	90 8a       	shr	16, r17
    4620:	90 92       	shr	16, r18
    4622:	b2 89       	sub	r18, r17
    4624:	0f 68       	mov	r15, r13
    4626:	b0 6a       	sar	16, r13
    4628:	cd 89       	add	r13, r17
    462a:	44 5a       	add	4, r11
    462c:	44 72       	add	4, r14
    462e:	11 68       	mov	r17, r13
    4630:	b0 6a       	sar	16, r13
    4632:	d0 8a       	shl	16, r17
    4634:	cf 7e ff ff 	andi	65535, r15, r15
    4638:	0f 89       	or	r15, r17
    463a:	6c 8f 01 00 	st.w	r17, 0[r12]
    463e:	44 62       	add	4, r12
    4640:	ee e1       	cmp	r14, r28
    4642:	bb e5       	bh	4608 <___mdiff+0x6a>
    4644:	0c 88       	mov	r12, r17
    4646:	0b 90       	mov	r11, r18
    4648:	eb e9       	cmp	r11, r29
    464a:	c3 1d       	bnh	4682 <___mdiff+0xe4>
    464c:	2b 7f 01 00 	ld.w	0[r11], r15
    4650:	cf 76 ff ff 	andi	65535, r15, r14
    4654:	cd 71       	add	r13, r14
    4656:	0e 68       	mov	r14, r13
    4658:	b0 6a       	sar	16, r13
    465a:	90 7a       	shr	16, r15
    465c:	cd 79       	add	r13, r15
    465e:	44 5a       	add	4, r11
    4660:	0f 68       	mov	r15, r13
    4662:	b0 6a       	sar	16, r13
    4664:	d0 7a       	shl	16, r15
    4666:	ce 76 ff ff 	andi	65535, r14, r14
    466a:	0e 79       	or	r14, r15
    466c:	6c 7f 01 00 	st.w	r15, 0[r12]
    4670:	44 62       	add	4, r12
    4672:	eb e9       	cmp	r11, r29
    4674:	cb ed       	bh	464c <___mdiff+0xae>
    4676:	32 60       	not	r18, r12
    4678:	dd 61       	add	r29, r12
    467a:	1c 5a       	mov	-4, r11
    467c:	4b 61       	and	r11, r12
    467e:	44 62       	add	4, r12
    4680:	d1 61       	add	r17, r12
    4682:	2c 5f fd ff 	ld.w	-4[r12], r11
    4686:	60 5a       	cmp	0, r11
    4688:	8a 0d       	bne	4698 <___mdiff+0xfa>
    468a:	58 62       	add	-8, r12
    468c:	5f 82       	add	-1, r16
    468e:	5c 62       	add	-4, r12
    4690:	2c 5f 05 00 	ld.w	4[r12], r11
    4694:	60 5a       	cmp	0, r11
    4696:	b2 fd       	be	468c <___mdiff+0xee>
    4698:	6a 87 11 00 	st.w	r16, 16[r10]
    469c:	0b 02       	callt	11

0000469e <___ulp>:
    469e:	40 5e f0 7f 	movhi	32752, r0, r11
    46a2:	47 59       	and	r7, r11
    46a4:	40 56 c0 fc 	movhi	-832, r0, r10
    46a8:	ca 59       	add	r10, r11
    46aa:	60 5a       	cmp	0, r11
    46ac:	b7 05       	ble	46b2 <___ulp+0x14>
    46ae:	00 52       	mov	0, r10
    46b0:	d5 1d       	br	46ea <___ulp+0x4c>
    46b2:	80 59       	subr	r0, r11
    46b4:	0b 50       	mov	r11, r10
    46b6:	b4 52       	sar	20, r10
    46b8:	20 5e 13 00 	movea	19, r0, r11
    46bc:	eb 51       	cmp	r11, r10
    46be:	ff 05       	bgt	46cc <___ulp+0x2e>
    46c0:	40 5e 08 00 	movhi	8, r0, r11
    46c4:	ea 5f a0 00 	sar	r10, r11
    46c8:	00 52       	mov	0, r10
    46ca:	85 15       	br	46ea <___ulp+0x4c>
    46cc:	00 5a       	mov	0, r11
    46ce:	0a 6e ec ff 	addi	-20, r10, r13
    46d2:	20 66 1e 00 	movea	30, r0, r12
    46d6:	ec 69       	cmp	r12, r13
    46d8:	8f 0d       	bgt	46e8 <___ulp+0x4a>
    46da:	20 66 33 00 	movea	51, r0, r12
    46de:	aa 61       	sub	r10, r12
    46e0:	01 52       	mov	1, r10
    46e2:	ec 57 c0 00 	shl	r12, r10
    46e6:	a5 05       	br	46ea <___ulp+0x4c>
    46e8:	01 52       	mov	1, r10
    46ea:	7f 00       	jmp	[lp]

000046ec <___b2d>:
    46ec:	04 02       	callt	4
    46ee:	06 e8       	mov	r6, r29
    46f0:	07 b8       	mov	r7, r23
    46f2:	06 c6 14 00 	addi	20, r6, r24
    46f6:	26 cf 11 00 	ld.w	16[r6], r25
    46fa:	19 de 05 00 	addi	5, r25, r27
    46fe:	c2 da       	shl	2, r27
    4700:	c6 d9       	add	r6, r27
    4702:	1b d6 fc ff 	addi	-4, r27, r26
    4706:	3b e7 fd ff 	ld.w	-4[r27], r28
    470a:	1c 30       	mov	r28, r6
    470c:	bf ff e2 fa 	jarl	41ee <___hi0bits>, lp
    4710:	20 5e 20 00 	movea	32, r0, r11
    4714:	aa 59       	sub	r10, r11
    4716:	77 5f 01 00 	st.w	r11, 0[r23]
    471a:	6a 52       	cmp	10, r10
    471c:	8f 1d       	bgt	474c <___b2d+0x60>
    471e:	0b 62       	mov	11, r12
    4720:	aa 61       	sub	r10, r12
    4722:	1c 58       	mov	r28, r11
    4724:	ec 5f 80 00 	shr	r12, r11
    4728:	40 6e f0 3f 	movhi	16368, r0, r13
    472c:	0d 59       	or	r13, r11
    472e:	fa c1       	cmp	r26, r24
    4730:	c9 05       	bnl	4738 <___b2d+0x4c>
    4732:	3b 6f f9 ff 	ld.w	-8[r27], r13
    4736:	a5 05       	br	473a <___b2d+0x4e>
    4738:	00 6a       	mov	0, r13
    473a:	ec 6f 80 00 	shr	r12, r13
    473e:	0a 56 15 00 	addi	21, r10, r10
    4742:	ea e7 c0 00 	shl	r10, r28
    4746:	0d 50       	mov	r13, r10
    4748:	1c 51       	or	r28, r10
    474a:	b5 2d       	br	47a0 <___b2d+0xb4>
    474c:	fa c1       	cmp	r26, r24
    474e:	99 0d       	bnl	4760 <___b2d+0x74>
    4750:	1b d6 f8 ff 	addi	-8, r27, r26
    4754:	45 ca       	add	5, r25
    4756:	c2 ca       	shl	2, r25
    4758:	d9 e9       	add	r25, r29
    475a:	3d 6f f9 ff 	ld.w	-8[r29], r13
    475e:	a5 05       	br	4762 <___b2d+0x76>
    4760:	00 6a       	mov	0, r13
    4762:	0a 66 f5 ff 	addi	-11, r10, r12
    4766:	92 1d       	be	4798 <___b2d+0xac>
    4768:	20 76 2b 00 	movea	43, r0, r14
    476c:	aa 71       	sub	r10, r14
    476e:	ec e7 c0 00 	shl	r12, r28
    4772:	40 5e f0 3f 	movhi	16368, r0, r11
    4776:	1c 59       	or	r28, r11
    4778:	0d 50       	mov	r13, r10
    477a:	ee 57 80 00 	shr	r14, r10
    477e:	0a 59       	or	r10, r11
    4780:	f8 d1       	cmp	r24, r26
    4782:	c3 05       	bnh	478a <___b2d+0x9e>
    4784:	3a 57 fd ff 	ld.w	-4[r26], r10
    4788:	a5 05       	br	478c <___b2d+0xa0>
    478a:	00 52       	mov	0, r10
    478c:	ee 57 80 00 	shr	r14, r10
    4790:	ec 6f c0 00 	shl	r12, r13
    4794:	0d 51       	or	r13, r10
    4796:	d5 05       	br	47a0 <___b2d+0xb4>
    4798:	40 5e f0 3f 	movhi	16368, r0, r11
    479c:	1c 59       	or	r28, r11
    479e:	0d 50       	mov	r13, r10
    47a0:	05 02       	callt	5

000047a2 <___d2b>:
    47a2:	08 02       	callt	8
    47a4:	58 1a       	add	-8, sp
    47a6:	08 d8       	mov	r8, r27
    47a8:	09 e8       	mov	r9, r29
    47aa:	23 d7 21 00 	ld.w	32[sp], r26
    47ae:	23 cf 25 00 	ld.w	36[sp], r25
    47b2:	01 3a       	mov	1, r7
    47b4:	bf ff 7a f8 	jarl	402e <__Balloc>, lp
    47b8:	0a e0       	mov	r10, r28
    47ba:	2a 06 ff ff 	mov	0xfffff, r10
    47be:	0f 00 
    47c0:	5d 51       	and	r29, r10
    47c2:	63 57 01 00 	st.w	r10, 0[sp]
    47c6:	2b 06 ff ff 	mov	0x7fffffff, r11
    47ca:	ff 7f 
    47cc:	4b e9       	and	r11, r29
    47ce:	94 ea       	shr	20, r29
    47d0:	e2 05       	be	47dc <___d2b+0x3a>
    47d2:	40 5e 10 00 	movhi	16, r0, r11
    47d6:	0b 51       	or	r11, r10
    47d8:	63 57 01 00 	st.w	r10, 0[sp]
    47dc:	60 da       	cmp	0, r27
    47de:	92 2d       	be	4830 <___d2b+0x8e>
    47e0:	63 df 05 00 	st.w	r27, 4[sp]
    47e4:	03 36 04 00 	addi	4, sp, r6
    47e8:	bf ff 52 fa 	jarl	423a <___lo0bits>, lp
    47ec:	60 52       	cmp	0, r10
    47ee:	a2 15       	be	4812 <___d2b+0x70>
    47f0:	23 5f 01 00 	ld.w	0[sp], r11
    47f4:	0a 60       	mov	r10, r12
    47f6:	80 61       	subr	r0, r12
    47f8:	0b 68       	mov	r11, r13
    47fa:	ec 6f c0 00 	shl	r12, r13
    47fe:	23 67 05 00 	ld.w	4[sp], r12
    4802:	0d 61       	or	r13, r12
    4804:	7c 67 15 00 	st.w	r12, 20[r28]
    4808:	ea 5f 80 00 	shr	r10, r11
    480c:	63 5f 01 00 	st.w	r11, 0[sp]
    4810:	d5 05       	br	481a <___d2b+0x78>
    4812:	23 5f 05 00 	ld.w	4[sp], r11
    4816:	7c 5f 15 00 	st.w	r11, 20[r28]
    481a:	23 5f 01 00 	ld.w	0[sp], r11
    481e:	7c 5f 19 00 	st.w	r11, 24[r28]
    4822:	02 da       	mov	2, r27
    4824:	60 5a       	cmp	0, r11
    4826:	e1 df 04 db 	cmov	z, 1, r27, r27
    482a:	7c df 11 00 	st.w	r27, 16[r28]
    482e:	d5 0d       	br	4848 <___d2b+0xa6>
    4830:	03 30       	mov	sp, r6
    4832:	bf ff 08 fa 	jarl	423a <___lo0bits>, lp
    4836:	23 5f 01 00 	ld.w	0[sp], r11
    483a:	7c 5f 15 00 	st.w	r11, 20[r28]
    483e:	01 da       	mov	1, r27
    4840:	7c df 11 00 	st.w	r27, 16[r28]
    4844:	0a 56 20 00 	addi	32, r10, r10
    4848:	60 ea       	cmp	0, r29
    484a:	c2 0d       	be	4862 <___d2b+0xc0>
    484c:	1d ee cd fb 	addi	-1075, r29, r29
    4850:	ca e9       	add	r10, r29
    4852:	7a ef 01 00 	st.w	r29, 0[r26]
    4856:	20 5e 35 00 	movea	53, r0, r11
    485a:	8b 51       	subr	r11, r10
    485c:	79 57 01 00 	st.w	r10, 0[r25]
    4860:	95 15       	br	4882 <___d2b+0xe0>
    4862:	0a 56 ce fb 	addi	-1074, r10, r10
    4866:	7a 57 01 00 	st.w	r10, 0[r26]
    486a:	1b 56 04 00 	addi	4, r27, r10
    486e:	c2 52       	shl	2, r10
    4870:	dc 51       	add	r28, r10
    4872:	2a 37 01 00 	ld.w	0[r10], r6
    4876:	bf ff 78 f9 	jarl	41ee <___hi0bits>, lp
    487a:	c5 da       	shl	5, r27
    487c:	aa d9       	sub	r10, r27
    487e:	79 df 01 00 	st.w	r27, 0[r25]
    4882:	1c 50       	mov	r28, r10
    4884:	48 1a       	add	8, sp
    4886:	09 02       	callt	9

00004888 <___ratio>:
    4888:	06 02       	callt	6
    488a:	58 1a       	add	-8, sp
    488c:	06 c8       	mov	r6, r25
    488e:	07 e0       	mov	r7, r28
    4890:	03 3e 04 00 	addi	4, sp, r7
    4894:	3d 06 ec 46 	mov	0x46ec, r29
    4898:	00 00 
    489a:	fd c7 60 f9 	jarl	[r29], lp
    489e:	0a c0       	mov	r10, r24
    48a0:	0b d8       	mov	r11, r27
    48a2:	0b d0       	mov	r11, r26
    48a4:	1c 30       	mov	r28, r6
    48a6:	03 38       	mov	sp, r7
    48a8:	fd c7 60 f9 	jarl	[r29], lp
    48ac:	0b 48       	mov	r11, r9
    48ae:	23 67 01 00 	ld.w	0[sp], r12
    48b2:	23 6f 05 00 	ld.w	4[sp], r13
    48b6:	ac 69       	sub	r12, r13
    48b8:	39 77 11 00 	ld.w	16[r25], r14
    48bc:	3c 67 11 00 	ld.w	16[r28], r12
    48c0:	8e 61       	subr	r14, r12
    48c2:	c5 62       	shl	5, r12
    48c4:	cd 61       	add	r13, r12
    48c6:	60 62       	cmp	0, r12
    48c8:	d7 05       	ble	48d2 <___ratio+0x4a>
    48ca:	d4 62       	shl	20, r12
    48cc:	0c d0       	mov	r12, r26
    48ce:	db d1       	add	r27, r26
    48d0:	c5 05       	br	48d8 <___ratio+0x50>
    48d2:	d4 62       	shl	20, r12
    48d4:	0b 48       	mov	r11, r9
    48d6:	ac 49       	sub	r12, r9
    48d8:	18 30       	mov	r24, r6
    48da:	1a 38       	mov	r26, r7
    48dc:	0a 40       	mov	r10, r8
    48de:	80 ff b0 26 	jarl	6f8e <___divdf3>, lp
    48e2:	48 1a       	add	8, sp
    48e4:	07 02       	callt	7

000048e6 <__mprec_log10>:
    48e6:	0c 02       	callt	12
    48e8:	06 e8       	mov	r6, r29
    48ea:	20 56 17 00 	movea	23, r0, r10
    48ee:	ea 31       	cmp	r10, r6
    48f0:	f7 05       	ble	48fe <__mprec_log10+0x18>
    48f2:	60 32       	cmp	0, r6
    48f4:	ff 0d       	bgt	4912 <__mprec_log10+0x2c>
    48f6:	00 52       	mov	0, r10
    48f8:	40 5e f0 3f 	movhi	16368, r0, r11
    48fc:	b5 1d       	br	4932 <__mprec_log10+0x4c>
    48fe:	c3 ea       	shl	3, r29
    4900:	2a 06 34 7a 	mov	0x7a34, r10
    4904:	00 00 
    4906:	ca e9       	add	r10, r29
    4908:	3d 57 01 00 	ld.w	0[r29], r10
    490c:	3d 5f 05 00 	ld.w	4[r29], r11
    4910:	95 15       	br	4932 <__mprec_log10+0x4c>
    4912:	00 52       	mov	0, r10
    4914:	40 5e f0 3f 	movhi	16368, r0, r11
    4918:	3c 06 4e 6d 	mov	0x6d4e, r28
    491c:	00 00 
    491e:	40 de 24 40 	movhi	16420, r0, r27
    4922:	0a 30       	mov	r10, r6
    4924:	0b 38       	mov	r11, r7
    4926:	00 42       	mov	0, r8
    4928:	1b 48       	mov	r27, r9
    492a:	fc c7 60 f9 	jarl	[r28], lp
    492e:	5f ea       	add	-1, r29
    4930:	9a fd       	bne	4922 <__mprec_log10+0x3c>
    4932:	0d 02       	callt	13

00004934 <___copybits>:
    4934:	07 76 ff ff 	addi	-1, r7, r14
    4938:	a5 72       	sar	5, r14
    493a:	41 72       	add	1, r14
    493c:	c2 72       	shl	2, r14
    493e:	c6 71       	add	r6, r14
    4940:	08 56 14 00 	addi	20, r8, r10
    4944:	28 6f 11 00 	ld.w	16[r8], r13
    4948:	45 6a       	add	5, r13
    494a:	c2 6a       	shl	2, r13
    494c:	c8 69       	add	r8, r13
    494e:	ed 51       	cmp	r13, r10
    4950:	a9 15       	bnl	4974 <___copybits+0x40>
    4952:	06 58       	mov	r6, r11
    4954:	2a 67 01 00 	ld.w	0[r10], r12
    4958:	6b 67 01 00 	st.w	r12, 0[r11]
    495c:	44 5a       	add	4, r11
    495e:	44 52       	add	4, r10
    4960:	ea 69       	cmp	r10, r13
    4962:	9b fd       	bh	4954 <___copybits+0x20>
    4964:	0d 50       	mov	r13, r10
    4966:	a8 51       	sub	r8, r10
    4968:	0a 56 eb ff 	addi	-21, r10, r10
    496c:	1c 5a       	mov	-4, r11
    496e:	4b 51       	and	r11, r10
    4970:	44 52       	add	4, r10
    4972:	ca 31       	add	r10, r6
    4974:	e6 71       	cmp	r6, r14
    4976:	e3 05       	bnh	4982 <___copybits+0x4e>
    4978:	66 07 01 00 	st.w	r0, 0[r6]
    497c:	44 32       	add	4, r6
    497e:	e6 71       	cmp	r6, r14
    4980:	cb fd       	bh	4978 <___copybits+0x44>
    4982:	7f 00       	jmp	[lp]

00004984 <___any_on>:
    4984:	26 5f 11 00 	ld.w	16[r6], r11
    4988:	07 50       	mov	r7, r10
    498a:	a5 52       	sar	5, r10
    498c:	ea 59       	cmp	r10, r11
    498e:	b6 15       	blt	49b4 <___any_on+0x30>
    4990:	b7 15       	ble	49b6 <___any_on+0x32>
    4992:	c7 3e 1f 00 	andi	31, r7, r7
    4996:	82 15       	be	49b6 <___any_on+0x32>
    4998:	0a 5e 05 00 	addi	5, r10, r11
    499c:	c2 5a       	shl	2, r11
    499e:	c6 59       	add	r6, r11
    49a0:	2b 5f 01 00 	ld.w	0[r11], r11
    49a4:	0b 60       	mov	r11, r12
    49a6:	e7 67 80 00 	shr	r7, r12
    49aa:	e7 67 c0 00 	shl	r7, r12
    49ae:	eb 61       	cmp	r11, r12
    49b0:	8a 25       	bne	49f0 <___any_on+0x6c>
    49b2:	a5 05       	br	49b6 <___any_on+0x32>
    49b4:	0b 50       	mov	r11, r10
    49b6:	06 66 14 00 	addi	20, r6, r12
    49ba:	0a 5e 05 00 	addi	5, r10, r11
    49be:	c2 5a       	shl	2, r11
    49c0:	c6 59       	add	r6, r11
    49c2:	eb 61       	cmp	r11, r12
    49c4:	89 1d       	bnl	49f4 <___any_on+0x70>
    49c6:	2b 57 fd ff 	ld.w	-4[r11], r10
    49ca:	60 52       	cmp	0, r10
    49cc:	ea 15       	bne	49f8 <___any_on+0x74>
    49ce:	0b 56 f8 ff 	addi	-8, r11, r10
    49d2:	2c 60       	not	r12, r12
    49d4:	cb 61       	add	r11, r12
    49d6:	1c 5a       	mov	-4, r11
    49d8:	4b 61       	and	r11, r12
    49da:	8a 61       	subr	r10, r12
    49dc:	e5 05       	br	49e8 <___any_on+0x64>
    49de:	5c 52       	add	-4, r10
    49e0:	2a 5f 05 00 	ld.w	4[r10], r11
    49e4:	60 5a       	cmp	0, r11
    49e6:	ba 0d       	bne	49fc <___any_on+0x78>
    49e8:	ec 51       	cmp	r12, r10
    49ea:	aa fd       	bne	49de <___any_on+0x5a>
    49ec:	00 52       	mov	0, r10
    49ee:	85 0d       	br	49fe <___any_on+0x7a>
    49f0:	01 52       	mov	1, r10
    49f2:	e5 05       	br	49fe <___any_on+0x7a>
    49f4:	00 52       	mov	0, r10
    49f6:	c5 05       	br	49fe <___any_on+0x7a>
    49f8:	01 52       	mov	1, r10
    49fa:	a5 05       	br	49fe <___any_on+0x7a>
    49fc:	01 52       	mov	1, r10
    49fe:	7f 00       	jmp	[lp]

00004a00 <___fpclassifyd>:
    4a00:	07 50       	mov	r7, r10
    4a02:	60 3a       	cmp	0, r7
    4a04:	d2 05       	be	4a0e <___fpclassifyd+0xe>
    4a06:	40 5e 00 80 	movhi	-32768, r0, r11
    4a0a:	eb 39       	cmp	r11, r7
    4a0c:	ba 05       	bne	4a12 <___fpclassifyd+0x12>
    4a0e:	60 32       	cmp	0, r6
    4a10:	f2 25       	be	4a5e <___fpclassifyd+0x5e>
    4a12:	40 66 f0 ff 	movhi	-16, r0, r12
    4a16:	c7 61       	add	r7, r12
    4a18:	2b 06 ff ff 	mov	0x7fdfffff, r11
    4a1c:	df 7f 
    4a1e:	eb 61       	cmp	r11, r12
    4a20:	93 25       	bnh	4a62 <___fpclassifyd+0x62>
    4a22:	40 66 f0 7f 	movhi	32752, r0, r12
    4a26:	c7 61       	add	r7, r12
    4a28:	eb 61       	cmp	r11, r12
    4a2a:	e3 1d       	bnh	4a66 <___fpclassifyd+0x66>
    4a2c:	2b 06 ff ff 	mov	0xfffff, r11
    4a30:	0f 00 
    4a32:	eb 51       	cmp	r11, r10
    4a34:	b3 1d       	bnh	4a6a <___fpclassifyd+0x6a>
    4a36:	40 5e 00 80 	movhi	-32768, r0, r11
    4a3a:	cb 39       	add	r11, r7
    4a3c:	2b 06 ff ff 	mov	0xfffff, r11
    4a40:	0f 00 
    4a42:	eb 39       	cmp	r11, r7
    4a44:	d3 15       	bnh	4a6e <___fpclassifyd+0x6e>
    4a46:	40 5e f0 7f 	movhi	32752, r0, r11
    4a4a:	eb 51       	cmp	r11, r10
    4a4c:	d2 05       	be	4a56 <___fpclassifyd+0x56>
    4a4e:	40 5e f0 ff 	movhi	-16, r0, r11
    4a52:	eb 51       	cmp	r11, r10
    4a54:	fa 0d       	bne	4a72 <___fpclassifyd+0x72>
    4a56:	60 32       	cmp	0, r6
    4a58:	e2 57 00 00 	setf	z, r10
    4a5c:	c5 0d       	br	4a74 <___fpclassifyd+0x74>
    4a5e:	02 52       	mov	2, r10
    4a60:	a5 0d       	br	4a74 <___fpclassifyd+0x74>
    4a62:	04 52       	mov	4, r10
    4a64:	85 0d       	br	4a74 <___fpclassifyd+0x74>
    4a66:	04 52       	mov	4, r10
    4a68:	e5 05       	br	4a74 <___fpclassifyd+0x74>
    4a6a:	03 52       	mov	3, r10
    4a6c:	c5 05       	br	4a74 <___fpclassifyd+0x74>
    4a6e:	03 52       	mov	3, r10
    4a70:	a5 05       	br	4a74 <___fpclassifyd+0x74>
    4a72:	00 52       	mov	0, r10
    4a74:	7f 00       	jmp	[lp]

00004a76 <_frexp>:
    4a76:	10 02       	callt	16
    4a78:	06 50       	mov	r6, r10
    4a7a:	08 e8       	mov	r8, r29
    4a7c:	07 68       	mov	r7, r13
    4a7e:	2b 06 ff ff 	mov	0x7fffffff, r11
    4a82:	ff 7f 
    4a84:	47 59       	and	r7, r11
    4a86:	68 07 01 00 	st.w	r0, 0[r8]
    4a8a:	2c 06 ff ff 	mov	0x7fefffff, r12
    4a8e:	ef 7f 
    4a90:	ec 59       	cmp	r12, r11
    4a92:	ef 25       	bgt	4ade <_frexp+0x68>
    4a94:	0b 60       	mov	r11, r12
    4a96:	06 61       	or	r6, r12
    4a98:	b2 25       	be	4ade <_frexp+0x68>
    4a9a:	2c 06 ff ff 	mov	0xfffff, r12
    4a9e:	0f 00 
    4aa0:	ec 59       	cmp	r12, r11
    4aa2:	ff 0d       	bgt	4ac0 <_frexp+0x4a>
    4aa4:	00 42       	mov	0, r8
    4aa6:	40 4e 50 43 	movhi	17232, r0, r9
    4aaa:	80 ff a4 22 	jarl	6d4e <___muldf3>, lp
    4aae:	0b 68       	mov	r11, r13
    4ab0:	2c 06 ff ff 	mov	0x7fffffff, r12
    4ab4:	ff 7f 
    4ab6:	4c 59       	and	r12, r11
    4ab8:	20 66 ca ff 	movea	-54, r0, r12
    4abc:	7d 67 01 00 	st.w	r12, 0[r29]
    4ac0:	b4 5a       	sar	20, r11
    4ac2:	0b 5e 02 fc 	addi	-1022, r11, r11
    4ac6:	3d 67 01 00 	ld.w	0[r29], r12
    4aca:	cc 59       	add	r12, r11
    4acc:	7d 5f 01 00 	st.w	r11, 0[r29]
    4ad0:	27 06 ff ff 	mov	0x800fffff, r7
    4ad4:	0f 80 
    4ad6:	4d 39       	and	r13, r7
    4ad8:	40 5e e0 3f 	movhi	16352, r0, r11
    4adc:	0b 39       	or	r11, r7
    4ade:	07 58       	mov	r7, r11
    4ae0:	11 02       	callt	17

00004ae2 <__sbrk_r>:
    4ae2:	10 02       	callt	16
    4ae4:	06 e8       	mov	r6, r29
    4ae6:	2a 06 d4 08 	mov	0xfedf08d4, r10
    4aea:	df fe 
    4aec:	6a 07 01 00 	st.w	r0, 0[r10]
    4af0:	07 30       	mov	r7, r6
    4af2:	80 ff 58 14 	jarl	5f4a <__sbrk>, lp
    4af6:	7f 52       	cmp	-1, r10
    4af8:	aa 0d       	bne	4b0c <__sbrk_r+0x2a>
    4afa:	2b 06 d4 08 	mov	0xfedf08d4, r11
    4afe:	df fe 
    4b00:	2b 5f 01 00 	ld.w	0[r11], r11
    4b04:	60 5a       	cmp	0, r11
    4b06:	b2 05       	be	4b0c <__sbrk_r+0x2a>
    4b08:	7d 5f 01 00 	st.w	r11, 0[r29]
    4b0c:	11 02       	callt	17

00004b0e <__stat>:
    4b0e:	12 02       	callt	18
    4b10:	06 50       	mov	r6, r10
    4b12:	07 40       	mov	r7, r8
    4b14:	20 36 26 00 	movea	38, r0, r6
    4b18:	0a 38       	mov	r10, r7
    4b1a:	00 4a       	mov	0, r9
    4b1c:	80 ff 78 0e 	jarl	5994 <___trap0>, lp
    4b20:	13 02       	callt	19

00004b22 <_strcmp>:
    4b22:	06 57 00 00 	ld.b	0[r6], r10
    4b26:	60 52       	cmp	0, r10
    4b28:	b2 15       	be	4b4e <_strcmp+0x2c>
    4b2a:	07 5f 00 00 	ld.b	0[r7], r11
    4b2e:	ea 59       	cmp	r10, r11
    4b30:	fa 0d       	bne	4b4e <_strcmp+0x2c>
    4b32:	41 32       	add	1, r6
    4b34:	07 5e 01 00 	addi	1, r7, r11
    4b38:	41 3a       	add	1, r7
    4b3a:	06 57 00 00 	ld.b	0[r6], r10
    4b3e:	60 52       	cmp	0, r10
    4b40:	f2 05       	be	4b4e <_strcmp+0x2c>
    4b42:	0b 67 00 00 	ld.b	0[r11], r12
    4b46:	41 32       	add	1, r6
    4b48:	41 5a       	add	1, r11
    4b4a:	ec 51       	cmp	r12, r10
    4b4c:	e2 f5       	be	4b38 <_strcmp+0x16>
    4b4e:	8a 00       	zxb	r10
    4b50:	87 5f 01 00 	ld.bu	0[r7], r11
    4b54:	ab 51       	sub	r11, r10
    4b56:	7f 00       	jmp	[lp]

00004b58 <_strlen>:
    4b58:	06 57 00 00 	ld.b	0[r6], r10
    4b5c:	60 52       	cmp	0, r10
    4b5e:	b2 0d       	be	4b74 <_strlen+0x1c>
    4b60:	06 5e 01 00 	addi	1, r6, r11
    4b64:	06 50       	mov	r6, r10
    4b66:	41 52       	add	1, r10
    4b68:	41 5a       	add	1, r11
    4b6a:	0b 67 ff ff 	ld.b	-1[r11], r12
    4b6e:	60 62       	cmp	0, r12
    4b70:	ba fd       	bne	4b66 <_strlen+0xe>
    4b72:	a5 05       	br	4b76 <_strlen+0x1e>
    4b74:	06 50       	mov	r6, r10
    4b76:	a6 51       	sub	r6, r10
    4b78:	7f 00       	jmp	[lp]

00004b7a <___ssprint_r>:
    4b7a:	00 02       	callt	0
    4b7c:	06 a0       	mov	r6, r20
    4b7e:	07 e8       	mov	r7, r29
    4b80:	08 c0       	mov	r8, r24
    4b82:	28 d7 01 00 	ld.w	0[r8], r26
    4b86:	28 57 09 00 	ld.w	8[r8], r10
    4b8a:	60 52       	cmp	0, r10
    4b8c:	ba 0d       	bne	4ba2 <___ssprint_r+0x28>
    4b8e:	68 07 05 00 	st.w	r0, 4[r8]
    4b92:	80 07 1e 01 	jr	4cb0 <___ssprint_r+0x136>
    4b96:	3a cf 01 00 	ld.w	0[r26], r25
    4b9a:	3a e7 05 00 	ld.w	4[r26], r28
    4b9e:	48 d2       	add	8, r26
    4ba0:	e5 05       	br	4bac <___ssprint_r+0x32>
    4ba2:	00 ca       	mov	0, r25
    4ba4:	00 e2       	mov	0, r28
    4ba6:	35 06 26 5a 	mov	0x5a26, r21
    4baa:	00 00 
    4bac:	60 e2       	cmp	0, r28
    4bae:	c2 f5       	be	4b96 <___ssprint_r+0x1c>
    4bb0:	3d df 09 00 	ld.w	8[r29], r27
    4bb4:	fb e1       	cmp	r27, r28
    4bb6:	c1 55       	bl	4c5e <___ssprint_r+0xe4>
    4bb8:	3d 57 0c 00 	ld.h	12[r29], r10
    4bbc:	ca 5e 80 04 	andi	1152, r10, r11
    4bc0:	82 55       	be	4c60 <___ssprint_r+0xe6>
    4bc2:	3d 3f 11 00 	ld.w	16[r29], r7
    4bc6:	3d b7 01 00 	ld.w	0[r29], r22
    4bca:	a7 b1       	sub	r7, r22
    4bcc:	3d 5f 15 00 	ld.w	20[r29], r11
    4bd0:	0b b8       	mov	r11, r23
    4bd2:	cb b9       	add	r11, r23
    4bd4:	d7 59       	add	r23, r11
    4bd6:	0b b8       	mov	r11, r23
    4bd8:	9f ba       	shr	31, r23
    4bda:	cb b9       	add	r11, r23
    4bdc:	a1 ba       	sar	1, r23
    4bde:	16 5e 01 00 	addi	1, r22, r11
    4be2:	dc 59       	add	r28, r11
    4be4:	eb b9       	cmp	r11, r23
    4be6:	f7 5f 32 bb 	cmov	nc/nl, r23, r11, r23
    4bea:	ca 56 00 04 	andi	1024, r10, r10
    4bee:	c2 1d       	be	4c26 <___ssprint_r+0xac>
    4bf0:	14 30       	mov	r20, r6
    4bf2:	17 38       	mov	r23, r7
    4bf4:	bf ff 62 ed 	jarl	3956 <__malloc_r>, lp
    4bf8:	0a d8       	mov	r10, r27
    4bfa:	60 52       	cmp	0, r10
    4bfc:	da 05       	bne	4c06 <___ssprint_r+0x8c>
    4bfe:	0c 52       	mov	12, r10
    4c00:	74 57 01 00 	st.w	r10, 0[r20]
    4c04:	b5 4d       	br	4c9a <___ssprint_r+0x120>
    4c06:	0a 30       	mov	r10, r6
    4c08:	3d 3f 11 00 	ld.w	16[r29], r7
    4c0c:	16 40       	mov	r22, r8
    4c0e:	bf ff 02 f4 	jarl	4010 <_memcpy>, lp
    4c12:	3d 57 0c 00 	ld.h	12[r29], r10
    4c16:	20 5e 7f fb 	movea	-1153, r0, r11
    4c1a:	4b 51       	and	r11, r10
    4c1c:	8a 56 80 00 	ori	128, r10, r10
    4c20:	7d 57 0c 00 	st.h	r10, 12[r29]
    4c24:	95 15       	br	4c46 <___ssprint_r+0xcc>
    4c26:	14 30       	mov	r20, r6
    4c28:	17 40       	mov	r23, r8
    4c2a:	80 ff 5e 0e 	jarl	5a88 <__realloc_r>, lp
    4c2e:	0a d8       	mov	r10, r27
    4c30:	60 52       	cmp	0, r10
    4c32:	aa 0d       	bne	4c46 <___ssprint_r+0xcc>
    4c34:	14 30       	mov	r20, r6
    4c36:	3d 3f 11 00 	ld.w	16[r29], r7
    4c3a:	bf ff 32 ea 	jarl	366c <__free_r>, lp
    4c3e:	0c 52       	mov	12, r10
    4c40:	74 57 01 00 	st.w	r10, 0[r20]
    4c44:	b5 2d       	br	4c9a <___ssprint_r+0x120>
    4c46:	7d df 11 00 	st.w	r27, 16[r29]
    4c4a:	d6 d9       	add	r22, r27
    4c4c:	7d df 01 00 	st.w	r27, 0[r29]
    4c50:	7d bf 15 00 	st.w	r23, 20[r29]
    4c54:	1c d8       	mov	r28, r27
    4c56:	b6 b9       	sub	r22, r23
    4c58:	7d bf 09 00 	st.w	r23, 8[r29]
    4c5c:	a5 05       	br	4c60 <___ssprint_r+0xe6>
    4c5e:	1c d8       	mov	r28, r27
    4c60:	3d 37 01 00 	ld.w	0[r29], r6
    4c64:	19 38       	mov	r25, r7
    4c66:	1b 40       	mov	r27, r8
    4c68:	f5 c7 60 f9 	jarl	[r21], lp
    4c6c:	3d 57 09 00 	ld.w	8[r29], r10
    4c70:	bb 51       	sub	r27, r10
    4c72:	7d 57 09 00 	st.w	r10, 8[r29]
    4c76:	3d 57 01 00 	ld.w	0[r29], r10
    4c7a:	ca d9       	add	r10, r27
    4c7c:	7d df 01 00 	st.w	r27, 0[r29]
    4c80:	38 57 09 00 	ld.w	8[r24], r10
    4c84:	bc 51       	sub	r28, r10
    4c86:	78 57 09 00 	st.w	r10, 8[r24]
    4c8a:	c2 05       	be	4c92 <___ssprint_r+0x118>
    4c8c:	dc c9       	add	r28, r25
    4c8e:	00 e2       	mov	0, r28
    4c90:	e5 8d       	br	4bac <___ssprint_r+0x32>
    4c92:	78 07 05 00 	st.w	r0, 4[r24]
    4c96:	00 52       	mov	0, r10
    4c98:	c5 0d       	br	4cb0 <___ssprint_r+0x136>
    4c9a:	3d 57 0c 00 	ld.h	12[r29], r10
    4c9e:	8a 56 40 00 	ori	64, r10, r10
    4ca2:	7d 57 0c 00 	st.h	r10, 12[r29]
    4ca6:	78 07 09 00 	st.w	r0, 8[r24]
    4caa:	78 07 05 00 	st.w	r0, 4[r24]
    4cae:	1f 52       	mov	-1, r10
    4cb0:	01 02       	callt	1

00004cb2 <__svfiprintf_r>:
    4cb2:	00 02       	callt	0
    4cb4:	03 1e 5c ff 	addi	-164, sp, sp
    4cb8:	06 a8       	mov	r6, r21
    4cba:	07 b8       	mov	r7, r23
    4cbc:	08 d0       	mov	r8, r26
    4cbe:	63 4f 19 00 	st.w	r9, 24[sp]
    4cc2:	c7 ff 0c 00 	tst1	7, 12[r7]
    4cc6:	b2 1d       	be	4cfc <__svfiprintf_r+0x4a>
    4cc8:	27 57 11 00 	ld.w	16[r7], r10
    4ccc:	60 52       	cmp	0, r10
    4cce:	fa 15       	bne	4cfc <__svfiprintf_r+0x4a>
    4cd0:	20 3e 40 00 	movea	64, r0, r7
    4cd4:	bf ff 82 ec 	jarl	3956 <__malloc_r>, lp
    4cd8:	77 57 01 00 	st.w	r10, 0[r23]
    4cdc:	77 57 11 00 	st.w	r10, 16[r23]
    4ce0:	60 52       	cmp	0, r10
    4ce2:	9a 0d       	bne	4cf4 <__svfiprintf_r+0x42>
    4ce4:	0c 52       	mov	12, r10
    4ce6:	75 57 01 00 	st.w	r10, 0[r21]
    4cea:	1f 52       	mov	-1, r10
    4cec:	63 57 11 00 	st.w	r10, 16[sp]
    4cf0:	80 07 84 0c 	jr	5974 <__svfiprintf_r+0xcc2>
    4cf4:	20 56 40 00 	movea	64, r0, r10
    4cf8:	77 57 15 00 	st.w	r10, 20[r23]
    4cfc:	03 ee 54 00 	addi	84, sp, r29
    4d00:	63 ef 95 00 	st.w	r29, 148[sp]
    4d04:	63 07 9d 00 	st.w	r0, 156[sp]
    4d08:	63 07 99 00 	st.w	r0, 152[sp]
    4d0c:	63 07 25 00 	st.w	r0, 36[sp]
    4d10:	63 07 11 00 	st.w	r0, 16[sp]
    4d14:	20 c6 25 00 	movea	37, r0, r24
    4d18:	34 06 7a 4b 	mov	0x4b7a, r20
    4d1c:	00 00 
    4d1e:	1a 57 00 00 	ld.b	0[r26], r10
    4d22:	60 52       	cmp	0, r10
    4d24:	f2 0d       	be	4d42 <__svfiprintf_r+0x90>
    4d26:	f8 51       	cmp	r24, r10
    4d28:	f2 0d       	be	4d46 <__svfiprintf_r+0x94>
    4d2a:	1a 56 01 00 	addi	1, r26, r10
    4d2e:	1a e0       	mov	r26, r28
    4d30:	41 e2       	add	1, r28
    4d32:	0a 5f 00 00 	ld.b	0[r10], r11
    4d36:	60 5a       	cmp	0, r11
    4d38:	82 0d       	be	4d48 <__svfiprintf_r+0x96>
    4d3a:	41 52       	add	1, r10
    4d3c:	f8 59       	cmp	r24, r11
    4d3e:	9a fd       	bne	4d30 <__svfiprintf_r+0x7e>
    4d40:	c5 05       	br	4d48 <__svfiprintf_r+0x96>
    4d42:	1a e0       	mov	r26, r28
    4d44:	a5 05       	br	4d48 <__svfiprintf_r+0x96>
    4d46:	1a e0       	mov	r26, r28
    4d48:	1c d8       	mov	r28, r27
    4d4a:	ba d9       	sub	r26, r27
    4d4c:	c2 25       	be	4d94 <__svfiprintf_r+0xe2>
    4d4e:	7d d7 01 00 	st.w	r26, 0[r29]
    4d52:	7d df 05 00 	st.w	r27, 4[r29]
    4d56:	23 57 9d 00 	ld.w	156[sp], r10
    4d5a:	db 51       	add	r27, r10
    4d5c:	63 57 9d 00 	st.w	r10, 156[sp]
    4d60:	23 57 99 00 	ld.w	152[sp], r10
    4d64:	41 52       	add	1, r10
    4d66:	63 57 99 00 	st.w	r10, 152[sp]
    4d6a:	67 52       	cmp	7, r10
    4d6c:	bf 05       	bgt	4d72 <__svfiprintf_r+0xc0>
    4d6e:	48 ea       	add	8, r29
    4d70:	d5 0d       	br	4d8a <__svfiprintf_r+0xd8>
    4d72:	15 30       	mov	r21, r6
    4d74:	17 38       	mov	r23, r7
    4d76:	20 46 94 00 	movea	148, r0, r8
    4d7a:	c3 41       	add	sp, r8
    4d7c:	f4 c7 60 f9 	jarl	[r20], lp
    4d80:	60 52       	cmp	0, r10
    4d82:	ea 07 e3 0b 	bne	5964 <__svfiprintf_r+0xcb2>
    4d86:	03 ee 54 00 	addi	84, sp, r29
    4d8a:	23 5f 11 00 	ld.w	16[sp], r11
    4d8e:	db 59       	add	r27, r11
    4d90:	63 5f 11 00 	st.w	r11, 16[sp]
    4d94:	1c 57 00 00 	ld.b	0[r28], r10
    4d98:	60 52       	cmp	0, r10
    4d9a:	e2 07 b7 0b 	be	5950 <__svfiprintf_r+0xc9e>
    4d9e:	1c d6 01 00 	addi	1, r28, r26
    4da2:	43 07 a3 00 	st.b	r0, 163[sp]
    4da6:	00 7a       	mov	0, r15
    4da8:	1f 62       	mov	-1, r12
    4daa:	63 67 05 00 	st.w	r12, 4[sp]
    4dae:	63 07 15 00 	st.w	r0, 20[sp]
    4db2:	00 b2       	mov	0, r22
    4db4:	20 66 20 00 	movea	32, r0, r12
    4db8:	20 76 5a 00 	movea	90, r0, r14
    4dbc:	2d 06 00 4e 	mov	0x4e00, r13
    4dc0:	00 00 
    4dc2:	20 36 2a 00 	movea	42, r0, r6
    4dc6:	1f 82       	mov	-1, r16
    4dc8:	20 9e 6c 00 	movea	108, r0, r19
    4dcc:	20 96 68 00 	movea	104, r0, r18
    4dd0:	20 8e 2b 00 	movea	43, r0, r17
    4dd4:	85 0d       	br	4de4 <__svfiprintf_r+0x132>
    4dd6:	63 57 19 00 	st.w	r10, 24[sp]
    4dda:	d5 05       	br	4de4 <__svfiprintf_r+0x132>
    4ddc:	63 57 19 00 	st.w	r10, 24[sp]
    4de0:	63 87 05 00 	st.w	r16, 4[sp]
    4de4:	1a 5f 00 00 	ld.b	0[r26], r11
    4de8:	41 d2       	add	1, r26
    4dea:	0b 50       	mov	r11, r10
    4dec:	ac 51       	sub	r12, r10
    4dee:	ee 51       	cmp	r14, r10
    4df0:	eb 07 39 07 	bh	5528 <__svfiprintf_r+0x876>
    4df4:	c1 52       	shl	1, r10
    4df6:	cd 51       	add	r13, r10
    4df8:	2a 57 00 00 	ld.h	0[r10], r10
    4dfc:	cd 51       	add	r13, r10
    4dfe:	6a 00       	jmp	[r10]
    4e00:	d2 00       	zxh	r18
    4e02:	28 07 28 07 	ld.h	1832[r8], r0
    4e06:	da 00       	zxh	r26
    4e08:	28 07 28 07 	ld.h	1832[r8], r0
    4e0c:	28 07 e4 ff 	ld.h	-28[r8], r0
    4e10:	28 07 28 07 	ld.h	1832[r8], r0
    4e14:	e0 00       	sxh	r0
    4e16:	0a 01       	or	r10, r0
    4e18:	28 07 02 01 	ld.h	258[r8], r0
    4e1c:	10 01       	or	r16, r0
    4e1e:	28 07 6e 01 	ld.h	366[r8], r0
    4e22:	76 01       	tst	r22, r0
    4e24:	76 01       	tst	r22, r0
    4e26:	76 01       	tst	r22, r0
    4e28:	76 01       	tst	r22, r0
    4e2a:	76 01       	tst	r22, r0
    4e2c:	76 01       	tst	r22, r0
    4e2e:	76 01       	tst	r22, r0
    4e30:	76 01       	tst	r22, r0
    4e32:	76 01       	tst	r22, r0
    4e34:	28 07 28 07 	ld.h	1832[r8], r0
    4e38:	28 07 28 07 	ld.h	1832[r8], r0
    4e3c:	28 07 28 07 	ld.h	1832[r8], r0
    4e40:	28 07 28 07 	ld.h	1832[r8], r0
    4e44:	28 07 e0 01 	ld.h	480[r8], r0
    4e48:	08 02       	callt	8
    4e4a:	28 07 28 07 	ld.h	1832[r8], r0
    4e4e:	28 07 28 07 	ld.h	1832[r8], r0
    4e52:	28 07 28 07 	ld.h	1832[r8], r0
    4e56:	28 07 28 07 	ld.h	1832[r8], r0
    4e5a:	28 07 28 07 	ld.h	1832[r8], r0
    4e5e:	5e 03       	sld.b	94[ep], r0
    4e60:	28 07 28 07 	ld.h	1832[r8], r0
    4e64:	28 07 1e 04 	ld.h	1054[r8], r0
    4e68:	28 07 98 04 	ld.h	1176[r8], r0
    4e6c:	28 07 28 07 	ld.h	1832[r8], r0
    4e70:	be 00       	sxb	ep
    4e72:	28 07 28 07 	ld.h	1832[r8], r0
    4e76:	28 07 28 07 	ld.h	1832[r8], r0
    4e7a:	28 07 28 07 	ld.h	1832[r8], r0
    4e7e:	28 07 28 07 	ld.h	1832[r8], r0
    4e82:	28 07 28 07 	ld.h	1832[r8], r0
    4e86:	e0 01       	cmp	r0, r0
    4e88:	b6 00       	sxb	r22
    4e8a:	28 07 28 07 	ld.h	1832[r8], r0
    4e8e:	28 07 9c 01 	ld.h	412[r8], r0
    4e92:	b6 00       	sxb	r22
    4e94:	d8 01       	add	r24, r0
    4e96:	28 07 b6 01 	ld.h	438[r8], r0
    4e9a:	28 07 b4 02 	ld.h	692[r8], r0
    4e9e:	62 03       	sld.b	98[ep], r0
    4ea0:	ea 03       	sst.b	r0, 106[ep]
    4ea2:	d0 01       	add	r16, r0
    4ea4:	28 07 1e 04 	ld.h	1054[r8], r0
    4ea8:	e4 ff 9c 04 	.long	0x049cffe4
    4eac:	28 07 28 07 	ld.h	1832[r8], r0
    4eb0:	1e 05       	sld.w	60[ep], r0
    4eb2:	28 07 e4 ff 	ld.h	-28[r8], r0
    4eb6:	43 7f a3 00 	st.b	r15, 163[sp]
    4eba:	80 07 56 01 	jr	5010 <__svfiprintf_r+0x35e>
    4ebe:	43 7f a3 00 	st.b	r15, 163[sp]
    4ec2:	16 50       	mov	r22, r10
    4ec4:	2d 06 08 7b 	mov	0x7b08, r13
    4ec8:	00 00 
    4eca:	63 6f 25 00 	st.w	r13, 36[sp]
    4ece:	80 07 60 04 	jr	532e <__svfiprintf_r+0x67c>
    4ed2:	60 7a       	cmp	0, r15
    4ed4:	ef 67 34 7b 	cmov	nz, r15, r12, r15
    4ed8:	e5 85       	br	4de4 <__svfiprintf_r+0x132>
    4eda:	96 b6 01 00 	ori	1, r22, r22
    4ede:	b5 85       	br	4de4 <__svfiprintf_r+0x132>
    4ee0:	23 57 19 00 	ld.w	24[sp], r10
    4ee4:	44 52       	add	4, r10
    4ee6:	23 5f 19 00 	ld.w	24[sp], r11
    4eea:	2b 5f 01 00 	ld.w	0[r11], r11
    4eee:	63 5f 15 00 	st.w	r11, 20[sp]
    4ef2:	60 5a       	cmp	0, r11
    4ef4:	fe 07 e3 fe 	bge	4dd6 <__svfiprintf_r+0x124>
    4ef8:	80 59       	subr	r0, r11
    4efa:	63 5f 15 00 	st.w	r11, 20[sp]
    4efe:	63 57 19 00 	st.w	r10, 24[sp]
    4f02:	96 b6 04 00 	ori	4, r22, r22
    4f06:	bf 07 de fe 	jr	4de4 <__svfiprintf_r+0x132>
    4f0a:	11 78       	mov	r17, r15
    4f0c:	bf 07 d8 fe 	jr	4de4 <__svfiprintf_r+0x132>
    4f10:	1a 5f 00 00 	ld.b	0[r26], r11
    4f14:	41 d2       	add	1, r26
    4f16:	e6 59       	cmp	r6, r11
    4f18:	f2 05       	be	4f26 <__svfiprintf_r+0x274>
    4f1a:	0b 3e d0 ff 	addi	-48, r11, r7
    4f1e:	69 3a       	cmp	9, r7
    4f20:	b3 15       	bnh	4f46 <__svfiprintf_r+0x294>
    4f22:	00 52       	mov	0, r10
    4f24:	e5 1d       	br	4f60 <__svfiprintf_r+0x2ae>
    4f26:	23 57 19 00 	ld.w	24[sp], r10
    4f2a:	44 52       	add	4, r10
    4f2c:	23 5f 19 00 	ld.w	24[sp], r11
    4f30:	2b 5f 01 00 	ld.w	0[r11], r11
    4f34:	63 5f 05 00 	st.w	r11, 4[sp]
    4f38:	60 5a       	cmp	0, r11
    4f3a:	f6 07 a3 fe 	blt	4ddc <__svfiprintf_r+0x12a>
    4f3e:	63 57 19 00 	st.w	r10, 24[sp]
    4f42:	bf 07 a2 fe 	jr	4de4 <__svfiprintf_r+0x132>
    4f46:	00 52       	mov	0, r10
    4f48:	0a 58       	mov	r10, r11
    4f4a:	ca 59       	add	r10, r11
    4f4c:	c3 52       	shl	3, r10
    4f4e:	cb 51       	add	r11, r10
    4f50:	c7 51       	add	r7, r10
    4f52:	1a 5f 00 00 	ld.b	0[r26], r11
    4f56:	41 d2       	add	1, r26
    4f58:	0b 3e d0 ff 	addi	-48, r11, r7
    4f5c:	69 3a       	cmp	9, r7
    4f5e:	d3 f5       	bnh	4f48 <__svfiprintf_r+0x296>
    4f60:	60 52       	cmp	0, r10
    4f62:	ea 87 3c 53 	cmov	ge, r10, r16, r10
    4f66:	63 57 05 00 	st.w	r10, 4[sp]
    4f6a:	bf 07 80 fe 	jr	4dea <__svfiprintf_r+0x138>
    4f6e:	96 b6 80 00 	ori	128, r22, r22
    4f72:	bf 07 72 fe 	jr	4de4 <__svfiprintf_r+0x132>
    4f76:	00 52       	mov	0, r10
    4f78:	0a 38       	mov	r10, r7
    4f7a:	ca 39       	add	r10, r7
    4f7c:	c3 52       	shl	3, r10
    4f7e:	c7 51       	add	r7, r10
    4f80:	0b 5e d0 ff 	addi	-48, r11, r11
    4f84:	cb 51       	add	r11, r10
    4f86:	1a 5f 00 00 	ld.b	0[r26], r11
    4f8a:	41 d2       	add	1, r26
    4f8c:	0b 3e d0 ff 	addi	-48, r11, r7
    4f90:	69 3a       	cmp	9, r7
    4f92:	b3 f5       	bnh	4f78 <__svfiprintf_r+0x2c6>
    4f94:	63 57 15 00 	st.w	r10, 20[sp]
    4f98:	bf 07 52 fe 	jr	4dea <__svfiprintf_r+0x138>
    4f9c:	1a 57 00 00 	ld.b	0[r26], r10
    4fa0:	f2 51       	cmp	r18, r10
    4fa2:	ea 05       	bne	4fae <__svfiprintf_r+0x2fc>
    4fa4:	41 d2       	add	1, r26
    4fa6:	96 b6 00 02 	ori	512, r22, r22
    4faa:	bf 07 3a fe 	jr	4de4 <__svfiprintf_r+0x132>
    4fae:	96 b6 40 00 	ori	64, r22, r22
    4fb2:	bf 07 32 fe 	jr	4de4 <__svfiprintf_r+0x132>
    4fb6:	1a 57 00 00 	ld.b	0[r26], r10
    4fba:	f3 51       	cmp	r19, r10
    4fbc:	ea 05       	bne	4fc8 <__svfiprintf_r+0x316>
    4fbe:	41 d2       	add	1, r26
    4fc0:	96 b6 20 00 	ori	32, r22, r22
    4fc4:	bf 07 20 fe 	jr	4de4 <__svfiprintf_r+0x132>
    4fc8:	96 b6 10 00 	ori	16, r22, r22
    4fcc:	bf 07 18 fe 	jr	4de4 <__svfiprintf_r+0x132>
    4fd0:	96 b6 20 00 	ori	32, r22, r22
    4fd4:	bf 07 10 fe 	jr	4de4 <__svfiprintf_r+0x132>
    4fd8:	96 b6 20 00 	ori	32, r22, r22
    4fdc:	bf 07 08 fe 	jr	4de4 <__svfiprintf_r+0x132>
    4fe0:	23 67 19 00 	ld.w	24[sp], r12
    4fe4:	2c 57 01 00 	ld.w	0[r12], r10
    4fe8:	43 57 2c 00 	st.b	r10, 44[sp]
    4fec:	43 07 a3 00 	st.b	r0, 163[sp]
    4ff0:	44 62       	add	4, r12
    4ff2:	63 67 19 00 	st.w	r12, 24[sp]
    4ff6:	01 6a       	mov	1, r13
    4ff8:	63 6f 0d 00 	st.w	r13, 12[sp]
    4ffc:	03 76 2c 00 	addi	44, sp, r14
    5000:	63 77 01 00 	st.w	r14, 0[sp]
    5004:	80 07 7a 09 	jr	597e <__svfiprintf_r+0xccc>
    5008:	43 7f a3 00 	st.b	r15, 163[sp]
    500c:	96 b6 10 00 	ori	16, r22, r22
    5010:	d6 56 20 00 	andi	32, r22, r10
    5014:	b2 0d       	be	502a <__svfiprintf_r+0x378>
    5016:	23 57 19 00 	ld.w	24[sp], r10
    501a:	2a df 01 00 	ld.w	0[r10], r27
    501e:	2a e7 05 00 	ld.w	4[r10], r28
    5022:	48 52       	add	8, r10
    5024:	63 57 19 00 	st.w	r10, 24[sp]
    5028:	95 35       	br	508a <__svfiprintf_r+0x3d8>
    502a:	d6 56 10 00 	andi	16, r22, r10
    502e:	b2 0d       	be	5044 <__svfiprintf_r+0x392>
    5030:	23 5f 19 00 	ld.w	24[sp], r11
    5034:	2b df 01 00 	ld.w	0[r11], r27
    5038:	1b e0       	mov	r27, r28
    503a:	bf e2       	sar	31, r28
    503c:	44 5a       	add	4, r11
    503e:	63 5f 19 00 	st.w	r11, 24[sp]
    5042:	c5 25       	br	508a <__svfiprintf_r+0x3d8>
    5044:	d6 56 40 00 	andi	64, r22, r10
    5048:	b2 0d       	be	505e <__svfiprintf_r+0x3ac>
    504a:	23 67 19 00 	ld.w	24[sp], r12
    504e:	2c e7 00 00 	ld.h	0[r12], r28
    5052:	1c d8       	mov	r28, r27
    5054:	bf e2       	sar	31, r28
    5056:	44 62       	add	4, r12
    5058:	63 67 19 00 	st.w	r12, 24[sp]
    505c:	f5 15       	br	508a <__svfiprintf_r+0x3d8>
    505e:	d6 56 00 02 	andi	512, r22, r10
    5062:	b2 0d       	be	5078 <__svfiprintf_r+0x3c6>
    5064:	23 6f 19 00 	ld.w	24[sp], r13
    5068:	0d e7 00 00 	ld.b	0[r13], r28
    506c:	1c d8       	mov	r28, r27
    506e:	bf e2       	sar	31, r28
    5070:	44 6a       	add	4, r13
    5072:	63 6f 19 00 	st.w	r13, 24[sp]
    5076:	a5 0d       	br	508a <__svfiprintf_r+0x3d8>
    5078:	23 77 19 00 	ld.w	24[sp], r14
    507c:	2e df 01 00 	ld.w	0[r14], r27
    5080:	1b e0       	mov	r27, r28
    5082:	bf e2       	sar	31, r28
    5084:	44 72       	add	4, r14
    5086:	63 77 19 00 	st.w	r14, 24[sp]
    508a:	60 e2       	cmp	0, r28
    508c:	e6 05       	blt	5098 <__svfiprintf_r+0x3e6>
    508e:	23 5f 05 00 	ld.w	4[sp], r11
    5092:	01 52       	mov	1, r10
    5094:	80 07 3a 03 	jr	53ce <__svfiprintf_r+0x71c>
    5098:	80 d9       	subr	r0, r27
    509a:	ea 57 00 00 	setf	nz, r10
    509e:	80 e1       	subr	r0, r28
    50a0:	aa e1       	sub	r10, r28
    50a2:	20 56 2d 00 	movea	45, r0, r10
    50a6:	43 57 a3 00 	st.b	r10, 163[sp]
    50aa:	23 5f 05 00 	ld.w	4[sp], r11
    50ae:	01 52       	mov	1, r10
    50b0:	80 07 1e 03 	jr	53ce <__svfiprintf_r+0x71c>
    50b4:	43 7f a3 00 	st.b	r15, 163[sp]
    50b8:	d6 56 20 00 	andi	32, r22, r10
    50bc:	c2 15       	be	50e4 <__svfiprintf_r+0x432>
    50be:	23 5f 19 00 	ld.w	24[sp], r11
    50c2:	2b 57 01 00 	ld.w	0[r11], r10
    50c6:	23 67 11 00 	ld.w	16[sp], r12
    50ca:	6a 67 01 00 	st.w	r12, 0[r10]
    50ce:	0c 58       	mov	r12, r11
    50d0:	bf 5a       	sar	31, r11
    50d2:	6a 5f 05 00 	st.w	r11, 4[r10]
    50d6:	23 6f 19 00 	ld.w	24[sp], r13
    50da:	44 6a       	add	4, r13
    50dc:	63 6f 19 00 	st.w	r13, 24[sp]
    50e0:	bf 07 3e fc 	jr	4d1e <__svfiprintf_r+0x6c>
    50e4:	d6 56 10 00 	andi	16, r22, r10
    50e8:	e2 0d       	be	5104 <__svfiprintf_r+0x452>
    50ea:	23 77 19 00 	ld.w	24[sp], r14
    50ee:	2e 57 01 00 	ld.w	0[r14], r10
    50f2:	23 5f 11 00 	ld.w	16[sp], r11
    50f6:	6a 5f 01 00 	st.w	r11, 0[r10]
    50fa:	44 72       	add	4, r14
    50fc:	63 77 19 00 	st.w	r14, 24[sp]
    5100:	bf 07 1e fc 	jr	4d1e <__svfiprintf_r+0x6c>
    5104:	d6 56 40 00 	andi	64, r22, r10
    5108:	e2 0d       	be	5124 <__svfiprintf_r+0x472>
    510a:	23 67 19 00 	ld.w	24[sp], r12
    510e:	2c 57 01 00 	ld.w	0[r12], r10
    5112:	23 6f 11 00 	ld.w	16[sp], r13
    5116:	6a 6f 00 00 	st.h	r13, 0[r10]
    511a:	44 62       	add	4, r12
    511c:	63 67 19 00 	st.w	r12, 24[sp]
    5120:	bf 07 fe fb 	jr	4d1e <__svfiprintf_r+0x6c>
    5124:	d6 b6 00 02 	andi	512, r22, r22
    5128:	e2 0d       	be	5144 <__svfiprintf_r+0x492>
    512a:	23 77 19 00 	ld.w	24[sp], r14
    512e:	2e 57 01 00 	ld.w	0[r14], r10
    5132:	23 5f 11 00 	ld.w	16[sp], r11
    5136:	4a 5f 00 00 	st.b	r11, 0[r10]
    513a:	44 72       	add	4, r14
    513c:	63 77 19 00 	st.w	r14, 24[sp]
    5140:	bf 07 de fb 	jr	4d1e <__svfiprintf_r+0x6c>
    5144:	23 67 19 00 	ld.w	24[sp], r12
    5148:	2c 57 01 00 	ld.w	0[r12], r10
    514c:	23 6f 11 00 	ld.w	16[sp], r13
    5150:	6a 6f 01 00 	st.w	r13, 0[r10]
    5154:	44 62       	add	4, r12
    5156:	63 67 19 00 	st.w	r12, 24[sp]
    515a:	bf 07 c4 fb 	jr	4d1e <__svfiprintf_r+0x6c>
    515e:	96 b6 10 00 	ori	16, r22, r22
    5162:	d6 56 20 00 	andi	32, r22, r10
    5166:	d2 0d       	be	5180 <__svfiprintf_r+0x4ce>
    5168:	23 77 19 00 	ld.w	24[sp], r14
    516c:	2e df 01 00 	ld.w	0[r14], r27
    5170:	2e e7 05 00 	ld.w	4[r14], r28
    5174:	48 72       	add	8, r14
    5176:	63 77 19 00 	st.w	r14, 24[sp]
    517a:	00 52       	mov	0, r10
    517c:	80 07 4a 02 	jr	53c6 <__svfiprintf_r+0x714>
    5180:	d6 56 10 00 	andi	16, r22, r10
    5184:	c2 0d       	be	519c <__svfiprintf_r+0x4ea>
    5186:	23 57 19 00 	ld.w	24[sp], r10
    518a:	2a df 01 00 	ld.w	0[r10], r27
    518e:	00 e2       	mov	0, r28
    5190:	44 52       	add	4, r10
    5192:	63 57 19 00 	st.w	r10, 24[sp]
    5196:	00 52       	mov	0, r10
    5198:	80 07 2e 02 	jr	53c6 <__svfiprintf_r+0x714>
    519c:	d6 56 40 00 	andi	64, r22, r10
    51a0:	c2 0d       	be	51b8 <__svfiprintf_r+0x506>
    51a2:	23 5f 19 00 	ld.w	24[sp], r11
    51a6:	eb df 01 00 	ld.hu	0[r11], r27
    51aa:	00 e2       	mov	0, r28
    51ac:	44 5a       	add	4, r11
    51ae:	63 5f 19 00 	st.w	r11, 24[sp]
    51b2:	00 52       	mov	0, r10
    51b4:	80 07 12 02 	jr	53c6 <__svfiprintf_r+0x714>
    51b8:	d6 56 00 02 	andi	512, r22, r10
    51bc:	c2 0d       	be	51d4 <__svfiprintf_r+0x522>
    51be:	23 67 19 00 	ld.w	24[sp], r12
    51c2:	8c df 01 00 	ld.bu	0[r12], r27
    51c6:	00 e2       	mov	0, r28
    51c8:	44 62       	add	4, r12
    51ca:	63 67 19 00 	st.w	r12, 24[sp]
    51ce:	00 52       	mov	0, r10
    51d0:	80 07 f6 01 	jr	53c6 <__svfiprintf_r+0x714>
    51d4:	23 6f 19 00 	ld.w	24[sp], r13
    51d8:	2d df 01 00 	ld.w	0[r13], r27
    51dc:	00 e2       	mov	0, r28
    51de:	44 6a       	add	4, r13
    51e0:	63 6f 19 00 	st.w	r13, 24[sp]
    51e4:	00 52       	mov	0, r10
    51e6:	80 07 e0 01 	jr	53c6 <__svfiprintf_r+0x714>
    51ea:	23 77 19 00 	ld.w	24[sp], r14
    51ee:	2e df 01 00 	ld.w	0[r14], r27
    51f2:	00 e2       	mov	0, r28
    51f4:	96 b6 02 00 	ori	2, r22, r22
    51f8:	20 56 30 00 	movea	48, r0, r10
    51fc:	43 57 2a 00 	st.b	r10, 42[sp]
    5200:	20 56 78 00 	movea	120, r0, r10
    5204:	43 57 2b 00 	st.b	r10, 43[sp]
    5208:	44 72       	add	4, r14
    520a:	63 77 19 00 	st.w	r14, 24[sp]
    520e:	2a 06 19 7b 	mov	0x7b19, r10
    5212:	00 00 
    5214:	63 57 25 00 	st.w	r10, 36[sp]
    5218:	02 52       	mov	2, r10
    521a:	80 07 ac 01 	jr	53c6 <__svfiprintf_r+0x714>
    521e:	23 e7 05 00 	ld.w	4[sp], r28
    5222:	23 57 19 00 	ld.w	24[sp], r10
    5226:	43 07 a3 00 	st.b	r0, 163[sp]
    522a:	0a 58       	mov	r10, r11
    522c:	44 5a       	add	4, r11
    522e:	63 5f 19 00 	st.w	r11, 24[sp]
    5232:	2a 57 01 00 	ld.w	0[r10], r10
    5236:	63 57 01 00 	st.w	r10, 0[sp]
    523a:	60 52       	cmp	0, r10
    523c:	da 0d       	bne	5256 <__svfiprintf_r+0x5a4>
    523e:	66 e2       	cmp	6, r28
    5240:	e6 e7 16 63 	cmov	h, 6, r28, r12
    5244:	63 67 0d 00 	st.w	r12, 12[sp]
    5248:	2d 06 44 7b 	mov	0x7b44, r13
    524c:	00 00 
    524e:	63 6f 01 00 	st.w	r13, 0[sp]
    5252:	80 07 2c 07 	jr	597e <__svfiprintf_r+0xccc>
    5256:	60 e2       	cmp	0, r28
    5258:	e6 15       	blt	5284 <__svfiprintf_r+0x5d2>
    525a:	23 37 01 00 	ld.w	0[sp], r6
    525e:	00 3a       	mov	0, r7
    5260:	1c 40       	mov	r28, r8
    5262:	bf ff 7a ed 	jarl	3fdc <_memchr>, lp
    5266:	60 52       	cmp	0, r10
    5268:	e2 07 e5 02 	be	554c <__svfiprintf_r+0x89a>
    526c:	23 77 01 00 	ld.w	0[sp], r14
    5270:	8a 71       	subr	r10, r14
    5272:	63 77 0d 00 	st.w	r14, 12[sp]
    5276:	fc 71       	cmp	r28, r14
    5278:	ef 07 e3 02 	bgt	555a <__svfiprintf_r+0x8a8>
    527c:	63 07 05 00 	st.w	r0, 4[sp]
    5280:	80 07 e6 02 	jr	5566 <__svfiprintf_r+0x8b4>
    5284:	23 37 01 00 	ld.w	0[sp], r6
    5288:	bf ff d0 f8 	jarl	4b58 <_strlen>, lp
    528c:	63 57 0d 00 	st.w	r10, 12[sp]
    5290:	63 07 05 00 	st.w	r0, 4[sp]
    5294:	80 07 d2 02 	jr	5566 <__svfiprintf_r+0x8b4>
    5298:	96 b6 10 00 	ori	16, r22, r22
    529c:	d6 56 20 00 	andi	32, r22, r10
    52a0:	d2 0d       	be	52ba <__svfiprintf_r+0x608>
    52a2:	23 57 19 00 	ld.w	24[sp], r10
    52a6:	2a df 01 00 	ld.w	0[r10], r27
    52aa:	2a e7 05 00 	ld.w	4[r10], r28
    52ae:	48 52       	add	8, r10
    52b0:	63 57 19 00 	st.w	r10, 24[sp]
    52b4:	01 52       	mov	1, r10
    52b6:	80 07 10 01 	jr	53c6 <__svfiprintf_r+0x714>
    52ba:	d6 56 10 00 	andi	16, r22, r10
    52be:	c2 0d       	be	52d6 <__svfiprintf_r+0x624>
    52c0:	23 5f 19 00 	ld.w	24[sp], r11
    52c4:	2b df 01 00 	ld.w	0[r11], r27
    52c8:	00 e2       	mov	0, r28
    52ca:	44 5a       	add	4, r11
    52cc:	63 5f 19 00 	st.w	r11, 24[sp]
    52d0:	01 52       	mov	1, r10
    52d2:	80 07 f4 00 	jr	53c6 <__svfiprintf_r+0x714>
    52d6:	d6 56 40 00 	andi	64, r22, r10
    52da:	b2 0d       	be	52f0 <__svfiprintf_r+0x63e>
    52dc:	23 67 19 00 	ld.w	24[sp], r12
    52e0:	ec df 01 00 	ld.hu	0[r12], r27
    52e4:	00 e2       	mov	0, r28
    52e6:	44 62       	add	4, r12
    52e8:	63 67 19 00 	st.w	r12, 24[sp]
    52ec:	01 52       	mov	1, r10
    52ee:	c5 6d       	br	53c6 <__svfiprintf_r+0x714>
    52f0:	d6 56 00 02 	andi	512, r22, r10
    52f4:	b2 0d       	be	530a <__svfiprintf_r+0x658>
    52f6:	23 6f 19 00 	ld.w	24[sp], r13
    52fa:	8d df 01 00 	ld.bu	0[r13], r27
    52fe:	00 e2       	mov	0, r28
    5300:	44 6a       	add	4, r13
    5302:	63 6f 19 00 	st.w	r13, 24[sp]
    5306:	01 52       	mov	1, r10
    5308:	f5 5d       	br	53c6 <__svfiprintf_r+0x714>
    530a:	23 77 19 00 	ld.w	24[sp], r14
    530e:	2e df 01 00 	ld.w	0[r14], r27
    5312:	00 e2       	mov	0, r28
    5314:	44 72       	add	4, r14
    5316:	63 77 19 00 	st.w	r14, 24[sp]
    531a:	01 52       	mov	1, r10
    531c:	d5 55       	br	53c6 <__svfiprintf_r+0x714>
    531e:	43 7f a3 00 	st.b	r15, 163[sp]
    5322:	16 50       	mov	r22, r10
    5324:	2c 06 19 7b 	mov	0x7b19, r12
    5328:	00 00 
    532a:	63 67 25 00 	st.w	r12, 36[sp]
    532e:	ca 66 20 00 	andi	32, r10, r12
    5332:	b2 0d       	be	5348 <__svfiprintf_r+0x696>
    5334:	23 6f 19 00 	ld.w	24[sp], r13
    5338:	2d df 01 00 	ld.w	0[r13], r27
    533c:	2d e7 05 00 	ld.w	4[r13], r28
    5340:	48 6a       	add	8, r13
    5342:	63 6f 19 00 	st.w	r13, 24[sp]
    5346:	d5 2d       	br	53a0 <__svfiprintf_r+0x6ee>
    5348:	ca 66 10 00 	andi	16, r10, r12
    534c:	a2 0d       	be	5360 <__svfiprintf_r+0x6ae>
    534e:	23 77 19 00 	ld.w	24[sp], r14
    5352:	2e df 01 00 	ld.w	0[r14], r27
    5356:	00 e2       	mov	0, r28
    5358:	44 72       	add	4, r14
    535a:	63 77 19 00 	st.w	r14, 24[sp]
    535e:	95 25       	br	53a0 <__svfiprintf_r+0x6ee>
    5360:	ca 66 40 00 	andi	64, r10, r12
    5364:	a2 0d       	be	5378 <__svfiprintf_r+0x6c6>
    5366:	23 67 19 00 	ld.w	24[sp], r12
    536a:	ec df 01 00 	ld.hu	0[r12], r27
    536e:	00 e2       	mov	0, r28
    5370:	44 62       	add	4, r12
    5372:	63 67 19 00 	st.w	r12, 24[sp]
    5376:	d5 15       	br	53a0 <__svfiprintf_r+0x6ee>
    5378:	ca 66 00 02 	andi	512, r10, r12
    537c:	a2 0d       	be	5390 <__svfiprintf_r+0x6de>
    537e:	23 6f 19 00 	ld.w	24[sp], r13
    5382:	8d df 01 00 	ld.bu	0[r13], r27
    5386:	00 e2       	mov	0, r28
    5388:	44 6a       	add	4, r13
    538a:	63 6f 19 00 	st.w	r13, 24[sp]
    538e:	95 0d       	br	53a0 <__svfiprintf_r+0x6ee>
    5390:	23 77 19 00 	ld.w	24[sp], r14
    5394:	2e df 01 00 	ld.w	0[r14], r27
    5398:	00 e2       	mov	0, r28
    539a:	44 72       	add	4, r14
    539c:	63 77 19 00 	st.w	r14, 24[sp]
    53a0:	ca 66 01 00 	andi	1, r10, r12
    53a4:	e2 0d       	be	53c0 <__svfiprintf_r+0x70e>
    53a6:	1b 60       	mov	r27, r12
    53a8:	1c 61       	or	r28, r12
    53aa:	d2 0d       	be	53c4 <__svfiprintf_r+0x712>
    53ac:	20 66 30 00 	movea	48, r0, r12
    53b0:	43 67 2a 00 	st.b	r12, 42[sp]
    53b4:	43 5f 2b 00 	st.b	r11, 43[sp]
    53b8:	8a b6 02 00 	ori	2, r10, r22
    53bc:	02 52       	mov	2, r10
    53be:	c5 05       	br	53c6 <__svfiprintf_r+0x714>
    53c0:	02 52       	mov	2, r10
    53c2:	a5 05       	br	53c6 <__svfiprintf_r+0x714>
    53c4:	02 52       	mov	2, r10
    53c6:	43 07 a3 00 	st.b	r0, 163[sp]
    53ca:	23 5f 05 00 	ld.w	4[sp], r11
    53ce:	60 5a       	cmp	0, r11
    53d0:	c6 05       	blt	53d8 <__svfiprintf_r+0x726>
    53d2:	20 66 7f ff 	movea	-129, r0, r12
    53d6:	4c b1       	and	r12, r22
    53d8:	1b 60       	mov	r27, r12
    53da:	1c 61       	or	r28, r12
    53dc:	ca 05       	bne	53e4 <__svfiprintf_r+0x732>
    53de:	60 5a       	cmp	0, r11
    53e0:	e2 07 09 01 	be	54e8 <__svfiprintf_r+0x836>
    53e4:	61 52       	cmp	1, r10
    53e6:	d2 05       	be	53f0 <__svfiprintf_r+0x73e>
    53e8:	c1 0d       	bl	5400 <__svfiprintf_r+0x74e>
    53ea:	62 52       	cmp	2, r10
    53ec:	ba 75       	bne	54d2 <__svfiprintf_r+0x820>
    53ee:	c5 55       	br	5496 <__svfiprintf_r+0x7e4>
    53f0:	60 e2       	cmp	0, r28
    53f2:	fa 2d       	bne	5450 <__svfiprintf_r+0x79e>
    53f4:	ba 05       	bne	53fa <__svfiprintf_r+0x748>
    53f6:	69 da       	cmp	9, r27
    53f8:	cb 2d       	bh	5450 <__svfiprintf_r+0x79e>
    53fa:	03 ce 54 00 	addi	84, sp, r25
    53fe:	b5 45       	br	5484 <__svfiprintf_r+0x7d2>
    5400:	03 5e 54 00 	addi	84, sp, r11
    5404:	b5 05       	br	540a <__svfiprintf_r+0x758>
    5406:	23 5f 01 00 	ld.w	0[sp], r11
    540a:	0b 6e ff ff 	addi	-1, r11, r13
    540e:	63 6f 01 00 	st.w	r13, 0[sp]
    5412:	db 6e 07 00 	andi	7, r27, r13
    5416:	0d 6e 30 00 	addi	48, r13, r13
    541a:	4b 6f ff ff 	st.b	r13, -1[r11]
    541e:	1c 60       	mov	r28, r12
    5420:	dd 62       	shl	29, r12
    5422:	1b 50       	mov	r27, r10
    5424:	83 52       	shr	3, r10
    5426:	0c 51       	or	r12, r10
    5428:	1c 60       	mov	r28, r12
    542a:	83 62       	shr	3, r12
    542c:	0a d8       	mov	r10, r27
    542e:	0c e0       	mov	r12, r28
    5430:	0c 51       	or	r12, r10
    5432:	aa ed       	bne	5406 <__svfiprintf_r+0x754>
    5434:	d6 56 01 00 	andi	1, r22, r10
    5438:	82 75       	be	5518 <__svfiprintf_r+0x866>
    543a:	20 56 30 00 	movea	48, r0, r10
    543e:	ea 69       	cmp	r10, r13
    5440:	c2 6d       	be	5518 <__svfiprintf_r+0x866>
    5442:	0b 76 fe ff 	addi	-2, r11, r14
    5446:	63 77 01 00 	st.w	r14, 0[sp]
    544a:	4b 57 fe ff 	st.b	r10, -2[r11]
    544e:	d5 65       	br	5518 <__svfiprintf_r+0x866>
    5450:	03 ce 54 00 	addi	84, sp, r25
    5454:	5f ca       	add	-1, r25
    5456:	1b 30       	mov	r27, r6
    5458:	1c 38       	mov	r28, r7
    545a:	0a 42       	mov	10, r8
    545c:	00 4a       	mov	0, r9
    545e:	80 ff 6e 11 	jarl	65cc <___umoddi3>, lp
    5462:	0a 56 30 00 	addi	48, r10, r10
    5466:	59 57 00 00 	st.b	r10, 0[r25]
    546a:	1b 30       	mov	r27, r6
    546c:	1c 38       	mov	r28, r7
    546e:	0a 42       	mov	10, r8
    5470:	00 4a       	mov	0, r9
    5472:	80 ff 70 0d 	jarl	61e2 <___udivdi3>, lp
    5476:	0a d8       	mov	r10, r27
    5478:	0b e0       	mov	r11, r28
    547a:	60 5a       	cmp	0, r11
    547c:	ca ed       	bne	5454 <__svfiprintf_r+0x7a2>
    547e:	ba 05       	bne	5484 <__svfiprintf_r+0x7d2>
    5480:	69 52       	cmp	9, r10
    5482:	9b ed       	bh	5454 <__svfiprintf_r+0x7a2>
    5484:	19 56 ff ff 	addi	-1, r25, r10
    5488:	63 57 01 00 	st.w	r10, 0[sp]
    548c:	1b de 30 00 	addi	48, r27, r27
    5490:	59 df ff ff 	st.b	r27, -1[r25]
    5494:	a5 45       	br	5518 <__svfiprintf_r+0x866>
    5496:	03 5e 54 00 	addi	84, sp, r11
    549a:	63 5f 01 00 	st.w	r11, 0[sp]
    549e:	23 67 01 00 	ld.w	0[sp], r12
    54a2:	5f 62       	add	-1, r12
    54a4:	63 67 01 00 	st.w	r12, 0[sp]
    54a8:	db 56 0f 00 	andi	15, r27, r10
    54ac:	23 6f 25 00 	ld.w	36[sp], r13
    54b0:	cd 51       	add	r13, r10
    54b2:	0a 57 00 00 	ld.b	0[r10], r10
    54b6:	4c 57 00 00 	st.b	r10, 0[r12]
    54ba:	1c 58       	mov	r28, r11
    54bc:	dc 5a       	shl	28, r11
    54be:	1b 50       	mov	r27, r10
    54c0:	84 52       	shr	4, r10
    54c2:	0b 51       	or	r11, r10
    54c4:	1c 58       	mov	r28, r11
    54c6:	84 5a       	shr	4, r11
    54c8:	0a d8       	mov	r10, r27
    54ca:	0b e0       	mov	r11, r28
    54cc:	0b 51       	or	r11, r10
    54ce:	8a ed       	bne	549e <__svfiprintf_r+0x7ec>
    54d0:	c5 25       	br	5518 <__svfiprintf_r+0x866>
    54d2:	3c 06 2a 7b 	mov	0x7b2a, r28
    54d6:	00 00 
    54d8:	1c 30       	mov	r28, r6
    54da:	bf ff 7e f6 	jarl	4b58 <_strlen>, lp
    54de:	63 57 0d 00 	st.w	r10, 12[sp]
    54e2:	63 e7 01 00 	st.w	r28, 0[sp]
    54e6:	85 45       	br	5566 <__svfiprintf_r+0x8b4>
    54e8:	60 52       	cmp	0, r10
    54ea:	ea 0d       	bne	5506 <__svfiprintf_r+0x854>
    54ec:	d6 56 01 00 	andi	1, r22, r10
    54f0:	82 15       	be	5510 <__svfiprintf_r+0x85e>
    54f2:	20 56 30 00 	movea	48, r0, r10
    54f6:	43 57 53 00 	st.b	r10, 83[sp]
    54fa:	20 56 53 00 	movea	83, r0, r10
    54fe:	c3 51       	add	sp, r10
    5500:	63 57 01 00 	st.w	r10, 0[sp]
    5504:	a5 0d       	br	5518 <__svfiprintf_r+0x866>
    5506:	03 5e 54 00 	addi	84, sp, r11
    550a:	63 5f 01 00 	st.w	r11, 0[sp]
    550e:	d5 05       	br	5518 <__svfiprintf_r+0x866>
    5510:	03 66 54 00 	addi	84, sp, r12
    5514:	63 67 01 00 	st.w	r12, 0[sp]
    5518:	03 56 54 00 	addi	84, sp, r10
    551c:	23 6f 01 00 	ld.w	0[sp], r13
    5520:	8a 69       	subr	r10, r13
    5522:	63 6f 0d 00 	st.w	r13, 12[sp]
    5526:	85 25       	br	5566 <__svfiprintf_r+0x8b4>
    5528:	43 7f a3 00 	st.b	r15, 163[sp]
    552c:	60 5a       	cmp	0, r11
    552e:	e2 07 23 04 	be	5950 <__svfiprintf_r+0xc9e>
    5532:	43 5f 2c 00 	st.b	r11, 44[sp]
    5536:	43 07 a3 00 	st.b	r0, 163[sp]
    553a:	01 52       	mov	1, r10
    553c:	63 57 0d 00 	st.w	r10, 12[sp]
    5540:	03 5e 2c 00 	addi	44, sp, r11
    5544:	63 5f 01 00 	st.w	r11, 0[sp]
    5548:	80 07 36 04 	jr	597e <__svfiprintf_r+0xccc>
    554c:	23 67 05 00 	ld.w	4[sp], r12
    5550:	63 67 0d 00 	st.w	r12, 12[sp]
    5554:	63 07 05 00 	st.w	r0, 4[sp]
    5558:	f5 05       	br	5566 <__svfiprintf_r+0x8b4>
    555a:	23 6f 05 00 	ld.w	4[sp], r13
    555e:	63 6f 0d 00 	st.w	r13, 12[sp]
    5562:	63 07 05 00 	st.w	r0, 4[sp]
    5566:	23 77 0d 00 	ld.w	12[sp], r14
    556a:	23 57 05 00 	ld.w	4[sp], r10
    556e:	ea 71       	cmp	r10, r14
    5570:	ee 57 3c 73 	cmov	ge, r14, r10, r14
    5574:	63 77 09 00 	st.w	r14, 8[sp]
    5578:	03 57 a3 00 	ld.b	163[sp], r10
    557c:	60 52       	cmp	0, r10
    557e:	c2 05       	be	5586 <__svfiprintf_r+0x8d4>
    5580:	41 72       	add	1, r14
    5582:	63 77 09 00 	st.w	r14, 8[sp]
    5586:	d6 5e 02 00 	andi	2, r22, r11
    558a:	63 5f 1d 00 	st.w	r11, 28[sp]
    558e:	e2 05       	be	559a <__svfiprintf_r+0x8e8>
    5590:	23 67 09 00 	ld.w	8[sp], r12
    5594:	42 62       	add	2, r12
    5596:	63 67 09 00 	st.w	r12, 8[sp]
    559a:	d6 6e 84 00 	andi	132, r22, r13
    559e:	63 6f 21 00 	st.w	r13, 32[sp]
    55a2:	ba 55       	bne	5648 <__svfiprintf_r+0x996>
    55a4:	23 e7 15 00 	ld.w	20[sp], r28
    55a8:	23 77 09 00 	ld.w	8[sp], r14
    55ac:	ae e1       	sub	r14, r28
    55ae:	60 e2       	cmp	0, r28
    55b0:	c7 4d       	ble	5648 <__svfiprintf_r+0x996>
    55b2:	20 56 10 00 	movea	16, r0, r10
    55b6:	ea e1       	cmp	r10, r28
    55b8:	f7 25       	ble	5606 <__svfiprintf_r+0x954>
    55ba:	39 06 4b 7b 	mov	0x7b4b, r25
    55be:	00 00 
    55c0:	0a d8       	mov	r10, r27
    55c2:	7d cf 01 00 	st.w	r25, 0[r29]
    55c6:	7d df 05 00 	st.w	r27, 4[r29]
    55ca:	23 57 9d 00 	ld.w	156[sp], r10
    55ce:	0a 56 10 00 	addi	16, r10, r10
    55d2:	63 57 9d 00 	st.w	r10, 156[sp]
    55d6:	23 57 99 00 	ld.w	152[sp], r10
    55da:	41 52       	add	1, r10
    55dc:	63 57 99 00 	st.w	r10, 152[sp]
    55e0:	67 52       	cmp	7, r10
    55e2:	bf 05       	bgt	55e8 <__svfiprintf_r+0x936>
    55e4:	48 ea       	add	8, r29
    55e6:	d5 0d       	br	5600 <__svfiprintf_r+0x94e>
    55e8:	15 30       	mov	r21, r6
    55ea:	17 38       	mov	r23, r7
    55ec:	20 46 94 00 	movea	148, r0, r8
    55f0:	c3 41       	add	sp, r8
    55f2:	f4 c7 60 f9 	jarl	[r20], lp
    55f6:	60 52       	cmp	0, r10
    55f8:	ea 07 6d 03 	bne	5964 <__svfiprintf_r+0xcb2>
    55fc:	03 ee 54 00 	addi	84, sp, r29
    5600:	50 e2       	add	-16, r28
    5602:	fb e1       	cmp	r27, r28
    5604:	ff dd       	bgt	55c2 <__svfiprintf_r+0x910>
    5606:	2a 06 4b 7b 	mov	0x7b4b, r10
    560a:	00 00 
    560c:	7d 57 01 00 	st.w	r10, 0[r29]
    5610:	7d e7 05 00 	st.w	r28, 4[r29]
    5614:	23 57 9d 00 	ld.w	156[sp], r10
    5618:	ca e1       	add	r10, r28
    561a:	63 e7 9d 00 	st.w	r28, 156[sp]
    561e:	23 57 99 00 	ld.w	152[sp], r10
    5622:	41 52       	add	1, r10
    5624:	63 57 99 00 	st.w	r10, 152[sp]
    5628:	67 52       	cmp	7, r10
    562a:	bf 05       	bgt	5630 <__svfiprintf_r+0x97e>
    562c:	48 ea       	add	8, r29
    562e:	d5 0d       	br	5648 <__svfiprintf_r+0x996>
    5630:	15 30       	mov	r21, r6
    5632:	17 38       	mov	r23, r7
    5634:	20 46 94 00 	movea	148, r0, r8
    5638:	c3 41       	add	sp, r8
    563a:	f4 c7 60 f9 	jarl	[r20], lp
    563e:	60 52       	cmp	0, r10
    5640:	ea 07 25 03 	bne	5964 <__svfiprintf_r+0xcb2>
    5644:	03 ee 54 00 	addi	84, sp, r29
    5648:	03 57 a3 00 	ld.b	163[sp], r10
    564c:	60 52       	cmp	0, r10
    564e:	a2 25       	be	5692 <__svfiprintf_r+0x9e0>
    5650:	03 56 a3 00 	addi	163, sp, r10
    5654:	7d 57 01 00 	st.w	r10, 0[r29]
    5658:	01 52       	mov	1, r10
    565a:	7d 57 05 00 	st.w	r10, 4[r29]
    565e:	23 57 9d 00 	ld.w	156[sp], r10
    5662:	41 52       	add	1, r10
    5664:	63 57 9d 00 	st.w	r10, 156[sp]
    5668:	23 57 99 00 	ld.w	152[sp], r10
    566c:	41 52       	add	1, r10
    566e:	63 57 99 00 	st.w	r10, 152[sp]
    5672:	67 52       	cmp	7, r10
    5674:	bf 05       	bgt	567a <__svfiprintf_r+0x9c8>
    5676:	48 ea       	add	8, r29
    5678:	d5 0d       	br	5692 <__svfiprintf_r+0x9e0>
    567a:	15 30       	mov	r21, r6
    567c:	17 38       	mov	r23, r7
    567e:	20 46 94 00 	movea	148, r0, r8
    5682:	c3 41       	add	sp, r8
    5684:	f4 c7 60 f9 	jarl	[r20], lp
    5688:	60 52       	cmp	0, r10
    568a:	ea 07 db 02 	bne	5964 <__svfiprintf_r+0xcb2>
    568e:	03 ee 54 00 	addi	84, sp, r29
    5692:	23 57 1d 00 	ld.w	28[sp], r10
    5696:	60 52       	cmp	0, r10
    5698:	b2 25       	be	56de <__svfiprintf_r+0xa2c>
    569a:	20 5e 2a 00 	movea	42, r0, r11
    569e:	c3 59       	add	sp, r11
    56a0:	7d 5f 01 00 	st.w	r11, 0[r29]
    56a4:	02 52       	mov	2, r10
    56a6:	7d 57 05 00 	st.w	r10, 4[r29]
    56aa:	23 57 9d 00 	ld.w	156[sp], r10
    56ae:	42 52       	add	2, r10
    56b0:	63 57 9d 00 	st.w	r10, 156[sp]
    56b4:	23 57 99 00 	ld.w	152[sp], r10
    56b8:	41 52       	add	1, r10
    56ba:	63 57 99 00 	st.w	r10, 152[sp]
    56be:	67 52       	cmp	7, r10
    56c0:	bf 05       	bgt	56c6 <__svfiprintf_r+0xa14>
    56c2:	48 ea       	add	8, r29
    56c4:	d5 0d       	br	56de <__svfiprintf_r+0xa2c>
    56c6:	15 30       	mov	r21, r6
    56c8:	17 38       	mov	r23, r7
    56ca:	20 46 94 00 	movea	148, r0, r8
    56ce:	c3 41       	add	sp, r8
    56d0:	f4 c7 60 f9 	jarl	[r20], lp
    56d4:	60 52       	cmp	0, r10
    56d6:	ea 07 8f 02 	bne	5964 <__svfiprintf_r+0xcb2>
    56da:	03 ee 54 00 	addi	84, sp, r29
    56de:	20 56 80 00 	movea	128, r0, r10
    56e2:	23 67 21 00 	ld.w	32[sp], r12
    56e6:	ea 61       	cmp	r10, r12
    56e8:	ba 55       	bne	578e <__svfiprintf_r+0xadc>
    56ea:	23 e7 15 00 	ld.w	20[sp], r28
    56ee:	23 6f 09 00 	ld.w	8[sp], r13
    56f2:	ad e1       	sub	r13, r28
    56f4:	60 e2       	cmp	0, r28
    56f6:	c7 4d       	ble	578e <__svfiprintf_r+0xadc>
    56f8:	20 56 10 00 	movea	16, r0, r10
    56fc:	ea e1       	cmp	r10, r28
    56fe:	f7 25       	ble	574c <__svfiprintf_r+0xa9a>
    5700:	39 06 5b 7b 	mov	0x7b5b, r25
    5704:	00 00 
    5706:	0a d8       	mov	r10, r27
    5708:	7d cf 01 00 	st.w	r25, 0[r29]
    570c:	7d df 05 00 	st.w	r27, 4[r29]
    5710:	23 57 9d 00 	ld.w	156[sp], r10
    5714:	0a 56 10 00 	addi	16, r10, r10
    5718:	63 57 9d 00 	st.w	r10, 156[sp]
    571c:	23 57 99 00 	ld.w	152[sp], r10
    5720:	41 52       	add	1, r10
    5722:	63 57 99 00 	st.w	r10, 152[sp]
    5726:	67 52       	cmp	7, r10
    5728:	bf 05       	bgt	572e <__svfiprintf_r+0xa7c>
    572a:	48 ea       	add	8, r29
    572c:	d5 0d       	br	5746 <__svfiprintf_r+0xa94>
    572e:	15 30       	mov	r21, r6
    5730:	17 38       	mov	r23, r7
    5732:	20 46 94 00 	movea	148, r0, r8
    5736:	c3 41       	add	sp, r8
    5738:	f4 c7 60 f9 	jarl	[r20], lp
    573c:	60 52       	cmp	0, r10
    573e:	ea 07 27 02 	bne	5964 <__svfiprintf_r+0xcb2>
    5742:	03 ee 54 00 	addi	84, sp, r29
    5746:	50 e2       	add	-16, r28
    5748:	fb e1       	cmp	r27, r28
    574a:	ff dd       	bgt	5708 <__svfiprintf_r+0xa56>
    574c:	2a 06 5b 7b 	mov	0x7b5b, r10
    5750:	00 00 
    5752:	7d 57 01 00 	st.w	r10, 0[r29]
    5756:	7d e7 05 00 	st.w	r28, 4[r29]
    575a:	23 57 9d 00 	ld.w	156[sp], r10
    575e:	ca e1       	add	r10, r28
    5760:	63 e7 9d 00 	st.w	r28, 156[sp]
    5764:	23 57 99 00 	ld.w	152[sp], r10
    5768:	41 52       	add	1, r10
    576a:	63 57 99 00 	st.w	r10, 152[sp]
    576e:	67 52       	cmp	7, r10
    5770:	bf 05       	bgt	5776 <__svfiprintf_r+0xac4>
    5772:	48 ea       	add	8, r29
    5774:	d5 0d       	br	578e <__svfiprintf_r+0xadc>
    5776:	15 30       	mov	r21, r6
    5778:	17 38       	mov	r23, r7
    577a:	20 46 94 00 	movea	148, r0, r8
    577e:	c3 41       	add	sp, r8
    5780:	f4 c7 60 f9 	jarl	[r20], lp
    5784:	60 52       	cmp	0, r10
    5786:	ea 07 df 01 	bne	5964 <__svfiprintf_r+0xcb2>
    578a:	03 ee 54 00 	addi	84, sp, r29
    578e:	23 e7 05 00 	ld.w	4[sp], r28
    5792:	23 77 0d 00 	ld.w	12[sp], r14
    5796:	ae e1       	sub	r14, r28
    5798:	60 e2       	cmp	0, r28
    579a:	c7 4d       	ble	5832 <__svfiprintf_r+0xb80>
    579c:	20 56 10 00 	movea	16, r0, r10
    57a0:	ea e1       	cmp	r10, r28
    57a2:	f7 25       	ble	57f0 <__svfiprintf_r+0xb3e>
    57a4:	39 06 5b 7b 	mov	0x7b5b, r25
    57a8:	00 00 
    57aa:	0a d8       	mov	r10, r27
    57ac:	7d cf 01 00 	st.w	r25, 0[r29]
    57b0:	7d df 05 00 	st.w	r27, 4[r29]
    57b4:	23 57 9d 00 	ld.w	156[sp], r10
    57b8:	0a 56 10 00 	addi	16, r10, r10
    57bc:	63 57 9d 00 	st.w	r10, 156[sp]
    57c0:	23 57 99 00 	ld.w	152[sp], r10
    57c4:	41 52       	add	1, r10
    57c6:	63 57 99 00 	st.w	r10, 152[sp]
    57ca:	67 52       	cmp	7, r10
    57cc:	bf 05       	bgt	57d2 <__svfiprintf_r+0xb20>
    57ce:	48 ea       	add	8, r29
    57d0:	d5 0d       	br	57ea <__svfiprintf_r+0xb38>
    57d2:	15 30       	mov	r21, r6
    57d4:	17 38       	mov	r23, r7
    57d6:	20 46 94 00 	movea	148, r0, r8
    57da:	c3 41       	add	sp, r8
    57dc:	f4 c7 60 f9 	jarl	[r20], lp
    57e0:	60 52       	cmp	0, r10
    57e2:	ea 07 83 01 	bne	5964 <__svfiprintf_r+0xcb2>
    57e6:	03 ee 54 00 	addi	84, sp, r29
    57ea:	50 e2       	add	-16, r28
    57ec:	fb e1       	cmp	r27, r28
    57ee:	ff dd       	bgt	57ac <__svfiprintf_r+0xafa>
    57f0:	2a 06 5b 7b 	mov	0x7b5b, r10
    57f4:	00 00 
    57f6:	7d 57 01 00 	st.w	r10, 0[r29]
    57fa:	7d e7 05 00 	st.w	r28, 4[r29]
    57fe:	23 57 9d 00 	ld.w	156[sp], r10
    5802:	ca e1       	add	r10, r28
    5804:	63 e7 9d 00 	st.w	r28, 156[sp]
    5808:	23 57 99 00 	ld.w	152[sp], r10
    580c:	41 52       	add	1, r10
    580e:	63 57 99 00 	st.w	r10, 152[sp]
    5812:	67 52       	cmp	7, r10
    5814:	bf 05       	bgt	581a <__svfiprintf_r+0xb68>
    5816:	48 ea       	add	8, r29
    5818:	d5 0d       	br	5832 <__svfiprintf_r+0xb80>
    581a:	15 30       	mov	r21, r6
    581c:	17 38       	mov	r23, r7
    581e:	20 46 94 00 	movea	148, r0, r8
    5822:	c3 41       	add	sp, r8
    5824:	f4 c7 60 f9 	jarl	[r20], lp
    5828:	60 52       	cmp	0, r10
    582a:	ea 07 3b 01 	bne	5964 <__svfiprintf_r+0xcb2>
    582e:	03 ee 54 00 	addi	84, sp, r29
    5832:	23 57 01 00 	ld.w	0[sp], r10
    5836:	7d 57 01 00 	st.w	r10, 0[r29]
    583a:	23 5f 0d 00 	ld.w	12[sp], r11
    583e:	7d 5f 05 00 	st.w	r11, 4[r29]
    5842:	23 57 9d 00 	ld.w	156[sp], r10
    5846:	cb 51       	add	r11, r10
    5848:	63 57 9d 00 	st.w	r10, 156[sp]
    584c:	23 57 99 00 	ld.w	152[sp], r10
    5850:	41 52       	add	1, r10
    5852:	63 57 99 00 	st.w	r10, 152[sp]
    5856:	67 52       	cmp	7, r10
    5858:	bf 05       	bgt	585e <__svfiprintf_r+0xbac>
    585a:	48 ea       	add	8, r29
    585c:	c5 0d       	br	5874 <__svfiprintf_r+0xbc2>
    585e:	15 30       	mov	r21, r6
    5860:	17 38       	mov	r23, r7
    5862:	20 46 94 00 	movea	148, r0, r8
    5866:	c3 41       	add	sp, r8
    5868:	f4 c7 60 f9 	jarl	[r20], lp
    586c:	60 52       	cmp	0, r10
    586e:	ba 7d       	bne	5964 <__svfiprintf_r+0xcb2>
    5870:	03 ee 54 00 	addi	84, sp, r29
    5874:	d6 b6 04 00 	andi	4, r22, r22
    5878:	d2 4d       	be	5912 <__svfiprintf_r+0xc60>
    587a:	23 e7 15 00 	ld.w	20[sp], r28
    587e:	23 67 09 00 	ld.w	8[sp], r12
    5882:	ac e1       	sub	r12, r28
    5884:	60 e2       	cmp	0, r28
    5886:	e7 45       	ble	5912 <__svfiprintf_r+0xc60>
    5888:	20 56 10 00 	movea	16, r0, r10
    588c:	ea e1       	cmp	r10, r28
    588e:	e7 25       	ble	58da <__svfiprintf_r+0xc28>
    5890:	39 06 4b 7b 	mov	0x7b4b, r25
    5894:	00 00 
    5896:	0a d8       	mov	r10, r27
    5898:	7d cf 01 00 	st.w	r25, 0[r29]
    589c:	7d df 05 00 	st.w	r27, 4[r29]
    58a0:	23 57 9d 00 	ld.w	156[sp], r10
    58a4:	0a 56 10 00 	addi	16, r10, r10
    58a8:	63 57 9d 00 	st.w	r10, 156[sp]
    58ac:	23 57 99 00 	ld.w	152[sp], r10
    58b0:	41 52       	add	1, r10
    58b2:	63 57 99 00 	st.w	r10, 152[sp]
    58b6:	67 52       	cmp	7, r10
    58b8:	bf 05       	bgt	58be <__svfiprintf_r+0xc0c>
    58ba:	48 ea       	add	8, r29
    58bc:	c5 0d       	br	58d4 <__svfiprintf_r+0xc22>
    58be:	15 30       	mov	r21, r6
    58c0:	17 38       	mov	r23, r7
    58c2:	20 46 94 00 	movea	148, r0, r8
    58c6:	c3 41       	add	sp, r8
    58c8:	f4 c7 60 f9 	jarl	[r20], lp
    58cc:	60 52       	cmp	0, r10
    58ce:	ba 4d       	bne	5964 <__svfiprintf_r+0xcb2>
    58d0:	03 ee 54 00 	addi	84, sp, r29
    58d4:	50 e2       	add	-16, r28
    58d6:	fb e1       	cmp	r27, r28
    58d8:	8f e5       	bgt	5898 <__svfiprintf_r+0xbe6>
    58da:	2a 06 4b 7b 	mov	0x7b4b, r10
    58de:	00 00 
    58e0:	7d 57 01 00 	st.w	r10, 0[r29]
    58e4:	7d e7 05 00 	st.w	r28, 4[r29]
    58e8:	23 57 9d 00 	ld.w	156[sp], r10
    58ec:	ca e1       	add	r10, r28
    58ee:	63 e7 9d 00 	st.w	r28, 156[sp]
    58f2:	23 57 99 00 	ld.w	152[sp], r10
    58f6:	41 52       	add	1, r10
    58f8:	63 57 99 00 	st.w	r10, 152[sp]
    58fc:	67 52       	cmp	7, r10
    58fe:	a7 0d       	ble	5912 <__svfiprintf_r+0xc60>
    5900:	15 30       	mov	r21, r6
    5902:	17 38       	mov	r23, r7
    5904:	20 46 94 00 	movea	148, r0, r8
    5908:	c3 41       	add	sp, r8
    590a:	f4 c7 60 f9 	jarl	[r20], lp
    590e:	60 52       	cmp	0, r10
    5910:	aa 2d       	bne	5964 <__svfiprintf_r+0xcb2>
    5912:	23 6f 09 00 	ld.w	8[sp], r13
    5916:	23 77 15 00 	ld.w	20[sp], r14
    591a:	ee 69       	cmp	r14, r13
    591c:	ed 77 3c 53 	cmov	ge, r13, r14, r10
    5920:	23 5f 11 00 	ld.w	16[sp], r11
    5924:	ca 59       	add	r10, r11
    5926:	63 5f 11 00 	st.w	r11, 16[sp]
    592a:	23 57 9d 00 	ld.w	156[sp], r10
    592e:	60 52       	cmp	0, r10
    5930:	a2 0d       	be	5944 <__svfiprintf_r+0xc92>
    5932:	15 30       	mov	r21, r6
    5934:	17 38       	mov	r23, r7
    5936:	20 46 94 00 	movea	148, r0, r8
    593a:	c3 41       	add	sp, r8
    593c:	f4 c7 60 f9 	jarl	[r20], lp
    5940:	60 52       	cmp	0, r10
    5942:	9a 15       	bne	5964 <__svfiprintf_r+0xcb2>
    5944:	63 07 99 00 	st.w	r0, 152[sp]
    5948:	03 ee 54 00 	addi	84, sp, r29
    594c:	bf 07 d2 f3 	jr	4d1e <__svfiprintf_r+0x6c>
    5950:	23 57 9d 00 	ld.w	156[sp], r10
    5954:	60 52       	cmp	0, r10
    5956:	f2 05       	be	5964 <__svfiprintf_r+0xcb2>
    5958:	15 30       	mov	r21, r6
    595a:	17 38       	mov	r23, r7
    595c:	03 46 94 00 	addi	148, sp, r8
    5960:	bf ff 1a f2 	jarl	4b7a <___ssprint_r>, lp
    5964:	23 67 11 00 	ld.w	16[sp], r12
    5968:	d7 f7 0c 00 	tst1	6, 12[r23]
    596c:	ff 67 14 63 	cmov	nz, -1, r12, r12
    5970:	63 67 11 00 	st.w	r12, 16[sp]
    5974:	23 57 11 00 	ld.w	16[sp], r10
    5978:	03 1e a4 00 	addi	164, sp, sp
    597c:	01 02       	callt	1
    597e:	23 6f 0d 00 	ld.w	12[sp], r13
    5982:	60 6a       	cmp	0, r13
    5984:	ed 07 3c 6b 	cmov	ge, r13, r0, r13
    5988:	63 6f 09 00 	st.w	r13, 8[sp]
    598c:	63 07 05 00 	st.w	r0, 4[sp]
    5990:	bf 07 f6 fb 	jr	5586 <__svfiprintf_r+0x8d4>

00005994 <___trap0>:
    5994:	ff 07 00 01 	trap	31
    5998:	6a 51       	tst	r10, r10
    599a:	d2 05       	be	59a4 <___trap0+0x10>
    599c:	40 36 df fe 	movhi	-289, r0, r6
    59a0:	66 57 d5 08 	st.w	r10, 2260[r6]
    59a4:	7f 00       	jmp	[lp]

000059a6 <__calloc_r>:
    59a6:	10 02       	callt	16
    59a8:	e8 3f 20 02 	mul	r8, r7, r0
    59ac:	bf ff aa df 	jarl	3956 <__malloc_r>, lp
    59b0:	0a e8       	mov	r10, r29
    59b2:	60 52       	cmp	0, r10
    59b4:	f2 35       	be	5a22 <__calloc_r+0x7c>
    59b6:	2a 47 fd ff 	ld.w	-4[r10], r8
    59ba:	1c 52       	mov	-4, r10
    59bc:	4a 41       	and	r10, r8
    59be:	ca 41       	add	r10, r8
    59c0:	20 56 24 00 	movea	36, r0, r10
    59c4:	ea 41       	cmp	r10, r8
    59c6:	ab 2d       	bh	5a1a <__calloc_r+0x74>
    59c8:	20 56 13 00 	movea	19, r0, r10
    59cc:	ea 41       	cmp	r10, r8
    59ce:	e3 1d       	bnh	5a0a <__calloc_r+0x64>
    59d0:	7d 07 01 00 	st.w	r0, 0[r29]
    59d4:	7d 07 05 00 	st.w	r0, 4[r29]
    59d8:	20 56 1b 00 	movea	27, r0, r10
    59dc:	ea 41       	cmp	r10, r8
    59de:	cb 05       	bh	59e6 <__calloc_r+0x40>
    59e0:	1d 56 08 00 	addi	8, r29, r10
    59e4:	c5 15       	br	5a0c <__calloc_r+0x66>
    59e6:	7d 07 09 00 	st.w	r0, 8[r29]
    59ea:	7d 07 0d 00 	st.w	r0, 12[r29]
    59ee:	20 56 23 00 	movea	35, r0, r10
    59f2:	ea 41       	cmp	r10, r8
    59f4:	cb 05       	bh	59fc <__calloc_r+0x56>
    59f6:	1d 56 10 00 	addi	16, r29, r10
    59fa:	95 0d       	br	5a0c <__calloc_r+0x66>
    59fc:	7d 07 11 00 	st.w	r0, 16[r29]
    5a00:	7d 07 15 00 	st.w	r0, 20[r29]
    5a04:	1d 56 18 00 	addi	24, r29, r10
    5a08:	a5 05       	br	5a0c <__calloc_r+0x66>
    5a0a:	1d 50       	mov	r29, r10
    5a0c:	6a 07 01 00 	st.w	r0, 0[r10]
    5a10:	6a 07 05 00 	st.w	r0, 4[r10]
    5a14:	6a 07 09 00 	st.w	r0, 8[r10]
    5a18:	d5 05       	br	5a22 <__calloc_r+0x7c>
    5a1a:	1d 30       	mov	r29, r6
    5a1c:	00 3a       	mov	0, r7
    5a1e:	80 ff 56 00 	jarl	5a74 <_memset>, lp
    5a22:	1d 50       	mov	r29, r10
    5a24:	11 02       	callt	17

00005a26 <_memmove>:
    5a26:	06 50       	mov	r6, r10
    5a28:	e7 31       	cmp	r7, r6
    5a2a:	cb 05       	bh	5a32 <_memmove+0xc>
    5a2c:	60 42       	cmp	0, r8
    5a2e:	9a 1d       	bne	5a60 <_memmove+0x3a>
    5a30:	95 25       	br	5a72 <_memmove+0x4c>
    5a32:	07 70       	mov	r7, r14
    5a34:	c8 71       	add	r8, r14
    5a36:	ee 31       	cmp	r14, r6
    5a38:	a9 fd       	bnl	5a2c <_memmove+0x6>
    5a3a:	60 42       	cmp	0, r8
    5a3c:	b2 1d       	be	5a72 <_memmove+0x4c>
    5a3e:	06 60       	mov	r6, r12
    5a40:	c8 61       	add	r8, r12
    5a42:	08 58       	mov	r8, r11
    5a44:	80 41       	subr	r0, r8
    5a46:	c8 71       	add	r8, r14
    5a48:	cc 41       	add	r12, r8
    5a4a:	0e 60       	mov	r14, r12
    5a4c:	cb 61       	add	r11, r12
    5a4e:	0c 6f ff ff 	ld.b	-1[r12], r13
    5a52:	08 60       	mov	r8, r12
    5a54:	cb 61       	add	r11, r12
    5a56:	4c 6f ff ff 	st.b	r13, -1[r12]
    5a5a:	5f 5a       	add	-1, r11
    5a5c:	fa f5       	bne	5a4a <_memmove+0x24>
    5a5e:	a5 0d       	br	5a72 <_memmove+0x4c>
    5a60:	0a 58       	mov	r10, r11
    5a62:	07 67 00 00 	ld.b	0[r7], r12
    5a66:	4b 67 00 00 	st.b	r12, 0[r11]
    5a6a:	41 5a       	add	1, r11
    5a6c:	41 3a       	add	1, r7
    5a6e:	5f 42       	add	-1, r8
    5a70:	9a fd       	bne	5a62 <_memmove+0x3c>
    5a72:	7f 00       	jmp	[lp]

00005a74 <_memset>:
    5a74:	06 50       	mov	r6, r10
    5a76:	60 42       	cmp	0, r8
    5a78:	f2 05       	be	5a86 <_memset+0x12>
    5a7a:	06 58       	mov	r6, r11
    5a7c:	4b 3f 00 00 	st.b	r7, 0[r11]
    5a80:	41 5a       	add	1, r11
    5a82:	5f 42       	add	-1, r8
    5a84:	ca fd       	bne	5a7c <_memset+0x8>
    5a86:	7f 00       	jmp	[lp]

00005a88 <__realloc_r>:
    5a88:	02 02       	callt	2
    5a8a:	06 d0       	mov	r6, r26
    5a8c:	07 e8       	mov	r7, r29
    5a8e:	08 d8       	mov	r8, r27
    5a90:	60 3a       	cmp	0, r7
    5a92:	fa 05       	bne	5aa0 <__realloc_r+0x18>
    5a94:	08 38       	mov	r8, r7
    5a96:	bf ff c0 de 	jarl	3956 <__malloc_r>, lp
    5a9a:	0a d8       	mov	r10, r27
    5a9c:	80 07 98 04 	jr	5f34 <__realloc_r+0x4ac>
    5aa0:	bf ff 8a e5 	jarl	402a <___malloc_lock>, lp
    5aa4:	3d 67 fd ff 	ld.w	-4[r29], r12
    5aa8:	1b e6 0b 00 	addi	11, r27, r28
    5aac:	20 56 16 00 	movea	22, r0, r10
    5ab0:	ea e1       	cmp	r10, r28
    5ab2:	f3 05       	bnh	5ac0 <__realloc_r+0x38>
    5ab4:	18 52       	mov	-8, r10
    5ab6:	4a e1       	and	r10, r28
    5ab8:	1c 50       	mov	r28, r10
    5aba:	60 e2       	cmp	0, r28
    5abc:	de 05       	bge	5ac6 <__realloc_r+0x3e>
    5abe:	e5 05       	br	5aca <__realloc_r+0x42>
    5ac0:	20 56 10 00 	movea	16, r0, r10
    5ac4:	0a e0       	mov	r10, r28
    5ac6:	fc d9       	cmp	r28, r27
    5ac8:	f3 05       	bnh	5ad6 <__realloc_r+0x4e>
    5aca:	0c 52       	mov	12, r10
    5acc:	7a 57 01 00 	st.w	r10, 0[r26]
    5ad0:	00 da       	mov	0, r27
    5ad2:	80 07 62 04 	jr	5f34 <__realloc_r+0x4ac>
    5ad6:	1d be f8 ff 	addi	-8, r29, r23
    5ada:	1c ca       	mov	-4, r25
    5adc:	4c c9       	and	r12, r25
    5ade:	ea c9       	cmp	r10, r25
    5ae0:	ee 07 f1 03 	bge	5ed0 <__realloc_r+0x448>
    5ae4:	17 58       	mov	r23, r11
    5ae6:	d9 59       	add	r25, r11
    5ae8:	2d 06 74 04 	mov	0xfedf0474, r13
    5aec:	df fe 
    5aee:	2d 6f 09 00 	ld.w	8[r13], r13
    5af2:	eb 69       	cmp	r11, r13
    5af4:	d2 0d       	be	5b0e <__realloc_r+0x86>
    5af6:	2b c7 05 00 	ld.w	4[r11], r24
    5afa:	1e 72       	mov	-2, r14
    5afc:	58 71       	and	r24, r14
    5afe:	cb 71       	add	r11, r14
    5b00:	ce c7 04 00 	tst1	0, 4[r14]
    5b04:	e2 07 35 04 	be	5f38 <__realloc_r+0x4b0>
    5b08:	00 72       	mov	0, r14
    5b0a:	00 5a       	mov	0, r11
    5b0c:	85 35       	br	5b6c <__realloc_r+0xe4>
    5b0e:	2d 77 05 00 	ld.w	4[r13], r14
    5b12:	1c 5a       	mov	-4, r11
    5b14:	4b 71       	and	r11, r14
    5b16:	0e 58       	mov	r14, r11
    5b18:	d9 59       	add	r25, r11
    5b1a:	1c 7e 10 00 	addi	16, r28, r15
    5b1e:	ef 59       	cmp	r15, r11
    5b20:	d6 25       	blt	5b6a <__realloc_r+0xe2>
    5b22:	dc b9       	add	r28, r23
    5b24:	2a 06 74 04 	mov	0xfedf0474, r10
    5b28:	df fe 
    5b2a:	6a bf 09 00 	st.w	r23, 8[r10]
    5b2e:	0b 50       	mov	r11, r10
    5b30:	bc 51       	sub	r28, r10
    5b32:	8a 56 01 00 	ori	1, r10, r10
    5b36:	77 57 05 00 	st.w	r10, 4[r23]
    5b3a:	3d 57 fd ff 	ld.w	-4[r29], r10
    5b3e:	ca 56 01 00 	andi	1, r10, r10
    5b42:	0a e1       	or	r10, r28
    5b44:	7d e7 fd ff 	st.w	r28, -4[r29]
    5b48:	1a 30       	mov	r26, r6
    5b4a:	bf ff e2 e4 	jarl	402c <___malloc_unlock>, lp
    5b4e:	1d d8       	mov	r29, r27
    5b50:	80 07 e4 03 	jr	5f34 <__realloc_r+0x4ac>
    5b54:	2b 57 0d 00 	ld.w	12[r11], r10
    5b58:	2b 5f 09 00 	ld.w	8[r11], r11
    5b5c:	6b 57 0d 00 	st.w	r10, 12[r11]
    5b60:	6a 5f 09 00 	st.w	r11, 8[r10]
    5b64:	17 e8       	mov	r23, r29
    5b66:	80 07 6e 03 	jr	5ed4 <__realloc_r+0x44c>
    5b6a:	0d 58       	mov	r13, r11
    5b6c:	cc 66 01 00 	andi	1, r12, r12
    5b70:	ea 07 81 02 	bne	5df0 <__realloc_r+0x368>
    5b74:	3d b7 f9 ff 	ld.w	-8[r29], r22
    5b78:	97 b1       	subr	r23, r22
    5b7a:	36 67 05 00 	ld.w	4[r22], r12
    5b7e:	1c 7a       	mov	-4, r15
    5b80:	4f 61       	and	r15, r12
    5b82:	60 5a       	cmp	0, r11
    5b84:	e2 07 b9 01 	be	5d3c <__realloc_r+0x2b4>
    5b88:	ed 59       	cmp	r13, r11
    5b8a:	ea 75       	bne	5c76 <__realloc_r+0x1ee>
    5b8c:	0c c0       	mov	r12, r24
    5b8e:	d9 c1       	add	r25, r24
    5b90:	ce c1       	add	r14, r24
    5b92:	1c 5e 10 00 	addi	16, r28, r11
    5b96:	eb c1       	cmp	r11, r24
    5b98:	e6 07 a5 01 	blt	5d3c <__realloc_r+0x2b4>
    5b9c:	36 57 0d 00 	ld.w	12[r22], r10
    5ba0:	36 5f 09 00 	ld.w	8[r22], r11
    5ba4:	6b 57 0d 00 	st.w	r10, 12[r11]
    5ba8:	6a 5f 09 00 	st.w	r11, 8[r10]
    5bac:	16 de 08 00 	addi	8, r22, r27
    5bb0:	19 46 fc ff 	addi	-4, r25, r8
    5bb4:	20 56 24 00 	movea	36, r0, r10
    5bb8:	ea 41       	cmp	r10, r8
    5bba:	9b 45       	bh	5c3c <__realloc_r+0x1b4>
    5bbc:	20 56 13 00 	movea	19, r0, r10
    5bc0:	ea 41       	cmp	r10, r8
    5bc2:	f3 2d       	bnh	5c20 <__realloc_r+0x198>
    5bc4:	3d 57 01 00 	ld.w	0[r29], r10
    5bc8:	76 57 09 00 	st.w	r10, 8[r22]
    5bcc:	3d 57 05 00 	ld.w	4[r29], r10
    5bd0:	76 57 0d 00 	st.w	r10, 12[r22]
    5bd4:	20 56 1b 00 	movea	27, r0, r10
    5bd8:	ea 41       	cmp	r10, r8
    5bda:	db 05       	bh	5be4 <__realloc_r+0x15c>
    5bdc:	16 56 10 00 	addi	16, r22, r10
    5be0:	48 ea       	add	8, r29
    5be2:	85 25       	br	5c22 <__realloc_r+0x19a>
    5be4:	3d 57 09 00 	ld.w	8[r29], r10
    5be8:	76 57 11 00 	st.w	r10, 16[r22]
    5bec:	3d 57 0d 00 	ld.w	12[r29], r10
    5bf0:	76 57 15 00 	st.w	r10, 20[r22]
    5bf4:	20 56 23 00 	movea	35, r0, r10
    5bf8:	ea 41       	cmp	r10, r8
    5bfa:	eb 05       	bh	5c06 <__realloc_r+0x17e>
    5bfc:	16 56 18 00 	addi	24, r22, r10
    5c00:	1d ee 10 00 	addi	16, r29, r29
    5c04:	f5 0d       	br	5c22 <__realloc_r+0x19a>
    5c06:	3d 57 11 00 	ld.w	16[r29], r10
    5c0a:	76 57 19 00 	st.w	r10, 24[r22]
    5c0e:	3d 57 15 00 	ld.w	20[r29], r10
    5c12:	76 57 1d 00 	st.w	r10, 28[r22]
    5c16:	16 56 20 00 	addi	32, r22, r10
    5c1a:	1d ee 18 00 	addi	24, r29, r29
    5c1e:	a5 05       	br	5c22 <__realloc_r+0x19a>
    5c20:	1b 50       	mov	r27, r10
    5c22:	3d 5f 01 00 	ld.w	0[r29], r11
    5c26:	6a 5f 01 00 	st.w	r11, 0[r10]
    5c2a:	3d 5f 05 00 	ld.w	4[r29], r11
    5c2e:	6a 5f 05 00 	st.w	r11, 4[r10]
    5c32:	3d 5f 09 00 	ld.w	8[r29], r11
    5c36:	6a 5f 09 00 	st.w	r11, 8[r10]
    5c3a:	d5 05       	br	5c44 <__realloc_r+0x1bc>
    5c3c:	1b 30       	mov	r27, r6
    5c3e:	1d 38       	mov	r29, r7
    5c40:	bf ff e6 fd 	jarl	5a26 <_memmove>, lp
    5c44:	16 50       	mov	r22, r10
    5c46:	dc 51       	add	r28, r10
    5c48:	2b 06 74 04 	mov	0xfedf0474, r11
    5c4c:	df fe 
    5c4e:	6b 57 09 00 	st.w	r10, 8[r11]
    5c52:	18 58       	mov	r24, r11
    5c54:	bc 59       	sub	r28, r11
    5c56:	8b 5e 01 00 	ori	1, r11, r11
    5c5a:	6a 5f 05 00 	st.w	r11, 4[r10]
    5c5e:	36 57 05 00 	ld.w	4[r22], r10
    5c62:	ca 56 01 00 	andi	1, r10, r10
    5c66:	0a e1       	or	r10, r28
    5c68:	76 e7 05 00 	st.w	r28, 4[r22]
    5c6c:	1a 30       	mov	r26, r6
    5c6e:	bf ff be e3 	jarl	402c <___malloc_unlock>, lp
    5c72:	80 07 c2 02 	jr	5f34 <__realloc_r+0x4ac>
    5c76:	0c c0       	mov	r12, r24
    5c78:	d9 c1       	add	r25, r24
    5c7a:	ce c1       	add	r14, r24
    5c7c:	ea c1       	cmp	r10, r24
    5c7e:	f6 5d       	blt	5d3c <__realloc_r+0x2b4>
    5c80:	2b 57 0d 00 	ld.w	12[r11], r10
    5c84:	2b 5f 09 00 	ld.w	8[r11], r11
    5c88:	6b 57 0d 00 	st.w	r10, 12[r11]
    5c8c:	6a 5f 09 00 	st.w	r11, 8[r10]
    5c90:	36 57 0d 00 	ld.w	12[r22], r10
    5c94:	36 5f 09 00 	ld.w	8[r22], r11
    5c98:	6b 57 0d 00 	st.w	r10, 12[r11]
    5c9c:	6a 5f 09 00 	st.w	r11, 8[r10]
    5ca0:	16 36 08 00 	addi	8, r22, r6
    5ca4:	19 46 fc ff 	addi	-4, r25, r8
    5ca8:	20 56 24 00 	movea	36, r0, r10
    5cac:	ea 41       	cmp	r10, r8
    5cae:	9b 45       	bh	5d30 <__realloc_r+0x2a8>
    5cb0:	20 56 13 00 	movea	19, r0, r10
    5cb4:	ea 41       	cmp	r10, r8
    5cb6:	e3 2d       	bnh	5d12 <__realloc_r+0x28a>
    5cb8:	3d 57 01 00 	ld.w	0[r29], r10
    5cbc:	76 57 09 00 	st.w	r10, 8[r22]
    5cc0:	3d 57 05 00 	ld.w	4[r29], r10
    5cc4:	76 57 0d 00 	st.w	r10, 12[r22]
    5cc8:	20 56 1b 00 	movea	27, r0, r10
    5ccc:	ea 41       	cmp	r10, r8
    5cce:	db 05       	bh	5cd8 <__realloc_r+0x250>
    5cd0:	16 36 10 00 	addi	16, r22, r6
    5cd4:	48 ea       	add	8, r29
    5cd6:	e5 1d       	br	5d12 <__realloc_r+0x28a>
    5cd8:	3d 57 09 00 	ld.w	8[r29], r10
    5cdc:	76 57 11 00 	st.w	r10, 16[r22]
    5ce0:	3d 57 0d 00 	ld.w	12[r29], r10
    5ce4:	76 57 15 00 	st.w	r10, 20[r22]
    5ce8:	20 56 23 00 	movea	35, r0, r10
    5cec:	ea 41       	cmp	r10, r8
    5cee:	eb 05       	bh	5cfa <__realloc_r+0x272>
    5cf0:	16 36 18 00 	addi	24, r22, r6
    5cf4:	1d ee 10 00 	addi	16, r29, r29
    5cf8:	d5 0d       	br	5d12 <__realloc_r+0x28a>
    5cfa:	3d 57 11 00 	ld.w	16[r29], r10
    5cfe:	76 57 19 00 	st.w	r10, 24[r22]
    5d02:	3d 57 15 00 	ld.w	20[r29], r10
    5d06:	76 57 1d 00 	st.w	r10, 28[r22]
    5d0a:	16 36 20 00 	addi	32, r22, r6
    5d0e:	1d ee 18 00 	addi	24, r29, r29
    5d12:	3d 57 01 00 	ld.w	0[r29], r10
    5d16:	66 57 01 00 	st.w	r10, 0[r6]
    5d1a:	3d 57 05 00 	ld.w	4[r29], r10
    5d1e:	66 57 05 00 	st.w	r10, 4[r6]
    5d22:	3d 57 09 00 	ld.w	8[r29], r10
    5d26:	66 57 09 00 	st.w	r10, 8[r6]
    5d2a:	16 e8       	mov	r22, r29
    5d2c:	80 07 a8 01 	jr	5ed4 <__realloc_r+0x44c>
    5d30:	1d 38       	mov	r29, r7
    5d32:	bf ff f4 fc 	jarl	5a26 <_memmove>, lp
    5d36:	16 e8       	mov	r22, r29
    5d38:	80 07 9c 01 	jr	5ed4 <__realloc_r+0x44c>
    5d3c:	60 b2       	cmp	0, r22
    5d3e:	92 5d       	be	5df0 <__realloc_r+0x368>
    5d40:	0c c0       	mov	r12, r24
    5d42:	d9 c1       	add	r25, r24
    5d44:	f8 51       	cmp	r24, r10
    5d46:	df 55       	bgt	5df0 <__realloc_r+0x368>
    5d48:	36 57 0d 00 	ld.w	12[r22], r10
    5d4c:	36 5f 09 00 	ld.w	8[r22], r11
    5d50:	6b 57 0d 00 	st.w	r10, 12[r11]
    5d54:	6a 5f 09 00 	st.w	r11, 8[r10]
    5d58:	16 36 08 00 	addi	8, r22, r6
    5d5c:	19 46 fc ff 	addi	-4, r25, r8
    5d60:	20 56 24 00 	movea	36, r0, r10
    5d64:	ea 41       	cmp	r10, r8
    5d66:	8b 45       	bh	5de6 <__realloc_r+0x35e>
    5d68:	20 56 13 00 	movea	19, r0, r10
    5d6c:	ea 41       	cmp	r10, r8
    5d6e:	e3 2d       	bnh	5dca <__realloc_r+0x342>
    5d70:	3d 57 01 00 	ld.w	0[r29], r10
    5d74:	76 57 09 00 	st.w	r10, 8[r22]
    5d78:	3d 57 05 00 	ld.w	4[r29], r10
    5d7c:	76 57 0d 00 	st.w	r10, 12[r22]
    5d80:	20 56 1b 00 	movea	27, r0, r10
    5d84:	ea 41       	cmp	r10, r8
    5d86:	db 05       	bh	5d90 <__realloc_r+0x308>
    5d88:	16 36 10 00 	addi	16, r22, r6
    5d8c:	48 ea       	add	8, r29
    5d8e:	e5 1d       	br	5dca <__realloc_r+0x342>
    5d90:	3d 57 09 00 	ld.w	8[r29], r10
    5d94:	76 57 11 00 	st.w	r10, 16[r22]
    5d98:	3d 57 0d 00 	ld.w	12[r29], r10
    5d9c:	76 57 15 00 	st.w	r10, 20[r22]
    5da0:	20 56 23 00 	movea	35, r0, r10
    5da4:	ea 41       	cmp	r10, r8
    5da6:	eb 05       	bh	5db2 <__realloc_r+0x32a>
    5da8:	16 36 18 00 	addi	24, r22, r6
    5dac:	1d ee 10 00 	addi	16, r29, r29
    5db0:	d5 0d       	br	5dca <__realloc_r+0x342>
    5db2:	3d 57 11 00 	ld.w	16[r29], r10
    5db6:	76 57 19 00 	st.w	r10, 24[r22]
    5dba:	3d 57 15 00 	ld.w	20[r29], r10
    5dbe:	76 57 1d 00 	st.w	r10, 28[r22]
    5dc2:	16 36 20 00 	addi	32, r22, r6
    5dc6:	1d ee 18 00 	addi	24, r29, r29
    5dca:	3d 57 01 00 	ld.w	0[r29], r10
    5dce:	66 57 01 00 	st.w	r10, 0[r6]
    5dd2:	3d 57 05 00 	ld.w	4[r29], r10
    5dd6:	66 57 05 00 	st.w	r10, 4[r6]
    5dda:	3d 57 09 00 	ld.w	8[r29], r10
    5dde:	66 57 09 00 	st.w	r10, 8[r6]
    5de2:	16 e8       	mov	r22, r29
    5de4:	85 7d       	br	5ed4 <__realloc_r+0x44c>
    5de6:	1d 38       	mov	r29, r7
    5de8:	bf ff 3e fc 	jarl	5a26 <_memmove>, lp
    5dec:	16 e8       	mov	r22, r29
    5dee:	b5 75       	br	5ed4 <__realloc_r+0x44c>
    5df0:	1a 30       	mov	r26, r6
    5df2:	1b 38       	mov	r27, r7
    5df4:	bf ff 62 db 	jarl	3956 <__malloc_r>, lp
    5df8:	0a d8       	mov	r10, r27
    5dfa:	60 52       	cmp	0, r10
    5dfc:	ea 05       	bne	5e08 <__realloc_r+0x380>
    5dfe:	1a 30       	mov	r26, r6
    5e00:	bf ff 2c e2 	jarl	402c <___malloc_unlock>, lp
    5e04:	80 07 30 01 	jr	5f34 <__realloc_r+0x4ac>
    5e08:	0a 5e f8 ff 	addi	-8, r10, r11
    5e0c:	3d 57 fd ff 	ld.w	-4[r29], r10
    5e10:	1e 62       	mov	-2, r12
    5e12:	4c 51       	and	r12, r10
    5e14:	d7 51       	add	r23, r10
    5e16:	ea 59       	cmp	r10, r11
    5e18:	8a 0d       	bne	5e28 <__realloc_r+0x3a0>
    5e1a:	3b c7 fd ff 	ld.w	-4[r27], r24
    5e1e:	1c 7a       	mov	-4, r15
    5e20:	4f c1       	and	r15, r24
    5e22:	d9 c1       	add	r25, r24
    5e24:	17 e8       	mov	r23, r29
    5e26:	f5 55       	br	5ed4 <__realloc_r+0x44c>
    5e28:	19 46 fc ff 	addi	-4, r25, r8
    5e2c:	20 56 24 00 	movea	36, r0, r10
    5e30:	ea 41       	cmp	r10, r8
    5e32:	bb 45       	bh	5eb8 <__realloc_r+0x430>
    5e34:	20 56 13 00 	movea	19, r0, r10
    5e38:	ea 41       	cmp	r10, r8
    5e3a:	83 35       	bnh	5e9a <__realloc_r+0x412>
    5e3c:	3d 57 01 00 	ld.w	0[r29], r10
    5e40:	7b 57 01 00 	st.w	r10, 0[r27]
    5e44:	3d 57 05 00 	ld.w	4[r29], r10
    5e48:	7b 57 05 00 	st.w	r10, 4[r27]
    5e4c:	20 56 1b 00 	movea	27, r0, r10
    5e50:	ea 41       	cmp	r10, r8
    5e52:	eb 05       	bh	5e5e <__realloc_r+0x3d6>
    5e54:	1b 56 08 00 	addi	8, r27, r10
    5e58:	1d 5e 08 00 	addi	8, r29, r11
    5e5c:	95 25       	br	5e9e <__realloc_r+0x416>
    5e5e:	3d 57 09 00 	ld.w	8[r29], r10
    5e62:	7b 57 09 00 	st.w	r10, 8[r27]
    5e66:	3d 57 0d 00 	ld.w	12[r29], r10
    5e6a:	7b 57 0d 00 	st.w	r10, 12[r27]
    5e6e:	20 56 23 00 	movea	35, r0, r10
    5e72:	ea 41       	cmp	r10, r8
    5e74:	eb 05       	bh	5e80 <__realloc_r+0x3f8>
    5e76:	1b 56 10 00 	addi	16, r27, r10
    5e7a:	1d 5e 10 00 	addi	16, r29, r11
    5e7e:	85 15       	br	5e9e <__realloc_r+0x416>
    5e80:	3d 57 11 00 	ld.w	16[r29], r10
    5e84:	7b 57 11 00 	st.w	r10, 16[r27]
    5e88:	3d 57 15 00 	ld.w	20[r29], r10
    5e8c:	7b 57 15 00 	st.w	r10, 20[r27]
    5e90:	1b 56 18 00 	addi	24, r27, r10
    5e94:	1d 5e 18 00 	addi	24, r29, r11
    5e98:	b5 05       	br	5e9e <__realloc_r+0x416>
    5e9a:	1b 50       	mov	r27, r10
    5e9c:	1d 58       	mov	r29, r11
    5e9e:	2b 67 01 00 	ld.w	0[r11], r12
    5ea2:	6a 67 01 00 	st.w	r12, 0[r10]
    5ea6:	2b 67 05 00 	ld.w	4[r11], r12
    5eaa:	6a 67 05 00 	st.w	r12, 4[r10]
    5eae:	2b 5f 09 00 	ld.w	8[r11], r11
    5eb2:	6a 5f 09 00 	st.w	r11, 8[r10]
    5eb6:	d5 05       	br	5ec0 <__realloc_r+0x438>
    5eb8:	1b 30       	mov	r27, r6
    5eba:	1d 38       	mov	r29, r7
    5ebc:	bf ff 6a fb 	jarl	5a26 <_memmove>, lp
    5ec0:	1a 30       	mov	r26, r6
    5ec2:	1d 38       	mov	r29, r7
    5ec4:	bf ff a8 d7 	jarl	366c <__free_r>, lp
    5ec8:	1a 30       	mov	r26, r6
    5eca:	bf ff 62 e1 	jarl	402c <___malloc_unlock>, lp
    5ece:	b5 35       	br	5f34 <__realloc_r+0x4ac>
    5ed0:	19 c0       	mov	r25, r24
    5ed2:	17 e8       	mov	r23, r29
    5ed4:	18 50       	mov	r24, r10
    5ed6:	bc 51       	sub	r28, r10
    5ed8:	6f 52       	cmp	15, r10
    5eda:	a3 1d       	bnh	5f0e <__realloc_r+0x486>
    5edc:	1d 38       	mov	r29, r7
    5ede:	dc 39       	add	r28, r7
    5ee0:	3d 5f 05 00 	ld.w	4[r29], r11
    5ee4:	cb 5e 01 00 	andi	1, r11, r11
    5ee8:	0b e1       	or	r11, r28
    5eea:	7d e7 05 00 	st.w	r28, 4[r29]
    5eee:	8a 5e 01 00 	ori	1, r10, r11
    5ef2:	67 5f 05 00 	st.w	r11, 4[r7]
    5ef6:	c7 51       	add	r7, r10
    5ef8:	2a 5f 05 00 	ld.w	4[r10], r11
    5efc:	8b 5e 01 00 	ori	1, r11, r11
    5f00:	6a 5f 05 00 	st.w	r11, 4[r10]
    5f04:	1a 30       	mov	r26, r6
    5f06:	48 3a       	add	8, r7
    5f08:	bf ff 64 d7 	jarl	366c <__free_r>, lp
    5f0c:	f5 0d       	br	5f2a <__realloc_r+0x4a2>
    5f0e:	3d 57 05 00 	ld.w	4[r29], r10
    5f12:	ca 56 01 00 	andi	1, r10, r10
    5f16:	18 51       	or	r24, r10
    5f18:	7d 57 05 00 	st.w	r10, 4[r29]
    5f1c:	dd c1       	add	r29, r24
    5f1e:	38 57 05 00 	ld.w	4[r24], r10
    5f22:	8a 56 01 00 	ori	1, r10, r10
    5f26:	78 57 05 00 	st.w	r10, 4[r24]
    5f2a:	1a 30       	mov	r26, r6
    5f2c:	bf ff 00 e1 	jarl	402c <___malloc_unlock>, lp
    5f30:	1d de 08 00 	addi	8, r29, r27
    5f34:	1b 50       	mov	r27, r10
    5f36:	03 02       	callt	3
    5f38:	1c 72       	mov	-4, r14
    5f3a:	58 71       	and	r24, r14
    5f3c:	0e c0       	mov	r14, r24
    5f3e:	d9 c1       	add	r25, r24
    5f40:	ea c1       	cmp	r10, r24
    5f42:	fe 07 13 fc 	bge	5b54 <__realloc_r+0xcc>
    5f46:	bf 07 26 fc 	jr	5b6c <__realloc_r+0xe4>

00005f4a <__sbrk>:
    5f4a:	0e 02       	callt	14
    5f4c:	5c 1a       	add	-4, sp
    5f4e:	06 e8       	mov	r6, r29
    5f50:	00 52       	mov	0, r10
    5f52:	c3 51       	add	sp, r10
    5f54:	63 57 01 00 	st.w	r10, 0[sp]
    5f58:	2a 06 cc 08 	mov	0xfedf08cc, r10
    5f5c:	df fe 
    5f5e:	2a 57 01 00 	ld.w	0[r10], r10
    5f62:	60 52       	cmp	0, r10
    5f64:	9a 0d       	bne	5f76 <__sbrk+0x2c>
    5f66:	2b 06 d8 08 	mov	0xfedf08d8, r11
    5f6a:	df fe 
    5f6c:	2a 06 cc 08 	mov	0xfedf08cc, r10
    5f70:	df fe 
    5f72:	6a 5f 01 00 	st.w	r11, 0[r10]
    5f76:	2a 06 cc 08 	mov	0xfedf08cc, r10
    5f7a:	df fe 
    5f7c:	2a e7 01 00 	ld.w	0[r10], r28
    5f80:	1c 50       	mov	r28, r10
    5f82:	dd 51       	add	r29, r10
    5f84:	ea 19       	cmp	r10, sp
    5f86:	b9 0d       	bnl	5f9c <__sbrk+0x52>
    5f88:	01 32       	mov	1, r6
    5f8a:	27 06 6b 7b 	mov	0x7b6b, r7
    5f8e:	00 00 
    5f90:	20 46 19 00 	movea	25, r0, r8
    5f94:	80 ff 1e 00 	jarl	5fb2 <__write>, lp
    5f98:	80 ff 2e 00 	jarl	5fc6 <_abort>, lp
    5f9c:	2a 06 cc 08 	mov	0xfedf08cc, r10
    5fa0:	df fe 
    5fa2:	2a 5f 01 00 	ld.w	0[r10], r11
    5fa6:	cb e9       	add	r11, r29
    5fa8:	6a ef 01 00 	st.w	r29, 0[r10]
    5fac:	1c 50       	mov	r28, r10
    5fae:	44 1a       	add	4, sp
    5fb0:	0f 02       	callt	15

00005fb2 <__write>:
    5fb2:	12 02       	callt	18
    5fb4:	06 58       	mov	r6, r11
    5fb6:	07 50       	mov	r7, r10
    5fb8:	08 48       	mov	r8, r9
    5fba:	04 32       	mov	4, r6
    5fbc:	0b 38       	mov	r11, r7
    5fbe:	0a 40       	mov	r10, r8
    5fc0:	bf ff d4 f9 	jarl	5994 <___trap0>, lp
    5fc4:	13 02       	callt	19

00005fc6 <_abort>:
    5fc6:	12 02       	callt	18
    5fc8:	06 32       	mov	6, r6
    5fca:	80 ff 4c 01 	jarl	6116 <_raise>, lp
    5fce:	01 32       	mov	1, r6
    5fd0:	80 ff b6 01 	jarl	6186 <__exit>, lp

00005fd4 <__init_signal_r>:
    5fd4:	10 02       	callt	16
    5fd6:	06 e8       	mov	r6, r29
    5fd8:	26 57 dd 02 	ld.w	732[r6], r10
    5fdc:	60 52       	cmp	0, r10
    5fde:	ea 15       	bne	600a <__init_signal_r+0x36>
    5fe0:	20 3e 80 00 	movea	128, r0, r7
    5fe4:	bf ff 72 d9 	jarl	3956 <__malloc_r>, lp
    5fe8:	7d 57 dd 02 	st.w	r10, 732[r29]
    5fec:	60 52       	cmp	0, r10
    5fee:	82 15       	be	600e <__init_signal_r+0x3a>
    5ff0:	00 52       	mov	0, r10
    5ff2:	20 66 80 00 	movea	128, r0, r12
    5ff6:	3d 5f dd 02 	ld.w	732[r29], r11
    5ffa:	ca 59       	add	r10, r11
    5ffc:	6b 07 01 00 	st.w	r0, 0[r11]
    6000:	44 52       	add	4, r10
    6002:	ec 51       	cmp	r12, r10
    6004:	9a fd       	bne	5ff6 <__init_signal_r+0x22>
    6006:	00 52       	mov	0, r10
    6008:	c5 05       	br	6010 <__init_signal_r+0x3c>
    600a:	00 52       	mov	0, r10
    600c:	a5 05       	br	6010 <__init_signal_r+0x3c>
    600e:	1f 52       	mov	-1, r10
    6010:	11 02       	callt	17

00006012 <__signal_r>:
    6012:	0c 02       	callt	12
    6014:	06 e0       	mov	r6, r28
    6016:	07 e8       	mov	r7, r29
    6018:	08 d8       	mov	r8, r27
    601a:	20 56 1f 00 	movea	31, r0, r10
    601e:	ea 39       	cmp	r10, r7
    6020:	f3 05       	bnh	602e <__signal_r+0x1c>
    6022:	20 56 16 00 	movea	22, r0, r10
    6026:	66 57 01 00 	st.w	r10, 0[r6]
    602a:	1f 52       	mov	-1, r10
    602c:	b5 15       	br	6052 <__signal_r+0x40>
    602e:	26 57 dd 02 	ld.w	732[r6], r10
    6032:	60 52       	cmp	0, r10
    6034:	da 05       	bne	603e <__signal_r+0x2c>
    6036:	bf ff 9e ff 	jarl	5fd4 <__init_signal_r>, lp
    603a:	60 52       	cmp	0, r10
    603c:	aa 0d       	bne	6050 <__signal_r+0x3e>
    603e:	c2 ea       	shl	2, r29
    6040:	3c 57 dd 02 	ld.w	732[r28], r10
    6044:	ca e9       	add	r10, r29
    6046:	3d 57 01 00 	ld.w	0[r29], r10
    604a:	7d df 01 00 	st.w	r27, 0[r29]
    604e:	a5 05       	br	6052 <__signal_r+0x40>
    6050:	1f 52       	mov	-1, r10
    6052:	0d 02       	callt	13

00006054 <__raise_r>:
    6054:	0e 02       	callt	14
    6056:	06 e0       	mov	r6, r28
    6058:	07 e8       	mov	r7, r29
    605a:	20 56 1f 00 	movea	31, r0, r10
    605e:	ea 39       	cmp	r10, r7
    6060:	f3 05       	bnh	606e <__raise_r+0x1a>
    6062:	20 56 16 00 	movea	22, r0, r10
    6066:	66 57 01 00 	st.w	r10, 0[r6]
    606a:	1f 52       	mov	-1, r10
    606c:	f5 25       	br	60ba <__raise_r+0x66>
    606e:	26 57 dd 02 	ld.w	732[r6], r10
    6072:	60 52       	cmp	0, r10
    6074:	82 0d       	be	6084 <__raise_r+0x30>
    6076:	07 58       	mov	r7, r11
    6078:	c2 5a       	shl	2, r11
    607a:	ca 59       	add	r10, r11
    607c:	2b 57 01 00 	ld.w	0[r11], r10
    6080:	60 52       	cmp	0, r10
    6082:	aa 0d       	bne	6096 <__raise_r+0x42>
    6084:	1c 30       	mov	r28, r6
    6086:	80 ff f8 00 	jarl	617e <__getpid_r>, lp
    608a:	1c 30       	mov	r28, r6
    608c:	0a 38       	mov	r10, r7
    608e:	1d 40       	mov	r29, r8
    6090:	80 ff c0 00 	jarl	6150 <__kill_r>, lp
    6094:	b5 15       	br	60ba <__raise_r+0x66>
    6096:	61 52       	cmp	1, r10
    6098:	82 15       	be	60b8 <__raise_r+0x64>
    609a:	7f 52       	cmp	-1, r10
    609c:	fa 05       	bne	60aa <__raise_r+0x56>
    609e:	20 56 16 00 	movea	22, r0, r10
    60a2:	66 57 01 00 	st.w	r10, 0[r6]
    60a6:	01 52       	mov	1, r10
    60a8:	95 0d       	br	60ba <__raise_r+0x66>
    60aa:	6b 07 01 00 	st.w	r0, 0[r11]
    60ae:	07 30       	mov	r7, r6
    60b0:	ea c7 60 f9 	jarl	[r10], lp
    60b4:	00 52       	mov	0, r10
    60b6:	a5 05       	br	60ba <__raise_r+0x66>
    60b8:	00 52       	mov	0, r10
    60ba:	0f 02       	callt	15

000060bc <___sigtramp_r>:
    60bc:	0e 02       	callt	14
    60be:	06 e8       	mov	r6, r29
    60c0:	07 e0       	mov	r7, r28
    60c2:	20 56 1f 00 	movea	31, r0, r10
    60c6:	ea 39       	cmp	r10, r7
    60c8:	db 1d       	bh	6102 <___sigtramp_r+0x46>
    60ca:	26 57 dd 02 	ld.w	732[r6], r10
    60ce:	60 52       	cmp	0, r10
    60d0:	da 05       	bne	60da <___sigtramp_r+0x1e>
    60d2:	bf ff 02 ff 	jarl	5fd4 <__init_signal_r>, lp
    60d6:	60 52       	cmp	0, r10
    60d8:	fa 15       	bne	6106 <___sigtramp_r+0x4a>
    60da:	1c 50       	mov	r28, r10
    60dc:	c2 52       	shl	2, r10
    60de:	3d 5f dd 02 	ld.w	732[r29], r11
    60e2:	ca 59       	add	r10, r11
    60e4:	2b 57 01 00 	ld.w	0[r11], r10
    60e8:	60 52       	cmp	0, r10
    60ea:	82 15       	be	610a <___sigtramp_r+0x4e>
    60ec:	7f 52       	cmp	-1, r10
    60ee:	82 15       	be	610e <___sigtramp_r+0x52>
    60f0:	61 52       	cmp	1, r10
    60f2:	82 15       	be	6112 <___sigtramp_r+0x56>
    60f4:	6b 07 01 00 	st.w	r0, 0[r11]
    60f8:	1c 30       	mov	r28, r6
    60fa:	ea c7 60 f9 	jarl	[r10], lp
    60fe:	00 52       	mov	0, r10
    6100:	a5 0d       	br	6114 <___sigtramp_r+0x58>
    6102:	1f 52       	mov	-1, r10
    6104:	85 0d       	br	6114 <___sigtramp_r+0x58>
    6106:	1f 52       	mov	-1, r10
    6108:	e5 05       	br	6114 <___sigtramp_r+0x58>
    610a:	01 52       	mov	1, r10
    610c:	c5 05       	br	6114 <___sigtramp_r+0x58>
    610e:	02 52       	mov	2, r10
    6110:	a5 05       	br	6114 <___sigtramp_r+0x58>
    6112:	03 52       	mov	3, r10
    6114:	0f 02       	callt	15

00006116 <_raise>:
    6116:	12 02       	callt	18
    6118:	06 38       	mov	r6, r7
    611a:	24 37 01 80 	ld.w	-32768[gp], r6
    611e:	bf ff 36 ff 	jarl	6054 <__raise_r>, lp
    6122:	13 02       	callt	19

00006124 <_signal>:
    6124:	12 02       	callt	18
    6126:	06 50       	mov	r6, r10
    6128:	07 40       	mov	r7, r8
    612a:	24 37 01 80 	ld.w	-32768[gp], r6
    612e:	0a 38       	mov	r10, r7
    6130:	bf ff e2 fe 	jarl	6012 <__signal_r>, lp
    6134:	13 02       	callt	19

00006136 <__init_signal>:
    6136:	12 02       	callt	18
    6138:	24 37 01 80 	ld.w	-32768[gp], r6
    613c:	bf ff 98 fe 	jarl	5fd4 <__init_signal_r>, lp
    6140:	13 02       	callt	19

00006142 <___sigtramp>:
    6142:	12 02       	callt	18
    6144:	06 38       	mov	r6, r7
    6146:	24 37 01 80 	ld.w	-32768[gp], r6
    614a:	bf ff 72 ff 	jarl	60bc <___sigtramp_r>, lp
    614e:	13 02       	callt	19

00006150 <__kill_r>:
    6150:	10 02       	callt	16
    6152:	06 e8       	mov	r6, r29
    6154:	2a 06 d4 08 	mov	0xfedf08d4, r10
    6158:	df fe 
    615a:	6a 07 01 00 	st.w	r0, 0[r10]
    615e:	07 30       	mov	r7, r6
    6160:	08 38       	mov	r8, r7
    6162:	80 ff 6c 00 	jarl	61ce <__kill>, lp
    6166:	7f 52       	cmp	-1, r10
    6168:	aa 0d       	bne	617c <__kill_r+0x2c>
    616a:	2b 06 d4 08 	mov	0xfedf08d4, r11
    616e:	df fe 
    6170:	2b 5f 01 00 	ld.w	0[r11], r11
    6174:	60 5a       	cmp	0, r11
    6176:	b2 05       	be	617c <__kill_r+0x2c>
    6178:	7d 5f 01 00 	st.w	r11, 0[r29]
    617c:	11 02       	callt	17

0000617e <__getpid_r>:
    617e:	12 02       	callt	18
    6180:	80 ff 4a 00 	jarl	61ca <__getpid>, lp
    6184:	13 02       	callt	19

00006186 <__exit>:
    6186:	0c 02       	callt	12
    6188:	06 d8       	mov	r6, r27
    618a:	2a 06 7c 08 	mov	0xfedf087c, r10
    618e:	df fe 
    6190:	2a 5f 01 00 	ld.w	0[r10], r11
    6194:	2a 06 80 08 	mov	0xfedf0880, r10
    6198:	df fe 
    619a:	ea 59       	cmp	r10, r11
    619c:	89 15       	bnl	61bc <__exit+0x36>
    619e:	3d 06 7c 08 	mov	0xfedf087c, r29
    61a2:	df fe 
    61a4:	0a e0       	mov	r10, r28
    61a6:	2b 57 01 00 	ld.w	0[r11], r10
    61aa:	44 5a       	add	4, r11
    61ac:	7d 5f 01 00 	st.w	r11, 0[r29]
    61b0:	ea c7 60 f9 	jarl	[r10], lp
    61b4:	3d 5f 01 00 	ld.w	0[r29], r11
    61b8:	fc 59       	cmp	r28, r11
    61ba:	e1 f5       	bl	61a6 <__exit+0x20>
    61bc:	01 32       	mov	1, r6
    61be:	1b 38       	mov	r27, r7
    61c0:	00 42       	mov	0, r8
    61c2:	00 4a       	mov	0, r9
    61c4:	bf ff d0 f7 	jarl	5994 <___trap0>, lp
    61c8:	0d 02       	callt	13

000061ca <__getpid>:
    61ca:	01 52       	mov	1, r10
    61cc:	7f 00       	jmp	[lp]

000061ce <__kill>:
    61ce:	12 02       	callt	18
    61d0:	01 32       	mov	1, r6
    61d2:	40 56 ad de 	movhi	-8531, r0, r10
    61d6:	0a 39       	or	r10, r7
    61d8:	00 42       	mov	0, r8
    61da:	00 4a       	mov	0, r9
    61dc:	bf ff b8 f7 	jarl	5994 <___trap0>, lp
    61e0:	13 02       	callt	19

000061e2 <___udivdi3>:
    61e2:	07 58       	mov	r7, r11
    61e4:	60 4a       	cmp	0, r9
    61e6:	ca 65       	bne	62ae <___udivdi3+0xcc>
    61e8:	e7 41       	cmp	r7, r8
    61ea:	e3 07 17 01 	bnh	6300 <___udivdi3+0x11e>
    61ee:	2a 06 ff ff 	mov	0xffff, r10
    61f2:	00 00 
    61f4:	ea 41       	cmp	r10, r8
    61f6:	eb 07 d9 01 	bh	63ce <___udivdi3+0x1ec>
    61fa:	20 56 ff 00 	movea	255, r0, r10
    61fe:	ea 41       	cmp	r10, r8
    6200:	eb 07 89 03 	bh	6588 <___udivdi3+0x3a6>
    6204:	00 52       	mov	0, r10
    6206:	00 6a       	mov	0, r13
    6208:	08 60       	mov	r8, r12
    620a:	ea 67 80 00 	shr	r10, r12
    620e:	20 56 20 00 	movea	32, r0, r10
    6212:	2e 06 9c 7b 	mov	0x7b9c, r14
    6216:	00 00 
    6218:	ce 61       	add	r14, r12
    621a:	8c 67 01 00 	ld.bu	0[r12], r12
    621e:	cd 61       	add	r13, r12
    6220:	ac 51       	sub	r12, r10
    6222:	c2 0d       	be	623a <___udivdi3+0x58>
    6224:	06 78       	mov	r6, r15
    6226:	07 58       	mov	r7, r11
    6228:	ec 7f 80 00 	shr	r12, r15
    622c:	ea 5f c0 00 	shl	r10, r11
    6230:	ea 47 c0 00 	shl	r10, r8
    6234:	0f 59       	or	r15, r11
    6236:	ea 37 c0 00 	shl	r10, r6
    623a:	08 60       	mov	r8, r12
    623c:	0b 50       	mov	r11, r10
    623e:	90 62       	shr	16, r12
    6240:	c8 76 ff ff 	andi	65535, r8, r14
    6244:	ec 57 c2 82 	divu	r12, r10, r16
    6248:	06 78       	mov	r6, r15
    624a:	90 7a       	shr	16, r15
    624c:	ec 5f c2 6a 	divu	r12, r11, r13
    6250:	0a 68       	mov	r10, r13
    6252:	10 58       	mov	r16, r11
    6254:	ee 6f 20 02 	mul	r14, r13, r0
    6258:	d0 5a       	shl	16, r11
    625a:	0f 59       	or	r15, r11
    625c:	eb 69       	cmp	r11, r13
    625e:	a3 0d       	bnh	6272 <___udivdi3+0x90>
    6260:	c8 59       	add	r8, r11
    6262:	0a 7e ff ff 	addi	-1, r10, r15
    6266:	eb 41       	cmp	r11, r8
    6268:	cb 05       	bh	6270 <___udivdi3+0x8e>
    626a:	eb 69       	cmp	r11, r13
    626c:	eb 07 59 03 	bh	65c4 <___udivdi3+0x3e2>
    6270:	0f 50       	mov	r15, r10
    6272:	ad 59       	sub	r13, r11
    6274:	c6 36 ff ff 	andi	65535, r6, r6
    6278:	0b 78       	mov	r11, r15
    627a:	ec 7f c2 6a 	divu	r12, r15, r13
    627e:	ec 5f c2 62 	divu	r12, r11, r12
    6282:	ef 77 20 02 	mul	r15, r14, r0
    6286:	0d 58       	mov	r13, r11
    6288:	0f 60       	mov	r15, r12
    628a:	d0 5a       	shl	16, r11
    628c:	06 59       	or	r6, r11
    628e:	eb 71       	cmp	r11, r14
    6290:	b3 0d       	bnh	62a6 <___udivdi3+0xc4>
    6292:	c8 59       	add	r8, r11
    6294:	0f 6e ff ff 	addi	-1, r15, r13
    6298:	eb 41       	cmp	r11, r8
    629a:	eb 07 a7 02 	bh	6540 <___udivdi3+0x35e>
    629e:	eb 71       	cmp	r11, r14
    62a0:	e3 07 a1 02 	bnh	6540 <___udivdi3+0x35e>
    62a4:	5e 62       	add	-2, r12
    62a6:	d0 52       	shl	16, r10
    62a8:	00 5a       	mov	0, r11
    62aa:	0c 51       	or	r12, r10
    62ac:	7f 00       	jmp	[lp]
    62ae:	e7 49       	cmp	r7, r9
    62b0:	eb 07 09 01 	bh	63b8 <___udivdi3+0x1d6>
    62b4:	2a 06 ff ff 	mov	0xffff, r10
    62b8:	00 00 
    62ba:	ea 49       	cmp	r10, r9
    62bc:	e3 07 03 01 	bnh	63be <___udivdi3+0x1dc>
    62c0:	2a 06 ff ff 	mov	0xffffff, r10
    62c4:	ff 00 
    62c6:	ea 49       	cmp	r10, r9
    62c8:	eb 07 9b 02 	bh	6562 <___udivdi3+0x380>
    62cc:	20 56 10 00 	movea	16, r0, r10
    62d0:	0a 68       	mov	r10, r13
    62d2:	09 70       	mov	r9, r14
    62d4:	20 5e 20 00 	movea	32, r0, r11
    62d8:	ea 77 80 00 	shr	r10, r14
    62dc:	0e 50       	mov	r14, r10
    62de:	2f 06 9c 7b 	mov	0x7b9c, r15
    62e2:	00 00 
    62e4:	cf 51       	add	r15, r10
    62e6:	8a 67 01 00 	ld.bu	0[r10], r12
    62ea:	cd 61       	add	r13, r12
    62ec:	ac 59       	sub	r12, r11
    62ee:	ea 07 07 01 	bne	63f4 <___udivdi3+0x212>
    62f2:	e7 49       	cmp	r7, r9
    62f4:	b1 05       	bl	62fa <___udivdi3+0x118>
    62f6:	e6 41       	cmp	r6, r8
    62f8:	9b 65       	bh	63ba <___udivdi3+0x1d8>
    62fa:	00 5a       	mov	0, r11
    62fc:	01 52       	mov	1, r10
    62fe:	7f 00       	jmp	[lp]
    6300:	60 42       	cmp	0, r8
    6302:	ea 05       	bne	630e <___udivdi3+0x12c>
    6304:	01 52       	mov	1, r10
    6306:	0a 58       	mov	r10, r11
    6308:	e8 5f c2 52 	divu	r8, r11, r10
    630c:	0b 40       	mov	r11, r8
    630e:	2a 06 ff ff 	mov	0xffff, r10
    6312:	00 00 
    6314:	ea 41       	cmp	r10, r8
    6316:	f3 65       	bnh	63e4 <___udivdi3+0x202>
    6318:	2a 06 ff ff 	mov	0xffffff, r10
    631c:	ff 00 
    631e:	ea 41       	cmp	r10, r8
    6320:	eb 07 55 02 	bh	6574 <___udivdi3+0x392>
    6324:	20 56 10 00 	movea	16, r0, r10
    6328:	0a 60       	mov	r10, r12
    632a:	08 58       	mov	r8, r11
    632c:	ea 5f 80 00 	shr	r10, r11
    6330:	20 56 20 00 	movea	32, r0, r10
    6334:	2d 06 9c 7b 	mov	0x7b9c, r13
    6338:	00 00 
    633a:	cd 59       	add	r13, r11
    633c:	8b 5f 01 00 	ld.bu	0[r11], r11
    6340:	cc 59       	add	r12, r11
    6342:	ab 51       	sub	r11, r10
    6344:	ea 07 77 01 	bne	64ba <___udivdi3+0x2d8>
    6348:	08 60       	mov	r8, r12
    634a:	a8 39       	sub	r8, r7
    634c:	90 62       	shr	16, r12
    634e:	c8 76 ff ff 	andi	65535, r8, r14
    6352:	01 5a       	mov	1, r11
    6354:	07 50       	mov	r7, r10
    6356:	06 80       	mov	r6, r16
    6358:	ec 57 c2 6a 	divu	r12, r10, r13
    635c:	90 82       	shr	16, r16
    635e:	ec 3f c2 7a 	divu	r12, r7, r15
    6362:	d0 6a       	shl	16, r13
    6364:	10 69       	or	r16, r13
    6366:	0a 78       	mov	r10, r15
    6368:	ee 7f 20 02 	mul	r14, r15, r0
    636c:	ed 79       	cmp	r13, r15
    636e:	a3 0d       	bnh	6382 <___udivdi3+0x1a0>
    6370:	c8 69       	add	r8, r13
    6372:	0a 86 ff ff 	addi	-1, r10, r16
    6376:	ed 41       	cmp	r13, r8
    6378:	cb 05       	bh	6380 <___udivdi3+0x19e>
    637a:	ed 79       	cmp	r13, r15
    637c:	eb 07 41 02 	bh	65bc <___udivdi3+0x3da>
    6380:	10 50       	mov	r16, r10
    6382:	af 69       	sub	r15, r13
    6384:	c6 36 ff ff 	andi	65535, r6, r6
    6388:	0d 80       	mov	r13, r16
    638a:	ec 87 c2 7a 	divu	r12, r16, r15
    638e:	ec 6f c2 62 	divu	r12, r13, r12
    6392:	ed 77 20 02 	mul	r13, r14, r0
    6396:	d0 62       	shl	16, r12
    6398:	06 61       	or	r6, r12
    639a:	ec 71       	cmp	r12, r14
    639c:	b3 0d       	bnh	63b2 <___udivdi3+0x1d0>
    639e:	c8 61       	add	r8, r12
    63a0:	0d 7e ff ff 	addi	-1, r13, r15
    63a4:	ec 41       	cmp	r12, r8
    63a6:	eb 07 a1 01 	bh	6546 <___udivdi3+0x364>
    63aa:	ec 71       	cmp	r12, r14
    63ac:	e3 07 9b 01 	bnh	6546 <___udivdi3+0x364>
    63b0:	5e 6a       	add	-2, r13
    63b2:	d0 52       	shl	16, r10
    63b4:	0d 51       	or	r13, r10
    63b6:	7f 00       	jmp	[lp]
    63b8:	00 5a       	mov	0, r11
    63ba:	00 52       	mov	0, r10
    63bc:	7f 00       	jmp	[lp]
    63be:	20 56 ff 00 	movea	255, r0, r10
    63c2:	ea 49       	cmp	r10, r9
    63c4:	eb 07 a9 01 	bh	656c <___udivdi3+0x38a>
    63c8:	00 52       	mov	0, r10
    63ca:	00 6a       	mov	0, r13
    63cc:	b5 85       	br	62d2 <___udivdi3+0xf0>
    63ce:	2a 06 ff ff 	mov	0xffffff, r10
    63d2:	ff 00 
    63d4:	ea 41       	cmp	r10, r8
    63d6:	eb 07 a9 01 	bh	657e <___udivdi3+0x39c>
    63da:	20 56 10 00 	movea	16, r0, r10
    63de:	0a 68       	mov	r10, r13
    63e0:	bf 07 28 fe 	jr	6208 <___udivdi3+0x26>
    63e4:	20 56 ff 00 	movea	255, r0, r10
    63e8:	ea 41       	cmp	r10, r8
    63ea:	eb 07 a7 01 	bh	6590 <___udivdi3+0x3ae>
    63ee:	00 52       	mov	0, r10
    63f0:	00 62       	mov	0, r12
    63f2:	c5 9d       	br	632a <___udivdi3+0x148>
    63f4:	08 50       	mov	r8, r10
    63f6:	eb 4f c0 00 	shl	r11, r9
    63fa:	ec 57 80 00 	shr	r12, r10
    63fe:	07 70       	mov	r7, r14
    6400:	0a 49       	or	r10, r9
    6402:	ec 77 80 00 	shr	r12, r14
    6406:	09 68       	mov	r9, r13
    6408:	0e 50       	mov	r14, r10
    640a:	90 6a       	shr	16, r13
    640c:	06 78       	mov	r6, r15
    640e:	ed 57 c2 92 	divu	r13, r10, r18
    6412:	ec 7f 80 00 	shr	r12, r15
    6416:	eb 3f c0 00 	shl	r11, r7
    641a:	0f 39       	or	r15, r7
    641c:	c9 86 ff ff 	andi	65535, r9, r16
    6420:	07 88       	mov	r7, r17
    6422:	90 8a       	shr	16, r17
    6424:	eb 47 c0 00 	shl	r11, r8
    6428:	ed 77 c2 62 	divu	r13, r14, r12
    642c:	0a 78       	mov	r10, r15
    642e:	f0 7f 20 02 	mul	r16, r15, r0
    6432:	d0 62       	shl	16, r12
    6434:	11 61       	or	r17, r12
    6436:	ec 79       	cmp	r12, r15
    6438:	83 0d       	bnh	6448 <___udivdi3+0x266>
    643a:	c9 61       	add	r9, r12
    643c:	0a 76 ff ff 	addi	-1, r10, r14
    6440:	ec 49       	cmp	r12, r9
    6442:	e3 07 65 01 	bnh	65a6 <___udivdi3+0x3c4>
    6446:	0e 50       	mov	r14, r10
    6448:	af 61       	sub	r15, r12
    644a:	c7 3e ff ff 	andi	65535, r7, r7
    644e:	0c 70       	mov	r12, r14
    6450:	ed 77 c2 7a 	divu	r13, r14, r15
    6454:	ed 67 c2 6a 	divu	r13, r12, r13
    6458:	f0 77 20 02 	mul	r16, r14, r0
    645c:	d0 6a       	shl	16, r13
    645e:	07 69       	or	r7, r13
    6460:	ed 71       	cmp	r13, r14
    6462:	83 0d       	bnh	6472 <___udivdi3+0x290>
    6464:	c9 69       	add	r9, r13
    6466:	0c 7e ff ff 	addi	-1, r12, r15
    646a:	ed 49       	cmp	r13, r9
    646c:	e3 07 2d 01 	bnh	6598 <___udivdi3+0x3b6>
    6470:	0f 60       	mov	r15, r12
    6472:	d0 52       	shl	16, r10
    6474:	c8 7e ff ff 	andi	65535, r8, r15
    6478:	0c 51       	or	r12, r10
    647a:	90 42       	shr	16, r8
    647c:	ca 66 ff ff 	andi	65535, r10, r12
    6480:	0a 80       	mov	r10, r16
    6482:	0c 88       	mov	r12, r17
    6484:	90 82       	shr	16, r16
    6486:	ef 8f 20 02 	mul	r15, r17, r0
    648a:	ae 69       	sub	r14, r13
    648c:	e8 67 20 02 	mul	r8, r12, r0
    6490:	f0 7f 20 02 	mul	r16, r15, r0
    6494:	11 70       	mov	r17, r14
    6496:	f0 47 20 02 	mul	r16, r8, r0
    649a:	90 72       	shr	16, r14
    649c:	cf 61       	add	r15, r12
    649e:	ce 61       	add	r14, r12
    64a0:	ec 79       	cmp	r12, r15
    64a2:	c3 05       	bnh	64aa <___udivdi3+0x2c8>
    64a4:	40 76 01 00 	movhi	1, r0, r14
    64a8:	ce 41       	add	r14, r8
    64aa:	0c 70       	mov	r12, r14
    64ac:	90 72       	shr	16, r14
    64ae:	c8 71       	add	r8, r14
    64b0:	ee 69       	cmp	r14, r13
    64b2:	d1 55       	bl	655c <___udivdi3+0x37a>
    64b4:	c2 4d       	be	654c <___udivdi3+0x36a>
    64b6:	00 5a       	mov	0, r11
    64b8:	7f 00       	jmp	[lp]
    64ba:	ea 47 c0 00 	shl	r10, r8
    64be:	07 68       	mov	r7, r13
    64c0:	08 60       	mov	r8, r12
    64c2:	eb 6f 80 00 	shr	r11, r13
    64c6:	90 62       	shr	16, r12
    64c8:	06 78       	mov	r6, r15
    64ca:	eb 7f 80 00 	shr	r11, r15
    64ce:	ea 3f c0 00 	shl	r10, r7
    64d2:	0d 58       	mov	r13, r11
    64d4:	ea 37 c0 00 	shl	r10, r6
    64d8:	ec 6f c2 52 	divu	r12, r13, r10
    64dc:	c8 76 ff ff 	andi	65535, r8, r14
    64e0:	0f 39       	or	r15, r7
    64e2:	07 78       	mov	r7, r15
    64e4:	90 7a       	shr	16, r15
    64e6:	ec 5f c2 82 	divu	r12, r11, r16
    64ea:	ee 6f 20 02 	mul	r14, r13, r0
    64ee:	d0 52       	shl	16, r10
    64f0:	0f 51       	or	r15, r10
    64f2:	ea 69       	cmp	r10, r13
    64f4:	a3 0d       	bnh	6508 <___udivdi3+0x326>
    64f6:	c8 51       	add	r8, r10
    64f8:	0b 7e ff ff 	addi	-1, r11, r15
    64fc:	ea 41       	cmp	r10, r8
    64fe:	db 5d       	bh	65b8 <___udivdi3+0x3d6>
    6500:	ea 69       	cmp	r10, r13
    6502:	b3 5d       	bnh	65b8 <___udivdi3+0x3d6>
    6504:	5e 5a       	add	-2, r11
    6506:	c8 51       	add	r8, r10
    6508:	ad 51       	sub	r13, r10
    650a:	c7 7e ff ff 	andi	65535, r7, r15
    650e:	0a 68       	mov	r10, r13
    6510:	ec 6f c2 3a 	divu	r12, r13, r7
    6514:	ec 57 c2 82 	divu	r12, r10, r16
    6518:	ee 6f 20 02 	mul	r14, r13, r0
    651c:	d0 3a       	shl	16, r7
    651e:	0f 39       	or	r15, r7
    6520:	e7 69       	cmp	r7, r13
    6522:	a3 0d       	bnh	6536 <___udivdi3+0x354>
    6524:	c8 39       	add	r8, r7
    6526:	0a 7e ff ff 	addi	-1, r10, r15
    652a:	e7 41       	cmp	r7, r8
    652c:	cb 45       	bh	65b4 <___udivdi3+0x3d2>
    652e:	e7 69       	cmp	r7, r13
    6530:	a3 45       	bnh	65b4 <___udivdi3+0x3d2>
    6532:	5e 52       	add	-2, r10
    6534:	c8 39       	add	r8, r7
    6536:	d0 5a       	shl	16, r11
    6538:	ad 39       	sub	r13, r7
    653a:	0a 59       	or	r10, r11
    653c:	bf 07 18 fe 	jr	6354 <___udivdi3+0x172>
    6540:	0d 60       	mov	r13, r12
    6542:	bf 07 64 fd 	jr	62a6 <___udivdi3+0xc4>
    6546:	0f 68       	mov	r15, r13
    6548:	bf 07 6a fe 	jr	63b2 <___udivdi3+0x1d0>
    654c:	d0 62       	shl	16, r12
    654e:	d1 8e ff ff 	andi	65535, r17, r17
    6552:	eb 37 c0 00 	shl	r11, r6
    6556:	d1 61       	add	r17, r12
    6558:	ec 31       	cmp	r12, r6
    655a:	e9 ad       	bnl	64b6 <___udivdi3+0x2d4>
    655c:	5f 52       	add	-1, r10
    655e:	00 5a       	mov	0, r11
    6560:	c5 ad       	br	64b8 <___udivdi3+0x2d6>
    6562:	20 56 18 00 	movea	24, r0, r10
    6566:	0a 68       	mov	r10, r13
    6568:	bf 07 6a fd 	jr	62d2 <___udivdi3+0xf0>
    656c:	08 52       	mov	8, r10
    656e:	0a 68       	mov	r10, r13
    6570:	bf 07 62 fd 	jr	62d2 <___udivdi3+0xf0>
    6574:	20 56 18 00 	movea	24, r0, r10
    6578:	0a 60       	mov	r10, r12
    657a:	bf 07 b0 fd 	jr	632a <___udivdi3+0x148>
    657e:	20 56 18 00 	movea	24, r0, r10
    6582:	0a 68       	mov	r10, r13
    6584:	bf 07 84 fc 	jr	6208 <___udivdi3+0x26>
    6588:	08 52       	mov	8, r10
    658a:	0a 68       	mov	r10, r13
    658c:	bf 07 7c fc 	jr	6208 <___udivdi3+0x26>
    6590:	08 52       	mov	8, r10
    6592:	0a 60       	mov	r10, r12
    6594:	bf 07 96 fd 	jr	632a <___udivdi3+0x148>
    6598:	ed 71       	cmp	r13, r14
    659a:	f3 07 d7 fe 	bnh	6470 <___udivdi3+0x28e>
    659e:	5e 62       	add	-2, r12
    65a0:	c9 69       	add	r9, r13
    65a2:	bf 07 d0 fe 	jr	6472 <___udivdi3+0x290>
    65a6:	ec 79       	cmp	r12, r15
    65a8:	f3 07 9f fe 	bnh	6446 <___udivdi3+0x264>
    65ac:	5e 52       	add	-2, r10
    65ae:	c9 61       	add	r9, r12
    65b0:	bf 07 98 fe 	jr	6448 <___udivdi3+0x266>
    65b4:	0f 50       	mov	r15, r10
    65b6:	85 c5       	br	6536 <___udivdi3+0x354>
    65b8:	0f 58       	mov	r15, r11
    65ba:	f5 a5       	br	6508 <___udivdi3+0x326>
    65bc:	5e 52       	add	-2, r10
    65be:	c8 69       	add	r8, r13
    65c0:	bf 07 c2 fd 	jr	6382 <___udivdi3+0x1a0>
    65c4:	5e 52       	add	-2, r10
    65c6:	c8 59       	add	r8, r11
    65c8:	bf 07 aa fc 	jr	6272 <___udivdi3+0x90>

000065cc <___umoddi3>:
    65cc:	06 60       	mov	r6, r12
    65ce:	07 58       	mov	r7, r11
    65d0:	60 4a       	cmp	0, r9
    65d2:	8a 65       	bne	6692 <___umoddi3+0xc6>
    65d4:	e7 41       	cmp	r7, r8
    65d6:	e3 07 1b 01 	bnh	66f0 <___umoddi3+0x124>
    65da:	2a 06 ff ff 	mov	0xffff, r10
    65de:	00 00 
    65e0:	ea 41       	cmp	r10, r8
    65e2:	eb 07 db 01 	bh	67bc <___umoddi3+0x1f0>
    65e6:	20 56 ff 00 	movea	255, r0, r10
    65ea:	ea 41       	cmp	r10, r8
    65ec:	eb 07 9f 03 	bh	698a <___umoddi3+0x3be>
    65f0:	00 52       	mov	0, r10
    65f2:	00 6a       	mov	0, r13
    65f4:	08 70       	mov	r8, r14
    65f6:	20 7e 20 00 	movea	32, r0, r15
    65fa:	ea 77 80 00 	shr	r10, r14
    65fe:	0e 50       	mov	r14, r10
    6600:	31 06 9c 7b 	mov	0x7b9c, r17
    6604:	00 00 
    6606:	d1 51       	add	r17, r10
    6608:	8a 57 01 00 	ld.bu	0[r10], r10
    660c:	cd 51       	add	r13, r10
    660e:	aa 79       	sub	r10, r15
    6610:	e2 07 3d 03 	be	694c <___umoddi3+0x380>
    6614:	0c 58       	mov	r12, r11
    6616:	ef 47 c0 00 	shl	r15, r8
    661a:	ea 5f 80 00 	shr	r10, r11
    661e:	ef 67 c0 00 	shl	r15, r12
    6622:	0b 50       	mov	r11, r10
    6624:	07 58       	mov	r7, r11
    6626:	ef 5f c0 00 	shl	r15, r11
    662a:	0a 59       	or	r10, r11
    662c:	08 68       	mov	r8, r13
    662e:	0b 80       	mov	r11, r16
    6630:	90 6a       	shr	16, r13
    6632:	c8 8e ff ff 	andi	65535, r8, r17
    6636:	ed 87 c2 72 	divu	r13, r16, r14
    663a:	0c 50       	mov	r12, r10
    663c:	90 52       	shr	16, r10
    663e:	ed 5f c2 92 	divu	r13, r11, r18
    6642:	f1 87 20 02 	mul	r17, r16, r0
    6646:	d0 72       	shl	16, r14
    6648:	0a 71       	or	r10, r14
    664a:	ee 81       	cmp	r14, r16
    664c:	93 0d       	bnh	665e <___umoddi3+0x92>
    664e:	c8 71       	add	r8, r14
    6650:	ee 41       	cmp	r14, r8
    6652:	eb 05       	bh	665e <___umoddi3+0x92>
    6654:	0e 50       	mov	r14, r10
    6656:	c8 51       	add	r8, r10
    6658:	ee 81       	cmp	r14, r16
    665a:	ea 77 36 73 	cmov	h, r10, r14, r14
    665e:	b0 71       	sub	r16, r14
    6660:	cc 66 ff ff 	andi	65535, r12, r12
    6664:	0e 50       	mov	r14, r10
    6666:	ed 57 c2 5a 	divu	r13, r10, r11
    666a:	ed 77 c2 6a 	divu	r13, r14, r13
    666e:	f1 57 20 02 	mul	r17, r10, r0
    6672:	d0 6a       	shl	16, r13
    6674:	0c 69       	or	r12, r13
    6676:	ed 51       	cmp	r13, r10
    6678:	83 0d       	bnh	6688 <___umoddi3+0xbc>
    667a:	c8 69       	add	r8, r13
    667c:	ed 41       	cmp	r13, r8
    667e:	db 05       	bh	6688 <___umoddi3+0xbc>
    6680:	cd 41       	add	r13, r8
    6682:	ed 51       	cmp	r13, r10
    6684:	e8 6f 36 6b 	cmov	h, r8, r13, r13
    6688:	8d 51       	subr	r13, r10
    668a:	00 5a       	mov	0, r11
    668c:	ef 57 80 00 	shr	r15, r10
    6690:	7f 00       	jmp	[lp]
    6692:	e7 49       	cmp	r7, r9
    6694:	eb 07 11 01 	bh	67a4 <___umoddi3+0x1d8>
    6698:	2a 06 ff ff 	mov	0xffff, r10
    669c:	00 00 
    669e:	ea 49       	cmp	r10, r9
    66a0:	e3 07 0b 01 	bnh	67aa <___umoddi3+0x1de>
    66a4:	2a 06 ff ff 	mov	0xffffff, r10
    66a8:	ff 00 
    66aa:	ea 49       	cmp	r10, r9
    66ac:	eb 07 bb 02 	bh	6966 <___umoddi3+0x39a>
    66b0:	20 56 10 00 	movea	16, r0, r10
    66b4:	0a 78       	mov	r10, r15
    66b6:	09 68       	mov	r9, r13
    66b8:	ea 6f 80 00 	shr	r10, r13
    66bc:	0d 50       	mov	r13, r10
    66be:	20 6e 20 00 	movea	32, r0, r13
    66c2:	2e 06 9c 7b 	mov	0x7b9c, r14
    66c6:	00 00 
    66c8:	ce 51       	add	r14, r10
    66ca:	8a 77 01 00 	ld.bu	0[r10], r14
    66ce:	cf 71       	add	r15, r14
    66d0:	ae 69       	sub	r14, r13
    66d2:	ea 07 11 01 	bne	67e2 <___umoddi3+0x216>
    66d6:	0c 50       	mov	r12, r10
    66d8:	e7 49       	cmp	r7, r9
    66da:	b1 05       	bl	66e0 <___umoddi3+0x114>
    66dc:	ec 41       	cmp	r12, r8
    66de:	9b dd       	bh	6690 <___umoddi3+0xc4>
    66e0:	a8 51       	sub	r8, r10
    66e2:	07 58       	mov	r7, r11
    66e4:	a9 59       	sub	r9, r11
    66e6:	ea 61       	cmp	r10, r12
    66e8:	e1 67 00 00 	setf	c/l, r12
    66ec:	ac 59       	sub	r12, r11
    66ee:	7f 00       	jmp	[lp]
    66f0:	60 42       	cmp	0, r8
    66f2:	ea 05       	bne	66fe <___umoddi3+0x132>
    66f4:	01 52       	mov	1, r10
    66f6:	0a 68       	mov	r10, r13
    66f8:	e8 6f c2 52 	divu	r8, r13, r10
    66fc:	0d 40       	mov	r13, r8
    66fe:	2a 06 ff ff 	mov	0xffff, r10
    6702:	00 00 
    6704:	ea 41       	cmp	r10, r8
    6706:	e3 65       	bnh	67d2 <___umoddi3+0x206>
    6708:	2a 06 ff ff 	mov	0xffffff, r10
    670c:	ff 00 
    670e:	ea 41       	cmp	r10, r8
    6710:	eb 07 83 02 	bh	6992 <___umoddi3+0x3c6>
    6714:	20 56 10 00 	movea	16, r0, r10
    6718:	0a 58       	mov	r10, r11
    671a:	08 70       	mov	r8, r14
    671c:	20 7e 20 00 	movea	32, r0, r15
    6720:	ea 77 80 00 	shr	r10, r14
    6724:	0e 50       	mov	r14, r10
    6726:	31 06 9c 7b 	mov	0x7b9c, r17
    672a:	00 00 
    672c:	d1 51       	add	r17, r10
    672e:	8a 57 01 00 	ld.bu	0[r10], r10
    6732:	cb 51       	add	r11, r10
    6734:	aa 79       	sub	r10, r15
    6736:	ea 07 a1 01 	bne	68d6 <___umoddi3+0x30a>
    673a:	08 50       	mov	r8, r10
    673c:	a8 39       	sub	r8, r7
    673e:	90 52       	shr	16, r10
    6740:	c8 76 ff ff 	andi	65535, r8, r14
    6744:	07 58       	mov	r7, r11
    6746:	0c 80       	mov	r12, r16
    6748:	ea 5f c2 6a 	divu	r10, r11, r13
    674c:	90 82       	shr	16, r16
    674e:	ea 3f c2 8a 	divu	r10, r7, r17
    6752:	ee 5f 20 02 	mul	r14, r11, r0
    6756:	d0 6a       	shl	16, r13
    6758:	10 69       	or	r16, r13
    675a:	ed 59       	cmp	r13, r11
    675c:	93 0d       	bnh	676e <___umoddi3+0x1a2>
    675e:	c8 69       	add	r8, r13
    6760:	ed 41       	cmp	r13, r8
    6762:	eb 05       	bh	676e <___umoddi3+0x1a2>
    6764:	0d 80       	mov	r13, r16
    6766:	c8 81       	add	r8, r16
    6768:	ed 59       	cmp	r13, r11
    676a:	f0 6f 36 6b 	cmov	h, r16, r13, r13
    676e:	ab 69       	sub	r11, r13
    6770:	cc 66 ff ff 	andi	65535, r12, r12
    6774:	0d 30       	mov	r13, r6
    6776:	ea 37 c2 5a 	divu	r10, r6, r11
    677a:	ea 6f c2 52 	divu	r10, r13, r10
    677e:	e6 77 20 02 	mul	r6, r14, r0
    6782:	d0 5a       	shl	16, r11
    6784:	0c 59       	or	r12, r11
    6786:	eb 71       	cmp	r11, r14
    6788:	83 0d       	bnh	6798 <___umoddi3+0x1cc>
    678a:	c8 59       	add	r8, r11
    678c:	eb 41       	cmp	r11, r8
    678e:	db 05       	bh	6798 <___umoddi3+0x1cc>
    6790:	cb 41       	add	r11, r8
    6792:	eb 71       	cmp	r11, r14
    6794:	e8 5f 36 5b 	cmov	h, r8, r11, r11
    6798:	0b 50       	mov	r11, r10
    679a:	00 5a       	mov	0, r11
    679c:	ae 51       	sub	r14, r10
    679e:	ef 57 80 00 	shr	r15, r10
    67a2:	7f 00       	jmp	[lp]
    67a4:	06 50       	mov	r6, r10
    67a6:	07 58       	mov	r7, r11
    67a8:	7f 00       	jmp	[lp]
    67aa:	20 56 ff 00 	movea	255, r0, r10
    67ae:	ea 49       	cmp	r10, r9
    67b0:	eb 07 c1 01 	bh	6970 <___umoddi3+0x3a4>
    67b4:	00 52       	mov	0, r10
    67b6:	00 7a       	mov	0, r15
    67b8:	bf 07 fe fe 	jr	66b6 <___umoddi3+0xea>
    67bc:	2a 06 ff ff 	mov	0xffffff, r10
    67c0:	ff 00 
    67c2:	ea 41       	cmp	r10, r8
    67c4:	eb 07 bd 01 	bh	6980 <___umoddi3+0x3b4>
    67c8:	20 56 10 00 	movea	16, r0, r10
    67cc:	0a 68       	mov	r10, r13
    67ce:	bf 07 26 fe 	jr	65f4 <___umoddi3+0x28>
    67d2:	20 56 ff 00 	movea	255, r0, r10
    67d6:	ea 41       	cmp	r10, r8
    67d8:	eb 07 a1 01 	bh	6978 <___umoddi3+0x3ac>
    67dc:	00 52       	mov	0, r10
    67de:	00 5a       	mov	0, r11
    67e0:	d5 9d       	br	671a <___umoddi3+0x14e>
    67e2:	08 50       	mov	r8, r10
    67e4:	ed 4f c0 00 	shl	r13, r9
    67e8:	ee 57 80 00 	shr	r14, r10
    67ec:	07 90       	mov	r7, r18
    67ee:	0a 49       	or	r10, r9
    67f0:	ee 97 80 00 	shr	r14, r18
    67f4:	09 78       	mov	r9, r15
    67f6:	12 58       	mov	r18, r11
    67f8:	90 7a       	shr	16, r15
    67fa:	0c 50       	mov	r12, r10
    67fc:	ef 5f c2 8a 	divu	r15, r11, r17
    6800:	ee 57 80 00 	shr	r14, r10
    6804:	ed 3f c0 00 	shl	r13, r7
    6808:	0a 39       	or	r10, r7
    680a:	c9 9e ff ff 	andi	65535, r9, r19
    680e:	07 80       	mov	r7, r16
    6810:	90 82       	shr	16, r16
    6812:	ed 47 c0 00 	shl	r13, r8
    6816:	ed 67 c0 00 	shl	r13, r12
    681a:	ef 97 c2 52 	divu	r15, r18, r10
    681e:	d0 8a       	shl	16, r17
    6820:	10 89       	or	r16, r17
    6822:	0b 50       	mov	r11, r10
    6824:	f3 57 20 02 	mul	r19, r10, r0
    6828:	f1 51       	cmp	r17, r10
    682a:	83 0d       	bnh	683a <___umoddi3+0x26e>
    682c:	c9 89       	add	r9, r17
    682e:	0b 86 ff ff 	addi	-1, r11, r16
    6832:	f1 49       	cmp	r17, r9
    6834:	e3 07 77 01 	bnh	69aa <___umoddi3+0x3de>
    6838:	10 58       	mov	r16, r11
    683a:	aa 89       	sub	r10, r17
    683c:	c7 3e ff ff 	andi	65535, r7, r7
    6840:	11 50       	mov	r17, r10
    6842:	ef 57 c2 82 	divu	r15, r10, r16
    6846:	ef 8f c2 7a 	divu	r15, r17, r15
    684a:	d0 82       	shl	16, r16
    684c:	07 81       	or	r7, r16
    684e:	0a 78       	mov	r10, r15
    6850:	f3 8f 20 02 	mul	r19, r17, r0
    6854:	f0 89       	cmp	r16, r17
    6856:	f3 05       	bnh	6864 <___umoddi3+0x298>
    6858:	c9 81       	add	r9, r16
    685a:	5f 52       	add	-1, r10
    685c:	f0 49       	cmp	r16, r9
    685e:	e3 07 3f 01 	bnh	699c <___umoddi3+0x3d0>
    6862:	0a 78       	mov	r10, r15
    6864:	d0 5a       	shl	16, r11
    6866:	c8 9e ff ff 	andi	65535, r8, r19
    686a:	0f 59       	or	r15, r11
    686c:	08 90       	mov	r8, r18
    686e:	cb 7e ff ff 	andi	65535, r11, r15
    6872:	90 5a       	shr	16, r11
    6874:	0f 50       	mov	r15, r10
    6876:	90 92       	shr	16, r18
    6878:	f3 57 20 02 	mul	r19, r10, r0
    687c:	b1 81       	sub	r17, r16
    687e:	0b 88       	mov	r11, r17
    6880:	f2 7f 20 02 	mul	r18, r15, r0
    6884:	f3 8f 20 02 	mul	r19, r17, r0
    6888:	0a 98       	mov	r10, r19
    688a:	f2 5f 20 02 	mul	r18, r11, r0
    688e:	90 9a       	shr	16, r19
    6890:	d1 79       	add	r17, r15
    6892:	d3 79       	add	r19, r15
    6894:	ef 89       	cmp	r15, r17
    6896:	c3 05       	bnh	689e <___umoddi3+0x2d2>
    6898:	40 8e 01 00 	movhi	1, r0, r17
    689c:	d1 59       	add	r17, r11
    689e:	0f 88       	mov	r15, r17
    68a0:	ca 56 ff ff 	andi	65535, r10, r10
    68a4:	90 8a       	shr	16, r17
    68a6:	d0 7a       	shl	16, r15
    68a8:	cb 89       	add	r11, r17
    68aa:	ca 79       	add	r10, r15
    68ac:	f1 81       	cmp	r17, r16
    68ae:	a1 55       	bl	6952 <___umoddi3+0x386>
    68b0:	e2 07 15 01 	be	69c4 <___umoddi3+0x3f8>
    68b4:	10 58       	mov	r16, r11
    68b6:	0f 50       	mov	r15, r10
    68b8:	b1 59       	sub	r17, r11
    68ba:	8c 51       	subr	r12, r10
    68bc:	ea 61       	cmp	r10, r12
    68be:	e1 67 00 00 	setf	c/l, r12
    68c2:	ed 57 80 00 	shr	r13, r10
    68c6:	ac 59       	sub	r12, r11
    68c8:	0b 60       	mov	r11, r12
    68ca:	ed 5f 80 00 	shr	r13, r11
    68ce:	ee 67 c0 00 	shl	r14, r12
    68d2:	0c 51       	or	r12, r10
    68d4:	7f 00       	jmp	[lp]
    68d6:	07 58       	mov	r7, r11
    68d8:	ef 47 c0 00 	shl	r15, r8
    68dc:	0c 88       	mov	r12, r17
    68de:	ea 5f 80 00 	shr	r10, r11
    68e2:	ea 8f 80 00 	shr	r10, r17
    68e6:	08 50       	mov	r8, r10
    68e8:	90 52       	shr	16, r10
    68ea:	0b 80       	mov	r11, r16
    68ec:	ea 87 c2 6a 	divu	r10, r16, r13
    68f0:	ef 3f c0 00 	shl	r15, r7
    68f4:	c8 76 ff ff 	andi	65535, r8, r14
    68f8:	11 39       	or	r17, r7
    68fa:	07 88       	mov	r7, r17
    68fc:	90 8a       	shr	16, r17
    68fe:	ef 67 c0 00 	shl	r15, r12
    6902:	ea 5f c2 92 	divu	r10, r11, r18
    6906:	ee 87 20 02 	mul	r14, r16, r0
    690a:	d0 6a       	shl	16, r13
    690c:	11 69       	or	r17, r13
    690e:	ed 81       	cmp	r13, r16
    6910:	c3 05       	bnh	6918 <___umoddi3+0x34c>
    6912:	c8 69       	add	r8, r13
    6914:	ed 41       	cmp	r13, r8
    6916:	93 55       	bnh	69b8 <___umoddi3+0x3ec>
    6918:	8d 81       	subr	r13, r16
    691a:	c7 8e ff ff 	andi	65535, r7, r17
    691e:	10 38       	mov	r16, r7
    6920:	ea 87 c2 5a 	divu	r10, r16, r11
    6924:	ea 3f c2 6a 	divu	r10, r7, r13
    6928:	ee 87 20 02 	mul	r14, r16, r0
    692c:	d0 6a       	shl	16, r13
    692e:	11 69       	or	r17, r13
    6930:	ed 81       	cmp	r13, r16
    6932:	93 0d       	bnh	6944 <___umoddi3+0x378>
    6934:	c8 69       	add	r8, r13
    6936:	ed 41       	cmp	r13, r8
    6938:	eb 05       	bh	6944 <___umoddi3+0x378>
    693a:	0d 58       	mov	r13, r11
    693c:	c8 59       	add	r8, r11
    693e:	ed 81       	cmp	r13, r16
    6940:	eb 6f 36 6b 	cmov	h, r11, r13, r13
    6944:	0d 38       	mov	r13, r7
    6946:	b0 39       	sub	r16, r7
    6948:	bf 07 fc fd 	jr	6744 <___umoddi3+0x178>
    694c:	00 7a       	mov	0, r15
    694e:	bf 07 de fc 	jr	662c <___umoddi3+0x60>
    6952:	0f 50       	mov	r15, r10
    6954:	91 49       	subr	r17, r9
    6956:	a8 51       	sub	r8, r10
    6958:	ea 79       	cmp	r10, r15
    695a:	e1 5f 00 00 	setf	c/l, r11
    695e:	ab 49       	sub	r11, r9
    6960:	10 58       	mov	r16, r11
    6962:	a9 59       	sub	r9, r11
    6964:	b5 ad       	br	68ba <___umoddi3+0x2ee>
    6966:	20 56 18 00 	movea	24, r0, r10
    696a:	0a 78       	mov	r10, r15
    696c:	bf 07 4a fd 	jr	66b6 <___umoddi3+0xea>
    6970:	08 52       	mov	8, r10
    6972:	0a 78       	mov	r10, r15
    6974:	bf 07 42 fd 	jr	66b6 <___umoddi3+0xea>
    6978:	08 52       	mov	8, r10
    697a:	0a 58       	mov	r10, r11
    697c:	bf 07 9e fd 	jr	671a <___umoddi3+0x14e>
    6980:	20 56 18 00 	movea	24, r0, r10
    6984:	0a 68       	mov	r10, r13
    6986:	bf 07 6e fc 	jr	65f4 <___umoddi3+0x28>
    698a:	08 52       	mov	8, r10
    698c:	0a 68       	mov	r10, r13
    698e:	bf 07 66 fc 	jr	65f4 <___umoddi3+0x28>
    6992:	20 56 18 00 	movea	24, r0, r10
    6996:	0a 58       	mov	r10, r11
    6998:	bf 07 82 fd 	jr	671a <___umoddi3+0x14e>
    699c:	f0 89       	cmp	r16, r17
    699e:	f3 07 c5 fe 	bnh	6862 <___umoddi3+0x296>
    69a2:	5e 7a       	add	-2, r15
    69a4:	c9 81       	add	r9, r16
    69a6:	bf 07 be fe 	jr	6864 <___umoddi3+0x298>
    69aa:	f1 51       	cmp	r17, r10
    69ac:	f3 07 8d fe 	bnh	6838 <___umoddi3+0x26c>
    69b0:	5e 5a       	add	-2, r11
    69b2:	c9 89       	add	r9, r17
    69b4:	bf 07 86 fe 	jr	683a <___umoddi3+0x26e>
    69b8:	0d 58       	mov	r13, r11
    69ba:	c8 59       	add	r8, r11
    69bc:	ed 81       	cmp	r13, r16
    69be:	eb 6f 36 6b 	cmov	h, r11, r13, r13
    69c2:	b5 ad       	br	6918 <___umoddi3+0x34c>
    69c4:	ef 61       	cmp	r15, r12
    69c6:	e1 c5       	bl	6952 <___umoddi3+0x386>
    69c8:	0f 50       	mov	r15, r10
    69ca:	00 5a       	mov	0, r11
    69cc:	bf 07 ee fe 	jr	68ba <___umoddi3+0x2ee>

000069d0 <__fpadd_parts>:
    69d0:	10 02       	callt	16
    69d2:	06 50       	mov	r6, r10
    69d4:	26 5f 01 00 	ld.w	0[r6], r11
    69d8:	61 5a       	cmp	1, r11
    69da:	e3 07 77 01 	bnh	6b50 <__fpadd_parts+0x180>
    69de:	27 67 01 00 	ld.w	0[r7], r12
    69e2:	61 62       	cmp	1, r12
    69e4:	e3 07 35 02 	bnh	6c18 <__fpadd_parts+0x248>
    69e8:	64 5a       	cmp	4, r11
    69ea:	e2 07 9b 02 	be	6c84 <__fpadd_parts+0x2b4>
    69ee:	64 62       	cmp	4, r12
    69f0:	e2 07 29 02 	be	6c18 <__fpadd_parts+0x248>
    69f4:	62 62       	cmp	2, r12
    69f6:	e2 07 a9 01 	be	6b9e <__fpadd_parts+0x1ce>
    69fa:	62 5a       	cmp	2, r11
    69fc:	e2 07 1d 02 	be	6c18 <__fpadd_parts+0x248>
    6a00:	26 7f 09 00 	ld.w	8[r6], r15
    6a04:	20 9e 3f 00 	movea	63, r0, r19
    6a08:	27 8f 09 00 	ld.w	8[r7], r17
    6a0c:	26 87 0d 00 	ld.w	12[r6], r16
    6a10:	0f 68       	mov	r15, r13
    6a12:	26 97 11 00 	ld.w	16[r6], r18
    6a16:	b1 69       	sub	r17, r13
    6a18:	27 67 0d 00 	ld.w	12[r7], r12
    6a1c:	0d 70       	mov	r13, r14
    6a1e:	27 5f 11 00 	ld.w	16[r7], r11
    6a22:	80 71       	subr	r0, r14
    6a24:	60 6a       	cmp	0, r13
    6a26:	ee 6f 2c 73 	cmov	lt, r14, r13, r14
    6a2a:	f3 71       	cmp	r19, r14
    6a2c:	ef 07 27 01 	bgt	6b52 <__fpadd_parts+0x182>
    6a30:	60 6a       	cmp	0, r13
    6a32:	e7 07 eb 01 	ble	6c1c <__fpadd_parts+0x24c>
    6a36:	01 6a       	mov	1, r13
    6a38:	ce 9e 20 00 	andi	32, r14, r19
    6a3c:	ee 6f c0 00 	shl	r14, r13
    6a40:	0b 30       	mov	r11, r6
    6a42:	60 9a       	cmp	0, r19
    6a44:	e0 6f 04 8b 	cmov	z, 0, r13, r17
    6a48:	60 9a       	cmp	0, r19
    6a4a:	e0 6f 14 6b 	cmov	nz, 0, r13, r13
    6a4e:	0d 4e ff ff 	addi	-1, r13, r9
    6a52:	c1 32       	shl	1, r6
    6a54:	ed 49       	cmp	r13, r9
    6a56:	e9 ef 00 00 	setf	nc/nl, r29
    6a5a:	0c 68       	mov	r12, r13
    6a5c:	2e f8       	not	r14, lp
    6a5e:	bd 89       	sub	r29, r17
    6a60:	4b 89       	and	r11, r17
    6a62:	ee 6f 80 00 	shr	r14, r13
    6a66:	49 61       	and	r9, r12
    6a68:	ff 37 c0 00 	shl	lp, r6
    6a6c:	ee 5f 80 00 	shr	r14, r11
    6a70:	06 69       	or	r6, r13
    6a72:	11 61       	or	r17, r12
    6a74:	60 9a       	cmp	0, r19
    6a76:	ed 5f 24 6b 	cmov	z, r13, r11, r13
    6a7a:	60 62       	cmp	0, r12
    6a7c:	ea 67 00 00 	setf	nz, r12
    6a80:	60 9a       	cmp	0, r19
    6a82:	eb 07 24 5b 	cmov	z, r11, r0, r11
    6a86:	0d 61       	or	r13, r12
    6a88:	2a 6f 05 00 	ld.w	4[r10], r13
    6a8c:	27 57 05 00 	ld.w	4[r7], r10
    6a90:	ea 69       	cmp	r10, r13
    6a92:	a2 6d       	be	6b66 <__fpadd_parts+0x196>
    6a94:	60 6a       	cmp	0, r13
    6a96:	e2 07 43 01 	be	6bd8 <__fpadd_parts+0x208>
    6a9a:	0c 50       	mov	r12, r10
    6a9c:	b2 59       	sub	r18, r11
    6a9e:	b0 51       	sub	r16, r10
    6aa0:	ec 51       	cmp	r12, r10
    6aa2:	eb 67 00 00 	setf	h, r12
    6aa6:	ac 59       	sub	r12, r11
    6aa8:	60 5a       	cmp	0, r11
    6aaa:	e6 07 43 01 	blt	6bec <__fpadd_parts+0x21c>
    6aae:	68 07 05 00 	st.w	r0, 4[r8]
    6ab2:	68 7f 09 00 	st.w	r15, 8[r8]
    6ab6:	68 57 0d 00 	st.w	r10, 12[r8]
    6aba:	68 5f 11 00 	st.w	r11, 16[r8]
    6abe:	0a 76 ff ff 	addi	-1, r10, r14
    6ac2:	ea 71       	cmp	r10, r14
    6ac4:	e9 6f 00 00 	setf	nc/nl, r13
    6ac8:	8b 69       	subr	r11, r13
    6aca:	2c 06 ff ff 	mov	0xfffffff, r12
    6ace:	ff 0f 
    6ad0:	ec 69       	cmp	r12, r13
    6ad2:	bb 25       	bh	6b18 <__fpadd_parts+0x148>
    6ad4:	e2 07 a7 01 	be	6c7a <__fpadd_parts+0x2aa>
    6ad8:	28 7f 09 00 	ld.w	8[r8], r15
    6adc:	31 06 ff ff 	mov	0xfffffff, r17
    6ae0:	ff 0f 
    6ae2:	b5 05       	br	6ae8 <__fpadd_parts+0x118>
    6ae4:	f1 71       	cmp	r17, r14
    6ae6:	92 5d       	be	6b98 <__fpadd_parts+0x1c8>
    6ae8:	0a 68       	mov	r10, r13
    6aea:	cb 59       	add	r11, r11
    6aec:	ca 69       	add	r10, r13
    6aee:	5f 7a       	add	-1, r15
    6af0:	ea 69       	cmp	r10, r13
    6af2:	e1 67 00 00 	setf	c/l, r12
    6af6:	0d 86 ff ff 	addi	-1, r13, r16
    6afa:	cb 61       	add	r11, r12
    6afc:	ed 81       	cmp	r13, r16
    6afe:	e9 77 00 00 	setf	nc/nl, r14
    6b02:	0d 50       	mov	r13, r10
    6b04:	8c 71       	subr	r12, r14
    6b06:	0c 58       	mov	r12, r11
    6b08:	f1 71       	cmp	r17, r14
    6b0a:	d3 ed       	bnh	6ae4 <__fpadd_parts+0x114>
    6b0c:	68 6f 0d 00 	st.w	r13, 12[r8]
    6b10:	68 67 11 00 	st.w	r12, 16[r8]
    6b14:	68 7f 09 00 	st.w	r15, 8[r8]
    6b18:	03 62       	mov	3, r12
    6b1a:	68 67 01 00 	st.w	r12, 0[r8]
    6b1e:	2c 06 ff ff 	mov	0x1fffffff, r12
    6b22:	ff 1f 
    6b24:	ec 59       	cmp	r12, r11
    6b26:	f3 35       	bnh	6b94 <__fpadd_parts+0x1c4>
    6b28:	28 6f 09 00 	ld.w	8[r8], r13
    6b2c:	0b 70       	mov	r11, r14
    6b2e:	0a 60       	mov	r10, r12
    6b30:	df 72       	shl	31, r14
    6b32:	81 62       	shr	1, r12
    6b34:	ca 56 01 00 	andi	1, r10, r10
    6b38:	0e 61       	or	r14, r12
    6b3a:	81 5a       	shr	1, r11
    6b3c:	0c 51       	or	r12, r10
    6b3e:	0d 66 01 00 	addi	1, r13, r12
    6b42:	68 57 0d 00 	st.w	r10, 12[r8]
    6b46:	08 50       	mov	r8, r10
    6b48:	68 5f 11 00 	st.w	r11, 16[r8]
    6b4c:	68 67 09 00 	st.w	r12, 8[r8]
    6b50:	11 02       	callt	17
    6b52:	f1 79       	cmp	r17, r15
    6b54:	d7 5d       	ble	6c0e <__fpadd_parts+0x23e>
    6b56:	2a 6f 05 00 	ld.w	4[r10], r13
    6b5a:	00 62       	mov	0, r12
    6b5c:	27 57 05 00 	ld.w	4[r7], r10
    6b60:	00 5a       	mov	0, r11
    6b62:	ea 69       	cmp	r10, r13
    6b64:	8a 9d       	bne	6a94 <__fpadd_parts+0xc4>
    6b66:	0c 50       	mov	r12, r10
    6b68:	cb 91       	add	r11, r18
    6b6a:	d0 51       	add	r16, r10
    6b6c:	68 6f 05 00 	st.w	r13, 4[r8]
    6b70:	ec 51       	cmp	r12, r10
    6b72:	e1 5f 00 00 	setf	c/l, r11
    6b76:	03 62       	mov	3, r12
    6b78:	d2 59       	add	r18, r11
    6b7a:	68 67 01 00 	st.w	r12, 0[r8]
    6b7e:	68 7f 09 00 	st.w	r15, 8[r8]
    6b82:	68 57 0d 00 	st.w	r10, 12[r8]
    6b86:	68 5f 11 00 	st.w	r11, 16[r8]
    6b8a:	2c 06 ff ff 	mov	0x1fffffff, r12
    6b8e:	ff 1f 
    6b90:	ec 59       	cmp	r12, r11
    6b92:	bb cd       	bh	6b28 <__fpadd_parts+0x158>
    6b94:	08 50       	mov	r8, r10
    6b96:	11 02       	callt	17
    6b98:	7e 82       	cmp	-2, r16
    6b9a:	f3 a5       	bnh	6ae8 <__fpadd_parts+0x118>
    6b9c:	85 bd       	br	6b0c <__fpadd_parts+0x13c>
    6b9e:	62 5a       	cmp	2, r11
    6ba0:	8a dd       	bne	6b50 <__fpadd_parts+0x180>
    6ba2:	68 5f 01 00 	st.w	r11, 0[r8]
    6ba6:	08 50       	mov	r8, r10
    6ba8:	26 5f 05 00 	ld.w	4[r6], r11
    6bac:	68 5f 05 00 	st.w	r11, 4[r8]
    6bb0:	26 67 09 00 	ld.w	8[r6], r12
    6bb4:	26 6f 05 00 	ld.w	4[r6], r13
    6bb8:	27 5f 05 00 	ld.w	4[r7], r11
    6bbc:	68 67 09 00 	st.w	r12, 8[r8]
    6bc0:	26 67 0d 00 	ld.w	12[r6], r12
    6bc4:	4d 59       	and	r13, r11
    6bc6:	68 67 0d 00 	st.w	r12, 12[r8]
    6bca:	26 67 11 00 	ld.w	16[r6], r12
    6bce:	68 5f 05 00 	st.w	r11, 4[r8]
    6bd2:	68 67 11 00 	st.w	r12, 16[r8]
    6bd6:	d5 bd       	br	6b50 <__fpadd_parts+0x180>
    6bd8:	10 50       	mov	r16, r10
    6bda:	92 59       	subr	r18, r11
    6bdc:	ac 51       	sub	r12, r10
    6bde:	f0 51       	cmp	r16, r10
    6be0:	eb 67 00 00 	setf	h, r12
    6be4:	ac 59       	sub	r12, r11
    6be6:	60 5a       	cmp	0, r11
    6be8:	fe 07 c7 fe 	bge	6aae <__fpadd_parts+0xde>
    6bec:	80 51       	subr	r0, r10
    6bee:	80 59       	subr	r0, r11
    6bf0:	60 52       	cmp	0, r10
    6bf2:	eb 67 00 00 	setf	h, r12
    6bf6:	68 7f 09 00 	st.w	r15, 8[r8]
    6bfa:	ac 59       	sub	r12, r11
    6bfc:	01 62       	mov	1, r12
    6bfe:	68 67 05 00 	st.w	r12, 4[r8]
    6c02:	68 57 0d 00 	st.w	r10, 12[r8]
    6c06:	68 5f 11 00 	st.w	r11, 16[r8]
    6c0a:	bf 07 b4 fe 	jr	6abe <__fpadd_parts+0xee>
    6c0e:	11 78       	mov	r17, r15
    6c10:	00 82       	mov	0, r16
    6c12:	00 92       	mov	0, r18
    6c14:	bf 07 74 fe 	jr	6a88 <__fpadd_parts+0xb8>
    6c18:	07 50       	mov	r7, r10
    6c1a:	11 02       	callt	17
    6c1c:	60 6a       	cmp	0, r13
    6c1e:	f2 07 6b fe 	be	6a88 <__fpadd_parts+0xb8>
    6c22:	01 6a       	mov	1, r13
    6c24:	ce 9e 20 00 	andi	32, r14, r19
    6c28:	ee 6f c0 00 	shl	r14, r13
    6c2c:	12 30       	mov	r18, r6
    6c2e:	60 9a       	cmp	0, r19
    6c30:	e0 6f 04 8b 	cmov	z, 0, r13, r17
    6c34:	60 9a       	cmp	0, r19
    6c36:	e0 6f 14 6b 	cmov	nz, 0, r13, r13
    6c3a:	0d 4e ff ff 	addi	-1, r13, r9
    6c3e:	c1 32       	shl	1, r6
    6c40:	ed 49       	cmp	r13, r9
    6c42:	e9 ef 00 00 	setf	nc/nl, r29
    6c46:	10 68       	mov	r16, r13
    6c48:	2e f8       	not	r14, lp
    6c4a:	bd 89       	sub	r29, r17
    6c4c:	52 89       	and	r18, r17
    6c4e:	ee 6f 80 00 	shr	r14, r13
    6c52:	49 81       	and	r9, r16
    6c54:	ff 37 c0 00 	shl	lp, r6
    6c58:	ee 97 80 00 	shr	r14, r18
    6c5c:	06 69       	or	r6, r13
    6c5e:	11 81       	or	r17, r16
    6c60:	60 9a       	cmp	0, r19
    6c62:	ed 97 24 6b 	cmov	z, r13, r18, r13
    6c66:	60 82       	cmp	0, r16
    6c68:	ea 87 00 00 	setf	nz, r16
    6c6c:	ce 79       	add	r14, r15
    6c6e:	0d 81       	or	r13, r16
    6c70:	60 9a       	cmp	0, r19
    6c72:	f2 07 24 93 	cmov	z, r18, r0, r18
    6c76:	bf 07 12 fe 	jr	6a88 <__fpadd_parts+0xb8>
    6c7a:	7e 72       	cmp	-2, r14
    6c7c:	f3 07 5d fe 	bnh	6ad8 <__fpadd_parts+0x108>
    6c80:	bf 07 98 fe 	jr	6b18 <__fpadd_parts+0x148>
    6c84:	64 62       	cmp	4, r12
    6c86:	fa 07 cb fe 	bne	6b50 <__fpadd_parts+0x180>
    6c8a:	26 6f 05 00 	ld.w	4[r6], r13
    6c8e:	27 67 05 00 	ld.w	4[r7], r12
    6c92:	2b 06 88 7b 	mov	0x7b88, r11
    6c96:	00 00 
    6c98:	ec 69       	cmp	r12, r13
    6c9a:	e6 5f 24 53 	cmov	z, r6, r11, r10
    6c9e:	bf 07 b2 fe 	jr	6b50 <__fpadd_parts+0x180>

00006ca2 <___adddf3>:
    6ca2:	10 02       	callt	16
    6ca4:	3d 06 82 76 	mov	0x7682, r29
    6ca8:	00 00 
    6caa:	03 1e b4 ff 	addi	-76, sp, sp
    6cae:	63 4f 49 00 	st.w	r9, 72[sp]
    6cb2:	63 47 45 00 	st.w	r8, 68[sp]
    6cb6:	63 37 3d 00 	st.w	r6, 60[sp]
    6cba:	03 36 3c 00 	addi	60, sp, r6
    6cbe:	63 3f 41 00 	st.w	r7, 64[sp]
    6cc2:	03 38       	mov	sp, r7
    6cc4:	fd c7 60 f9 	jarl	[r29], lp
    6cc8:	20 3e 14 00 	movea	20, r0, r7
    6ccc:	03 36 44 00 	addi	68, sp, r6
    6cd0:	c3 39       	add	sp, r7
    6cd2:	fd c7 60 f9 	jarl	[r29], lp
    6cd6:	20 3e 14 00 	movea	20, r0, r7
    6cda:	03 30       	mov	sp, r6
    6cdc:	c3 39       	add	sp, r7
    6cde:	03 46 28 00 	addi	40, sp, r8
    6ce2:	bf ff ee fc 	jarl	69d0 <__fpadd_parts>, lp
    6ce6:	0a 30       	mov	r10, r6
    6ce8:	80 ff 3e 08 	jarl	7526 <___pack_d>, lp
    6cec:	03 1e 4c 00 	addi	76, sp, sp
    6cf0:	11 02       	callt	17

00006cf2 <___subdf3>:
    6cf2:	10 02       	callt	16
    6cf4:	3d 06 82 76 	mov	0x7682, r29
    6cf8:	00 00 
    6cfa:	03 1e b4 ff 	addi	-76, sp, sp
    6cfe:	63 4f 49 00 	st.w	r9, 72[sp]
    6d02:	63 47 45 00 	st.w	r8, 68[sp]
    6d06:	63 37 3d 00 	st.w	r6, 60[sp]
    6d0a:	03 36 3c 00 	addi	60, sp, r6
    6d0e:	63 3f 41 00 	st.w	r7, 64[sp]
    6d12:	03 38       	mov	sp, r7
    6d14:	fd c7 60 f9 	jarl	[r29], lp
    6d18:	20 3e 14 00 	movea	20, r0, r7
    6d1c:	03 36 44 00 	addi	68, sp, r6
    6d20:	c3 39       	add	sp, r7
    6d22:	fd c7 60 f9 	jarl	[r29], lp
    6d26:	23 57 19 00 	ld.w	24[sp], r10
    6d2a:	20 3e 14 00 	movea	20, r0, r7
    6d2e:	03 30       	mov	sp, r6
    6d30:	c3 39       	add	sp, r7
    6d32:	03 46 28 00 	addi	40, sp, r8
    6d36:	aa 56 01 00 	xori	1, r10, r10
    6d3a:	63 57 19 00 	st.w	r10, 24[sp]
    6d3e:	bf ff 92 fc 	jarl	69d0 <__fpadd_parts>, lp
    6d42:	0a 30       	mov	r10, r6
    6d44:	80 ff e2 07 	jarl	7526 <___pack_d>, lp
    6d48:	03 1e 4c 00 	addi	76, sp, sp
    6d4c:	11 02       	callt	17

00006d4e <___muldf3>:
    6d4e:	04 02       	callt	4
    6d50:	3d 06 82 76 	mov	0x7682, r29
    6d54:	00 00 
    6d56:	03 1e b4 ff 	addi	-76, sp, sp
    6d5a:	63 37 3d 00 	st.w	r6, 60[sp]
    6d5e:	03 36 3c 00 	addi	60, sp, r6
    6d62:	63 3f 41 00 	st.w	r7, 64[sp]
    6d66:	03 38       	mov	sp, r7
    6d68:	63 47 45 00 	st.w	r8, 68[sp]
    6d6c:	63 4f 49 00 	st.w	r9, 72[sp]
    6d70:	fd c7 60 f9 	jarl	[r29], lp
    6d74:	20 3e 14 00 	movea	20, r0, r7
    6d78:	03 36 44 00 	addi	68, sp, r6
    6d7c:	c3 39       	add	sp, r7
    6d7e:	fd c7 60 f9 	jarl	[r29], lp
    6d82:	23 57 01 00 	ld.w	0[sp], r10
    6d86:	61 52       	cmp	1, r10
    6d88:	e3 07 9f 01 	bnh	6f26 <___muldf3+0x1d8>
    6d8c:	23 5f 15 00 	ld.w	20[sp], r11
    6d90:	61 5a       	cmp	1, r11
    6d92:	e3 07 cf 01 	bnh	6f60 <___muldf3+0x212>
    6d96:	64 52       	cmp	4, r10
    6d98:	e2 07 8b 01 	be	6f22 <___muldf3+0x1d4>
    6d9c:	64 5a       	cmp	4, r11
    6d9e:	e2 07 e5 01 	be	6f82 <___muldf3+0x234>
    6da2:	62 52       	cmp	2, r10
    6da4:	e2 07 83 01 	be	6f26 <___muldf3+0x1d8>
    6da8:	62 5a       	cmp	2, r11
    6daa:	e2 07 b7 01 	be	6f60 <___muldf3+0x212>
    6dae:	23 df 0d 00 	ld.w	12[sp], r27
    6db2:	00 3a       	mov	0, r7
    6db4:	23 d7 21 00 	ld.w	32[sp], r26
    6db8:	00 4a       	mov	0, r9
    6dba:	23 c7 25 00 	ld.w	36[sp], r24
    6dbe:	3d 06 c0 74 	mov	0x74c0, r29
    6dc2:	00 00 
    6dc4:	1b 30       	mov	r27, r6
    6dc6:	1a 40       	mov	r26, r8
    6dc8:	fd c7 60 f9 	jarl	[r29], lp
    6dcc:	23 cf 11 00 	ld.w	16[sp], r25
    6dd0:	18 30       	mov	r24, r6
    6dd2:	1b 40       	mov	r27, r8
    6dd4:	00 3a       	mov	0, r7
    6dd6:	00 4a       	mov	0, r9
    6dd8:	0a b8       	mov	r10, r23
    6dda:	0b e0       	mov	r11, r28
    6ddc:	fd c7 60 f9 	jarl	[r29], lp
    6de0:	19 30       	mov	r25, r6
    6de2:	18 40       	mov	r24, r8
    6de4:	00 3a       	mov	0, r7
    6de6:	00 4a       	mov	0, r9
    6de8:	0a c0       	mov	r10, r24
    6dea:	0b d8       	mov	r11, r27
    6dec:	fd c7 60 f9 	jarl	[r29], lp
    6df0:	19 30       	mov	r25, r6
    6df2:	1a 40       	mov	r26, r8
    6df4:	00 3a       	mov	0, r7
    6df6:	00 4a       	mov	0, r9
    6df8:	0a c8       	mov	r10, r25
    6dfa:	0b d0       	mov	r11, r26
    6dfc:	fd c7 60 f9 	jarl	[r29], lp
    6e00:	0a 60       	mov	r10, r12
    6e02:	db 59       	add	r27, r11
    6e04:	d8 61       	add	r24, r12
    6e06:	ea 61       	cmp	r10, r12
    6e08:	e1 77 00 00 	setf	c/l, r14
    6e0c:	cb 71       	add	r11, r14
    6e0e:	ee d9       	cmp	r14, r27
    6e10:	f3 7d       	bnh	6f0e <___muldf3+0x1c0>
    6e12:	00 52       	mov	0, r10
    6e14:	01 7a       	mov	1, r15
    6e16:	ce c9       	add	r14, r25
    6e18:	23 5f 1d 00 	ld.w	28[sp], r11
    6e1c:	ee c9       	cmp	r14, r25
    6e1e:	e1 77 00 00 	setf	c/l, r14
    6e22:	23 6f 09 00 	ld.w	8[sp], r13
    6e26:	da 71       	add	r26, r14
    6e28:	dc 61       	add	r28, r12
    6e2a:	cf 71       	add	r15, r14
    6e2c:	23 8f 05 00 	ld.w	4[sp], r17
    6e30:	23 7f 19 00 	ld.w	24[sp], r15
    6e34:	ec e1       	cmp	r12, r28
    6e36:	e1 57 16 53 	cmov	h, 1, r10, r10
    6e3a:	cb 69       	add	r11, r13
    6e3c:	d9 51       	add	r25, r10
    6e3e:	f9 51       	cmp	r25, r10
    6e40:	e1 5f 00 00 	setf	c/l, r11
    6e44:	0d 86 04 00 	addi	4, r13, r16
    6e48:	ef 89       	cmp	r15, r17
    6e4a:	ea 7f 00 00 	setf	nz, r15
    6e4e:	ce 59       	add	r14, r11
    6e50:	63 87 31 00 	st.w	r16, 48[sp]
    6e54:	63 7f 2d 00 	st.w	r15, 44[sp]
    6e58:	32 06 ff ff 	mov	0x1fffffff, r18
    6e5c:	ff 1f 
    6e5e:	f2 59       	cmp	r18, r11
    6e60:	93 1d       	bnh	6e92 <___muldf3+0x144>
    6e62:	45 6a       	add	5, r13
    6e64:	0b 70       	mov	r11, r14
    6e66:	ca 7e 01 00 	andi	1, r10, r15
    6e6a:	0c 80       	mov	r12, r16
    6e6c:	df 72       	shl	31, r14
    6e6e:	81 52       	shr	1, r10
    6e70:	81 5a       	shr	1, r11
    6e72:	df 82       	shl	31, r16
    6e74:	0d 88       	mov	r13, r17
    6e76:	60 7a       	cmp	0, r15
    6e78:	f2 05       	be	6e86 <___muldf3+0x138>
    6e7a:	81 ba       	shr	1, r23
    6e7c:	81 62       	shr	1, r12
    6e7e:	40 7e 00 80 	movhi	-32768, r0, r15
    6e82:	10 b9       	or	r16, r23
    6e84:	0f 61       	or	r15, r12
    6e86:	0e 51       	or	r14, r10
    6e88:	41 6a       	add	1, r13
    6e8a:	f2 59       	cmp	r18, r11
    6e8c:	cb ed       	bh	6e64 <___muldf3+0x116>
    6e8e:	63 8f 31 00 	st.w	r17, 48[sp]
    6e92:	31 06 ff ff 	mov	0xfffffff, r17
    6e96:	ff 0f 
    6e98:	f1 59       	cmp	r17, r11
    6e9a:	eb 25       	bh	6ee6 <___muldf3+0x198>
    6e9c:	23 87 31 00 	ld.w	48[sp], r16
    6ea0:	95 0d       	br	6eb2 <___muldf3+0x164>
    6ea2:	f7 71       	cmp	r23, r14
    6ea4:	e1 7f 00 00 	setf	c/l, r15
    6ea8:	cc 61       	add	r12, r12
    6eaa:	0e b8       	mov	r14, r23
    6eac:	cf 61       	add	r15, r12
    6eae:	f1 69       	cmp	r17, r13
    6eb0:	9b 1d       	bh	6ee2 <___muldf3+0x194>
    6eb2:	0a 78       	mov	r10, r15
    6eb4:	cb 59       	add	r11, r11
    6eb6:	ca 79       	add	r10, r15
    6eb8:	17 70       	mov	r23, r14
    6eba:	ea 79       	cmp	r10, r15
    6ebc:	e1 6f 00 00 	setf	c/l, r13
    6ec0:	d7 71       	add	r23, r14
    6ec2:	cb 69       	add	r11, r13
    6ec4:	0f 50       	mov	r15, r10
    6ec6:	5f 82       	add	-1, r16
    6ec8:	0d 58       	mov	r13, r11
    6eca:	60 62       	cmp	0, r12
    6ecc:	be ed       	bge	6ea2 <___muldf3+0x154>
    6ece:	8f 56 01 00 	ori	1, r15, r10
    6ed2:	cc 61       	add	r12, r12
    6ed4:	f7 71       	cmp	r23, r14
    6ed6:	e1 7f 00 00 	setf	c/l, r15
    6eda:	0e b8       	mov	r14, r23
    6edc:	cf 61       	add	r15, r12
    6ede:	f1 69       	cmp	r17, r13
    6ee0:	93 ed       	bnh	6eb2 <___muldf3+0x164>
    6ee2:	63 87 31 00 	st.w	r16, 48[sp]
    6ee6:	ca 6e ff 00 	andi	255, r10, r13
    6eea:	20 76 80 00 	movea	128, r0, r14
    6eee:	ee 69       	cmp	r14, r13
    6ef0:	a2 2d       	be	6f44 <___muldf3+0x1f6>
    6ef2:	63 57 35 00 	st.w	r10, 52[sp]
    6ef6:	03 52       	mov	3, r10
    6ef8:	63 5f 39 00 	st.w	r11, 56[sp]
    6efc:	03 36 28 00 	addi	40, sp, r6
    6f00:	63 57 29 00 	st.w	r10, 40[sp]
    6f04:	80 ff 22 06 	jarl	7526 <___pack_d>, lp
    6f08:	03 1e 4c 00 	addi	76, sp, sp
    6f0c:	05 02       	callt	5
    6f0e:	ee d9       	cmp	r14, r27
    6f10:	d2 05       	be	6f1a <___muldf3+0x1cc>
    6f12:	00 52       	mov	0, r10
    6f14:	00 7a       	mov	0, r15
    6f16:	bf 07 00 ff 	jr	6e16 <___muldf3+0xc8>
    6f1a:	ec c1       	cmp	r12, r24
    6f1c:	fb 07 f7 fe 	bh	6e12 <___muldf3+0xc4>
    6f20:	95 fd       	br	6f12 <___muldf3+0x1c4>
    6f22:	62 5a       	cmp	2, r11
    6f24:	92 35       	be	6f86 <___muldf3+0x238>
    6f26:	23 5f 05 00 	ld.w	4[sp], r11
    6f2a:	03 30       	mov	sp, r6
    6f2c:	23 57 19 00 	ld.w	24[sp], r10
    6f30:	ea 59       	cmp	r10, r11
    6f32:	ea 57 00 00 	setf	nz, r10
    6f36:	63 57 05 00 	st.w	r10, 4[sp]
    6f3a:	80 ff ec 05 	jarl	7526 <___pack_d>, lp
    6f3e:	03 1e 4c 00 	addi	76, sp, sp
    6f42:	05 02       	callt	5
    6f44:	ca 76 00 01 	andi	256, r10, r14
    6f48:	da d5       	bne	6ef2 <___muldf3+0x1a4>
    6f4a:	17 61       	or	r23, r12
    6f4c:	b2 d5       	be	6ef2 <___muldf3+0x1a4>
    6f4e:	ca 69       	add	r10, r13
    6f50:	ea 69       	cmp	r10, r13
    6f52:	e1 67 00 00 	setf	c/l, r12
    6f56:	20 56 00 ff 	movea	-256, r0, r10
    6f5a:	4d 51       	and	r13, r10
    6f5c:	cc 59       	add	r12, r11
    6f5e:	a5 cd       	br	6ef2 <___muldf3+0x1a4>
    6f60:	23 57 19 00 	ld.w	24[sp], r10
    6f64:	20 36 14 00 	movea	20, r0, r6
    6f68:	23 5f 05 00 	ld.w	4[sp], r11
    6f6c:	c3 31       	add	sp, r6
    6f6e:	ea 59       	cmp	r10, r11
    6f70:	ea 57 00 00 	setf	nz, r10
    6f74:	63 57 19 00 	st.w	r10, 24[sp]
    6f78:	80 ff ae 05 	jarl	7526 <___pack_d>, lp
    6f7c:	03 1e 4c 00 	addi	76, sp, sp
    6f80:	05 02       	callt	5
    6f82:	62 52       	cmp	2, r10
    6f84:	ea ed       	bne	6f60 <___muldf3+0x212>
    6f86:	26 06 88 7b 	mov	0x7b88, r6
    6f8a:	00 00 
    6f8c:	c5 bd       	br	6f04 <___muldf3+0x1b6>

00006f8e <___divdf3>:
    6f8e:	10 02       	callt	16
    6f90:	3d 06 82 76 	mov	0x7682, r29
    6f94:	00 00 
    6f96:	03 1e c8 ff 	addi	-56, sp, sp
    6f9a:	63 37 29 00 	st.w	r6, 40[sp]
    6f9e:	03 36 28 00 	addi	40, sp, r6
    6fa2:	63 3f 2d 00 	st.w	r7, 44[sp]
    6fa6:	03 38       	mov	sp, r7
    6fa8:	63 47 31 00 	st.w	r8, 48[sp]
    6fac:	63 4f 35 00 	st.w	r9, 52[sp]
    6fb0:	fd c7 60 f9 	jarl	[r29], lp
    6fb4:	20 3e 14 00 	movea	20, r0, r7
    6fb8:	03 36 30 00 	addi	48, sp, r6
    6fbc:	c3 39       	add	sp, r7
    6fbe:	fd c7 60 f9 	jarl	[r29], lp
    6fc2:	23 57 01 00 	ld.w	0[sp], r10
    6fc6:	61 52       	cmp	1, r10
    6fc8:	83 75       	bnh	70a8 <___divdf3+0x11a>
    6fca:	23 67 15 00 	ld.w	20[sp], r12
    6fce:	61 62       	cmp	1, r12
    6fd0:	e3 07 1b 01 	bnh	70ea <___divdf3+0x15c>
    6fd4:	23 5f 05 00 	ld.w	4[sp], r11
    6fd8:	23 6f 19 00 	ld.w	24[sp], r13
    6fdc:	2d 59       	xor	r13, r11
    6fde:	63 5f 05 00 	st.w	r11, 4[sp]
    6fe2:	64 52       	cmp	4, r10
    6fe4:	82 65       	be	70a4 <___divdf3+0x116>
    6fe6:	62 52       	cmp	2, r10
    6fe8:	e2 5d       	be	70a4 <___divdf3+0x116>
    6fea:	64 62       	cmp	4, r12
    6fec:	e2 07 07 01 	be	70f2 <___divdf3+0x164>
    6ff0:	62 62       	cmp	2, r12
    6ff2:	b2 75       	be	70d8 <___divdf3+0x14a>
    6ff4:	23 67 09 00 	ld.w	8[sp], r12
    6ff8:	23 5f 1d 00 	ld.w	28[sp], r11
    6ffc:	23 57 11 00 	ld.w	16[sp], r10
    7000:	23 87 25 00 	ld.w	36[sp], r16
    7004:	ab 61       	sub	r11, r12
    7006:	23 37 21 00 	ld.w	32[sp], r6
    700a:	63 67 09 00 	st.w	r12, 8[sp]
    700e:	23 5f 0d 00 	ld.w	12[sp], r11
    7012:	ea 81       	cmp	r10, r16
    7014:	b3 45       	bnh	709a <___divdf3+0x10c>
    7016:	0b 68       	mov	r11, r13
    7018:	ca 51       	add	r10, r10
    701a:	cb 69       	add	r11, r13
    701c:	5f 62       	add	-1, r12
    701e:	eb 69       	cmp	r11, r13
    7020:	e1 77 00 00 	setf	c/l, r14
    7024:	0d 58       	mov	r13, r11
    7026:	ce 51       	add	r14, r10
    7028:	63 67 09 00 	st.w	r12, 8[sp]
    702c:	20 76 3d 00 	movea	61, r0, r14
    7030:	00 62       	mov	0, r12
    7032:	40 6e 00 10 	movhi	4096, r0, r13
    7036:	00 9a       	mov	0, r19
    7038:	00 3a       	mov	0, r7
    703a:	0d 90       	mov	r13, r18
    703c:	5f 72       	add	-1, r14
    703e:	df 92       	shl	31, r18
    7040:	ea 81       	cmp	r10, r16
    7042:	fb 0d       	bh	7060 <___divdf3+0xd2>
    7044:	0b 78       	mov	r11, r15
    7046:	a6 79       	sub	r6, r15
    7048:	ea 81       	cmp	r10, r16
    704a:	ba 05       	bne	7050 <___divdf3+0xc2>
    704c:	eb 31       	cmp	r11, r6
    704e:	9b 0d       	bh	7060 <___divdf3+0xd2>
    7050:	eb 79       	cmp	r11, r15
    7052:	eb 8f 00 00 	setf	h, r17
    7056:	b0 51       	sub	r16, r10
    7058:	0f 58       	mov	r15, r11
    705a:	0c 99       	or	r12, r19
    705c:	0d 39       	or	r13, r7
    705e:	b1 51       	sub	r17, r10
    7060:	0b 78       	mov	r11, r15
    7062:	81 62       	shr	1, r12
    7064:	cb 79       	add	r11, r15
    7066:	ca 51       	add	r10, r10
    7068:	eb 79       	cmp	r11, r15
    706a:	e1 8f 00 00 	setf	c/l, r17
    706e:	12 61       	or	r18, r12
    7070:	81 6a       	shr	1, r13
    7072:	0f 58       	mov	r15, r11
    7074:	d1 51       	add	r17, r10
    7076:	60 72       	cmp	0, r14
    7078:	9a e5       	bne	703a <___divdf3+0xac>
    707a:	d3 66 ff 00 	andi	255, r19, r12
    707e:	20 6e 80 00 	movea	128, r0, r13
    7082:	ed 61       	cmp	r13, r12
    7084:	c2 1d       	be	70bc <___divdf3+0x12e>
    7086:	63 9f 0d 00 	st.w	r19, 12[sp]
    708a:	03 30       	mov	sp, r6
    708c:	63 3f 11 00 	st.w	r7, 16[sp]
    7090:	80 ff 96 04 	jarl	7526 <___pack_d>, lp
    7094:	03 1e 38 00 	addi	56, sp, sp
    7098:	11 02       	callt	17
    709a:	ea 81       	cmp	r10, r16
    709c:	8a cd       	bne	702c <___divdf3+0x9e>
    709e:	eb 31       	cmp	r11, r6
    70a0:	e3 c5       	bnh	702c <___divdf3+0x9e>
    70a2:	a5 bd       	br	7016 <___divdf3+0x88>
    70a4:	ec 51       	cmp	r12, r10
    70a6:	f2 05       	be	70b4 <___divdf3+0x126>
    70a8:	03 30       	mov	sp, r6
    70aa:	80 ff 7c 04 	jarl	7526 <___pack_d>, lp
    70ae:	03 1e 38 00 	addi	56, sp, sp
    70b2:	11 02       	callt	17
    70b4:	26 06 88 7b 	mov	0x7b88, r6
    70b8:	00 00 
    70ba:	b5 ed       	br	7090 <___divdf3+0x102>
    70bc:	d3 6e 00 01 	andi	256, r19, r13
    70c0:	ba e5       	bne	7086 <___divdf3+0xf8>
    70c2:	0f 51       	or	r15, r10
    70c4:	92 e5       	be	7086 <___divdf3+0xf8>
    70c6:	d3 61       	add	r19, r12
    70c8:	f3 61       	cmp	r19, r12
    70ca:	e1 57 00 00 	setf	c/l, r10
    70ce:	20 9e 00 ff 	movea	-256, r0, r19
    70d2:	4c 99       	and	r12, r19
    70d4:	ca 39       	add	r10, r7
    70d6:	85 dd       	br	7086 <___divdf3+0xf8>
    70d8:	03 30       	mov	sp, r6
    70da:	04 52       	mov	4, r10
    70dc:	63 57 01 00 	st.w	r10, 0[sp]
    70e0:	80 ff 46 04 	jarl	7526 <___pack_d>, lp
    70e4:	03 1e 38 00 	addi	56, sp, sp
    70e8:	11 02       	callt	17
    70ea:	20 36 14 00 	movea	20, r0, r6
    70ee:	c3 31       	add	sp, r6
    70f0:	85 d5       	br	7090 <___divdf3+0x102>
    70f2:	00 52       	mov	0, r10
    70f4:	00 5a       	mov	0, r11
    70f6:	a3 07 cf 50 	st.dw	r10, 12[sp]
    70fa:	00 00 
    70fc:	03 30       	mov	sp, r6
    70fe:	63 07 09 00 	st.w	r0, 8[sp]
    7102:	f5 c5       	br	7090 <___divdf3+0x102>

00007104 <___eqdf2>:
    7104:	10 02       	callt	16
    7106:	3d 06 82 76 	mov	0x7682, r29
    710a:	00 00 
    710c:	03 1e c8 ff 	addi	-56, sp, sp
    7110:	63 37 29 00 	st.w	r6, 40[sp]
    7114:	03 36 28 00 	addi	40, sp, r6
    7118:	63 3f 2d 00 	st.w	r7, 44[sp]
    711c:	03 38       	mov	sp, r7
    711e:	63 47 31 00 	st.w	r8, 48[sp]
    7122:	63 4f 35 00 	st.w	r9, 52[sp]
    7126:	fd c7 60 f9 	jarl	[r29], lp
    712a:	20 3e 14 00 	movea	20, r0, r7
    712e:	03 36 30 00 	addi	48, sp, r6
    7132:	c3 39       	add	sp, r7
    7134:	fd c7 60 f9 	jarl	[r29], lp
    7138:	23 57 01 00 	ld.w	0[sp], r10
    713c:	61 52       	cmp	1, r10
    713e:	e3 0d       	bnh	715a <___eqdf2+0x56>
    7140:	23 57 15 00 	ld.w	20[sp], r10
    7144:	61 52       	cmp	1, r10
    7146:	a3 0d       	bnh	715a <___eqdf2+0x56>
    7148:	20 3e 14 00 	movea	20, r0, r7
    714c:	03 30       	mov	sp, r6
    714e:	c3 39       	add	sp, r7
    7150:	80 ff fa 05 	jarl	774a <___fpcmp_parts_d>, lp
    7154:	03 1e 38 00 	addi	56, sp, sp
    7158:	11 02       	callt	17
    715a:	01 52       	mov	1, r10
    715c:	c5 fd       	br	7154 <___eqdf2+0x50>

0000715e <___nedf2>:
    715e:	10 02       	callt	16
    7160:	3d 06 82 76 	mov	0x7682, r29
    7164:	00 00 
    7166:	03 1e c8 ff 	addi	-56, sp, sp
    716a:	63 37 29 00 	st.w	r6, 40[sp]
    716e:	03 36 28 00 	addi	40, sp, r6
    7172:	63 3f 2d 00 	st.w	r7, 44[sp]
    7176:	03 38       	mov	sp, r7
    7178:	63 47 31 00 	st.w	r8, 48[sp]
    717c:	63 4f 35 00 	st.w	r9, 52[sp]
    7180:	fd c7 60 f9 	jarl	[r29], lp
    7184:	20 3e 14 00 	movea	20, r0, r7
    7188:	03 36 30 00 	addi	48, sp, r6
    718c:	c3 39       	add	sp, r7
    718e:	fd c7 60 f9 	jarl	[r29], lp
    7192:	23 57 01 00 	ld.w	0[sp], r10
    7196:	61 52       	cmp	1, r10
    7198:	e3 0d       	bnh	71b4 <___nedf2+0x56>
    719a:	23 57 15 00 	ld.w	20[sp], r10
    719e:	61 52       	cmp	1, r10
    71a0:	a3 0d       	bnh	71b4 <___nedf2+0x56>
    71a2:	20 3e 14 00 	movea	20, r0, r7
    71a6:	03 30       	mov	sp, r6
    71a8:	c3 39       	add	sp, r7
    71aa:	80 ff a0 05 	jarl	774a <___fpcmp_parts_d>, lp
    71ae:	03 1e 38 00 	addi	56, sp, sp
    71b2:	11 02       	callt	17
    71b4:	01 52       	mov	1, r10
    71b6:	c5 fd       	br	71ae <___nedf2+0x50>

000071b8 <___gtdf2>:
    71b8:	10 02       	callt	16
    71ba:	3d 06 82 76 	mov	0x7682, r29
    71be:	00 00 
    71c0:	03 1e c8 ff 	addi	-56, sp, sp
    71c4:	63 37 29 00 	st.w	r6, 40[sp]
    71c8:	03 36 28 00 	addi	40, sp, r6
    71cc:	63 3f 2d 00 	st.w	r7, 44[sp]
    71d0:	03 38       	mov	sp, r7
    71d2:	63 47 31 00 	st.w	r8, 48[sp]
    71d6:	63 4f 35 00 	st.w	r9, 52[sp]
    71da:	fd c7 60 f9 	jarl	[r29], lp
    71de:	20 3e 14 00 	movea	20, r0, r7
    71e2:	03 36 30 00 	addi	48, sp, r6
    71e6:	c3 39       	add	sp, r7
    71e8:	fd c7 60 f9 	jarl	[r29], lp
    71ec:	23 57 01 00 	ld.w	0[sp], r10
    71f0:	61 52       	cmp	1, r10
    71f2:	e3 0d       	bnh	720e <___gtdf2+0x56>
    71f4:	23 57 15 00 	ld.w	20[sp], r10
    71f8:	61 52       	cmp	1, r10
    71fa:	a3 0d       	bnh	720e <___gtdf2+0x56>
    71fc:	20 3e 14 00 	movea	20, r0, r7
    7200:	03 30       	mov	sp, r6
    7202:	c3 39       	add	sp, r7
    7204:	80 ff 46 05 	jarl	774a <___fpcmp_parts_d>, lp
    7208:	03 1e 38 00 	addi	56, sp, sp
    720c:	11 02       	callt	17
    720e:	1f 52       	mov	-1, r10
    7210:	c5 fd       	br	7208 <___gtdf2+0x50>

00007212 <___gedf2>:
    7212:	10 02       	callt	16
    7214:	3d 06 82 76 	mov	0x7682, r29
    7218:	00 00 
    721a:	03 1e c8 ff 	addi	-56, sp, sp
    721e:	63 37 29 00 	st.w	r6, 40[sp]
    7222:	03 36 28 00 	addi	40, sp, r6
    7226:	63 3f 2d 00 	st.w	r7, 44[sp]
    722a:	03 38       	mov	sp, r7
    722c:	63 47 31 00 	st.w	r8, 48[sp]
    7230:	63 4f 35 00 	st.w	r9, 52[sp]
    7234:	fd c7 60 f9 	jarl	[r29], lp
    7238:	20 3e 14 00 	movea	20, r0, r7
    723c:	03 36 30 00 	addi	48, sp, r6
    7240:	c3 39       	add	sp, r7
    7242:	fd c7 60 f9 	jarl	[r29], lp
    7246:	23 57 01 00 	ld.w	0[sp], r10
    724a:	61 52       	cmp	1, r10
    724c:	e3 0d       	bnh	7268 <___gedf2+0x56>
    724e:	23 57 15 00 	ld.w	20[sp], r10
    7252:	61 52       	cmp	1, r10
    7254:	a3 0d       	bnh	7268 <___gedf2+0x56>
    7256:	20 3e 14 00 	movea	20, r0, r7
    725a:	03 30       	mov	sp, r6
    725c:	c3 39       	add	sp, r7
    725e:	80 ff ec 04 	jarl	774a <___fpcmp_parts_d>, lp
    7262:	03 1e 38 00 	addi	56, sp, sp
    7266:	11 02       	callt	17
    7268:	1f 52       	mov	-1, r10
    726a:	c5 fd       	br	7262 <___gedf2+0x50>

0000726c <___ltdf2>:
    726c:	10 02       	callt	16
    726e:	3d 06 82 76 	mov	0x7682, r29
    7272:	00 00 
    7274:	03 1e c8 ff 	addi	-56, sp, sp
    7278:	63 37 29 00 	st.w	r6, 40[sp]
    727c:	03 36 28 00 	addi	40, sp, r6
    7280:	63 3f 2d 00 	st.w	r7, 44[sp]
    7284:	03 38       	mov	sp, r7
    7286:	63 47 31 00 	st.w	r8, 48[sp]
    728a:	63 4f 35 00 	st.w	r9, 52[sp]
    728e:	fd c7 60 f9 	jarl	[r29], lp
    7292:	20 3e 14 00 	movea	20, r0, r7
    7296:	03 36 30 00 	addi	48, sp, r6
    729a:	c3 39       	add	sp, r7
    729c:	fd c7 60 f9 	jarl	[r29], lp
    72a0:	23 57 01 00 	ld.w	0[sp], r10
    72a4:	61 52       	cmp	1, r10
    72a6:	e3 0d       	bnh	72c2 <___ltdf2+0x56>
    72a8:	23 57 15 00 	ld.w	20[sp], r10
    72ac:	61 52       	cmp	1, r10
    72ae:	a3 0d       	bnh	72c2 <___ltdf2+0x56>
    72b0:	20 3e 14 00 	movea	20, r0, r7
    72b4:	03 30       	mov	sp, r6
    72b6:	c3 39       	add	sp, r7
    72b8:	80 ff 92 04 	jarl	774a <___fpcmp_parts_d>, lp
    72bc:	03 1e 38 00 	addi	56, sp, sp
    72c0:	11 02       	callt	17
    72c2:	01 52       	mov	1, r10
    72c4:	c5 fd       	br	72bc <___ltdf2+0x50>

000072c6 <___floatsidf>:
    72c6:	10 02       	callt	16
    72c8:	06 50       	mov	r6, r10
    72ca:	03 1e ec ff 	addi	-20, sp, sp
    72ce:	9f 52       	shr	31, r10
    72d0:	03 5a       	mov	3, r11
    72d2:	63 57 05 00 	st.w	r10, 4[sp]
    72d6:	63 5f 01 00 	st.w	r11, 0[sp]
    72da:	60 32       	cmp	0, r6
    72dc:	aa 0d       	bne	72f0 <___floatsidf+0x2a>
    72de:	02 52       	mov	2, r10
    72e0:	63 57 01 00 	st.w	r10, 0[sp]
    72e4:	03 30       	mov	sp, r6
    72e6:	80 ff 40 02 	jarl	7526 <___pack_d>, lp
    72ea:	03 1e 14 00 	addi	20, sp, sp
    72ee:	11 02       	callt	17
    72f0:	20 5e 3c 00 	movea	60, r0, r11
    72f4:	63 5f 09 00 	st.w	r11, 8[sp]
    72f8:	60 52       	cmp	0, r10
    72fa:	ea 25       	bne	7346 <___floatsidf+0x80>
    72fc:	06 e8       	mov	r6, r29
    72fe:	1d 30       	mov	r29, r6
    7300:	63 ef 0d 00 	st.w	r29, 12[sp]
    7304:	63 07 11 00 	st.w	r0, 16[sp]
    7308:	80 ff cc 01 	jarl	74d4 <___clzsi2>, lp
    730c:	0a 5e 1d 00 	addi	29, r10, r11
    7310:	60 5a       	cmp	0, r11
    7312:	97 ed       	ble	72e4 <___floatsidf+0x1e>
    7314:	1d 60       	mov	r29, r12
    7316:	2b 70       	not	r11, r14
    7318:	81 62       	shr	1, r12
    731a:	cb 6e 20 00 	andi	32, r11, r13
    731e:	eb ef c0 00 	shl	r11, r29
    7322:	ee 67 80 00 	shr	r14, r12
    7326:	20 5e 1f 00 	movea	31, r0, r11
    732a:	60 6a       	cmp	0, r13
    732c:	ec ef 24 63 	cmov	z, r12, r29, r12
    7330:	aa 59       	sub	r10, r11
    7332:	60 6a       	cmp	0, r13
    7334:	fd 07 24 eb 	cmov	z, r29, r0, r29
    7338:	63 67 11 00 	st.w	r12, 16[sp]
    733c:	63 ef 0d 00 	st.w	r29, 12[sp]
    7340:	63 5f 09 00 	st.w	r11, 8[sp]
    7344:	85 d5       	br	72e4 <___floatsidf+0x1e>
    7346:	40 56 00 80 	movhi	-32768, r0, r10
    734a:	ea 31       	cmp	r10, r6
    734c:	c2 05       	be	7354 <___floatsidf+0x8e>
    734e:	06 e8       	mov	r6, r29
    7350:	80 e9       	subr	r0, r29
    7352:	e5 d5       	br	72fe <___floatsidf+0x38>
    7354:	00 52       	mov	0, r10
    7356:	40 5e e0 c1 	movhi	-15904, r0, r11
    735a:	85 cd       	br	72ea <___floatsidf+0x24>

0000735c <___fixdfsi>:
    735c:	12 02       	callt	18
    735e:	03 1e e4 ff 	addi	-28, sp, sp
    7362:	63 37 15 00 	st.w	r6, 20[sp]
    7366:	03 36 14 00 	addi	20, sp, r6
    736a:	63 3f 19 00 	st.w	r7, 24[sp]
    736e:	03 38       	mov	sp, r7
    7370:	80 ff 12 03 	jarl	7682 <___unpack_d>, lp
    7374:	23 57 01 00 	ld.w	0[sp], r10
    7378:	62 52       	cmp	2, r10
    737a:	a2 3d       	be	73ee <___fixdfsi+0x92>
    737c:	61 52       	cmp	1, r10
    737e:	83 3d       	bnh	73ee <___fixdfsi+0x92>
    7380:	64 52       	cmp	4, r10
    7382:	92 0d       	be	7394 <___fixdfsi+0x38>
    7384:	23 5f 09 00 	ld.w	8[sp], r11
    7388:	60 5a       	cmp	0, r11
    738a:	a6 35       	blt	73ee <___fixdfsi+0x92>
    738c:	20 56 1e 00 	movea	30, r0, r10
    7390:	ea 59       	cmp	r10, r11
    7392:	e7 0d       	ble	73ae <___fixdfsi+0x52>
    7394:	23 67 05 00 	ld.w	4[sp], r12
    7398:	40 5e 00 80 	movhi	-32768, r0, r11
    739c:	2a 06 ff ff 	mov	0x7fffffff, r10
    73a0:	ff 7f 
    73a2:	03 1e 1c 00 	addi	28, sp, sp
    73a6:	60 62       	cmp	0, r12
    73a8:	ea 5f 24 53 	cmov	z, r10, r11, r10
    73ac:	13 02       	callt	19
    73ae:	23 57 11 00 	ld.w	16[sp], r10
    73b2:	20 66 3c 00 	movea	60, r0, r12
    73b6:	23 6f 0d 00 	ld.w	12[sp], r13
    73ba:	ab 61       	sub	r11, r12
    73bc:	2c 78       	not	r12, r15
    73be:	cc 76 20 00 	andi	32, r12, r14
    73c2:	0a 58       	mov	r10, r11
    73c4:	ec 57 80 00 	shr	r12, r10
    73c8:	c1 5a       	shl	1, r11
    73ca:	ec 6f 80 00 	shr	r12, r13
    73ce:	ef 5f c0 00 	shl	r15, r11
    73d2:	23 67 05 00 	ld.w	4[sp], r12
    73d6:	0b 69       	or	r11, r13
    73d8:	03 1e 1c 00 	addi	28, sp, sp
    73dc:	60 72       	cmp	0, r14
    73de:	ed 57 24 53 	cmov	z, r13, r10, r10
    73e2:	0a 58       	mov	r10, r11
    73e4:	80 59       	subr	r0, r11
    73e6:	60 62       	cmp	0, r12
    73e8:	eb 57 34 53 	cmov	nz, r11, r10, r10
    73ec:	13 02       	callt	19
    73ee:	03 1e 1c 00 	addi	28, sp, sp
    73f2:	00 52       	mov	0, r10
    73f4:	13 02       	callt	19

000073f6 <___floatunsidf>:
    73f6:	10 02       	callt	16
    73f8:	06 e8       	mov	r6, r29
    73fa:	03 1e ec ff 	addi	-20, sp, sp
    73fe:	63 07 05 00 	st.w	r0, 4[sp]
    7402:	60 32       	cmp	0, r6
    7404:	92 35       	be	7466 <___floatunsidf+0x70>
    7406:	03 52       	mov	3, r10
    7408:	63 37 0d 00 	st.w	r6, 12[sp]
    740c:	63 57 01 00 	st.w	r10, 0[sp]
    7410:	20 56 3c 00 	movea	60, r0, r10
    7414:	63 57 09 00 	st.w	r10, 8[sp]
    7418:	63 07 11 00 	st.w	r0, 16[sp]
    741c:	80 ff b8 00 	jarl	74d4 <___clzsi2>, lp
    7420:	0a 5e 1d 00 	addi	29, r10, r11
    7424:	60 5a       	cmp	0, r11
    7426:	96 2d       	blt	7478 <___floatunsidf+0x82>
    7428:	92 1d       	be	745a <___floatunsidf+0x64>
    742a:	1d 60       	mov	r29, r12
    742c:	2b 70       	not	r11, r14
    742e:	81 62       	shr	1, r12
    7430:	cb 6e 20 00 	andi	32, r11, r13
    7434:	eb ef c0 00 	shl	r11, r29
    7438:	ee 67 80 00 	shr	r14, r12
    743c:	20 5e 1f 00 	movea	31, r0, r11
    7440:	60 6a       	cmp	0, r13
    7442:	ec ef 24 63 	cmov	z, r12, r29, r12
    7446:	aa 59       	sub	r10, r11
    7448:	60 6a       	cmp	0, r13
    744a:	fd 07 24 eb 	cmov	z, r29, r0, r29
    744e:	63 67 11 00 	st.w	r12, 16[sp]
    7452:	63 ef 0d 00 	st.w	r29, 12[sp]
    7456:	63 5f 09 00 	st.w	r11, 8[sp]
    745a:	03 30       	mov	sp, r6
    745c:	80 ff ca 00 	jarl	7526 <___pack_d>, lp
    7460:	03 1e 14 00 	addi	20, sp, sp
    7464:	11 02       	callt	17
    7466:	02 52       	mov	2, r10
    7468:	03 30       	mov	sp, r6
    746a:	63 57 01 00 	st.w	r10, 0[sp]
    746e:	80 ff b8 00 	jarl	7526 <___pack_d>, lp
    7472:	03 1e 14 00 	addi	20, sp, sp
    7476:	11 02       	callt	17
    7478:	80 59       	subr	r0, r11
    747a:	01 62       	mov	1, r12
    747c:	cb 76 20 00 	andi	32, r11, r14
    7480:	eb 67 c0 00 	shl	r11, r12
    7484:	60 72       	cmp	0, r14
    7486:	e0 67 14 63 	cmov	nz, 0, r12, r12
    748a:	1d 68       	mov	r29, r13
    748c:	5f 62       	add	-1, r12
    748e:	eb 6f 80 00 	shr	r11, r13
    7492:	5d 61       	and	r29, r12
    7494:	60 72       	cmp	0, r14
    7496:	ed 07 24 6b 	cmov	z, r13, r0, r13
    749a:	20 5e 1f 00 	movea	31, r0, r11
    749e:	60 62       	cmp	0, r12
    74a0:	ea 67 00 00 	setf	nz, r12
    74a4:	aa 59       	sub	r10, r11
    74a6:	0d 61       	or	r13, r12
    74a8:	03 30       	mov	sp, r6
    74aa:	63 07 11 00 	st.w	r0, 16[sp]
    74ae:	63 67 0d 00 	st.w	r12, 12[sp]
    74b2:	63 5f 09 00 	st.w	r11, 8[sp]
    74b6:	80 ff 70 00 	jarl	7526 <___pack_d>, lp
    74ba:	03 1e 14 00 	addi	20, sp, sp
    74be:	11 02       	callt	17

000074c0 <___muldi3>:
    74c0:	08 50       	mov	r8, r10
    74c2:	e7 47 22 02 	mulu	r7, r8, r0
    74c6:	e6 4f 22 02 	mulu	r6, r9, r0
    74ca:	e6 57 22 5a 	mulu	r6, r10, r11
    74ce:	c8 59       	add	r8, r11
    74d0:	c9 59       	add	r9, r11
    74d2:	7f 00       	jmp	[lp]

000074d4 <___clzsi2>:
    74d4:	2a 06 ff ff 	mov	0xffff, r10
    74d8:	00 00 
    74da:	ea 31       	cmp	r10, r6
    74dc:	fb 15       	bh	750a <___clzsi2+0x36>
    74de:	20 66 ff 00 	movea	255, r0, r12
    74e2:	20 5e 20 00 	movea	32, r0, r11
    74e6:	20 6e 18 00 	movea	24, r0, r13
    74ea:	ec 31       	cmp	r12, r6
    74ec:	e8 07 16 53 	cmov	h, 8, r0, r10
    74f0:	ec 31       	cmp	r12, r6
    74f2:	ed 5f 36 5b 	cmov	h, r13, r11, r11
    74f6:	ea 37 80 00 	shr	r10, r6
    74fa:	2a 06 9c 7b 	mov	0x7b9c, r10
    74fe:	00 00 
    7500:	ca 31       	add	r10, r6
    7502:	86 57 01 00 	ld.bu	0[r6], r10
    7506:	8b 51       	subr	r11, r10
    7508:	7f 00       	jmp	[lp]
    750a:	2a 06 ff ff 	mov	0xffffff, r10
    750e:	ff 00 
    7510:	20 66 10 00 	movea	16, r0, r12
    7514:	20 6e 18 00 	movea	24, r0, r13
    7518:	ea 31       	cmp	r10, r6
    751a:	e8 67 16 5b 	cmov	h, 8, r12, r11
    751e:	ea 31       	cmp	r10, r6
    7520:	ed 67 36 53 	cmov	h, r13, r12, r10
    7524:	95 ed       	br	74f6 <___clzsi2+0x22>

00007526 <___pack_d>:
    7526:	08 02       	callt	8
    7528:	26 57 01 00 	ld.w	0[r6], r10
    752c:	26 ef 0d 00 	ld.w	12[r6], r29
    7530:	26 e7 11 00 	ld.w	16[r6], r28
    7534:	26 df 05 00 	ld.w	4[r6], r27
    7538:	61 52       	cmp	1, r10
    753a:	a3 55       	bnh	75de <___pack_d+0xb8>
    753c:	64 52       	cmp	4, r10
    753e:	b2 4d       	be	75d4 <___pack_d+0xae>
    7540:	62 52       	cmp	2, r10
    7542:	82 35       	be	75a2 <___pack_d+0x7c>
    7544:	1d 50       	mov	r29, r10
    7546:	1c 51       	or	r28, r10
    7548:	d2 2d       	be	75a2 <___pack_d+0x7c>
    754a:	26 5f 09 00 	ld.w	8[r6], r11
    754e:	20 d6 02 fc 	movea	-1022, r0, r26
    7552:	fa 59       	cmp	r26, r11
    7554:	86 55       	blt	75f4 <___pack_d+0xce>
    7556:	20 56 ff 03 	movea	1023, r0, r10
    755a:	ea 59       	cmp	r10, r11
    755c:	cf 3d       	bgt	75d4 <___pack_d+0xae>
    755e:	dd 56 ff 00 	andi	255, r29, r10
    7562:	20 66 80 00 	movea	128, r0, r12
    7566:	ec 51       	cmp	r12, r10
    7568:	c2 2d       	be	75c0 <___pack_d+0x9a>
    756a:	1d 56 7f 00 	addi	127, r29, r10
    756e:	fd 51       	cmp	r29, r10
    7570:	e1 67 00 00 	setf	c/l, r12
    7574:	0a e8       	mov	r10, r29
    7576:	cc e1       	add	r12, r28
    7578:	2a 06 ff ff 	mov	0x1fffffff, r10
    757c:	ff 1f 
    757e:	ea e1       	cmp	r10, r28
    7580:	8b 1d       	bh	75b0 <___pack_d+0x8a>
    7582:	0b 5e ff 03 	addi	1023, r11, r11
    7586:	1c 50       	mov	r28, r10
    7588:	88 e2       	shr	8, r28
    758a:	2c 06 ff ff 	mov	0xfffff, r12
    758e:	0f 00 
    7590:	4c e1       	and	r12, r28
    7592:	d4 5a       	shl	20, r11
    7594:	d8 52       	shl	24, r10
    7596:	88 ea       	shr	8, r29
    7598:	1c 59       	or	r28, r11
    759a:	df da       	shl	31, r27
    759c:	1d 51       	or	r29, r10
    759e:	1b 59       	or	r27, r11
    75a0:	09 02       	callt	9
    75a2:	00 5a       	mov	0, r11
    75a4:	00 52       	mov	0, r10
    75a6:	00 e2       	mov	0, r28
    75a8:	1c 59       	or	r28, r11
    75aa:	df da       	shl	31, r27
    75ac:	1b 59       	or	r27, r11
    75ae:	09 02       	callt	9
    75b0:	1c 50       	mov	r28, r10
    75b2:	81 ea       	shr	1, r29
    75b4:	df 52       	shl	31, r10
    75b6:	81 e2       	shr	1, r28
    75b8:	0a e9       	or	r10, r29
    75ba:	0b 5e 00 04 	addi	1024, r11, r11
    75be:	c5 e5       	br	7586 <___pack_d+0x60>
    75c0:	dd 66 00 01 	andi	256, r29, r12
    75c4:	a2 dd       	be	7578 <___pack_d+0x52>
    75c6:	dd 51       	add	r29, r10
    75c8:	fd 51       	cmp	r29, r10
    75ca:	e1 67 00 00 	setf	c/l, r12
    75ce:	0a e8       	mov	r10, r29
    75d0:	cc e1       	add	r12, r28
    75d2:	b5 d5       	br	7578 <___pack_d+0x52>
    75d4:	40 5e f0 7f 	movhi	32752, r0, r11
    75d8:	00 52       	mov	0, r10
    75da:	00 e2       	mov	0, r28
    75dc:	e5 e5       	br	75a8 <___pack_d+0x82>
    75de:	40 56 08 00 	movhi	8, r0, r10
    75e2:	0a e1       	or	r10, r28
    75e4:	1d 50       	mov	r29, r10
    75e6:	2b 06 ff ff 	mov	0xfffff, r11
    75ea:	0f 00 
    75ec:	4b e1       	and	r11, r28
    75ee:	40 5e f0 7f 	movhi	32752, r0, r11
    75f2:	b5 dd       	br	75a8 <___pack_d+0x82>
    75f4:	ab d1       	sub	r11, r26
    75f6:	20 56 38 00 	movea	56, r0, r10
    75fa:	ea d1       	cmp	r10, r26
    75fc:	9f 3d       	bgt	766e <___pack_d+0x148>
    75fe:	1a 40       	mov	r26, r8
    7600:	1d 30       	mov	r29, r6
    7602:	1c 38       	mov	r28, r7
    7604:	80 ff f0 01 	jarl	77f4 <___lshrdi3>, lp
    7608:	1a 40       	mov	r26, r8
    760a:	01 32       	mov	1, r6
    760c:	00 3a       	mov	0, r7
    760e:	0a d0       	mov	r10, r26
    7610:	0b c8       	mov	r11, r25
    7612:	80 ff 1a 02 	jarl	782c <___ashldi3>, lp
    7616:	60 52       	cmp	0, r10
    7618:	e2 67 00 00 	setf	z, r12
    761c:	5f 52       	add	-1, r10
    761e:	ac 59       	sub	r12, r11
    7620:	5d 51       	and	r29, r10
    7622:	5c 59       	and	r28, r11
    7624:	0b 51       	or	r11, r10
    7626:	20 5e 80 00 	movea	128, r0, r11
    762a:	ea 67 00 00 	setf	nz, r12
    762e:	1a 61       	or	r26, r12
    7630:	cc 56 ff 00 	andi	255, r12, r10
    7634:	eb 51       	cmp	r11, r10
    7636:	ea 1d       	bne	7672 <___pack_d+0x14c>
    7638:	cc 5e 00 01 	andi	256, r12, r11
    763c:	f2 05       	be	764a <___pack_d+0x124>
    763e:	cc 51       	add	r12, r10
    7640:	ec 51       	cmp	r12, r10
    7642:	e1 5f 00 00 	setf	c/l, r11
    7646:	0a 60       	mov	r10, r12
    7648:	cb c9       	add	r11, r25
    764a:	19 50       	mov	r25, r10
    764c:	88 62       	shr	8, r12
    764e:	d8 52       	shl	24, r10
    7650:	19 e0       	mov	r25, r28
    7652:	2b 06 ff ff 	mov	0xfffffff, r11
    7656:	ff 0f 
    7658:	88 e2       	shr	8, r28
    765a:	eb c9       	cmp	r11, r25
    765c:	e1 07 16 5b 	cmov	h, 1, r0, r11
    7660:	0c 51       	or	r12, r10
    7662:	d4 5a       	shl	20, r11
    7664:	2c 06 ff ff 	mov	0xfffff, r12
    7668:	0f 00 
    766a:	4c e1       	and	r12, r28
    766c:	e5 9d       	br	75a8 <___pack_d+0x82>
    766e:	00 62       	mov	0, r12
    7670:	00 ca       	mov	0, r25
    7672:	0c 56 7f 00 	addi	127, r12, r10
    7676:	ec 51       	cmp	r12, r10
    7678:	e1 5f 00 00 	setf	c/l, r11
    767c:	0a 60       	mov	r10, r12
    767e:	cb c9       	add	r11, r25
    7680:	d5 e5       	br	764a <___pack_d+0x124>

00007682 <___unpack_d>:
    7682:	26 67 05 00 	ld.w	4[r6], r12
    7686:	26 5f 01 00 	ld.w	0[r6], r11
    768a:	0c 68       	mov	r12, r13
    768c:	0c 50       	mov	r12, r10
    768e:	9f 52       	shr	31, r10
    7690:	94 6a       	shr	20, r13
    7692:	67 57 05 00 	st.w	r10, 4[r7]
    7696:	cd 6e ff 07 	andi	2047, r13, r13
    769a:	2a 06 ff ff 	mov	0xfffff, r10
    769e:	0f 00 
    76a0:	4c 51       	and	r12, r10
    76a2:	60 6a       	cmp	0, r13
    76a4:	ca 25       	bne	76ec <___unpack_d+0x6a>
    76a6:	0b 60       	mov	r11, r12
    76a8:	0a 61       	or	r10, r12
    76aa:	92 3d       	be	771c <___unpack_d+0x9a>
    76ac:	0b 60       	mov	r11, r12
    76ae:	c8 52       	shl	8, r10
    76b0:	98 62       	shr	24, r12
    76b2:	c8 5a       	shl	8, r11
    76b4:	0c 51       	or	r12, r10
    76b6:	03 62       	mov	3, r12
    76b8:	67 67 01 00 	st.w	r12, 0[r7]
    76bc:	20 66 01 fc 	movea	-1023, r0, r12
    76c0:	2e 06 ff ff 	mov	0xfffffff, r14
    76c4:	ff 0f 
    76c6:	0b 68       	mov	r11, r13
    76c8:	ca 51       	add	r10, r10
    76ca:	cb 69       	add	r11, r13
    76cc:	0c 78       	mov	r12, r15
    76ce:	eb 69       	cmp	r11, r13
    76d0:	e1 5f 00 00 	setf	c/l, r11
    76d4:	5f 62       	add	-1, r12
    76d6:	cb 51       	add	r11, r10
    76d8:	0d 58       	mov	r13, r11
    76da:	ee 51       	cmp	r14, r10
    76dc:	d3 f5       	bnh	76c6 <___unpack_d+0x44>
    76de:	67 7f 09 00 	st.w	r15, 8[r7]
    76e2:	67 6f 0d 00 	st.w	r13, 12[r7]
    76e6:	67 57 11 00 	st.w	r10, 16[r7]
    76ea:	7f 00       	jmp	[lp]
    76ec:	20 76 ff 07 	movea	2047, r0, r14
    76f0:	ee 69       	cmp	r14, r13
    76f2:	92 1d       	be	7724 <___unpack_d+0xa2>
    76f4:	0b 60       	mov	r11, r12
    76f6:	c8 52       	shl	8, r10
    76f8:	98 62       	shr	24, r12
    76fa:	0d 6e 01 fc 	addi	-1023, r13, r13
    76fe:	0a 61       	or	r10, r12
    7700:	40 56 00 10 	movhi	4096, r0, r10
    7704:	0a 61       	or	r10, r12
    7706:	c8 5a       	shl	8, r11
    7708:	03 52       	mov	3, r10
    770a:	67 6f 09 00 	st.w	r13, 8[r7]
    770e:	67 57 01 00 	st.w	r10, 0[r7]
    7712:	67 5f 0d 00 	st.w	r11, 12[r7]
    7716:	67 67 11 00 	st.w	r12, 16[r7]
    771a:	7f 00       	jmp	[lp]
    771c:	02 52       	mov	2, r10
    771e:	67 57 01 00 	st.w	r10, 0[r7]
    7722:	7f 00       	jmp	[lp]
    7724:	0b 68       	mov	r11, r13
    7726:	0a 69       	or	r10, r13
    7728:	d2 0d       	be	7742 <___unpack_d+0xc0>
    772a:	40 6e 08 00 	movhi	8, r0, r13
    772e:	67 5f 0d 00 	st.w	r11, 12[r7]
    7732:	4d 61       	and	r13, r12
    7734:	67 57 11 00 	st.w	r10, 16[r7]
    7738:	ea 5f 00 00 	setf	nz, r11
    773c:	67 5f 01 00 	st.w	r11, 0[r7]
    7740:	7f 00       	jmp	[lp]
    7742:	04 52       	mov	4, r10
    7744:	67 57 01 00 	st.w	r10, 0[r7]
    7748:	7f 00       	jmp	[lp]

0000774a <___fpcmp_parts_d>:
    774a:	26 57 01 00 	ld.w	0[r6], r10
    774e:	61 52       	cmp	1, r10
    7750:	83 4d       	bnh	77e0 <___fpcmp_parts_d+0x96>
    7752:	27 5f 01 00 	ld.w	0[r7], r11
    7756:	61 5a       	cmp	1, r11
    7758:	c3 45       	bnh	77e0 <___fpcmp_parts_d+0x96>
    775a:	64 52       	cmp	4, r10
    775c:	c2 45       	be	77e4 <___fpcmp_parts_d+0x9a>
    775e:	64 5a       	cmp	4, r11
    7760:	a2 15       	be	7784 <___fpcmp_parts_d+0x3a>
    7762:	62 52       	cmp	2, r10
    7764:	e2 0d       	be	7780 <___fpcmp_parts_d+0x36>
    7766:	62 5a       	cmp	2, r11
    7768:	d2 15       	be	7792 <___fpcmp_parts_d+0x48>
    776a:	26 57 05 00 	ld.w	4[r6], r10
    776e:	27 5f 05 00 	ld.w	4[r7], r11
    7772:	eb 51       	cmp	r11, r10
    7774:	e2 15       	be	77a0 <___fpcmp_parts_d+0x56>
    7776:	01 5a       	mov	1, r11
    7778:	60 52       	cmp	0, r10
    777a:	ff 5f 14 53 	cmov	nz, -1, r11, r10
    777e:	7f 00       	jmp	[lp]
    7780:	62 5a       	cmp	2, r11
    7782:	d2 2d       	be	77dc <___fpcmp_parts_d+0x92>
    7784:	27 5f 05 00 	ld.w	4[r7], r11
    7788:	1f 52       	mov	-1, r10
    778a:	60 5a       	cmp	0, r11
    778c:	e1 57 14 53 	cmov	nz, 1, r10, r10
    7790:	7f 00       	jmp	[lp]
    7792:	26 5f 05 00 	ld.w	4[r6], r11
    7796:	01 52       	mov	1, r10
    7798:	60 5a       	cmp	0, r11
    779a:	ff 57 14 53 	cmov	nz, -1, r10, r10
    779e:	7f 00       	jmp	[lp]
    77a0:	26 67 09 00 	ld.w	8[r6], r12
    77a4:	27 5f 09 00 	ld.w	8[r7], r11
    77a8:	eb 61       	cmp	r11, r12
    77aa:	ef e5       	bgt	7776 <___fpcmp_parts_d+0x2c>
    77ac:	b6 15       	blt	77d2 <___fpcmp_parts_d+0x88>
    77ae:	26 5f 11 00 	ld.w	16[r6], r11
    77b2:	27 67 11 00 	ld.w	16[r7], r12
    77b6:	26 6f 0d 00 	ld.w	12[r6], r13
    77ba:	27 77 0d 00 	ld.w	12[r7], r14
    77be:	ec 59       	cmp	r12, r11
    77c0:	bb dd       	bh	7776 <___fpcmp_parts_d+0x2c>
    77c2:	ba 05       	bne	77c8 <___fpcmp_parts_d+0x7e>
    77c4:	ee 69       	cmp	r14, r13
    77c6:	8b dd       	bh	7776 <___fpcmp_parts_d+0x2c>
    77c8:	eb 61       	cmp	r11, r12
    77ca:	cb 05       	bh	77d2 <___fpcmp_parts_d+0x88>
    77cc:	8a 0d       	bne	77dc <___fpcmp_parts_d+0x92>
    77ce:	ed 71       	cmp	r13, r14
    77d0:	e3 05       	bnh	77dc <___fpcmp_parts_d+0x92>
    77d2:	1f 5a       	mov	-1, r11
    77d4:	60 52       	cmp	0, r10
    77d6:	e1 5f 14 53 	cmov	nz, 1, r11, r10
    77da:	7f 00       	jmp	[lp]
    77dc:	00 52       	mov	0, r10
    77de:	7f 00       	jmp	[lp]
    77e0:	01 52       	mov	1, r10
    77e2:	7f 00       	jmp	[lp]
    77e4:	64 5a       	cmp	4, r11
    77e6:	ea d5       	bne	7792 <___fpcmp_parts_d+0x48>
    77e8:	27 57 05 00 	ld.w	4[r7], r10
    77ec:	26 5f 05 00 	ld.w	4[r6], r11
    77f0:	ab 51       	sub	r11, r10
    77f2:	7f 00       	jmp	[lp]

000077f4 <___lshrdi3>:
    77f4:	06 50       	mov	r6, r10
    77f6:	07 58       	mov	r7, r11
    77f8:	60 42       	cmp	0, r8
    77fa:	a2 15       	be	781e <___lshrdi3+0x2a>
    77fc:	20 66 20 00 	movea	32, r0, r12
    7800:	a8 61       	sub	r8, r12
    7802:	60 62       	cmp	0, r12
    7804:	e7 0d       	ble	7820 <___lshrdi3+0x2c>
    7806:	07 68       	mov	r7, r13
    7808:	e8 57 80 00 	shr	r8, r10
    780c:	ec 6f c0 00 	shl	r12, r13
    7810:	0d 60       	mov	r13, r12
    7812:	07 68       	mov	r7, r13
    7814:	e8 6f 80 00 	shr	r8, r13
    7818:	0a 61       	or	r10, r12
    781a:	0c 50       	mov	r12, r10
    781c:	0d 58       	mov	r13, r11
    781e:	7f 00       	jmp	[lp]
    7820:	80 61       	subr	r0, r12
    7822:	00 6a       	mov	0, r13
    7824:	ec 5f 80 00 	shr	r12, r11
    7828:	0b 60       	mov	r11, r12
    782a:	85 fd       	br	781a <___lshrdi3+0x26>

0000782c <___ashldi3>:
    782c:	06 50       	mov	r6, r10
    782e:	07 58       	mov	r7, r11
    7830:	60 42       	cmp	0, r8
    7832:	a2 15       	be	7856 <___ashldi3+0x2a>
    7834:	20 66 20 00 	movea	32, r0, r12
    7838:	a8 61       	sub	r8, r12
    783a:	60 62       	cmp	0, r12
    783c:	e7 0d       	ble	7858 <___ashldi3+0x2c>
    783e:	06 68       	mov	r6, r13
    7840:	e8 5f c0 00 	shl	r8, r11
    7844:	ec 6f 80 00 	shr	r12, r13
    7848:	0d 60       	mov	r13, r12
    784a:	06 68       	mov	r6, r13
    784c:	e8 6f c0 00 	shl	r8, r13
    7850:	0b 61       	or	r11, r12
    7852:	0d 50       	mov	r13, r10
    7854:	0c 58       	mov	r12, r11
    7856:	7f 00       	jmp	[lp]
    7858:	80 61       	subr	r0, r12
    785a:	00 6a       	mov	0, r13
    785c:	ec 57 c0 00 	shl	r12, r10
    7860:	0a 60       	mov	r10, r12
    7862:	85 fd       	br	7852 <___ashldi3+0x26>

Disassembly of section .call_table_text:

0000788c <.call_table_text>:
    788c:	80 07 e1 ff 	prepare	{r20 - r29, lp}, 0
    7890:	e0 07 44 01 	ctret	
    7894:	40 06 ff ff 	dispose	0, {r20 - r29, lp}, [lp]
    7898:	80 07 e1 f3 	prepare	{r22 - r29, lp}, 0
    789c:	e0 07 44 01 	ctret	
    78a0:	40 06 ff f3 	dispose	0, {r22 - r29, lp}, [lp]
    78a4:	80 07 e1 f1 	prepare	{r23 - r29, lp}, 0
    78a8:	e0 07 44 01 	ctret	
    78ac:	40 06 ff f1 	dispose	0, {r23 - r29, lp}, [lp]
    78b0:	80 07 e1 f0 	prepare	{r24 - r29, lp}, 0
    78b4:	e0 07 44 01 	ctret	
    78b8:	40 06 ff f0 	dispose	0, {r24 - r29, lp}, [lp]
    78bc:	80 07 e1 70 	prepare	{r25 - r29, lp}, 0
    78c0:	e0 07 44 01 	ctret	
    78c4:	40 06 ff 70 	dispose	0, {r25 - r29, lp}, [lp]
    78c8:	80 07 e1 30 	prepare	{r26 - r29, lp}, 0
    78cc:	e0 07 44 01 	ctret	
    78d0:	40 06 ff 30 	dispose	0, {r26 - r29, lp}, [lp]
    78d4:	80 07 e1 10 	prepare	{r27 - r29, lp}, 0
    78d8:	e0 07 44 01 	ctret	
    78dc:	40 06 ff 10 	dispose	0, {r27 - r29, lp}, [lp]
    78e0:	80 07 e1 00 	prepare	{r28 - r29, lp}, 0
    78e4:	e0 07 44 01 	ctret	
    78e8:	40 06 ff 00 	dispose	0, {r28 - r29, lp}, [lp]
    78ec:	80 07 61 00 	prepare	{r29, lp}, 0
    78f0:	e0 07 44 01 	ctret	
    78f4:	40 06 7f 00 	dispose	0, {r29, lp}, [lp]
    78f8:	80 07 21 00 	prepare	{lp}, 0
    78fc:	e0 07 44 01 	ctret	
    7900:	40 06 3f 00 	dispose	0, {lp}, [lp]
