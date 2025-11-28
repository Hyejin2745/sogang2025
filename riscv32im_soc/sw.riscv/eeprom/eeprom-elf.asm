
eeprom.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00003197          	auipc	gp,0x3
       4:	a5818193          	addi	gp,gp,-1448 # 2a58 <__global_pointer$>
       8:	00020117          	auipc	sp,0x20
       c:	ff810113          	addi	sp,sp,-8 # 20000 <_memory_end>
      10:	47018e13          	addi	t3,gp,1136 # 2ec8 <_bss_end>
      14:	47018e93          	addi	t4,gp,1136 # 2ec8 <_bss_end>
      18:	00c0006f          	j	24 <clear_bss_end>

0000001c <clear_bss32>:
      1c:	000e2023          	sw	zero,0(t3)
      20:	004e0e13          	addi	t3,t3,4

00000024 <clear_bss_end>:
      24:	ffde6ce3          	bltu	t3,t4,1c <clear_bss32>

00000028 <main_entry>:
      28:	00000513          	li	a0,0
      2c:	00000593          	li	a1,0
      30:	018000ef          	jal	48 <main>
      34:	00040513          	mv	a0,s0

00000038 <terminate>:
      38:	00100293          	li	t0,1
      3c:	42018313          	addi	t1,gp,1056 # 2e78 <tohost>
      40:	00532023          	sw	t0,0(t1)
      44:	0000006f          	j	44 <terminate+0xc>

00000048 <main>:
      48:	fd010113          	addi	sp,sp,-48
      4c:	02112623          	sw	ra,44(sp)
      50:	02812423          	sw	s0,40(sp)
      54:	03010413          	addi	s0,sp,48
      58:	00100713          	li	a4,1
      5c:	00000693          	li	a3,0
      60:	00800613          	li	a2,8
      64:	0001c7b7          	lui	a5,0x1c
      68:	20078593          	addi	a1,a5,512 # 1c200 <_bss_end+0x19338>
      6c:	00000513          	li	a0,0
      70:	059000ef          	jal	8c8 <uart_init>
      74:	00018513          	mv	a0,gp
      78:	224000ef          	jal	29c <my_printf>
      7c:	90040537          	lui	a0,0x90040
      80:	2f8010ef          	jal	1378 <i2c_set_addr>
      84:	1bc010ef          	jal	1240 <i2c_init>
      88:	00c18513          	addi	a0,gp,12 # 2a64 <__global_pointer$+0xc>
      8c:	210000ef          	jal	29c <my_printf>
      90:	05700793          	li	a5,87
      94:	fef407a3          	sb	a5,-17(s0)
      98:	fe040723          	sb	zero,-18(s0)
      9c:	112237b7          	lui	a5,0x11223
      a0:	34478793          	addi	a5,a5,836 # 11223344 <_memory_end+0x11203344>
      a4:	fef42423          	sw	a5,-24(s0)
      a8:	20c010ef          	jal	12b4 <i2c_csr>
      ac:	fef44783          	lbu	a5,-17(s0)
      b0:	fee44703          	lbu	a4,-18(s0)
      b4:	fe842683          	lw	a3,-24(s0)
      b8:	00070613          	mv	a2,a4
      bc:	00078593          	mv	a1,a5
      c0:	02c18513          	addi	a0,gp,44 # 2a84 <__global_pointer$+0x2c>
      c4:	1d8000ef          	jal	29c <my_printf>
      c8:	fe842503          	lw	a0,-24(s0)
      cc:	6d1000ef          	jal	f9c <i2c_write_data>
      d0:	fee44583          	lbu	a1,-18(s0)
      d4:	fef44783          	lbu	a5,-17(s0)
      d8:	00000713          	li	a4,0
      dc:	00000693          	li	a3,0
      e0:	00000613          	li	a2,0
      e4:	00078513          	mv	a0,a5
      e8:	77d000ef          	jal	1064 <i2c_start_simple>
      ec:	fdb40713          	addi	a4,s0,-37
      f0:	fdc40793          	addi	a5,s0,-36
      f4:	00070593          	mv	a1,a4
      f8:	00078513          	mv	a0,a5
      fc:	701000ef          	jal	ffc <i2c_get_status_and_state>
     100:	fdc42583          	lw	a1,-36(s0)
     104:	fdc42783          	lw	a5,-36(s0)
     108:	0017f613          	andi	a2,a5,1
     10c:	fdc42783          	lw	a5,-36(s0)
     110:	0017d793          	srli	a5,a5,0x1
     114:	0017f793          	andi	a5,a5,1
     118:	fdb44703          	lbu	a4,-37(s0)
     11c:	00078693          	mv	a3,a5
     120:	06018513          	addi	a0,gp,96 # 2ab8 <__global_pointer$+0x60>
     124:	178000ef          	jal	29c <my_printf>
     128:	fe442583          	lw	a1,-28(s0)
     12c:	900407b7          	lui	a5,0x90040
     130:	00878513          	addi	a0,a5,8 # 90040008 <_memory_end+0x90020008>
     134:	699000ef          	jal	fcc <i2c_read_word>
     138:	fe042583          	lw	a1,-32(s0)
     13c:	900407b7          	lui	a5,0x90040
     140:	00c78513          	addi	a0,a5,12 # 9004000c <_memory_end+0x9002000c>
     144:	689000ef          	jal	fcc <i2c_read_word>
     148:	fe442583          	lw	a1,-28(s0)
     14c:	09818513          	addi	a0,gp,152 # 2af0 <__global_pointer$+0x98>
     150:	14c000ef          	jal	29c <my_printf>
     154:	fe042583          	lw	a1,-32(s0)
     158:	0a818513          	addi	a0,gp,168 # 2b00 <__global_pointer$+0xa8>
     15c:	140000ef          	jal	29c <my_printf>
     160:	fc042a23          	sw	zero,-44(s0)
     164:	0140006f          	j	178 <main+0x130>
     168:	00000013          	nop
     16c:	fd442783          	lw	a5,-44(s0)
     170:	00178793          	addi	a5,a5,1
     174:	fcf42a23          	sw	a5,-44(s0)
     178:	fd442703          	lw	a4,-44(s0)
     17c:	000f47b7          	lui	a5,0xf4
     180:	23f78793          	addi	a5,a5,575 # f423f <_memory_end+0xd423f>
     184:	fee7d2e3          	bge	a5,a4,168 <main+0x120>
     188:	fa1ff06f          	j	128 <main+0xe0>

0000018c <my_putc>:
     18c:	fe010113          	addi	sp,sp,-32
     190:	00112e23          	sw	ra,28(sp)
     194:	00812c23          	sw	s0,24(sp)
     198:	02010413          	addi	s0,sp,32
     19c:	fea42623          	sw	a0,-20(s0)
     1a0:	feb42423          	sw	a1,-24(s0)
     1a4:	fec42783          	lw	a5,-20(s0)
     1a8:	0ff7f793          	zext.b	a5,a5
     1ac:	00078513          	mv	a0,a5
     1b0:	229000ef          	jal	bd8 <uart_put_char>
     1b4:	00050793          	mv	a5,a0
     1b8:	00078513          	mv	a0,a5
     1bc:	01c12083          	lw	ra,28(sp)
     1c0:	01812403          	lw	s0,24(sp)
     1c4:	02010113          	addi	sp,sp,32
     1c8:	00008067          	ret

000001cc <my_putchar>:
     1cc:	fe010113          	addi	sp,sp,-32
     1d0:	00112e23          	sw	ra,28(sp)
     1d4:	00812c23          	sw	s0,24(sp)
     1d8:	02010413          	addi	s0,sp,32
     1dc:	fea42623          	sw	a0,-20(s0)
     1e0:	fec42783          	lw	a5,-20(s0)
     1e4:	0ff7f793          	zext.b	a5,a5
     1e8:	00078513          	mv	a0,a5
     1ec:	1ed000ef          	jal	bd8 <uart_put_char>
     1f0:	00050793          	mv	a5,a0
     1f4:	00078513          	mv	a0,a5
     1f8:	01c12083          	lw	ra,28(sp)
     1fc:	01812403          	lw	s0,24(sp)
     200:	02010113          	addi	sp,sp,32
     204:	00008067          	ret

00000208 <my_getc>:
     208:	fe010113          	addi	sp,sp,-32
     20c:	00112e23          	sw	ra,28(sp)
     210:	00812c23          	sw	s0,24(sp)
     214:	02010413          	addi	s0,sp,32
     218:	fea42623          	sw	a0,-20(s0)
     21c:	17d000ef          	jal	b98 <uart_get_char>
     220:	00050793          	mv	a5,a0
     224:	00078513          	mv	a0,a5
     228:	01c12083          	lw	ra,28(sp)
     22c:	01812403          	lw	s0,24(sp)
     230:	02010113          	addi	sp,sp,32
     234:	00008067          	ret

00000238 <my_getchar>:
     238:	ff010113          	addi	sp,sp,-16
     23c:	00112623          	sw	ra,12(sp)
     240:	00812423          	sw	s0,8(sp)
     244:	01010413          	addi	s0,sp,16
     248:	151000ef          	jal	b98 <uart_get_char>
     24c:	00050793          	mv	a5,a0
     250:	00078513          	mv	a0,a5
     254:	00c12083          	lw	ra,12(sp)
     258:	00812403          	lw	s0,8(sp)
     25c:	01010113          	addi	sp,sp,16
     260:	00008067          	ret

00000264 <my_puts>:
     264:	fd010113          	addi	sp,sp,-48
     268:	02112623          	sw	ra,44(sp)
     26c:	02812423          	sw	s0,40(sp)
     270:	03010413          	addi	s0,sp,48
     274:	fca42e23          	sw	a0,-36(s0)
     278:	fdc42503          	lw	a0,-36(s0)
     27c:	1bd000ef          	jal	c38 <uart_put_string>
     280:	fea42623          	sw	a0,-20(s0)
     284:	fec42783          	lw	a5,-20(s0)
     288:	00078513          	mv	a0,a5
     28c:	02c12083          	lw	ra,44(sp)
     290:	02812403          	lw	s0,40(sp)
     294:	03010113          	addi	sp,sp,48
     298:	00008067          	ret

0000029c <my_printf>:
     29c:	fb010113          	addi	sp,sp,-80
     2a0:	02112623          	sw	ra,44(sp)
     2a4:	02812423          	sw	s0,40(sp)
     2a8:	03010413          	addi	s0,sp,48
     2ac:	fca42e23          	sw	a0,-36(s0)
     2b0:	00b42223          	sw	a1,4(s0)
     2b4:	00c42423          	sw	a2,8(s0)
     2b8:	00d42623          	sw	a3,12(s0)
     2bc:	00e42823          	sw	a4,16(s0)
     2c0:	00f42a23          	sw	a5,20(s0)
     2c4:	01042c23          	sw	a6,24(s0)
     2c8:	01142e23          	sw	a7,28(s0)
     2cc:	02040793          	addi	a5,s0,32
     2d0:	fcf42c23          	sw	a5,-40(s0)
     2d4:	fd842783          	lw	a5,-40(s0)
     2d8:	fe478793          	addi	a5,a5,-28
     2dc:	fef42423          	sw	a5,-24(s0)
     2e0:	fe842783          	lw	a5,-24(s0)
     2e4:	00078593          	mv	a1,a5
     2e8:	fdc42503          	lw	a0,-36(s0)
     2ec:	28c000ef          	jal	578 <my_vprintf>
     2f0:	fea42623          	sw	a0,-20(s0)
     2f4:	fec42783          	lw	a5,-20(s0)
     2f8:	00078513          	mv	a0,a5
     2fc:	02c12083          	lw	ra,44(sp)
     300:	02812403          	lw	s0,40(sp)
     304:	05010113          	addi	sp,sp,80
     308:	00008067          	ret

0000030c <my_printn>:
     30c:	fd010113          	addi	sp,sp,-48
     310:	02112623          	sw	ra,44(sp)
     314:	02812423          	sw	s0,40(sp)
     318:	03010413          	addi	s0,sp,48
     31c:	fca42e23          	sw	a0,-36(s0)
     320:	fcb42c23          	sw	a1,-40(s0)
     324:	fcc42a23          	sw	a2,-44(s0)
     328:	fe042623          	sw	zero,-20(s0)
     32c:	fd842703          	lw	a4,-40(s0)
     330:	00a00793          	li	a5,10
     334:	02f71863          	bne	a4,a5,364 <my_printn+0x58>
     338:	fdc42783          	lw	a5,-36(s0)
     33c:	0207d463          	bgez	a5,364 <my_printn+0x58>
     340:	02d00513          	li	a0,45
     344:	095000ef          	jal	bd8 <uart_put_char>
     348:	00050713          	mv	a4,a0
     34c:	fec42783          	lw	a5,-20(s0)
     350:	00f707b3          	add	a5,a4,a5
     354:	fef42623          	sw	a5,-20(s0)
     358:	fdc42783          	lw	a5,-36(s0)
     35c:	40f007b3          	neg	a5,a5
     360:	fcf42e23          	sw	a5,-36(s0)
     364:	fd842783          	lw	a5,-40(s0)
     368:	fdc42703          	lw	a4,-36(s0)
     36c:	02f757b3          	divu	a5,a4,a5
     370:	fef42423          	sw	a5,-24(s0)
     374:	fe842783          	lw	a5,-24(s0)
     378:	00079863          	bnez	a5,388 <my_printn+0x7c>
     37c:	fd442703          	lw	a4,-44(s0)
     380:	00100793          	li	a5,1
     384:	02e7d863          	bge	a5,a4,3b4 <my_printn+0xa8>
     388:	fd442783          	lw	a5,-44(s0)
     38c:	fff78793          	addi	a5,a5,-1
     390:	fcf42a23          	sw	a5,-44(s0)
     394:	fd442603          	lw	a2,-44(s0)
     398:	fd842583          	lw	a1,-40(s0)
     39c:	fe842503          	lw	a0,-24(s0)
     3a0:	f6dff0ef          	jal	30c <my_printn>
     3a4:	00050713          	mv	a4,a0
     3a8:	fec42783          	lw	a5,-20(s0)
     3ac:	00e787b3          	add	a5,a5,a4
     3b0:	fef42623          	sw	a5,-20(s0)
     3b4:	fd842783          	lw	a5,-40(s0)
     3b8:	fdc42703          	lw	a4,-36(s0)
     3bc:	02f777b3          	remu	a5,a4,a5
     3c0:	00078713          	mv	a4,a5
     3c4:	0b818793          	addi	a5,gp,184 # 2b10 <__global_pointer$+0xb8>
     3c8:	00e787b3          	add	a5,a5,a4
     3cc:	0007c783          	lbu	a5,0(a5)
     3d0:	00078513          	mv	a0,a5
     3d4:	005000ef          	jal	bd8 <uart_put_char>
     3d8:	00050713          	mv	a4,a0
     3dc:	fec42783          	lw	a5,-20(s0)
     3e0:	00f707b3          	add	a5,a4,a5
     3e4:	fef42623          	sw	a5,-20(s0)
     3e8:	fec42783          	lw	a5,-20(s0)
     3ec:	00078513          	mv	a0,a5
     3f0:	02c12083          	lw	ra,44(sp)
     3f4:	02812403          	lw	s0,40(sp)
     3f8:	03010113          	addi	sp,sp,48
     3fc:	00008067          	ret

00000400 <my_printflt>:
     400:	fd010113          	addi	sp,sp,-48
     404:	02112623          	sw	ra,44(sp)
     408:	02812423          	sw	s0,40(sp)
     40c:	03010413          	addi	s0,sp,48
     410:	fca42e23          	sw	a0,-36(s0)
     414:	fcb42c23          	sw	a1,-40(s0)
     418:	fe042423          	sw	zero,-24(s0)
     41c:	00000593          	li	a1,0
     420:	fdc42503          	lw	a0,-36(s0)
     424:	305010ef          	jal	1f28 <__lesf2>
     428:	00050793          	mv	a5,a0
     42c:	0207d663          	bgez	a5,458 <my_printflt+0x58>
     430:	02d00513          	li	a0,45
     434:	7a4000ef          	jal	bd8 <uart_put_char>
     438:	00050713          	mv	a4,a0
     43c:	fe842783          	lw	a5,-24(s0)
     440:	00f707b3          	add	a5,a4,a5
     444:	fef42423          	sw	a5,-24(s0)
     448:	fdc42703          	lw	a4,-36(s0)
     44c:	800007b7          	lui	a5,0x80000
     450:	00f747b3          	xor	a5,a4,a5
     454:	fcf42e23          	sw	a5,-36(s0)
     458:	fdc42503          	lw	a0,-36(s0)
     45c:	2c4020ef          	jal	2720 <__fixsfsi>
     460:	00050793          	mv	a5,a0
     464:	fef42223          	sw	a5,-28(s0)
     468:	fe442783          	lw	a5,-28(s0)
     46c:	fd842603          	lw	a2,-40(s0)
     470:	00a00593          	li	a1,10
     474:	00078513          	mv	a0,a5
     478:	e95ff0ef          	jal	30c <my_printn>
     47c:	00050713          	mv	a4,a0
     480:	fe842783          	lw	a5,-24(s0)
     484:	00e787b3          	add	a5,a5,a4
     488:	fef42423          	sw	a5,-24(s0)
     48c:	02e00513          	li	a0,46
     490:	748000ef          	jal	bd8 <uart_put_char>
     494:	00050713          	mv	a4,a0
     498:	fe842783          	lw	a5,-24(s0)
     49c:	00f707b3          	add	a5,a4,a5
     4a0:	fef42423          	sw	a5,-24(s0)
     4a4:	fe442503          	lw	a0,-28(s0)
     4a8:	2e8020ef          	jal	2790 <__floatsisf>
     4ac:	00050793          	mv	a5,a0
     4b0:	00078593          	mv	a1,a5
     4b4:	fdc42503          	lw	a0,-36(s0)
     4b8:	639010ef          	jal	22f0 <__subsf3>
     4bc:	00050793          	mv	a5,a0
     4c0:	fcf42e23          	sw	a5,-36(s0)
     4c4:	fe042623          	sw	zero,-20(s0)
     4c8:	1241a583          	lw	a1,292(gp) # 2b7c <__global_pointer$+0x124>
     4cc:	fdc42503          	lw	a0,-36(s0)
     4d0:	305010ef          	jal	1fd4 <__mulsf3>
     4d4:	00050793          	mv	a5,a0
     4d8:	fcf42e23          	sw	a5,-36(s0)
     4dc:	fdc42503          	lw	a0,-36(s0)
     4e0:	240020ef          	jal	2720 <__fixsfsi>
     4e4:	00050793          	mv	a5,a0
     4e8:	fef42223          	sw	a5,-28(s0)
     4ec:	fe442783          	lw	a5,-28(s0)
     4f0:	0ff7f793          	zext.b	a5,a5
     4f4:	03078793          	addi	a5,a5,48 # 80000030 <_memory_end+0x7ffe0030>
     4f8:	0ff7f793          	zext.b	a5,a5
     4fc:	00078513          	mv	a0,a5
     500:	6d8000ef          	jal	bd8 <uart_put_char>
     504:	00050713          	mv	a4,a0
     508:	fe842783          	lw	a5,-24(s0)
     50c:	00f707b3          	add	a5,a4,a5
     510:	fef42423          	sw	a5,-24(s0)
     514:	fe442503          	lw	a0,-28(s0)
     518:	278020ef          	jal	2790 <__floatsisf>
     51c:	00050793          	mv	a5,a0
     520:	00078593          	mv	a1,a5
     524:	fdc42503          	lw	a0,-36(s0)
     528:	5c9010ef          	jal	22f0 <__subsf3>
     52c:	00050793          	mv	a5,a0
     530:	fcf42e23          	sw	a5,-36(s0)
     534:	fec42783          	lw	a5,-20(s0)
     538:	00178793          	addi	a5,a5,1
     53c:	fef42623          	sw	a5,-20(s0)
     540:	00000593          	li	a1,0
     544:	fdc42503          	lw	a0,-36(s0)
     548:	179010ef          	jal	1ec0 <__eqsf2>
     54c:	00050793          	mv	a5,a0
     550:	00078863          	beqz	a5,560 <my_printflt+0x160>
     554:	fec42703          	lw	a4,-20(s0)
     558:	00500793          	li	a5,5
     55c:	f6e7d6e3          	bge	a5,a4,4c8 <my_printflt+0xc8>
     560:	fe842783          	lw	a5,-24(s0)
     564:	00078513          	mv	a0,a5
     568:	02c12083          	lw	ra,44(sp)
     56c:	02812403          	lw	s0,40(sp)
     570:	03010113          	addi	sp,sp,48
     574:	00008067          	ret

