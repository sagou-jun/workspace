
MergeSort.o:     file format elf32-v850


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
 29c:	3e 06 04 00 	mov	0xfedf0004, ep
 2a0:	df fe 
 2a2:	24 06 04 80 	mov	0xfedf8004, gp
 2a6:	df fe 
 2a8:	26 06 c8 06 	mov	0x6c8, r6
 2ac:	00 00 
 2ae:	e6 a7 20 00 	ldsr	r6, sr20, 0
 2b2:	e5 37 40 00 	stsr	sr5, r6, 0
 2b6:	40 3e 03 00 	movhi	3, r0, r7
 2ba:	07 31       	or	r7, r6
 2bc:	e6 2f 20 00 	ldsr	r6, sr5, 0
 2c0:	26 06 04 00 	mov	0xfedf0004, r6
 2c4:	df fe 
 2c6:	27 06 08 00 	mov	0xfedf0008, r7
 2ca:	df fe 
 2cc:	66 07 01 00 	st.w	r0, 0[r6]
 2d0:	06 36 04 00 	addi	4, r6, r6
 2d4:	e7 31       	cmp	r7, r6
 2d6:	b1 fd       	bl	2cc <_start+0x40>
 2d8:	80 ff b0 03 	jarl	688 <___main>, lp
 2dc:	03 1e f0 ff 	addi	-16, sp, sp
 2e0:	00 32       	mov	0, r6
 2e2:	00 3a       	mov	0, r7
 2e4:	00 42       	mov	0, r8
 2e6:	80 ff 0a 00 	jarl	2f0 <_main>, lp
 2ea:	0a 30       	mov	r10, r6
 2ec:	80 ff 60 03 	jarl	64c <_exit>, lp

000002f0 <_main>:
 2f0:	58 1a       	add	-8, sp
 2f2:	63 ff 05 00 	st.w	lp, 4[sp]
 2f6:	63 ef 01 00 	st.w	r29, 0[sp]
 2fa:	03 1e 6c fe 	addi	-404, sp, sp
 2fe:	03 e8       	mov	sp, r29
 300:	7d 07 91 01 	st.w	r0, 400[r29]
 304:	d5 1d       	br	33e <_main+0x4e>
 306:	3d 57 91 01 	ld.w	400[r29], r10
 30a:	e0 57 52 54 	cvtf.wd	r10, r10
 30e:	0a 30       	mov	r10, r6
 310:	0b 38       	mov	r11, r7
 312:	2a 06 70 03 	mov	0x370, r10
 316:	00 00 
 318:	ea c7 60 f9 	jarl	[r10], lp
 31c:	0a 58       	mov	r10, r11
 31e:	3d 57 91 01 	ld.w	400[r29], r10
 322:	c2 52       	shl	2, r10
 324:	20 66 94 01 	movea	404, r0, r12
 328:	dd 61       	add	r29, r12
 32a:	cc 51       	add	r12, r10
 32c:	0a 56 6c fe 	addi	-404, r10, r10
 330:	6a 5f 01 00 	st.w	r11, 0[r10]
 334:	3d 57 91 01 	ld.w	400[r29], r10
 338:	41 52       	add	1, r10
 33a:	7d 57 91 01 	st.w	r10, 400[r29]
 33e:	3d 5f 91 01 	ld.w	400[r29], r11
 342:	20 56 63 00 	movea	99, r0, r10
 346:	ea 59       	cmp	r10, r11
 348:	f7 dd       	ble	306 <_main+0x16>
 34a:	1d 50       	mov	r29, r10
 34c:	0a 30       	mov	r10, r6
 34e:	00 3a       	mov	0, r7
 350:	20 46 63 00 	movea	99, r0, r8
 354:	2a 06 f6 03 	mov	0x3f6, r10
 358:	00 00 
 35a:	ea c7 60 f9 	jarl	[r10], lp
 35e:	00 52       	mov	0, r10
 360:	1d 18       	mov	r29, sp
 362:	23 ff 99 01 	ld.w	408[sp], lp
 366:	23 ef 95 01 	ld.w	404[sp], r29
 36a:	03 1e 9c 01 	addi	412, sp, sp
 36e:	7f 00       	jmp	[lp]

