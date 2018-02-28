
loop_test.o:     file format elf32-v850


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
 2a8:	26 06 30 04 	mov	0x430, r6
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
 2d8:	80 ff fe 00 	jarl	3d6 <___main>, lp
 2dc:	03 1e f0 ff 	addi	-16, sp, sp
 2e0:	00 32       	mov	0, r6
 2e2:	00 3a       	mov	0, r7
 2e4:	00 42       	mov	0, r8
 2e6:	80 ff 0a 00 	jarl	2f0 <_main>, lp
 2ea:	0a 30       	mov	r10, r6
 2ec:	80 ff ae 00 	jarl	39a <_exit>, lp

000002f0 <_main>:
 2f0:	58 1a       	add	-8, sp
 2f2:	63 ff 05 00 	st.w	lp, 4[sp]
 2f6:	63 ef 01 00 	st.w	r29, 0[sp]
 2fa:	03 1e ac ff 	addi	-84, sp, sp
 2fe:	03 e8       	mov	sp, r29
 300:	2a 06 40 04 	mov	0x440, r10
 304:	00 00
 306:	1d 60       	mov	r29, r12
 308:	0a 58       	mov	r10, r11
 30a:	20 56 50 00 	movea	80, r0, r10
 30e:	0c 30       	mov	r12, r6
 310:	0b 38       	mov	r11, r7
 312:	0a 40       	mov	r10, r8
 314:	2a 06 16 04 	mov	0x416, r10
 318:	00 00
 31a:	ea c7 60 f9 	jarl	[r10], lp
 31e:	7d 07 51 00 	st.w	r0, 80[r29]
 322:	f5 2d       	br	380 <_main+0x90>
 324:	3d 57 51 00 	ld.w	80[r29], r10
 328:	c3 52       	shl	3, r10
 32a:	20 5e 54 00 	movea	84, r0, r11
 32e:	dd 59       	add	r29, r11
 330:	cb 51       	add	r11, r10
 332:	0a 56 ac ff 	addi	-84, r10, r10
 336:	2a 67 01 00 	ld.w	0[r10], r12
 33a:	2a 6f 05 00 	ld.w	4[r10], r13
 33e:	3d 57 51 00 	ld.w	80[r29], r10
 342:	c3 52       	shl	3, r10
 344:	20 5e 54 00 	movea	84, r0, r11
 348:	dd 59       	add	r29, r11
 34a:	cb 51       	add	r11, r10
 34c:	0a 76 ac ff 	addi	-84, r10, r14
 350:	2e 57 01 00 	ld.w	0[r14], r10
 354:	2e 5f 05 00 	ld.w	4[r14], r11
 358:	ec 57 70 54 	addf.d	r12, r10, r10
 35c:	3d 67 51 00 	ld.w	80[r29], r12
 360:	c3 62       	shl	3, r12
 362:	20 6e 54 00 	movea	84, r0, r13
 366:	dd 69       	add	r29, r13
 368:	cd 61       	add	r13, r12
 36a:	0c 66 ac ff 	addi	-84, r12, r12
 36e:	6c 57 01 00 	st.w	r10, 0[r12]
 372:	6c 5f 05 00 	st.w	r11, 4[r12]
 376:	3d 57 51 00 	ld.w	80[r29], r10
 37a:	41 52       	add	1, r10
 37c:	7d 57 51 00 	st.w	r10, 80[r29]
 380:	3d 57 51 00 	ld.w	80[r29], r10
 384:	69 52       	cmp	9, r10
 386:	f7 cd       	ble	324 <_main+0x34>
 388:	00 52       	mov	0, r10
 38a:	1d 18       	mov	r29, sp
 38c:	23 ff 59 00 	ld.w	88[sp], lp
 390:	23 ef 55 00 	ld.w	84[sp], r29
 394:	03 1e 5c 00 	addi	92, sp, sp
 398:	7f 00       	jmp	[lp]

0000039a <_exit>:
 39a:	58 1a       	add	-8, sp
 39c:	63 ff 05 00 	st.w	lp, 4[sp]
 3a0:	63 ef 01 00 	st.w	r29, 0[sp]
 3a4:	5c 1a       	add	-4, sp
 3a6:	03 e8       	mov	sp, r29
 3a8:	7d 37 01 00 	st.w	r6, 0[r29]
 3ac:	2a 06 fc 7f 	mov	0xffff7ffc, r10
 3b0:	ff ff
 3b2:	3d 5f 01 00 	ld.w	0[r29], r11
 3b6:	cb 00       	zxh	r11
 3b8:	6a 5f 00 00 	st.h	r11, 0[r10]
 3bc:	2a 06 fe 7f 	mov	0xffff7ffe, r10
 3c0:	ff ff
 3c2:	20 5e 10 00 	movea	16, r0, r11
 3c6:	6a 5f 00 00 	st.h	r11, 0[r10]
 3ca:	2a 06 86 02 	mov	0x286, r10
 3ce:	00 00
 3d0:	ea c7 60 f9 	jarl	[r10], lp
 3d4:	b5 fd       	br	3ca <_exit+0x30>

000003d6 <___main>:
 3d6:	00 02       	callt	0
 3d8:	2a 06 04 00 	mov	0xfedf0004, r10
 3dc:	df fe
 3de:	2a 57 01 00 	ld.w	0[r10], r10
 3e2:	60 52       	cmp	0, r10
 3e4:	8a 1d       	bne	414 <___main+0x3e>
 3e6:	01 5a       	mov	1, r11
 3e8:	2a 06 04 00 	mov	0xfedf0004, r10
 3ec:	df fe
 3ee:	6a 5f 01 00 	st.w	r11, 0[r10]
 3f2:	2a 06 04 00 	mov	0xfedf0004, r10
 3f6:	df fe
 3f8:	2b 06 04 00 	mov	0xfedf0004, r11
 3fc:	df fe
 3fe:	ea 59       	cmp	r10, r11
 400:	a3 0d       	bnh	414 <___main+0x3e>
 402:	0b e8       	mov	r11, r29
 404:	0a e0       	mov	r10, r28
 406:	3d 57 fd ff 	ld.w	-4[r29], r10
 40a:	ea c7 60 f9 	jarl	[r10], lp
 40e:	5c ea       	add	-4, r29
 410:	fc e9       	cmp	r28, r29
 412:	ab fd       	bh	406 <___main+0x30>
 414:	01 02       	callt	1

00000416 <_memcpy>:
 416:	06 50       	mov	r6, r10
 418:	60 42       	cmp	0, r8
 41a:	a2 0d       	be	42e <_memcpy+0x18>
 41c:	06 58       	mov	r6, r11
 41e:	07 67 00 00 	ld.b	0[r7], r12
 422:	4b 67 00 00 	st.b	r12, 0[r11]
 426:	41 5a       	add	1, r11
 428:	41 3a       	add	1, r7
 42a:	5f 42       	add	-1, r8
 42c:	9a fd       	bne	41e <_memcpy+0x8>
 42e:	7f 00       	jmp	[lp]

Disassembly of section .call_table_text:

00000434 <.call_table_text>:
 434:	80 07 e1 00 	prepare	{r28 - r29, lp}, 0
 438:	e0 07 44 01 	ctret
 43c:	40 06 ff 00 	dispose	0, {r28 - r29, lp}, [lp]