00000578 <my_vprintf>:
     578:	fc010113          	addi	sp,sp,-64
     57c:	02112e23          	sw	ra,60(sp)
     580:	02812c23          	sw	s0,56(sp)
     584:	04010413          	addi	s0,sp,64
     588:	fca42623          	sw	a0,-52(s0)
     58c:	fcb42423          	sw	a1,-56(s0)
     590:	fe042023          	sw	zero,-32(s0)
     594:	3000006f          	j	894 <my_vprintf+0x31c>
     598:	fe842703          	lw	a4,-24(s0)
     59c:	02500793          	li	a5,37
     5a0:	2cf71063          	bne	a4,a5,860 <my_vprintf+0x2e8>
     5a4:	fcc42783          	lw	a5,-52(s0)
     5a8:	0007c783          	lbu	a5,0(a5)
     5ac:	fef42423          	sw	a5,-24(s0)
     5b0:	fe042623          	sw	zero,-20(s0)
     5b4:	0440006f          	j	5f8 <my_vprintf+0x80>
     5b8:	fec42703          	lw	a4,-20(s0)
     5bc:	00070793          	mv	a5,a4
     5c0:	00279793          	slli	a5,a5,0x2
     5c4:	00e787b3          	add	a5,a5,a4
     5c8:	00179793          	slli	a5,a5,0x1
     5cc:	00078713          	mv	a4,a5
     5d0:	fe842783          	lw	a5,-24(s0)
     5d4:	00f707b3          	add	a5,a4,a5
     5d8:	fd078793          	addi	a5,a5,-48
     5dc:	fef42623          	sw	a5,-20(s0)
     5e0:	fcc42783          	lw	a5,-52(s0)
     5e4:	00178793          	addi	a5,a5,1
     5e8:	fcf42623          	sw	a5,-52(s0)
     5ec:	fcc42783          	lw	a5,-52(s0)
     5f0:	0007c783          	lbu	a5,0(a5)
     5f4:	fef42423          	sw	a5,-24(s0)
     5f8:	fe842703          	lw	a4,-24(s0)
     5fc:	02f00793          	li	a5,47
     600:	00e7d863          	bge	a5,a4,610 <my_vprintf+0x98>
     604:	fe842703          	lw	a4,-24(s0)
     608:	03900793          	li	a5,57
     60c:	fae7d6e3          	bge	a5,a4,5b8 <my_vprintf+0x40>
     610:	fcc42783          	lw	a5,-52(s0)
     614:	00178713          	addi	a4,a5,1
     618:	fce42623          	sw	a4,-52(s0)
     61c:	0007c783          	lbu	a5,0(a5)
     620:	fef42423          	sw	a5,-24(s0)
     624:	fe842703          	lw	a4,-24(s0)
     628:	02500793          	li	a5,37
     62c:	1ef70863          	beq	a4,a5,81c <my_vprintf+0x2a4>
     630:	fe842703          	lw	a4,-24(s0)
     634:	02500793          	li	a5,37
     638:	20f74063          	blt	a4,a5,838 <my_vprintf+0x2c0>
     63c:	fe842703          	lw	a4,-24(s0)
     640:	07800793          	li	a5,120
     644:	1ee7ca63          	blt	a5,a4,838 <my_vprintf+0x2c0>
     648:	fe842703          	lw	a4,-24(s0)
     64c:	06300793          	li	a5,99
     650:	1ef74463          	blt	a4,a5,838 <my_vprintf+0x2c0>
     654:	fe842783          	lw	a5,-24(s0)
     658:	f9d78793          	addi	a5,a5,-99
     65c:	01500713          	li	a4,21
     660:	1cf76c63          	bltu	a4,a5,838 <my_vprintf+0x2c0>
     664:	00279713          	slli	a4,a5,0x2
     668:	0cc18793          	addi	a5,gp,204 # 2b24 <__global_pointer$+0xcc>
     66c:	00f707b3          	add	a5,a4,a5
     670:	0007a783          	lw	a5,0(a5)
     674:	00078067          	jr	a5
     678:	fc842783          	lw	a5,-56(s0)
     67c:	00478713          	addi	a4,a5,4
     680:	fce42423          	sw	a4,-56(s0)
     684:	0007a783          	lw	a5,0(a5)
     688:	fcf40ba3          	sb	a5,-41(s0)
     68c:	fd744783          	lbu	a5,-41(s0)
     690:	00078513          	mv	a0,a5
     694:	544000ef          	jal	bd8 <uart_put_char>
     698:	00050713          	mv	a4,a0
     69c:	fe042783          	lw	a5,-32(s0)
     6a0:	00f707b3          	add	a5,a4,a5
     6a4:	fef42023          	sw	a5,-32(s0)
     6a8:	1ec0006f          	j	894 <my_vprintf+0x31c>
     6ac:	fc842783          	lw	a5,-56(s0)
     6b0:	00478713          	addi	a4,a5,4
     6b4:	fce42423          	sw	a4,-56(s0)
     6b8:	0007a783          	lw	a5,0(a5)
     6bc:	fcf42e23          	sw	a5,-36(s0)
     6c0:	fdc42783          	lw	a5,-36(s0)
     6c4:	fec42603          	lw	a2,-20(s0)
     6c8:	00800593          	li	a1,8
     6cc:	00078513          	mv	a0,a5
     6d0:	c3dff0ef          	jal	30c <my_printn>
     6d4:	00050713          	mv	a4,a0
     6d8:	fe042783          	lw	a5,-32(s0)
     6dc:	00e787b3          	add	a5,a5,a4
     6e0:	fef42023          	sw	a5,-32(s0)
     6e4:	1b00006f          	j	894 <my_vprintf+0x31c>
     6e8:	fc842783          	lw	a5,-56(s0)
     6ec:	00478713          	addi	a4,a5,4
     6f0:	fce42423          	sw	a4,-56(s0)
     6f4:	0007a783          	lw	a5,0(a5)
     6f8:	fcf42e23          	sw	a5,-36(s0)
     6fc:	fdc42783          	lw	a5,-36(s0)
     700:	fec42603          	lw	a2,-20(s0)
     704:	00a00593          	li	a1,10
     708:	00078513          	mv	a0,a5
     70c:	c01ff0ef          	jal	30c <my_printn>
     710:	00050713          	mv	a4,a0
     714:	fe042783          	lw	a5,-32(s0)
     718:	00e787b3          	add	a5,a5,a4
     71c:	fef42023          	sw	a5,-32(s0)
     720:	1740006f          	j	894 <my_vprintf+0x31c>
     724:	fc842783          	lw	a5,-56(s0)
     728:	00478713          	addi	a4,a5,4
     72c:	fce42423          	sw	a4,-56(s0)
     730:	0007a783          	lw	a5,0(a5)
     734:	fcf42e23          	sw	a5,-36(s0)
     738:	fdc42783          	lw	a5,-36(s0)
     73c:	fec42603          	lw	a2,-20(s0)
     740:	01000593          	li	a1,16
     744:	00078513          	mv	a0,a5
     748:	bc5ff0ef          	jal	30c <my_printn>
     74c:	00050713          	mv	a4,a0
     750:	fe042783          	lw	a5,-32(s0)
     754:	00e787b3          	add	a5,a5,a4
     758:	fef42023          	sw	a5,-32(s0)
     75c:	1380006f          	j	894 <my_vprintf+0x31c>
     760:	fc842783          	lw	a5,-56(s0)
     764:	00478713          	addi	a4,a5,4
     768:	fce42423          	sw	a4,-56(s0)
     76c:	0007a783          	lw	a5,0(a5)
     770:	fef42223          	sw	a5,-28(s0)
     774:	0480006f          	j	7bc <my_vprintf+0x244>
     778:	fe442783          	lw	a5,-28(s0)
     77c:	0007c783          	lbu	a5,0(a5)
     780:	00078513          	mv	a0,a5
     784:	454000ef          	jal	bd8 <uart_put_char>
     788:	00050713          	mv	a4,a0
     78c:	fe042783          	lw	a5,-32(s0)
     790:	00f707b3          	add	a5,a4,a5
     794:	fef42023          	sw	a5,-32(s0)
     798:	fe442783          	lw	a5,-28(s0)
     79c:	0007c703          	lbu	a4,0(a5)
     7a0:	00a00793          	li	a5,10
     7a4:	00f71663          	bne	a4,a5,7b0 <my_vprintf+0x238>
     7a8:	00d00513          	li	a0,13
     7ac:	42c000ef          	jal	bd8 <uart_put_char>
     7b0:	fe442783          	lw	a5,-28(s0)
     7b4:	00178793          	addi	a5,a5,1
     7b8:	fef42223          	sw	a5,-28(s0)
     7bc:	fe442783          	lw	a5,-28(s0)
     7c0:	0007c783          	lbu	a5,0(a5)
     7c4:	fa079ae3          	bnez	a5,778 <my_vprintf+0x200>
     7c8:	0cc0006f          	j	894 <my_vprintf+0x31c>
     7cc:	fc842783          	lw	a5,-56(s0)
     7d0:	00778793          	addi	a5,a5,7
     7d4:	ff87f793          	andi	a5,a5,-8
     7d8:	00878713          	addi	a4,a5,8
     7dc:	fce42423          	sw	a4,-56(s0)
     7e0:	0007a703          	lw	a4,0(a5)
     7e4:	0047a783          	lw	a5,4(a5)
     7e8:	00070513          	mv	a0,a4
     7ec:	00078593          	mv	a1,a5
     7f0:	0a8020ef          	jal	2898 <__truncdfsf2>
     7f4:	00050793          	mv	a5,a0
     7f8:	fcf42c23          	sw	a5,-40(s0)
     7fc:	fec42583          	lw	a1,-20(s0)
     800:	fd842503          	lw	a0,-40(s0)
     804:	bfdff0ef          	jal	400 <my_printflt>
     808:	00050713          	mv	a4,a0
     80c:	fe042783          	lw	a5,-32(s0)
     810:	00e787b3          	add	a5,a5,a4
     814:	fef42023          	sw	a5,-32(s0)
     818:	07c0006f          	j	894 <my_vprintf+0x31c>
     81c:	02500513          	li	a0,37
     820:	3b8000ef          	jal	bd8 <uart_put_char>
     824:	00050713          	mv	a4,a0
     828:	fe042783          	lw	a5,-32(s0)
     82c:	00f707b3          	add	a5,a4,a5
     830:	fef42023          	sw	a5,-32(s0)
     834:	0600006f          	j	894 <my_vprintf+0x31c>
     838:	02500513          	li	a0,37
     83c:	39c000ef          	jal	bd8 <uart_put_char>
     840:	00050713          	mv	a4,a0
     844:	fe042783          	lw	a5,-32(s0)
     848:	00f707b3          	add	a5,a4,a5
     84c:	fef42023          	sw	a5,-32(s0)
     850:	fcc42783          	lw	a5,-52(s0)
     854:	fff78793          	addi	a5,a5,-1
     858:	fcf42623          	sw	a5,-52(s0)
     85c:	0380006f          	j	894 <my_vprintf+0x31c>
     860:	fe842783          	lw	a5,-24(s0)
     864:	0ff7f793          	zext.b	a5,a5
     868:	00078513          	mv	a0,a5
     86c:	36c000ef          	jal	bd8 <uart_put_char>
     870:	00050713          	mv	a4,a0
     874:	fe042783          	lw	a5,-32(s0)
     878:	00f707b3          	add	a5,a4,a5
     87c:	fef42023          	sw	a5,-32(s0)
     880:	fe842703          	lw	a4,-24(s0)
     884:	00a00793          	li	a5,10
     888:	00f71663          	bne	a4,a5,894 <my_vprintf+0x31c>
     88c:	00d00513          	li	a0,13
     890:	348000ef          	jal	bd8 <uart_put_char>
     894:	fcc42783          	lw	a5,-52(s0)
     898:	00178713          	addi	a4,a5,1
     89c:	fce42623          	sw	a4,-52(s0)
     8a0:	0007c783          	lbu	a5,0(a5)
     8a4:	fef42423          	sw	a5,-24(s0)
     8a8:	fe842783          	lw	a5,-24(s0)
     8ac:	ce0796e3          	bnez	a5,598 <my_vprintf+0x20>
     8b0:	fe042783          	lw	a5,-32(s0)
     8b4:	00078513          	mv	a0,a5
     8b8:	03c12083          	lw	ra,60(sp)
     8bc:	03812403          	lw	s0,56(sp)
     8c0:	04010113          	addi	sp,sp,64
     8c4:	00008067          	ret

000008c8 <uart_init>:
     8c8:	fc010113          	addi	sp,sp,-64
     8cc:	02112e23          	sw	ra,60(sp)
     8d0:	02812c23          	sw	s0,56(sp)
     8d4:	04010413          	addi	s0,sp,64
     8d8:	fca42e23          	sw	a0,-36(s0)
     8dc:	fcb42c23          	sw	a1,-40(s0)
     8e0:	fcc42a23          	sw	a2,-44(s0)
     8e4:	fcd42823          	sw	a3,-48(s0)
     8e8:	fce42623          	sw	a4,-52(s0)
     8ec:	fdc42783          	lw	a5,-36(s0)
     8f0:	00079663          	bnez	a5,8fc <uart_init+0x34>
     8f4:	5b0000ef          	jal	ea4 <uart_get_clk_freq>
     8f8:	fca42e23          	sw	a0,-36(s0)
     8fc:	fdc42703          	lw	a4,-36(s0)
     900:	fd842783          	lw	a5,-40(s0)
     904:	02f757b3          	divu	a5,a4,a5
     908:	00078513          	mv	a0,a5
     90c:	534010ef          	jal	1e40 <__floatunsidf>
     910:	00050713          	mv	a4,a0
     914:	00058793          	mv	a5,a1
     918:	1281a603          	lw	a2,296(gp) # 2b80 <__global_pointer$+0x128>
     91c:	12c1a683          	lw	a3,300(gp) # 2b84 <__global_pointer$+0x12c>
     920:	00070513          	mv	a0,a4
     924:	00078593          	mv	a1,a5
     928:	505000ef          	jal	162c <__adddf3>
     92c:	00050713          	mv	a4,a0
     930:	00058793          	mv	a5,a1
     934:	00070513          	mv	a0,a4
     938:	00078593          	mv	a1,a5
     93c:	484010ef          	jal	1dc0 <__fixdfsi>
     940:	00050793          	mv	a5,a0
     944:	00078713          	mv	a4,a5
     948:	000107b7          	lui	a5,0x10
     94c:	fff78793          	addi	a5,a5,-1 # ffff <_bss_end+0xd137>
     950:	00f777b3          	and	a5,a4,a5
     954:	fef42623          	sw	a5,-20(s0)
     958:	fd442703          	lw	a4,-44(s0)
     95c:	00800793          	li	a5,8
     960:	00f71663          	bne	a4,a5,96c <uart_init+0xa4>
     964:	00000793          	li	a5,0
     968:	0080006f          	j	970 <uart_init+0xa8>
     96c:	000107b7          	lui	a5,0x10
     970:	fec42703          	lw	a4,-20(s0)
     974:	00e7e7b3          	or	a5,a5,a4
     978:	fef42623          	sw	a5,-20(s0)
     97c:	fd042783          	lw	a5,-48(s0)
     980:	00079663          	bnez	a5,98c <uart_init+0xc4>
     984:	00000793          	li	a5,0
     988:	0080006f          	j	990 <uart_init+0xc8>
     98c:	000207b7          	lui	a5,0x20
     990:	fec42703          	lw	a4,-20(s0)
     994:	00e7e7b3          	or	a5,a5,a4
     998:	fef42623          	sw	a5,-20(s0)
     99c:	fd042703          	lw	a4,-48(s0)
     9a0:	00100793          	li	a5,1
     9a4:	00f71663          	bne	a4,a5,9b0 <uart_init+0xe8>
     9a8:	00000793          	li	a5,0
     9ac:	0080006f          	j	9b4 <uart_init+0xec>
     9b0:	000407b7          	lui	a5,0x40
     9b4:	fec42703          	lw	a4,-20(s0)
     9b8:	00e7e7b3          	or	a5,a5,a4
     9bc:	fef42623          	sw	a5,-20(s0)
     9c0:	fcc42703          	lw	a4,-52(s0)
     9c4:	00100793          	li	a5,1
     9c8:	00f71663          	bne	a4,a5,9d4 <uart_init+0x10c>
     9cc:	00000793          	li	a5,0
     9d0:	0080006f          	j	9d8 <uart_init+0x110>
     9d4:	000807b7          	lui	a5,0x80
     9d8:	fec42703          	lw	a4,-20(s0)
     9dc:	00e7e7b3          	or	a5,a5,a4
     9e0:	fef42623          	sw	a5,-20(s0)
     9e4:	43c1a783          	lw	a5,1084(gp) # 2e94 <UART_CONTROL>
     9e8:	fef42423          	sw	a5,-24(s0)
     9ec:	fe842783          	lw	a5,-24(s0)
     9f0:	fec42703          	lw	a4,-20(s0)
     9f4:	00e7a023          	sw	a4,0(a5) # 80000 <_memory_end+0x60000>
     9f8:	00000013          	nop
     9fc:	03c12083          	lw	ra,60(sp)
     a00:	03812403          	lw	s0,56(sp)
     a04:	04010113          	addi	sp,sp,64
     a08:	00008067          	ret

00000a0c <uart_init_ext>:
     a0c:	fc010113          	addi	sp,sp,-64
     a10:	02112e23          	sw	ra,60(sp)
     a14:	02812c23          	sw	s0,56(sp)
     a18:	04010413          	addi	s0,sp,64
     a1c:	fca42e23          	sw	a0,-36(s0)
     a20:	fcb42c23          	sw	a1,-40(s0)
     a24:	fcc42a23          	sw	a2,-44(s0)
     a28:	fcd42823          	sw	a3,-48(s0)
     a2c:	fce42623          	sw	a4,-52(s0)
     a30:	fcf42423          	sw	a5,-56(s0)
     a34:	fd042223          	sw	a6,-60(s0)
     a38:	fdc42783          	lw	a5,-36(s0)
     a3c:	00079663          	bnez	a5,a48 <uart_init_ext+0x3c>
     a40:	464000ef          	jal	ea4 <uart_get_clk_freq>
     a44:	fca42e23          	sw	a0,-36(s0)
     a48:	fdc42703          	lw	a4,-36(s0)
     a4c:	fd842783          	lw	a5,-40(s0)
     a50:	02f757b3          	divu	a5,a4,a5
     a54:	00078513          	mv	a0,a5
     a58:	3e8010ef          	jal	1e40 <__floatunsidf>
     a5c:	00050713          	mv	a4,a0
     a60:	00058793          	mv	a5,a1
     a64:	1281a603          	lw	a2,296(gp) # 2b80 <__global_pointer$+0x128>
     a68:	12c1a683          	lw	a3,300(gp) # 2b84 <__global_pointer$+0x12c>
     a6c:	00070513          	mv	a0,a4
     a70:	00078593          	mv	a1,a5
     a74:	3b9000ef          	jal	162c <__adddf3>
     a78:	00050713          	mv	a4,a0
     a7c:	00058793          	mv	a5,a1
     a80:	00070513          	mv	a0,a4
     a84:	00078593          	mv	a1,a5
     a88:	338010ef          	jal	1dc0 <__fixdfsi>
     a8c:	00050793          	mv	a5,a0
     a90:	00078713          	mv	a4,a5
     a94:	000107b7          	lui	a5,0x10
     a98:	fff78793          	addi	a5,a5,-1 # ffff <_bss_end+0xd137>
     a9c:	00f777b3          	and	a5,a4,a5
     aa0:	fef42623          	sw	a5,-20(s0)
     aa4:	fd442703          	lw	a4,-44(s0)
     aa8:	00800793          	li	a5,8
     aac:	00f71663          	bne	a4,a5,ab8 <uart_init_ext+0xac>
     ab0:	00000793          	li	a5,0
     ab4:	0080006f          	j	abc <uart_init_ext+0xb0>
     ab8:	000107b7          	lui	a5,0x10
     abc:	fec42703          	lw	a4,-20(s0)
     ac0:	00e7e7b3          	or	a5,a5,a4
     ac4:	fef42623          	sw	a5,-20(s0)
     ac8:	fd042783          	lw	a5,-48(s0)
     acc:	00079663          	bnez	a5,ad8 <uart_init_ext+0xcc>
     ad0:	00000793          	li	a5,0
     ad4:	0080006f          	j	adc <uart_init_ext+0xd0>
     ad8:	000207b7          	lui	a5,0x20
     adc:	fec42703          	lw	a4,-20(s0)
     ae0:	00e7e7b3          	or	a5,a5,a4
     ae4:	fef42623          	sw	a5,-20(s0)
     ae8:	fd042703          	lw	a4,-48(s0)
     aec:	00100793          	li	a5,1
     af0:	00f71663          	bne	a4,a5,afc <uart_init_ext+0xf0>
     af4:	00000793          	li	a5,0
     af8:	0080006f          	j	b00 <uart_init_ext+0xf4>
     afc:	000407b7          	lui	a5,0x40
     b00:	fec42703          	lw	a4,-20(s0)
     b04:	00e7e7b3          	or	a5,a5,a4
     b08:	fef42623          	sw	a5,-20(s0)
     b0c:	fcc42703          	lw	a4,-52(s0)
     b10:	00100793          	li	a5,1
     b14:	00f71663          	bne	a4,a5,b20 <uart_init_ext+0x114>
     b18:	00000793          	li	a5,0
     b1c:	0080006f          	j	b24 <uart_init_ext+0x118>
     b20:	000807b7          	lui	a5,0x80
     b24:	fec42703          	lw	a4,-20(s0)
     b28:	00e7e7b3          	or	a5,a5,a4
     b2c:	fef42623          	sw	a5,-20(s0)
     b30:	fc842783          	lw	a5,-56(s0)
     b34:	00079663          	bnez	a5,b40 <uart_init_ext+0x134>
     b38:	00000793          	li	a5,0
     b3c:	0080006f          	j	b44 <uart_init_ext+0x138>
     b40:	002007b7          	lui	a5,0x200
     b44:	fec42703          	lw	a4,-20(s0)
     b48:	00e7e7b3          	or	a5,a5,a4
     b4c:	fef42623          	sw	a5,-20(s0)
     b50:	fc442783          	lw	a5,-60(s0)
     b54:	00079663          	bnez	a5,b60 <uart_init_ext+0x154>
     b58:	00000793          	li	a5,0
     b5c:	0080006f          	j	b64 <uart_init_ext+0x158>
     b60:	001007b7          	lui	a5,0x100
     b64:	fec42703          	lw	a4,-20(s0)
     b68:	00e7e7b3          	or	a5,a5,a4
     b6c:	fef42623          	sw	a5,-20(s0)
     b70:	43c1a783          	lw	a5,1084(gp) # 2e94 <UART_CONTROL>
     b74:	fef42423          	sw	a5,-24(s0)
     b78:	fe842783          	lw	a5,-24(s0)
     b7c:	fec42703          	lw	a4,-20(s0)
     b80:	00e7a023          	sw	a4,0(a5) # 100000 <_memory_end+0xe0000>
     b84:	00000013          	nop
     b88:	03c12083          	lw	ra,60(sp)
     b8c:	03812403          	lw	s0,56(sp)
     b90:	04010113          	addi	sp,sp,64
     b94:	00008067          	ret