00000370 <_data>:
 370:	5c 1a       	add	-4, sp
 372:	63 ef 01 00 	st.w	r29, 0[sp]
 376:	58 1a       	add	-8, sp
 378:	03 e8       	mov	sp, r29
 37a:	bd 07 0f 30 	st.dw	r6, 0[r29]
 37e:	00 00 
 380:	3d 67 01 00 	ld.w	0[r29], r12
 384:	3d 6f 05 00 	ld.w	4[r29], r13
 388:	3d 57 01 00 	ld.w	0[r29], r10
 38c:	3d 5f 05 00 	ld.w	4[r29], r11
 390:	ec 57 74 64 	mulf.d	r12, r10, r12
 394:	3d 57 01 00 	ld.w	0[r29], r10
 398:	3d 5f 05 00 	ld.w	4[r29], r11
 39c:	e1 57 50 5c 	trncf.dw	r10, r11
 3a0:	0d 52       	mov	13, r10
 3a2:	ea 5f c0 52 	div	r10, r11, r10
 3a6:	e0 57 52 54 	cvtf.wd	r10, r10
 3aa:	ec 57 74 74 	mulf.d	r12, r10, r14
 3ae:	3d 67 01 00 	ld.w	0[r29], r12
 3b2:	3d 6f 05 00 	ld.w	4[r29], r13
 3b6:	3d 57 01 00 	ld.w	0[r29], r10
 3ba:	3d 5f 05 00 	ld.w	4[r29], r11
 3be:	ec 57 74 64 	mulf.d	r12, r10, r12
 3c2:	00 52       	mov	0, r10
 3c4:	2b 06 00 40 	mov	0x408f4000, r11
 3c8:	8f 40 
 3ca:	ec 57 70 54 	addf.d	r12, r10, r10
 3ce:	ea 77 7e 64 	divf.d	r10, r14, r12
 3d2:	00 52       	mov	0, r10
 3d4:	40 5e 59 40 	movhi	16473, r0, r11
 3d8:	ec 57 74 64 	mulf.d	r12, r10, r12
 3dc:	3d 57 01 00 	ld.w	0[r29], r10
 3e0:	3d 5f 05 00 	ld.w	4[r29], r11
 3e4:	ec 57 70 54 	addf.d	r12, r10, r10
 3e8:	e1 57 50 54 	trncf.dw	r10, r10
 3ec:	1d 18       	mov	r29, sp
 3ee:	23 ef 09 00 	ld.w	8[sp], r29
 3f2:	4c 1a       	add	12, sp
 3f4:	7f 00       	jmp	[lp]