00000b98 <uart_get_char>:
     b98:	fe010113          	addi	sp,sp,-32
     b9c:	00812e23          	sw	s0,28(sp)
     ba0:	02010413          	addi	s0,sp,32
     ba4:	4481a783          	lw	a5,1096(gp) # 2ea0 <UART_RX>
     ba8:	fef42423          	sw	a5,-24(s0)
     bac:	fe842783          	lw	a5,-24(s0)
     bb0:	0007a783          	lw	a5,0(a5)
     bb4:	fef42623          	sw	a5,-20(s0)
     bb8:	fec42783          	lw	a5,-20(s0)
     bbc:	fe07d4e3          	bgez	a5,ba4 <uart_get_char+0xc>
     bc0:	fec42783          	lw	a5,-20(s0)
     bc4:	0ff7f793          	zext.b	a5,a5
     bc8:	00078513          	mv	a0,a5
     bcc:	01c12403          	lw	s0,28(sp)
     bd0:	02010113          	addi	sp,sp,32
     bd4:	00008067          	ret

00000bd8 <uart_put_char>:
     bd8:	fd010113          	addi	sp,sp,-48
     bdc:	02812623          	sw	s0,44(sp)
     be0:	03010413          	addi	s0,sp,48
     be4:	00050793          	mv	a5,a0
     be8:	fcf40fa3          	sb	a5,-33(s0)
     bec:	4441a783          	lw	a5,1092(gp) # 2e9c <UART_TX>
     bf0:	fef42423          	sw	a5,-24(s0)
     bf4:	fe842783          	lw	a5,-24(s0)
     bf8:	0007a783          	lw	a5,0(a5)
     bfc:	fef42623          	sw	a5,-20(s0)
     c00:	fec42783          	lw	a5,-20(s0)
     c04:	fe07c4e3          	bltz	a5,bec <uart_put_char+0x14>
     c08:	fdf44783          	lbu	a5,-33(s0)
     c0c:	fef42623          	sw	a5,-20(s0)
     c10:	4441a783          	lw	a5,1092(gp) # 2e9c <UART_TX>
     c14:	fef42223          	sw	a5,-28(s0)
     c18:	fe442783          	lw	a5,-28(s0)
     c1c:	fec42703          	lw	a4,-20(s0)
     c20:	00e7a023          	sw	a4,0(a5)
     c24:	fdf44783          	lbu	a5,-33(s0)
     c28:	00078513          	mv	a0,a5
     c2c:	02c12403          	lw	s0,44(sp)
     c30:	03010113          	addi	sp,sp,48
     c34:	00008067          	ret

00000c38 <uart_put_string>:
     c38:	fc010113          	addi	sp,sp,-64
     c3c:	02812e23          	sw	s0,60(sp)
     c40:	04010413          	addi	s0,sp,64
     c44:	fca42623          	sw	a0,-52(s0)
     c48:	fe042623          	sw	zero,-20(s0)
     c4c:	0400006f          	j	c8c <uart_put_string+0x54>
     c50:	4441a783          	lw	a5,1092(gp) # 2e9c <UART_TX>
     c54:	fef42023          	sw	a5,-32(s0)
     c58:	fe042783          	lw	a5,-32(s0)
     c5c:	0007a783          	lw	a5,0(a5)
     c60:	fef42223          	sw	a5,-28(s0)
     c64:	fe442783          	lw	a5,-28(s0)
     c68:	fe07c4e3          	bltz	a5,c50 <uart_put_string+0x18>
     c6c:	4441a783          	lw	a5,1092(gp) # 2e9c <UART_TX>
     c70:	fcf42e23          	sw	a5,-36(s0)
     c74:	fdc42783          	lw	a5,-36(s0)
     c78:	feb44703          	lbu	a4,-21(s0)
     c7c:	00e7a023          	sw	a4,0(a5)
     c80:	fec42783          	lw	a5,-20(s0)
     c84:	00178793          	addi	a5,a5,1
     c88:	fef42623          	sw	a5,-20(s0)
     c8c:	fcc42783          	lw	a5,-52(s0)
     c90:	00178713          	addi	a4,a5,1
     c94:	fce42623          	sw	a4,-52(s0)
     c98:	0007c783          	lbu	a5,0(a5)
     c9c:	fef405a3          	sb	a5,-21(s0)
     ca0:	feb44783          	lbu	a5,-21(s0)
     ca4:	fa0796e3          	bnez	a5,c50 <uart_put_string+0x18>
     ca8:	fec42783          	lw	a5,-20(s0)
     cac:	00078513          	mv	a0,a5
     cb0:	03c12403          	lw	s0,60(sp)
     cb4:	04010113          	addi	sp,sp,64
     cb8:	00008067          	ret

00000cbc <uart_put_int>:
     cbc:	fc010113          	addi	sp,sp,-64
     cc0:	02112e23          	sw	ra,60(sp)
     cc4:	02812c23          	sw	s0,56(sp)
     cc8:	04010413          	addi	s0,sp,64
     ccc:	fca42623          	sw	a0,-52(s0)
     cd0:	fcc42703          	lw	a4,-52(s0)
     cd4:	00a00793          	li	a5,10
     cd8:	02f757b3          	divu	a5,a4,a5
     cdc:	fef42623          	sw	a5,-20(s0)
     ce0:	fec42783          	lw	a5,-20(s0)
     ce4:	00078863          	beqz	a5,cf4 <uart_put_int+0x38>
     ce8:	fec42783          	lw	a5,-20(s0)
     cec:	00078513          	mv	a0,a5
     cf0:	fcdff0ef          	jal	cbc <uart_put_int>
     cf4:	fcc42703          	lw	a4,-52(s0)
     cf8:	00a00793          	li	a5,10
     cfc:	02f777b3          	remu	a5,a4,a5
     d00:	0ff7f793          	zext.b	a5,a5
     d04:	03078793          	addi	a5,a5,48
     d08:	fef405a3          	sb	a5,-21(s0)
     d0c:	4441a783          	lw	a5,1092(gp) # 2e9c <UART_TX>
     d10:	fcf42a23          	sw	a5,-44(s0)
     d14:	fd442783          	lw	a5,-44(s0)
     d18:	0007a783          	lw	a5,0(a5)
     d1c:	fcf42c23          	sw	a5,-40(s0)
     d20:	fd842783          	lw	a5,-40(s0)
     d24:	fe07c4e3          	bltz	a5,d0c <uart_put_int+0x50>
     d28:	4441a783          	lw	a5,1092(gp) # 2e9c <UART_TX>
     d2c:	fcf42823          	sw	a5,-48(s0)
     d30:	fd042783          	lw	a5,-48(s0)
     d34:	feb44703          	lbu	a4,-21(s0)
     d38:	00e7a023          	sw	a4,0(a5)
     d3c:	00000013          	nop
     d40:	03c12083          	lw	ra,60(sp)
     d44:	03812403          	lw	s0,56(sp)
     d48:	04010113          	addi	sp,sp,64
     d4c:	00008067          	ret

00000d50 <uart_put_hex>:
     d50:	fc010113          	addi	sp,sp,-64
     d54:	02112e23          	sw	ra,60(sp)
     d58:	02812c23          	sw	s0,56(sp)
     d5c:	04010413          	addi	s0,sp,64
     d60:	fca42623          	sw	a0,-52(s0)
     d64:	fcc42783          	lw	a5,-52(s0)
     d68:	0047d793          	srli	a5,a5,0x4
     d6c:	fef42423          	sw	a5,-24(s0)
     d70:	fe842783          	lw	a5,-24(s0)
     d74:	00078863          	beqz	a5,d84 <uart_put_hex+0x34>
     d78:	fe842783          	lw	a5,-24(s0)
     d7c:	00078513          	mv	a0,a5
     d80:	fd1ff0ef          	jal	d50 <uart_put_hex>
     d84:	fcc42783          	lw	a5,-52(s0)
     d88:	00f7f793          	andi	a5,a5,15
     d8c:	fef42423          	sw	a5,-24(s0)
     d90:	fe842703          	lw	a4,-24(s0)
     d94:	00900793          	li	a5,9
     d98:	00e7cc63          	blt	a5,a4,db0 <uart_put_hex+0x60>
     d9c:	fe842783          	lw	a5,-24(s0)
     da0:	0ff7f793          	zext.b	a5,a5
     da4:	03078793          	addi	a5,a5,48
     da8:	fef407a3          	sb	a5,-17(s0)
     dac:	0140006f          	j	dc0 <uart_put_hex+0x70>
     db0:	fe842783          	lw	a5,-24(s0)
     db4:	0ff7f793          	zext.b	a5,a5
     db8:	03778793          	addi	a5,a5,55
     dbc:	fef407a3          	sb	a5,-17(s0)
     dc0:	4441a783          	lw	a5,1092(gp) # 2e9c <UART_TX>
     dc4:	fef42023          	sw	a5,-32(s0)
     dc8:	fe042783          	lw	a5,-32(s0)
     dcc:	0007a783          	lw	a5,0(a5)
     dd0:	fef42223          	sw	a5,-28(s0)
     dd4:	fe442783          	lw	a5,-28(s0)
     dd8:	fe07c4e3          	bltz	a5,dc0 <uart_put_hex+0x70>
     ddc:	4441a783          	lw	a5,1092(gp) # 2e9c <UART_TX>
     de0:	fcf42e23          	sw	a5,-36(s0)
     de4:	fdc42783          	lw	a5,-36(s0)
     de8:	fef44703          	lbu	a4,-17(s0)
     dec:	00e7a023          	sw	a4,0(a5)
     df0:	00000013          	nop
     df4:	03c12083          	lw	ra,60(sp)
     df8:	03812403          	lw	s0,56(sp)
     dfc:	04010113          	addi	sp,sp,64
     e00:	00008067          	ret

00000e04 <uart_cler_tx_irq>:
     e04:	fe010113          	addi	sp,sp,-32
     e08:	00812e23          	sw	s0,28(sp)
     e0c:	02010413          	addi	s0,sp,32
     e10:	4401a783          	lw	a5,1088(gp) # 2e98 <UART_STATUS>
     e14:	fef42423          	sw	a5,-24(s0)
     e18:	fe842783          	lw	a5,-24(s0)
     e1c:	0007a783          	lw	a5,0(a5)
     e20:	fef42623          	sw	a5,-20(s0)
     e24:	fec42783          	lw	a5,-20(s0)
     e28:	ffe7f793          	andi	a5,a5,-2
     e2c:	fef42623          	sw	a5,-20(s0)
     e30:	4401a783          	lw	a5,1088(gp) # 2e98 <UART_STATUS>
     e34:	fef42223          	sw	a5,-28(s0)
     e38:	fe442783          	lw	a5,-28(s0)
     e3c:	fec42703          	lw	a4,-20(s0)
     e40:	00e7a023          	sw	a4,0(a5)
     e44:	00000013          	nop
     e48:	01c12403          	lw	s0,28(sp)
     e4c:	02010113          	addi	sp,sp,32
     e50:	00008067          	ret

00000e54 <uart_cler_rx_irq>:
     e54:	fe010113          	addi	sp,sp,-32
     e58:	00812e23          	sw	s0,28(sp)
     e5c:	02010413          	addi	s0,sp,32
     e60:	4401a783          	lw	a5,1088(gp) # 2e98 <UART_STATUS>
     e64:	fef42423          	sw	a5,-24(s0)
     e68:	fe842783          	lw	a5,-24(s0)
     e6c:	0007a783          	lw	a5,0(a5)
     e70:	fef42623          	sw	a5,-20(s0)
     e74:	fec42783          	lw	a5,-20(s0)
     e78:	ffd7f793          	andi	a5,a5,-3
     e7c:	fef42623          	sw	a5,-20(s0)
     e80:	4401a783          	lw	a5,1088(gp) # 2e98 <UART_STATUS>
     e84:	fef42223          	sw	a5,-28(s0)
     e88:	fe442783          	lw	a5,-28(s0)
     e8c:	fec42703          	lw	a4,-20(s0)
     e90:	00e7a023          	sw	a4,0(a5)
     e94:	00000013          	nop
     e98:	01c12403          	lw	s0,28(sp)
     e9c:	02010113          	addi	sp,sp,32
     ea0:	00008067          	ret

00000ea4 <uart_get_clk_freq>:
     ea4:	fe010113          	addi	sp,sp,-32
     ea8:	00812e23          	sw	s0,28(sp)
     eac:	02010413          	addi	s0,sp,32
     eb0:	44c1a783          	lw	a5,1100(gp) # 2ea4 <UART_CLK_FREQ>
     eb4:	fef42423          	sw	a5,-24(s0)
     eb8:	fe842783          	lw	a5,-24(s0)
     ebc:	0007a783          	lw	a5,0(a5)
     ec0:	fef42623          	sw	a5,-20(s0)
     ec4:	fec42783          	lw	a5,-20(s0)
     ec8:	00078513          	mv	a0,a5
     ecc:	01c12403          	lw	s0,28(sp)
     ed0:	02010113          	addi	sp,sp,32
     ed4:	00008067          	ret

00000ed8 <uart_set_addr>:
     ed8:	fe010113          	addi	sp,sp,-32
     edc:	00812e23          	sw	s0,28(sp)
     ee0:	02010413          	addi	s0,sp,32
     ee4:	fea42623          	sw	a0,-20(s0)
     ee8:	fec42703          	lw	a4,-20(s0)
     eec:	42e1a823          	sw	a4,1072(gp) # 2e88 <UART_ADDR_BASE>
     ef0:	fec42703          	lw	a4,-20(s0)
     ef4:	42e1aa23          	sw	a4,1076(gp) # 2e8c <UART_VERSION>
     ef8:	fec42783          	lw	a5,-20(s0)
     efc:	00478713          	addi	a4,a5,4
     f00:	42e1ac23          	sw	a4,1080(gp) # 2e90 <UART_NAME>
     f04:	fec42783          	lw	a5,-20(s0)
     f08:	01078713          	addi	a4,a5,16
     f0c:	42e1ae23          	sw	a4,1084(gp) # 2e94 <UART_CONTROL>
     f10:	fec42783          	lw	a5,-20(s0)
     f14:	01478713          	addi	a4,a5,20
     f18:	44e1a023          	sw	a4,1088(gp) # 2e98 <UART_STATUS>
     f1c:	fec42783          	lw	a5,-20(s0)
     f20:	01878713          	addi	a4,a5,24
     f24:	44e1a223          	sw	a4,1092(gp) # 2e9c <UART_TX>
     f28:	fec42783          	lw	a5,-20(s0)
     f2c:	01c78713          	addi	a4,a5,28
     f30:	44e1a423          	sw	a4,1096(gp) # 2ea0 <UART_RX>
     f34:	fec42783          	lw	a5,-20(s0)
     f38:	02078713          	addi	a4,a5,32
     f3c:	44e1a623          	sw	a4,1100(gp) # 2ea4 <UART_CLK_FREQ>
     f40:	00000013          	nop
     f44:	01c12403          	lw	s0,28(sp)
     f48:	02010113          	addi	sp,sp,32
     f4c:	00008067          	ret

00000f50 <uart_get_addr>:
     f50:	ff010113          	addi	sp,sp,-16
     f54:	00812623          	sw	s0,12(sp)
     f58:	01010413          	addi	s0,sp,16
     f5c:	4301a783          	lw	a5,1072(gp) # 2e88 <UART_ADDR_BASE>
     f60:	00078513          	mv	a0,a5
     f64:	00c12403          	lw	s0,12(sp)
     f68:	01010113          	addi	sp,sp,16
     f6c:	00008067          	ret

00000f70 <i2c_read_data>:
     f70:	fe010113          	addi	sp,sp,-32
     f74:	00812e23          	sw	s0,28(sp)
     f78:	02010413          	addi	s0,sp,32
     f7c:	4681a783          	lw	a5,1128(gp) # 2ec0 <CSRA_DATA2>
     f80:	0007a783          	lw	a5,0(a5)
     f84:	fef42623          	sw	a5,-20(s0)
     f88:	fec42783          	lw	a5,-20(s0)
     f8c:	00078513          	mv	a0,a5
     f90:	01c12403          	lw	s0,28(sp)
     f94:	02010113          	addi	sp,sp,32
     f98:	00008067          	ret

00000f9c <i2c_write_data>:
     f9c:	fe010113          	addi	sp,sp,-32
     fa0:	00812e23          	sw	s0,28(sp)
     fa4:	02010413          	addi	s0,sp,32
     fa8:	fea42623          	sw	a0,-20(s0)
     fac:	4601a783          	lw	a5,1120(gp) # 2eb8 <CSRA_DATA1>
     fb0:	00078713          	mv	a4,a5
     fb4:	fec42783          	lw	a5,-20(s0)
     fb8:	00f72023          	sw	a5,0(a4)
     fbc:	00000013          	nop
     fc0:	01c12403          	lw	s0,28(sp)
     fc4:	02010113          	addi	sp,sp,32
     fc8:	00008067          	ret

00000fcc <i2c_read_word>:
     fcc:	fe010113          	addi	sp,sp,-32
     fd0:	00812e23          	sw	s0,28(sp)
     fd4:	02010413          	addi	s0,sp,32
     fd8:	fea42623          	sw	a0,-20(s0)
     fdc:	feb42423          	sw	a1,-24(s0)
     fe0:	fec42783          	lw	a5,-20(s0)
     fe4:	0007a783          	lw	a5,0(a5)
     fe8:	fef42423          	sw	a5,-24(s0)
     fec:	00000013          	nop
     ff0:	01c12403          	lw	s0,28(sp)
     ff4:	02010113          	addi	sp,sp,32
     ff8:	00008067          	ret

00000ffc <i2c_get_status_and_state>:
     ffc:	fd010113          	addi	sp,sp,-48
    1000:	02812623          	sw	s0,44(sp)
    1004:	03010413          	addi	s0,sp,48
    1008:	fca42e23          	sw	a0,-36(s0)
    100c:	fcb42c23          	sw	a1,-40(s0)
    1010:	4641a783          	lw	a5,1124(gp) # 2ebc <CSRA_STATUS>
    1014:	0007a783          	lw	a5,0(a5)
    1018:	fef42623          	sw	a5,-20(s0)
    101c:	fdc42783          	lw	a5,-36(s0)
    1020:	00078863          	beqz	a5,1030 <i2c_get_status_and_state+0x34>
    1024:	fdc42783          	lw	a5,-36(s0)
    1028:	fec42703          	lw	a4,-20(s0)
    102c:	00e7a023          	sw	a4,0(a5)
    1030:	fd842783          	lw	a5,-40(s0)
    1034:	02078063          	beqz	a5,1054 <i2c_get_status_and_state+0x58>
    1038:	fec42783          	lw	a5,-20(s0)
    103c:	0087d793          	srli	a5,a5,0x8
    1040:	0ff7f793          	zext.b	a5,a5
    1044:	01f7f793          	andi	a5,a5,31
    1048:	0ff7f713          	zext.b	a4,a5
    104c:	fd842783          	lw	a5,-40(s0)
    1050:	00e78023          	sb	a4,0(a5)
    1054:	00000013          	nop
    1058:	02c12403          	lw	s0,44(sp)
    105c:	03010113          	addi	sp,sp,48
    1060:	00008067          	ret

00001064 <i2c_start_simple>:
    1064:	fd010113          	addi	sp,sp,-48
    1068:	02112623          	sw	ra,44(sp)
    106c:	02812423          	sw	s0,40(sp)
    1070:	03010413          	addi	s0,sp,48
    1074:	00050793          	mv	a5,a0
    1078:	fcf40fa3          	sb	a5,-33(s0)
    107c:	00058793          	mv	a5,a1
    1080:	fcf40f23          	sb	a5,-34(s0)
    1084:	00060793          	mv	a5,a2
    1088:	fcf40ea3          	sb	a5,-35(s0)
    108c:	00068793          	mv	a5,a3
    1090:	fcf40e23          	sb	a5,-36(s0)
    1094:	00070793          	mv	a5,a4
    1098:	fcf40da3          	sb	a5,-37(s0)
    109c:	fe042023          	sw	zero,-32(s0)
    10a0:	fdf44783          	lbu	a5,-33(s0)
    10a4:	00179793          	slli	a5,a5,0x1
    10a8:	0ff7f713          	zext.b	a4,a5
    10ac:	fe042783          	lw	a5,-32(s0)
    10b0:	00f767b3          	or	a5,a4,a5
    10b4:	fef42023          	sw	a5,-32(s0)
    10b8:	fdd44783          	lbu	a5,-35(s0)
    10bc:	0017f713          	andi	a4,a5,1
    10c0:	fe042783          	lw	a5,-32(s0)
    10c4:	00f767b3          	or	a5,a4,a5
    10c8:	fef42023          	sw	a5,-32(s0)
    10cc:	fde44783          	lbu	a5,-34(s0)
    10d0:	00879713          	slli	a4,a5,0x8
    10d4:	fe042783          	lw	a5,-32(s0)
    10d8:	00f767b3          	or	a5,a4,a5
    10dc:	fef42023          	sw	a5,-32(s0)
    10e0:	fdc44783          	lbu	a5,-36(s0)
    10e4:	01079713          	slli	a4,a5,0x10
    10e8:	000107b7          	lui	a5,0x10
    10ec:	00f77733          	and	a4,a4,a5
    10f0:	fe042783          	lw	a5,-32(s0)
    10f4:	00f767b3          	or	a5,a4,a5
    10f8:	fef42023          	sw	a5,-32(s0)
    10fc:	fdb44783          	lbu	a5,-37(s0)
    1100:	01179713          	slli	a4,a5,0x11
    1104:	000207b7          	lui	a5,0x20
    1108:	00f77733          	and	a4,a4,a5
    110c:	fe042783          	lw	a5,-32(s0)
    1110:	00f767b3          	or	a5,a4,a5
    1114:	fef42023          	sw	a5,-32(s0)
    1118:	fe042703          	lw	a4,-32(s0)
    111c:	800007b7          	lui	a5,0x80000
    1120:	00f767b3          	or	a5,a4,a5
    1124:	fef42023          	sw	a5,-32(s0)
    1128:	fe042783          	lw	a5,-32(s0)
    112c:	00078593          	mv	a1,a5
    1130:	13018513          	addi	a0,gp,304 # 2b88 <__global_pointer$+0x130>
    1134:	968ff0ef          	jal	29c <my_printf>
    1138:	45c1a783          	lw	a5,1116(gp) # 2eb4 <CSRA_DATA0>
    113c:	00078713          	mv	a4,a5
    1140:	fe042783          	lw	a5,-32(s0)
    1144:	00f72023          	sw	a5,0(a4)
    1148:	45c1a783          	lw	a5,1116(gp) # 2eb4 <CSRA_DATA0>
    114c:	0007a783          	lw	a5,0(a5) # 80000000 <_memory_end+0x7ffe0000>
    1150:	fef42423          	sw	a5,-24(s0)
    1154:	fe042783          	lw	a5,-32(s0)
    1158:	00078613          	mv	a2,a5
    115c:	fe842583          	lw	a1,-24(s0)
    1160:	15018513          	addi	a0,gp,336 # 2ba8 <__global_pointer$+0x150>
    1164:	938ff0ef          	jal	29c <my_printf>
    1168:	fe042783          	lw	a5,-32(s0)
    116c:	fe842703          	lw	a4,-24(s0)
    1170:	00f70c63          	beq	a4,a5,1188 <i2c_start_simple+0x124>
    1174:	fe042783          	lw	a5,-32(s0)
    1178:	fe842603          	lw	a2,-24(s0)
    117c:	00078593          	mv	a1,a5
    1180:	19018513          	addi	a0,gp,400 # 2be8 <__global_pointer$+0x190>
    1184:	918ff0ef          	jal	29c <my_printf>
    1188:	fdf40783          	lb	a5,-33(s0)
    118c:	00179793          	slli	a5,a5,0x1
    1190:	01879713          	slli	a4,a5,0x18
    1194:	41875713          	srai	a4,a4,0x18
    1198:	fdd44783          	lbu	a5,-35(s0)
    119c:	00f037b3          	snez	a5,a5
    11a0:	0ff7f793          	zext.b	a5,a5
    11a4:	01879793          	slli	a5,a5,0x18
    11a8:	4187d793          	srai	a5,a5,0x18
    11ac:	00f767b3          	or	a5,a4,a5
    11b0:	01879793          	slli	a5,a5,0x18
    11b4:	4187d793          	srai	a5,a5,0x18
    11b8:	fef403a3          	sb	a5,-25(s0)
    11bc:	fe042783          	lw	a5,-32(s0)
    11c0:	00078593          	mv	a1,a5
    11c4:	1cc18513          	addi	a0,gp,460 # 2c24 <__global_pointer$+0x1cc>
    11c8:	8d4ff0ef          	jal	29c <my_printf>
    11cc:	fdf44783          	lbu	a5,-33(s0)
    11d0:	fdd44703          	lbu	a4,-35(s0)
    11d4:	fe744683          	lbu	a3,-25(s0)
    11d8:	00070613          	mv	a2,a4
    11dc:	00078593          	mv	a1,a5
    11e0:	1ec18513          	addi	a0,gp,492 # 2c44 <__global_pointer$+0x1ec>
    11e4:	8b8ff0ef          	jal	29c <my_printf>
    11e8:	00700793          	li	a5,7
    11ec:	fef42623          	sw	a5,-20(s0)
    11f0:	02c0006f          	j	121c <i2c_start_simple+0x1b8>
    11f4:	fe744703          	lbu	a4,-25(s0)
    11f8:	fec42783          	lw	a5,-20(s0)
    11fc:	40f757b3          	sra	a5,a4,a5
    1200:	0017f793          	andi	a5,a5,1
    1204:	00078593          	mv	a1,a5
    1208:	22818513          	addi	a0,gp,552 # 2c80 <__global_pointer$+0x228>
    120c:	890ff0ef          	jal	29c <my_printf>
    1210:	fec42783          	lw	a5,-20(s0)
    1214:	fff78793          	addi	a5,a5,-1
    1218:	fef42623          	sw	a5,-20(s0)
    121c:	fec42783          	lw	a5,-20(s0)
    1220:	fc07dae3          	bgez	a5,11f4 <i2c_start_simple+0x190>
    1224:	22c18513          	addi	a0,gp,556 # 2c84 <__global_pointer$+0x22c>
    1228:	874ff0ef          	jal	29c <my_printf>
    122c:	00000013          	nop
    1230:	02c12083          	lw	ra,44(sp)
    1234:	02812403          	lw	s0,40(sp)
    1238:	03010113          	addi	sp,sp,48
    123c:	00008067          	ret

00001240 <i2c_init>:
    1240:	fe010113          	addi	sp,sp,-32
    1244:	00112e23          	sw	ra,28(sp)
    1248:	00812c23          	sw	s0,24(sp)
    124c:	02010413          	addi	s0,sp,32
    1250:	fe042623          	sw	zero,-20(s0)
    1254:	45c1a783          	lw	a5,1116(gp) # 2eb4 <CSRA_DATA0>
    1258:	00078713          	mv	a4,a5
    125c:	fec42783          	lw	a5,-20(s0)
    1260:	00f72023          	sw	a5,0(a4)
    1264:	fe740713          	addi	a4,s0,-25
    1268:	fe840793          	addi	a5,s0,-24
    126c:	00070593          	mv	a1,a4
    1270:	00078513          	mv	a0,a5
    1274:	d89ff0ef          	jal	ffc <i2c_get_status_and_state>
    1278:	fe842583          	lw	a1,-24(s0)
    127c:	fe842783          	lw	a5,-24(s0)
    1280:	0017f613          	andi	a2,a5,1
    1284:	fe842783          	lw	a5,-24(s0)
    1288:	0017d793          	srli	a5,a5,0x1
    128c:	0017f793          	andi	a5,a5,1
    1290:	fe744703          	lbu	a4,-25(s0)
    1294:	00078693          	mv	a3,a5
    1298:	23018513          	addi	a0,gp,560 # 2c88 <__global_pointer$+0x230>
    129c:	800ff0ef          	jal	29c <my_printf>
    12a0:	00000013          	nop
    12a4:	01c12083          	lw	ra,28(sp)
    12a8:	01812403          	lw	s0,24(sp)
    12ac:	02010113          	addi	sp,sp,32
    12b0:	00008067          	ret

000012b4 <i2c_csr>:
    12b4:	fe010113          	addi	sp,sp,-32
    12b8:	00112e23          	sw	ra,28(sp)
    12bc:	00812c23          	sw	s0,24(sp)
    12c0:	02010413          	addi	s0,sp,32
    12c4:	27018513          	addi	a0,gp,624 # 2cc8 <__global_pointer$+0x270>
    12c8:	fd5fe0ef          	jal	29c <my_printf>
    12cc:	4541a783          	lw	a5,1108(gp) # 2eac <CSRA_VERSION>
    12d0:	0007a783          	lw	a5,0(a5)
    12d4:	fef42623          	sw	a5,-20(s0)
    12d8:	fec42583          	lw	a1,-20(s0)
    12dc:	28018513          	addi	a0,gp,640 # 2cd8 <__global_pointer$+0x280>
    12e0:	fbdfe0ef          	jal	29c <my_printf>
    12e4:	4581a783          	lw	a5,1112(gp) # 2eb0 <CSRA_NAME>
    12e8:	0007a783          	lw	a5,0(a5)
    12ec:	fef42623          	sw	a5,-20(s0)
    12f0:	fec42583          	lw	a1,-20(s0)
    12f4:	29818513          	addi	a0,gp,664 # 2cf0 <__global_pointer$+0x298>
    12f8:	fa5fe0ef          	jal	29c <my_printf>
    12fc:	45c1a783          	lw	a5,1116(gp) # 2eb4 <CSRA_DATA0>
    1300:	0007a783          	lw	a5,0(a5)
    1304:	fef42623          	sw	a5,-20(s0)
    1308:	fec42583          	lw	a1,-20(s0)
    130c:	2b018513          	addi	a0,gp,688 # 2d08 <__global_pointer$+0x2b0>
    1310:	f8dfe0ef          	jal	29c <my_printf>
    1314:	4601a783          	lw	a5,1120(gp) # 2eb8 <CSRA_DATA1>
    1318:	0007a783          	lw	a5,0(a5)
    131c:	fef42623          	sw	a5,-20(s0)
    1320:	fec42583          	lw	a1,-20(s0)
    1324:	2c818513          	addi	a0,gp,712 # 2d20 <__global_pointer$+0x2c8>
    1328:	f75fe0ef          	jal	29c <my_printf>
    132c:	4641a783          	lw	a5,1124(gp) # 2ebc <CSRA_STATUS>
    1330:	0007a783          	lw	a5,0(a5)
    1334:	fef42623          	sw	a5,-20(s0)
    1338:	fec42583          	lw	a1,-20(s0)
    133c:	2e018513          	addi	a0,gp,736 # 2d38 <__global_pointer$+0x2e0>
    1340:	f5dfe0ef          	jal	29c <my_printf>
    1344:	4681a783          	lw	a5,1128(gp) # 2ec0 <CSRA_DATA2>
    1348:	0007a783          	lw	a5,0(a5)
    134c:	fef42623          	sw	a5,-20(s0)
    1350:	fec42583          	lw	a1,-20(s0)
    1354:	2f818513          	addi	a0,gp,760 # 2d50 <__global_pointer$+0x2f8>
    1358:	f45fe0ef          	jal	29c <my_printf>
    135c:	31018513          	addi	a0,gp,784 # 2d68 <__global_pointer$+0x310>
    1360:	f3dfe0ef          	jal	29c <my_printf>
    1364:	00000013          	nop
    1368:	01c12083          	lw	ra,28(sp)
    136c:	01812403          	lw	s0,24(sp)
    1370:	02010113          	addi	sp,sp,32
    1374:	00008067          	ret

00001378 <i2c_set_addr>:
    1378:	fe010113          	addi	sp,sp,-32
    137c:	00812e23          	sw	s0,28(sp)
    1380:	02010413          	addi	s0,sp,32
    1384:	fea42623          	sw	a0,-20(s0)
    1388:	fec42703          	lw	a4,-20(s0)
    138c:	44e1a823          	sw	a4,1104(gp) # 2ea8 <ADDR_I2C>
    1390:	fec42703          	lw	a4,-20(s0)
    1394:	44e1aa23          	sw	a4,1108(gp) # 2eac <CSRA_VERSION>
    1398:	fec42783          	lw	a5,-20(s0)
    139c:	00478713          	addi	a4,a5,4
    13a0:	44e1ac23          	sw	a4,1112(gp) # 2eb0 <CSRA_NAME>
    13a4:	fec42783          	lw	a5,-20(s0)
    13a8:	00878713          	addi	a4,a5,8
    13ac:	44e1ae23          	sw	a4,1116(gp) # 2eb4 <CSRA_DATA0>
    13b0:	fec42783          	lw	a5,-20(s0)
    13b4:	00c78713          	addi	a4,a5,12
    13b8:	46e1a023          	sw	a4,1120(gp) # 2eb8 <CSRA_DATA1>
    13bc:	fec42783          	lw	a5,-20(s0)
    13c0:	01078713          	addi	a4,a5,16
    13c4:	46e1a223          	sw	a4,1124(gp) # 2ebc <CSRA_STATUS>
    13c8:	fec42783          	lw	a5,-20(s0)
    13cc:	01478713          	addi	a4,a5,20
    13d0:	46e1a423          	sw	a4,1128(gp) # 2ec0 <CSRA_DATA2>
    13d4:	00000793          	li	a5,0
    13d8:	00078513          	mv	a0,a5
    13dc:	01c12403          	lw	s0,28(sp)
    13e0:	02010113          	addi	sp,sp,32
    13e4:	00008067          	ret

000013e8 <i2c_get_addr>:
    13e8:	ff010113          	addi	sp,sp,-16
    13ec:	00812623          	sw	s0,12(sp)
    13f0:	01010413          	addi	s0,sp,16
    13f4:	4501a783          	lw	a5,1104(gp) # 2ea8 <ADDR_I2C>
    13f8:	00078513          	mv	a0,a5
    13fc:	00c12403          	lw	s0,12(sp)
    1400:	01010113          	addi	sp,sp,16
    1404:	00008067          	ret

00001408 <busy_delay>:
    1408:	fd010113          	addi	sp,sp,-48
    140c:	02812623          	sw	s0,44(sp)
    1410:	03010413          	addi	s0,sp,48
    1414:	fca42e23          	sw	a0,-36(s0)
    1418:	fe042623          	sw	zero,-20(s0)
    141c:	0140006f          	j	1430 <busy_delay+0x28>
    1420:	00000013          	nop
    1424:	fec42783          	lw	a5,-20(s0)
    1428:	00178793          	addi	a5,a5,1
    142c:	fef42623          	sw	a5,-20(s0)
    1430:	fec42783          	lw	a5,-20(s0)
    1434:	fdc42703          	lw	a4,-36(s0)
    1438:	fee7e4e3          	bltu	a5,a4,1420 <busy_delay+0x18>
    143c:	00000013          	nop
    1440:	00000013          	nop
    1444:	02c12403          	lw	s0,44(sp)
    1448:	03010113          	addi	sp,sp,48
    144c:	00008067          	ret

00001450 <eeprom_write_byte>:
    1450:	fe010113          	addi	sp,sp,-32
    1454:	00112e23          	sw	ra,28(sp)
    1458:	00812c23          	sw	s0,24(sp)
    145c:	02010413          	addi	s0,sp,32
    1460:	00050793          	mv	a5,a0
    1464:	00058693          	mv	a3,a1
    1468:	00060713          	mv	a4,a2
    146c:	fef407a3          	sb	a5,-17(s0)
    1470:	00068793          	mv	a5,a3
    1474:	fef40723          	sb	a5,-18(s0)
    1478:	00070793          	mv	a5,a4
    147c:	fef406a3          	sb	a5,-19(s0)
    1480:	90040537          	lui	a0,0x90040
    1484:	ef5ff0ef          	jal	1378 <i2c_set_addr>
    1488:	fed44783          	lbu	a5,-19(s0)
    148c:	00078513          	mv	a0,a5
    1490:	b0dff0ef          	jal	f9c <i2c_write_data>
    1494:	fee44583          	lbu	a1,-18(s0)
    1498:	fef44783          	lbu	a5,-17(s0)
    149c:	00000713          	li	a4,0
    14a0:	00000693          	li	a3,0
    14a4:	00000613          	li	a2,0
    14a8:	00078513          	mv	a0,a5
    14ac:	bb9ff0ef          	jal	1064 <i2c_start_simple>
    14b0:	004c57b7          	lui	a5,0x4c5
    14b4:	b4078513          	addi	a0,a5,-1216 # 4c4b40 <_memory_end+0x4a4b40>
    14b8:	f51ff0ef          	jal	1408 <busy_delay>
    14bc:	00000013          	nop
    14c0:	01c12083          	lw	ra,28(sp)
    14c4:	01812403          	lw	s0,24(sp)
    14c8:	02010113          	addi	sp,sp,32
    14cc:	00008067          	ret

000014d0 <eeprom_read_byte>:
    14d0:	fd010113          	addi	sp,sp,-48
    14d4:	02112623          	sw	ra,44(sp)
    14d8:	02812423          	sw	s0,40(sp)
    14dc:	03010413          	addi	s0,sp,48
    14e0:	00050793          	mv	a5,a0
    14e4:	00058713          	mv	a4,a1
    14e8:	fcf40fa3          	sb	a5,-33(s0)
    14ec:	00070793          	mv	a5,a4
    14f0:	fcf40f23          	sb	a5,-34(s0)
    14f4:	90040537          	lui	a0,0x90040
    14f8:	e81ff0ef          	jal	1378 <i2c_set_addr>
    14fc:	fde44583          	lbu	a1,-34(s0)
    1500:	fdf44783          	lbu	a5,-33(s0)
    1504:	00000713          	li	a4,0
    1508:	00100693          	li	a3,1
    150c:	00100613          	li	a2,1
    1510:	00078513          	mv	a0,a5
    1514:	b51ff0ef          	jal	1064 <i2c_start_simple>
    1518:	009897b7          	lui	a5,0x989
    151c:	68078513          	addi	a0,a5,1664 # 989680 <_memory_end+0x969680>
    1520:	ee9ff0ef          	jal	1408 <busy_delay>
    1524:	a4dff0ef          	jal	f70 <i2c_read_data>
    1528:	00050793          	mv	a5,a0
    152c:	fef407a3          	sb	a5,-17(s0)
    1530:	fef44783          	lbu	a5,-17(s0)
    1534:	00078513          	mv	a0,a5
    1538:	02c12083          	lw	ra,44(sp)
    153c:	02812403          	lw	s0,40(sp)
    1540:	03010113          	addi	sp,sp,48
    1544:	00008067          	ret