000003f6 <_MergeSort>:
 3f6:	58 1a       	add	-8, sp
 3f8:	63 ff 05 00 	st.w	lp, 4[sp]
 3fc:	63 ef 01 00 	st.w	r29, 0[sp]
 400:	03 1e 54 fe 	addi	-428, sp, sp
 404:	03 e8       	mov	sp, r29
 406:	7d 37 09 00 	st.w	r6, 8[r29]
 40a:	7d 3f 05 00 	st.w	r7, 4[r29]
 40e:	7d 47 01 00 	st.w	r8, 0[r29]
 412:	3d 5f 05 00 	ld.w	4[r29], r11
 416:	3d 57 01 00 	ld.w	0[r29], r10
 41a:	ea 59       	cmp	r10, r11
 41c:	ee 07 1f 02 	bge	63a <_MergeSort+0x244>
 420:	3d 5f 05 00 	ld.w	4[r29], r11
 424:	3d 57 01 00 	ld.w	0[r29], r10
 428:	cb 51       	add	r11, r10
 42a:	0a 58       	mov	r10, r11
 42c:	9f 5a       	shr	31, r11
 42e:	cb 51       	add	r11, r10
 430:	a1 52       	sar	1, r10
 432:	7d 57 9d 01 	st.w	r10, 412[r29]
 436:	3d 37 09 00 	ld.w	8[r29], r6
 43a:	3d 3f 05 00 	ld.w	4[r29], r7
 43e:	3d 47 9d 01 	ld.w	412[r29], r8
 442:	2a 06 f6 03 	mov	0x3f6, r10
 446:	00 00 
 448:	ea c7 60 f9 	jarl	[r10], lp
 44c:	3d 57 9d 01 	ld.w	412[r29], r10
 450:	41 52       	add	1, r10
 452:	3d 37 09 00 	ld.w	8[r29], r6
 456:	0a 38       	mov	r10, r7
 458:	3d 47 01 00 	ld.w	0[r29], r8
 45c:	2a 06 f6 03 	mov	0x3f6, r10
 460:	00 00 
 462:	ea c7 60 f9 	jarl	[r10], lp
 466:	3d 57 05 00 	ld.w	4[r29], r10
 46a:	7d 57 a9 01 	st.w	r10, 424[r29]
 46e:	95 1d       	br	4a0 <_MergeSort+0xaa>
 470:	3d 57 a9 01 	ld.w	424[r29], r10
 474:	c2 52       	shl	2, r10
 476:	3d 5f 09 00 	ld.w	8[r29], r11
 47a:	cb 51       	add	r11, r10
 47c:	2a 5f 01 00 	ld.w	0[r10], r11
 480:	3d 57 a9 01 	ld.w	424[r29], r10
 484:	c2 52       	shl	2, r10
 486:	20 66 ac 01 	movea	428, r0, r12
 48a:	dd 61       	add	r29, r12
 48c:	cc 51       	add	r12, r10
 48e:	0a 56 60 fe 	addi	-416, r10, r10
 492:	6a 5f 01 00 	st.w	r11, 0[r10]
 496:	3d 57 a9 01 	ld.w	424[r29], r10
 49a:	41 52       	add	1, r10
 49c:	7d 57 a9 01 	st.w	r10, 424[r29]
 4a0:	3d 5f a9 01 	ld.w	424[r29], r11
 4a4:	3d 57 9d 01 	ld.w	412[r29], r10
 4a8:	ea 59       	cmp	r10, r11
 4aa:	b7 e5       	ble	470 <_MergeSort+0x7a>
 4ac:	3d 57 9d 01 	ld.w	412[r29], r10
 4b0:	41 52       	add	1, r10
 4b2:	7d 57 a9 01 	st.w	r10, 424[r29]
 4b6:	95 1d       	br	4e8 <_MergeSort+0xf2>
 4b8:	3d 57 a9 01 	ld.w	424[r29], r10
 4bc:	c2 52       	shl	2, r10
 4be:	3d 5f 09 00 	ld.w	8[r29], r11
 4c2:	cb 51       	add	r11, r10
 4c4:	2a 5f 01 00 	ld.w	0[r10], r11
 4c8:	3d 57 a9 01 	ld.w	424[r29], r10
 4cc:	c2 52       	shl	2, r10
 4ce:	20 66 ac 01 	movea	428, r0, r12
 4d2:	dd 61       	add	r29, r12
 4d4:	cc 51       	add	r12, r10
 4d6:	0a 56 60 fe 	addi	-416, r10, r10
 4da:	6a 5f 01 00 	st.w	r11, 0[r10]
 4de:	3d 57 a9 01 	ld.w	424[r29], r10
 4e2:	41 52       	add	1, r10
 4e4:	7d 57 a9 01 	st.w	r10, 424[r29]
 4e8:	3d 5f a9 01 	ld.w	424[r29], r11
 4ec:	3d 57 01 00 	ld.w	0[r29], r10
 4f0:	ea 59       	cmp	r10, r11
 4f2:	b7 e5       	ble	4b8 <_MergeSort+0xc2>
 4f4:	3d 57 05 00 	ld.w	4[r29], r10
 4f8:	7d 57 a9 01 	st.w	r10, 424[r29]
 4fc:	3d 57 9d 01 	ld.w	412[r29], r10
 500:	41 52       	add	1, r10
 502:	7d 57 a5 01 	st.w	r10, 420[r29]
 506:	3d 57 05 00 	ld.w	4[r29], r10
 50a:	7d 57 a1 01 	st.w	r10, 416[r29]
 50e:	80 07 1c 01 	jr	62a <_MergeSort+0x234>
 512:	3d 5f a9 01 	ld.w	424[r29], r11
 516:	3d 57 9d 01 	ld.w	412[r29], r10
 51a:	ea 59       	cmp	r10, r11
 51c:	a7 1d       	ble	550 <_MergeSort+0x15a>
 51e:	3d 57 a1 01 	ld.w	416[r29], r10
 522:	c2 52       	shl	2, r10
 524:	3d 5f 09 00 	ld.w	8[r29], r11
 528:	cb 51       	add	r11, r10
 52a:	3d 5f a5 01 	ld.w	420[r29], r11
 52e:	c2 5a       	shl	2, r11
 530:	20 66 ac 01 	movea	428, r0, r12
 534:	dd 61       	add	r29, r12
 536:	cc 59       	add	r12, r11
 538:	0b 5e 60 fe 	addi	-416, r11, r11
 53c:	2b 5f 01 00 	ld.w	0[r11], r11
 540:	6a 5f 01 00 	st.w	r11, 0[r10]
 544:	3d 57 a5 01 	ld.w	420[r29], r10
 548:	41 52       	add	1, r10
 54a:	7d 57 a5 01 	st.w	r10, 420[r29]
 54e:	95 6d       	br	620 <_MergeSort+0x22a>
 550:	3d 5f a5 01 	ld.w	420[r29], r11
 554:	3d 57 01 00 	ld.w	0[r29], r10
 558:	ea 59       	cmp	r10, r11
 55a:	a7 1d       	ble	58e <_MergeSort+0x198>
 55c:	3d 57 a1 01 	ld.w	416[r29], r10
 560:	c2 52       	shl	2, r10
 562:	3d 5f 09 00 	ld.w	8[r29], r11
 566:	cb 51       	add	r11, r10
 568:	3d 5f a9 01 	ld.w	424[r29], r11
 56c:	c2 5a       	shl	2, r11
 56e:	20 66 ac 01 	movea	428, r0, r12
 572:	dd 61       	add	r29, r12
 574:	cc 59       	add	r12, r11
 576:	0b 5e 60 fe 	addi	-416, r11, r11
 57a:	2b 5f 01 00 	ld.w	0[r11], r11
 57e:	6a 5f 01 00 	st.w	r11, 0[r10]
 582:	3d 57 a9 01 	ld.w	424[r29], r10
 586:	41 52       	add	1, r10
 588:	7d 57 a9 01 	st.w	r10, 424[r29]
 58c:	a5 4d       	br	620 <_MergeSort+0x22a>
 58e:	3d 57 a9 01 	ld.w	424[r29], r10
 592:	c2 52       	shl	2, r10
 594:	20 5e ac 01 	movea	428, r0, r11
 598:	dd 59       	add	r29, r11
 59a:	cb 51       	add	r11, r10
 59c:	0a 56 60 fe 	addi	-416, r10, r10
 5a0:	2a 5f 01 00 	ld.w	0[r10], r11
 5a4:	3d 57 a5 01 	ld.w	420[r29], r10
 5a8:	c2 52       	shl	2, r10
 5aa:	20 66 ac 01 	movea	428, r0, r12
 5ae:	dd 61       	add	r29, r12
 5b0:	cc 51       	add	r12, r10
 5b2:	0a 56 60 fe 	addi	-416, r10, r10
 5b6:	2a 57 01 00 	ld.w	0[r10], r10
 5ba:	ea 59       	cmp	r10, r11
 5bc:	af 1d       	bgt	5f0 <_MergeSort+0x1fa>
 5be:	3d 57 a1 01 	ld.w	416[r29], r10
 5c2:	c2 52       	shl	2, r10
 5c4:	3d 5f 09 00 	ld.w	8[r29], r11
 5c8:	cb 51       	add	r11, r10
 5ca:	3d 5f a9 01 	ld.w	424[r29], r11
 5ce:	c2 5a       	shl	2, r11
 5d0:	20 66 ac 01 	movea	428, r0, r12
 5d4:	dd 61       	add	r29, r12
 5d6:	cc 59       	add	r12, r11
 5d8:	0b 5e 60 fe 	addi	-416, r11, r11
 5dc:	2b 5f 01 00 	ld.w	0[r11], r11
 5e0:	6a 5f 01 00 	st.w	r11, 0[r10]
 5e4:	3d 57 a9 01 	ld.w	424[r29], r10
 5e8:	41 52       	add	1, r10
 5ea:	7d 57 a9 01 	st.w	r10, 424[r29]
 5ee:	95 1d       	br	620 <_MergeSort+0x22a>
 5f0:	3d 57 a1 01 	ld.w	416[r29], r10
 5f4:	c2 52       	shl	2, r10
 5f6:	3d 5f 09 00 	ld.w	8[r29], r11
 5fa:	cb 51       	add	r11, r10
 5fc:	3d 5f a5 01 	ld.w	420[r29], r11
 600:	c2 5a       	shl	2, r11
 602:	20 66 ac 01 	movea	428, r0, r12
 606:	dd 61       	add	r29, r12
 608:	cc 59       	add	r12, r11
 60a:	0b 5e 60 fe 	addi	-416, r11, r11
 60e:	2b 5f 01 00 	ld.w	0[r11], r11
 612:	6a 5f 01 00 	st.w	r11, 0[r10]
 616:	3d 57 a5 01 	ld.w	420[r29], r10
 61a:	41 52       	add	1, r10
 61c:	7d 57 a5 01 	st.w	r10, 420[r29]
 620:	3d 57 a1 01 	ld.w	416[r29], r10
 624:	41 52       	add	1, r10
 626:	7d 57 a1 01 	st.w	r10, 416[r29]
 62a:	3d 5f a1 01 	ld.w	416[r29], r11
 62e:	3d 57 01 00 	ld.w	0[r29], r10
 632:	ea 59       	cmp	r10, r11
 634:	f7 07 df fe 	ble	512 <_MergeSort+0x11c>
 638:	a5 05       	br	63c <_MergeSort+0x246>
 63a:	00 00       	nop	
 63c:	1d 18       	mov	r29, sp
 63e:	23 ff b1 01 	ld.w	432[sp], lp
 642:	23 ef ad 01 	ld.w	428[sp], r29
 646:	03 1e b4 01 	addi	436, sp, sp
 64a:	7f 00       	jmp	[lp]