00001548 <eeprom_write_word32>:
    1548:	fe010113          	addi	sp,sp,-32
    154c:	00112e23          	sw	ra,28(sp)
    1550:	00812c23          	sw	s0,24(sp)
    1554:	02010413          	addi	s0,sp,32
    1558:	00050793          	mv	a5,a0
    155c:	00058713          	mv	a4,a1
    1560:	fec42423          	sw	a2,-24(s0)
    1564:	fef407a3          	sb	a5,-17(s0)
    1568:	00070793          	mv	a5,a4
    156c:	fef40723          	sb	a5,-18(s0)
    1570:	90040537          	lui	a0,0x90040
    1574:	e05ff0ef          	jal	1378 <i2c_set_addr>
    1578:	fe842503          	lw	a0,-24(s0)
    157c:	a21ff0ef          	jal	f9c <i2c_write_data>
    1580:	fee44583          	lbu	a1,-18(s0)
    1584:	fef44783          	lbu	a5,-17(s0)
    1588:	00100713          	li	a4,1
    158c:	00000693          	li	a3,0
    1590:	00000613          	li	a2,0
    1594:	00078513          	mv	a0,a5
    1598:	acdff0ef          	jal	1064 <i2c_start_simple>
    159c:	009897b7          	lui	a5,0x989
    15a0:	68078513          	addi	a0,a5,1664 # 989680 <_memory_end+0x969680>
    15a4:	e65ff0ef          	jal	1408 <busy_delay>
    15a8:	00000013          	nop
    15ac:	01c12083          	lw	ra,28(sp)
    15b0:	01812403          	lw	s0,24(sp)
    15b4:	02010113          	addi	sp,sp,32
    15b8:	00008067          	ret

000015bc <eeprom_read_word32>:
    15bc:	fe010113          	addi	sp,sp,-32
    15c0:	00112e23          	sw	ra,28(sp)
    15c4:	00812c23          	sw	s0,24(sp)
    15c8:	02010413          	addi	s0,sp,32
    15cc:	00050793          	mv	a5,a0
    15d0:	00058713          	mv	a4,a1
    15d4:	fef407a3          	sb	a5,-17(s0)
    15d8:	00070793          	mv	a5,a4
    15dc:	fef40723          	sb	a5,-18(s0)
    15e0:	90040537          	lui	a0,0x90040
    15e4:	d95ff0ef          	jal	1378 <i2c_set_addr>
    15e8:	fee44583          	lbu	a1,-18(s0)
    15ec:	fef44783          	lbu	a5,-17(s0)
    15f0:	00100713          	li	a4,1
    15f4:	00100693          	li	a3,1
    15f8:	00100613          	li	a2,1
    15fc:	00078513          	mv	a0,a5
    1600:	a65ff0ef          	jal	1064 <i2c_start_simple>
    1604:	009897b7          	lui	a5,0x989
    1608:	68078513          	addi	a0,a5,1664 # 989680 <_memory_end+0x969680>
    160c:	dfdff0ef          	jal	1408 <busy_delay>
    1610:	961ff0ef          	jal	f70 <i2c_read_data>
    1614:	00050793          	mv	a5,a0
    1618:	00078513          	mv	a0,a5
    161c:	01c12083          	lw	ra,28(sp)
    1620:	01812403          	lw	s0,24(sp)
    1624:	02010113          	addi	sp,sp,32
    1628:	00008067          	ret

0000162c <__adddf3>:
    162c:	00100837          	lui	a6,0x100
    1630:	fff80813          	addi	a6,a6,-1 # fffff <_memory_end+0xdffff>
    1634:	fe010113          	addi	sp,sp,-32
    1638:	00b878b3          	and	a7,a6,a1
    163c:	0145d713          	srli	a4,a1,0x14
    1640:	01d55793          	srli	a5,a0,0x1d
    1644:	00d87833          	and	a6,a6,a3
    1648:	00912a23          	sw	s1,20(sp)
    164c:	7ff77493          	andi	s1,a4,2047
    1650:	00389713          	slli	a4,a7,0x3
    1654:	0146d893          	srli	a7,a3,0x14
    1658:	00381813          	slli	a6,a6,0x3
    165c:	01212823          	sw	s2,16(sp)
    1660:	00e7e7b3          	or	a5,a5,a4
    1664:	7ff8f893          	andi	a7,a7,2047
    1668:	01d65713          	srli	a4,a2,0x1d
    166c:	00112e23          	sw	ra,28(sp)
    1670:	00812c23          	sw	s0,24(sp)
    1674:	01312623          	sw	s3,12(sp)
    1678:	01f5d913          	srli	s2,a1,0x1f
    167c:	01f6d693          	srli	a3,a3,0x1f
    1680:	01076733          	or	a4,a4,a6
    1684:	00351513          	slli	a0,a0,0x3
    1688:	00361613          	slli	a2,a2,0x3
    168c:	41148833          	sub	a6,s1,a7
    1690:	2ad91a63          	bne	s2,a3,1944 <__adddf3+0x318>
    1694:	11005c63          	blez	a6,17ac <__adddf3+0x180>
    1698:	04089063          	bnez	a7,16d8 <__adddf3+0xac>
    169c:	00c766b3          	or	a3,a4,a2
    16a0:	66068063          	beqz	a3,1d00 <__adddf3+0x6d4>
    16a4:	fff80593          	addi	a1,a6,-1
    16a8:	02059063          	bnez	a1,16c8 <__adddf3+0x9c>
    16ac:	00c50633          	add	a2,a0,a2
    16b0:	00a636b3          	sltu	a3,a2,a0
    16b4:	00e78733          	add	a4,a5,a4
    16b8:	00060513          	mv	a0,a2
    16bc:	00d707b3          	add	a5,a4,a3
    16c0:	00100493          	li	s1,1
    16c4:	06c0006f          	j	1730 <__adddf3+0x104>
    16c8:	7ff00693          	li	a3,2047
    16cc:	02d81063          	bne	a6,a3,16ec <__adddf3+0xc0>
    16d0:	7ff00493          	li	s1,2047
    16d4:	1f80006f          	j	18cc <__adddf3+0x2a0>
    16d8:	7ff00693          	li	a3,2047
    16dc:	1ed48863          	beq	s1,a3,18cc <__adddf3+0x2a0>
    16e0:	008006b7          	lui	a3,0x800
    16e4:	00d76733          	or	a4,a4,a3
    16e8:	00080593          	mv	a1,a6
    16ec:	03800693          	li	a3,56
    16f0:	0ab6c863          	blt	a3,a1,17a0 <__adddf3+0x174>
    16f4:	01f00693          	li	a3,31
    16f8:	06b6ca63          	blt	a3,a1,176c <__adddf3+0x140>
    16fc:	02000813          	li	a6,32
    1700:	40b80833          	sub	a6,a6,a1
    1704:	010716b3          	sll	a3,a4,a6
    1708:	00b658b3          	srl	a7,a2,a1
    170c:	01061833          	sll	a6,a2,a6
    1710:	0116e6b3          	or	a3,a3,a7
    1714:	01003833          	snez	a6,a6
    1718:	0106e6b3          	or	a3,a3,a6
    171c:	00b755b3          	srl	a1,a4,a1
    1720:	00a68533          	add	a0,a3,a0
    1724:	00f585b3          	add	a1,a1,a5
    1728:	00d536b3          	sltu	a3,a0,a3
    172c:	00d587b3          	add	a5,a1,a3
    1730:	00879713          	slli	a4,a5,0x8
    1734:	18075c63          	bgez	a4,18cc <__adddf3+0x2a0>
    1738:	00148493          	addi	s1,s1,1
    173c:	7ff00713          	li	a4,2047
    1740:	5ae48a63          	beq	s1,a4,1cf4 <__adddf3+0x6c8>
    1744:	ff800737          	lui	a4,0xff800
    1748:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    174c:	00e7f733          	and	a4,a5,a4
    1750:	00155793          	srli	a5,a0,0x1
    1754:	00157513          	andi	a0,a0,1
    1758:	00a7e7b3          	or	a5,a5,a0
    175c:	01f71513          	slli	a0,a4,0x1f
    1760:	00f56533          	or	a0,a0,a5
    1764:	00175793          	srli	a5,a4,0x1
    1768:	1640006f          	j	18cc <__adddf3+0x2a0>
    176c:	fe058693          	addi	a3,a1,-32
    1770:	02000893          	li	a7,32
    1774:	00d756b3          	srl	a3,a4,a3
    1778:	00000813          	li	a6,0
    177c:	01158863          	beq	a1,a7,178c <__adddf3+0x160>
    1780:	04000813          	li	a6,64
    1784:	40b80833          	sub	a6,a6,a1
    1788:	01071833          	sll	a6,a4,a6
    178c:	00c86833          	or	a6,a6,a2
    1790:	01003833          	snez	a6,a6
    1794:	0106e6b3          	or	a3,a3,a6
    1798:	00000593          	li	a1,0
    179c:	f85ff06f          	j	1720 <__adddf3+0xf4>
    17a0:	00c766b3          	or	a3,a4,a2
    17a4:	00d036b3          	snez	a3,a3
    17a8:	ff1ff06f          	j	1798 <__adddf3+0x16c>
    17ac:	0c080a63          	beqz	a6,1880 <__adddf3+0x254>
    17b0:	409886b3          	sub	a3,a7,s1
    17b4:	02049463          	bnez	s1,17dc <__adddf3+0x1b0>
    17b8:	00a7e5b3          	or	a1,a5,a0
    17bc:	50058e63          	beqz	a1,1cd8 <__adddf3+0x6ac>
    17c0:	fff68593          	addi	a1,a3,-1 # 7fffff <_memory_end+0x7dffff>
    17c4:	ee0584e3          	beqz	a1,16ac <__adddf3+0x80>
    17c8:	7ff00813          	li	a6,2047
    17cc:	03069263          	bne	a3,a6,17f0 <__adddf3+0x1c4>
    17d0:	00070793          	mv	a5,a4
    17d4:	00060513          	mv	a0,a2
    17d8:	ef9ff06f          	j	16d0 <__adddf3+0xa4>
    17dc:	7ff00593          	li	a1,2047
    17e0:	feb888e3          	beq	a7,a1,17d0 <__adddf3+0x1a4>
    17e4:	008005b7          	lui	a1,0x800
    17e8:	00b7e7b3          	or	a5,a5,a1
    17ec:	00068593          	mv	a1,a3
    17f0:	03800693          	li	a3,56
    17f4:	08b6c063          	blt	a3,a1,1874 <__adddf3+0x248>
    17f8:	01f00693          	li	a3,31
    17fc:	04b6c263          	blt	a3,a1,1840 <__adddf3+0x214>
    1800:	02000813          	li	a6,32
    1804:	40b80833          	sub	a6,a6,a1
    1808:	010796b3          	sll	a3,a5,a6
    180c:	00b55333          	srl	t1,a0,a1
    1810:	01051833          	sll	a6,a0,a6
    1814:	0066e6b3          	or	a3,a3,t1
    1818:	01003833          	snez	a6,a6
    181c:	0106e6b3          	or	a3,a3,a6
    1820:	00b7d5b3          	srl	a1,a5,a1
    1824:	00c68633          	add	a2,a3,a2
    1828:	00e585b3          	add	a1,a1,a4
    182c:	00d636b3          	sltu	a3,a2,a3
    1830:	00060513          	mv	a0,a2
    1834:	00d587b3          	add	a5,a1,a3
    1838:	00088493          	mv	s1,a7
    183c:	ef5ff06f          	j	1730 <__adddf3+0x104>
    1840:	fe058693          	addi	a3,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    1844:	02000313          	li	t1,32
    1848:	00d7d6b3          	srl	a3,a5,a3
    184c:	00000813          	li	a6,0
    1850:	00658863          	beq	a1,t1,1860 <__adddf3+0x234>
    1854:	04000813          	li	a6,64
    1858:	40b80833          	sub	a6,a6,a1
    185c:	01079833          	sll	a6,a5,a6
    1860:	00a86833          	or	a6,a6,a0
    1864:	01003833          	snez	a6,a6
    1868:	0106e6b3          	or	a3,a3,a6
    186c:	00000593          	li	a1,0
    1870:	fb5ff06f          	j	1824 <__adddf3+0x1f8>
    1874:	00a7e6b3          	or	a3,a5,a0
    1878:	00d036b3          	snez	a3,a3
    187c:	ff1ff06f          	j	186c <__adddf3+0x240>
    1880:	00148693          	addi	a3,s1,1
    1884:	7fe6f593          	andi	a1,a3,2046
    1888:	08059663          	bnez	a1,1914 <__adddf3+0x2e8>
    188c:	00a7e6b3          	or	a3,a5,a0
    1890:	06049263          	bnez	s1,18f4 <__adddf3+0x2c8>
    1894:	44068863          	beqz	a3,1ce4 <__adddf3+0x6b8>
    1898:	00c766b3          	or	a3,a4,a2
    189c:	02068863          	beqz	a3,18cc <__adddf3+0x2a0>
    18a0:	00c50633          	add	a2,a0,a2
    18a4:	00a636b3          	sltu	a3,a2,a0
    18a8:	00e78733          	add	a4,a5,a4
    18ac:	00d707b3          	add	a5,a4,a3
    18b0:	00879713          	slli	a4,a5,0x8
    18b4:	00060513          	mv	a0,a2
    18b8:	00075a63          	bgez	a4,18cc <__adddf3+0x2a0>
    18bc:	ff800737          	lui	a4,0xff800
    18c0:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    18c4:	00e7f7b3          	and	a5,a5,a4
    18c8:	00100493          	li	s1,1
    18cc:	00757713          	andi	a4,a0,7
    18d0:	44070863          	beqz	a4,1d20 <__adddf3+0x6f4>
    18d4:	00f57713          	andi	a4,a0,15
    18d8:	00400693          	li	a3,4
    18dc:	44d70263          	beq	a4,a3,1d20 <__adddf3+0x6f4>
    18e0:	00450713          	addi	a4,a0,4 # 90040004 <_memory_end+0x90020004>
    18e4:	00a736b3          	sltu	a3,a4,a0
    18e8:	00d787b3          	add	a5,a5,a3
    18ec:	00070513          	mv	a0,a4
    18f0:	4300006f          	j	1d20 <__adddf3+0x6f4>
    18f4:	ec068ee3          	beqz	a3,17d0 <__adddf3+0x1a4>
    18f8:	00c76633          	or	a2,a4,a2
    18fc:	dc060ae3          	beqz	a2,16d0 <__adddf3+0xa4>
    1900:	00000913          	li	s2,0
    1904:	004007b7          	lui	a5,0x400
    1908:	00000513          	li	a0,0
    190c:	7ff00493          	li	s1,2047
    1910:	4100006f          	j	1d20 <__adddf3+0x6f4>
    1914:	7ff00593          	li	a1,2047
    1918:	3cb68c63          	beq	a3,a1,1cf0 <__adddf3+0x6c4>
    191c:	00c50633          	add	a2,a0,a2
    1920:	00a63533          	sltu	a0,a2,a0
    1924:	00e78733          	add	a4,a5,a4
    1928:	00a70733          	add	a4,a4,a0
    192c:	01f71513          	slli	a0,a4,0x1f
    1930:	00165613          	srli	a2,a2,0x1
    1934:	00c56533          	or	a0,a0,a2
    1938:	00175793          	srli	a5,a4,0x1
    193c:	00068493          	mv	s1,a3
    1940:	f8dff06f          	j	18cc <__adddf3+0x2a0>
    1944:	0f005c63          	blez	a6,1a3c <__adddf3+0x410>
    1948:	08089e63          	bnez	a7,19e4 <__adddf3+0x3b8>
    194c:	00c766b3          	or	a3,a4,a2
    1950:	3a068863          	beqz	a3,1d00 <__adddf3+0x6d4>
    1954:	fff80693          	addi	a3,a6,-1
    1958:	02069063          	bnez	a3,1978 <__adddf3+0x34c>
    195c:	40c50633          	sub	a2,a0,a2
    1960:	00c536b3          	sltu	a3,a0,a2
    1964:	40e78733          	sub	a4,a5,a4
    1968:	00060513          	mv	a0,a2
    196c:	40d707b3          	sub	a5,a4,a3
    1970:	00100493          	li	s1,1
    1974:	0540006f          	j	19c8 <__adddf3+0x39c>
    1978:	7ff00593          	li	a1,2047
    197c:	d4b80ae3          	beq	a6,a1,16d0 <__adddf3+0xa4>
    1980:	03800593          	li	a1,56
    1984:	0ad5c663          	blt	a1,a3,1a30 <__adddf3+0x404>
    1988:	01f00593          	li	a1,31
    198c:	06d5c863          	blt	a1,a3,19fc <__adddf3+0x3d0>
    1990:	02000813          	li	a6,32
    1994:	40d80833          	sub	a6,a6,a3
    1998:	00d658b3          	srl	a7,a2,a3
    199c:	010715b3          	sll	a1,a4,a6
    19a0:	01061833          	sll	a6,a2,a6
    19a4:	0115e5b3          	or	a1,a1,a7
    19a8:	01003833          	snez	a6,a6
    19ac:	0105e633          	or	a2,a1,a6
    19b0:	00d756b3          	srl	a3,a4,a3
    19b4:	40c50633          	sub	a2,a0,a2
    19b8:	00c53733          	sltu	a4,a0,a2
    19bc:	40d786b3          	sub	a3,a5,a3
    19c0:	00060513          	mv	a0,a2
    19c4:	40e687b3          	sub	a5,a3,a4
    19c8:	00879713          	slli	a4,a5,0x8
    19cc:	f00750e3          	bgez	a4,18cc <__adddf3+0x2a0>
    19d0:	00800437          	lui	s0,0x800
    19d4:	fff40413          	addi	s0,s0,-1 # 7fffff <_memory_end+0x7dffff>
    19d8:	0087f433          	and	s0,a5,s0
    19dc:	00050993          	mv	s3,a0
    19e0:	2100006f          	j	1bf0 <__adddf3+0x5c4>
    19e4:	7ff00693          	li	a3,2047
    19e8:	eed482e3          	beq	s1,a3,18cc <__adddf3+0x2a0>
    19ec:	008006b7          	lui	a3,0x800
    19f0:	00d76733          	or	a4,a4,a3
    19f4:	00080693          	mv	a3,a6
    19f8:	f89ff06f          	j	1980 <__adddf3+0x354>
    19fc:	fe068593          	addi	a1,a3,-32 # 7fffe0 <_memory_end+0x7dffe0>
    1a00:	02000893          	li	a7,32
    1a04:	00b755b3          	srl	a1,a4,a1
    1a08:	00000813          	li	a6,0
    1a0c:	01168863          	beq	a3,a7,1a1c <__adddf3+0x3f0>
    1a10:	04000813          	li	a6,64
    1a14:	40d80833          	sub	a6,a6,a3
    1a18:	01071833          	sll	a6,a4,a6
    1a1c:	00c86833          	or	a6,a6,a2
    1a20:	01003833          	snez	a6,a6
    1a24:	0105e633          	or	a2,a1,a6
    1a28:	00000693          	li	a3,0
    1a2c:	f89ff06f          	j	19b4 <__adddf3+0x388>
    1a30:	00c76633          	or	a2,a4,a2
    1a34:	00c03633          	snez	a2,a2
    1a38:	ff1ff06f          	j	1a28 <__adddf3+0x3fc>
    1a3c:	0e080863          	beqz	a6,1b2c <__adddf3+0x500>
    1a40:	40988833          	sub	a6,a7,s1
    1a44:	04049263          	bnez	s1,1a88 <__adddf3+0x45c>
    1a48:	00a7e5b3          	or	a1,a5,a0
    1a4c:	2a058e63          	beqz	a1,1d08 <__adddf3+0x6dc>
    1a50:	fff80593          	addi	a1,a6,-1
    1a54:	00059e63          	bnez	a1,1a70 <__adddf3+0x444>
    1a58:	40a60533          	sub	a0,a2,a0
    1a5c:	40f70733          	sub	a4,a4,a5
    1a60:	00a63633          	sltu	a2,a2,a0
    1a64:	40c707b3          	sub	a5,a4,a2
    1a68:	00068913          	mv	s2,a3
    1a6c:	f05ff06f          	j	1970 <__adddf3+0x344>
    1a70:	7ff00313          	li	t1,2047
    1a74:	02681463          	bne	a6,t1,1a9c <__adddf3+0x470>
    1a78:	00070793          	mv	a5,a4
    1a7c:	00060513          	mv	a0,a2
    1a80:	7ff00493          	li	s1,2047
    1a84:	0d00006f          	j	1b54 <__adddf3+0x528>
    1a88:	7ff00593          	li	a1,2047
    1a8c:	feb886e3          	beq	a7,a1,1a78 <__adddf3+0x44c>
    1a90:	008005b7          	lui	a1,0x800
    1a94:	00b7e7b3          	or	a5,a5,a1
    1a98:	00080593          	mv	a1,a6
    1a9c:	03800813          	li	a6,56
    1aa0:	08b84063          	blt	a6,a1,1b20 <__adddf3+0x4f4>
    1aa4:	01f00813          	li	a6,31
    1aa8:	04b84263          	blt	a6,a1,1aec <__adddf3+0x4c0>
    1aac:	02000313          	li	t1,32
    1ab0:	40b30333          	sub	t1,t1,a1
    1ab4:	00b55e33          	srl	t3,a0,a1
    1ab8:	00679833          	sll	a6,a5,t1
    1abc:	00651333          	sll	t1,a0,t1
    1ac0:	01c86833          	or	a6,a6,t3
    1ac4:	00603333          	snez	t1,t1
    1ac8:	00686533          	or	a0,a6,t1
    1acc:	00b7d5b3          	srl	a1,a5,a1
    1ad0:	40a60533          	sub	a0,a2,a0
    1ad4:	40b705b3          	sub	a1,a4,a1
    1ad8:	00a63633          	sltu	a2,a2,a0
    1adc:	40c587b3          	sub	a5,a1,a2
    1ae0:	00088493          	mv	s1,a7
    1ae4:	00068913          	mv	s2,a3
    1ae8:	ee1ff06f          	j	19c8 <__adddf3+0x39c>
    1aec:	fe058813          	addi	a6,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    1af0:	02000e13          	li	t3,32
    1af4:	0107d833          	srl	a6,a5,a6
    1af8:	00000313          	li	t1,0
    1afc:	01c58863          	beq	a1,t3,1b0c <__adddf3+0x4e0>
    1b00:	04000313          	li	t1,64
    1b04:	40b30333          	sub	t1,t1,a1
    1b08:	00679333          	sll	t1,a5,t1
    1b0c:	00a36333          	or	t1,t1,a0
    1b10:	00603333          	snez	t1,t1
    1b14:	00686533          	or	a0,a6,t1
    1b18:	00000593          	li	a1,0
    1b1c:	fb5ff06f          	j	1ad0 <__adddf3+0x4a4>
    1b20:	00a7e533          	or	a0,a5,a0
    1b24:	00a03533          	snez	a0,a0
    1b28:	ff1ff06f          	j	1b18 <__adddf3+0x4ec>
    1b2c:	00148593          	addi	a1,s1,1
    1b30:	7fe5f593          	andi	a1,a1,2046
    1b34:	08059663          	bnez	a1,1bc0 <__adddf3+0x594>
    1b38:	00a7e833          	or	a6,a5,a0
    1b3c:	00c765b3          	or	a1,a4,a2
    1b40:	06049063          	bnez	s1,1ba0 <__adddf3+0x574>
    1b44:	00081c63          	bnez	a6,1b5c <__adddf3+0x530>
    1b48:	10058e63          	beqz	a1,1c64 <__adddf3+0x638>
    1b4c:	00070793          	mv	a5,a4
    1b50:	00060513          	mv	a0,a2
    1b54:	00068913          	mv	s2,a3
    1b58:	d75ff06f          	j	18cc <__adddf3+0x2a0>
    1b5c:	d60588e3          	beqz	a1,18cc <__adddf3+0x2a0>
    1b60:	40c50833          	sub	a6,a0,a2
    1b64:	010538b3          	sltu	a7,a0,a6
    1b68:	40e785b3          	sub	a1,a5,a4
    1b6c:	411585b3          	sub	a1,a1,a7
    1b70:	00859893          	slli	a7,a1,0x8
    1b74:	0008dc63          	bgez	a7,1b8c <__adddf3+0x560>
    1b78:	40a60533          	sub	a0,a2,a0
    1b7c:	40f70733          	sub	a4,a4,a5
    1b80:	00a63633          	sltu	a2,a2,a0
    1b84:	40c707b3          	sub	a5,a4,a2
    1b88:	fcdff06f          	j	1b54 <__adddf3+0x528>
    1b8c:	00b86533          	or	a0,a6,a1
    1b90:	18050463          	beqz	a0,1d18 <__adddf3+0x6ec>
    1b94:	00058793          	mv	a5,a1
    1b98:	00080513          	mv	a0,a6
    1b9c:	d31ff06f          	j	18cc <__adddf3+0x2a0>
    1ba0:	00081c63          	bnez	a6,1bb8 <__adddf3+0x58c>
    1ba4:	d4058ee3          	beqz	a1,1900 <__adddf3+0x2d4>
    1ba8:	00070793          	mv	a5,a4
    1bac:	00060513          	mv	a0,a2
    1bb0:	00068913          	mv	s2,a3
    1bb4:	b1dff06f          	j	16d0 <__adddf3+0xa4>
    1bb8:	b0058ce3          	beqz	a1,16d0 <__adddf3+0xa4>
    1bbc:	d45ff06f          	j	1900 <__adddf3+0x2d4>
    1bc0:	40c505b3          	sub	a1,a0,a2
    1bc4:	00b53833          	sltu	a6,a0,a1
    1bc8:	40e78433          	sub	s0,a5,a4
    1bcc:	41040433          	sub	s0,s0,a6
    1bd0:	00841813          	slli	a6,s0,0x8
    1bd4:	00058993          	mv	s3,a1
    1bd8:	08085063          	bgez	a6,1c58 <__adddf3+0x62c>
    1bdc:	40a609b3          	sub	s3,a2,a0
    1be0:	40f70433          	sub	s0,a4,a5
    1be4:	01363633          	sltu	a2,a2,s3
    1be8:	40c40433          	sub	s0,s0,a2
    1bec:	00068913          	mv	s2,a3
    1bf0:	06040e63          	beqz	s0,1c6c <__adddf3+0x640>
    1bf4:	00040513          	mv	a0,s0
    1bf8:	619000ef          	jal	2a10 <__clzsi2>
    1bfc:	ff850693          	addi	a3,a0,-8
    1c00:	02000793          	li	a5,32
    1c04:	40d787b3          	sub	a5,a5,a3
    1c08:	00d41433          	sll	s0,s0,a3
    1c0c:	00f9d7b3          	srl	a5,s3,a5
    1c10:	0087e7b3          	or	a5,a5,s0
    1c14:	00d99433          	sll	s0,s3,a3
    1c18:	0a96c463          	blt	a3,s1,1cc0 <__adddf3+0x694>
    1c1c:	409686b3          	sub	a3,a3,s1
    1c20:	00168613          	addi	a2,a3,1
    1c24:	01f00713          	li	a4,31
    1c28:	06c74263          	blt	a4,a2,1c8c <__adddf3+0x660>
    1c2c:	02000713          	li	a4,32
    1c30:	40c70733          	sub	a4,a4,a2
    1c34:	00e79533          	sll	a0,a5,a4
    1c38:	00c456b3          	srl	a3,s0,a2
    1c3c:	00e41733          	sll	a4,s0,a4
    1c40:	00d56533          	or	a0,a0,a3
    1c44:	00e03733          	snez	a4,a4
    1c48:	00e56533          	or	a0,a0,a4
    1c4c:	00c7d7b3          	srl	a5,a5,a2
    1c50:	00000493          	li	s1,0
    1c54:	c79ff06f          	j	18cc <__adddf3+0x2a0>
    1c58:	0085e5b3          	or	a1,a1,s0
    1c5c:	f8059ae3          	bnez	a1,1bf0 <__adddf3+0x5c4>
    1c60:	00000493          	li	s1,0
    1c64:	00000913          	li	s2,0
    1c68:	08c0006f          	j	1cf4 <__adddf3+0x6c8>
    1c6c:	00098513          	mv	a0,s3
    1c70:	5a1000ef          	jal	2a10 <__clzsi2>
    1c74:	01850693          	addi	a3,a0,24
    1c78:	01f00793          	li	a5,31
    1c7c:	f8d7d2e3          	bge	a5,a3,1c00 <__adddf3+0x5d4>
    1c80:	ff850793          	addi	a5,a0,-8
    1c84:	00f997b3          	sll	a5,s3,a5
    1c88:	f91ff06f          	j	1c18 <__adddf3+0x5ec>
    1c8c:	fe168693          	addi	a3,a3,-31
    1c90:	00d7d533          	srl	a0,a5,a3
    1c94:	02000693          	li	a3,32
    1c98:	00000713          	li	a4,0
    1c9c:	00d60863          	beq	a2,a3,1cac <__adddf3+0x680>
    1ca0:	04000713          	li	a4,64
    1ca4:	40c70733          	sub	a4,a4,a2
    1ca8:	00e79733          	sll	a4,a5,a4
    1cac:	00e46733          	or	a4,s0,a4
    1cb0:	00e03733          	snez	a4,a4
    1cb4:	00e56533          	or	a0,a0,a4
    1cb8:	00000793          	li	a5,0
    1cbc:	f95ff06f          	j	1c50 <__adddf3+0x624>
    1cc0:	ff800737          	lui	a4,0xff800
    1cc4:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    1cc8:	40d484b3          	sub	s1,s1,a3
    1ccc:	00e7f7b3          	and	a5,a5,a4
    1cd0:	00040513          	mv	a0,s0
    1cd4:	bf9ff06f          	j	18cc <__adddf3+0x2a0>
    1cd8:	00070793          	mv	a5,a4
    1cdc:	00060513          	mv	a0,a2
    1ce0:	c5dff06f          	j	193c <__adddf3+0x310>
    1ce4:	00070793          	mv	a5,a4
    1ce8:	00060513          	mv	a0,a2
    1cec:	be1ff06f          	j	18cc <__adddf3+0x2a0>
    1cf0:	7ff00493          	li	s1,2047
    1cf4:	00000793          	li	a5,0
    1cf8:	00000513          	li	a0,0
    1cfc:	0240006f          	j	1d20 <__adddf3+0x6f4>
    1d00:	00080493          	mv	s1,a6
    1d04:	bc9ff06f          	j	18cc <__adddf3+0x2a0>
    1d08:	00070793          	mv	a5,a4
    1d0c:	00060513          	mv	a0,a2
    1d10:	00080493          	mv	s1,a6
    1d14:	e41ff06f          	j	1b54 <__adddf3+0x528>
    1d18:	00000793          	li	a5,0
    1d1c:	00000913          	li	s2,0
    1d20:	00879713          	slli	a4,a5,0x8
    1d24:	00075e63          	bgez	a4,1d40 <__adddf3+0x714>
    1d28:	00148493          	addi	s1,s1,1
    1d2c:	7ff00713          	li	a4,2047
    1d30:	08e48263          	beq	s1,a4,1db4 <__adddf3+0x788>
    1d34:	ff800737          	lui	a4,0xff800
    1d38:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    1d3c:	00e7f7b3          	and	a5,a5,a4
    1d40:	01d79693          	slli	a3,a5,0x1d
    1d44:	00355513          	srli	a0,a0,0x3
    1d48:	7ff00713          	li	a4,2047
    1d4c:	00a6e6b3          	or	a3,a3,a0
    1d50:	0037d793          	srli	a5,a5,0x3
    1d54:	00e49e63          	bne	s1,a4,1d70 <__adddf3+0x744>
    1d58:	00f6e6b3          	or	a3,a3,a5
    1d5c:	00000793          	li	a5,0
    1d60:	00068863          	beqz	a3,1d70 <__adddf3+0x744>
    1d64:	000807b7          	lui	a5,0x80
    1d68:	00000693          	li	a3,0
    1d6c:	00000913          	li	s2,0
    1d70:	01449713          	slli	a4,s1,0x14
    1d74:	7ff00637          	lui	a2,0x7ff00
    1d78:	00c79793          	slli	a5,a5,0xc
    1d7c:	00c77733          	and	a4,a4,a2
    1d80:	01c12083          	lw	ra,28(sp)
    1d84:	01812403          	lw	s0,24(sp)
    1d88:	00c7d793          	srli	a5,a5,0xc
    1d8c:	00f767b3          	or	a5,a4,a5
    1d90:	01f91713          	slli	a4,s2,0x1f
    1d94:	00e7e633          	or	a2,a5,a4
    1d98:	01412483          	lw	s1,20(sp)
    1d9c:	01012903          	lw	s2,16(sp)
    1da0:	00c12983          	lw	s3,12(sp)
    1da4:	00068513          	mv	a0,a3
    1da8:	00060593          	mv	a1,a2
    1dac:	02010113          	addi	sp,sp,32
    1db0:	00008067          	ret
    1db4:	00000793          	li	a5,0
    1db8:	00000513          	li	a0,0
    1dbc:	f85ff06f          	j	1d40 <__adddf3+0x714>

00001dc0 <__fixdfsi>:
    1dc0:	0145d713          	srli	a4,a1,0x14
    1dc4:	001006b7          	lui	a3,0x100
    1dc8:	fff68793          	addi	a5,a3,-1 # fffff <_memory_end+0xdffff>
    1dcc:	7ff77713          	andi	a4,a4,2047
    1dd0:	3fe00613          	li	a2,1022
    1dd4:	00b7f7b3          	and	a5,a5,a1
    1dd8:	01f5d593          	srli	a1,a1,0x1f
    1ddc:	04e65e63          	bge	a2,a4,1e38 <__fixdfsi+0x78>
    1de0:	41d00613          	li	a2,1053
    1de4:	00e65a63          	bge	a2,a4,1df8 <__fixdfsi+0x38>
    1de8:	80000537          	lui	a0,0x80000
    1dec:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
    1df0:	00a58533          	add	a0,a1,a0
    1df4:	00008067          	ret
    1df8:	00d7e7b3          	or	a5,a5,a3
    1dfc:	43300693          	li	a3,1075
    1e00:	40e686b3          	sub	a3,a3,a4
    1e04:	01f00613          	li	a2,31
    1e08:	02d64063          	blt	a2,a3,1e28 <__fixdfsi+0x68>
    1e0c:	bed70713          	addi	a4,a4,-1043
    1e10:	00e797b3          	sll	a5,a5,a4
    1e14:	00d55533          	srl	a0,a0,a3
    1e18:	00a7e533          	or	a0,a5,a0
    1e1c:	02058063          	beqz	a1,1e3c <__fixdfsi+0x7c>
    1e20:	40a00533          	neg	a0,a0
    1e24:	00008067          	ret
    1e28:	41300693          	li	a3,1043
    1e2c:	40e68733          	sub	a4,a3,a4
    1e30:	00e7d533          	srl	a0,a5,a4
    1e34:	fe9ff06f          	j	1e1c <__fixdfsi+0x5c>
    1e38:	00000513          	li	a0,0
    1e3c:	00008067          	ret

00001e40 <__floatunsidf>:
    1e40:	ff010113          	addi	sp,sp,-16
    1e44:	00812423          	sw	s0,8(sp)
    1e48:	00112623          	sw	ra,12(sp)
    1e4c:	00050413          	mv	s0,a0
    1e50:	06050263          	beqz	a0,1eb4 <__floatunsidf+0x74>
    1e54:	3bd000ef          	jal	2a10 <__clzsi2>
    1e58:	41e00713          	li	a4,1054
    1e5c:	00a00793          	li	a5,10
    1e60:	40a70733          	sub	a4,a4,a0
    1e64:	04a7c063          	blt	a5,a0,1ea4 <__floatunsidf+0x64>
    1e68:	00b00793          	li	a5,11
    1e6c:	40a787b3          	sub	a5,a5,a0
    1e70:	01550513          	addi	a0,a0,21
    1e74:	00f457b3          	srl	a5,s0,a5
    1e78:	00a41433          	sll	s0,s0,a0
    1e7c:	00c12083          	lw	ra,12(sp)
    1e80:	00040513          	mv	a0,s0
    1e84:	00c79793          	slli	a5,a5,0xc
    1e88:	00812403          	lw	s0,8(sp)
    1e8c:	01471713          	slli	a4,a4,0x14
    1e90:	00c7d793          	srli	a5,a5,0xc
    1e94:	00f766b3          	or	a3,a4,a5
    1e98:	00068593          	mv	a1,a3
    1e9c:	01010113          	addi	sp,sp,16
    1ea0:	00008067          	ret
    1ea4:	ff550513          	addi	a0,a0,-11
    1ea8:	00a417b3          	sll	a5,s0,a0
    1eac:	00000413          	li	s0,0
    1eb0:	fcdff06f          	j	1e7c <__floatunsidf+0x3c>
    1eb4:	00000793          	li	a5,0
    1eb8:	00000713          	li	a4,0
    1ebc:	fc1ff06f          	j	1e7c <__floatunsidf+0x3c>

00001ec0 <__eqsf2>:
    1ec0:	01755693          	srli	a3,a0,0x17
    1ec4:	008007b7          	lui	a5,0x800
    1ec8:	fff78793          	addi	a5,a5,-1 # 7fffff <_memory_end+0x7dffff>
    1ecc:	0175d613          	srli	a2,a1,0x17
    1ed0:	0ff6f693          	zext.b	a3,a3
    1ed4:	0ff00893          	li	a7,255
    1ed8:	00a7f833          	and	a6,a5,a0
    1edc:	01f55713          	srli	a4,a0,0x1f
    1ee0:	00b7f7b3          	and	a5,a5,a1
    1ee4:	0ff67613          	zext.b	a2,a2
    1ee8:	01f5d593          	srli	a1,a1,0x1f
    1eec:	00100513          	li	a0,1
    1ef0:	01169a63          	bne	a3,a7,1f04 <__eqsf2+0x44>
    1ef4:	00081663          	bnez	a6,1f00 <__eqsf2+0x40>
    1ef8:	00d61463          	bne	a2,a3,1f00 <__eqsf2+0x40>
    1efc:	00078a63          	beqz	a5,1f10 <__eqsf2+0x50>
    1f00:	00008067          	ret
    1f04:	ff160ee3          	beq	a2,a7,1f00 <__eqsf2+0x40>
    1f08:	fec69ce3          	bne	a3,a2,1f00 <__eqsf2+0x40>
    1f0c:	fef81ae3          	bne	a6,a5,1f00 <__eqsf2+0x40>
    1f10:	00000513          	li	a0,0
    1f14:	feb706e3          	beq	a4,a1,1f00 <__eqsf2+0x40>
    1f18:	00100513          	li	a0,1
    1f1c:	fe0692e3          	bnez	a3,1f00 <__eqsf2+0x40>
    1f20:	01003533          	snez	a0,a6
    1f24:	00008067          	ret

00001f28 <__lesf2>:
    1f28:	008007b7          	lui	a5,0x800
    1f2c:	fff78793          	addi	a5,a5,-1 # 7fffff <_memory_end+0x7dffff>
    1f30:	01755693          	srli	a3,a0,0x17
    1f34:	00a7f633          	and	a2,a5,a0
    1f38:	01f55713          	srli	a4,a0,0x1f
    1f3c:	0ff6f693          	zext.b	a3,a3
    1f40:	0175d513          	srli	a0,a1,0x17
    1f44:	0ff00813          	li	a6,255
    1f48:	00b7f7b3          	and	a5,a5,a1
    1f4c:	0ff57513          	zext.b	a0,a0
    1f50:	01f5d593          	srli	a1,a1,0x1f
    1f54:	01069463          	bne	a3,a6,1f5c <__lesf2+0x34>
    1f58:	04061263          	bnez	a2,1f9c <__lesf2+0x74>
    1f5c:	0ff00813          	li	a6,255
    1f60:	01051463          	bne	a0,a6,1f68 <__lesf2+0x40>
    1f64:	02079c63          	bnez	a5,1f9c <__lesf2+0x74>
    1f68:	04069a63          	bnez	a3,1fbc <__lesf2+0x94>
    1f6c:	02051c63          	bnez	a0,1fa4 <__lesf2+0x7c>
    1f70:	04061863          	bnez	a2,1fc0 <__lesf2+0x98>
    1f74:	04078263          	beqz	a5,1fb8 <__lesf2+0x90>
    1f78:	00100513          	li	a0,1
    1f7c:	02059e63          	bnez	a1,1fb8 <__lesf2+0x90>
    1f80:	fff00513          	li	a0,-1
    1f84:	00008067          	ret
    1f88:	fea6c8e3          	blt	a3,a0,1f78 <__lesf2+0x50>
    1f8c:	02c7e263          	bltu	a5,a2,1fb0 <__lesf2+0x88>
    1f90:	00000513          	li	a0,0
    1f94:	02f67263          	bgeu	a2,a5,1fb8 <__lesf2+0x90>
    1f98:	fe1ff06f          	j	1f78 <__lesf2+0x50>
    1f9c:	00200513          	li	a0,2
    1fa0:	00008067          	ret
    1fa4:	fc060ae3          	beqz	a2,1f78 <__lesf2+0x50>
    1fa8:	00e59e63          	bne	a1,a4,1fc4 <__lesf2+0x9c>
    1fac:	fcd55ee3          	bge	a0,a3,1f88 <__lesf2+0x60>
    1fb0:	fff00513          	li	a0,-1
    1fb4:	00058c63          	beqz	a1,1fcc <__lesf2+0xa4>
    1fb8:	00008067          	ret
    1fbc:	fe0516e3          	bnez	a0,1fa8 <__lesf2+0x80>
    1fc0:	fe0794e3          	bnez	a5,1fa8 <__lesf2+0x80>
    1fc4:	fff00513          	li	a0,-1
    1fc8:	fe0718e3          	bnez	a4,1fb8 <__lesf2+0x90>
    1fcc:	00100513          	li	a0,1
    1fd0:	00008067          	ret