0000064c <_exit>:
 64c:	58 1a       	add	-8, sp
 64e:	63 ff 05 00 	st.w	lp, 4[sp]
 652:	63 ef 01 00 	st.w	r29, 0[sp]
 656:	5c 1a       	add	-4, sp
 658:	03 e8       	mov	sp, r29
 65a:	7d 37 01 00 	st.w	r6, 0[r29]
 65e:	2a 06 fc 7f 	mov	0xffff7ffc, r10
 662:	ff ff 
 664:	3d 5f 01 00 	ld.w	0[r29], r11
 668:	cb 00       	zxh	r11
 66a:	6a 5f 00 00 	st.h	r11, 0[r10]
 66e:	2a 06 fe 7f 	mov	0xffff7ffe, r10
 672:	ff ff 
 674:	20 5e 10 00 	movea	16, r0, r11
 678:	6a 5f 00 00 	st.h	r11, 0[r10]
 67c:	2a 06 86 02 	mov	0x286, r10
 680:	00 00 
 682:	ea c7 60 f9 	jarl	[r10], lp
 686:	b5 fd       	br	67c <_exit+0x30>

00000688 <___main>:
 688:	00 02       	callt	0
 68a:	2a 06 04 00 	mov	0xfedf0004, r10
 68e:	df fe 
 690:	2a 57 01 00 	ld.w	0[r10], r10
 694:	60 52       	cmp	0, r10
 696:	8a 1d       	bne	6c6 <___main+0x3e>
 698:	01 5a       	mov	1, r11
 69a:	2a 06 04 00 	mov	0xfedf0004, r10
 69e:	df fe 
 6a0:	6a 5f 01 00 	st.w	r11, 0[r10]
 6a4:	2a 06 04 00 	mov	0xfedf0004, r10
 6a8:	df fe 
 6aa:	2b 06 04 00 	mov	0xfedf0004, r11
 6ae:	df fe 
 6b0:	ea 59       	cmp	r10, r11
 6b2:	a3 0d       	bnh	6c6 <___main+0x3e>
 6b4:	0b e8       	mov	r11, r29
 6b6:	0a e0       	mov	r10, r28
 6b8:	3d 57 fd ff 	ld.w	-4[r29], r10
 6bc:	ea c7 60 f9 	jarl	[r10], lp
 6c0:	5c ea       	add	-4, r29
 6c2:	fc e9       	cmp	r28, r29
 6c4:	ab fd       	bh	6b8 <___main+0x30>
 6c6:	01 02       	callt	1

Disassembly of section .call_table_text:

000006cc <.call_table_text>:
 6cc:	80 07 e1 00 	prepare	{r28 - r29, lp}, 0
 6d0:	e0 07 44 01 	ctret	
 6d4:	40 06 ff 00 	dispose	0, {r28 - r29, lp}, [lp]