00001fd4 <__mulsf3>:
    1fd4:	fe010113          	addi	sp,sp,-32
    1fd8:	01212823          	sw	s2,16(sp)
    1fdc:	01755913          	srli	s2,a0,0x17
    1fe0:	00912a23          	sw	s1,20(sp)
    1fe4:	01312623          	sw	s3,12(sp)
    1fe8:	01512223          	sw	s5,4(sp)
    1fec:	00951493          	slli	s1,a0,0x9
    1ff0:	00112e23          	sw	ra,28(sp)
    1ff4:	00812c23          	sw	s0,24(sp)
    1ff8:	01412423          	sw	s4,8(sp)
    1ffc:	0ff97913          	zext.b	s2,s2
    2000:	00058a93          	mv	s5,a1
    2004:	0094d493          	srli	s1,s1,0x9
    2008:	01f55993          	srli	s3,a0,0x1f
    200c:	10090863          	beqz	s2,211c <__mulsf3+0x148>
    2010:	0ff00793          	li	a5,255
    2014:	12f90463          	beq	s2,a5,213c <__mulsf3+0x168>
    2018:	00349493          	slli	s1,s1,0x3
    201c:	040007b7          	lui	a5,0x4000
    2020:	00f4e4b3          	or	s1,s1,a5
    2024:	f8190913          	addi	s2,s2,-127
    2028:	00000a13          	li	s4,0
    202c:	017ad793          	srli	a5,s5,0x17
    2030:	009a9413          	slli	s0,s5,0x9
    2034:	0ff7f793          	zext.b	a5,a5
    2038:	00945413          	srli	s0,s0,0x9
    203c:	01fada93          	srli	s5,s5,0x1f
    2040:	10078e63          	beqz	a5,215c <__mulsf3+0x188>
    2044:	0ff00713          	li	a4,255
    2048:	12e78a63          	beq	a5,a4,217c <__mulsf3+0x1a8>
    204c:	00341413          	slli	s0,s0,0x3
    2050:	04000737          	lui	a4,0x4000
    2054:	00e46433          	or	s0,s0,a4
    2058:	f8178793          	addi	a5,a5,-127 # 3ffff81 <_memory_end+0x3fdff81>
    205c:	00000713          	li	a4,0
    2060:	00f90933          	add	s2,s2,a5
    2064:	002a1793          	slli	a5,s4,0x2
    2068:	00e7e7b3          	or	a5,a5,a4
    206c:	00a00613          	li	a2,10
    2070:	00190693          	addi	a3,s2,1
    2074:	1ef64263          	blt	a2,a5,2258 <__mulsf3+0x284>
    2078:	00200613          	li	a2,2
    207c:	0159c9b3          	xor	s3,s3,s5
    2080:	10f64e63          	blt	a2,a5,219c <__mulsf3+0x1c8>
    2084:	fff78793          	addi	a5,a5,-1
    2088:	00100613          	li	a2,1
    208c:	12f67a63          	bgeu	a2,a5,21c0 <__mulsf3+0x1ec>
    2090:	00010837          	lui	a6,0x10
    2094:	fff80513          	addi	a0,a6,-1 # ffff <_bss_end+0xd137>
    2098:	0104d613          	srli	a2,s1,0x10
    209c:	01045793          	srli	a5,s0,0x10
    20a0:	00a4f4b3          	and	s1,s1,a0
    20a4:	00a47433          	and	s0,s0,a0
    20a8:	029405b3          	mul	a1,s0,s1
    20ac:	02860433          	mul	s0,a2,s0
    20b0:	02f60633          	mul	a2,a2,a5
    20b4:	029787b3          	mul	a5,a5,s1
    20b8:	00878733          	add	a4,a5,s0
    20bc:	0105d793          	srli	a5,a1,0x10
    20c0:	00e787b3          	add	a5,a5,a4
    20c4:	0087f463          	bgeu	a5,s0,20cc <__mulsf3+0xf8>
    20c8:	01060633          	add	a2,a2,a6
    20cc:	00a7f733          	and	a4,a5,a0
    20d0:	01071713          	slli	a4,a4,0x10
    20d4:	00a5f5b3          	and	a1,a1,a0
    20d8:	00b70733          	add	a4,a4,a1
    20dc:	0107d793          	srli	a5,a5,0x10
    20e0:	00671413          	slli	s0,a4,0x6
    20e4:	00c787b3          	add	a5,a5,a2
    20e8:	01a75713          	srli	a4,a4,0x1a
    20ec:	00679793          	slli	a5,a5,0x6
    20f0:	00803433          	snez	s0,s0
    20f4:	00e46433          	or	s0,s0,a4
    20f8:	00479713          	slli	a4,a5,0x4
    20fc:	0087e433          	or	s0,a5,s0
    2100:	00075a63          	bgez	a4,2114 <__mulsf3+0x140>
    2104:	00145793          	srli	a5,s0,0x1
    2108:	00147413          	andi	s0,s0,1
    210c:	0087e433          	or	s0,a5,s0
    2110:	00068913          	mv	s2,a3
    2114:	00090693          	mv	a3,s2
    2118:	0c00006f          	j	21d8 <__mulsf3+0x204>
    211c:	02048a63          	beqz	s1,2150 <__mulsf3+0x17c>
    2120:	00048513          	mv	a0,s1
    2124:	0ed000ef          	jal	2a10 <__clzsi2>
    2128:	ffb50793          	addi	a5,a0,-5
    212c:	f8a00913          	li	s2,-118
    2130:	00f494b3          	sll	s1,s1,a5
    2134:	40a90933          	sub	s2,s2,a0
    2138:	ef1ff06f          	j	2028 <__mulsf3+0x54>
    213c:	0ff00913          	li	s2,255
    2140:	00200a13          	li	s4,2
    2144:	ee0484e3          	beqz	s1,202c <__mulsf3+0x58>
    2148:	00300a13          	li	s4,3
    214c:	ee1ff06f          	j	202c <__mulsf3+0x58>
    2150:	00000913          	li	s2,0
    2154:	00100a13          	li	s4,1
    2158:	ed5ff06f          	j	202c <__mulsf3+0x58>
    215c:	02040a63          	beqz	s0,2190 <__mulsf3+0x1bc>
    2160:	00040513          	mv	a0,s0
    2164:	0ad000ef          	jal	2a10 <__clzsi2>
    2168:	ffb50793          	addi	a5,a0,-5
    216c:	00f41433          	sll	s0,s0,a5
    2170:	f8a00793          	li	a5,-118
    2174:	40a787b3          	sub	a5,a5,a0
    2178:	ee5ff06f          	j	205c <__mulsf3+0x88>
    217c:	0ff00793          	li	a5,255
    2180:	00200713          	li	a4,2
    2184:	ec040ee3          	beqz	s0,2060 <__mulsf3+0x8c>
    2188:	00300713          	li	a4,3
    218c:	ed5ff06f          	j	2060 <__mulsf3+0x8c>
    2190:	00000793          	li	a5,0
    2194:	00100713          	li	a4,1
    2198:	ec9ff06f          	j	2060 <__mulsf3+0x8c>
    219c:	00100613          	li	a2,1
    21a0:	00f617b3          	sll	a5,a2,a5
    21a4:	5307f613          	andi	a2,a5,1328
    21a8:	0c061063          	bnez	a2,2268 <__mulsf3+0x294>
    21ac:	2407f613          	andi	a2,a5,576
    21b0:	12061263          	bnez	a2,22d4 <__mulsf3+0x300>
    21b4:	0887f793          	andi	a5,a5,136
    21b8:	ec078ce3          	beqz	a5,2090 <__mulsf3+0xbc>
    21bc:	000a8993          	mv	s3,s5
    21c0:	00200793          	li	a5,2
    21c4:	10f70263          	beq	a4,a5,22c8 <__mulsf3+0x2f4>
    21c8:	00300793          	li	a5,3
    21cc:	10f70463          	beq	a4,a5,22d4 <__mulsf3+0x300>
    21d0:	00100793          	li	a5,1
    21d4:	10f70863          	beq	a4,a5,22e4 <__mulsf3+0x310>
    21d8:	07f68713          	addi	a4,a3,127
    21dc:	08e05c63          	blez	a4,2274 <__mulsf3+0x2a0>
    21e0:	00747793          	andi	a5,s0,7
    21e4:	00078a63          	beqz	a5,21f8 <__mulsf3+0x224>
    21e8:	00f47793          	andi	a5,s0,15
    21ec:	00400613          	li	a2,4
    21f0:	00c78463          	beq	a5,a2,21f8 <__mulsf3+0x224>
    21f4:	00440413          	addi	s0,s0,4
    21f8:	00441793          	slli	a5,s0,0x4
    21fc:	0007da63          	bgez	a5,2210 <__mulsf3+0x23c>
    2200:	f80007b7          	lui	a5,0xf8000
    2204:	fff78793          	addi	a5,a5,-1 # f7ffffff <_memory_end+0xf7fdffff>
    2208:	00f47433          	and	s0,s0,a5
    220c:	08068713          	addi	a4,a3,128
    2210:	0fe00793          	li	a5,254
    2214:	0ae7ca63          	blt	a5,a4,22c8 <__mulsf3+0x2f4>
    2218:	00345793          	srli	a5,s0,0x3
    221c:	01c12083          	lw	ra,28(sp)
    2220:	01812403          	lw	s0,24(sp)
    2224:	00979793          	slli	a5,a5,0x9
    2228:	01771513          	slli	a0,a4,0x17
    222c:	0097d793          	srli	a5,a5,0x9
    2230:	01f99993          	slli	s3,s3,0x1f
    2234:	00f56533          	or	a0,a0,a5
    2238:	01412483          	lw	s1,20(sp)
    223c:	01012903          	lw	s2,16(sp)
    2240:	00812a03          	lw	s4,8(sp)
    2244:	00412a83          	lw	s5,4(sp)
    2248:	01356533          	or	a0,a0,s3
    224c:	00c12983          	lw	s3,12(sp)
    2250:	02010113          	addi	sp,sp,32
    2254:	00008067          	ret
    2258:	00f00613          	li	a2,15
    225c:	06c78c63          	beq	a5,a2,22d4 <__mulsf3+0x300>
    2260:	00b00613          	li	a2,11
    2264:	f4c78ce3          	beq	a5,a2,21bc <__mulsf3+0x1e8>
    2268:	00048413          	mv	s0,s1
    226c:	000a0713          	mv	a4,s4
    2270:	f51ff06f          	j	21c0 <__mulsf3+0x1ec>
    2274:	00100793          	li	a5,1
    2278:	40e787b3          	sub	a5,a5,a4
    227c:	01b00713          	li	a4,27
    2280:	06f74263          	blt	a4,a5,22e4 <__mulsf3+0x310>
    2284:	09e68693          	addi	a3,a3,158
    2288:	00d416b3          	sll	a3,s0,a3
    228c:	00f457b3          	srl	a5,s0,a5
    2290:	00d036b3          	snez	a3,a3
    2294:	00d7e7b3          	or	a5,a5,a3
    2298:	0077f713          	andi	a4,a5,7
    229c:	00070a63          	beqz	a4,22b0 <__mulsf3+0x2dc>
    22a0:	00f7f713          	andi	a4,a5,15
    22a4:	00400693          	li	a3,4
    22a8:	00d70463          	beq	a4,a3,22b0 <__mulsf3+0x2dc>
    22ac:	00478793          	addi	a5,a5,4
    22b0:	00579713          	slli	a4,a5,0x5
    22b4:	0037d793          	srli	a5,a5,0x3
    22b8:	02075863          	bgez	a4,22e8 <__mulsf3+0x314>
    22bc:	00000793          	li	a5,0
    22c0:	00100713          	li	a4,1
    22c4:	f59ff06f          	j	221c <__mulsf3+0x248>
    22c8:	00000793          	li	a5,0
    22cc:	0ff00713          	li	a4,255
    22d0:	f4dff06f          	j	221c <__mulsf3+0x248>
    22d4:	004007b7          	lui	a5,0x400
    22d8:	0ff00713          	li	a4,255
    22dc:	00000993          	li	s3,0
    22e0:	f3dff06f          	j	221c <__mulsf3+0x248>
    22e4:	00000793          	li	a5,0
    22e8:	00000713          	li	a4,0
    22ec:	f31ff06f          	j	221c <__mulsf3+0x248>

000022f0 <__subsf3>:
    22f0:	008006b7          	lui	a3,0x800
    22f4:	fff68693          	addi	a3,a3,-1 # 7fffff <_memory_end+0x7dffff>
    22f8:	ff010113          	addi	sp,sp,-16
    22fc:	00a6f633          	and	a2,a3,a0
    2300:	01755713          	srli	a4,a0,0x17
    2304:	00812423          	sw	s0,8(sp)
    2308:	01f55413          	srli	s0,a0,0x1f
    230c:	00361513          	slli	a0,a2,0x3
    2310:	0175d613          	srli	a2,a1,0x17
    2314:	00b6f6b3          	and	a3,a3,a1
    2318:	01212023          	sw	s2,0(sp)
    231c:	00112623          	sw	ra,12(sp)
    2320:	0ff77913          	zext.b	s2,a4
    2324:	00912223          	sw	s1,4(sp)
    2328:	0ff67613          	zext.b	a2,a2
    232c:	0ff00713          	li	a4,255
    2330:	01f5d593          	srli	a1,a1,0x1f
    2334:	00369793          	slli	a5,a3,0x3
    2338:	00e61463          	bne	a2,a4,2340 <__subsf3+0x50>
    233c:	00079463          	bnez	a5,2344 <__subsf3+0x54>
    2340:	0015c593          	xori	a1,a1,1
    2344:	40c906b3          	sub	a3,s2,a2
    2348:	18859063          	bne	a1,s0,24c8 <__subsf3+0x1d8>
    234c:	08d05c63          	blez	a3,23e4 <__subsf3+0xf4>
    2350:	02061663          	bnez	a2,237c <__subsf3+0x8c>
    2354:	02078063          	beqz	a5,2374 <__subsf3+0x84>
    2358:	fff90693          	addi	a3,s2,-1
    235c:	00069863          	bnez	a3,236c <__subsf3+0x7c>
    2360:	00a787b3          	add	a5,a5,a0
    2364:	00100913          	li	s2,1
    2368:	04c0006f          	j	23b4 <__subsf3+0xc4>
    236c:	0ff00713          	li	a4,255
    2370:	00e91e63          	bne	s2,a4,238c <__subsf3+0x9c>
    2374:	00050793          	mv	a5,a0
    2378:	10c0006f          	j	2484 <__subsf3+0x194>
    237c:	0ff00713          	li	a4,255
    2380:	fee90ae3          	beq	s2,a4,2374 <__subsf3+0x84>
    2384:	04000737          	lui	a4,0x4000
    2388:	00e7e7b3          	or	a5,a5,a4
    238c:	01b00613          	li	a2,27
    2390:	00100713          	li	a4,1
    2394:	00d64e63          	blt	a2,a3,23b0 <__subsf3+0xc0>
    2398:	02000613          	li	a2,32
    239c:	00d7d733          	srl	a4,a5,a3
    23a0:	40d606b3          	sub	a3,a2,a3
    23a4:	00d796b3          	sll	a3,a5,a3
    23a8:	00d036b3          	snez	a3,a3
    23ac:	00d76733          	or	a4,a4,a3
    23b0:	00a707b3          	add	a5,a4,a0
    23b4:	00579713          	slli	a4,a5,0x5
    23b8:	0c075663          	bgez	a4,2484 <__subsf3+0x194>
    23bc:	00190913          	addi	s2,s2,1
    23c0:	0ff00713          	li	a4,255
    23c4:	2ce90a63          	beq	s2,a4,2698 <__subsf3+0x3a8>
    23c8:	7e000737          	lui	a4,0x7e000
    23cc:	0017f693          	andi	a3,a5,1
    23d0:	fff70713          	addi	a4,a4,-1 # 7dffffff <_memory_end+0x7dfdffff>
    23d4:	0017d793          	srli	a5,a5,0x1
    23d8:	00e7f7b3          	and	a5,a5,a4
    23dc:	00d7e7b3          	or	a5,a5,a3
    23e0:	0a40006f          	j	2484 <__subsf3+0x194>
    23e4:	06068663          	beqz	a3,2450 <__subsf3+0x160>
    23e8:	41260733          	sub	a4,a2,s2
    23ec:	02091063          	bnez	s2,240c <__subsf3+0x11c>
    23f0:	0c050863          	beqz	a0,24c0 <__subsf3+0x1d0>
    23f4:	fff70693          	addi	a3,a4,-1
    23f8:	f60684e3          	beqz	a3,2360 <__subsf3+0x70>
    23fc:	0ff00593          	li	a1,255
    2400:	02b71063          	bne	a4,a1,2420 <__subsf3+0x130>
    2404:	0ff00913          	li	s2,255
    2408:	07c0006f          	j	2484 <__subsf3+0x194>
    240c:	0ff00693          	li	a3,255
    2410:	fed60ae3          	beq	a2,a3,2404 <__subsf3+0x114>
    2414:	040006b7          	lui	a3,0x4000
    2418:	00d56533          	or	a0,a0,a3
    241c:	00070693          	mv	a3,a4
    2420:	01b00593          	li	a1,27
    2424:	00100713          	li	a4,1
    2428:	00d5ce63          	blt	a1,a3,2444 <__subsf3+0x154>
    242c:	02000713          	li	a4,32
    2430:	40d70733          	sub	a4,a4,a3
    2434:	00e51733          	sll	a4,a0,a4
    2438:	00d555b3          	srl	a1,a0,a3
    243c:	00e03733          	snez	a4,a4
    2440:	00e5e733          	or	a4,a1,a4
    2444:	00e787b3          	add	a5,a5,a4
    2448:	00060913          	mv	s2,a2
    244c:	f69ff06f          	j	23b4 <__subsf3+0xc4>
    2450:	00190713          	addi	a4,s2,1
    2454:	0fe77693          	andi	a3,a4,254
    2458:	04069c63          	bnez	a3,24b0 <__subsf3+0x1c0>
    245c:	04091263          	bnez	s2,24a0 <__subsf3+0x1b0>
    2460:	02050263          	beqz	a0,2484 <__subsf3+0x194>
    2464:	f00788e3          	beqz	a5,2374 <__subsf3+0x84>
    2468:	00a787b3          	add	a5,a5,a0
    246c:	00579713          	slli	a4,a5,0x5
    2470:	00075a63          	bgez	a4,2484 <__subsf3+0x194>
    2474:	fc000737          	lui	a4,0xfc000
    2478:	fff70713          	addi	a4,a4,-1 # fbffffff <_memory_end+0xfbfdffff>
    247c:	00e7f7b3          	and	a5,a5,a4
    2480:	00100913          	li	s2,1
    2484:	0077f713          	andi	a4,a5,7
    2488:	20070a63          	beqz	a4,269c <__subsf3+0x3ac>
    248c:	00f7f713          	andi	a4,a5,15
    2490:	00400693          	li	a3,4
    2494:	20d70463          	beq	a4,a3,269c <__subsf3+0x3ac>
    2498:	00478793          	addi	a5,a5,4 # 400004 <_memory_end+0x3e0004>
    249c:	2000006f          	j	269c <__subsf3+0x3ac>
    24a0:	f60502e3          	beqz	a0,2404 <__subsf3+0x114>
    24a4:	16079663          	bnez	a5,2610 <__subsf3+0x320>
    24a8:	00050793          	mv	a5,a0
    24ac:	f59ff06f          	j	2404 <__subsf3+0x114>
    24b0:	0ff00693          	li	a3,255
    24b4:	1ed70063          	beq	a4,a3,2694 <__subsf3+0x3a4>
    24b8:	00f507b3          	add	a5,a0,a5
    24bc:	0017d793          	srli	a5,a5,0x1
    24c0:	00070913          	mv	s2,a4
    24c4:	fc1ff06f          	j	2484 <__subsf3+0x194>
    24c8:	06d05e63          	blez	a3,2544 <__subsf3+0x254>
    24cc:	06061263          	bnez	a2,2530 <__subsf3+0x240>
    24d0:	ea0782e3          	beqz	a5,2374 <__subsf3+0x84>
    24d4:	fff90693          	addi	a3,s2,-1
    24d8:	00069863          	bnez	a3,24e8 <__subsf3+0x1f8>
    24dc:	40f507b3          	sub	a5,a0,a5
    24e0:	00100913          	li	s2,1
    24e4:	0340006f          	j	2518 <__subsf3+0x228>
    24e8:	0ff00713          	li	a4,255
    24ec:	e8e904e3          	beq	s2,a4,2374 <__subsf3+0x84>
    24f0:	01b00613          	li	a2,27
    24f4:	00100713          	li	a4,1
    24f8:	00d64e63          	blt	a2,a3,2514 <__subsf3+0x224>
    24fc:	02000613          	li	a2,32
    2500:	00d7d733          	srl	a4,a5,a3
    2504:	40d606b3          	sub	a3,a2,a3
    2508:	00d796b3          	sll	a3,a5,a3
    250c:	00d036b3          	snez	a3,a3
    2510:	00d76733          	or	a4,a4,a3
    2514:	40e507b3          	sub	a5,a0,a4
    2518:	00579713          	slli	a4,a5,0x5
    251c:	f60754e3          	bgez	a4,2484 <__subsf3+0x194>
    2520:	040004b7          	lui	s1,0x4000
    2524:	fff48493          	addi	s1,s1,-1 # 3ffffff <_memory_end+0x3fdffff>
    2528:	0097f4b3          	and	s1,a5,s1
    252c:	1080006f          	j	2634 <__subsf3+0x344>
    2530:	0ff00713          	li	a4,255
    2534:	e4e900e3          	beq	s2,a4,2374 <__subsf3+0x84>
    2538:	04000737          	lui	a4,0x4000
    253c:	00e7e7b3          	or	a5,a5,a4
    2540:	fb1ff06f          	j	24f0 <__subsf3+0x200>
    2544:	06068e63          	beqz	a3,25c0 <__subsf3+0x2d0>
    2548:	41260733          	sub	a4,a2,s2
    254c:	02091663          	bnez	s2,2578 <__subsf3+0x288>
    2550:	1a050e63          	beqz	a0,270c <__subsf3+0x41c>
    2554:	fff70693          	addi	a3,a4,-1 # 3ffffff <_memory_end+0x3fdffff>
    2558:	00069863          	bnez	a3,2568 <__subsf3+0x278>
    255c:	40a787b3          	sub	a5,a5,a0
    2560:	00058413          	mv	s0,a1
    2564:	f7dff06f          	j	24e0 <__subsf3+0x1f0>
    2568:	0ff00813          	li	a6,255
    256c:	03071063          	bne	a4,a6,258c <__subsf3+0x29c>
    2570:	0ff00913          	li	s2,255
    2574:	19c0006f          	j	2710 <__subsf3+0x420>
    2578:	0ff00693          	li	a3,255
    257c:	fed60ae3          	beq	a2,a3,2570 <__subsf3+0x280>
    2580:	040006b7          	lui	a3,0x4000
    2584:	00d56533          	or	a0,a0,a3
    2588:	00070693          	mv	a3,a4
    258c:	01b00813          	li	a6,27
    2590:	00100713          	li	a4,1
    2594:	00d84e63          	blt	a6,a3,25b0 <__subsf3+0x2c0>
    2598:	02000713          	li	a4,32
    259c:	40d70733          	sub	a4,a4,a3
    25a0:	00e51733          	sll	a4,a0,a4
    25a4:	00d55833          	srl	a6,a0,a3
    25a8:	00e03733          	snez	a4,a4
    25ac:	00e86733          	or	a4,a6,a4
    25b0:	40e787b3          	sub	a5,a5,a4
    25b4:	00060913          	mv	s2,a2
    25b8:	00058413          	mv	s0,a1
    25bc:	f5dff06f          	j	2518 <__subsf3+0x228>
    25c0:	00190713          	addi	a4,s2,1
    25c4:	0fe77713          	andi	a4,a4,254
    25c8:	04071c63          	bnez	a4,2620 <__subsf3+0x330>
    25cc:	02091c63          	bnez	s2,2604 <__subsf3+0x314>
    25d0:	00051863          	bnez	a0,25e0 <__subsf3+0x2f0>
    25d4:	12079e63          	bnez	a5,2710 <__subsf3+0x420>
    25d8:	00000413          	li	s0,0
    25dc:	0c00006f          	j	269c <__subsf3+0x3ac>
    25e0:	d8078ae3          	beqz	a5,2374 <__subsf3+0x84>
    25e4:	40f50733          	sub	a4,a0,a5
    25e8:	00571693          	slli	a3,a4,0x5
    25ec:	40a787b3          	sub	a5,a5,a0
    25f0:	1206c063          	bltz	a3,2710 <__subsf3+0x420>
    25f4:	00070793          	mv	a5,a4
    25f8:	e80716e3          	bnez	a4,2484 <__subsf3+0x194>
    25fc:	00000793          	li	a5,0
    2600:	fd9ff06f          	j	25d8 <__subsf3+0x2e8>
    2604:	ea0510e3          	bnez	a0,24a4 <__subsf3+0x1b4>
    2608:	00058413          	mv	s0,a1
    260c:	de079ce3          	bnez	a5,2404 <__subsf3+0x114>
    2610:	00000413          	li	s0,0
    2614:	020007b7          	lui	a5,0x2000
    2618:	0ff00913          	li	s2,255
    261c:	0800006f          	j	269c <__subsf3+0x3ac>
    2620:	40f504b3          	sub	s1,a0,a5
    2624:	00549713          	slli	a4,s1,0x5
    2628:	04075463          	bgez	a4,2670 <__subsf3+0x380>
    262c:	40a784b3          	sub	s1,a5,a0
    2630:	00058413          	mv	s0,a1
    2634:	00048513          	mv	a0,s1
    2638:	3d8000ef          	jal	2a10 <__clzsi2>
    263c:	ffb50513          	addi	a0,a0,-5
    2640:	00a494b3          	sll	s1,s1,a0
    2644:	03254e63          	blt	a0,s2,2680 <__subsf3+0x390>
    2648:	41250533          	sub	a0,a0,s2
    264c:	00150513          	addi	a0,a0,1
    2650:	02000713          	li	a4,32
    2654:	40a70733          	sub	a4,a4,a0
    2658:	00a4d7b3          	srl	a5,s1,a0
    265c:	00e494b3          	sll	s1,s1,a4
    2660:	009034b3          	snez	s1,s1
    2664:	0097e7b3          	or	a5,a5,s1
    2668:	00000913          	li	s2,0
    266c:	e19ff06f          	j	2484 <__subsf3+0x194>
    2670:	fc0492e3          	bnez	s1,2634 <__subsf3+0x344>
    2674:	00000793          	li	a5,0
    2678:	00000913          	li	s2,0
    267c:	f5dff06f          	j	25d8 <__subsf3+0x2e8>
    2680:	fc0007b7          	lui	a5,0xfc000
    2684:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
    2688:	40a90933          	sub	s2,s2,a0
    268c:	00f4f7b3          	and	a5,s1,a5
    2690:	df5ff06f          	j	2484 <__subsf3+0x194>
    2694:	0ff00913          	li	s2,255
    2698:	00000793          	li	a5,0
    269c:	00579713          	slli	a4,a5,0x5
    26a0:	00075e63          	bgez	a4,26bc <__subsf3+0x3cc>
    26a4:	00190913          	addi	s2,s2,1
    26a8:	0ff00713          	li	a4,255
    26ac:	06e90663          	beq	s2,a4,2718 <__subsf3+0x428>
    26b0:	fc000737          	lui	a4,0xfc000
    26b4:	fff70713          	addi	a4,a4,-1 # fbffffff <_memory_end+0xfbfdffff>
    26b8:	00e7f7b3          	and	a5,a5,a4
    26bc:	0ff00713          	li	a4,255
    26c0:	0037d793          	srli	a5,a5,0x3
    26c4:	00e91863          	bne	s2,a4,26d4 <__subsf3+0x3e4>
    26c8:	00078663          	beqz	a5,26d4 <__subsf3+0x3e4>
    26cc:	004007b7          	lui	a5,0x400
    26d0:	00000413          	li	s0,0
    26d4:	00c12083          	lw	ra,12(sp)
    26d8:	01791713          	slli	a4,s2,0x17
    26dc:	01f41513          	slli	a0,s0,0x1f
    26e0:	7f8006b7          	lui	a3,0x7f800
    26e4:	00812403          	lw	s0,8(sp)
    26e8:	00979793          	slli	a5,a5,0x9
    26ec:	00d77733          	and	a4,a4,a3
    26f0:	0097d793          	srli	a5,a5,0x9
    26f4:	00f767b3          	or	a5,a4,a5
    26f8:	00412483          	lw	s1,4(sp)
    26fc:	00012903          	lw	s2,0(sp)
    2700:	00a7e533          	or	a0,a5,a0
    2704:	01010113          	addi	sp,sp,16
    2708:	00008067          	ret
    270c:	00070913          	mv	s2,a4
    2710:	00058413          	mv	s0,a1
    2714:	d71ff06f          	j	2484 <__subsf3+0x194>
    2718:	00000793          	li	a5,0
    271c:	fa1ff06f          	j	26bc <__subsf3+0x3cc>

00002720 <__fixsfsi>:
    2720:	00800637          	lui	a2,0x800
    2724:	01755713          	srli	a4,a0,0x17
    2728:	fff60793          	addi	a5,a2,-1 # 7fffff <_memory_end+0x7dffff>
    272c:	0ff77713          	zext.b	a4,a4
    2730:	07e00593          	li	a1,126
    2734:	00a7f7b3          	and	a5,a5,a0
    2738:	01f55693          	srli	a3,a0,0x1f
    273c:	04e5d663          	bge	a1,a4,2788 <__fixsfsi+0x68>
    2740:	09d00593          	li	a1,157
    2744:	00e5da63          	bge	a1,a4,2758 <__fixsfsi+0x38>
    2748:	80000537          	lui	a0,0x80000
    274c:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
    2750:	00a68533          	add	a0,a3,a0
    2754:	00008067          	ret
    2758:	00c7e533          	or	a0,a5,a2
    275c:	09500793          	li	a5,149
    2760:	00e7dc63          	bge	a5,a4,2778 <__fixsfsi+0x58>
    2764:	f6a70713          	addi	a4,a4,-150
    2768:	00e51533          	sll	a0,a0,a4
    276c:	02068063          	beqz	a3,278c <__fixsfsi+0x6c>
    2770:	40a00533          	neg	a0,a0
    2774:	00008067          	ret
    2778:	09600793          	li	a5,150
    277c:	40e787b3          	sub	a5,a5,a4
    2780:	00f55533          	srl	a0,a0,a5
    2784:	fe9ff06f          	j	276c <__fixsfsi+0x4c>
    2788:	00000513          	li	a0,0
    278c:	00008067          	ret

00002790 <__floatsisf>:
    2790:	ff010113          	addi	sp,sp,-16
    2794:	00112623          	sw	ra,12(sp)
    2798:	00812423          	sw	s0,8(sp)
    279c:	00912223          	sw	s1,4(sp)
    27a0:	00050793          	mv	a5,a0
    27a4:	0e050063          	beqz	a0,2884 <__floatsisf+0xf4>
    27a8:	41f55713          	srai	a4,a0,0x1f
    27ac:	00a74433          	xor	s0,a4,a0
    27b0:	40e40433          	sub	s0,s0,a4
    27b4:	01f55493          	srli	s1,a0,0x1f
    27b8:	00040513          	mv	a0,s0
    27bc:	254000ef          	jal	2a10 <__clzsi2>
    27c0:	09e00793          	li	a5,158
    27c4:	40a787b3          	sub	a5,a5,a0
    27c8:	09600713          	li	a4,150
    27cc:	04f74063          	blt	a4,a5,280c <__floatsisf+0x7c>
    27d0:	00800713          	li	a4,8
    27d4:	0ae50e63          	beq	a0,a4,2890 <__floatsisf+0x100>
    27d8:	ff850513          	addi	a0,a0,-8
    27dc:	00a41433          	sll	s0,s0,a0
    27e0:	00941413          	slli	s0,s0,0x9
    27e4:	00945413          	srli	s0,s0,0x9
    27e8:	01779793          	slli	a5,a5,0x17
    27ec:	00c12083          	lw	ra,12(sp)
    27f0:	0087e7b3          	or	a5,a5,s0
    27f4:	00812403          	lw	s0,8(sp)
    27f8:	01f49513          	slli	a0,s1,0x1f
    27fc:	00a7e533          	or	a0,a5,a0
    2800:	00412483          	lw	s1,4(sp)
    2804:	01010113          	addi	sp,sp,16
    2808:	00008067          	ret
    280c:	09900713          	li	a4,153
    2810:	06f75463          	bge	a4,a5,2878 <__floatsisf+0xe8>
    2814:	00500713          	li	a4,5
    2818:	40a70733          	sub	a4,a4,a0
    281c:	01b50693          	addi	a3,a0,27
    2820:	00e45733          	srl	a4,s0,a4
    2824:	00d41433          	sll	s0,s0,a3
    2828:	00803433          	snez	s0,s0
    282c:	00876733          	or	a4,a4,s0
    2830:	fc000437          	lui	s0,0xfc000
    2834:	fff40413          	addi	s0,s0,-1 # fbffffff <_memory_end+0xfbfdffff>
    2838:	00777693          	andi	a3,a4,7
    283c:	00877433          	and	s0,a4,s0
    2840:	00068a63          	beqz	a3,2854 <__floatsisf+0xc4>
    2844:	00f77713          	andi	a4,a4,15
    2848:	00400693          	li	a3,4
    284c:	00d70463          	beq	a4,a3,2854 <__floatsisf+0xc4>
    2850:	00440413          	addi	s0,s0,4
    2854:	00541713          	slli	a4,s0,0x5
    2858:	00075c63          	bgez	a4,2870 <__floatsisf+0xe0>
    285c:	fc0007b7          	lui	a5,0xfc000
    2860:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
    2864:	00f47433          	and	s0,s0,a5
    2868:	09f00793          	li	a5,159
    286c:	40a787b3          	sub	a5,a5,a0
    2870:	00345413          	srli	s0,s0,0x3
    2874:	f6dff06f          	j	27e0 <__floatsisf+0x50>
    2878:	ffb50713          	addi	a4,a0,-5
    287c:	00e41733          	sll	a4,s0,a4
    2880:	fb1ff06f          	j	2830 <__floatsisf+0xa0>
    2884:	00000493          	li	s1,0
    2888:	00000413          	li	s0,0
    288c:	f55ff06f          	j	27e0 <__floatsisf+0x50>
    2890:	09600793          	li	a5,150
    2894:	f4dff06f          	j	27e0 <__floatsisf+0x50>

00002898 <__truncdfsf2>:
    2898:	0145d613          	srli	a2,a1,0x14
    289c:	7ff67613          	andi	a2,a2,2047
    28a0:	00c59793          	slli	a5,a1,0xc
    28a4:	00160713          	addi	a4,a2,1
    28a8:	0097d793          	srli	a5,a5,0x9
    28ac:	01d55693          	srli	a3,a0,0x1d
    28b0:	7fe77713          	andi	a4,a4,2046
    28b4:	00f6e6b3          	or	a3,a3,a5
    28b8:	01f5d593          	srli	a1,a1,0x1f
    28bc:	00351793          	slli	a5,a0,0x3
    28c0:	0a070663          	beqz	a4,296c <__truncdfsf2+0xd4>
    28c4:	c8060713          	addi	a4,a2,-896
    28c8:	0fe00813          	li	a6,254
    28cc:	0ce84263          	blt	a6,a4,2990 <__truncdfsf2+0xf8>
    28d0:	08e04063          	bgtz	a4,2950 <__truncdfsf2+0xb8>
    28d4:	fe900513          	li	a0,-23
    28d8:	10a74a63          	blt	a4,a0,29ec <__truncdfsf2+0x154>
    28dc:	00800537          	lui	a0,0x800
    28e0:	00a6e6b3          	or	a3,a3,a0
    28e4:	01e00513          	li	a0,30
    28e8:	40e50533          	sub	a0,a0,a4
    28ec:	01f00813          	li	a6,31
    28f0:	02a84863          	blt	a6,a0,2920 <__truncdfsf2+0x88>
    28f4:	c8260613          	addi	a2,a2,-894
    28f8:	00a7d533          	srl	a0,a5,a0
    28fc:	00c797b3          	sll	a5,a5,a2
    2900:	00f037b3          	snez	a5,a5
    2904:	00c696b3          	sll	a3,a3,a2
    2908:	00d7e7b3          	or	a5,a5,a3
    290c:	00f567b3          	or	a5,a0,a5
    2910:	00000713          	li	a4,0
    2914:	0077f693          	andi	a3,a5,7
    2918:	08068063          	beqz	a3,2998 <__truncdfsf2+0x100>
    291c:	0d80006f          	j	29f4 <__truncdfsf2+0x15c>
    2920:	ffe00813          	li	a6,-2
    2924:	40e80833          	sub	a6,a6,a4
    2928:	02000893          	li	a7,32
    292c:	0106d833          	srl	a6,a3,a6
    2930:	00000713          	li	a4,0
    2934:	01150663          	beq	a0,a7,2940 <__truncdfsf2+0xa8>
    2938:	ca260613          	addi	a2,a2,-862
    293c:	00c69733          	sll	a4,a3,a2
    2940:	00f76733          	or	a4,a4,a5
    2944:	00e03733          	snez	a4,a4
    2948:	00e867b3          	or	a5,a6,a4
    294c:	fc5ff06f          	j	2910 <__truncdfsf2+0x78>
    2950:	00651513          	slli	a0,a0,0x6
    2954:	00a03533          	snez	a0,a0
    2958:	00369693          	slli	a3,a3,0x3
    295c:	01d7d793          	srli	a5,a5,0x1d
    2960:	00d566b3          	or	a3,a0,a3
    2964:	00f6e7b3          	or	a5,a3,a5
    2968:	fadff06f          	j	2914 <__truncdfsf2+0x7c>
    296c:	00f6e7b3          	or	a5,a3,a5
    2970:	00061663          	bnez	a2,297c <__truncdfsf2+0xe4>
    2974:	00f037b3          	snez	a5,a5
    2978:	f99ff06f          	j	2910 <__truncdfsf2+0x78>
    297c:	0ff00713          	li	a4,255
    2980:	00078c63          	beqz	a5,2998 <__truncdfsf2+0x100>
    2984:	00369693          	slli	a3,a3,0x3
    2988:	020007b7          	lui	a5,0x2000
    298c:	fd9ff06f          	j	2964 <__truncdfsf2+0xcc>
    2990:	00000793          	li	a5,0
    2994:	0ff00713          	li	a4,255
    2998:	00579693          	slli	a3,a5,0x5
    299c:	0006de63          	bgez	a3,29b8 <__truncdfsf2+0x120>
    29a0:	00170713          	addi	a4,a4,1
    29a4:	0ff00693          	li	a3,255
    29a8:	06d70063          	beq	a4,a3,2a08 <__truncdfsf2+0x170>
    29ac:	fc0006b7          	lui	a3,0xfc000
    29b0:	fff68693          	addi	a3,a3,-1 # fbffffff <_memory_end+0xfbfdffff>
    29b4:	00d7f7b3          	and	a5,a5,a3
    29b8:	0ff00693          	li	a3,255
    29bc:	0037d793          	srli	a5,a5,0x3
    29c0:	00d71863          	bne	a4,a3,29d0 <__truncdfsf2+0x138>
    29c4:	00078663          	beqz	a5,29d0 <__truncdfsf2+0x138>
    29c8:	004007b7          	lui	a5,0x400
    29cc:	00000593          	li	a1,0
    29d0:	7f8006b7          	lui	a3,0x7f800
    29d4:	01771713          	slli	a4,a4,0x17
    29d8:	00d77733          	and	a4,a4,a3
    29dc:	00f76733          	or	a4,a4,a5
    29e0:	01f59513          	slli	a0,a1,0x1f
    29e4:	00a76533          	or	a0,a4,a0
    29e8:	00008067          	ret
    29ec:	00100793          	li	a5,1
    29f0:	00000713          	li	a4,0
    29f4:	00f7f693          	andi	a3,a5,15
    29f8:	00400613          	li	a2,4
    29fc:	f8c68ee3          	beq	a3,a2,2998 <__truncdfsf2+0x100>
    2a00:	00478793          	addi	a5,a5,4 # 400004 <_memory_end+0x3e0004>
    2a04:	f95ff06f          	j	2998 <__truncdfsf2+0x100>
    2a08:	00000793          	li	a5,0
    2a0c:	fadff06f          	j	29b8 <__truncdfsf2+0x120>

00002a10 <__clzsi2>:
    2a10:	000107b7          	lui	a5,0x10
    2a14:	02f57863          	bgeu	a0,a5,2a44 <__clzsi2+0x34>
    2a18:	10053793          	sltiu	a5,a0,256
    2a1c:	0017b793          	seqz	a5,a5
    2a20:	00379793          	slli	a5,a5,0x3
    2a24:	02000693          	li	a3,32
    2a28:	40f686b3          	sub	a3,a3,a5
    2a2c:	00f55533          	srl	a0,a0,a5
    2a30:	32018793          	addi	a5,gp,800 # 2d78 <__clz_tab>
    2a34:	00a787b3          	add	a5,a5,a0
    2a38:	0007c503          	lbu	a0,0(a5) # 10000 <_bss_end+0xd138>
    2a3c:	40a68533          	sub	a0,a3,a0
    2a40:	00008067          	ret
    2a44:	01000737          	lui	a4,0x1000
    2a48:	01800793          	li	a5,24
    2a4c:	fce57ce3          	bgeu	a0,a4,2a24 <__clzsi2+0x14>
    2a50:	01000793          	li	a5,16
    2a54:	fd1ff06f          	j	2a24 <__clzsi2+0x14>
