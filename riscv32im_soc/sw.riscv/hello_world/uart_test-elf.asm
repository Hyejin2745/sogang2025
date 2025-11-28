
uart_test.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00005197          	auipc	gp,0x5
       4:	d9818193          	addi	gp,gp,-616 # 4d98 <__global_pointer$>
       8:	00020117          	auipc	sp,0x20
       c:	ff810113          	addi	sp,sp,-8 # 20000 <_memory_end>
      10:	76018e13          	addi	t3,gp,1888 # 54f8 <current_i2c_id>
      14:	76418e93          	addi	t4,gp,1892 # 54fc <_bss_end>
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
      3c:	6c818313          	addi	t1,gp,1736 # 5460 <tohost>
      40:	00532023          	sw	t0,0(t1)
      44:	0000006f          	j	44 <terminate+0xc>

00000048 <main>:
      48:	fd010113          	addi	sp,sp,-48
      4c:	02112623          	sw	ra,44(sp)
      50:	02812423          	sw	s0,40(sp)
      54:	03010413          	addi	s0,sp,48
      58:	90020537          	lui	a0,0x90020
      5c:	6dd000ef          	jal	f38 <uart_set_addr>
      60:	00100713          	li	a4,1
      64:	00000693          	li	a3,0
      68:	00800613          	li	a2,8
      6c:	0001c7b7          	lui	a5,0x1c
      70:	20078593          	addi	a1,a5,512 # 1c200 <_bss_end+0x16d04>
      74:	05f5e7b7          	lui	a5,0x5f5e
      78:	10078513          	addi	a0,a5,256 # 5f5e100 <_memory_end+0x5f3e100>
      7c:	0ad000ef          	jal	928 <uart_init>
      80:	90030537          	lui	a0,0x90030
      84:	519020ef          	jal	2d9c <keypad_init>
      88:	00018513          	mv	a0,gp
      8c:	270000ef          	jal	2fc <my_printf>
      90:	90030537          	lui	a0,0x90030
      94:	2b1020ef          	jal	2b44 <gpio_set_addr>
      98:	774020ef          	jal	280c <gpio_read>
      9c:	fea42223          	sw	a0,-28(s0)
      a0:	fe442583          	lw	a1,-28(s0)
      a4:	01c18513          	addi	a0,gp,28 # 4db4 <__global_pointer$+0x1c>
      a8:	254000ef          	jal	2fc <my_printf>
      ac:	fe442783          	lw	a5,-28(s0)
      b0:	0047d793          	srli	a5,a5,0x4
      b4:	00f7f793          	andi	a5,a5,15
      b8:	00078593          	mv	a1,a5
      bc:	03418513          	addi	a0,gp,52 # 4dcc <__global_pointer$+0x34>
      c0:	23c000ef          	jal	2fc <my_printf>
      c4:	05418513          	addi	a0,gp,84 # 4dec <__global_pointer$+0x54>
      c8:	234000ef          	jal	2fc <my_printf>
      cc:	fe042623          	sw	zero,-20(s0)
      d0:	0880006f          	j	158 <main+0x110>
      d4:	fec42783          	lw	a5,-20(s0)
      d8:	00478793          	addi	a5,a5,4
      dc:	00100713          	li	a4,1
      e0:	00f717b3          	sll	a5,a4,a5
      e4:	fff7c793          	not	a5,a5
      e8:	0f07f793          	andi	a5,a5,240
      ec:	fcf42e23          	sw	a5,-36(s0)
      f0:	fdc42503          	lw	a0,-36(s0)
      f4:	744020ef          	jal	2838 <gpio_write>
      f8:	000027b7          	lui	a5,0x2
      fc:	71078793          	addi	a5,a5,1808 # 2710 <i2c_get_clk_freq+0x28>
     100:	fcf42823          	sw	a5,-48(s0)
     104:	00000013          	nop
     108:	fd042783          	lw	a5,-48(s0)
     10c:	fff78713          	addi	a4,a5,-1
     110:	fce42823          	sw	a4,-48(s0)
     114:	fe079ae3          	bnez	a5,108 <main+0xc0>
     118:	6f4020ef          	jal	280c <gpio_read>
     11c:	fca42c23          	sw	a0,-40(s0)
     120:	fd842783          	lw	a5,-40(s0)
     124:	0047d793          	srli	a5,a5,0x4
     128:	00f7f793          	andi	a5,a5,15
     12c:	fcf42a23          	sw	a5,-44(s0)
     130:	fec42783          	lw	a5,-20(s0)
     134:	00178793          	addi	a5,a5,1
     138:	fd442683          	lw	a3,-44(s0)
     13c:	fdc42603          	lw	a2,-36(s0)
     140:	00078593          	mv	a1,a5
     144:	06418513          	addi	a0,gp,100 # 4dfc <__global_pointer$+0x64>
     148:	1b4000ef          	jal	2fc <my_printf>
     14c:	fec42783          	lw	a5,-20(s0)
     150:	00178793          	addi	a5,a5,1
     154:	fef42623          	sw	a5,-20(s0)
     158:	fec42703          	lw	a4,-20(s0)
     15c:	00300793          	li	a5,3
     160:	f6e7dae3          	bge	a5,a4,d4 <main+0x8c>
     164:	0f000513          	li	a0,240
     168:	6d0020ef          	jal	2838 <gpio_write>
     16c:	08818513          	addi	a0,gp,136 # 4e20 <__global_pointer$+0x88>
     170:	18c000ef          	jal	2fc <my_printf>
     174:	09c18513          	addi	a0,gp,156 # 4e34 <__global_pointer$+0x9c>
     178:	184000ef          	jal	2fc <my_printf>
     17c:	fe042423          	sw	zero,-24(s0)
     180:	575020ef          	jal	2ef4 <keypad_get_char>
     184:	00050793          	mv	a5,a0
     188:	fef401a3          	sb	a5,-29(s0)
     18c:	fe344783          	lbu	a5,-29(s0)
     190:	fe0788e3          	beqz	a5,180 <main+0x138>
     194:	fe842783          	lw	a5,-24(s0)
     198:	00178793          	addi	a5,a5,1
     19c:	fef42423          	sw	a5,-24(s0)
     1a0:	fe344783          	lbu	a5,-29(s0)
     1a4:	fe842603          	lw	a2,-24(s0)
     1a8:	00078593          	mv	a1,a5
     1ac:	0bc18513          	addi	a0,gp,188 # 4e54 <__global_pointer$+0xbc>
     1b0:	14c000ef          	jal	2fc <my_printf>
     1b4:	1f400513          	li	a0,500
     1b8:	5d5020ef          	jal	2f8c <keypad_delay_ms>
     1bc:	fe842703          	lw	a4,-24(s0)
     1c0:	01300793          	li	a5,19
     1c4:	fae7dee3          	bge	a5,a4,180 <main+0x138>
     1c8:	0d418513          	addi	a0,gp,212 # 4e6c <__global_pointer$+0xd4>
     1cc:	130000ef          	jal	2fc <my_printf>
     1d0:	00000013          	nop
     1d4:	00000793          	li	a5,0
     1d8:	00078513          	mv	a0,a5
     1dc:	02c12083          	lw	ra,44(sp)
     1e0:	02812403          	lw	s0,40(sp)
     1e4:	03010113          	addi	sp,sp,48
     1e8:	00008067          	ret

000001ec <my_putc>:
     1ec:	fe010113          	addi	sp,sp,-32
     1f0:	00112e23          	sw	ra,28(sp)
     1f4:	00812c23          	sw	s0,24(sp)
     1f8:	02010413          	addi	s0,sp,32
     1fc:	fea42623          	sw	a0,-20(s0)
     200:	feb42423          	sw	a1,-24(s0)
     204:	fec42783          	lw	a5,-20(s0)
     208:	0ff7f793          	zext.b	a5,a5
     20c:	00078513          	mv	a0,a5
     210:	229000ef          	jal	c38 <uart_put_char>
     214:	00050793          	mv	a5,a0
     218:	00078513          	mv	a0,a5
     21c:	01c12083          	lw	ra,28(sp)
     220:	01812403          	lw	s0,24(sp)
     224:	02010113          	addi	sp,sp,32
     228:	00008067          	ret

0000022c <my_putchar>:
     22c:	fe010113          	addi	sp,sp,-32
     230:	00112e23          	sw	ra,28(sp)
     234:	00812c23          	sw	s0,24(sp)
     238:	02010413          	addi	s0,sp,32
     23c:	fea42623          	sw	a0,-20(s0)
     240:	fec42783          	lw	a5,-20(s0)
     244:	0ff7f793          	zext.b	a5,a5
     248:	00078513          	mv	a0,a5
     24c:	1ed000ef          	jal	c38 <uart_put_char>
     250:	00050793          	mv	a5,a0
     254:	00078513          	mv	a0,a5
     258:	01c12083          	lw	ra,28(sp)
     25c:	01812403          	lw	s0,24(sp)
     260:	02010113          	addi	sp,sp,32
     264:	00008067          	ret

00000268 <my_getc>:
     268:	fe010113          	addi	sp,sp,-32
     26c:	00112e23          	sw	ra,28(sp)
     270:	00812c23          	sw	s0,24(sp)
     274:	02010413          	addi	s0,sp,32
     278:	fea42623          	sw	a0,-20(s0)
     27c:	17d000ef          	jal	bf8 <uart_get_char>
     280:	00050793          	mv	a5,a0
     284:	00078513          	mv	a0,a5
     288:	01c12083          	lw	ra,28(sp)
     28c:	01812403          	lw	s0,24(sp)
     290:	02010113          	addi	sp,sp,32
     294:	00008067          	ret

00000298 <my_getchar>:
     298:	ff010113          	addi	sp,sp,-16
     29c:	00112623          	sw	ra,12(sp)
     2a0:	00812423          	sw	s0,8(sp)
     2a4:	01010413          	addi	s0,sp,16
     2a8:	151000ef          	jal	bf8 <uart_get_char>
     2ac:	00050793          	mv	a5,a0
     2b0:	00078513          	mv	a0,a5
     2b4:	00c12083          	lw	ra,12(sp)
     2b8:	00812403          	lw	s0,8(sp)
     2bc:	01010113          	addi	sp,sp,16
     2c0:	00008067          	ret

000002c4 <my_puts>:
     2c4:	fd010113          	addi	sp,sp,-48
     2c8:	02112623          	sw	ra,44(sp)
     2cc:	02812423          	sw	s0,40(sp)
     2d0:	03010413          	addi	s0,sp,48
     2d4:	fca42e23          	sw	a0,-36(s0)
     2d8:	fdc42503          	lw	a0,-36(s0)
     2dc:	1bd000ef          	jal	c98 <uart_put_string>
     2e0:	fea42623          	sw	a0,-20(s0)
     2e4:	fec42783          	lw	a5,-20(s0)
     2e8:	00078513          	mv	a0,a5
     2ec:	02c12083          	lw	ra,44(sp)
     2f0:	02812403          	lw	s0,40(sp)
     2f4:	03010113          	addi	sp,sp,48
     2f8:	00008067          	ret

000002fc <my_printf>:
     2fc:	fb010113          	addi	sp,sp,-80
     300:	02112623          	sw	ra,44(sp)
     304:	02812423          	sw	s0,40(sp)
     308:	03010413          	addi	s0,sp,48
     30c:	fca42e23          	sw	a0,-36(s0)
     310:	00b42223          	sw	a1,4(s0)
     314:	00c42423          	sw	a2,8(s0)
     318:	00d42623          	sw	a3,12(s0)
     31c:	00e42823          	sw	a4,16(s0)
     320:	00f42a23          	sw	a5,20(s0)
     324:	01042c23          	sw	a6,24(s0)
     328:	01142e23          	sw	a7,28(s0)
     32c:	02040793          	addi	a5,s0,32
     330:	fcf42c23          	sw	a5,-40(s0)
     334:	fd842783          	lw	a5,-40(s0)
     338:	fe478793          	addi	a5,a5,-28
     33c:	fef42423          	sw	a5,-24(s0)
     340:	fe842783          	lw	a5,-24(s0)
     344:	00078593          	mv	a1,a5
     348:	fdc42503          	lw	a0,-36(s0)
     34c:	28c000ef          	jal	5d8 <my_vprintf>
     350:	fea42623          	sw	a0,-20(s0)
     354:	fec42783          	lw	a5,-20(s0)
     358:	00078513          	mv	a0,a5
     35c:	02c12083          	lw	ra,44(sp)
     360:	02812403          	lw	s0,40(sp)
     364:	05010113          	addi	sp,sp,80
     368:	00008067          	ret

0000036c <my_printn>:
     36c:	fd010113          	addi	sp,sp,-48
     370:	02112623          	sw	ra,44(sp)
     374:	02812423          	sw	s0,40(sp)
     378:	03010413          	addi	s0,sp,48
     37c:	fca42e23          	sw	a0,-36(s0)
     380:	fcb42c23          	sw	a1,-40(s0)
     384:	fcc42a23          	sw	a2,-44(s0)
     388:	fe042623          	sw	zero,-20(s0)
     38c:	fd842703          	lw	a4,-40(s0)
     390:	00a00793          	li	a5,10
     394:	02f71863          	bne	a4,a5,3c4 <my_printn+0x58>
     398:	fdc42783          	lw	a5,-36(s0)
     39c:	0207d463          	bgez	a5,3c4 <my_printn+0x58>
     3a0:	02d00513          	li	a0,45
     3a4:	095000ef          	jal	c38 <uart_put_char>
     3a8:	00050713          	mv	a4,a0
     3ac:	fec42783          	lw	a5,-20(s0)
     3b0:	00f707b3          	add	a5,a4,a5
     3b4:	fef42623          	sw	a5,-20(s0)
     3b8:	fdc42783          	lw	a5,-36(s0)
     3bc:	40f007b3          	neg	a5,a5
     3c0:	fcf42e23          	sw	a5,-36(s0)
     3c4:	fd842783          	lw	a5,-40(s0)
     3c8:	fdc42703          	lw	a4,-36(s0)
     3cc:	02f757b3          	divu	a5,a4,a5
     3d0:	fef42423          	sw	a5,-24(s0)
     3d4:	fe842783          	lw	a5,-24(s0)
     3d8:	00079863          	bnez	a5,3e8 <my_printn+0x7c>
     3dc:	fd442703          	lw	a4,-44(s0)
     3e0:	00100793          	li	a5,1
     3e4:	02e7d863          	bge	a5,a4,414 <my_printn+0xa8>
     3e8:	fd442783          	lw	a5,-44(s0)
     3ec:	fff78793          	addi	a5,a5,-1
     3f0:	fcf42a23          	sw	a5,-44(s0)
     3f4:	fd442603          	lw	a2,-44(s0)
     3f8:	fd842583          	lw	a1,-40(s0)
     3fc:	fe842503          	lw	a0,-24(s0)
     400:	f6dff0ef          	jal	36c <my_printn>
     404:	00050713          	mv	a4,a0
     408:	fec42783          	lw	a5,-20(s0)
     40c:	00e787b3          	add	a5,a5,a4
     410:	fef42623          	sw	a5,-20(s0)
     414:	fd842783          	lw	a5,-40(s0)
     418:	fdc42703          	lw	a4,-36(s0)
     41c:	02f777b3          	remu	a5,a4,a5
     420:	00078713          	mv	a4,a5
     424:	0f818793          	addi	a5,gp,248 # 4e90 <__global_pointer$+0xf8>
     428:	00e787b3          	add	a5,a5,a4
     42c:	0007c783          	lbu	a5,0(a5)
     430:	00078513          	mv	a0,a5
     434:	005000ef          	jal	c38 <uart_put_char>
     438:	00050713          	mv	a4,a0
     43c:	fec42783          	lw	a5,-20(s0)
     440:	00f707b3          	add	a5,a4,a5
     444:	fef42623          	sw	a5,-20(s0)
     448:	fec42783          	lw	a5,-20(s0)
     44c:	00078513          	mv	a0,a5
     450:	02c12083          	lw	ra,44(sp)
     454:	02812403          	lw	s0,40(sp)
     458:	03010113          	addi	sp,sp,48
     45c:	00008067          	ret

00000460 <my_printflt>:
     460:	fd010113          	addi	sp,sp,-48
     464:	02112623          	sw	ra,44(sp)
     468:	02812423          	sw	s0,40(sp)
     46c:	03010413          	addi	s0,sp,48
     470:	fca42e23          	sw	a0,-36(s0)
     474:	fcb42c23          	sw	a1,-40(s0)
     478:	fe042423          	sw	zero,-24(s0)
     47c:	00000593          	li	a1,0
     480:	fdc42503          	lw	a0,-36(s0)
     484:	42d030ef          	jal	40b0 <__lesf2>
     488:	00050793          	mv	a5,a0
     48c:	0207d663          	bgez	a5,4b8 <my_printflt+0x58>
     490:	02d00513          	li	a0,45
     494:	7a4000ef          	jal	c38 <uart_put_char>
     498:	00050713          	mv	a4,a0
     49c:	fe842783          	lw	a5,-24(s0)
     4a0:	00f707b3          	add	a5,a4,a5
     4a4:	fef42423          	sw	a5,-24(s0)
     4a8:	fdc42703          	lw	a4,-36(s0)
     4ac:	800007b7          	lui	a5,0x80000
     4b0:	00f747b3          	xor	a5,a4,a5
     4b4:	fcf42e23          	sw	a5,-36(s0)
     4b8:	fdc42503          	lw	a0,-36(s0)
     4bc:	3ec040ef          	jal	48a8 <__fixsfsi>
     4c0:	00050793          	mv	a5,a0
     4c4:	fef42223          	sw	a5,-28(s0)
     4c8:	fe442783          	lw	a5,-28(s0)
     4cc:	fd842603          	lw	a2,-40(s0)
     4d0:	00a00593          	li	a1,10
     4d4:	00078513          	mv	a0,a5
     4d8:	e95ff0ef          	jal	36c <my_printn>
     4dc:	00050713          	mv	a4,a0
     4e0:	fe842783          	lw	a5,-24(s0)
     4e4:	00e787b3          	add	a5,a5,a4
     4e8:	fef42423          	sw	a5,-24(s0)
     4ec:	02e00513          	li	a0,46
     4f0:	748000ef          	jal	c38 <uart_put_char>
     4f4:	00050713          	mv	a4,a0
     4f8:	fe842783          	lw	a5,-24(s0)
     4fc:	00f707b3          	add	a5,a4,a5
     500:	fef42423          	sw	a5,-24(s0)
     504:	fe442503          	lw	a0,-28(s0)
     508:	410040ef          	jal	4918 <__floatsisf>
     50c:	00050793          	mv	a5,a0
     510:	00078593          	mv	a1,a5
     514:	fdc42503          	lw	a0,-36(s0)
     518:	761030ef          	jal	4478 <__subsf3>
     51c:	00050793          	mv	a5,a0
     520:	fcf42e23          	sw	a5,-36(s0)
     524:	fe042623          	sw	zero,-20(s0)
     528:	1641a583          	lw	a1,356(gp) # 4efc <__global_pointer$+0x164>
     52c:	fdc42503          	lw	a0,-36(s0)
     530:	42d030ef          	jal	415c <__mulsf3>
     534:	00050793          	mv	a5,a0
     538:	fcf42e23          	sw	a5,-36(s0)
     53c:	fdc42503          	lw	a0,-36(s0)
     540:	368040ef          	jal	48a8 <__fixsfsi>
     544:	00050793          	mv	a5,a0
     548:	fef42223          	sw	a5,-28(s0)
     54c:	fe442783          	lw	a5,-28(s0)
     550:	0ff7f793          	zext.b	a5,a5
     554:	03078793          	addi	a5,a5,48 # 80000030 <_memory_end+0x7ffe0030>
     558:	0ff7f793          	zext.b	a5,a5
     55c:	00078513          	mv	a0,a5
     560:	6d8000ef          	jal	c38 <uart_put_char>
     564:	00050713          	mv	a4,a0
     568:	fe842783          	lw	a5,-24(s0)
     56c:	00f707b3          	add	a5,a4,a5
     570:	fef42423          	sw	a5,-24(s0)
     574:	fe442503          	lw	a0,-28(s0)
     578:	3a0040ef          	jal	4918 <__floatsisf>
     57c:	00050793          	mv	a5,a0
     580:	00078593          	mv	a1,a5
     584:	fdc42503          	lw	a0,-36(s0)
     588:	6f1030ef          	jal	4478 <__subsf3>
     58c:	00050793          	mv	a5,a0
     590:	fcf42e23          	sw	a5,-36(s0)
     594:	fec42783          	lw	a5,-20(s0)
     598:	00178793          	addi	a5,a5,1
     59c:	fef42623          	sw	a5,-20(s0)
     5a0:	00000593          	li	a1,0
     5a4:	fdc42503          	lw	a0,-36(s0)
     5a8:	2a1030ef          	jal	4048 <__eqsf2>
     5ac:	00050793          	mv	a5,a0
     5b0:	00078863          	beqz	a5,5c0 <my_printflt+0x160>
     5b4:	fec42703          	lw	a4,-20(s0)
     5b8:	00500793          	li	a5,5
     5bc:	f6e7d6e3          	bge	a5,a4,528 <my_printflt+0xc8>
     5c0:	fe842783          	lw	a5,-24(s0)
     5c4:	00078513          	mv	a0,a5
     5c8:	02c12083          	lw	ra,44(sp)
     5cc:	02812403          	lw	s0,40(sp)
     5d0:	03010113          	addi	sp,sp,48
     5d4:	00008067          	ret

000005d8 <my_vprintf>:
     5d8:	fc010113          	addi	sp,sp,-64
     5dc:	02112e23          	sw	ra,60(sp)
     5e0:	02812c23          	sw	s0,56(sp)
     5e4:	04010413          	addi	s0,sp,64
     5e8:	fca42623          	sw	a0,-52(s0)
     5ec:	fcb42423          	sw	a1,-56(s0)
     5f0:	fe042023          	sw	zero,-32(s0)
     5f4:	3000006f          	j	8f4 <my_vprintf+0x31c>
     5f8:	fe842703          	lw	a4,-24(s0)
     5fc:	02500793          	li	a5,37
     600:	2cf71063          	bne	a4,a5,8c0 <my_vprintf+0x2e8>
     604:	fcc42783          	lw	a5,-52(s0)
     608:	0007c783          	lbu	a5,0(a5)
     60c:	fef42423          	sw	a5,-24(s0)
     610:	fe042623          	sw	zero,-20(s0)
     614:	0440006f          	j	658 <my_vprintf+0x80>
     618:	fec42703          	lw	a4,-20(s0)
     61c:	00070793          	mv	a5,a4
     620:	00279793          	slli	a5,a5,0x2
     624:	00e787b3          	add	a5,a5,a4
     628:	00179793          	slli	a5,a5,0x1
     62c:	00078713          	mv	a4,a5
     630:	fe842783          	lw	a5,-24(s0)
     634:	00f707b3          	add	a5,a4,a5
     638:	fd078793          	addi	a5,a5,-48
     63c:	fef42623          	sw	a5,-20(s0)
     640:	fcc42783          	lw	a5,-52(s0)
     644:	00178793          	addi	a5,a5,1
     648:	fcf42623          	sw	a5,-52(s0)
     64c:	fcc42783          	lw	a5,-52(s0)
     650:	0007c783          	lbu	a5,0(a5)
     654:	fef42423          	sw	a5,-24(s0)
     658:	fe842703          	lw	a4,-24(s0)
     65c:	02f00793          	li	a5,47
     660:	00e7d863          	bge	a5,a4,670 <my_vprintf+0x98>
     664:	fe842703          	lw	a4,-24(s0)
     668:	03900793          	li	a5,57
     66c:	fae7d6e3          	bge	a5,a4,618 <my_vprintf+0x40>
     670:	fcc42783          	lw	a5,-52(s0)
     674:	00178713          	addi	a4,a5,1
     678:	fce42623          	sw	a4,-52(s0)
     67c:	0007c783          	lbu	a5,0(a5)
     680:	fef42423          	sw	a5,-24(s0)
     684:	fe842703          	lw	a4,-24(s0)
     688:	02500793          	li	a5,37
     68c:	1ef70863          	beq	a4,a5,87c <my_vprintf+0x2a4>
     690:	fe842703          	lw	a4,-24(s0)
     694:	02500793          	li	a5,37
     698:	20f74063          	blt	a4,a5,898 <my_vprintf+0x2c0>
     69c:	fe842703          	lw	a4,-24(s0)
     6a0:	07800793          	li	a5,120
     6a4:	1ee7ca63          	blt	a5,a4,898 <my_vprintf+0x2c0>
     6a8:	fe842703          	lw	a4,-24(s0)
     6ac:	06300793          	li	a5,99
     6b0:	1ef74463          	blt	a4,a5,898 <my_vprintf+0x2c0>
     6b4:	fe842783          	lw	a5,-24(s0)
     6b8:	f9d78793          	addi	a5,a5,-99
     6bc:	01500713          	li	a4,21
     6c0:	1cf76c63          	bltu	a4,a5,898 <my_vprintf+0x2c0>
     6c4:	00279713          	slli	a4,a5,0x2
     6c8:	10c18793          	addi	a5,gp,268 # 4ea4 <__global_pointer$+0x10c>
     6cc:	00f707b3          	add	a5,a4,a5
     6d0:	0007a783          	lw	a5,0(a5)
     6d4:	00078067          	jr	a5
     6d8:	fc842783          	lw	a5,-56(s0)
     6dc:	00478713          	addi	a4,a5,4
     6e0:	fce42423          	sw	a4,-56(s0)
     6e4:	0007a783          	lw	a5,0(a5)
     6e8:	fcf40ba3          	sb	a5,-41(s0)
     6ec:	fd744783          	lbu	a5,-41(s0)
     6f0:	00078513          	mv	a0,a5
     6f4:	544000ef          	jal	c38 <uart_put_char>
     6f8:	00050713          	mv	a4,a0
     6fc:	fe042783          	lw	a5,-32(s0)
     700:	00f707b3          	add	a5,a4,a5
     704:	fef42023          	sw	a5,-32(s0)
     708:	1ec0006f          	j	8f4 <my_vprintf+0x31c>
     70c:	fc842783          	lw	a5,-56(s0)
     710:	00478713          	addi	a4,a5,4
     714:	fce42423          	sw	a4,-56(s0)
     718:	0007a783          	lw	a5,0(a5)
     71c:	fcf42e23          	sw	a5,-36(s0)
     720:	fdc42783          	lw	a5,-36(s0)
     724:	fec42603          	lw	a2,-20(s0)
     728:	00800593          	li	a1,8
     72c:	00078513          	mv	a0,a5
     730:	c3dff0ef          	jal	36c <my_printn>
     734:	00050713          	mv	a4,a0
     738:	fe042783          	lw	a5,-32(s0)
     73c:	00e787b3          	add	a5,a5,a4
     740:	fef42023          	sw	a5,-32(s0)
     744:	1b00006f          	j	8f4 <my_vprintf+0x31c>
     748:	fc842783          	lw	a5,-56(s0)
     74c:	00478713          	addi	a4,a5,4
     750:	fce42423          	sw	a4,-56(s0)
     754:	0007a783          	lw	a5,0(a5)
     758:	fcf42e23          	sw	a5,-36(s0)
     75c:	fdc42783          	lw	a5,-36(s0)
     760:	fec42603          	lw	a2,-20(s0)
     764:	00a00593          	li	a1,10
     768:	00078513          	mv	a0,a5
     76c:	c01ff0ef          	jal	36c <my_printn>
     770:	00050713          	mv	a4,a0
     774:	fe042783          	lw	a5,-32(s0)
     778:	00e787b3          	add	a5,a5,a4
     77c:	fef42023          	sw	a5,-32(s0)
     780:	1740006f          	j	8f4 <my_vprintf+0x31c>
     784:	fc842783          	lw	a5,-56(s0)
     788:	00478713          	addi	a4,a5,4
     78c:	fce42423          	sw	a4,-56(s0)
     790:	0007a783          	lw	a5,0(a5)
     794:	fcf42e23          	sw	a5,-36(s0)
     798:	fdc42783          	lw	a5,-36(s0)
     79c:	fec42603          	lw	a2,-20(s0)
     7a0:	01000593          	li	a1,16
     7a4:	00078513          	mv	a0,a5
     7a8:	bc5ff0ef          	jal	36c <my_printn>
     7ac:	00050713          	mv	a4,a0
     7b0:	fe042783          	lw	a5,-32(s0)
     7b4:	00e787b3          	add	a5,a5,a4
     7b8:	fef42023          	sw	a5,-32(s0)
     7bc:	1380006f          	j	8f4 <my_vprintf+0x31c>
     7c0:	fc842783          	lw	a5,-56(s0)
     7c4:	00478713          	addi	a4,a5,4
     7c8:	fce42423          	sw	a4,-56(s0)
     7cc:	0007a783          	lw	a5,0(a5)
     7d0:	fef42223          	sw	a5,-28(s0)
     7d4:	0480006f          	j	81c <my_vprintf+0x244>
     7d8:	fe442783          	lw	a5,-28(s0)
     7dc:	0007c783          	lbu	a5,0(a5)
     7e0:	00078513          	mv	a0,a5
     7e4:	454000ef          	jal	c38 <uart_put_char>
     7e8:	00050713          	mv	a4,a0
     7ec:	fe042783          	lw	a5,-32(s0)
     7f0:	00f707b3          	add	a5,a4,a5
     7f4:	fef42023          	sw	a5,-32(s0)
     7f8:	fe442783          	lw	a5,-28(s0)
     7fc:	0007c703          	lbu	a4,0(a5)
     800:	00a00793          	li	a5,10
     804:	00f71663          	bne	a4,a5,810 <my_vprintf+0x238>
     808:	00d00513          	li	a0,13
     80c:	42c000ef          	jal	c38 <uart_put_char>
     810:	fe442783          	lw	a5,-28(s0)
     814:	00178793          	addi	a5,a5,1
     818:	fef42223          	sw	a5,-28(s0)
     81c:	fe442783          	lw	a5,-28(s0)
     820:	0007c783          	lbu	a5,0(a5)
     824:	fa079ae3          	bnez	a5,7d8 <my_vprintf+0x200>
     828:	0cc0006f          	j	8f4 <my_vprintf+0x31c>
     82c:	fc842783          	lw	a5,-56(s0)
     830:	00778793          	addi	a5,a5,7
     834:	ff87f793          	andi	a5,a5,-8
     838:	00878713          	addi	a4,a5,8
     83c:	fce42423          	sw	a4,-56(s0)
     840:	0007a703          	lw	a4,0(a5)
     844:	0047a783          	lw	a5,4(a5)
     848:	00070513          	mv	a0,a4
     84c:	00078593          	mv	a1,a5
     850:	388040ef          	jal	4bd8 <__truncdfsf2>
     854:	00050793          	mv	a5,a0
     858:	fcf42c23          	sw	a5,-40(s0)
     85c:	fec42583          	lw	a1,-20(s0)
     860:	fd842503          	lw	a0,-40(s0)
     864:	bfdff0ef          	jal	460 <my_printflt>
     868:	00050713          	mv	a4,a0
     86c:	fe042783          	lw	a5,-32(s0)
     870:	00e787b3          	add	a5,a5,a4
     874:	fef42023          	sw	a5,-32(s0)
     878:	07c0006f          	j	8f4 <my_vprintf+0x31c>
     87c:	02500513          	li	a0,37
     880:	3b8000ef          	jal	c38 <uart_put_char>
     884:	00050713          	mv	a4,a0
     888:	fe042783          	lw	a5,-32(s0)
     88c:	00f707b3          	add	a5,a4,a5
     890:	fef42023          	sw	a5,-32(s0)
     894:	0600006f          	j	8f4 <my_vprintf+0x31c>
     898:	02500513          	li	a0,37
     89c:	39c000ef          	jal	c38 <uart_put_char>
     8a0:	00050713          	mv	a4,a0
     8a4:	fe042783          	lw	a5,-32(s0)
     8a8:	00f707b3          	add	a5,a4,a5
     8ac:	fef42023          	sw	a5,-32(s0)
     8b0:	fcc42783          	lw	a5,-52(s0)
     8b4:	fff78793          	addi	a5,a5,-1
     8b8:	fcf42623          	sw	a5,-52(s0)
     8bc:	0380006f          	j	8f4 <my_vprintf+0x31c>
     8c0:	fe842783          	lw	a5,-24(s0)
     8c4:	0ff7f793          	zext.b	a5,a5
     8c8:	00078513          	mv	a0,a5
     8cc:	36c000ef          	jal	c38 <uart_put_char>
     8d0:	00050713          	mv	a4,a0
     8d4:	fe042783          	lw	a5,-32(s0)
     8d8:	00f707b3          	add	a5,a4,a5
     8dc:	fef42023          	sw	a5,-32(s0)
     8e0:	fe842703          	lw	a4,-24(s0)
     8e4:	00a00793          	li	a5,10
     8e8:	00f71663          	bne	a4,a5,8f4 <my_vprintf+0x31c>
     8ec:	00d00513          	li	a0,13
     8f0:	348000ef          	jal	c38 <uart_put_char>
     8f4:	fcc42783          	lw	a5,-52(s0)
     8f8:	00178713          	addi	a4,a5,1
     8fc:	fce42623          	sw	a4,-52(s0)
     900:	0007c783          	lbu	a5,0(a5)
     904:	fef42423          	sw	a5,-24(s0)
     908:	fe842783          	lw	a5,-24(s0)
     90c:	ce0796e3          	bnez	a5,5f8 <my_vprintf+0x20>
     910:	fe042783          	lw	a5,-32(s0)
     914:	00078513          	mv	a0,a5
     918:	03c12083          	lw	ra,60(sp)
     91c:	03812403          	lw	s0,56(sp)
     920:	04010113          	addi	sp,sp,64
     924:	00008067          	ret

00000928 <uart_init>:
     928:	fc010113          	addi	sp,sp,-64
     92c:	02112e23          	sw	ra,60(sp)
     930:	02812c23          	sw	s0,56(sp)
     934:	04010413          	addi	s0,sp,64
     938:	fca42e23          	sw	a0,-36(s0)
     93c:	fcb42c23          	sw	a1,-40(s0)
     940:	fcc42a23          	sw	a2,-44(s0)
     944:	fcd42823          	sw	a3,-48(s0)
     948:	fce42623          	sw	a4,-52(s0)
     94c:	fdc42783          	lw	a5,-36(s0)
     950:	00079663          	bnez	a5,95c <uart_init+0x34>
     954:	5b0000ef          	jal	f04 <uart_get_clk_freq>
     958:	fca42e23          	sw	a0,-36(s0)
     95c:	fdc42703          	lw	a4,-36(s0)
     960:	fd842783          	lw	a5,-40(s0)
     964:	02f757b3          	divu	a5,a4,a5
     968:	00078513          	mv	a0,a5
     96c:	65c030ef          	jal	3fc8 <__floatunsidf>
     970:	00050713          	mv	a4,a0
     974:	00058793          	mv	a5,a1
     978:	1681a603          	lw	a2,360(gp) # 4f00 <__global_pointer$+0x168>
     97c:	16c1a683          	lw	a3,364(gp) # 4f04 <__global_pointer$+0x16c>
     980:	00070513          	mv	a0,a4
     984:	00078593          	mv	a1,a5
     988:	6d8020ef          	jal	3060 <__adddf3>
     98c:	00050713          	mv	a4,a0
     990:	00058793          	mv	a5,a1
     994:	00070513          	mv	a0,a4
     998:	00078593          	mv	a1,a5
     99c:	530030ef          	jal	3ecc <__fixdfsi>
     9a0:	00050793          	mv	a5,a0
     9a4:	00078713          	mv	a4,a5
     9a8:	000107b7          	lui	a5,0x10
     9ac:	fff78793          	addi	a5,a5,-1 # ffff <_bss_end+0xab03>
     9b0:	00f777b3          	and	a5,a4,a5
     9b4:	fef42623          	sw	a5,-20(s0)
     9b8:	fd442703          	lw	a4,-44(s0)
     9bc:	00800793          	li	a5,8
     9c0:	00f71663          	bne	a4,a5,9cc <uart_init+0xa4>
     9c4:	00000793          	li	a5,0
     9c8:	0080006f          	j	9d0 <uart_init+0xa8>
     9cc:	000107b7          	lui	a5,0x10
     9d0:	fec42703          	lw	a4,-20(s0)
     9d4:	00e7e7b3          	or	a5,a5,a4
     9d8:	fef42623          	sw	a5,-20(s0)
     9dc:	fd042783          	lw	a5,-48(s0)
     9e0:	00079663          	bnez	a5,9ec <uart_init+0xc4>
     9e4:	00000793          	li	a5,0
     9e8:	0080006f          	j	9f0 <uart_init+0xc8>
     9ec:	000207b7          	lui	a5,0x20
     9f0:	fec42703          	lw	a4,-20(s0)
     9f4:	00e7e7b3          	or	a5,a5,a4
     9f8:	fef42623          	sw	a5,-20(s0)
     9fc:	fd042703          	lw	a4,-48(s0)
     a00:	00100793          	li	a5,1
     a04:	00f71663          	bne	a4,a5,a10 <uart_init+0xe8>
     a08:	00000793          	li	a5,0
     a0c:	0080006f          	j	a14 <uart_init+0xec>
     a10:	000407b7          	lui	a5,0x40
     a14:	fec42703          	lw	a4,-20(s0)
     a18:	00e7e7b3          	or	a5,a5,a4
     a1c:	fef42623          	sw	a5,-20(s0)
     a20:	fcc42703          	lw	a4,-52(s0)
     a24:	00100793          	li	a5,1
     a28:	00f71663          	bne	a4,a5,a34 <uart_init+0x10c>
     a2c:	00000793          	li	a5,0
     a30:	0080006f          	j	a38 <uart_init+0x110>
     a34:	000807b7          	lui	a5,0x80
     a38:	fec42703          	lw	a4,-20(s0)
     a3c:	00e7e7b3          	or	a5,a5,a4
     a40:	fef42623          	sw	a5,-20(s0)
     a44:	6e41a783          	lw	a5,1764(gp) # 547c <UART_CONTROL>
     a48:	fef42423          	sw	a5,-24(s0)
     a4c:	fe842783          	lw	a5,-24(s0)
     a50:	fec42703          	lw	a4,-20(s0)
     a54:	00e7a023          	sw	a4,0(a5) # 80000 <_memory_end+0x60000>
     a58:	00000013          	nop
     a5c:	03c12083          	lw	ra,60(sp)
     a60:	03812403          	lw	s0,56(sp)
     a64:	04010113          	addi	sp,sp,64
     a68:	00008067          	ret

00000a6c <uart_init_ext>:
     a6c:	fc010113          	addi	sp,sp,-64
     a70:	02112e23          	sw	ra,60(sp)
     a74:	02812c23          	sw	s0,56(sp)
     a78:	04010413          	addi	s0,sp,64
     a7c:	fca42e23          	sw	a0,-36(s0)
     a80:	fcb42c23          	sw	a1,-40(s0)
     a84:	fcc42a23          	sw	a2,-44(s0)
     a88:	fcd42823          	sw	a3,-48(s0)
     a8c:	fce42623          	sw	a4,-52(s0)
     a90:	fcf42423          	sw	a5,-56(s0)
     a94:	fd042223          	sw	a6,-60(s0)
     a98:	fdc42783          	lw	a5,-36(s0)
     a9c:	00079663          	bnez	a5,aa8 <uart_init_ext+0x3c>
     aa0:	464000ef          	jal	f04 <uart_get_clk_freq>
     aa4:	fca42e23          	sw	a0,-36(s0)
     aa8:	fdc42703          	lw	a4,-36(s0)
     aac:	fd842783          	lw	a5,-40(s0)
     ab0:	02f757b3          	divu	a5,a4,a5
     ab4:	00078513          	mv	a0,a5
     ab8:	510030ef          	jal	3fc8 <__floatunsidf>
     abc:	00050713          	mv	a4,a0
     ac0:	00058793          	mv	a5,a1
     ac4:	1681a603          	lw	a2,360(gp) # 4f00 <__global_pointer$+0x168>
     ac8:	16c1a683          	lw	a3,364(gp) # 4f04 <__global_pointer$+0x16c>
     acc:	00070513          	mv	a0,a4
     ad0:	00078593          	mv	a1,a5
     ad4:	58c020ef          	jal	3060 <__adddf3>
     ad8:	00050713          	mv	a4,a0
     adc:	00058793          	mv	a5,a1
     ae0:	00070513          	mv	a0,a4
     ae4:	00078593          	mv	a1,a5
     ae8:	3e4030ef          	jal	3ecc <__fixdfsi>
     aec:	00050793          	mv	a5,a0
     af0:	00078713          	mv	a4,a5
     af4:	000107b7          	lui	a5,0x10
     af8:	fff78793          	addi	a5,a5,-1 # ffff <_bss_end+0xab03>
     afc:	00f777b3          	and	a5,a4,a5
     b00:	fef42623          	sw	a5,-20(s0)
     b04:	fd442703          	lw	a4,-44(s0)
     b08:	00800793          	li	a5,8
     b0c:	00f71663          	bne	a4,a5,b18 <uart_init_ext+0xac>
     b10:	00000793          	li	a5,0
     b14:	0080006f          	j	b1c <uart_init_ext+0xb0>
     b18:	000107b7          	lui	a5,0x10
     b1c:	fec42703          	lw	a4,-20(s0)
     b20:	00e7e7b3          	or	a5,a5,a4
     b24:	fef42623          	sw	a5,-20(s0)
     b28:	fd042783          	lw	a5,-48(s0)
     b2c:	00079663          	bnez	a5,b38 <uart_init_ext+0xcc>
     b30:	00000793          	li	a5,0
     b34:	0080006f          	j	b3c <uart_init_ext+0xd0>
     b38:	000207b7          	lui	a5,0x20
     b3c:	fec42703          	lw	a4,-20(s0)
     b40:	00e7e7b3          	or	a5,a5,a4
     b44:	fef42623          	sw	a5,-20(s0)
     b48:	fd042703          	lw	a4,-48(s0)
     b4c:	00100793          	li	a5,1
     b50:	00f71663          	bne	a4,a5,b5c <uart_init_ext+0xf0>
     b54:	00000793          	li	a5,0
     b58:	0080006f          	j	b60 <uart_init_ext+0xf4>
     b5c:	000407b7          	lui	a5,0x40
     b60:	fec42703          	lw	a4,-20(s0)
     b64:	00e7e7b3          	or	a5,a5,a4
     b68:	fef42623          	sw	a5,-20(s0)
     b6c:	fcc42703          	lw	a4,-52(s0)
     b70:	00100793          	li	a5,1
     b74:	00f71663          	bne	a4,a5,b80 <uart_init_ext+0x114>
     b78:	00000793          	li	a5,0
     b7c:	0080006f          	j	b84 <uart_init_ext+0x118>
     b80:	000807b7          	lui	a5,0x80
     b84:	fec42703          	lw	a4,-20(s0)
     b88:	00e7e7b3          	or	a5,a5,a4
     b8c:	fef42623          	sw	a5,-20(s0)
     b90:	fc842783          	lw	a5,-56(s0)
     b94:	00079663          	bnez	a5,ba0 <uart_init_ext+0x134>
     b98:	00000793          	li	a5,0
     b9c:	0080006f          	j	ba4 <uart_init_ext+0x138>
     ba0:	002007b7          	lui	a5,0x200
     ba4:	fec42703          	lw	a4,-20(s0)
     ba8:	00e7e7b3          	or	a5,a5,a4
     bac:	fef42623          	sw	a5,-20(s0)
     bb0:	fc442783          	lw	a5,-60(s0)
     bb4:	00079663          	bnez	a5,bc0 <uart_init_ext+0x154>
     bb8:	00000793          	li	a5,0
     bbc:	0080006f          	j	bc4 <uart_init_ext+0x158>
     bc0:	001007b7          	lui	a5,0x100
     bc4:	fec42703          	lw	a4,-20(s0)
     bc8:	00e7e7b3          	or	a5,a5,a4
     bcc:	fef42623          	sw	a5,-20(s0)
     bd0:	6e41a783          	lw	a5,1764(gp) # 547c <UART_CONTROL>
     bd4:	fef42423          	sw	a5,-24(s0)
     bd8:	fe842783          	lw	a5,-24(s0)
     bdc:	fec42703          	lw	a4,-20(s0)
     be0:	00e7a023          	sw	a4,0(a5) # 100000 <_memory_end+0xe0000>
     be4:	00000013          	nop
     be8:	03c12083          	lw	ra,60(sp)
     bec:	03812403          	lw	s0,56(sp)
     bf0:	04010113          	addi	sp,sp,64
     bf4:	00008067          	ret

00000bf8 <uart_get_char>:
     bf8:	fe010113          	addi	sp,sp,-32
     bfc:	00812e23          	sw	s0,28(sp)
     c00:	02010413          	addi	s0,sp,32
     c04:	6f01a783          	lw	a5,1776(gp) # 5488 <UART_RX>
     c08:	fef42423          	sw	a5,-24(s0)
     c0c:	fe842783          	lw	a5,-24(s0)
     c10:	0007a783          	lw	a5,0(a5)
     c14:	fef42623          	sw	a5,-20(s0)
     c18:	fec42783          	lw	a5,-20(s0)
     c1c:	fe07d4e3          	bgez	a5,c04 <uart_get_char+0xc>
     c20:	fec42783          	lw	a5,-20(s0)
     c24:	0ff7f793          	zext.b	a5,a5
     c28:	00078513          	mv	a0,a5
     c2c:	01c12403          	lw	s0,28(sp)
     c30:	02010113          	addi	sp,sp,32
     c34:	00008067          	ret

00000c38 <uart_put_char>:
     c38:	fd010113          	addi	sp,sp,-48
     c3c:	02812623          	sw	s0,44(sp)
     c40:	03010413          	addi	s0,sp,48
     c44:	00050793          	mv	a5,a0
     c48:	fcf40fa3          	sb	a5,-33(s0)
     c4c:	6ec1a783          	lw	a5,1772(gp) # 5484 <UART_TX>
     c50:	fef42423          	sw	a5,-24(s0)
     c54:	fe842783          	lw	a5,-24(s0)
     c58:	0007a783          	lw	a5,0(a5)
     c5c:	fef42623          	sw	a5,-20(s0)
     c60:	fec42783          	lw	a5,-20(s0)
     c64:	fe07c4e3          	bltz	a5,c4c <uart_put_char+0x14>
     c68:	fdf44783          	lbu	a5,-33(s0)
     c6c:	fef42623          	sw	a5,-20(s0)
     c70:	6ec1a783          	lw	a5,1772(gp) # 5484 <UART_TX>
     c74:	fef42223          	sw	a5,-28(s0)
     c78:	fe442783          	lw	a5,-28(s0)
     c7c:	fec42703          	lw	a4,-20(s0)
     c80:	00e7a023          	sw	a4,0(a5)
     c84:	fdf44783          	lbu	a5,-33(s0)
     c88:	00078513          	mv	a0,a5
     c8c:	02c12403          	lw	s0,44(sp)
     c90:	03010113          	addi	sp,sp,48
     c94:	00008067          	ret

00000c98 <uart_put_string>:
     c98:	fc010113          	addi	sp,sp,-64
     c9c:	02812e23          	sw	s0,60(sp)
     ca0:	04010413          	addi	s0,sp,64
     ca4:	fca42623          	sw	a0,-52(s0)
     ca8:	fe042623          	sw	zero,-20(s0)
     cac:	0400006f          	j	cec <uart_put_string+0x54>
     cb0:	6ec1a783          	lw	a5,1772(gp) # 5484 <UART_TX>
     cb4:	fef42023          	sw	a5,-32(s0)
     cb8:	fe042783          	lw	a5,-32(s0)
     cbc:	0007a783          	lw	a5,0(a5)
     cc0:	fef42223          	sw	a5,-28(s0)
     cc4:	fe442783          	lw	a5,-28(s0)
     cc8:	fe07c4e3          	bltz	a5,cb0 <uart_put_string+0x18>
     ccc:	6ec1a783          	lw	a5,1772(gp) # 5484 <UART_TX>
     cd0:	fcf42e23          	sw	a5,-36(s0)
     cd4:	fdc42783          	lw	a5,-36(s0)
     cd8:	feb44703          	lbu	a4,-21(s0)
     cdc:	00e7a023          	sw	a4,0(a5)
     ce0:	fec42783          	lw	a5,-20(s0)
     ce4:	00178793          	addi	a5,a5,1
     ce8:	fef42623          	sw	a5,-20(s0)
     cec:	fcc42783          	lw	a5,-52(s0)
     cf0:	00178713          	addi	a4,a5,1
     cf4:	fce42623          	sw	a4,-52(s0)
     cf8:	0007c783          	lbu	a5,0(a5)
     cfc:	fef405a3          	sb	a5,-21(s0)
     d00:	feb44783          	lbu	a5,-21(s0)
     d04:	fa0796e3          	bnez	a5,cb0 <uart_put_string+0x18>
     d08:	fec42783          	lw	a5,-20(s0)
     d0c:	00078513          	mv	a0,a5
     d10:	03c12403          	lw	s0,60(sp)
     d14:	04010113          	addi	sp,sp,64
     d18:	00008067          	ret

00000d1c <uart_put_int>:
     d1c:	fc010113          	addi	sp,sp,-64
     d20:	02112e23          	sw	ra,60(sp)
     d24:	02812c23          	sw	s0,56(sp)
     d28:	04010413          	addi	s0,sp,64
     d2c:	fca42623          	sw	a0,-52(s0)
     d30:	fcc42703          	lw	a4,-52(s0)
     d34:	00a00793          	li	a5,10
     d38:	02f757b3          	divu	a5,a4,a5
     d3c:	fef42623          	sw	a5,-20(s0)
     d40:	fec42783          	lw	a5,-20(s0)
     d44:	00078863          	beqz	a5,d54 <uart_put_int+0x38>
     d48:	fec42783          	lw	a5,-20(s0)
     d4c:	00078513          	mv	a0,a5
     d50:	fcdff0ef          	jal	d1c <uart_put_int>
     d54:	fcc42703          	lw	a4,-52(s0)
     d58:	00a00793          	li	a5,10
     d5c:	02f777b3          	remu	a5,a4,a5
     d60:	0ff7f793          	zext.b	a5,a5
     d64:	03078793          	addi	a5,a5,48
     d68:	fef405a3          	sb	a5,-21(s0)
     d6c:	6ec1a783          	lw	a5,1772(gp) # 5484 <UART_TX>
     d70:	fcf42a23          	sw	a5,-44(s0)
     d74:	fd442783          	lw	a5,-44(s0)
     d78:	0007a783          	lw	a5,0(a5)
     d7c:	fcf42c23          	sw	a5,-40(s0)
     d80:	fd842783          	lw	a5,-40(s0)
     d84:	fe07c4e3          	bltz	a5,d6c <uart_put_int+0x50>
     d88:	6ec1a783          	lw	a5,1772(gp) # 5484 <UART_TX>
     d8c:	fcf42823          	sw	a5,-48(s0)
     d90:	fd042783          	lw	a5,-48(s0)
     d94:	feb44703          	lbu	a4,-21(s0)
     d98:	00e7a023          	sw	a4,0(a5)
     d9c:	00000013          	nop
     da0:	03c12083          	lw	ra,60(sp)
     da4:	03812403          	lw	s0,56(sp)
     da8:	04010113          	addi	sp,sp,64
     dac:	00008067          	ret

00000db0 <uart_put_hex>:
     db0:	fc010113          	addi	sp,sp,-64
     db4:	02112e23          	sw	ra,60(sp)
     db8:	02812c23          	sw	s0,56(sp)
     dbc:	04010413          	addi	s0,sp,64
     dc0:	fca42623          	sw	a0,-52(s0)
     dc4:	fcc42783          	lw	a5,-52(s0)
     dc8:	0047d793          	srli	a5,a5,0x4
     dcc:	fef42423          	sw	a5,-24(s0)
     dd0:	fe842783          	lw	a5,-24(s0)
     dd4:	00078863          	beqz	a5,de4 <uart_put_hex+0x34>
     dd8:	fe842783          	lw	a5,-24(s0)
     ddc:	00078513          	mv	a0,a5
     de0:	fd1ff0ef          	jal	db0 <uart_put_hex>
     de4:	fcc42783          	lw	a5,-52(s0)
     de8:	00f7f793          	andi	a5,a5,15
     dec:	fef42423          	sw	a5,-24(s0)
     df0:	fe842703          	lw	a4,-24(s0)
     df4:	00900793          	li	a5,9
     df8:	00e7cc63          	blt	a5,a4,e10 <uart_put_hex+0x60>
     dfc:	fe842783          	lw	a5,-24(s0)
     e00:	0ff7f793          	zext.b	a5,a5
     e04:	03078793          	addi	a5,a5,48
     e08:	fef407a3          	sb	a5,-17(s0)
     e0c:	0140006f          	j	e20 <uart_put_hex+0x70>
     e10:	fe842783          	lw	a5,-24(s0)
     e14:	0ff7f793          	zext.b	a5,a5
     e18:	03778793          	addi	a5,a5,55
     e1c:	fef407a3          	sb	a5,-17(s0)
     e20:	6ec1a783          	lw	a5,1772(gp) # 5484 <UART_TX>
     e24:	fef42023          	sw	a5,-32(s0)
     e28:	fe042783          	lw	a5,-32(s0)
     e2c:	0007a783          	lw	a5,0(a5)
     e30:	fef42223          	sw	a5,-28(s0)
     e34:	fe442783          	lw	a5,-28(s0)
     e38:	fe07c4e3          	bltz	a5,e20 <uart_put_hex+0x70>
     e3c:	6ec1a783          	lw	a5,1772(gp) # 5484 <UART_TX>
     e40:	fcf42e23          	sw	a5,-36(s0)
     e44:	fdc42783          	lw	a5,-36(s0)
     e48:	fef44703          	lbu	a4,-17(s0)
     e4c:	00e7a023          	sw	a4,0(a5)
     e50:	00000013          	nop
     e54:	03c12083          	lw	ra,60(sp)
     e58:	03812403          	lw	s0,56(sp)
     e5c:	04010113          	addi	sp,sp,64
     e60:	00008067          	ret

00000e64 <uart_cler_tx_irq>:
     e64:	fe010113          	addi	sp,sp,-32
     e68:	00812e23          	sw	s0,28(sp)
     e6c:	02010413          	addi	s0,sp,32
     e70:	6e81a783          	lw	a5,1768(gp) # 5480 <UART_STATUS>
     e74:	fef42423          	sw	a5,-24(s0)
     e78:	fe842783          	lw	a5,-24(s0)
     e7c:	0007a783          	lw	a5,0(a5)
     e80:	fef42623          	sw	a5,-20(s0)
     e84:	fec42783          	lw	a5,-20(s0)
     e88:	ffe7f793          	andi	a5,a5,-2
     e8c:	fef42623          	sw	a5,-20(s0)
     e90:	6e81a783          	lw	a5,1768(gp) # 5480 <UART_STATUS>
     e94:	fef42223          	sw	a5,-28(s0)
     e98:	fe442783          	lw	a5,-28(s0)
     e9c:	fec42703          	lw	a4,-20(s0)
     ea0:	00e7a023          	sw	a4,0(a5)
     ea4:	00000013          	nop
     ea8:	01c12403          	lw	s0,28(sp)
     eac:	02010113          	addi	sp,sp,32
     eb0:	00008067          	ret

00000eb4 <uart_cler_rx_irq>:
     eb4:	fe010113          	addi	sp,sp,-32
     eb8:	00812e23          	sw	s0,28(sp)
     ebc:	02010413          	addi	s0,sp,32
     ec0:	6e81a783          	lw	a5,1768(gp) # 5480 <UART_STATUS>
     ec4:	fef42423          	sw	a5,-24(s0)
     ec8:	fe842783          	lw	a5,-24(s0)
     ecc:	0007a783          	lw	a5,0(a5)
     ed0:	fef42623          	sw	a5,-20(s0)
     ed4:	fec42783          	lw	a5,-20(s0)
     ed8:	ffd7f793          	andi	a5,a5,-3
     edc:	fef42623          	sw	a5,-20(s0)
     ee0:	6e81a783          	lw	a5,1768(gp) # 5480 <UART_STATUS>
     ee4:	fef42223          	sw	a5,-28(s0)
     ee8:	fe442783          	lw	a5,-28(s0)
     eec:	fec42703          	lw	a4,-20(s0)
     ef0:	00e7a023          	sw	a4,0(a5)
     ef4:	00000013          	nop
     ef8:	01c12403          	lw	s0,28(sp)
     efc:	02010113          	addi	sp,sp,32
     f00:	00008067          	ret

00000f04 <uart_get_clk_freq>:
     f04:	fe010113          	addi	sp,sp,-32
     f08:	00812e23          	sw	s0,28(sp)
     f0c:	02010413          	addi	s0,sp,32
     f10:	6f41a783          	lw	a5,1780(gp) # 548c <UART_CLK_FREQ>
     f14:	fef42423          	sw	a5,-24(s0)
     f18:	fe842783          	lw	a5,-24(s0)
     f1c:	0007a783          	lw	a5,0(a5)
     f20:	fef42623          	sw	a5,-20(s0)
     f24:	fec42783          	lw	a5,-20(s0)
     f28:	00078513          	mv	a0,a5
     f2c:	01c12403          	lw	s0,28(sp)
     f30:	02010113          	addi	sp,sp,32
     f34:	00008067          	ret

00000f38 <uart_set_addr>:
     f38:	fe010113          	addi	sp,sp,-32
     f3c:	00812e23          	sw	s0,28(sp)
     f40:	02010413          	addi	s0,sp,32
     f44:	fea42623          	sw	a0,-20(s0)
     f48:	fec42703          	lw	a4,-20(s0)
     f4c:	6ce1ac23          	sw	a4,1752(gp) # 5470 <UART_ADDR_BASE>
     f50:	fec42703          	lw	a4,-20(s0)
     f54:	6ce1ae23          	sw	a4,1756(gp) # 5474 <UART_VERSION>
     f58:	fec42783          	lw	a5,-20(s0)
     f5c:	00478713          	addi	a4,a5,4
     f60:	6ee1a023          	sw	a4,1760(gp) # 5478 <UART_NAME>
     f64:	fec42783          	lw	a5,-20(s0)
     f68:	01078713          	addi	a4,a5,16
     f6c:	6ee1a223          	sw	a4,1764(gp) # 547c <UART_CONTROL>
     f70:	fec42783          	lw	a5,-20(s0)
     f74:	01478713          	addi	a4,a5,20
     f78:	6ee1a423          	sw	a4,1768(gp) # 5480 <UART_STATUS>
     f7c:	fec42783          	lw	a5,-20(s0)
     f80:	01878713          	addi	a4,a5,24
     f84:	6ee1a623          	sw	a4,1772(gp) # 5484 <UART_TX>
     f88:	fec42783          	lw	a5,-20(s0)
     f8c:	01c78713          	addi	a4,a5,28
     f90:	6ee1a823          	sw	a4,1776(gp) # 5488 <UART_RX>
     f94:	fec42783          	lw	a5,-20(s0)
     f98:	02078713          	addi	a4,a5,32
     f9c:	6ee1aa23          	sw	a4,1780(gp) # 548c <UART_CLK_FREQ>
     fa0:	00000013          	nop
     fa4:	01c12403          	lw	s0,28(sp)
     fa8:	02010113          	addi	sp,sp,32
     fac:	00008067          	ret

00000fb0 <uart_get_addr>:
     fb0:	ff010113          	addi	sp,sp,-16
     fb4:	00812623          	sw	s0,12(sp)
     fb8:	01010413          	addi	s0,sp,16
     fbc:	6d81a783          	lw	a5,1752(gp) # 5470 <UART_ADDR_BASE>
     fc0:	00078513          	mv	a0,a5
     fc4:	00c12403          	lw	s0,12(sp)
     fc8:	01010113          	addi	sp,sp,16
     fcc:	00008067          	ret

00000fd0 <i2c_read_d7r8>:
     fd0:	fc010113          	addi	sp,sp,-64
     fd4:	02112e23          	sw	ra,60(sp)
     fd8:	02812c23          	sw	s0,56(sp)
     fdc:	04010413          	addi	s0,sp,64
     fe0:	00050793          	mv	a5,a0
     fe4:	00058713          	mv	a4,a1
     fe8:	fcc42423          	sw	a2,-56(s0)
     fec:	fcf407a3          	sb	a5,-49(s0)
     ff0:	00070793          	mv	a5,a4
     ff4:	fcf40723          	sb	a5,-50(s0)
     ff8:	fc842783          	lw	a5,-56(s0)
     ffc:	00079663          	bnez	a5,1008 <i2c_read_d7r8+0x38>
    1000:	00000793          	li	a5,0
    1004:	1a40006f          	j	11a8 <i2c_read_d7r8+0x1d8>
    1008:	fcf44783          	lbu	a5,-49(s0)
    100c:	00179793          	slli	a5,a5,0x1
    1010:	0ff7f793          	zext.b	a5,a5
    1014:	3007e793          	ori	a5,a5,768
    1018:	fef42223          	sw	a5,-28(s0)
    101c:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1020:	00078713          	mv	a4,a5
    1024:	fe442783          	lw	a5,-28(s0)
    1028:	00f72023          	sw	a5,0(a4)
    102c:	fce44703          	lbu	a4,-50(s0)
    1030:	000017b7          	lui	a5,0x1
    1034:	20078793          	addi	a5,a5,512 # 1200 <i2c_readN_d7r8+0x44>
    1038:	00f767b3          	or	a5,a4,a5
    103c:	fef42223          	sw	a5,-28(s0)
    1040:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1044:	00078713          	mv	a4,a5
    1048:	fe442783          	lw	a5,-28(s0)
    104c:	00f72023          	sw	a5,0(a4)
    1050:	fcf44783          	lbu	a5,-49(s0)
    1054:	00179793          	slli	a5,a5,0x1
    1058:	0ff7f793          	zext.b	a5,a5
    105c:	3017e793          	ori	a5,a5,769
    1060:	fef42223          	sw	a5,-28(s0)
    1064:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1068:	00078713          	mv	a4,a5
    106c:	fe442783          	lw	a5,-28(s0)
    1070:	00f72023          	sw	a5,0(a4)
    1074:	000017b7          	lui	a5,0x1
    1078:	c0078793          	addi	a5,a5,-1024 # c00 <uart_get_char+0x8>
    107c:	fef42223          	sw	a5,-28(s0)
    1080:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1084:	00078713          	mv	a4,a5
    1088:	fe442783          	lw	a5,-28(s0)
    108c:	00f72023          	sw	a5,0(a4)
    1090:	00400793          	li	a5,4
    1094:	fef42023          	sw	a5,-32(s0)
    1098:	fe042783          	lw	a5,-32(s0)
    109c:	01879793          	slli	a5,a5,0x18
    10a0:	0017e793          	ori	a5,a5,1
    10a4:	fef42223          	sw	a5,-28(s0)
    10a8:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    10ac:	00078713          	mv	a4,a5
    10b0:	fe442783          	lw	a5,-28(s0)
    10b4:	00f72023          	sw	a5,0(a4)
    10b8:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    10bc:	0007a783          	lw	a5,0(a5)
    10c0:	fcf42e23          	sw	a5,-36(s0)
    10c4:	fdc42783          	lw	a5,-36(s0)
    10c8:	0017f793          	andi	a5,a5,1
    10cc:	fe0796e3          	bnez	a5,10b8 <i2c_read_d7r8+0xe8>
    10d0:	fdc42783          	lw	a5,-36(s0)
    10d4:	0187d793          	srli	a5,a5,0x18
    10d8:	fe042703          	lw	a4,-32(s0)
    10dc:	00f70663          	beq	a4,a5,10e8 <i2c_read_d7r8+0x118>
    10e0:	fff00793          	li	a5,-1
    10e4:	0c40006f          	j	11a8 <i2c_read_d7r8+0x1d8>
    10e8:	fe042623          	sw	zero,-20(s0)
    10ec:	fe042423          	sw	zero,-24(s0)
    10f0:	0500006f          	j	1140 <i2c_read_d7r8+0x170>
    10f4:	7241a783          	lw	a5,1828(gp) # 54bc <CSRA_I2C_RX_DATA>
    10f8:	0007a783          	lw	a5,0(a5)
    10fc:	fcf42e23          	sw	a5,-36(s0)
    1100:	fdc42783          	lw	a5,-36(s0)
    1104:	1007f793          	andi	a5,a5,256
    1108:	02079663          	bnez	a5,1134 <i2c_read_d7r8+0x164>
    110c:	fec42783          	lw	a5,-20(s0)
    1110:	00178793          	addi	a5,a5,1
    1114:	fef42623          	sw	a5,-20(s0)
    1118:	fcf44783          	lbu	a5,-49(s0)
    111c:	fce44683          	lbu	a3,-50(s0)
    1120:	fe842703          	lw	a4,-24(s0)
    1124:	00078613          	mv	a2,a5
    1128:	2cc18593          	addi	a1,gp,716 # 5064 <__FUNCTION__.7>
    112c:	17018513          	addi	a0,gp,368 # 4f08 <__global_pointer$+0x170>
    1130:	9ccff0ef          	jal	2fc <my_printf>
    1134:	fe842783          	lw	a5,-24(s0)
    1138:	00178793          	addi	a5,a5,1
    113c:	fef42423          	sw	a5,-24(s0)
    1140:	fe042783          	lw	a5,-32(s0)
    1144:	fff78713          	addi	a4,a5,-1
    1148:	fe842783          	lw	a5,-24(s0)
    114c:	fae7e4e3          	bltu	a5,a4,10f4 <i2c_read_d7r8+0x124>
    1150:	7241a783          	lw	a5,1828(gp) # 54bc <CSRA_I2C_RX_DATA>
    1154:	0007a783          	lw	a5,0(a5)
    1158:	fcf42e23          	sw	a5,-36(s0)
    115c:	fdc42783          	lw	a5,-36(s0)
    1160:	1007f793          	andi	a5,a5,256
    1164:	02078063          	beqz	a5,1184 <i2c_read_d7r8+0x1b4>
    1168:	fec42783          	lw	a5,-20(s0)
    116c:	00178793          	addi	a5,a5,1
    1170:	fef42623          	sw	a5,-20(s0)
    1174:	fe842603          	lw	a2,-24(s0)
    1178:	2cc18593          	addi	a1,gp,716 # 5064 <__FUNCTION__.7>
    117c:	19418513          	addi	a0,gp,404 # 4f2c <__global_pointer$+0x194>
    1180:	97cff0ef          	jal	2fc <my_printf>
    1184:	fdc42783          	lw	a5,-36(s0)
    1188:	0ff7f713          	zext.b	a4,a5
    118c:	fc842783          	lw	a5,-56(s0)
    1190:	00e78023          	sb	a4,0(a5)
    1194:	fec42783          	lw	a5,-20(s0)
    1198:	00078663          	beqz	a5,11a4 <i2c_read_d7r8+0x1d4>
    119c:	fff00793          	li	a5,-1
    11a0:	0080006f          	j	11a8 <i2c_read_d7r8+0x1d8>
    11a4:	00000793          	li	a5,0
    11a8:	00078513          	mv	a0,a5
    11ac:	03c12083          	lw	ra,60(sp)
    11b0:	03812403          	lw	s0,56(sp)
    11b4:	04010113          	addi	sp,sp,64
    11b8:	00008067          	ret

000011bc <i2c_readN_d7r8>:
    11bc:	fc010113          	addi	sp,sp,-64
    11c0:	02112e23          	sw	ra,60(sp)
    11c4:	02812c23          	sw	s0,56(sp)
    11c8:	04010413          	addi	s0,sp,64
    11cc:	00050793          	mv	a5,a0
    11d0:	fcc42423          	sw	a2,-56(s0)
    11d4:	00068713          	mv	a4,a3
    11d8:	fcf407a3          	sb	a5,-49(s0)
    11dc:	00058793          	mv	a5,a1
    11e0:	fcf40723          	sb	a5,-50(s0)
    11e4:	00070793          	mv	a5,a4
    11e8:	fcf406a3          	sb	a5,-51(s0)
    11ec:	fc842783          	lw	a5,-56(s0)
    11f0:	00079663          	bnez	a5,11fc <i2c_readN_d7r8+0x40>
    11f4:	00000793          	li	a5,0
    11f8:	2680006f          	j	1460 <i2c_readN_d7r8+0x2a4>
    11fc:	fcf44783          	lbu	a5,-49(s0)
    1200:	00179793          	slli	a5,a5,0x1
    1204:	0ff7f793          	zext.b	a5,a5
    1208:	3007e793          	ori	a5,a5,768
    120c:	fcf42e23          	sw	a5,-36(s0)
    1210:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1214:	00078713          	mv	a4,a5
    1218:	fdc42783          	lw	a5,-36(s0)
    121c:	00f72023          	sw	a5,0(a4)
    1220:	fce44703          	lbu	a4,-50(s0)
    1224:	000017b7          	lui	a5,0x1
    1228:	20078793          	addi	a5,a5,512 # 1200 <i2c_readN_d7r8+0x44>
    122c:	00f767b3          	or	a5,a4,a5
    1230:	fcf42e23          	sw	a5,-36(s0)
    1234:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1238:	00078713          	mv	a4,a5
    123c:	fdc42783          	lw	a5,-36(s0)
    1240:	00f72023          	sw	a5,0(a4)
    1244:	fcf44783          	lbu	a5,-49(s0)
    1248:	00179793          	slli	a5,a5,0x1
    124c:	0ff7f793          	zext.b	a5,a5
    1250:	3017e793          	ori	a5,a5,769
    1254:	fcf42e23          	sw	a5,-36(s0)
    1258:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    125c:	00078713          	mv	a4,a5
    1260:	fdc42783          	lw	a5,-36(s0)
    1264:	00f72023          	sw	a5,0(a4)
    1268:	fe0407a3          	sb	zero,-17(s0)
    126c:	0280006f          	j	1294 <i2c_readN_d7r8+0xd8>
    1270:	40000793          	li	a5,1024
    1274:	fcf42e23          	sw	a5,-36(s0)
    1278:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    127c:	00078713          	mv	a4,a5
    1280:	fdc42783          	lw	a5,-36(s0)
    1284:	00f72023          	sw	a5,0(a4)
    1288:	fef44783          	lbu	a5,-17(s0)
    128c:	00178793          	addi	a5,a5,1
    1290:	fef407a3          	sb	a5,-17(s0)
    1294:	fef44703          	lbu	a4,-17(s0)
    1298:	fcd44783          	lbu	a5,-51(s0)
    129c:	fff78793          	addi	a5,a5,-1
    12a0:	fcf748e3          	blt	a4,a5,1270 <i2c_readN_d7r8+0xb4>
    12a4:	000017b7          	lui	a5,0x1
    12a8:	c0078793          	addi	a5,a5,-1024 # c00 <uart_get_char+0x8>
    12ac:	fcf42e23          	sw	a5,-36(s0)
    12b0:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    12b4:	00078713          	mv	a4,a5
    12b8:	fdc42783          	lw	a5,-36(s0)
    12bc:	00f72023          	sw	a5,0(a4)
    12c0:	fcd44783          	lbu	a5,-51(s0)
    12c4:	00378793          	addi	a5,a5,3
    12c8:	fcf42c23          	sw	a5,-40(s0)
    12cc:	fd842783          	lw	a5,-40(s0)
    12d0:	01879793          	slli	a5,a5,0x18
    12d4:	0017e793          	ori	a5,a5,1
    12d8:	fcf42e23          	sw	a5,-36(s0)
    12dc:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    12e0:	00078713          	mv	a4,a5
    12e4:	fdc42783          	lw	a5,-36(s0)
    12e8:	00f72023          	sw	a5,0(a4)
    12ec:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    12f0:	0007a783          	lw	a5,0(a5)
    12f4:	fcf42a23          	sw	a5,-44(s0)
    12f8:	fd442783          	lw	a5,-44(s0)
    12fc:	0017f793          	andi	a5,a5,1
    1300:	fe0796e3          	bnez	a5,12ec <i2c_readN_d7r8+0x130>
    1304:	fd442783          	lw	a5,-44(s0)
    1308:	0187d793          	srli	a5,a5,0x18
    130c:	fd842703          	lw	a4,-40(s0)
    1310:	00f70663          	beq	a4,a5,131c <i2c_readN_d7r8+0x160>
    1314:	fff00793          	li	a5,-1
    1318:	1480006f          	j	1460 <i2c_readN_d7r8+0x2a4>
    131c:	fe042423          	sw	zero,-24(s0)
    1320:	fe042223          	sw	zero,-28(s0)
    1324:	0500006f          	j	1374 <i2c_readN_d7r8+0x1b8>
    1328:	7241a783          	lw	a5,1828(gp) # 54bc <CSRA_I2C_RX_DATA>
    132c:	0007a783          	lw	a5,0(a5)
    1330:	fcf42a23          	sw	a5,-44(s0)
    1334:	fd442783          	lw	a5,-44(s0)
    1338:	1007f793          	andi	a5,a5,256
    133c:	02079663          	bnez	a5,1368 <i2c_readN_d7r8+0x1ac>
    1340:	fe842783          	lw	a5,-24(s0)
    1344:	00178793          	addi	a5,a5,1
    1348:	fef42423          	sw	a5,-24(s0)
    134c:	fcf44783          	lbu	a5,-49(s0)
    1350:	fce44683          	lbu	a3,-50(s0)
    1354:	fe442703          	lw	a4,-28(s0)
    1358:	00078613          	mv	a2,a5
    135c:	2dc18593          	addi	a1,gp,732 # 5074 <__FUNCTION__.6>
    1360:	17018513          	addi	a0,gp,368 # 4f08 <__global_pointer$+0x170>
    1364:	f99fe0ef          	jal	2fc <my_printf>
    1368:	fe442783          	lw	a5,-28(s0)
    136c:	00178793          	addi	a5,a5,1
    1370:	fef42223          	sw	a5,-28(s0)
    1374:	fe442703          	lw	a4,-28(s0)
    1378:	00200793          	li	a5,2
    137c:	fae7d6e3          	bge	a5,a4,1328 <i2c_readN_d7r8+0x16c>
    1380:	fe0401a3          	sb	zero,-29(s0)
    1384:	fe0401a3          	sb	zero,-29(s0)
    1388:	0680006f          	j	13f0 <i2c_readN_d7r8+0x234>
    138c:	7241a783          	lw	a5,1828(gp) # 54bc <CSRA_I2C_RX_DATA>
    1390:	0007a783          	lw	a5,0(a5)
    1394:	fcf42a23          	sw	a5,-44(s0)
    1398:	fd442783          	lw	a5,-44(s0)
    139c:	1007f793          	andi	a5,a5,256
    13a0:	02079663          	bnez	a5,13cc <i2c_readN_d7r8+0x210>
    13a4:	fe842783          	lw	a5,-24(s0)
    13a8:	00178793          	addi	a5,a5,1
    13ac:	fef42423          	sw	a5,-24(s0)
    13b0:	fe344703          	lbu	a4,-29(s0)
    13b4:	fe442783          	lw	a5,-28(s0)
    13b8:	00f707b3          	add	a5,a4,a5
    13bc:	00078613          	mv	a2,a5
    13c0:	2dc18593          	addi	a1,gp,732 # 5074 <__FUNCTION__.6>
    13c4:	1c818513          	addi	a0,gp,456 # 4f60 <__global_pointer$+0x1c8>
    13c8:	f35fe0ef          	jal	2fc <my_printf>
    13cc:	fe344783          	lbu	a5,-29(s0)
    13d0:	fc842703          	lw	a4,-56(s0)
    13d4:	00f707b3          	add	a5,a4,a5
    13d8:	fd442703          	lw	a4,-44(s0)
    13dc:	0ff77713          	zext.b	a4,a4
    13e0:	00e78023          	sb	a4,0(a5)
    13e4:	fe344783          	lbu	a5,-29(s0)
    13e8:	00178793          	addi	a5,a5,1
    13ec:	fef401a3          	sb	a5,-29(s0)
    13f0:	fe344703          	lbu	a4,-29(s0)
    13f4:	fcd44783          	lbu	a5,-51(s0)
    13f8:	fff78793          	addi	a5,a5,-1
    13fc:	f8f748e3          	blt	a4,a5,138c <i2c_readN_d7r8+0x1d0>
    1400:	7241a783          	lw	a5,1828(gp) # 54bc <CSRA_I2C_RX_DATA>
    1404:	0007a783          	lw	a5,0(a5)
    1408:	fcf42a23          	sw	a5,-44(s0)
    140c:	fd442783          	lw	a5,-44(s0)
    1410:	1007f793          	andi	a5,a5,256
    1414:	02078063          	beqz	a5,1434 <i2c_readN_d7r8+0x278>
    1418:	fe842783          	lw	a5,-24(s0)
    141c:	00178793          	addi	a5,a5,1
    1420:	fef42423          	sw	a5,-24(s0)
    1424:	fe442603          	lw	a2,-28(s0)
    1428:	2dc18593          	addi	a1,gp,732 # 5074 <__FUNCTION__.6>
    142c:	19418513          	addi	a0,gp,404 # 4f2c <__global_pointer$+0x194>
    1430:	ecdfe0ef          	jal	2fc <my_printf>
    1434:	fe344783          	lbu	a5,-29(s0)
    1438:	fc842703          	lw	a4,-56(s0)
    143c:	00f707b3          	add	a5,a4,a5
    1440:	fd442703          	lw	a4,-44(s0)
    1444:	0ff77713          	zext.b	a4,a4
    1448:	00e78023          	sb	a4,0(a5)
    144c:	fe842783          	lw	a5,-24(s0)
    1450:	00078663          	beqz	a5,145c <i2c_readN_d7r8+0x2a0>
    1454:	fff00793          	li	a5,-1
    1458:	0080006f          	j	1460 <i2c_readN_d7r8+0x2a4>
    145c:	00000793          	li	a5,0
    1460:	00078513          	mv	a0,a5
    1464:	03c12083          	lw	ra,60(sp)
    1468:	03812403          	lw	s0,56(sp)
    146c:	04010113          	addi	sp,sp,64
    1470:	00008067          	ret

00001474 <i2c_write_d7r8>:
    1474:	fc010113          	addi	sp,sp,-64
    1478:	02112e23          	sw	ra,60(sp)
    147c:	02812c23          	sw	s0,56(sp)
    1480:	04010413          	addi	s0,sp,64
    1484:	00050793          	mv	a5,a0
    1488:	00058693          	mv	a3,a1
    148c:	00060713          	mv	a4,a2
    1490:	fcf407a3          	sb	a5,-49(s0)
    1494:	00068793          	mv	a5,a3
    1498:	fcf40723          	sb	a5,-50(s0)
    149c:	00070793          	mv	a5,a4
    14a0:	fcf406a3          	sb	a5,-51(s0)
    14a4:	fcf44783          	lbu	a5,-49(s0)
    14a8:	00179793          	slli	a5,a5,0x1
    14ac:	0ff7f793          	zext.b	a5,a5
    14b0:	3007e793          	ori	a5,a5,768
    14b4:	fef42223          	sw	a5,-28(s0)
    14b8:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    14bc:	00078713          	mv	a4,a5
    14c0:	fe442783          	lw	a5,-28(s0)
    14c4:	00f72023          	sw	a5,0(a4)
    14c8:	fce44783          	lbu	a5,-50(s0)
    14cc:	2007e793          	ori	a5,a5,512
    14d0:	fef42223          	sw	a5,-28(s0)
    14d4:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    14d8:	00078713          	mv	a4,a5
    14dc:	fe442783          	lw	a5,-28(s0)
    14e0:	00f72023          	sw	a5,0(a4)
    14e4:	fcd44703          	lbu	a4,-51(s0)
    14e8:	000017b7          	lui	a5,0x1
    14ec:	a0078793          	addi	a5,a5,-1536 # a00 <uart_init+0xd8>
    14f0:	00f767b3          	or	a5,a4,a5
    14f4:	fef42223          	sw	a5,-28(s0)
    14f8:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    14fc:	00078713          	mv	a4,a5
    1500:	fe442783          	lw	a5,-28(s0)
    1504:	00f72023          	sw	a5,0(a4)
    1508:	00300793          	li	a5,3
    150c:	fef42023          	sw	a5,-32(s0)
    1510:	fe042783          	lw	a5,-32(s0)
    1514:	01879793          	slli	a5,a5,0x18
    1518:	0017e793          	ori	a5,a5,1
    151c:	fef42223          	sw	a5,-28(s0)
    1520:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    1524:	00078713          	mv	a4,a5
    1528:	fe442783          	lw	a5,-28(s0)
    152c:	00f72023          	sw	a5,0(a4)
    1530:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    1534:	0007a783          	lw	a5,0(a5)
    1538:	fcf42e23          	sw	a5,-36(s0)
    153c:	fdc42783          	lw	a5,-36(s0)
    1540:	0017f793          	andi	a5,a5,1
    1544:	fe0796e3          	bnez	a5,1530 <i2c_write_d7r8+0xbc>
    1548:	fdc42783          	lw	a5,-36(s0)
    154c:	0187d793          	srli	a5,a5,0x18
    1550:	fe042703          	lw	a4,-32(s0)
    1554:	00f70663          	beq	a4,a5,1560 <i2c_write_d7r8+0xec>
    1558:	fff00793          	li	a5,-1
    155c:	07c0006f          	j	15d8 <i2c_write_d7r8+0x164>
    1560:	fe042623          	sw	zero,-20(s0)
    1564:	fe042423          	sw	zero,-24(s0)
    1568:	0500006f          	j	15b8 <i2c_write_d7r8+0x144>
    156c:	7241a783          	lw	a5,1828(gp) # 54bc <CSRA_I2C_RX_DATA>
    1570:	0007a783          	lw	a5,0(a5)
    1574:	fcf42e23          	sw	a5,-36(s0)
    1578:	fdc42783          	lw	a5,-36(s0)
    157c:	1007f793          	andi	a5,a5,256
    1580:	02079663          	bnez	a5,15ac <i2c_write_d7r8+0x138>
    1584:	fec42783          	lw	a5,-20(s0)
    1588:	00178793          	addi	a5,a5,1
    158c:	fef42623          	sw	a5,-20(s0)
    1590:	fcf44783          	lbu	a5,-49(s0)
    1594:	fce44683          	lbu	a3,-50(s0)
    1598:	fe842703          	lw	a4,-24(s0)
    159c:	00078613          	mv	a2,a5
    15a0:	2ec18593          	addi	a1,gp,748 # 5084 <__FUNCTION__.5>
    15a4:	17018513          	addi	a0,gp,368 # 4f08 <__global_pointer$+0x170>
    15a8:	d55fe0ef          	jal	2fc <my_printf>
    15ac:	fe842783          	lw	a5,-24(s0)
    15b0:	00178793          	addi	a5,a5,1
    15b4:	fef42423          	sw	a5,-24(s0)
    15b8:	fe842783          	lw	a5,-24(s0)
    15bc:	fe042703          	lw	a4,-32(s0)
    15c0:	fae7e6e3          	bltu	a5,a4,156c <i2c_write_d7r8+0xf8>
    15c4:	fec42783          	lw	a5,-20(s0)
    15c8:	00078663          	beqz	a5,15d4 <i2c_write_d7r8+0x160>
    15cc:	fff00793          	li	a5,-1
    15d0:	0080006f          	j	15d8 <i2c_write_d7r8+0x164>
    15d4:	00000793          	li	a5,0
    15d8:	00078513          	mv	a0,a5
    15dc:	03c12083          	lw	ra,60(sp)
    15e0:	03812403          	lw	s0,56(sp)
    15e4:	04010113          	addi	sp,sp,64
    15e8:	00008067          	ret

000015ec <i2c_writeN_d7r8>:
    15ec:	fc010113          	addi	sp,sp,-64
    15f0:	02112e23          	sw	ra,60(sp)
    15f4:	02812c23          	sw	s0,56(sp)
    15f8:	04010413          	addi	s0,sp,64
    15fc:	00050793          	mv	a5,a0
    1600:	fcc42423          	sw	a2,-56(s0)
    1604:	00068713          	mv	a4,a3
    1608:	fcf407a3          	sb	a5,-49(s0)
    160c:	00058793          	mv	a5,a1
    1610:	fcf40723          	sb	a5,-50(s0)
    1614:	00070793          	mv	a5,a4
    1618:	fcf406a3          	sb	a5,-51(s0)
    161c:	fcf44783          	lbu	a5,-49(s0)
    1620:	00179793          	slli	a5,a5,0x1
    1624:	0ff7f793          	zext.b	a5,a5
    1628:	3007e793          	ori	a5,a5,768
    162c:	fef42023          	sw	a5,-32(s0)
    1630:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1634:	00078713          	mv	a4,a5
    1638:	fe042783          	lw	a5,-32(s0)
    163c:	00f72023          	sw	a5,0(a4)
    1640:	fce44783          	lbu	a5,-50(s0)
    1644:	2007e793          	ori	a5,a5,512
    1648:	fef42023          	sw	a5,-32(s0)
    164c:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1650:	00078713          	mv	a4,a5
    1654:	fe042783          	lw	a5,-32(s0)
    1658:	00f72023          	sw	a5,0(a4)
    165c:	fe0407a3          	sb	zero,-17(s0)
    1660:	0380006f          	j	1698 <i2c_writeN_d7r8+0xac>
    1664:	fef44783          	lbu	a5,-17(s0)
    1668:	fc842703          	lw	a4,-56(s0)
    166c:	00f707b3          	add	a5,a4,a5
    1670:	0007c783          	lbu	a5,0(a5)
    1674:	2007e793          	ori	a5,a5,512
    1678:	fef42023          	sw	a5,-32(s0)
    167c:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1680:	00078713          	mv	a4,a5
    1684:	fe042783          	lw	a5,-32(s0)
    1688:	00f72023          	sw	a5,0(a4)
    168c:	fef44783          	lbu	a5,-17(s0)
    1690:	00178793          	addi	a5,a5,1
    1694:	fef407a3          	sb	a5,-17(s0)
    1698:	fef44703          	lbu	a4,-17(s0)
    169c:	fcd44783          	lbu	a5,-51(s0)
    16a0:	fff78793          	addi	a5,a5,-1
    16a4:	fcf740e3          	blt	a4,a5,1664 <i2c_writeN_d7r8+0x78>
    16a8:	fef44783          	lbu	a5,-17(s0)
    16ac:	fc842703          	lw	a4,-56(s0)
    16b0:	00f707b3          	add	a5,a4,a5
    16b4:	0007c783          	lbu	a5,0(a5)
    16b8:	00078713          	mv	a4,a5
    16bc:	000017b7          	lui	a5,0x1
    16c0:	a0078793          	addi	a5,a5,-1536 # a00 <uart_init+0xd8>
    16c4:	00f767b3          	or	a5,a4,a5
    16c8:	fef42023          	sw	a5,-32(s0)
    16cc:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    16d0:	00078713          	mv	a4,a5
    16d4:	fe042783          	lw	a5,-32(s0)
    16d8:	00f72023          	sw	a5,0(a4)
    16dc:	fcd44783          	lbu	a5,-51(s0)
    16e0:	00278793          	addi	a5,a5,2
    16e4:	fcf42e23          	sw	a5,-36(s0)
    16e8:	fdc42783          	lw	a5,-36(s0)
    16ec:	01879793          	slli	a5,a5,0x18
    16f0:	0017e793          	ori	a5,a5,1
    16f4:	fef42023          	sw	a5,-32(s0)
    16f8:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    16fc:	00078713          	mv	a4,a5
    1700:	fe042783          	lw	a5,-32(s0)
    1704:	00f72023          	sw	a5,0(a4)
    1708:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    170c:	0007a783          	lw	a5,0(a5)
    1710:	fcf42c23          	sw	a5,-40(s0)
    1714:	fd842783          	lw	a5,-40(s0)
    1718:	0017f793          	andi	a5,a5,1
    171c:	fe0796e3          	bnez	a5,1708 <i2c_writeN_d7r8+0x11c>
    1720:	fd842783          	lw	a5,-40(s0)
    1724:	0187d793          	srli	a5,a5,0x18
    1728:	fdc42703          	lw	a4,-36(s0)
    172c:	00f70663          	beq	a4,a5,1738 <i2c_writeN_d7r8+0x14c>
    1730:	fff00793          	li	a5,-1
    1734:	07c0006f          	j	17b0 <i2c_writeN_d7r8+0x1c4>
    1738:	fe042423          	sw	zero,-24(s0)
    173c:	fe042223          	sw	zero,-28(s0)
    1740:	0500006f          	j	1790 <i2c_writeN_d7r8+0x1a4>
    1744:	7241a783          	lw	a5,1828(gp) # 54bc <CSRA_I2C_RX_DATA>
    1748:	0007a783          	lw	a5,0(a5)
    174c:	fcf42c23          	sw	a5,-40(s0)
    1750:	fd842783          	lw	a5,-40(s0)
    1754:	1007f793          	andi	a5,a5,256
    1758:	02079663          	bnez	a5,1784 <i2c_writeN_d7r8+0x198>
    175c:	fe842783          	lw	a5,-24(s0)
    1760:	00178793          	addi	a5,a5,1
    1764:	fef42423          	sw	a5,-24(s0)
    1768:	fcf44783          	lbu	a5,-49(s0)
    176c:	fce44683          	lbu	a3,-50(s0)
    1770:	fe442703          	lw	a4,-28(s0)
    1774:	00078613          	mv	a2,a5
    1778:	2fc18593          	addi	a1,gp,764 # 5094 <__FUNCTION__.4>
    177c:	17018513          	addi	a0,gp,368 # 4f08 <__global_pointer$+0x170>
    1780:	b7dfe0ef          	jal	2fc <my_printf>
    1784:	fe442783          	lw	a5,-28(s0)
    1788:	00178793          	addi	a5,a5,1
    178c:	fef42223          	sw	a5,-28(s0)
    1790:	fe442783          	lw	a5,-28(s0)
    1794:	fdc42703          	lw	a4,-36(s0)
    1798:	fae7e6e3          	bltu	a5,a4,1744 <i2c_writeN_d7r8+0x158>
    179c:	fe842783          	lw	a5,-24(s0)
    17a0:	00078663          	beqz	a5,17ac <i2c_writeN_d7r8+0x1c0>
    17a4:	fff00793          	li	a5,-1
    17a8:	0080006f          	j	17b0 <i2c_writeN_d7r8+0x1c4>
    17ac:	00000793          	li	a5,0
    17b0:	00078513          	mv	a0,a5
    17b4:	03c12083          	lw	ra,60(sp)
    17b8:	03812403          	lw	s0,56(sp)
    17bc:	04010113          	addi	sp,sp,64
    17c0:	00008067          	ret

000017c4 <i2c_read_d7r16>:
    17c4:	fc010113          	addi	sp,sp,-64
    17c8:	02112e23          	sw	ra,60(sp)
    17cc:	02812c23          	sw	s0,56(sp)
    17d0:	04010413          	addi	s0,sp,64
    17d4:	00050793          	mv	a5,a0
    17d8:	00058713          	mv	a4,a1
    17dc:	fcc42423          	sw	a2,-56(s0)
    17e0:	fcf407a3          	sb	a5,-49(s0)
    17e4:	00070793          	mv	a5,a4
    17e8:	fcf41623          	sh	a5,-52(s0)
    17ec:	fc842783          	lw	a5,-56(s0)
    17f0:	00079663          	bnez	a5,17fc <i2c_read_d7r16+0x38>
    17f4:	00000793          	li	a5,0
    17f8:	1d40006f          	j	19cc <i2c_read_d7r16+0x208>
    17fc:	fcf44783          	lbu	a5,-49(s0)
    1800:	00179793          	slli	a5,a5,0x1
    1804:	0ff7f793          	zext.b	a5,a5
    1808:	3007e793          	ori	a5,a5,768
    180c:	fef42223          	sw	a5,-28(s0)
    1810:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1814:	00078713          	mv	a4,a5
    1818:	fe442783          	lw	a5,-28(s0)
    181c:	00f72023          	sw	a5,0(a4)
    1820:	fcc45783          	lhu	a5,-52(s0)
    1824:	0087d793          	srli	a5,a5,0x8
    1828:	01079793          	slli	a5,a5,0x10
    182c:	0107d793          	srli	a5,a5,0x10
    1830:	0ff7f793          	zext.b	a5,a5
    1834:	2007e793          	ori	a5,a5,512
    1838:	fef42223          	sw	a5,-28(s0)
    183c:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1840:	00078713          	mv	a4,a5
    1844:	fe442783          	lw	a5,-28(s0)
    1848:	00f72023          	sw	a5,0(a4)
    184c:	fcc45783          	lhu	a5,-52(s0)
    1850:	0ff7f713          	zext.b	a4,a5
    1854:	000017b7          	lui	a5,0x1
    1858:	20078793          	addi	a5,a5,512 # 1200 <i2c_readN_d7r8+0x44>
    185c:	00f767b3          	or	a5,a4,a5
    1860:	fef42223          	sw	a5,-28(s0)
    1864:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1868:	00078713          	mv	a4,a5
    186c:	fe442783          	lw	a5,-28(s0)
    1870:	00f72023          	sw	a5,0(a4)
    1874:	fcf44783          	lbu	a5,-49(s0)
    1878:	00179793          	slli	a5,a5,0x1
    187c:	0ff7f793          	zext.b	a5,a5
    1880:	3017e793          	ori	a5,a5,769
    1884:	fef42223          	sw	a5,-28(s0)
    1888:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    188c:	00078713          	mv	a4,a5
    1890:	fe442783          	lw	a5,-28(s0)
    1894:	00f72023          	sw	a5,0(a4)
    1898:	000017b7          	lui	a5,0x1
    189c:	c0078793          	addi	a5,a5,-1024 # c00 <uart_get_char+0x8>
    18a0:	fef42223          	sw	a5,-28(s0)
    18a4:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    18a8:	00078713          	mv	a4,a5
    18ac:	fe442783          	lw	a5,-28(s0)
    18b0:	00f72023          	sw	a5,0(a4)
    18b4:	00500793          	li	a5,5
    18b8:	fef42023          	sw	a5,-32(s0)
    18bc:	fe042783          	lw	a5,-32(s0)
    18c0:	01879793          	slli	a5,a5,0x18
    18c4:	0017e793          	ori	a5,a5,1
    18c8:	fef42223          	sw	a5,-28(s0)
    18cc:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    18d0:	00078713          	mv	a4,a5
    18d4:	fe442783          	lw	a5,-28(s0)
    18d8:	00f72023          	sw	a5,0(a4)
    18dc:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    18e0:	0007a783          	lw	a5,0(a5)
    18e4:	fcf42e23          	sw	a5,-36(s0)
    18e8:	fdc42783          	lw	a5,-36(s0)
    18ec:	0017f793          	andi	a5,a5,1
    18f0:	fe0796e3          	bnez	a5,18dc <i2c_read_d7r16+0x118>
    18f4:	fdc42783          	lw	a5,-36(s0)
    18f8:	0187d793          	srli	a5,a5,0x18
    18fc:	fe042703          	lw	a4,-32(s0)
    1900:	00f70663          	beq	a4,a5,190c <i2c_read_d7r16+0x148>
    1904:	fff00793          	li	a5,-1
    1908:	0c40006f          	j	19cc <i2c_read_d7r16+0x208>
    190c:	fe042623          	sw	zero,-20(s0)
    1910:	fe042423          	sw	zero,-24(s0)
    1914:	0500006f          	j	1964 <i2c_read_d7r16+0x1a0>
    1918:	7241a783          	lw	a5,1828(gp) # 54bc <CSRA_I2C_RX_DATA>
    191c:	0007a783          	lw	a5,0(a5)
    1920:	fcf42e23          	sw	a5,-36(s0)
    1924:	fdc42783          	lw	a5,-36(s0)
    1928:	1007f793          	andi	a5,a5,256
    192c:	02079663          	bnez	a5,1958 <i2c_read_d7r16+0x194>
    1930:	fec42783          	lw	a5,-20(s0)
    1934:	00178793          	addi	a5,a5,1
    1938:	fef42623          	sw	a5,-20(s0)
    193c:	fcf44783          	lbu	a5,-49(s0)
    1940:	fcc45683          	lhu	a3,-52(s0)
    1944:	fe842703          	lw	a4,-24(s0)
    1948:	00078613          	mv	a2,a5
    194c:	30c18593          	addi	a1,gp,780 # 50a4 <__FUNCTION__.3>
    1950:	17018513          	addi	a0,gp,368 # 4f08 <__global_pointer$+0x170>
    1954:	9a9fe0ef          	jal	2fc <my_printf>
    1958:	fe842783          	lw	a5,-24(s0)
    195c:	00178793          	addi	a5,a5,1
    1960:	fef42423          	sw	a5,-24(s0)
    1964:	fe042783          	lw	a5,-32(s0)
    1968:	fff78713          	addi	a4,a5,-1
    196c:	fe842783          	lw	a5,-24(s0)
    1970:	fae7e4e3          	bltu	a5,a4,1918 <i2c_read_d7r16+0x154>
    1974:	7241a783          	lw	a5,1828(gp) # 54bc <CSRA_I2C_RX_DATA>
    1978:	0007a783          	lw	a5,0(a5)
    197c:	fcf42e23          	sw	a5,-36(s0)
    1980:	fdc42783          	lw	a5,-36(s0)
    1984:	1007f793          	andi	a5,a5,256
    1988:	02078063          	beqz	a5,19a8 <i2c_read_d7r16+0x1e4>
    198c:	fec42783          	lw	a5,-20(s0)
    1990:	00178793          	addi	a5,a5,1
    1994:	fef42623          	sw	a5,-20(s0)
    1998:	fe842603          	lw	a2,-24(s0)
    199c:	30c18593          	addi	a1,gp,780 # 50a4 <__FUNCTION__.3>
    19a0:	19418513          	addi	a0,gp,404 # 4f2c <__global_pointer$+0x194>
    19a4:	959fe0ef          	jal	2fc <my_printf>
    19a8:	fdc42783          	lw	a5,-36(s0)
    19ac:	0ff7f713          	zext.b	a4,a5
    19b0:	fc842783          	lw	a5,-56(s0)
    19b4:	00e78023          	sb	a4,0(a5)
    19b8:	fec42783          	lw	a5,-20(s0)
    19bc:	00078663          	beqz	a5,19c8 <i2c_read_d7r16+0x204>
    19c0:	fff00793          	li	a5,-1
    19c4:	0080006f          	j	19cc <i2c_read_d7r16+0x208>
    19c8:	00000793          	li	a5,0
    19cc:	00078513          	mv	a0,a5
    19d0:	03c12083          	lw	ra,60(sp)
    19d4:	03812403          	lw	s0,56(sp)
    19d8:	04010113          	addi	sp,sp,64
    19dc:	00008067          	ret

000019e0 <i2c_readN_d7r16>:
    19e0:	fc010113          	addi	sp,sp,-64
    19e4:	02112e23          	sw	ra,60(sp)
    19e8:	02812c23          	sw	s0,56(sp)
    19ec:	04010413          	addi	s0,sp,64
    19f0:	00050793          	mv	a5,a0
    19f4:	fcc42423          	sw	a2,-56(s0)
    19f8:	00068713          	mv	a4,a3
    19fc:	fcf407a3          	sb	a5,-49(s0)
    1a00:	00058793          	mv	a5,a1
    1a04:	fcf41623          	sh	a5,-52(s0)
    1a08:	00070793          	mv	a5,a4
    1a0c:	fcf40723          	sb	a5,-50(s0)
    1a10:	fc842783          	lw	a5,-56(s0)
    1a14:	00079663          	bnez	a5,1a20 <i2c_readN_d7r16+0x40>
    1a18:	00000793          	li	a5,0
    1a1c:	2980006f          	j	1cb4 <i2c_readN_d7r16+0x2d4>
    1a20:	fcf44783          	lbu	a5,-49(s0)
    1a24:	00179793          	slli	a5,a5,0x1
    1a28:	0ff7f793          	zext.b	a5,a5
    1a2c:	3007e793          	ori	a5,a5,768
    1a30:	fcf42e23          	sw	a5,-36(s0)
    1a34:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1a38:	00078713          	mv	a4,a5
    1a3c:	fdc42783          	lw	a5,-36(s0)
    1a40:	00f72023          	sw	a5,0(a4)
    1a44:	fcc45783          	lhu	a5,-52(s0)
    1a48:	0087d793          	srli	a5,a5,0x8
    1a4c:	01079793          	slli	a5,a5,0x10
    1a50:	0107d793          	srli	a5,a5,0x10
    1a54:	0ff7f793          	zext.b	a5,a5
    1a58:	2007e793          	ori	a5,a5,512
    1a5c:	fcf42e23          	sw	a5,-36(s0)
    1a60:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1a64:	00078713          	mv	a4,a5
    1a68:	fdc42783          	lw	a5,-36(s0)
    1a6c:	00f72023          	sw	a5,0(a4)
    1a70:	fcc45783          	lhu	a5,-52(s0)
    1a74:	0ff7f713          	zext.b	a4,a5
    1a78:	000017b7          	lui	a5,0x1
    1a7c:	20078793          	addi	a5,a5,512 # 1200 <i2c_readN_d7r8+0x44>
    1a80:	00f767b3          	or	a5,a4,a5
    1a84:	fcf42e23          	sw	a5,-36(s0)
    1a88:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1a8c:	00078713          	mv	a4,a5
    1a90:	fdc42783          	lw	a5,-36(s0)
    1a94:	00f72023          	sw	a5,0(a4)
    1a98:	fcf44783          	lbu	a5,-49(s0)
    1a9c:	00179793          	slli	a5,a5,0x1
    1aa0:	0ff7f793          	zext.b	a5,a5
    1aa4:	3017e793          	ori	a5,a5,769
    1aa8:	fcf42e23          	sw	a5,-36(s0)
    1aac:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1ab0:	00078713          	mv	a4,a5
    1ab4:	fdc42783          	lw	a5,-36(s0)
    1ab8:	00f72023          	sw	a5,0(a4)
    1abc:	fe0407a3          	sb	zero,-17(s0)
    1ac0:	0280006f          	j	1ae8 <i2c_readN_d7r16+0x108>
    1ac4:	40000793          	li	a5,1024
    1ac8:	fcf42e23          	sw	a5,-36(s0)
    1acc:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1ad0:	00078713          	mv	a4,a5
    1ad4:	fdc42783          	lw	a5,-36(s0)
    1ad8:	00f72023          	sw	a5,0(a4)
    1adc:	fef44783          	lbu	a5,-17(s0)
    1ae0:	00178793          	addi	a5,a5,1
    1ae4:	fef407a3          	sb	a5,-17(s0)
    1ae8:	fef44703          	lbu	a4,-17(s0)
    1aec:	fce44783          	lbu	a5,-50(s0)
    1af0:	fff78793          	addi	a5,a5,-1
    1af4:	fcf748e3          	blt	a4,a5,1ac4 <i2c_readN_d7r16+0xe4>
    1af8:	000017b7          	lui	a5,0x1
    1afc:	c0078793          	addi	a5,a5,-1024 # c00 <uart_get_char+0x8>
    1b00:	fcf42e23          	sw	a5,-36(s0)
    1b04:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1b08:	00078713          	mv	a4,a5
    1b0c:	fdc42783          	lw	a5,-36(s0)
    1b10:	00f72023          	sw	a5,0(a4)
    1b14:	fce44783          	lbu	a5,-50(s0)
    1b18:	00478793          	addi	a5,a5,4
    1b1c:	fcf42c23          	sw	a5,-40(s0)
    1b20:	fd842783          	lw	a5,-40(s0)
    1b24:	01879793          	slli	a5,a5,0x18
    1b28:	0017e793          	ori	a5,a5,1
    1b2c:	fcf42e23          	sw	a5,-36(s0)
    1b30:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    1b34:	00078713          	mv	a4,a5
    1b38:	fdc42783          	lw	a5,-36(s0)
    1b3c:	00f72023          	sw	a5,0(a4)
    1b40:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    1b44:	0007a783          	lw	a5,0(a5)
    1b48:	fcf42a23          	sw	a5,-44(s0)
    1b4c:	fd442783          	lw	a5,-44(s0)
    1b50:	0017f793          	andi	a5,a5,1
    1b54:	fe0796e3          	bnez	a5,1b40 <i2c_readN_d7r16+0x160>
    1b58:	fd442783          	lw	a5,-44(s0)
    1b5c:	0187d793          	srli	a5,a5,0x18
    1b60:	fd842703          	lw	a4,-40(s0)
    1b64:	00f70663          	beq	a4,a5,1b70 <i2c_readN_d7r16+0x190>
    1b68:	fff00793          	li	a5,-1
    1b6c:	1480006f          	j	1cb4 <i2c_readN_d7r16+0x2d4>
    1b70:	fe042423          	sw	zero,-24(s0)
    1b74:	fe042223          	sw	zero,-28(s0)
    1b78:	0500006f          	j	1bc8 <i2c_readN_d7r16+0x1e8>
    1b7c:	7241a783          	lw	a5,1828(gp) # 54bc <CSRA_I2C_RX_DATA>
    1b80:	0007a783          	lw	a5,0(a5)
    1b84:	fcf42a23          	sw	a5,-44(s0)
    1b88:	fd442783          	lw	a5,-44(s0)
    1b8c:	1007f793          	andi	a5,a5,256
    1b90:	02079663          	bnez	a5,1bbc <i2c_readN_d7r16+0x1dc>
    1b94:	fe842783          	lw	a5,-24(s0)
    1b98:	00178793          	addi	a5,a5,1
    1b9c:	fef42423          	sw	a5,-24(s0)
    1ba0:	fcf44783          	lbu	a5,-49(s0)
    1ba4:	fcc45683          	lhu	a3,-52(s0)
    1ba8:	fe442703          	lw	a4,-28(s0)
    1bac:	00078613          	mv	a2,a5
    1bb0:	31c18593          	addi	a1,gp,796 # 50b4 <__FUNCTION__.2>
    1bb4:	17018513          	addi	a0,gp,368 # 4f08 <__global_pointer$+0x170>
    1bb8:	f44fe0ef          	jal	2fc <my_printf>
    1bbc:	fe442783          	lw	a5,-28(s0)
    1bc0:	00178793          	addi	a5,a5,1
    1bc4:	fef42223          	sw	a5,-28(s0)
    1bc8:	fe442703          	lw	a4,-28(s0)
    1bcc:	00300793          	li	a5,3
    1bd0:	fae7d6e3          	bge	a5,a4,1b7c <i2c_readN_d7r16+0x19c>
    1bd4:	fe0401a3          	sb	zero,-29(s0)
    1bd8:	fe0401a3          	sb	zero,-29(s0)
    1bdc:	0680006f          	j	1c44 <i2c_readN_d7r16+0x264>
    1be0:	7241a783          	lw	a5,1828(gp) # 54bc <CSRA_I2C_RX_DATA>
    1be4:	0007a783          	lw	a5,0(a5)
    1be8:	fcf42a23          	sw	a5,-44(s0)
    1bec:	fd442783          	lw	a5,-44(s0)
    1bf0:	1007f793          	andi	a5,a5,256
    1bf4:	02079663          	bnez	a5,1c20 <i2c_readN_d7r16+0x240>
    1bf8:	fe842783          	lw	a5,-24(s0)
    1bfc:	00178793          	addi	a5,a5,1
    1c00:	fef42423          	sw	a5,-24(s0)
    1c04:	fe344703          	lbu	a4,-29(s0)
    1c08:	fe442783          	lw	a5,-28(s0)
    1c0c:	00f707b3          	add	a5,a4,a5
    1c10:	00078613          	mv	a2,a5
    1c14:	31c18593          	addi	a1,gp,796 # 50b4 <__FUNCTION__.2>
    1c18:	1c818513          	addi	a0,gp,456 # 4f60 <__global_pointer$+0x1c8>
    1c1c:	ee0fe0ef          	jal	2fc <my_printf>
    1c20:	fe344783          	lbu	a5,-29(s0)
    1c24:	fc842703          	lw	a4,-56(s0)
    1c28:	00f707b3          	add	a5,a4,a5
    1c2c:	fd442703          	lw	a4,-44(s0)
    1c30:	0ff77713          	zext.b	a4,a4
    1c34:	00e78023          	sb	a4,0(a5)
    1c38:	fe344783          	lbu	a5,-29(s0)
    1c3c:	00178793          	addi	a5,a5,1
    1c40:	fef401a3          	sb	a5,-29(s0)
    1c44:	fe344703          	lbu	a4,-29(s0)
    1c48:	fce44783          	lbu	a5,-50(s0)
    1c4c:	fff78793          	addi	a5,a5,-1
    1c50:	f8f748e3          	blt	a4,a5,1be0 <i2c_readN_d7r16+0x200>
    1c54:	7241a783          	lw	a5,1828(gp) # 54bc <CSRA_I2C_RX_DATA>
    1c58:	0007a783          	lw	a5,0(a5)
    1c5c:	fcf42a23          	sw	a5,-44(s0)
    1c60:	fd442783          	lw	a5,-44(s0)
    1c64:	1007f793          	andi	a5,a5,256
    1c68:	02078063          	beqz	a5,1c88 <i2c_readN_d7r16+0x2a8>
    1c6c:	fe842783          	lw	a5,-24(s0)
    1c70:	00178793          	addi	a5,a5,1
    1c74:	fef42423          	sw	a5,-24(s0)
    1c78:	fe442603          	lw	a2,-28(s0)
    1c7c:	31c18593          	addi	a1,gp,796 # 50b4 <__FUNCTION__.2>
    1c80:	19418513          	addi	a0,gp,404 # 4f2c <__global_pointer$+0x194>
    1c84:	e78fe0ef          	jal	2fc <my_printf>
    1c88:	fe344783          	lbu	a5,-29(s0)
    1c8c:	fc842703          	lw	a4,-56(s0)
    1c90:	00f707b3          	add	a5,a4,a5
    1c94:	fd442703          	lw	a4,-44(s0)
    1c98:	0ff77713          	zext.b	a4,a4
    1c9c:	00e78023          	sb	a4,0(a5)
    1ca0:	fe842783          	lw	a5,-24(s0)
    1ca4:	00078663          	beqz	a5,1cb0 <i2c_readN_d7r16+0x2d0>
    1ca8:	fff00793          	li	a5,-1
    1cac:	0080006f          	j	1cb4 <i2c_readN_d7r16+0x2d4>
    1cb0:	00000793          	li	a5,0
    1cb4:	00078513          	mv	a0,a5
    1cb8:	03c12083          	lw	ra,60(sp)
    1cbc:	03812403          	lw	s0,56(sp)
    1cc0:	04010113          	addi	sp,sp,64
    1cc4:	00008067          	ret

00001cc8 <i2c_write_d7r16>:
    1cc8:	fc010113          	addi	sp,sp,-64
    1ccc:	02112e23          	sw	ra,60(sp)
    1cd0:	02812c23          	sw	s0,56(sp)
    1cd4:	04010413          	addi	s0,sp,64
    1cd8:	00050793          	mv	a5,a0
    1cdc:	00058693          	mv	a3,a1
    1ce0:	00060713          	mv	a4,a2
    1ce4:	fcf407a3          	sb	a5,-49(s0)
    1ce8:	00068793          	mv	a5,a3
    1cec:	fcf41623          	sh	a5,-52(s0)
    1cf0:	00070793          	mv	a5,a4
    1cf4:	fcf40723          	sb	a5,-50(s0)
    1cf8:	fcf44783          	lbu	a5,-49(s0)
    1cfc:	00179793          	slli	a5,a5,0x1
    1d00:	0ff7f793          	zext.b	a5,a5
    1d04:	3007e793          	ori	a5,a5,768
    1d08:	fef42223          	sw	a5,-28(s0)
    1d0c:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1d10:	00078713          	mv	a4,a5
    1d14:	fe442783          	lw	a5,-28(s0)
    1d18:	00f72023          	sw	a5,0(a4)
    1d1c:	fcc45783          	lhu	a5,-52(s0)
    1d20:	0087d793          	srli	a5,a5,0x8
    1d24:	01079793          	slli	a5,a5,0x10
    1d28:	0107d793          	srli	a5,a5,0x10
    1d2c:	0ff7f793          	zext.b	a5,a5
    1d30:	2007e793          	ori	a5,a5,512
    1d34:	fef42223          	sw	a5,-28(s0)
    1d38:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1d3c:	00078713          	mv	a4,a5
    1d40:	fe442783          	lw	a5,-28(s0)
    1d44:	00f72023          	sw	a5,0(a4)
    1d48:	fcc45783          	lhu	a5,-52(s0)
    1d4c:	0ff7f793          	zext.b	a5,a5
    1d50:	2007e793          	ori	a5,a5,512
    1d54:	fef42223          	sw	a5,-28(s0)
    1d58:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1d5c:	00078713          	mv	a4,a5
    1d60:	fe442783          	lw	a5,-28(s0)
    1d64:	00f72023          	sw	a5,0(a4)
    1d68:	fce44703          	lbu	a4,-50(s0)
    1d6c:	000017b7          	lui	a5,0x1
    1d70:	a0078793          	addi	a5,a5,-1536 # a00 <uart_init+0xd8>
    1d74:	00f767b3          	or	a5,a4,a5
    1d78:	fef42223          	sw	a5,-28(s0)
    1d7c:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1d80:	00078713          	mv	a4,a5
    1d84:	fe442783          	lw	a5,-28(s0)
    1d88:	00f72023          	sw	a5,0(a4)
    1d8c:	00400793          	li	a5,4
    1d90:	fef42023          	sw	a5,-32(s0)
    1d94:	fe042783          	lw	a5,-32(s0)
    1d98:	01879793          	slli	a5,a5,0x18
    1d9c:	0017e793          	ori	a5,a5,1
    1da0:	fef42223          	sw	a5,-28(s0)
    1da4:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    1da8:	00078713          	mv	a4,a5
    1dac:	fe442783          	lw	a5,-28(s0)
    1db0:	00f72023          	sw	a5,0(a4)
    1db4:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    1db8:	0007a783          	lw	a5,0(a5)
    1dbc:	fcf42e23          	sw	a5,-36(s0)
    1dc0:	fdc42783          	lw	a5,-36(s0)
    1dc4:	0017f793          	andi	a5,a5,1
    1dc8:	fe0796e3          	bnez	a5,1db4 <i2c_write_d7r16+0xec>
    1dcc:	fdc42783          	lw	a5,-36(s0)
    1dd0:	0187d793          	srli	a5,a5,0x18
    1dd4:	fe042703          	lw	a4,-32(s0)
    1dd8:	00f70663          	beq	a4,a5,1de4 <i2c_write_d7r16+0x11c>
    1ddc:	fff00793          	li	a5,-1
    1de0:	07c0006f          	j	1e5c <i2c_write_d7r16+0x194>
    1de4:	fe042623          	sw	zero,-20(s0)
    1de8:	fe042423          	sw	zero,-24(s0)
    1dec:	0500006f          	j	1e3c <i2c_write_d7r16+0x174>
    1df0:	7241a783          	lw	a5,1828(gp) # 54bc <CSRA_I2C_RX_DATA>
    1df4:	0007a783          	lw	a5,0(a5)
    1df8:	fcf42e23          	sw	a5,-36(s0)
    1dfc:	fdc42783          	lw	a5,-36(s0)
    1e00:	1007f793          	andi	a5,a5,256
    1e04:	02079663          	bnez	a5,1e30 <i2c_write_d7r16+0x168>
    1e08:	fec42783          	lw	a5,-20(s0)
    1e0c:	00178793          	addi	a5,a5,1
    1e10:	fef42623          	sw	a5,-20(s0)
    1e14:	fcf44783          	lbu	a5,-49(s0)
    1e18:	fcc45683          	lhu	a3,-52(s0)
    1e1c:	fe842703          	lw	a4,-24(s0)
    1e20:	00078613          	mv	a2,a5
    1e24:	32c18593          	addi	a1,gp,812 # 50c4 <__FUNCTION__.1>
    1e28:	17018513          	addi	a0,gp,368 # 4f08 <__global_pointer$+0x170>
    1e2c:	cd0fe0ef          	jal	2fc <my_printf>
    1e30:	fe842783          	lw	a5,-24(s0)
    1e34:	00178793          	addi	a5,a5,1
    1e38:	fef42423          	sw	a5,-24(s0)
    1e3c:	fe842783          	lw	a5,-24(s0)
    1e40:	fe042703          	lw	a4,-32(s0)
    1e44:	fae7e6e3          	bltu	a5,a4,1df0 <i2c_write_d7r16+0x128>
    1e48:	fec42783          	lw	a5,-20(s0)
    1e4c:	00078663          	beqz	a5,1e58 <i2c_write_d7r16+0x190>
    1e50:	fff00793          	li	a5,-1
    1e54:	0080006f          	j	1e5c <i2c_write_d7r16+0x194>
    1e58:	00000793          	li	a5,0
    1e5c:	00078513          	mv	a0,a5
    1e60:	03c12083          	lw	ra,60(sp)
    1e64:	03812403          	lw	s0,56(sp)
    1e68:	04010113          	addi	sp,sp,64
    1e6c:	00008067          	ret

00001e70 <i2c_writeN_d7r16>:
    1e70:	fc010113          	addi	sp,sp,-64
    1e74:	02112e23          	sw	ra,60(sp)
    1e78:	02812c23          	sw	s0,56(sp)
    1e7c:	04010413          	addi	s0,sp,64
    1e80:	00050793          	mv	a5,a0
    1e84:	fcc42423          	sw	a2,-56(s0)
    1e88:	00068713          	mv	a4,a3
    1e8c:	fcf407a3          	sb	a5,-49(s0)
    1e90:	00058793          	mv	a5,a1
    1e94:	fcf41623          	sh	a5,-52(s0)
    1e98:	00070793          	mv	a5,a4
    1e9c:	fcf40723          	sb	a5,-50(s0)
    1ea0:	fcf44783          	lbu	a5,-49(s0)
    1ea4:	00179793          	slli	a5,a5,0x1
    1ea8:	0ff7f793          	zext.b	a5,a5
    1eac:	3007e793          	ori	a5,a5,768
    1eb0:	fef42023          	sw	a5,-32(s0)
    1eb4:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1eb8:	00078713          	mv	a4,a5
    1ebc:	fe042783          	lw	a5,-32(s0)
    1ec0:	00f72023          	sw	a5,0(a4)
    1ec4:	fcc45783          	lhu	a5,-52(s0)
    1ec8:	0087d793          	srli	a5,a5,0x8
    1ecc:	01079793          	slli	a5,a5,0x10
    1ed0:	0107d793          	srli	a5,a5,0x10
    1ed4:	0ff7f793          	zext.b	a5,a5
    1ed8:	2007e793          	ori	a5,a5,512
    1edc:	fef42023          	sw	a5,-32(s0)
    1ee0:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1ee4:	00078713          	mv	a4,a5
    1ee8:	fe042783          	lw	a5,-32(s0)
    1eec:	00f72023          	sw	a5,0(a4)
    1ef0:	fcc45783          	lhu	a5,-52(s0)
    1ef4:	0ff7f793          	zext.b	a5,a5
    1ef8:	2007e793          	ori	a5,a5,512
    1efc:	fef42023          	sw	a5,-32(s0)
    1f00:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1f04:	00078713          	mv	a4,a5
    1f08:	fe042783          	lw	a5,-32(s0)
    1f0c:	00f72023          	sw	a5,0(a4)
    1f10:	fe0407a3          	sb	zero,-17(s0)
    1f14:	0380006f          	j	1f4c <i2c_writeN_d7r16+0xdc>
    1f18:	fef44783          	lbu	a5,-17(s0)
    1f1c:	fc842703          	lw	a4,-56(s0)
    1f20:	00f707b3          	add	a5,a4,a5
    1f24:	0007c783          	lbu	a5,0(a5)
    1f28:	2007e793          	ori	a5,a5,512
    1f2c:	fef42023          	sw	a5,-32(s0)
    1f30:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1f34:	00078713          	mv	a4,a5
    1f38:	fe042783          	lw	a5,-32(s0)
    1f3c:	00f72023          	sw	a5,0(a4)
    1f40:	fef44783          	lbu	a5,-17(s0)
    1f44:	00178793          	addi	a5,a5,1
    1f48:	fef407a3          	sb	a5,-17(s0)
    1f4c:	fef44703          	lbu	a4,-17(s0)
    1f50:	fce44783          	lbu	a5,-50(s0)
    1f54:	fff78793          	addi	a5,a5,-1
    1f58:	fcf740e3          	blt	a4,a5,1f18 <i2c_writeN_d7r16+0xa8>
    1f5c:	fef44783          	lbu	a5,-17(s0)
    1f60:	fc842703          	lw	a4,-56(s0)
    1f64:	00f707b3          	add	a5,a4,a5
    1f68:	0007c783          	lbu	a5,0(a5)
    1f6c:	00078713          	mv	a4,a5
    1f70:	000017b7          	lui	a5,0x1
    1f74:	a0078793          	addi	a5,a5,-1536 # a00 <uart_init+0xd8>
    1f78:	00f767b3          	or	a5,a4,a5
    1f7c:	fef42023          	sw	a5,-32(s0)
    1f80:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    1f84:	00078713          	mv	a4,a5
    1f88:	fe042783          	lw	a5,-32(s0)
    1f8c:	00f72023          	sw	a5,0(a4)
    1f90:	fce44783          	lbu	a5,-50(s0)
    1f94:	00378793          	addi	a5,a5,3
    1f98:	fcf42e23          	sw	a5,-36(s0)
    1f9c:	fdc42783          	lw	a5,-36(s0)
    1fa0:	01879793          	slli	a5,a5,0x18
    1fa4:	0017e793          	ori	a5,a5,1
    1fa8:	fef42023          	sw	a5,-32(s0)
    1fac:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    1fb0:	00078713          	mv	a4,a5
    1fb4:	fe042783          	lw	a5,-32(s0)
    1fb8:	00f72023          	sw	a5,0(a4)
    1fbc:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    1fc0:	0007a783          	lw	a5,0(a5)
    1fc4:	fcf42c23          	sw	a5,-40(s0)
    1fc8:	fd842783          	lw	a5,-40(s0)
    1fcc:	0017f793          	andi	a5,a5,1
    1fd0:	fe0796e3          	bnez	a5,1fbc <i2c_writeN_d7r16+0x14c>
    1fd4:	fd842783          	lw	a5,-40(s0)
    1fd8:	0187d793          	srli	a5,a5,0x18
    1fdc:	fdc42703          	lw	a4,-36(s0)
    1fe0:	00f70663          	beq	a4,a5,1fec <i2c_writeN_d7r16+0x17c>
    1fe4:	fff00793          	li	a5,-1
    1fe8:	07c0006f          	j	2064 <i2c_writeN_d7r16+0x1f4>
    1fec:	fe042423          	sw	zero,-24(s0)
    1ff0:	fe042223          	sw	zero,-28(s0)
    1ff4:	0500006f          	j	2044 <i2c_writeN_d7r16+0x1d4>
    1ff8:	7241a783          	lw	a5,1828(gp) # 54bc <CSRA_I2C_RX_DATA>
    1ffc:	0007a783          	lw	a5,0(a5)
    2000:	fcf42c23          	sw	a5,-40(s0)
    2004:	fd842783          	lw	a5,-40(s0)
    2008:	1007f793          	andi	a5,a5,256
    200c:	02079663          	bnez	a5,2038 <i2c_writeN_d7r16+0x1c8>
    2010:	fe842783          	lw	a5,-24(s0)
    2014:	00178793          	addi	a5,a5,1
    2018:	fef42423          	sw	a5,-24(s0)
    201c:	fcf44783          	lbu	a5,-49(s0)
    2020:	fcc45683          	lhu	a3,-52(s0)
    2024:	fe442703          	lw	a4,-28(s0)
    2028:	00078613          	mv	a2,a5
    202c:	33c18593          	addi	a1,gp,828 # 50d4 <__FUNCTION__.0>
    2030:	17018513          	addi	a0,gp,368 # 4f08 <__global_pointer$+0x170>
    2034:	ac8fe0ef          	jal	2fc <my_printf>
    2038:	fe442783          	lw	a5,-28(s0)
    203c:	00178793          	addi	a5,a5,1
    2040:	fef42223          	sw	a5,-28(s0)
    2044:	fe442783          	lw	a5,-28(s0)
    2048:	fdc42703          	lw	a4,-36(s0)
    204c:	fae7e6e3          	bltu	a5,a4,1ff8 <i2c_writeN_d7r16+0x188>
    2050:	fe842783          	lw	a5,-24(s0)
    2054:	00078663          	beqz	a5,2060 <i2c_writeN_d7r16+0x1f0>
    2058:	fff00793          	li	a5,-1
    205c:	0080006f          	j	2064 <i2c_writeN_d7r16+0x1f4>
    2060:	00000793          	li	a5,0
    2064:	00078513          	mv	a0,a5
    2068:	03c12083          	lw	ra,60(sp)
    206c:	03812403          	lw	s0,56(sp)
    2070:	04010113          	addi	sp,sp,64
    2074:	00008067          	ret

00002078 <i2c_rst>:
    2078:	fe010113          	addi	sp,sp,-32
    207c:	00812e23          	sw	s0,28(sp)
    2080:	02010413          	addi	s0,sp,32
    2084:	7001a783          	lw	a5,1792(gp) # 5498 <CSRA_I2C_CONTROL>
    2088:	0007a783          	lw	a5,0(a5)
    208c:	fef42623          	sw	a5,-20(s0)
    2090:	fec42703          	lw	a4,-20(s0)
    2094:	800007b7          	lui	a5,0x80000
    2098:	00f767b3          	or	a5,a4,a5
    209c:	fef42423          	sw	a5,-24(s0)
    20a0:	7001a783          	lw	a5,1792(gp) # 5498 <CSRA_I2C_CONTROL>
    20a4:	00078713          	mv	a4,a5
    20a8:	fe842783          	lw	a5,-24(s0)
    20ac:	00f72023          	sw	a5,0(a4)
    20b0:	fec42703          	lw	a4,-20(s0)
    20b4:	800007b7          	lui	a5,0x80000
    20b8:	fff78793          	addi	a5,a5,-1 # 7fffffff <_memory_end+0x7ffdffff>
    20bc:	00f777b3          	and	a5,a4,a5
    20c0:	fef42423          	sw	a5,-24(s0)
    20c4:	7001a783          	lw	a5,1792(gp) # 5498 <CSRA_I2C_CONTROL>
    20c8:	00078713          	mv	a4,a5
    20cc:	fe842783          	lw	a5,-24(s0)
    20d0:	00f72023          	sw	a5,0(a4)
    20d4:	00000793          	li	a5,0
    20d8:	00078513          	mv	a0,a5
    20dc:	01c12403          	lw	s0,28(sp)
    20e0:	02010113          	addi	sp,sp,32
    20e4:	00008067          	ret

000020e8 <i2c_enable>:
    20e8:	fe010113          	addi	sp,sp,-32
    20ec:	00812e23          	sw	s0,28(sp)
    20f0:	02010413          	addi	s0,sp,32
    20f4:	7001a783          	lw	a5,1792(gp) # 5498 <CSRA_I2C_CONTROL>
    20f8:	0007a783          	lw	a5,0(a5)
    20fc:	fef42623          	sw	a5,-20(s0)
    2100:	fec42783          	lw	a5,-20(s0)
    2104:	0017e793          	ori	a5,a5,1
    2108:	fef42423          	sw	a5,-24(s0)
    210c:	7001a783          	lw	a5,1792(gp) # 5498 <CSRA_I2C_CONTROL>
    2110:	00078713          	mv	a4,a5
    2114:	fe842783          	lw	a5,-24(s0)
    2118:	00f72023          	sw	a5,0(a4)
    211c:	00000793          	li	a5,0
    2120:	00078513          	mv	a0,a5
    2124:	01c12403          	lw	s0,28(sp)
    2128:	02010113          	addi	sp,sp,32
    212c:	00008067          	ret

00002130 <i2c_disable>:
    2130:	fe010113          	addi	sp,sp,-32
    2134:	00812e23          	sw	s0,28(sp)
    2138:	02010413          	addi	s0,sp,32
    213c:	7001a783          	lw	a5,1792(gp) # 5498 <CSRA_I2C_CONTROL>
    2140:	0007a783          	lw	a5,0(a5)
    2144:	fef42623          	sw	a5,-20(s0)
    2148:	fec42783          	lw	a5,-20(s0)
    214c:	ffe7f793          	andi	a5,a5,-2
    2150:	fef42423          	sw	a5,-24(s0)
    2154:	7001a783          	lw	a5,1792(gp) # 5498 <CSRA_I2C_CONTROL>
    2158:	00078713          	mv	a4,a5
    215c:	fe842783          	lw	a5,-24(s0)
    2160:	00f72023          	sw	a5,0(a4)
    2164:	00000793          	li	a5,0
    2168:	00078513          	mv	a0,a5
    216c:	01c12403          	lw	s0,28(sp)
    2170:	02010113          	addi	sp,sp,32
    2174:	00008067          	ret

00002178 <i2c_sel>:
    2178:	fd010113          	addi	sp,sp,-48
    217c:	02812623          	sw	s0,44(sp)
    2180:	03010413          	addi	s0,sp,48
    2184:	fca42e23          	sw	a0,-36(s0)
    2188:	fdc42783          	lw	a5,-36(s0)
    218c:	00f7f793          	andi	a5,a5,15
    2190:	fef42623          	sw	a5,-20(s0)
    2194:	70c1a783          	lw	a5,1804(gp) # 54a4 <CSRA_I2C_SEL>
    2198:	00078713          	mv	a4,a5
    219c:	fec42783          	lw	a5,-20(s0)
    21a0:	00f72023          	sw	a5,0(a4)
    21a4:	fdc42783          	lw	a5,-36(s0)
    21a8:	00f7f713          	andi	a4,a5,15
    21ac:	76e1a023          	sw	a4,1888(gp) # 54f8 <current_i2c_id>
    21b0:	00000793          	li	a5,0
    21b4:	00078513          	mv	a0,a5
    21b8:	02c12403          	lw	s0,44(sp)
    21bc:	03010113          	addi	sp,sp,48
    21c0:	00008067          	ret

000021c4 <i2c_config>:
    21c4:	fd010113          	addi	sp,sp,-48
    21c8:	02112623          	sw	ra,44(sp)
    21cc:	02812423          	sw	s0,40(sp)
    21d0:	03010413          	addi	s0,sp,48
    21d4:	fca42e23          	sw	a0,-36(s0)
    21d8:	fcb42c23          	sw	a1,-40(s0)
    21dc:	fcc42a23          	sw	a2,-44(s0)
    21e0:	fcd42823          	sw	a3,-48(s0)
    21e4:	fdc42703          	lw	a4,-36(s0)
    21e8:	00f00793          	li	a5,15
    21ec:	02e7e463          	bltu	a5,a4,2214 <i2c_config+0x50>
    21f0:	fd842703          	lw	a4,-40(s0)
    21f4:	00f00793          	li	a5,15
    21f8:	00e7ee63          	bltu	a5,a4,2214 <i2c_config+0x50>
    21fc:	fd442703          	lw	a4,-44(s0)
    2200:	00f00793          	li	a5,15
    2204:	00e7e863          	bltu	a5,a4,2214 <i2c_config+0x50>
    2208:	fd042703          	lw	a4,-48(s0)
    220c:	00f00793          	li	a5,15
    2210:	00e7f663          	bgeu	a5,a4,221c <i2c_config+0x58>
    2214:	fff00793          	li	a5,-1
    2218:	0680006f          	j	2280 <i2c_config+0xbc>
    221c:	f15ff0ef          	jal	2130 <i2c_disable>
    2220:	fdc42783          	lw	a5,-36(s0)
    2224:	00c79713          	slli	a4,a5,0xc
    2228:	000107b7          	lui	a5,0x10
    222c:	fff78793          	addi	a5,a5,-1 # ffff <_bss_end+0xab03>
    2230:	00f77733          	and	a4,a4,a5
    2234:	fd842783          	lw	a5,-40(s0)
    2238:	00879693          	slli	a3,a5,0x8
    223c:	000017b7          	lui	a5,0x1
    2240:	f0078793          	addi	a5,a5,-256 # f00 <uart_cler_rx_irq+0x4c>
    2244:	00f6f7b3          	and	a5,a3,a5
    2248:	00f76733          	or	a4,a4,a5
    224c:	fd442783          	lw	a5,-44(s0)
    2250:	00479793          	slli	a5,a5,0x4
    2254:	0ff7f793          	zext.b	a5,a5
    2258:	00f76733          	or	a4,a4,a5
    225c:	fd042783          	lw	a5,-48(s0)
    2260:	00f7f793          	andi	a5,a5,15
    2264:	00f767b3          	or	a5,a4,a5
    2268:	fef42623          	sw	a5,-20(s0)
    226c:	7081a783          	lw	a5,1800(gp) # 54a0 <CSRA_I2C_CONFIG>
    2270:	00078713          	mv	a4,a5
    2274:	fec42783          	lw	a5,-20(s0)
    2278:	00f72023          	sw	a5,0(a4)
    227c:	00000793          	li	a5,0
    2280:	00078513          	mv	a0,a5
    2284:	02c12083          	lw	ra,44(sp)
    2288:	02812403          	lw	s0,40(sp)
    228c:	03010113          	addi	sp,sp,48
    2290:	00008067          	ret

00002294 <i2c_init>:
    2294:	fc010113          	addi	sp,sp,-64
    2298:	02112e23          	sw	ra,60(sp)
    229c:	02812c23          	sw	s0,56(sp)
    22a0:	03212a23          	sw	s2,52(sp)
    22a4:	03312823          	sw	s3,48(sp)
    22a8:	04010413          	addi	s0,sp,64
    22ac:	fca42623          	sw	a0,-52(s0)
    22b0:	e81ff0ef          	jal	2130 <i2c_disable>
    22b4:	7041a783          	lw	a5,1796(gp) # 549c <CSRA_I2C_STATUS>
    22b8:	0007a783          	lw	a5,0(a5)
    22bc:	fef42623          	sw	a5,-20(s0)
    22c0:	fec42783          	lw	a5,-20(s0)
    22c4:	0087d793          	srli	a5,a5,0x8
    22c8:	0ff7f713          	zext.b	a4,a5
    22cc:	72e1a623          	sw	a4,1836(gp) # 54c4 <ftx_num>
    22d0:	fec42783          	lw	a5,-20(s0)
    22d4:	0107d793          	srli	a5,a5,0x10
    22d8:	0ff7f713          	zext.b	a4,a5
    22dc:	72e1a423          	sw	a4,1832(gp) # 54c0 <frx_num>
    22e0:	7101a783          	lw	a5,1808(gp) # 54a8 <CSRA_I2C_CLK_FREQ>
    22e4:	0007a783          	lw	a5,0(a5)
    22e8:	fef42623          	sw	a5,-20(s0)
    22ec:	fec42783          	lw	a5,-20(s0)
    22f0:	fef42423          	sw	a5,-24(s0)
    22f4:	fe842503          	lw	a0,-24(s0)
    22f8:	4d1010ef          	jal	3fc8 <__floatunsidf>
    22fc:	00050913          	mv	s2,a0
    2300:	00058993          	mv	s3,a1
    2304:	fcc42503          	lw	a0,-52(s0)
    2308:	4c1010ef          	jal	3fc8 <__floatunsidf>
    230c:	00050713          	mv	a4,a0
    2310:	00058793          	mv	a5,a1
    2314:	00070613          	mv	a2,a4
    2318:	00078693          	mv	a3,a5
    231c:	00090513          	mv	a0,s2
    2320:	00098593          	mv	a1,s3
    2324:	4d0010ef          	jal	37f4 <__divdf3>
    2328:	00050713          	mv	a4,a0
    232c:	00058793          	mv	a5,a1
    2330:	00070513          	mv	a0,a4
    2334:	00078593          	mv	a1,a5
    2338:	3501a603          	lw	a2,848(gp) # 50e8 <__FUNCTION__.0+0x14>
    233c:	3541a683          	lw	a3,852(gp) # 50ec <__FUNCTION__.0+0x18>
    2340:	521000ef          	jal	3060 <__adddf3>
    2344:	00050713          	mv	a4,a0
    2348:	00058793          	mv	a5,a1
    234c:	fee42023          	sw	a4,-32(s0)
    2350:	fef42223          	sw	a5,-28(s0)
    2354:	fe042503          	lw	a0,-32(s0)
    2358:	fe442583          	lw	a1,-28(s0)
    235c:	3f1010ef          	jal	3f4c <__fixunsdfsi>
    2360:	00050793          	mv	a5,a0
    2364:	fcf42e23          	sw	a5,-36(s0)
    2368:	7141a783          	lw	a5,1812(gp) # 54ac <CSRA_I2C_SPEED>
    236c:	00078713          	mv	a4,a5
    2370:	fcc42783          	lw	a5,-52(s0)
    2374:	00f72023          	sw	a5,0(a4)
    2378:	7181a783          	lw	a5,1816(gp) # 54b0 <CSRA_I2C_CLKDIV>
    237c:	00078713          	mv	a4,a5
    2380:	fdc42783          	lw	a5,-36(s0)
    2384:	00f72023          	sw	a5,0(a4)
    2388:	00000793          	li	a5,0
    238c:	00078513          	mv	a0,a5
    2390:	03c12083          	lw	ra,60(sp)
    2394:	03812403          	lw	s0,56(sp)
    2398:	03412903          	lw	s2,52(sp)
    239c:	03012983          	lw	s3,48(sp)
    23a0:	04010113          	addi	sp,sp,64
    23a4:	00008067          	ret

000023a8 <i2c_csr_read>:
    23a8:	fd010113          	addi	sp,sp,-48
    23ac:	02812623          	sw	s0,44(sp)
    23b0:	03010413          	addi	s0,sp,48
    23b4:	fca42e23          	sw	a0,-36(s0)
    23b8:	fcb42c23          	sw	a1,-40(s0)
    23bc:	fd842783          	lw	a5,-40(s0)
    23c0:	00079663          	bnez	a5,23cc <i2c_csr_read+0x24>
    23c4:	00000793          	li	a5,0
    23c8:	0200006f          	j	23e8 <i2c_csr_read+0x40>
    23cc:	fdc42783          	lw	a5,-36(s0)
    23d0:	0007a783          	lw	a5,0(a5)
    23d4:	fef42623          	sw	a5,-20(s0)
    23d8:	fd842783          	lw	a5,-40(s0)
    23dc:	fec42703          	lw	a4,-20(s0)
    23e0:	00e7a023          	sw	a4,0(a5)
    23e4:	00000793          	li	a5,0
    23e8:	00078513          	mv	a0,a5
    23ec:	02c12403          	lw	s0,44(sp)
    23f0:	03010113          	addi	sp,sp,48
    23f4:	00008067          	ret

000023f8 <i2c_csr_write>:
    23f8:	fe010113          	addi	sp,sp,-32
    23fc:	00812e23          	sw	s0,28(sp)
    2400:	02010413          	addi	s0,sp,32
    2404:	fea42623          	sw	a0,-20(s0)
    2408:	feb42423          	sw	a1,-24(s0)
    240c:	fec42783          	lw	a5,-20(s0)
    2410:	fe842703          	lw	a4,-24(s0)
    2414:	00e7a023          	sw	a4,0(a5)
    2418:	00000793          	li	a5,0
    241c:	00078513          	mv	a0,a5
    2420:	01c12403          	lw	s0,28(sp)
    2424:	02010113          	addi	sp,sp,32
    2428:	00008067          	ret

0000242c <i2c_csr_check>:
    242c:	fe010113          	addi	sp,sp,-32
    2430:	00112e23          	sw	ra,28(sp)
    2434:	00812c23          	sw	s0,24(sp)
    2438:	02010413          	addi	s0,sp,32
    243c:	6fc1a783          	lw	a5,1788(gp) # 5494 <CSRA_I2C_VERSION>
    2440:	0007a783          	lw	a5,0(a5)
    2444:	fef42623          	sw	a5,-20(s0)
    2448:	fec42583          	lw	a1,-20(s0)
    244c:	1e018513          	addi	a0,gp,480 # 4f78 <__global_pointer$+0x1e0>
    2450:	eadfd0ef          	jal	2fc <my_printf>
    2454:	7001a783          	lw	a5,1792(gp) # 5498 <CSRA_I2C_CONTROL>
    2458:	0007a783          	lw	a5,0(a5)
    245c:	fef42623          	sw	a5,-20(s0)
    2460:	fec42583          	lw	a1,-20(s0)
    2464:	1f418513          	addi	a0,gp,500 # 4f8c <__global_pointer$+0x1f4>
    2468:	e95fd0ef          	jal	2fc <my_printf>
    246c:	7041a783          	lw	a5,1796(gp) # 549c <CSRA_I2C_STATUS>
    2470:	0007a783          	lw	a5,0(a5)
    2474:	fef42623          	sw	a5,-20(s0)
    2478:	fec42583          	lw	a1,-20(s0)
    247c:	20818513          	addi	a0,gp,520 # 4fa0 <__global_pointer$+0x208>
    2480:	e7dfd0ef          	jal	2fc <my_printf>
    2484:	7081a783          	lw	a5,1800(gp) # 54a0 <CSRA_I2C_CONFIG>
    2488:	0007a783          	lw	a5,0(a5)
    248c:	fef42623          	sw	a5,-20(s0)
    2490:	fec42583          	lw	a1,-20(s0)
    2494:	21c18513          	addi	a0,gp,540 # 4fb4 <__global_pointer$+0x21c>
    2498:	e65fd0ef          	jal	2fc <my_printf>
    249c:	70c1a783          	lw	a5,1804(gp) # 54a4 <CSRA_I2C_SEL>
    24a0:	0007a783          	lw	a5,0(a5)
    24a4:	fef42623          	sw	a5,-20(s0)
    24a8:	fec42583          	lw	a1,-20(s0)
    24ac:	23018513          	addi	a0,gp,560 # 4fc8 <__global_pointer$+0x230>
    24b0:	e4dfd0ef          	jal	2fc <my_printf>
    24b4:	7101a783          	lw	a5,1808(gp) # 54a8 <CSRA_I2C_CLK_FREQ>
    24b8:	0007a783          	lw	a5,0(a5)
    24bc:	fef42623          	sw	a5,-20(s0)
    24c0:	fec42503          	lw	a0,-20(s0)
    24c4:	55c020ef          	jal	4a20 <__floatunsisf>
    24c8:	00050793          	mv	a5,a0
    24cc:	00078513          	mv	a0,a5
    24d0:	62c020ef          	jal	4afc <__extendsfdf2>
    24d4:	00050713          	mv	a4,a0
    24d8:	00058793          	mv	a5,a1
    24dc:	3581a603          	lw	a2,856(gp) # 50f0 <__FUNCTION__.0+0x1c>
    24e0:	35c1a683          	lw	a3,860(gp) # 50f4 <__FUNCTION__.0+0x20>
    24e4:	00070513          	mv	a0,a4
    24e8:	00078593          	mv	a1,a5
    24ec:	308010ef          	jal	37f4 <__divdf3>
    24f0:	00050713          	mv	a4,a0
    24f4:	00058793          	mv	a5,a1
    24f8:	00070613          	mv	a2,a4
    24fc:	00078693          	mv	a3,a5
    2500:	fec42583          	lw	a1,-20(s0)
    2504:	24418513          	addi	a0,gp,580 # 4fdc <__global_pointer$+0x244>
    2508:	df5fd0ef          	jal	2fc <my_printf>
    250c:	7141a783          	lw	a5,1812(gp) # 54ac <CSRA_I2C_SPEED>
    2510:	0007a783          	lw	a5,0(a5)
    2514:	fef42623          	sw	a5,-20(s0)
    2518:	fec42503          	lw	a0,-20(s0)
    251c:	504020ef          	jal	4a20 <__floatunsisf>
    2520:	00050793          	mv	a5,a0
    2524:	00078513          	mv	a0,a5
    2528:	5d4020ef          	jal	4afc <__extendsfdf2>
    252c:	00050713          	mv	a4,a0
    2530:	00058793          	mv	a5,a1
    2534:	3601a603          	lw	a2,864(gp) # 50f8 <__FUNCTION__.0+0x24>
    2538:	3641a683          	lw	a3,868(gp) # 50fc <__FUNCTION__.0+0x28>
    253c:	00070513          	mv	a0,a4
    2540:	00078593          	mv	a1,a5
    2544:	2b0010ef          	jal	37f4 <__divdf3>
    2548:	00050713          	mv	a4,a0
    254c:	00058793          	mv	a5,a1
    2550:	00070613          	mv	a2,a4
    2554:	00078693          	mv	a3,a5
    2558:	fec42583          	lw	a1,-20(s0)
    255c:	26018513          	addi	a0,gp,608 # 4ff8 <__global_pointer$+0x260>
    2560:	d9dfd0ef          	jal	2fc <my_printf>
    2564:	7181a783          	lw	a5,1816(gp) # 54b0 <CSRA_I2C_CLKDIV>
    2568:	0007a783          	lw	a5,0(a5)
    256c:	fef42623          	sw	a5,-20(s0)
    2570:	fec42583          	lw	a1,-20(s0)
    2574:	27c18513          	addi	a0,gp,636 # 5014 <__global_pointer$+0x27c>
    2578:	d85fd0ef          	jal	2fc <my_printf>
    257c:	71c1a783          	lw	a5,1820(gp) # 54b4 <CSRA_I2C_RUN>
    2580:	0007a783          	lw	a5,0(a5)
    2584:	fef42623          	sw	a5,-20(s0)
    2588:	fec42583          	lw	a1,-20(s0)
    258c:	29018513          	addi	a0,gp,656 # 5028 <__global_pointer$+0x290>
    2590:	d6dfd0ef          	jal	2fc <my_printf>
    2594:	7201a783          	lw	a5,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    2598:	0007a783          	lw	a5,0(a5)
    259c:	fef42623          	sw	a5,-20(s0)
    25a0:	fec42583          	lw	a1,-20(s0)
    25a4:	2a418513          	addi	a0,gp,676 # 503c <__global_pointer$+0x2a4>
    25a8:	d55fd0ef          	jal	2fc <my_printf>
    25ac:	7241a783          	lw	a5,1828(gp) # 54bc <CSRA_I2C_RX_DATA>
    25b0:	0007a783          	lw	a5,0(a5)
    25b4:	fef42623          	sw	a5,-20(s0)
    25b8:	fec42583          	lw	a1,-20(s0)
    25bc:	2b818513          	addi	a0,gp,696 # 5050 <__global_pointer$+0x2b8>
    25c0:	d3dfd0ef          	jal	2fc <my_printf>
    25c4:	00000793          	li	a5,0
    25c8:	00078513          	mv	a0,a5
    25cc:	01c12083          	lw	ra,28(sp)
    25d0:	01812403          	lw	s0,24(sp)
    25d4:	02010113          	addi	sp,sp,32
    25d8:	00008067          	ret

000025dc <i2c_get_config>:
    25dc:	fd010113          	addi	sp,sp,-48
    25e0:	02812623          	sw	s0,44(sp)
    25e4:	03010413          	addi	s0,sp,48
    25e8:	fca42e23          	sw	a0,-36(s0)
    25ec:	fcb42c23          	sw	a1,-40(s0)
    25f0:	fcc42a23          	sw	a2,-44(s0)
    25f4:	fcd42823          	sw	a3,-48(s0)
    25f8:	7081a783          	lw	a5,1800(gp) # 54a0 <CSRA_I2C_CONFIG>
    25fc:	0007a783          	lw	a5,0(a5)
    2600:	fef42623          	sw	a5,-20(s0)
    2604:	fdc42783          	lw	a5,-36(s0)
    2608:	00078c63          	beqz	a5,2620 <i2c_get_config+0x44>
    260c:	fec42783          	lw	a5,-20(s0)
    2610:	00c7d793          	srli	a5,a5,0xc
    2614:	00f7f713          	andi	a4,a5,15
    2618:	fdc42783          	lw	a5,-36(s0)
    261c:	00e7a023          	sw	a4,0(a5)
    2620:	fd842783          	lw	a5,-40(s0)
    2624:	00078c63          	beqz	a5,263c <i2c_get_config+0x60>
    2628:	fec42783          	lw	a5,-20(s0)
    262c:	0087d793          	srli	a5,a5,0x8
    2630:	00f7f713          	andi	a4,a5,15
    2634:	fd842783          	lw	a5,-40(s0)
    2638:	00e7a023          	sw	a4,0(a5)
    263c:	fd442783          	lw	a5,-44(s0)
    2640:	00078c63          	beqz	a5,2658 <i2c_get_config+0x7c>
    2644:	fec42783          	lw	a5,-20(s0)
    2648:	0047d793          	srli	a5,a5,0x4
    264c:	00f7f713          	andi	a4,a5,15
    2650:	fd442783          	lw	a5,-44(s0)
    2654:	00e7a023          	sw	a4,0(a5)
    2658:	fd042783          	lw	a5,-48(s0)
    265c:	00078a63          	beqz	a5,2670 <i2c_get_config+0x94>
    2660:	fec42783          	lw	a5,-20(s0)
    2664:	00f7f713          	andi	a4,a5,15
    2668:	fd042783          	lw	a5,-48(s0)
    266c:	00e7a023          	sw	a4,0(a5)
    2670:	00000793          	li	a5,0
    2674:	00078513          	mv	a0,a5
    2678:	02c12403          	lw	s0,44(sp)
    267c:	03010113          	addi	sp,sp,48
    2680:	00008067          	ret

00002684 <i2c_get_busy>:
    2684:	fe010113          	addi	sp,sp,-32
    2688:	00812e23          	sw	s0,28(sp)
    268c:	02010413          	addi	s0,sp,32
    2690:	7041a783          	lw	a5,1796(gp) # 549c <CSRA_I2C_STATUS>
    2694:	0007a783          	lw	a5,0(a5)
    2698:	fef42623          	sw	a5,-20(s0)
    269c:	fec42703          	lw	a4,-20(s0)
    26a0:	400007b7          	lui	a5,0x40000
    26a4:	00f777b3          	and	a5,a4,a5
    26a8:	00078513          	mv	a0,a5
    26ac:	01c12403          	lw	s0,28(sp)
    26b0:	02010113          	addi	sp,sp,32
    26b4:	00008067          	ret

000026b8 <i2c_get_sel>:
    26b8:	fe010113          	addi	sp,sp,-32
    26bc:	00812e23          	sw	s0,28(sp)
    26c0:	02010413          	addi	s0,sp,32
    26c4:	70c1a783          	lw	a5,1804(gp) # 54a4 <CSRA_I2C_SEL>
    26c8:	0007a783          	lw	a5,0(a5) # 40000000 <_memory_end+0x3ffe0000>
    26cc:	fef42623          	sw	a5,-20(s0)
    26d0:	fec42783          	lw	a5,-20(s0)
    26d4:	00f7f793          	andi	a5,a5,15
    26d8:	00078513          	mv	a0,a5
    26dc:	01c12403          	lw	s0,28(sp)
    26e0:	02010113          	addi	sp,sp,32
    26e4:	00008067          	ret

000026e8 <i2c_get_clk_freq>:
    26e8:	fe010113          	addi	sp,sp,-32
    26ec:	00812e23          	sw	s0,28(sp)
    26f0:	02010413          	addi	s0,sp,32
    26f4:	7101a783          	lw	a5,1808(gp) # 54a8 <CSRA_I2C_CLK_FREQ>
    26f8:	0007a783          	lw	a5,0(a5)
    26fc:	fef42623          	sw	a5,-20(s0)
    2700:	fec42783          	lw	a5,-20(s0)
    2704:	00078513          	mv	a0,a5
    2708:	01c12403          	lw	s0,28(sp)
    270c:	02010113          	addi	sp,sp,32
    2710:	00008067          	ret

00002714 <i2c_get_clk_div>:
    2714:	fe010113          	addi	sp,sp,-32
    2718:	00812e23          	sw	s0,28(sp)
    271c:	02010413          	addi	s0,sp,32
    2720:	7181a783          	lw	a5,1816(gp) # 54b0 <CSRA_I2C_CLKDIV>
    2724:	0007a783          	lw	a5,0(a5)
    2728:	fef42623          	sw	a5,-20(s0)
    272c:	fec42783          	lw	a5,-20(s0)
    2730:	00078513          	mv	a0,a5
    2734:	01c12403          	lw	s0,28(sp)
    2738:	02010113          	addi	sp,sp,32
    273c:	00008067          	ret

00002740 <i2c_set_addr>:
    2740:	fe010113          	addi	sp,sp,-32
    2744:	00812e23          	sw	s0,28(sp)
    2748:	02010413          	addi	s0,sp,32
    274c:	fea42623          	sw	a0,-20(s0)
    2750:	fec42703          	lw	a4,-20(s0)
    2754:	6ee1ac23          	sw	a4,1784(gp) # 5490 <CSRA_I2C_BASE>
    2758:	fec42703          	lw	a4,-20(s0)
    275c:	6ee1ae23          	sw	a4,1788(gp) # 5494 <CSRA_I2C_VERSION>
    2760:	fec42783          	lw	a5,-20(s0)
    2764:	00478713          	addi	a4,a5,4
    2768:	70e1a023          	sw	a4,1792(gp) # 5498 <CSRA_I2C_CONTROL>
    276c:	fec42783          	lw	a5,-20(s0)
    2770:	00878713          	addi	a4,a5,8
    2774:	70e1a223          	sw	a4,1796(gp) # 549c <CSRA_I2C_STATUS>
    2778:	fec42783          	lw	a5,-20(s0)
    277c:	00c78713          	addi	a4,a5,12
    2780:	70e1a423          	sw	a4,1800(gp) # 54a0 <CSRA_I2C_CONFIG>
    2784:	fec42783          	lw	a5,-20(s0)
    2788:	01078713          	addi	a4,a5,16
    278c:	70e1a623          	sw	a4,1804(gp) # 54a4 <CSRA_I2C_SEL>
    2790:	fec42783          	lw	a5,-20(s0)
    2794:	02078713          	addi	a4,a5,32
    2798:	70e1a823          	sw	a4,1808(gp) # 54a8 <CSRA_I2C_CLK_FREQ>
    279c:	fec42783          	lw	a5,-20(s0)
    27a0:	02478713          	addi	a4,a5,36
    27a4:	70e1aa23          	sw	a4,1812(gp) # 54ac <CSRA_I2C_SPEED>
    27a8:	fec42783          	lw	a5,-20(s0)
    27ac:	02878713          	addi	a4,a5,40
    27b0:	70e1ac23          	sw	a4,1816(gp) # 54b0 <CSRA_I2C_CLKDIV>
    27b4:	fec42783          	lw	a5,-20(s0)
    27b8:	03078713          	addi	a4,a5,48
    27bc:	70e1ae23          	sw	a4,1820(gp) # 54b4 <CSRA_I2C_RUN>
    27c0:	fec42783          	lw	a5,-20(s0)
    27c4:	04078713          	addi	a4,a5,64
    27c8:	72e1a023          	sw	a4,1824(gp) # 54b8 <CSRA_I2C_TX_DATA>
    27cc:	fec42783          	lw	a5,-20(s0)
    27d0:	05078713          	addi	a4,a5,80
    27d4:	72e1a223          	sw	a4,1828(gp) # 54bc <CSRA_I2C_RX_DATA>
    27d8:	00000793          	li	a5,0
    27dc:	00078513          	mv	a0,a5
    27e0:	01c12403          	lw	s0,28(sp)
    27e4:	02010113          	addi	sp,sp,32
    27e8:	00008067          	ret

000027ec <i2c_get_addr>:
    27ec:	ff010113          	addi	sp,sp,-16
    27f0:	00812623          	sw	s0,12(sp)
    27f4:	01010413          	addi	s0,sp,16
    27f8:	6f81a783          	lw	a5,1784(gp) # 5490 <CSRA_I2C_BASE>
    27fc:	00078513          	mv	a0,a5
    2800:	00c12403          	lw	s0,12(sp)
    2804:	01010113          	addi	sp,sp,16
    2808:	00008067          	ret

0000280c <gpio_read>:
    280c:	fe010113          	addi	sp,sp,-32
    2810:	00812e23          	sw	s0,28(sp)
    2814:	02010413          	addi	s0,sp,32
    2818:	7401a783          	lw	a5,1856(gp) # 54d8 <CSRA_INPUT>
    281c:	0007a783          	lw	a5,0(a5)
    2820:	fef42623          	sw	a5,-20(s0)
    2824:	fec42783          	lw	a5,-20(s0)
    2828:	00078513          	mv	a0,a5
    282c:	01c12403          	lw	s0,28(sp)
    2830:	02010113          	addi	sp,sp,32
    2834:	00008067          	ret

00002838 <gpio_write>:
    2838:	fe010113          	addi	sp,sp,-32
    283c:	00812e23          	sw	s0,28(sp)
    2840:	02010413          	addi	s0,sp,32
    2844:	fea42623          	sw	a0,-20(s0)
    2848:	7441a783          	lw	a5,1860(gp) # 54dc <CSRA_OUTPUT>
    284c:	00078713          	mv	a4,a5
    2850:	fec42783          	lw	a5,-20(s0)
    2854:	00f72023          	sw	a5,0(a4)
    2858:	00000013          	nop
    285c:	01c12403          	lw	s0,28(sp)
    2860:	02010113          	addi	sp,sp,32
    2864:	00008067          	ret

00002868 <gpio_init>:
    2868:	fd010113          	addi	sp,sp,-48
    286c:	02812623          	sw	s0,44(sp)
    2870:	03010413          	addi	s0,sp,48
    2874:	fca42e23          	sw	a0,-36(s0)
    2878:	fcb42c23          	sw	a1,-40(s0)
    287c:	fcc42a23          	sw	a2,-44(s0)
    2880:	fcd42823          	sw	a3,-48(s0)
    2884:	fe042623          	sw	zero,-20(s0)
    2888:	73c1a783          	lw	a5,1852(gp) # 54d4 <CSRA_DIR>
    288c:	00078713          	mv	a4,a5
    2890:	fdc42783          	lw	a5,-36(s0)
    2894:	00f72023          	sw	a5,0(a4)
    2898:	7441a783          	lw	a5,1860(gp) # 54dc <CSRA_OUTPUT>
    289c:	00078713          	mv	a4,a5
    28a0:	fec42783          	lw	a5,-20(s0)
    28a4:	00f72023          	sw	a5,0(a4)
    28a8:	7501a783          	lw	a5,1872(gp) # 54e8 <CSRA_EDGE>
    28ac:	00078713          	mv	a4,a5
    28b0:	fd842783          	lw	a5,-40(s0)
    28b4:	00f72023          	sw	a5,0(a4)
    28b8:	7541a783          	lw	a5,1876(gp) # 54ec <CSRA_POL>
    28bc:	00078713          	mv	a4,a5
    28c0:	fd442783          	lw	a5,-44(s0)
    28c4:	00f72023          	sw	a5,0(a4)
    28c8:	fd042783          	lw	a5,-48(s0)
    28cc:	fff7c793          	not	a5,a5
    28d0:	fef42623          	sw	a5,-20(s0)
    28d4:	7481a783          	lw	a5,1864(gp) # 54e0 <CSRA_MASK>
    28d8:	00078713          	mv	a4,a5
    28dc:	fec42783          	lw	a5,-20(s0)
    28e0:	00f72023          	sw	a5,0(a4)
    28e4:	00000013          	nop
    28e8:	02c12403          	lw	s0,44(sp)
    28ec:	03010113          	addi	sp,sp,48
    28f0:	00008067          	ret

000028f4 <gpio_irq_enable>:
    28f4:	fd010113          	addi	sp,sp,-48
    28f8:	02812623          	sw	s0,44(sp)
    28fc:	03010413          	addi	s0,sp,48
    2900:	fca42e23          	sw	a0,-36(s0)
    2904:	fdc42783          	lw	a5,-36(s0)
    2908:	fff7c793          	not	a5,a5
    290c:	fef42623          	sw	a5,-20(s0)
    2910:	7481a783          	lw	a5,1864(gp) # 54e0 <CSRA_MASK>
    2914:	00078713          	mv	a4,a5
    2918:	fec42783          	lw	a5,-20(s0)
    291c:	00f72023          	sw	a5,0(a4)
    2920:	7481a783          	lw	a5,1864(gp) # 54e0 <CSRA_MASK>
    2924:	0007a783          	lw	a5,0(a5)
    2928:	fef42623          	sw	a5,-20(s0)
    292c:	fec42783          	lw	a5,-20(s0)
    2930:	00078513          	mv	a0,a5
    2934:	02c12403          	lw	s0,44(sp)
    2938:	03010113          	addi	sp,sp,48
    293c:	00008067          	ret

00002940 <gpio_irq_edge>:
    2940:	fe010113          	addi	sp,sp,-32
    2944:	00812e23          	sw	s0,28(sp)
    2948:	02010413          	addi	s0,sp,32
    294c:	fea42623          	sw	a0,-20(s0)
    2950:	7501a783          	lw	a5,1872(gp) # 54e8 <CSRA_EDGE>
    2954:	00078713          	mv	a4,a5
    2958:	fec42783          	lw	a5,-20(s0)
    295c:	00f72023          	sw	a5,0(a4)
    2960:	7501a783          	lw	a5,1872(gp) # 54e8 <CSRA_EDGE>
    2964:	0007a783          	lw	a5,0(a5)
    2968:	fef42623          	sw	a5,-20(s0)
    296c:	fec42783          	lw	a5,-20(s0)
    2970:	00078513          	mv	a0,a5
    2974:	01c12403          	lw	s0,28(sp)
    2978:	02010113          	addi	sp,sp,32
    297c:	00008067          	ret

00002980 <gpio_irq_pol>:
    2980:	fe010113          	addi	sp,sp,-32
    2984:	00812e23          	sw	s0,28(sp)
    2988:	02010413          	addi	s0,sp,32
    298c:	fea42623          	sw	a0,-20(s0)
    2990:	7541a783          	lw	a5,1876(gp) # 54ec <CSRA_POL>
    2994:	00078713          	mv	a4,a5
    2998:	fec42783          	lw	a5,-20(s0)
    299c:	00f72023          	sw	a5,0(a4)
    29a0:	7541a783          	lw	a5,1876(gp) # 54ec <CSRA_POL>
    29a4:	0007a783          	lw	a5,0(a5)
    29a8:	fef42623          	sw	a5,-20(s0)
    29ac:	fec42783          	lw	a5,-20(s0)
    29b0:	00078513          	mv	a0,a5
    29b4:	01c12403          	lw	s0,28(sp)
    29b8:	02010113          	addi	sp,sp,32
    29bc:	00008067          	ret

000029c0 <gpio_irq_read>:
    29c0:	fe010113          	addi	sp,sp,-32
    29c4:	00812e23          	sw	s0,28(sp)
    29c8:	02010413          	addi	s0,sp,32
    29cc:	74c1a783          	lw	a5,1868(gp) # 54e4 <CSRA_IRQ>
    29d0:	0007a783          	lw	a5,0(a5)
    29d4:	fef42623          	sw	a5,-20(s0)
    29d8:	fec42783          	lw	a5,-20(s0)
    29dc:	00078513          	mv	a0,a5
    29e0:	01c12403          	lw	s0,28(sp)
    29e4:	02010113          	addi	sp,sp,32
    29e8:	00008067          	ret

000029ec <gpio_irq_clear>:
    29ec:	fd010113          	addi	sp,sp,-48
    29f0:	02812623          	sw	s0,44(sp)
    29f4:	03010413          	addi	s0,sp,48
    29f8:	fca42e23          	sw	a0,-36(s0)
    29fc:	74c1a783          	lw	a5,1868(gp) # 54e4 <CSRA_IRQ>
    2a00:	0007a783          	lw	a5,0(a5)
    2a04:	fef42623          	sw	a5,-20(s0)
    2a08:	fec42703          	lw	a4,-20(s0)
    2a0c:	fdc42783          	lw	a5,-36(s0)
    2a10:	00f777b3          	and	a5,a4,a5
    2a14:	fef42623          	sw	a5,-20(s0)
    2a18:	74c1a783          	lw	a5,1868(gp) # 54e4 <CSRA_IRQ>
    2a1c:	00078713          	mv	a4,a5
    2a20:	fec42783          	lw	a5,-20(s0)
    2a24:	00f72023          	sw	a5,0(a4)
    2a28:	74c1a783          	lw	a5,1868(gp) # 54e4 <CSRA_IRQ>
    2a2c:	0007a783          	lw	a5,0(a5)
    2a30:	fcf42e23          	sw	a5,-36(s0)
    2a34:	fdc42783          	lw	a5,-36(s0)
    2a38:	00078513          	mv	a0,a5
    2a3c:	02c12403          	lw	s0,44(sp)
    2a40:	03010113          	addi	sp,sp,48
    2a44:	00008067          	ret

00002a48 <gpio_csr>:
    2a48:	fe010113          	addi	sp,sp,-32
    2a4c:	00112e23          	sw	ra,28(sp)
    2a50:	00812c23          	sw	s0,24(sp)
    2a54:	02010413          	addi	s0,sp,32
    2a58:	7341a783          	lw	a5,1844(gp) # 54cc <CSRA_VERSION>
    2a5c:	0007a783          	lw	a5,0(a5)
    2a60:	fef42623          	sw	a5,-20(s0)
    2a64:	fec42583          	lw	a1,-20(s0)
    2a68:	36818513          	addi	a0,gp,872 # 5100 <__FUNCTION__.0+0x2c>
    2a6c:	891fd0ef          	jal	2fc <my_printf>
    2a70:	7381a783          	lw	a5,1848(gp) # 54d0 <CSRA_NAME>
    2a74:	0007a783          	lw	a5,0(a5)
    2a78:	fef42623          	sw	a5,-20(s0)
    2a7c:	fec42583          	lw	a1,-20(s0)
    2a80:	38018513          	addi	a0,gp,896 # 5118 <__FUNCTION__.0+0x44>
    2a84:	879fd0ef          	jal	2fc <my_printf>
    2a88:	73c1a783          	lw	a5,1852(gp) # 54d4 <CSRA_DIR>
    2a8c:	0007a783          	lw	a5,0(a5)
    2a90:	fef42623          	sw	a5,-20(s0)
    2a94:	fec42583          	lw	a1,-20(s0)
    2a98:	39818513          	addi	a0,gp,920 # 5130 <__FUNCTION__.0+0x5c>
    2a9c:	861fd0ef          	jal	2fc <my_printf>
    2aa0:	7401a783          	lw	a5,1856(gp) # 54d8 <CSRA_INPUT>
    2aa4:	0007a783          	lw	a5,0(a5)
    2aa8:	fef42623          	sw	a5,-20(s0)
    2aac:	fec42583          	lw	a1,-20(s0)
    2ab0:	3b018513          	addi	a0,gp,944 # 5148 <__FUNCTION__.0+0x74>
    2ab4:	849fd0ef          	jal	2fc <my_printf>
    2ab8:	7441a783          	lw	a5,1860(gp) # 54dc <CSRA_OUTPUT>
    2abc:	0007a783          	lw	a5,0(a5)
    2ac0:	fef42623          	sw	a5,-20(s0)
    2ac4:	fec42583          	lw	a1,-20(s0)
    2ac8:	3c818513          	addi	a0,gp,968 # 5160 <__FUNCTION__.0+0x8c>
    2acc:	831fd0ef          	jal	2fc <my_printf>
    2ad0:	7481a783          	lw	a5,1864(gp) # 54e0 <CSRA_MASK>
    2ad4:	0007a783          	lw	a5,0(a5)
    2ad8:	fef42623          	sw	a5,-20(s0)
    2adc:	fec42583          	lw	a1,-20(s0)
    2ae0:	3e018513          	addi	a0,gp,992 # 5178 <__FUNCTION__.0+0xa4>
    2ae4:	819fd0ef          	jal	2fc <my_printf>
    2ae8:	74c1a783          	lw	a5,1868(gp) # 54e4 <CSRA_IRQ>
    2aec:	0007a783          	lw	a5,0(a5)
    2af0:	fef42623          	sw	a5,-20(s0)
    2af4:	fec42583          	lw	a1,-20(s0)
    2af8:	3f818513          	addi	a0,gp,1016 # 5190 <__FUNCTION__.0+0xbc>
    2afc:	801fd0ef          	jal	2fc <my_printf>
    2b00:	7501a783          	lw	a5,1872(gp) # 54e8 <CSRA_EDGE>
    2b04:	0007a783          	lw	a5,0(a5)
    2b08:	fef42623          	sw	a5,-20(s0)
    2b0c:	fec42583          	lw	a1,-20(s0)
    2b10:	41018513          	addi	a0,gp,1040 # 51a8 <__FUNCTION__.0+0xd4>
    2b14:	fe8fd0ef          	jal	2fc <my_printf>
    2b18:	7541a783          	lw	a5,1876(gp) # 54ec <CSRA_POL>
    2b1c:	0007a783          	lw	a5,0(a5)
    2b20:	fef42623          	sw	a5,-20(s0)
    2b24:	fec42583          	lw	a1,-20(s0)
    2b28:	42818513          	addi	a0,gp,1064 # 51c0 <__FUNCTION__.0+0xec>
    2b2c:	fd0fd0ef          	jal	2fc <my_printf>
    2b30:	00000013          	nop
    2b34:	01c12083          	lw	ra,28(sp)
    2b38:	01812403          	lw	s0,24(sp)
    2b3c:	02010113          	addi	sp,sp,32
    2b40:	00008067          	ret

00002b44 <gpio_set_addr>:
    2b44:	fe010113          	addi	sp,sp,-32
    2b48:	00812e23          	sw	s0,28(sp)
    2b4c:	02010413          	addi	s0,sp,32
    2b50:	fea42623          	sw	a0,-20(s0)
    2b54:	fec42703          	lw	a4,-20(s0)
    2b58:	72e1a823          	sw	a4,1840(gp) # 54c8 <ADDR_GPIO>
    2b5c:	fec42703          	lw	a4,-20(s0)
    2b60:	72e1aa23          	sw	a4,1844(gp) # 54cc <CSRA_VERSION>
    2b64:	fec42783          	lw	a5,-20(s0)
    2b68:	00478713          	addi	a4,a5,4
    2b6c:	72e1ac23          	sw	a4,1848(gp) # 54d0 <CSRA_NAME>
    2b70:	fec42783          	lw	a5,-20(s0)
    2b74:	01078713          	addi	a4,a5,16
    2b78:	72e1ae23          	sw	a4,1852(gp) # 54d4 <CSRA_DIR>
    2b7c:	fec42783          	lw	a5,-20(s0)
    2b80:	01478713          	addi	a4,a5,20
    2b84:	74e1a023          	sw	a4,1856(gp) # 54d8 <CSRA_INPUT>
    2b88:	fec42783          	lw	a5,-20(s0)
    2b8c:	01878713          	addi	a4,a5,24
    2b90:	74e1a223          	sw	a4,1860(gp) # 54dc <CSRA_OUTPUT>
    2b94:	fec42783          	lw	a5,-20(s0)
    2b98:	01c78713          	addi	a4,a5,28
    2b9c:	74e1a423          	sw	a4,1864(gp) # 54e0 <CSRA_MASK>
    2ba0:	fec42783          	lw	a5,-20(s0)
    2ba4:	02078713          	addi	a4,a5,32
    2ba8:	74e1a623          	sw	a4,1868(gp) # 54e4 <CSRA_IRQ>
    2bac:	fec42783          	lw	a5,-20(s0)
    2bb0:	02478713          	addi	a4,a5,36
    2bb4:	74e1a823          	sw	a4,1872(gp) # 54e8 <CSRA_EDGE>
    2bb8:	fec42783          	lw	a5,-20(s0)
    2bbc:	02878713          	addi	a4,a5,40
    2bc0:	74e1aa23          	sw	a4,1876(gp) # 54ec <CSRA_POL>
    2bc4:	00000793          	li	a5,0
    2bc8:	00078513          	mv	a0,a5
    2bcc:	01c12403          	lw	s0,28(sp)
    2bd0:	02010113          	addi	sp,sp,32
    2bd4:	00008067          	ret

00002bd8 <gpio_get_addr>:
    2bd8:	ff010113          	addi	sp,sp,-16
    2bdc:	00812623          	sw	s0,12(sp)
    2be0:	01010413          	addi	s0,sp,16
    2be4:	7301a783          	lw	a5,1840(gp) # 54c8 <ADDR_GPIO>
    2be8:	00078513          	mv	a0,a5
    2bec:	00c12403          	lw	s0,12(sp)
    2bf0:	01010113          	addi	sp,sp,16
    2bf4:	00008067          	ret

00002bf8 <eeprom_reset>:
    2bf8:	fe010113          	addi	sp,sp,-32
    2bfc:	00112e23          	sw	ra,28(sp)
    2c00:	00812c23          	sw	s0,24(sp)
    2c04:	02010413          	addi	s0,sp,32
    2c08:	05000793          	li	a5,80
    2c0c:	fef407a3          	sb	a5,-17(s0)
    2c10:	fff00793          	li	a5,-1
    2c14:	fef40723          	sb	a5,-18(s0)
    2c18:	fee44703          	lbu	a4,-18(s0)
    2c1c:	fef44783          	lbu	a5,-17(s0)
    2c20:	00070613          	mv	a2,a4
    2c24:	00000593          	li	a1,0
    2c28:	00078513          	mv	a0,a5
    2c2c:	849fe0ef          	jal	1474 <i2c_write_d7r8>
    2c30:	00050793          	mv	a5,a0
    2c34:	02079863          	bnez	a5,2c64 <eeprom_reset+0x6c>
    2c38:	44018513          	addi	a0,gp,1088 # 51d8 <__FUNCTION__.0+0x104>
    2c3c:	ec0fd0ef          	jal	2fc <my_printf>
    2c40:	fee44703          	lbu	a4,-18(s0)
    2c44:	fef44783          	lbu	a5,-17(s0)
    2c48:	00070613          	mv	a2,a4
    2c4c:	00100593          	li	a1,1
    2c50:	00078513          	mv	a0,a5
    2c54:	821fe0ef          	jal	1474 <i2c_write_d7r8>
    2c58:	00050793          	mv	a5,a0
    2c5c:	02079463          	bnez	a5,2c84 <eeprom_reset+0x8c>
    2c60:	0100006f          	j	2c70 <eeprom_reset+0x78>
    2c64:	46018513          	addi	a0,gp,1120 # 51f8 <__FUNCTION__.0+0x124>
    2c68:	e94fd0ef          	jal	2fc <my_printf>
    2c6c:	0240006f          	j	2c90 <eeprom_reset+0x98>
    2c70:	47c18513          	addi	a0,gp,1148 # 5214 <__FUNCTION__.0+0x140>
    2c74:	e88fd0ef          	jal	2fc <my_printf>
    2c78:	49c18513          	addi	a0,gp,1180 # 5234 <__FUNCTION__.0+0x160>
    2c7c:	e80fd0ef          	jal	2fc <my_printf>
    2c80:	0100006f          	j	2c90 <eeprom_reset+0x98>
    2c84:	46018513          	addi	a0,gp,1120 # 51f8 <__FUNCTION__.0+0x124>
    2c88:	e74fd0ef          	jal	2fc <my_printf>
    2c8c:	00000013          	nop
    2c90:	01c12083          	lw	ra,28(sp)
    2c94:	01812403          	lw	s0,24(sp)
    2c98:	02010113          	addi	sp,sp,32
    2c9c:	00008067          	ret

00002ca0 <eeprom_test>:
    2ca0:	fe010113          	addi	sp,sp,-32
    2ca4:	00112e23          	sw	ra,28(sp)
    2ca8:	00812c23          	sw	s0,24(sp)
    2cac:	02010413          	addi	s0,sp,32
    2cb0:	fe0406a3          	sb	zero,-19(s0)
    2cb4:	03700793          	li	a5,55
    2cb8:	fef407a3          	sb	a5,-17(s0)
    2cbc:	05000793          	li	a5,80
    2cc0:	fef40723          	sb	a5,-18(s0)
    2cc4:	4bc18513          	addi	a0,gp,1212 # 5254 <__FUNCTION__.0+0x180>
    2cc8:	e34fd0ef          	jal	2fc <my_printf>
    2ccc:	fef44703          	lbu	a4,-17(s0)
    2cd0:	fee44783          	lbu	a5,-18(s0)
    2cd4:	00070613          	mv	a2,a4
    2cd8:	00000593          	li	a1,0
    2cdc:	00078513          	mv	a0,a5
    2ce0:	f94fe0ef          	jal	1474 <i2c_write_d7r8>
    2ce4:	00050793          	mv	a5,a0
    2ce8:	00079c63          	bnez	a5,2d00 <eeprom_test+0x60>
    2cec:	fef44783          	lbu	a5,-17(s0)
    2cf0:	00078593          	mv	a1,a5
    2cf4:	4d818513          	addi	a0,gp,1240 # 5270 <__FUNCTION__.0+0x19c>
    2cf8:	e04fd0ef          	jal	2fc <my_printf>
    2cfc:	00c0006f          	j	2d08 <eeprom_test+0x68>
    2d00:	4f418513          	addi	a0,gp,1268 # 528c <__FUNCTION__.0+0x1b8>
    2d04:	df8fd0ef          	jal	2fc <my_printf>
    2d08:	fe042423          	sw	zero,-24(s0)
    2d0c:	0100006f          	j	2d1c <eeprom_test+0x7c>
    2d10:	fe842783          	lw	a5,-24(s0)
    2d14:	00178793          	addi	a5,a5,1
    2d18:	fef42423          	sw	a5,-24(s0)
    2d1c:	fe842703          	lw	a4,-24(s0)
    2d20:	009897b7          	lui	a5,0x989
    2d24:	67f78793          	addi	a5,a5,1663 # 98967f <_memory_end+0x96967f>
    2d28:	fee7d4e3          	bge	a5,a4,2d10 <eeprom_test+0x70>
    2d2c:	fed40713          	addi	a4,s0,-19
    2d30:	fee44783          	lbu	a5,-18(s0)
    2d34:	00070613          	mv	a2,a4
    2d38:	00000593          	li	a1,0
    2d3c:	00078513          	mv	a0,a5
    2d40:	a90fe0ef          	jal	fd0 <i2c_read_d7r8>
    2d44:	00050793          	mv	a5,a0
    2d48:	00079c63          	bnez	a5,2d60 <eeprom_test+0xc0>
    2d4c:	fed44783          	lbu	a5,-19(s0)
    2d50:	00078593          	mv	a1,a5
    2d54:	50c18513          	addi	a0,gp,1292 # 52a4 <__FUNCTION__.0+0x1d0>
    2d58:	da4fd0ef          	jal	2fc <my_printf>
    2d5c:	00c0006f          	j	2d68 <eeprom_test+0xc8>
    2d60:	52c18513          	addi	a0,gp,1324 # 52c4 <__FUNCTION__.0+0x1f0>
    2d64:	d98fd0ef          	jal	2fc <my_printf>
    2d68:	fed44783          	lbu	a5,-19(s0)
    2d6c:	fef44703          	lbu	a4,-17(s0)
    2d70:	00f71863          	bne	a4,a5,2d80 <eeprom_test+0xe0>
    2d74:	54018513          	addi	a0,gp,1344 # 52d8 <__FUNCTION__.0+0x204>
    2d78:	d84fd0ef          	jal	2fc <my_printf>
    2d7c:	00c0006f          	j	2d88 <eeprom_test+0xe8>
    2d80:	55c18513          	addi	a0,gp,1372 # 52f4 <__FUNCTION__.0+0x220>
    2d84:	d78fd0ef          	jal	2fc <my_printf>
    2d88:	00000013          	nop
    2d8c:	01c12083          	lw	ra,28(sp)
    2d90:	01812403          	lw	s0,24(sp)
    2d94:	02010113          	addi	sp,sp,32
    2d98:	00008067          	ret

00002d9c <keypad_init>:
    2d9c:	fe010113          	addi	sp,sp,-32
    2da0:	00112e23          	sw	ra,28(sp)
    2da4:	00812c23          	sw	s0,24(sp)
    2da8:	02010413          	addi	s0,sp,32
    2dac:	fea42623          	sw	a0,-20(s0)
    2db0:	fec42703          	lw	a4,-20(s0)
    2db4:	74e1ac23          	sw	a4,1880(gp) # 54f0 <keypad_gpio_addr>
    2db8:	fec42503          	lw	a0,-20(s0)
    2dbc:	d89ff0ef          	jal	2b44 <gpio_set_addr>
    2dc0:	0f000513          	li	a0,240
    2dc4:	a75ff0ef          	jal	2838 <gpio_write>
    2dc8:	00000013          	nop
    2dcc:	01c12083          	lw	ra,28(sp)
    2dd0:	01812403          	lw	s0,24(sp)
    2dd4:	02010113          	addi	sp,sp,32
    2dd8:	00008067          	ret

00002ddc <keypad_scan>:
    2ddc:	fd010113          	addi	sp,sp,-48
    2de0:	02112623          	sw	ra,44(sp)
    2de4:	02812423          	sw	s0,40(sp)
    2de8:	03010413          	addi	s0,sp,48
    2dec:	7581a783          	lw	a5,1880(gp) # 54f0 <keypad_gpio_addr>
    2df0:	00078513          	mv	a0,a5
    2df4:	d51ff0ef          	jal	2b44 <gpio_set_addr>
    2df8:	fe042623          	sw	zero,-20(s0)
    2dfc:	0cc0006f          	j	2ec8 <keypad_scan+0xec>
    2e00:	fec42783          	lw	a5,-20(s0)
    2e04:	00478793          	addi	a5,a5,4
    2e08:	00100713          	li	a4,1
    2e0c:	00f717b3          	sll	a5,a4,a5
    2e10:	fff7c793          	not	a5,a5
    2e14:	0f07f793          	andi	a5,a5,240
    2e18:	fef42223          	sw	a5,-28(s0)
    2e1c:	fe442503          	lw	a0,-28(s0)
    2e20:	a19ff0ef          	jal	2838 <gpio_write>
    2e24:	3e800793          	li	a5,1000
    2e28:	fcf42c23          	sw	a5,-40(s0)
    2e2c:	00000013          	nop
    2e30:	fd842783          	lw	a5,-40(s0)
    2e34:	fff78713          	addi	a4,a5,-1
    2e38:	fce42c23          	sw	a4,-40(s0)
    2e3c:	fe079ae3          	bnez	a5,2e30 <keypad_scan+0x54>
    2e40:	9cdff0ef          	jal	280c <gpio_read>
    2e44:	fea42023          	sw	a0,-32(s0)
    2e48:	fe042783          	lw	a5,-32(s0)
    2e4c:	0047d793          	srli	a5,a5,0x4
    2e50:	00f7f793          	andi	a5,a5,15
    2e54:	fcf42e23          	sw	a5,-36(s0)
    2e58:	fdc42703          	lw	a4,-36(s0)
    2e5c:	00f00793          	li	a5,15
    2e60:	04f70e63          	beq	a4,a5,2ebc <keypad_scan+0xe0>
    2e64:	fe042423          	sw	zero,-24(s0)
    2e68:	0480006f          	j	2eb0 <keypad_scan+0xd4>
    2e6c:	fe842783          	lw	a5,-24(s0)
    2e70:	00100713          	li	a4,1
    2e74:	00f717b3          	sll	a5,a4,a5
    2e78:	00078713          	mv	a4,a5
    2e7c:	fdc42783          	lw	a5,-36(s0)
    2e80:	00f777b3          	and	a5,a4,a5
    2e84:	02079063          	bnez	a5,2ea4 <keypad_scan+0xc8>
    2e88:	0f000513          	li	a0,240
    2e8c:	9adff0ef          	jal	2838 <gpio_write>
    2e90:	fec42783          	lw	a5,-20(s0)
    2e94:	00279713          	slli	a4,a5,0x2
    2e98:	fe842783          	lw	a5,-24(s0)
    2e9c:	00f707b3          	add	a5,a4,a5
    2ea0:	0400006f          	j	2ee0 <keypad_scan+0x104>
    2ea4:	fe842783          	lw	a5,-24(s0)
    2ea8:	00178793          	addi	a5,a5,1
    2eac:	fef42423          	sw	a5,-24(s0)
    2eb0:	fe842703          	lw	a4,-24(s0)
    2eb4:	00300793          	li	a5,3
    2eb8:	fae7dae3          	bge	a5,a4,2e6c <keypad_scan+0x90>
    2ebc:	fec42783          	lw	a5,-20(s0)
    2ec0:	00178793          	addi	a5,a5,1
    2ec4:	fef42623          	sw	a5,-20(s0)
    2ec8:	fec42703          	lw	a4,-20(s0)
    2ecc:	00300793          	li	a5,3
    2ed0:	f2e7d8e3          	bge	a5,a4,2e00 <keypad_scan+0x24>
    2ed4:	0f000513          	li	a0,240
    2ed8:	961ff0ef          	jal	2838 <gpio_write>
    2edc:	fff00793          	li	a5,-1
    2ee0:	00078513          	mv	a0,a5
    2ee4:	02c12083          	lw	ra,44(sp)
    2ee8:	02812403          	lw	s0,40(sp)
    2eec:	03010113          	addi	sp,sp,48
    2ef0:	00008067          	ret

00002ef4 <keypad_get_char>:
    2ef4:	fe010113          	addi	sp,sp,-32
    2ef8:	00112e23          	sw	ra,28(sp)
    2efc:	00812c23          	sw	s0,24(sp)
    2f00:	02010413          	addi	s0,sp,32
    2f04:	ed9ff0ef          	jal	2ddc <keypad_scan>
    2f08:	fea42623          	sw	a0,-20(s0)
    2f0c:	fec42783          	lw	a5,-20(s0)
    2f10:	0607c263          	bltz	a5,2f74 <keypad_get_char+0x80>
    2f14:	fec42703          	lw	a4,-20(s0)
    2f18:	00f00793          	li	a5,15
    2f1c:	04e7cc63          	blt	a5,a4,2f74 <keypad_get_char+0x80>
    2f20:	fec42783          	lw	a5,-20(s0)
    2f24:	41f7d713          	srai	a4,a5,0x1f
    2f28:	00377713          	andi	a4,a4,3
    2f2c:	00f707b3          	add	a5,a4,a5
    2f30:	4027d793          	srai	a5,a5,0x2
    2f34:	fef42423          	sw	a5,-24(s0)
    2f38:	fec42703          	lw	a4,-20(s0)
    2f3c:	41f75793          	srai	a5,a4,0x1f
    2f40:	01e7d793          	srli	a5,a5,0x1e
    2f44:	00f70733          	add	a4,a4,a5
    2f48:	00377713          	andi	a4,a4,3
    2f4c:	40f707b3          	sub	a5,a4,a5
    2f50:	fef42223          	sw	a5,-28(s0)
    2f54:	57818713          	addi	a4,gp,1400 # 5310 <keypad_map>
    2f58:	fe842783          	lw	a5,-24(s0)
    2f5c:	00279793          	slli	a5,a5,0x2
    2f60:	00f70733          	add	a4,a4,a5
    2f64:	fe442783          	lw	a5,-28(s0)
    2f68:	00f707b3          	add	a5,a4,a5
    2f6c:	0007c783          	lbu	a5,0(a5)
    2f70:	0080006f          	j	2f78 <keypad_get_char+0x84>
    2f74:	00000793          	li	a5,0
    2f78:	00078513          	mv	a0,a5
    2f7c:	01c12083          	lw	ra,28(sp)
    2f80:	01812403          	lw	s0,24(sp)
    2f84:	02010113          	addi	sp,sp,32
    2f88:	00008067          	ret

00002f8c <keypad_delay_ms>:
    2f8c:	fd010113          	addi	sp,sp,-48
    2f90:	02812623          	sw	s0,44(sp)
    2f94:	03010413          	addi	s0,sp,48
    2f98:	fca42e23          	sw	a0,-36(s0)
    2f9c:	fdc42703          	lw	a4,-36(s0)
    2fa0:	000187b7          	lui	a5,0x18
    2fa4:	6a078793          	addi	a5,a5,1696 # 186a0 <_bss_end+0x131a4>
    2fa8:	02f707b3          	mul	a5,a4,a5
    2fac:	fef42623          	sw	a5,-20(s0)
    2fb0:	0080006f          	j	2fb8 <keypad_delay_ms+0x2c>
    2fb4:	00000013          	nop
    2fb8:	fec42783          	lw	a5,-20(s0)
    2fbc:	fff78713          	addi	a4,a5,-1
    2fc0:	fee42623          	sw	a4,-20(s0)
    2fc4:	fe0798e3          	bnez	a5,2fb4 <keypad_delay_ms+0x28>
    2fc8:	00000013          	nop
    2fcc:	00000013          	nop
    2fd0:	02c12403          	lw	s0,44(sp)
    2fd4:	03010113          	addi	sp,sp,48
    2fd8:	00008067          	ret

00002fdc <keypad_wait_key>:
    2fdc:	fe010113          	addi	sp,sp,-32
    2fe0:	00112e23          	sw	ra,28(sp)
    2fe4:	00812c23          	sw	s0,24(sp)
    2fe8:	02010413          	addi	s0,sp,32
    2fec:	f09ff0ef          	jal	2ef4 <keypad_get_char>
    2ff0:	00050793          	mv	a5,a0
    2ff4:	fef407a3          	sb	a5,-17(s0)
    2ff8:	fef44783          	lbu	a5,-17(s0)
    2ffc:	04078263          	beqz	a5,3040 <keypad_wait_key+0x64>
    3000:	03200513          	li	a0,50
    3004:	f89ff0ef          	jal	2f8c <keypad_delay_ms>
    3008:	eedff0ef          	jal	2ef4 <keypad_get_char>
    300c:	00050793          	mv	a5,a0
    3010:	fef40723          	sb	a5,-18(s0)
    3014:	fee44703          	lbu	a4,-18(s0)
    3018:	fef44783          	lbu	a5,-17(s0)
    301c:	02f71263          	bne	a4,a5,3040 <keypad_wait_key+0x64>
    3020:	00c0006f          	j	302c <keypad_wait_key+0x50>
    3024:	00a00513          	li	a0,10
    3028:	f65ff0ef          	jal	2f8c <keypad_delay_ms>
    302c:	ec9ff0ef          	jal	2ef4 <keypad_get_char>
    3030:	00050793          	mv	a5,a0
    3034:	fe0798e3          	bnez	a5,3024 <keypad_wait_key+0x48>
    3038:	fef44783          	lbu	a5,-17(s0)
    303c:	0100006f          	j	304c <keypad_wait_key+0x70>
    3040:	00a00513          	li	a0,10
    3044:	f49ff0ef          	jal	2f8c <keypad_delay_ms>
    3048:	fa5ff06f          	j	2fec <keypad_wait_key+0x10>
    304c:	00078513          	mv	a0,a5
    3050:	01c12083          	lw	ra,28(sp)
    3054:	01812403          	lw	s0,24(sp)
    3058:	02010113          	addi	sp,sp,32
    305c:	00008067          	ret

00003060 <__adddf3>:
    3060:	00100837          	lui	a6,0x100
    3064:	fff80813          	addi	a6,a6,-1 # fffff <_memory_end+0xdffff>
    3068:	fe010113          	addi	sp,sp,-32
    306c:	00b878b3          	and	a7,a6,a1
    3070:	0145d713          	srli	a4,a1,0x14
    3074:	01d55793          	srli	a5,a0,0x1d
    3078:	00d87833          	and	a6,a6,a3
    307c:	00912a23          	sw	s1,20(sp)
    3080:	7ff77493          	andi	s1,a4,2047
    3084:	00389713          	slli	a4,a7,0x3
    3088:	0146d893          	srli	a7,a3,0x14
    308c:	00381813          	slli	a6,a6,0x3
    3090:	01212823          	sw	s2,16(sp)
    3094:	00e7e7b3          	or	a5,a5,a4
    3098:	7ff8f893          	andi	a7,a7,2047
    309c:	01d65713          	srli	a4,a2,0x1d
    30a0:	00112e23          	sw	ra,28(sp)
    30a4:	00812c23          	sw	s0,24(sp)
    30a8:	01312623          	sw	s3,12(sp)
    30ac:	01f5d913          	srli	s2,a1,0x1f
    30b0:	01f6d693          	srli	a3,a3,0x1f
    30b4:	01076733          	or	a4,a4,a6
    30b8:	00351513          	slli	a0,a0,0x3
    30bc:	00361613          	slli	a2,a2,0x3
    30c0:	41148833          	sub	a6,s1,a7
    30c4:	2ad91a63          	bne	s2,a3,3378 <__adddf3+0x318>
    30c8:	11005c63          	blez	a6,31e0 <__adddf3+0x180>
    30cc:	04089063          	bnez	a7,310c <__adddf3+0xac>
    30d0:	00c766b3          	or	a3,a4,a2
    30d4:	66068063          	beqz	a3,3734 <__adddf3+0x6d4>
    30d8:	fff80593          	addi	a1,a6,-1
    30dc:	02059063          	bnez	a1,30fc <__adddf3+0x9c>
    30e0:	00c50633          	add	a2,a0,a2
    30e4:	00a636b3          	sltu	a3,a2,a0
    30e8:	00e78733          	add	a4,a5,a4
    30ec:	00060513          	mv	a0,a2
    30f0:	00d707b3          	add	a5,a4,a3
    30f4:	00100493          	li	s1,1
    30f8:	06c0006f          	j	3164 <__adddf3+0x104>
    30fc:	7ff00693          	li	a3,2047
    3100:	02d81063          	bne	a6,a3,3120 <__adddf3+0xc0>
    3104:	7ff00493          	li	s1,2047
    3108:	1f80006f          	j	3300 <__adddf3+0x2a0>
    310c:	7ff00693          	li	a3,2047
    3110:	1ed48863          	beq	s1,a3,3300 <__adddf3+0x2a0>
    3114:	008006b7          	lui	a3,0x800
    3118:	00d76733          	or	a4,a4,a3
    311c:	00080593          	mv	a1,a6
    3120:	03800693          	li	a3,56
    3124:	0ab6c863          	blt	a3,a1,31d4 <__adddf3+0x174>
    3128:	01f00693          	li	a3,31
    312c:	06b6ca63          	blt	a3,a1,31a0 <__adddf3+0x140>
    3130:	02000813          	li	a6,32
    3134:	40b80833          	sub	a6,a6,a1
    3138:	010716b3          	sll	a3,a4,a6
    313c:	00b658b3          	srl	a7,a2,a1
    3140:	01061833          	sll	a6,a2,a6
    3144:	0116e6b3          	or	a3,a3,a7
    3148:	01003833          	snez	a6,a6
    314c:	0106e6b3          	or	a3,a3,a6
    3150:	00b755b3          	srl	a1,a4,a1
    3154:	00a68533          	add	a0,a3,a0
    3158:	00f585b3          	add	a1,a1,a5
    315c:	00d536b3          	sltu	a3,a0,a3
    3160:	00d587b3          	add	a5,a1,a3
    3164:	00879713          	slli	a4,a5,0x8
    3168:	18075c63          	bgez	a4,3300 <__adddf3+0x2a0>
    316c:	00148493          	addi	s1,s1,1
    3170:	7ff00713          	li	a4,2047
    3174:	5ae48a63          	beq	s1,a4,3728 <__adddf3+0x6c8>
    3178:	ff800737          	lui	a4,0xff800
    317c:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    3180:	00e7f733          	and	a4,a5,a4
    3184:	00155793          	srli	a5,a0,0x1
    3188:	00157513          	andi	a0,a0,1
    318c:	00a7e7b3          	or	a5,a5,a0
    3190:	01f71513          	slli	a0,a4,0x1f
    3194:	00f56533          	or	a0,a0,a5
    3198:	00175793          	srli	a5,a4,0x1
    319c:	1640006f          	j	3300 <__adddf3+0x2a0>
    31a0:	fe058693          	addi	a3,a1,-32
    31a4:	02000893          	li	a7,32
    31a8:	00d756b3          	srl	a3,a4,a3
    31ac:	00000813          	li	a6,0
    31b0:	01158863          	beq	a1,a7,31c0 <__adddf3+0x160>
    31b4:	04000813          	li	a6,64
    31b8:	40b80833          	sub	a6,a6,a1
    31bc:	01071833          	sll	a6,a4,a6
    31c0:	00c86833          	or	a6,a6,a2
    31c4:	01003833          	snez	a6,a6
    31c8:	0106e6b3          	or	a3,a3,a6
    31cc:	00000593          	li	a1,0
    31d0:	f85ff06f          	j	3154 <__adddf3+0xf4>
    31d4:	00c766b3          	or	a3,a4,a2
    31d8:	00d036b3          	snez	a3,a3
    31dc:	ff1ff06f          	j	31cc <__adddf3+0x16c>
    31e0:	0c080a63          	beqz	a6,32b4 <__adddf3+0x254>
    31e4:	409886b3          	sub	a3,a7,s1
    31e8:	02049463          	bnez	s1,3210 <__adddf3+0x1b0>
    31ec:	00a7e5b3          	or	a1,a5,a0
    31f0:	50058e63          	beqz	a1,370c <__adddf3+0x6ac>
    31f4:	fff68593          	addi	a1,a3,-1 # 7fffff <_memory_end+0x7dffff>
    31f8:	ee0584e3          	beqz	a1,30e0 <__adddf3+0x80>
    31fc:	7ff00813          	li	a6,2047
    3200:	03069263          	bne	a3,a6,3224 <__adddf3+0x1c4>
    3204:	00070793          	mv	a5,a4
    3208:	00060513          	mv	a0,a2
    320c:	ef9ff06f          	j	3104 <__adddf3+0xa4>
    3210:	7ff00593          	li	a1,2047
    3214:	feb888e3          	beq	a7,a1,3204 <__adddf3+0x1a4>
    3218:	008005b7          	lui	a1,0x800
    321c:	00b7e7b3          	or	a5,a5,a1
    3220:	00068593          	mv	a1,a3
    3224:	03800693          	li	a3,56
    3228:	08b6c063          	blt	a3,a1,32a8 <__adddf3+0x248>
    322c:	01f00693          	li	a3,31
    3230:	04b6c263          	blt	a3,a1,3274 <__adddf3+0x214>
    3234:	02000813          	li	a6,32
    3238:	40b80833          	sub	a6,a6,a1
    323c:	010796b3          	sll	a3,a5,a6
    3240:	00b55333          	srl	t1,a0,a1
    3244:	01051833          	sll	a6,a0,a6
    3248:	0066e6b3          	or	a3,a3,t1
    324c:	01003833          	snez	a6,a6
    3250:	0106e6b3          	or	a3,a3,a6
    3254:	00b7d5b3          	srl	a1,a5,a1
    3258:	00c68633          	add	a2,a3,a2
    325c:	00e585b3          	add	a1,a1,a4
    3260:	00d636b3          	sltu	a3,a2,a3
    3264:	00060513          	mv	a0,a2
    3268:	00d587b3          	add	a5,a1,a3
    326c:	00088493          	mv	s1,a7
    3270:	ef5ff06f          	j	3164 <__adddf3+0x104>
    3274:	fe058693          	addi	a3,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    3278:	02000313          	li	t1,32
    327c:	00d7d6b3          	srl	a3,a5,a3
    3280:	00000813          	li	a6,0
    3284:	00658863          	beq	a1,t1,3294 <__adddf3+0x234>
    3288:	04000813          	li	a6,64
    328c:	40b80833          	sub	a6,a6,a1
    3290:	01079833          	sll	a6,a5,a6
    3294:	00a86833          	or	a6,a6,a0
    3298:	01003833          	snez	a6,a6
    329c:	0106e6b3          	or	a3,a3,a6
    32a0:	00000593          	li	a1,0
    32a4:	fb5ff06f          	j	3258 <__adddf3+0x1f8>
    32a8:	00a7e6b3          	or	a3,a5,a0
    32ac:	00d036b3          	snez	a3,a3
    32b0:	ff1ff06f          	j	32a0 <__adddf3+0x240>
    32b4:	00148693          	addi	a3,s1,1
    32b8:	7fe6f593          	andi	a1,a3,2046
    32bc:	08059663          	bnez	a1,3348 <__adddf3+0x2e8>
    32c0:	00a7e6b3          	or	a3,a5,a0
    32c4:	06049263          	bnez	s1,3328 <__adddf3+0x2c8>
    32c8:	44068863          	beqz	a3,3718 <__adddf3+0x6b8>
    32cc:	00c766b3          	or	a3,a4,a2
    32d0:	02068863          	beqz	a3,3300 <__adddf3+0x2a0>
    32d4:	00c50633          	add	a2,a0,a2
    32d8:	00a636b3          	sltu	a3,a2,a0
    32dc:	00e78733          	add	a4,a5,a4
    32e0:	00d707b3          	add	a5,a4,a3
    32e4:	00879713          	slli	a4,a5,0x8
    32e8:	00060513          	mv	a0,a2
    32ec:	00075a63          	bgez	a4,3300 <__adddf3+0x2a0>
    32f0:	ff800737          	lui	a4,0xff800
    32f4:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    32f8:	00e7f7b3          	and	a5,a5,a4
    32fc:	00100493          	li	s1,1
    3300:	00757713          	andi	a4,a0,7
    3304:	44070863          	beqz	a4,3754 <__adddf3+0x6f4>
    3308:	00f57713          	andi	a4,a0,15
    330c:	00400693          	li	a3,4
    3310:	44d70263          	beq	a4,a3,3754 <__adddf3+0x6f4>
    3314:	00450713          	addi	a4,a0,4 # 90030004 <_memory_end+0x90010004>
    3318:	00a736b3          	sltu	a3,a4,a0
    331c:	00d787b3          	add	a5,a5,a3
    3320:	00070513          	mv	a0,a4
    3324:	4300006f          	j	3754 <__adddf3+0x6f4>
    3328:	ec068ee3          	beqz	a3,3204 <__adddf3+0x1a4>
    332c:	00c76633          	or	a2,a4,a2
    3330:	dc060ae3          	beqz	a2,3104 <__adddf3+0xa4>
    3334:	00000913          	li	s2,0
    3338:	004007b7          	lui	a5,0x400
    333c:	00000513          	li	a0,0
    3340:	7ff00493          	li	s1,2047
    3344:	4100006f          	j	3754 <__adddf3+0x6f4>
    3348:	7ff00593          	li	a1,2047
    334c:	3cb68c63          	beq	a3,a1,3724 <__adddf3+0x6c4>
    3350:	00c50633          	add	a2,a0,a2
    3354:	00a63533          	sltu	a0,a2,a0
    3358:	00e78733          	add	a4,a5,a4
    335c:	00a70733          	add	a4,a4,a0
    3360:	01f71513          	slli	a0,a4,0x1f
    3364:	00165613          	srli	a2,a2,0x1
    3368:	00c56533          	or	a0,a0,a2
    336c:	00175793          	srli	a5,a4,0x1
    3370:	00068493          	mv	s1,a3
    3374:	f8dff06f          	j	3300 <__adddf3+0x2a0>
    3378:	0f005c63          	blez	a6,3470 <__adddf3+0x410>
    337c:	08089e63          	bnez	a7,3418 <__adddf3+0x3b8>
    3380:	00c766b3          	or	a3,a4,a2
    3384:	3a068863          	beqz	a3,3734 <__adddf3+0x6d4>
    3388:	fff80693          	addi	a3,a6,-1
    338c:	02069063          	bnez	a3,33ac <__adddf3+0x34c>
    3390:	40c50633          	sub	a2,a0,a2
    3394:	00c536b3          	sltu	a3,a0,a2
    3398:	40e78733          	sub	a4,a5,a4
    339c:	00060513          	mv	a0,a2
    33a0:	40d707b3          	sub	a5,a4,a3
    33a4:	00100493          	li	s1,1
    33a8:	0540006f          	j	33fc <__adddf3+0x39c>
    33ac:	7ff00593          	li	a1,2047
    33b0:	d4b80ae3          	beq	a6,a1,3104 <__adddf3+0xa4>
    33b4:	03800593          	li	a1,56
    33b8:	0ad5c663          	blt	a1,a3,3464 <__adddf3+0x404>
    33bc:	01f00593          	li	a1,31
    33c0:	06d5c863          	blt	a1,a3,3430 <__adddf3+0x3d0>
    33c4:	02000813          	li	a6,32
    33c8:	40d80833          	sub	a6,a6,a3
    33cc:	00d658b3          	srl	a7,a2,a3
    33d0:	010715b3          	sll	a1,a4,a6
    33d4:	01061833          	sll	a6,a2,a6
    33d8:	0115e5b3          	or	a1,a1,a7
    33dc:	01003833          	snez	a6,a6
    33e0:	0105e633          	or	a2,a1,a6
    33e4:	00d756b3          	srl	a3,a4,a3
    33e8:	40c50633          	sub	a2,a0,a2
    33ec:	00c53733          	sltu	a4,a0,a2
    33f0:	40d786b3          	sub	a3,a5,a3
    33f4:	00060513          	mv	a0,a2
    33f8:	40e687b3          	sub	a5,a3,a4
    33fc:	00879713          	slli	a4,a5,0x8
    3400:	f00750e3          	bgez	a4,3300 <__adddf3+0x2a0>
    3404:	00800437          	lui	s0,0x800
    3408:	fff40413          	addi	s0,s0,-1 # 7fffff <_memory_end+0x7dffff>
    340c:	0087f433          	and	s0,a5,s0
    3410:	00050993          	mv	s3,a0
    3414:	2100006f          	j	3624 <__adddf3+0x5c4>
    3418:	7ff00693          	li	a3,2047
    341c:	eed482e3          	beq	s1,a3,3300 <__adddf3+0x2a0>
    3420:	008006b7          	lui	a3,0x800
    3424:	00d76733          	or	a4,a4,a3
    3428:	00080693          	mv	a3,a6
    342c:	f89ff06f          	j	33b4 <__adddf3+0x354>
    3430:	fe068593          	addi	a1,a3,-32 # 7fffe0 <_memory_end+0x7dffe0>
    3434:	02000893          	li	a7,32
    3438:	00b755b3          	srl	a1,a4,a1
    343c:	00000813          	li	a6,0
    3440:	01168863          	beq	a3,a7,3450 <__adddf3+0x3f0>
    3444:	04000813          	li	a6,64
    3448:	40d80833          	sub	a6,a6,a3
    344c:	01071833          	sll	a6,a4,a6
    3450:	00c86833          	or	a6,a6,a2
    3454:	01003833          	snez	a6,a6
    3458:	0105e633          	or	a2,a1,a6
    345c:	00000693          	li	a3,0
    3460:	f89ff06f          	j	33e8 <__adddf3+0x388>
    3464:	00c76633          	or	a2,a4,a2
    3468:	00c03633          	snez	a2,a2
    346c:	ff1ff06f          	j	345c <__adddf3+0x3fc>
    3470:	0e080863          	beqz	a6,3560 <__adddf3+0x500>
    3474:	40988833          	sub	a6,a7,s1
    3478:	04049263          	bnez	s1,34bc <__adddf3+0x45c>
    347c:	00a7e5b3          	or	a1,a5,a0
    3480:	2a058e63          	beqz	a1,373c <__adddf3+0x6dc>
    3484:	fff80593          	addi	a1,a6,-1
    3488:	00059e63          	bnez	a1,34a4 <__adddf3+0x444>
    348c:	40a60533          	sub	a0,a2,a0
    3490:	40f70733          	sub	a4,a4,a5
    3494:	00a63633          	sltu	a2,a2,a0
    3498:	40c707b3          	sub	a5,a4,a2
    349c:	00068913          	mv	s2,a3
    34a0:	f05ff06f          	j	33a4 <__adddf3+0x344>
    34a4:	7ff00313          	li	t1,2047
    34a8:	02681463          	bne	a6,t1,34d0 <__adddf3+0x470>
    34ac:	00070793          	mv	a5,a4
    34b0:	00060513          	mv	a0,a2
    34b4:	7ff00493          	li	s1,2047
    34b8:	0d00006f          	j	3588 <__adddf3+0x528>
    34bc:	7ff00593          	li	a1,2047
    34c0:	feb886e3          	beq	a7,a1,34ac <__adddf3+0x44c>
    34c4:	008005b7          	lui	a1,0x800
    34c8:	00b7e7b3          	or	a5,a5,a1
    34cc:	00080593          	mv	a1,a6
    34d0:	03800813          	li	a6,56
    34d4:	08b84063          	blt	a6,a1,3554 <__adddf3+0x4f4>
    34d8:	01f00813          	li	a6,31
    34dc:	04b84263          	blt	a6,a1,3520 <__adddf3+0x4c0>
    34e0:	02000313          	li	t1,32
    34e4:	40b30333          	sub	t1,t1,a1
    34e8:	00b55e33          	srl	t3,a0,a1
    34ec:	00679833          	sll	a6,a5,t1
    34f0:	00651333          	sll	t1,a0,t1
    34f4:	01c86833          	or	a6,a6,t3
    34f8:	00603333          	snez	t1,t1
    34fc:	00686533          	or	a0,a6,t1
    3500:	00b7d5b3          	srl	a1,a5,a1
    3504:	40a60533          	sub	a0,a2,a0
    3508:	40b705b3          	sub	a1,a4,a1
    350c:	00a63633          	sltu	a2,a2,a0
    3510:	40c587b3          	sub	a5,a1,a2
    3514:	00088493          	mv	s1,a7
    3518:	00068913          	mv	s2,a3
    351c:	ee1ff06f          	j	33fc <__adddf3+0x39c>
    3520:	fe058813          	addi	a6,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    3524:	02000e13          	li	t3,32
    3528:	0107d833          	srl	a6,a5,a6
    352c:	00000313          	li	t1,0
    3530:	01c58863          	beq	a1,t3,3540 <__adddf3+0x4e0>
    3534:	04000313          	li	t1,64
    3538:	40b30333          	sub	t1,t1,a1
    353c:	00679333          	sll	t1,a5,t1
    3540:	00a36333          	or	t1,t1,a0
    3544:	00603333          	snez	t1,t1
    3548:	00686533          	or	a0,a6,t1
    354c:	00000593          	li	a1,0
    3550:	fb5ff06f          	j	3504 <__adddf3+0x4a4>
    3554:	00a7e533          	or	a0,a5,a0
    3558:	00a03533          	snez	a0,a0
    355c:	ff1ff06f          	j	354c <__adddf3+0x4ec>
    3560:	00148593          	addi	a1,s1,1
    3564:	7fe5f593          	andi	a1,a1,2046
    3568:	08059663          	bnez	a1,35f4 <__adddf3+0x594>
    356c:	00a7e833          	or	a6,a5,a0
    3570:	00c765b3          	or	a1,a4,a2
    3574:	06049063          	bnez	s1,35d4 <__adddf3+0x574>
    3578:	00081c63          	bnez	a6,3590 <__adddf3+0x530>
    357c:	10058e63          	beqz	a1,3698 <__adddf3+0x638>
    3580:	00070793          	mv	a5,a4
    3584:	00060513          	mv	a0,a2
    3588:	00068913          	mv	s2,a3
    358c:	d75ff06f          	j	3300 <__adddf3+0x2a0>
    3590:	d60588e3          	beqz	a1,3300 <__adddf3+0x2a0>
    3594:	40c50833          	sub	a6,a0,a2
    3598:	010538b3          	sltu	a7,a0,a6
    359c:	40e785b3          	sub	a1,a5,a4
    35a0:	411585b3          	sub	a1,a1,a7
    35a4:	00859893          	slli	a7,a1,0x8
    35a8:	0008dc63          	bgez	a7,35c0 <__adddf3+0x560>
    35ac:	40a60533          	sub	a0,a2,a0
    35b0:	40f70733          	sub	a4,a4,a5
    35b4:	00a63633          	sltu	a2,a2,a0
    35b8:	40c707b3          	sub	a5,a4,a2
    35bc:	fcdff06f          	j	3588 <__adddf3+0x528>
    35c0:	00b86533          	or	a0,a6,a1
    35c4:	18050463          	beqz	a0,374c <__adddf3+0x6ec>
    35c8:	00058793          	mv	a5,a1
    35cc:	00080513          	mv	a0,a6
    35d0:	d31ff06f          	j	3300 <__adddf3+0x2a0>
    35d4:	00081c63          	bnez	a6,35ec <__adddf3+0x58c>
    35d8:	d4058ee3          	beqz	a1,3334 <__adddf3+0x2d4>
    35dc:	00070793          	mv	a5,a4
    35e0:	00060513          	mv	a0,a2
    35e4:	00068913          	mv	s2,a3
    35e8:	b1dff06f          	j	3104 <__adddf3+0xa4>
    35ec:	b0058ce3          	beqz	a1,3104 <__adddf3+0xa4>
    35f0:	d45ff06f          	j	3334 <__adddf3+0x2d4>
    35f4:	40c505b3          	sub	a1,a0,a2
    35f8:	00b53833          	sltu	a6,a0,a1
    35fc:	40e78433          	sub	s0,a5,a4
    3600:	41040433          	sub	s0,s0,a6
    3604:	00841813          	slli	a6,s0,0x8
    3608:	00058993          	mv	s3,a1
    360c:	08085063          	bgez	a6,368c <__adddf3+0x62c>
    3610:	40a609b3          	sub	s3,a2,a0
    3614:	40f70433          	sub	s0,a4,a5
    3618:	01363633          	sltu	a2,a2,s3
    361c:	40c40433          	sub	s0,s0,a2
    3620:	00068913          	mv	s2,a3
    3624:	06040e63          	beqz	s0,36a0 <__adddf3+0x640>
    3628:	00040513          	mv	a0,s0
    362c:	724010ef          	jal	4d50 <__clzsi2>
    3630:	ff850693          	addi	a3,a0,-8
    3634:	02000793          	li	a5,32
    3638:	40d787b3          	sub	a5,a5,a3
    363c:	00d41433          	sll	s0,s0,a3
    3640:	00f9d7b3          	srl	a5,s3,a5
    3644:	0087e7b3          	or	a5,a5,s0
    3648:	00d99433          	sll	s0,s3,a3
    364c:	0a96c463          	blt	a3,s1,36f4 <__adddf3+0x694>
    3650:	409686b3          	sub	a3,a3,s1
    3654:	00168613          	addi	a2,a3,1
    3658:	01f00713          	li	a4,31
    365c:	06c74263          	blt	a4,a2,36c0 <__adddf3+0x660>
    3660:	02000713          	li	a4,32
    3664:	40c70733          	sub	a4,a4,a2
    3668:	00e79533          	sll	a0,a5,a4
    366c:	00c456b3          	srl	a3,s0,a2
    3670:	00e41733          	sll	a4,s0,a4
    3674:	00d56533          	or	a0,a0,a3
    3678:	00e03733          	snez	a4,a4
    367c:	00e56533          	or	a0,a0,a4
    3680:	00c7d7b3          	srl	a5,a5,a2
    3684:	00000493          	li	s1,0
    3688:	c79ff06f          	j	3300 <__adddf3+0x2a0>
    368c:	0085e5b3          	or	a1,a1,s0
    3690:	f8059ae3          	bnez	a1,3624 <__adddf3+0x5c4>
    3694:	00000493          	li	s1,0
    3698:	00000913          	li	s2,0
    369c:	08c0006f          	j	3728 <__adddf3+0x6c8>
    36a0:	00098513          	mv	a0,s3
    36a4:	6ac010ef          	jal	4d50 <__clzsi2>
    36a8:	01850693          	addi	a3,a0,24
    36ac:	01f00793          	li	a5,31
    36b0:	f8d7d2e3          	bge	a5,a3,3634 <__adddf3+0x5d4>
    36b4:	ff850793          	addi	a5,a0,-8
    36b8:	00f997b3          	sll	a5,s3,a5
    36bc:	f91ff06f          	j	364c <__adddf3+0x5ec>
    36c0:	fe168693          	addi	a3,a3,-31
    36c4:	00d7d533          	srl	a0,a5,a3
    36c8:	02000693          	li	a3,32
    36cc:	00000713          	li	a4,0
    36d0:	00d60863          	beq	a2,a3,36e0 <__adddf3+0x680>
    36d4:	04000713          	li	a4,64
    36d8:	40c70733          	sub	a4,a4,a2
    36dc:	00e79733          	sll	a4,a5,a4
    36e0:	00e46733          	or	a4,s0,a4
    36e4:	00e03733          	snez	a4,a4
    36e8:	00e56533          	or	a0,a0,a4
    36ec:	00000793          	li	a5,0
    36f0:	f95ff06f          	j	3684 <__adddf3+0x624>
    36f4:	ff800737          	lui	a4,0xff800
    36f8:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    36fc:	40d484b3          	sub	s1,s1,a3
    3700:	00e7f7b3          	and	a5,a5,a4
    3704:	00040513          	mv	a0,s0
    3708:	bf9ff06f          	j	3300 <__adddf3+0x2a0>
    370c:	00070793          	mv	a5,a4
    3710:	00060513          	mv	a0,a2
    3714:	c5dff06f          	j	3370 <__adddf3+0x310>
    3718:	00070793          	mv	a5,a4
    371c:	00060513          	mv	a0,a2
    3720:	be1ff06f          	j	3300 <__adddf3+0x2a0>
    3724:	7ff00493          	li	s1,2047
    3728:	00000793          	li	a5,0
    372c:	00000513          	li	a0,0
    3730:	0240006f          	j	3754 <__adddf3+0x6f4>
    3734:	00080493          	mv	s1,a6
    3738:	bc9ff06f          	j	3300 <__adddf3+0x2a0>
    373c:	00070793          	mv	a5,a4
    3740:	00060513          	mv	a0,a2
    3744:	00080493          	mv	s1,a6
    3748:	e41ff06f          	j	3588 <__adddf3+0x528>
    374c:	00000793          	li	a5,0
    3750:	00000913          	li	s2,0
    3754:	00879713          	slli	a4,a5,0x8
    3758:	00075e63          	bgez	a4,3774 <__adddf3+0x714>
    375c:	00148493          	addi	s1,s1,1
    3760:	7ff00713          	li	a4,2047
    3764:	08e48263          	beq	s1,a4,37e8 <__adddf3+0x788>
    3768:	ff800737          	lui	a4,0xff800
    376c:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    3770:	00e7f7b3          	and	a5,a5,a4
    3774:	01d79693          	slli	a3,a5,0x1d
    3778:	00355513          	srli	a0,a0,0x3
    377c:	7ff00713          	li	a4,2047
    3780:	00a6e6b3          	or	a3,a3,a0
    3784:	0037d793          	srli	a5,a5,0x3
    3788:	00e49e63          	bne	s1,a4,37a4 <__adddf3+0x744>
    378c:	00f6e6b3          	or	a3,a3,a5
    3790:	00000793          	li	a5,0
    3794:	00068863          	beqz	a3,37a4 <__adddf3+0x744>
    3798:	000807b7          	lui	a5,0x80
    379c:	00000693          	li	a3,0
    37a0:	00000913          	li	s2,0
    37a4:	01449713          	slli	a4,s1,0x14
    37a8:	7ff00637          	lui	a2,0x7ff00
    37ac:	00c79793          	slli	a5,a5,0xc
    37b0:	00c77733          	and	a4,a4,a2
    37b4:	01c12083          	lw	ra,28(sp)
    37b8:	01812403          	lw	s0,24(sp)
    37bc:	00c7d793          	srli	a5,a5,0xc
    37c0:	00f767b3          	or	a5,a4,a5
    37c4:	01f91713          	slli	a4,s2,0x1f
    37c8:	00e7e633          	or	a2,a5,a4
    37cc:	01412483          	lw	s1,20(sp)
    37d0:	01012903          	lw	s2,16(sp)
    37d4:	00c12983          	lw	s3,12(sp)
    37d8:	00068513          	mv	a0,a3
    37dc:	00060593          	mv	a1,a2
    37e0:	02010113          	addi	sp,sp,32
    37e4:	00008067          	ret
    37e8:	00000793          	li	a5,0
    37ec:	00000513          	li	a0,0
    37f0:	f85ff06f          	j	3774 <__adddf3+0x714>

000037f4 <__divdf3>:
    37f4:	fd010113          	addi	sp,sp,-48
    37f8:	0145d813          	srli	a6,a1,0x14
    37fc:	02912223          	sw	s1,36(sp)
    3800:	03212023          	sw	s2,32(sp)
    3804:	01312e23          	sw	s3,28(sp)
    3808:	01612823          	sw	s6,16(sp)
    380c:	01712623          	sw	s7,12(sp)
    3810:	00c59493          	slli	s1,a1,0xc
    3814:	02112623          	sw	ra,44(sp)
    3818:	02812423          	sw	s0,40(sp)
    381c:	01412c23          	sw	s4,24(sp)
    3820:	01512a23          	sw	s5,20(sp)
    3824:	7ff87813          	andi	a6,a6,2047
    3828:	00050b13          	mv	s6,a0
    382c:	00060b93          	mv	s7,a2
    3830:	00068913          	mv	s2,a3
    3834:	00c4d493          	srli	s1,s1,0xc
    3838:	01f5d993          	srli	s3,a1,0x1f
    383c:	08080e63          	beqz	a6,38d8 <__divdf3+0xe4>
    3840:	7ff00793          	li	a5,2047
    3844:	0ef80e63          	beq	a6,a5,3940 <__divdf3+0x14c>
    3848:	01d55a13          	srli	s4,a0,0x1d
    384c:	00349493          	slli	s1,s1,0x3
    3850:	009a6a33          	or	s4,s4,s1
    3854:	008007b7          	lui	a5,0x800
    3858:	00fa6a33          	or	s4,s4,a5
    385c:	00351413          	slli	s0,a0,0x3
    3860:	c0180a93          	addi	s5,a6,-1023
    3864:	00000b13          	li	s6,0
    3868:	01495713          	srli	a4,s2,0x14
    386c:	00c91493          	slli	s1,s2,0xc
    3870:	7ff77713          	andi	a4,a4,2047
    3874:	00c4d493          	srli	s1,s1,0xc
    3878:	01f95913          	srli	s2,s2,0x1f
    387c:	10070063          	beqz	a4,397c <__divdf3+0x188>
    3880:	7ff00793          	li	a5,2047
    3884:	16f70463          	beq	a4,a5,39ec <__divdf3+0x1f8>
    3888:	00349493          	slli	s1,s1,0x3
    388c:	01dbd793          	srli	a5,s7,0x1d
    3890:	0097e7b3          	or	a5,a5,s1
    3894:	008004b7          	lui	s1,0x800
    3898:	0097e4b3          	or	s1,a5,s1
    389c:	003b9f13          	slli	t5,s7,0x3
    38a0:	c0170713          	addi	a4,a4,-1023
    38a4:	00000793          	li	a5,0
    38a8:	40ea8833          	sub	a6,s5,a4
    38ac:	002b1713          	slli	a4,s6,0x2
    38b0:	00f76733          	or	a4,a4,a5
    38b4:	fff70713          	addi	a4,a4,-1
    38b8:	00e00693          	li	a3,14
    38bc:	0129c633          	xor	a2,s3,s2
    38c0:	16e6e263          	bltu	a3,a4,3a24 <__divdf3+0x230>
    38c4:	00271713          	slli	a4,a4,0x2
    38c8:	58818693          	addi	a3,gp,1416 # 5320 <keypad_map+0x10>
    38cc:	00d70733          	add	a4,a4,a3
    38d0:	00072703          	lw	a4,0(a4)
    38d4:	00070067          	jr	a4
    38d8:	00a4ea33          	or	s4,s1,a0
    38dc:	060a0e63          	beqz	s4,3958 <__divdf3+0x164>
    38e0:	02048e63          	beqz	s1,391c <__divdf3+0x128>
    38e4:	00048513          	mv	a0,s1
    38e8:	468010ef          	jal	4d50 <__clzsi2>
    38ec:	ff550793          	addi	a5,a0,-11
    38f0:	01d00a13          	li	s4,29
    38f4:	ff850713          	addi	a4,a0,-8
    38f8:	40fa0a33          	sub	s4,s4,a5
    38fc:	00e494b3          	sll	s1,s1,a4
    3900:	014b5a33          	srl	s4,s6,s4
    3904:	009a6a33          	or	s4,s4,s1
    3908:	00eb14b3          	sll	s1,s6,a4
    390c:	c0d00813          	li	a6,-1011
    3910:	40a80ab3          	sub	s5,a6,a0
    3914:	00048413          	mv	s0,s1
    3918:	f4dff06f          	j	3864 <__divdf3+0x70>
    391c:	434010ef          	jal	4d50 <__clzsi2>
    3920:	00050a13          	mv	s4,a0
    3924:	015a0793          	addi	a5,s4,21
    3928:	01c00713          	li	a4,28
    392c:	02050513          	addi	a0,a0,32
    3930:	fcf750e3          	bge	a4,a5,38f0 <__divdf3+0xfc>
    3934:	ff8a0a13          	addi	s4,s4,-8
    3938:	014b1a33          	sll	s4,s6,s4
    393c:	fd1ff06f          	j	390c <__divdf3+0x118>
    3940:	00a4ea33          	or	s4,s1,a0
    3944:	020a1263          	bnez	s4,3968 <__divdf3+0x174>
    3948:	00000413          	li	s0,0
    394c:	7ff00a93          	li	s5,2047
    3950:	00200b13          	li	s6,2
    3954:	f15ff06f          	j	3868 <__divdf3+0x74>
    3958:	00000413          	li	s0,0
    395c:	00000a93          	li	s5,0
    3960:	00100b13          	li	s6,1
    3964:	f05ff06f          	j	3868 <__divdf3+0x74>
    3968:	00050413          	mv	s0,a0
    396c:	00048a13          	mv	s4,s1
    3970:	7ff00a93          	li	s5,2047
    3974:	00300b13          	li	s6,3
    3978:	ef1ff06f          	j	3868 <__divdf3+0x74>
    397c:	0174ef33          	or	t5,s1,s7
    3980:	080f0263          	beqz	t5,3a04 <__divdf3+0x210>
    3984:	04048063          	beqz	s1,39c4 <__divdf3+0x1d0>
    3988:	00048513          	mv	a0,s1
    398c:	3c4010ef          	jal	4d50 <__clzsi2>
    3990:	ff550713          	addi	a4,a0,-11
    3994:	01d00793          	li	a5,29
    3998:	ff850693          	addi	a3,a0,-8
    399c:	40e787b3          	sub	a5,a5,a4
    39a0:	00d494b3          	sll	s1,s1,a3
    39a4:	00fbd7b3          	srl	a5,s7,a5
    39a8:	0097e7b3          	or	a5,a5,s1
    39ac:	00db94b3          	sll	s1,s7,a3
    39b0:	c0d00713          	li	a4,-1011
    39b4:	00048f13          	mv	t5,s1
    39b8:	40a70733          	sub	a4,a4,a0
    39bc:	00078493          	mv	s1,a5
    39c0:	ee5ff06f          	j	38a4 <__divdf3+0xb0>
    39c4:	000b8513          	mv	a0,s7
    39c8:	388010ef          	jal	4d50 <__clzsi2>
    39cc:	00050793          	mv	a5,a0
    39d0:	01578713          	addi	a4,a5,21 # 800015 <_memory_end+0x7e0015>
    39d4:	01c00693          	li	a3,28
    39d8:	02050513          	addi	a0,a0,32
    39dc:	fae6dce3          	bge	a3,a4,3994 <__divdf3+0x1a0>
    39e0:	ff878793          	addi	a5,a5,-8
    39e4:	00fb97b3          	sll	a5,s7,a5
    39e8:	fc9ff06f          	j	39b0 <__divdf3+0x1bc>
    39ec:	0174ef33          	or	t5,s1,s7
    39f0:	020f1263          	bnez	t5,3a14 <__divdf3+0x220>
    39f4:	00000493          	li	s1,0
    39f8:	7ff00713          	li	a4,2047
    39fc:	00200793          	li	a5,2
    3a00:	ea9ff06f          	j	38a8 <__divdf3+0xb4>
    3a04:	00000493          	li	s1,0
    3a08:	00000713          	li	a4,0
    3a0c:	00100793          	li	a5,1
    3a10:	e99ff06f          	j	38a8 <__divdf3+0xb4>
    3a14:	000b8f13          	mv	t5,s7
    3a18:	7ff00713          	li	a4,2047
    3a1c:	00300793          	li	a5,3
    3a20:	e89ff06f          	j	38a8 <__divdf3+0xb4>
    3a24:	0144e663          	bltu	s1,s4,3a30 <__divdf3+0x23c>
    3a28:	349a1c63          	bne	s4,s1,3d80 <__divdf3+0x58c>
    3a2c:	35e46a63          	bltu	s0,t5,3d80 <__divdf3+0x58c>
    3a30:	01fa1693          	slli	a3,s4,0x1f
    3a34:	00145793          	srli	a5,s0,0x1
    3a38:	01f41713          	slli	a4,s0,0x1f
    3a3c:	001a5a13          	srli	s4,s4,0x1
    3a40:	00f6e433          	or	s0,a3,a5
    3a44:	00849893          	slli	a7,s1,0x8
    3a48:	018f5593          	srli	a1,t5,0x18
    3a4c:	0115e5b3          	or	a1,a1,a7
    3a50:	0108d893          	srli	a7,a7,0x10
    3a54:	031a5eb3          	divu	t4,s4,a7
    3a58:	01059313          	slli	t1,a1,0x10
    3a5c:	01035313          	srli	t1,t1,0x10
    3a60:	01045793          	srli	a5,s0,0x10
    3a64:	008f1513          	slli	a0,t5,0x8
    3a68:	031a7a33          	remu	s4,s4,a7
    3a6c:	000e8693          	mv	a3,t4
    3a70:	03d30e33          	mul	t3,t1,t4
    3a74:	010a1a13          	slli	s4,s4,0x10
    3a78:	0147e7b3          	or	a5,a5,s4
    3a7c:	01c7fe63          	bgeu	a5,t3,3a98 <__divdf3+0x2a4>
    3a80:	00f587b3          	add	a5,a1,a5
    3a84:	fffe8693          	addi	a3,t4,-1
    3a88:	00b7e863          	bltu	a5,a1,3a98 <__divdf3+0x2a4>
    3a8c:	01c7f663          	bgeu	a5,t3,3a98 <__divdf3+0x2a4>
    3a90:	ffee8693          	addi	a3,t4,-2
    3a94:	00b787b3          	add	a5,a5,a1
    3a98:	41c787b3          	sub	a5,a5,t3
    3a9c:	0317df33          	divu	t5,a5,a7
    3aa0:	01041413          	slli	s0,s0,0x10
    3aa4:	01045413          	srli	s0,s0,0x10
    3aa8:	0317f7b3          	remu	a5,a5,a7
    3aac:	000f0e13          	mv	t3,t5
    3ab0:	03e30eb3          	mul	t4,t1,t5
    3ab4:	01079793          	slli	a5,a5,0x10
    3ab8:	00f467b3          	or	a5,s0,a5
    3abc:	01d7fe63          	bgeu	a5,t4,3ad8 <__divdf3+0x2e4>
    3ac0:	00f587b3          	add	a5,a1,a5
    3ac4:	ffff0e13          	addi	t3,t5,-1
    3ac8:	00b7e863          	bltu	a5,a1,3ad8 <__divdf3+0x2e4>
    3acc:	01d7f663          	bgeu	a5,t4,3ad8 <__divdf3+0x2e4>
    3ad0:	ffef0e13          	addi	t3,t5,-2
    3ad4:	00b787b3          	add	a5,a5,a1
    3ad8:	01069693          	slli	a3,a3,0x10
    3adc:	00010437          	lui	s0,0x10
    3ae0:	01c6e2b3          	or	t0,a3,t3
    3ae4:	fff40e13          	addi	t3,s0,-1 # ffff <_bss_end+0xab03>
    3ae8:	01c2f6b3          	and	a3,t0,t3
    3aec:	0102df93          	srli	t6,t0,0x10
    3af0:	01c57e33          	and	t3,a0,t3
    3af4:	41d787b3          	sub	a5,a5,t4
    3af8:	01055e93          	srli	t4,a0,0x10
    3afc:	02de03b3          	mul	t2,t3,a3
    3b00:	03cf84b3          	mul	s1,t6,t3
    3b04:	02de86b3          	mul	a3,t4,a3
    3b08:	00968f33          	add	t5,a3,s1
    3b0c:	0103d693          	srli	a3,t2,0x10
    3b10:	01e686b3          	add	a3,a3,t5
    3b14:	03df8fb3          	mul	t6,t6,t4
    3b18:	0096f463          	bgeu	a3,s1,3b20 <__divdf3+0x32c>
    3b1c:	008f8fb3          	add	t6,t6,s0
    3b20:	0106df13          	srli	t5,a3,0x10
    3b24:	01ff0f33          	add	t5,t5,t6
    3b28:	00010fb7          	lui	t6,0x10
    3b2c:	ffff8f93          	addi	t6,t6,-1 # ffff <_bss_end+0xab03>
    3b30:	01f6f6b3          	and	a3,a3,t6
    3b34:	01069693          	slli	a3,a3,0x10
    3b38:	01f3f3b3          	and	t2,t2,t6
    3b3c:	007686b3          	add	a3,a3,t2
    3b40:	01e7e863          	bltu	a5,t5,3b50 <__divdf3+0x35c>
    3b44:	00028493          	mv	s1,t0
    3b48:	05e79863          	bne	a5,t5,3b98 <__divdf3+0x3a4>
    3b4c:	04d77663          	bgeu	a4,a3,3b98 <__divdf3+0x3a4>
    3b50:	00a70fb3          	add	t6,a4,a0
    3b54:	00efb3b3          	sltu	t2,t6,a4
    3b58:	00b38433          	add	s0,t2,a1
    3b5c:	008787b3          	add	a5,a5,s0
    3b60:	fff28493          	addi	s1,t0,-1
    3b64:	000f8713          	mv	a4,t6
    3b68:	00f5e663          	bltu	a1,a5,3b74 <__divdf3+0x380>
    3b6c:	02f59663          	bne	a1,a5,3b98 <__divdf3+0x3a4>
    3b70:	02039463          	bnez	t2,3b98 <__divdf3+0x3a4>
    3b74:	01e7e663          	bltu	a5,t5,3b80 <__divdf3+0x38c>
    3b78:	02ff1063          	bne	t5,a5,3b98 <__divdf3+0x3a4>
    3b7c:	00dffe63          	bgeu	t6,a3,3b98 <__divdf3+0x3a4>
    3b80:	01f50fb3          	add	t6,a0,t6
    3b84:	000f8713          	mv	a4,t6
    3b88:	00afbfb3          	sltu	t6,t6,a0
    3b8c:	00bf8fb3          	add	t6,t6,a1
    3b90:	ffe28493          	addi	s1,t0,-2
    3b94:	01f787b3          	add	a5,a5,t6
    3b98:	40d706b3          	sub	a3,a4,a3
    3b9c:	41e787b3          	sub	a5,a5,t5
    3ba0:	00d73733          	sltu	a4,a4,a3
    3ba4:	40e787b3          	sub	a5,a5,a4
    3ba8:	fff00f13          	li	t5,-1
    3bac:	12f58663          	beq	a1,a5,3cd8 <__divdf3+0x4e4>
    3bb0:	0317dfb3          	divu	t6,a5,a7
    3bb4:	0106d713          	srli	a4,a3,0x10
    3bb8:	0317f7b3          	remu	a5,a5,a7
    3bbc:	03f30f33          	mul	t5,t1,t6
    3bc0:	01079793          	slli	a5,a5,0x10
    3bc4:	00f767b3          	or	a5,a4,a5
    3bc8:	000f8713          	mv	a4,t6
    3bcc:	01e7fe63          	bgeu	a5,t5,3be8 <__divdf3+0x3f4>
    3bd0:	00f587b3          	add	a5,a1,a5
    3bd4:	ffff8713          	addi	a4,t6,-1
    3bd8:	00b7e863          	bltu	a5,a1,3be8 <__divdf3+0x3f4>
    3bdc:	01e7f663          	bgeu	a5,t5,3be8 <__divdf3+0x3f4>
    3be0:	ffef8713          	addi	a4,t6,-2
    3be4:	00b787b3          	add	a5,a5,a1
    3be8:	41e787b3          	sub	a5,a5,t5
    3bec:	0317df33          	divu	t5,a5,a7
    3bf0:	01069693          	slli	a3,a3,0x10
    3bf4:	0106d693          	srli	a3,a3,0x10
    3bf8:	0317f7b3          	remu	a5,a5,a7
    3bfc:	000f0893          	mv	a7,t5
    3c00:	03e30333          	mul	t1,t1,t5
    3c04:	01079793          	slli	a5,a5,0x10
    3c08:	00f6e7b3          	or	a5,a3,a5
    3c0c:	0067fe63          	bgeu	a5,t1,3c28 <__divdf3+0x434>
    3c10:	00f587b3          	add	a5,a1,a5
    3c14:	ffff0893          	addi	a7,t5,-1
    3c18:	00b7e863          	bltu	a5,a1,3c28 <__divdf3+0x434>
    3c1c:	0067f663          	bgeu	a5,t1,3c28 <__divdf3+0x434>
    3c20:	ffef0893          	addi	a7,t5,-2
    3c24:	00b787b3          	add	a5,a5,a1
    3c28:	01071693          	slli	a3,a4,0x10
    3c2c:	0116e6b3          	or	a3,a3,a7
    3c30:	01069713          	slli	a4,a3,0x10
    3c34:	01075713          	srli	a4,a4,0x10
    3c38:	406787b3          	sub	a5,a5,t1
    3c3c:	0106d313          	srli	t1,a3,0x10
    3c40:	03c70f33          	mul	t5,a4,t3
    3c44:	03c30e33          	mul	t3,t1,t3
    3c48:	026e8333          	mul	t1,t4,t1
    3c4c:	02ee8eb3          	mul	t4,t4,a4
    3c50:	010f5713          	srli	a4,t5,0x10
    3c54:	01ce8eb3          	add	t4,t4,t3
    3c58:	01d70733          	add	a4,a4,t4
    3c5c:	01c77663          	bgeu	a4,t3,3c68 <__divdf3+0x474>
    3c60:	000108b7          	lui	a7,0x10
    3c64:	01130333          	add	t1,t1,a7
    3c68:	01075893          	srli	a7,a4,0x10
    3c6c:	006888b3          	add	a7,a7,t1
    3c70:	00010337          	lui	t1,0x10
    3c74:	fff30313          	addi	t1,t1,-1 # ffff <_bss_end+0xab03>
    3c78:	00677733          	and	a4,a4,t1
    3c7c:	01071713          	slli	a4,a4,0x10
    3c80:	006f7f33          	and	t5,t5,t1
    3c84:	01e70733          	add	a4,a4,t5
    3c88:	0117e863          	bltu	a5,a7,3c98 <__divdf3+0x4a4>
    3c8c:	23179c63          	bne	a5,a7,3ec4 <__divdf3+0x6d0>
    3c90:	00068f13          	mv	t5,a3
    3c94:	04070263          	beqz	a4,3cd8 <__divdf3+0x4e4>
    3c98:	00f587b3          	add	a5,a1,a5
    3c9c:	fff68f13          	addi	t5,a3,-1
    3ca0:	00078313          	mv	t1,a5
    3ca4:	02b7e463          	bltu	a5,a1,3ccc <__divdf3+0x4d8>
    3ca8:	0117e663          	bltu	a5,a7,3cb4 <__divdf3+0x4c0>
    3cac:	21179a63          	bne	a5,a7,3ec0 <__divdf3+0x6cc>
    3cb0:	02e57063          	bgeu	a0,a4,3cd0 <__divdf3+0x4dc>
    3cb4:	ffe68f13          	addi	t5,a3,-2
    3cb8:	00151693          	slli	a3,a0,0x1
    3cbc:	00a6b333          	sltu	t1,a3,a0
    3cc0:	00b30333          	add	t1,t1,a1
    3cc4:	00678333          	add	t1,a5,t1
    3cc8:	00068513          	mv	a0,a3
    3ccc:	01131463          	bne	t1,a7,3cd4 <__divdf3+0x4e0>
    3cd0:	00a70463          	beq	a4,a0,3cd8 <__divdf3+0x4e4>
    3cd4:	001f6f13          	ori	t5,t5,1
    3cd8:	3ff80713          	addi	a4,a6,1023
    3cdc:	10e05263          	blez	a4,3de0 <__divdf3+0x5ec>
    3ce0:	007f7793          	andi	a5,t5,7
    3ce4:	02078063          	beqz	a5,3d04 <__divdf3+0x510>
    3ce8:	00ff7793          	andi	a5,t5,15
    3cec:	00400693          	li	a3,4
    3cf0:	00d78a63          	beq	a5,a3,3d04 <__divdf3+0x510>
    3cf4:	004f0793          	addi	a5,t5,4
    3cf8:	01e7b6b3          	sltu	a3,a5,t5
    3cfc:	00d484b3          	add	s1,s1,a3
    3d00:	00078f13          	mv	t5,a5
    3d04:	00749793          	slli	a5,s1,0x7
    3d08:	0007da63          	bgez	a5,3d1c <__divdf3+0x528>
    3d0c:	ff0007b7          	lui	a5,0xff000
    3d10:	fff78793          	addi	a5,a5,-1 # feffffff <_memory_end+0xfefdffff>
    3d14:	00f4f4b3          	and	s1,s1,a5
    3d18:	40080713          	addi	a4,a6,1024
    3d1c:	7fe00793          	li	a5,2046
    3d20:	08e7ca63          	blt	a5,a4,3db4 <__divdf3+0x5c0>
    3d24:	003f5f13          	srli	t5,t5,0x3
    3d28:	01d49793          	slli	a5,s1,0x1d
    3d2c:	01e7ef33          	or	t5,a5,t5
    3d30:	0034d513          	srli	a0,s1,0x3
    3d34:	00c51513          	slli	a0,a0,0xc
    3d38:	02c12083          	lw	ra,44(sp)
    3d3c:	02812403          	lw	s0,40(sp)
    3d40:	00c55513          	srli	a0,a0,0xc
    3d44:	01471713          	slli	a4,a4,0x14
    3d48:	00a76733          	or	a4,a4,a0
    3d4c:	01f61613          	slli	a2,a2,0x1f
    3d50:	00c767b3          	or	a5,a4,a2
    3d54:	02412483          	lw	s1,36(sp)
    3d58:	02012903          	lw	s2,32(sp)
    3d5c:	01c12983          	lw	s3,28(sp)
    3d60:	01812a03          	lw	s4,24(sp)
    3d64:	01412a83          	lw	s5,20(sp)
    3d68:	01012b03          	lw	s6,16(sp)
    3d6c:	00c12b83          	lw	s7,12(sp)
    3d70:	000f0513          	mv	a0,t5
    3d74:	00078593          	mv	a1,a5
    3d78:	03010113          	addi	sp,sp,48
    3d7c:	00008067          	ret
    3d80:	fff80813          	addi	a6,a6,-1
    3d84:	00000713          	li	a4,0
    3d88:	cbdff06f          	j	3a44 <__divdf3+0x250>
    3d8c:	00098613          	mv	a2,s3
    3d90:	000a0493          	mv	s1,s4
    3d94:	00040f13          	mv	t5,s0
    3d98:	000b0793          	mv	a5,s6
    3d9c:	00300713          	li	a4,3
    3da0:	0ee78863          	beq	a5,a4,3e90 <__divdf3+0x69c>
    3da4:	00100713          	li	a4,1
    3da8:	0ee78e63          	beq	a5,a4,3ea4 <__divdf3+0x6b0>
    3dac:	00200713          	li	a4,2
    3db0:	f2e794e3          	bne	a5,a4,3cd8 <__divdf3+0x4e4>
    3db4:	00000513          	li	a0,0
    3db8:	00000f13          	li	t5,0
    3dbc:	7ff00713          	li	a4,2047
    3dc0:	f75ff06f          	j	3d34 <__divdf3+0x540>
    3dc4:	00090613          	mv	a2,s2
    3dc8:	fd5ff06f          	j	3d9c <__divdf3+0x5a8>
    3dcc:	000804b7          	lui	s1,0x80
    3dd0:	00000f13          	li	t5,0
    3dd4:	00000613          	li	a2,0
    3dd8:	00300793          	li	a5,3
    3ddc:	fc1ff06f          	j	3d9c <__divdf3+0x5a8>
    3de0:	00100513          	li	a0,1
    3de4:	40e50533          	sub	a0,a0,a4
    3de8:	03800793          	li	a5,56
    3dec:	0aa7cc63          	blt	a5,a0,3ea4 <__divdf3+0x6b0>
    3df0:	01f00793          	li	a5,31
    3df4:	06a7c463          	blt	a5,a0,3e5c <__divdf3+0x668>
    3df8:	41e80813          	addi	a6,a6,1054
    3dfc:	010497b3          	sll	a5,s1,a6
    3e00:	00af5733          	srl	a4,t5,a0
    3e04:	010f1833          	sll	a6,t5,a6
    3e08:	00e7e7b3          	or	a5,a5,a4
    3e0c:	01003833          	snez	a6,a6
    3e10:	0107e7b3          	or	a5,a5,a6
    3e14:	00a4d533          	srl	a0,s1,a0
    3e18:	0077f713          	andi	a4,a5,7
    3e1c:	02070063          	beqz	a4,3e3c <__divdf3+0x648>
    3e20:	00f7f713          	andi	a4,a5,15
    3e24:	00400693          	li	a3,4
    3e28:	00d70a63          	beq	a4,a3,3e3c <__divdf3+0x648>
    3e2c:	00478713          	addi	a4,a5,4
    3e30:	00f736b3          	sltu	a3,a4,a5
    3e34:	00d50533          	add	a0,a0,a3
    3e38:	00070793          	mv	a5,a4
    3e3c:	00851713          	slli	a4,a0,0x8
    3e40:	06074863          	bltz	a4,3eb0 <__divdf3+0x6bc>
    3e44:	01d51f13          	slli	t5,a0,0x1d
    3e48:	0037d793          	srli	a5,a5,0x3
    3e4c:	00ff6f33          	or	t5,t5,a5
    3e50:	00355513          	srli	a0,a0,0x3
    3e54:	00000713          	li	a4,0
    3e58:	eddff06f          	j	3d34 <__divdf3+0x540>
    3e5c:	fe100793          	li	a5,-31
    3e60:	40e787b3          	sub	a5,a5,a4
    3e64:	02000693          	li	a3,32
    3e68:	00f4d7b3          	srl	a5,s1,a5
    3e6c:	00000713          	li	a4,0
    3e70:	00d50663          	beq	a0,a3,3e7c <__divdf3+0x688>
    3e74:	43e80713          	addi	a4,a6,1086
    3e78:	00e49733          	sll	a4,s1,a4
    3e7c:	01e76733          	or	a4,a4,t5
    3e80:	00e03733          	snez	a4,a4
    3e84:	00e7e7b3          	or	a5,a5,a4
    3e88:	00000513          	li	a0,0
    3e8c:	f8dff06f          	j	3e18 <__divdf3+0x624>
    3e90:	00080537          	lui	a0,0x80
    3e94:	00000f13          	li	t5,0
    3e98:	7ff00713          	li	a4,2047
    3e9c:	00000613          	li	a2,0
    3ea0:	e95ff06f          	j	3d34 <__divdf3+0x540>
    3ea4:	00000513          	li	a0,0
    3ea8:	00000f13          	li	t5,0
    3eac:	fa9ff06f          	j	3e54 <__divdf3+0x660>
    3eb0:	00000513          	li	a0,0
    3eb4:	00000f13          	li	t5,0
    3eb8:	00100713          	li	a4,1
    3ebc:	e79ff06f          	j	3d34 <__divdf3+0x540>
    3ec0:	000f0693          	mv	a3,t5
    3ec4:	00068f13          	mv	t5,a3
    3ec8:	e0dff06f          	j	3cd4 <__divdf3+0x4e0>

00003ecc <__fixdfsi>:
    3ecc:	0145d713          	srli	a4,a1,0x14
    3ed0:	001006b7          	lui	a3,0x100
    3ed4:	fff68793          	addi	a5,a3,-1 # fffff <_memory_end+0xdffff>
    3ed8:	7ff77713          	andi	a4,a4,2047
    3edc:	3fe00613          	li	a2,1022
    3ee0:	00b7f7b3          	and	a5,a5,a1
    3ee4:	01f5d593          	srli	a1,a1,0x1f
    3ee8:	04e65e63          	bge	a2,a4,3f44 <__fixdfsi+0x78>
    3eec:	41d00613          	li	a2,1053
    3ef0:	00e65a63          	bge	a2,a4,3f04 <__fixdfsi+0x38>
    3ef4:	80000537          	lui	a0,0x80000
    3ef8:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
    3efc:	00a58533          	add	a0,a1,a0
    3f00:	00008067          	ret
    3f04:	00d7e7b3          	or	a5,a5,a3
    3f08:	43300693          	li	a3,1075
    3f0c:	40e686b3          	sub	a3,a3,a4
    3f10:	01f00613          	li	a2,31
    3f14:	02d64063          	blt	a2,a3,3f34 <__fixdfsi+0x68>
    3f18:	bed70713          	addi	a4,a4,-1043
    3f1c:	00e797b3          	sll	a5,a5,a4
    3f20:	00d55533          	srl	a0,a0,a3
    3f24:	00a7e533          	or	a0,a5,a0
    3f28:	02058063          	beqz	a1,3f48 <__fixdfsi+0x7c>
    3f2c:	40a00533          	neg	a0,a0
    3f30:	00008067          	ret
    3f34:	41300693          	li	a3,1043
    3f38:	40e68733          	sub	a4,a3,a4
    3f3c:	00e7d533          	srl	a0,a5,a4
    3f40:	fe9ff06f          	j	3f28 <__fixdfsi+0x5c>
    3f44:	00000513          	li	a0,0
    3f48:	00008067          	ret

00003f4c <__fixunsdfsi>:
    3f4c:	0145d713          	srli	a4,a1,0x14
    3f50:	00100837          	lui	a6,0x100
    3f54:	fff80793          	addi	a5,a6,-1 # fffff <_memory_end+0xdffff>
    3f58:	7ff77713          	andi	a4,a4,2047
    3f5c:	3fe00613          	li	a2,1022
    3f60:	00b7f7b3          	and	a5,a5,a1
    3f64:	00050693          	mv	a3,a0
    3f68:	01f5d593          	srli	a1,a1,0x1f
    3f6c:	04e65a63          	bge	a2,a4,3fc0 <__fixunsdfsi+0x74>
    3f70:	0015c613          	xori	a2,a1,1
    3f74:	41e60613          	addi	a2,a2,1054 # 7ff0041e <_memory_end+0x7fee041e>
    3f78:	fff58513          	addi	a0,a1,-1
    3f7c:	04c75463          	bge	a4,a2,3fc4 <__fixunsdfsi+0x78>
    3f80:	00000513          	li	a0,0
    3f84:	04059063          	bnez	a1,3fc4 <__fixunsdfsi+0x78>
    3f88:	43300613          	li	a2,1075
    3f8c:	40e60633          	sub	a2,a2,a4
    3f90:	01f00593          	li	a1,31
    3f94:	0107e7b3          	or	a5,a5,a6
    3f98:	00c5cc63          	blt	a1,a2,3fb0 <__fixunsdfsi+0x64>
    3f9c:	bed70713          	addi	a4,a4,-1043
    3fa0:	00e797b3          	sll	a5,a5,a4
    3fa4:	00c6d533          	srl	a0,a3,a2
    3fa8:	00a7e533          	or	a0,a5,a0
    3fac:	00008067          	ret
    3fb0:	41300693          	li	a3,1043
    3fb4:	40e68733          	sub	a4,a3,a4
    3fb8:	00e7d533          	srl	a0,a5,a4
    3fbc:	00008067          	ret
    3fc0:	00000513          	li	a0,0
    3fc4:	00008067          	ret

00003fc8 <__floatunsidf>:
    3fc8:	ff010113          	addi	sp,sp,-16
    3fcc:	00812423          	sw	s0,8(sp)
    3fd0:	00112623          	sw	ra,12(sp)
    3fd4:	00050413          	mv	s0,a0
    3fd8:	06050263          	beqz	a0,403c <__floatunsidf+0x74>
    3fdc:	575000ef          	jal	4d50 <__clzsi2>
    3fe0:	41e00713          	li	a4,1054
    3fe4:	00a00793          	li	a5,10
    3fe8:	40a70733          	sub	a4,a4,a0
    3fec:	04a7c063          	blt	a5,a0,402c <__floatunsidf+0x64>
    3ff0:	00b00793          	li	a5,11
    3ff4:	40a787b3          	sub	a5,a5,a0
    3ff8:	01550513          	addi	a0,a0,21
    3ffc:	00f457b3          	srl	a5,s0,a5
    4000:	00a41433          	sll	s0,s0,a0
    4004:	00c12083          	lw	ra,12(sp)
    4008:	00040513          	mv	a0,s0
    400c:	00c79793          	slli	a5,a5,0xc
    4010:	00812403          	lw	s0,8(sp)
    4014:	01471713          	slli	a4,a4,0x14
    4018:	00c7d793          	srli	a5,a5,0xc
    401c:	00f766b3          	or	a3,a4,a5
    4020:	00068593          	mv	a1,a3
    4024:	01010113          	addi	sp,sp,16
    4028:	00008067          	ret
    402c:	ff550513          	addi	a0,a0,-11
    4030:	00a417b3          	sll	a5,s0,a0
    4034:	00000413          	li	s0,0
    4038:	fcdff06f          	j	4004 <__floatunsidf+0x3c>
    403c:	00000793          	li	a5,0
    4040:	00000713          	li	a4,0
    4044:	fc1ff06f          	j	4004 <__floatunsidf+0x3c>

00004048 <__eqsf2>:
    4048:	01755693          	srli	a3,a0,0x17
    404c:	008007b7          	lui	a5,0x800
    4050:	fff78793          	addi	a5,a5,-1 # 7fffff <_memory_end+0x7dffff>
    4054:	0175d613          	srli	a2,a1,0x17
    4058:	0ff6f693          	zext.b	a3,a3
    405c:	0ff00893          	li	a7,255
    4060:	00a7f833          	and	a6,a5,a0
    4064:	01f55713          	srli	a4,a0,0x1f
    4068:	00b7f7b3          	and	a5,a5,a1
    406c:	0ff67613          	zext.b	a2,a2
    4070:	01f5d593          	srli	a1,a1,0x1f
    4074:	00100513          	li	a0,1
    4078:	01169a63          	bne	a3,a7,408c <__eqsf2+0x44>
    407c:	00081663          	bnez	a6,4088 <__eqsf2+0x40>
    4080:	00d61463          	bne	a2,a3,4088 <__eqsf2+0x40>
    4084:	00078a63          	beqz	a5,4098 <__eqsf2+0x50>
    4088:	00008067          	ret
    408c:	ff160ee3          	beq	a2,a7,4088 <__eqsf2+0x40>
    4090:	fec69ce3          	bne	a3,a2,4088 <__eqsf2+0x40>
    4094:	fef81ae3          	bne	a6,a5,4088 <__eqsf2+0x40>
    4098:	00000513          	li	a0,0
    409c:	feb706e3          	beq	a4,a1,4088 <__eqsf2+0x40>
    40a0:	00100513          	li	a0,1
    40a4:	fe0692e3          	bnez	a3,4088 <__eqsf2+0x40>
    40a8:	01003533          	snez	a0,a6
    40ac:	00008067          	ret

000040b0 <__lesf2>:
    40b0:	008007b7          	lui	a5,0x800
    40b4:	fff78793          	addi	a5,a5,-1 # 7fffff <_memory_end+0x7dffff>
    40b8:	01755693          	srli	a3,a0,0x17
    40bc:	00a7f633          	and	a2,a5,a0
    40c0:	01f55713          	srli	a4,a0,0x1f
    40c4:	0ff6f693          	zext.b	a3,a3
    40c8:	0175d513          	srli	a0,a1,0x17
    40cc:	0ff00813          	li	a6,255
    40d0:	00b7f7b3          	and	a5,a5,a1
    40d4:	0ff57513          	zext.b	a0,a0
    40d8:	01f5d593          	srli	a1,a1,0x1f
    40dc:	01069463          	bne	a3,a6,40e4 <__lesf2+0x34>
    40e0:	04061263          	bnez	a2,4124 <__lesf2+0x74>
    40e4:	0ff00813          	li	a6,255
    40e8:	01051463          	bne	a0,a6,40f0 <__lesf2+0x40>
    40ec:	02079c63          	bnez	a5,4124 <__lesf2+0x74>
    40f0:	04069a63          	bnez	a3,4144 <__lesf2+0x94>
    40f4:	02051c63          	bnez	a0,412c <__lesf2+0x7c>
    40f8:	04061863          	bnez	a2,4148 <__lesf2+0x98>
    40fc:	04078263          	beqz	a5,4140 <__lesf2+0x90>
    4100:	00100513          	li	a0,1
    4104:	02059e63          	bnez	a1,4140 <__lesf2+0x90>
    4108:	fff00513          	li	a0,-1
    410c:	00008067          	ret
    4110:	fea6c8e3          	blt	a3,a0,4100 <__lesf2+0x50>
    4114:	02c7e263          	bltu	a5,a2,4138 <__lesf2+0x88>
    4118:	00000513          	li	a0,0
    411c:	02f67263          	bgeu	a2,a5,4140 <__lesf2+0x90>
    4120:	fe1ff06f          	j	4100 <__lesf2+0x50>
    4124:	00200513          	li	a0,2
    4128:	00008067          	ret
    412c:	fc060ae3          	beqz	a2,4100 <__lesf2+0x50>
    4130:	00e59e63          	bne	a1,a4,414c <__lesf2+0x9c>
    4134:	fcd55ee3          	bge	a0,a3,4110 <__lesf2+0x60>
    4138:	fff00513          	li	a0,-1
    413c:	00058c63          	beqz	a1,4154 <__lesf2+0xa4>
    4140:	00008067          	ret
    4144:	fe0516e3          	bnez	a0,4130 <__lesf2+0x80>
    4148:	fe0794e3          	bnez	a5,4130 <__lesf2+0x80>
    414c:	fff00513          	li	a0,-1
    4150:	fe0718e3          	bnez	a4,4140 <__lesf2+0x90>
    4154:	00100513          	li	a0,1
    4158:	00008067          	ret

0000415c <__mulsf3>:
    415c:	fe010113          	addi	sp,sp,-32
    4160:	01212823          	sw	s2,16(sp)
    4164:	01755913          	srli	s2,a0,0x17
    4168:	00912a23          	sw	s1,20(sp)
    416c:	01312623          	sw	s3,12(sp)
    4170:	01512223          	sw	s5,4(sp)
    4174:	00951493          	slli	s1,a0,0x9
    4178:	00112e23          	sw	ra,28(sp)
    417c:	00812c23          	sw	s0,24(sp)
    4180:	01412423          	sw	s4,8(sp)
    4184:	0ff97913          	zext.b	s2,s2
    4188:	00058a93          	mv	s5,a1
    418c:	0094d493          	srli	s1,s1,0x9
    4190:	01f55993          	srli	s3,a0,0x1f
    4194:	10090863          	beqz	s2,42a4 <__mulsf3+0x148>
    4198:	0ff00793          	li	a5,255
    419c:	12f90463          	beq	s2,a5,42c4 <__mulsf3+0x168>
    41a0:	00349493          	slli	s1,s1,0x3
    41a4:	040007b7          	lui	a5,0x4000
    41a8:	00f4e4b3          	or	s1,s1,a5
    41ac:	f8190913          	addi	s2,s2,-127
    41b0:	00000a13          	li	s4,0
    41b4:	017ad793          	srli	a5,s5,0x17
    41b8:	009a9413          	slli	s0,s5,0x9
    41bc:	0ff7f793          	zext.b	a5,a5
    41c0:	00945413          	srli	s0,s0,0x9
    41c4:	01fada93          	srli	s5,s5,0x1f
    41c8:	10078e63          	beqz	a5,42e4 <__mulsf3+0x188>
    41cc:	0ff00713          	li	a4,255
    41d0:	12e78a63          	beq	a5,a4,4304 <__mulsf3+0x1a8>
    41d4:	00341413          	slli	s0,s0,0x3
    41d8:	04000737          	lui	a4,0x4000
    41dc:	00e46433          	or	s0,s0,a4
    41e0:	f8178793          	addi	a5,a5,-127 # 3ffff81 <_memory_end+0x3fdff81>
    41e4:	00000713          	li	a4,0
    41e8:	00f90933          	add	s2,s2,a5
    41ec:	002a1793          	slli	a5,s4,0x2
    41f0:	00e7e7b3          	or	a5,a5,a4
    41f4:	00a00613          	li	a2,10
    41f8:	00190693          	addi	a3,s2,1
    41fc:	1ef64263          	blt	a2,a5,43e0 <__mulsf3+0x284>
    4200:	00200613          	li	a2,2
    4204:	0159c9b3          	xor	s3,s3,s5
    4208:	10f64e63          	blt	a2,a5,4324 <__mulsf3+0x1c8>
    420c:	fff78793          	addi	a5,a5,-1
    4210:	00100613          	li	a2,1
    4214:	12f67a63          	bgeu	a2,a5,4348 <__mulsf3+0x1ec>
    4218:	00010837          	lui	a6,0x10
    421c:	fff80513          	addi	a0,a6,-1 # ffff <_bss_end+0xab03>
    4220:	0104d613          	srli	a2,s1,0x10
    4224:	01045793          	srli	a5,s0,0x10
    4228:	00a4f4b3          	and	s1,s1,a0
    422c:	00a47433          	and	s0,s0,a0
    4230:	029405b3          	mul	a1,s0,s1
    4234:	02860433          	mul	s0,a2,s0
    4238:	02f60633          	mul	a2,a2,a5
    423c:	029787b3          	mul	a5,a5,s1
    4240:	00878733          	add	a4,a5,s0
    4244:	0105d793          	srli	a5,a1,0x10
    4248:	00e787b3          	add	a5,a5,a4
    424c:	0087f463          	bgeu	a5,s0,4254 <__mulsf3+0xf8>
    4250:	01060633          	add	a2,a2,a6
    4254:	00a7f733          	and	a4,a5,a0
    4258:	01071713          	slli	a4,a4,0x10
    425c:	00a5f5b3          	and	a1,a1,a0
    4260:	00b70733          	add	a4,a4,a1
    4264:	0107d793          	srli	a5,a5,0x10
    4268:	00671413          	slli	s0,a4,0x6
    426c:	00c787b3          	add	a5,a5,a2
    4270:	01a75713          	srli	a4,a4,0x1a
    4274:	00679793          	slli	a5,a5,0x6
    4278:	00803433          	snez	s0,s0
    427c:	00e46433          	or	s0,s0,a4
    4280:	00479713          	slli	a4,a5,0x4
    4284:	0087e433          	or	s0,a5,s0
    4288:	00075a63          	bgez	a4,429c <__mulsf3+0x140>
    428c:	00145793          	srli	a5,s0,0x1
    4290:	00147413          	andi	s0,s0,1
    4294:	0087e433          	or	s0,a5,s0
    4298:	00068913          	mv	s2,a3
    429c:	00090693          	mv	a3,s2
    42a0:	0c00006f          	j	4360 <__mulsf3+0x204>
    42a4:	02048a63          	beqz	s1,42d8 <__mulsf3+0x17c>
    42a8:	00048513          	mv	a0,s1
    42ac:	2a5000ef          	jal	4d50 <__clzsi2>
    42b0:	ffb50793          	addi	a5,a0,-5
    42b4:	f8a00913          	li	s2,-118
    42b8:	00f494b3          	sll	s1,s1,a5
    42bc:	40a90933          	sub	s2,s2,a0
    42c0:	ef1ff06f          	j	41b0 <__mulsf3+0x54>
    42c4:	0ff00913          	li	s2,255
    42c8:	00200a13          	li	s4,2
    42cc:	ee0484e3          	beqz	s1,41b4 <__mulsf3+0x58>
    42d0:	00300a13          	li	s4,3
    42d4:	ee1ff06f          	j	41b4 <__mulsf3+0x58>
    42d8:	00000913          	li	s2,0
    42dc:	00100a13          	li	s4,1
    42e0:	ed5ff06f          	j	41b4 <__mulsf3+0x58>
    42e4:	02040a63          	beqz	s0,4318 <__mulsf3+0x1bc>
    42e8:	00040513          	mv	a0,s0
    42ec:	265000ef          	jal	4d50 <__clzsi2>
    42f0:	ffb50793          	addi	a5,a0,-5
    42f4:	00f41433          	sll	s0,s0,a5
    42f8:	f8a00793          	li	a5,-118
    42fc:	40a787b3          	sub	a5,a5,a0
    4300:	ee5ff06f          	j	41e4 <__mulsf3+0x88>
    4304:	0ff00793          	li	a5,255
    4308:	00200713          	li	a4,2
    430c:	ec040ee3          	beqz	s0,41e8 <__mulsf3+0x8c>
    4310:	00300713          	li	a4,3
    4314:	ed5ff06f          	j	41e8 <__mulsf3+0x8c>
    4318:	00000793          	li	a5,0
    431c:	00100713          	li	a4,1
    4320:	ec9ff06f          	j	41e8 <__mulsf3+0x8c>
    4324:	00100613          	li	a2,1
    4328:	00f617b3          	sll	a5,a2,a5
    432c:	5307f613          	andi	a2,a5,1328
    4330:	0c061063          	bnez	a2,43f0 <__mulsf3+0x294>
    4334:	2407f613          	andi	a2,a5,576
    4338:	12061263          	bnez	a2,445c <__mulsf3+0x300>
    433c:	0887f793          	andi	a5,a5,136
    4340:	ec078ce3          	beqz	a5,4218 <__mulsf3+0xbc>
    4344:	000a8993          	mv	s3,s5
    4348:	00200793          	li	a5,2
    434c:	10f70263          	beq	a4,a5,4450 <__mulsf3+0x2f4>
    4350:	00300793          	li	a5,3
    4354:	10f70463          	beq	a4,a5,445c <__mulsf3+0x300>
    4358:	00100793          	li	a5,1
    435c:	10f70863          	beq	a4,a5,446c <__mulsf3+0x310>
    4360:	07f68713          	addi	a4,a3,127
    4364:	08e05c63          	blez	a4,43fc <__mulsf3+0x2a0>
    4368:	00747793          	andi	a5,s0,7
    436c:	00078a63          	beqz	a5,4380 <__mulsf3+0x224>
    4370:	00f47793          	andi	a5,s0,15
    4374:	00400613          	li	a2,4
    4378:	00c78463          	beq	a5,a2,4380 <__mulsf3+0x224>
    437c:	00440413          	addi	s0,s0,4
    4380:	00441793          	slli	a5,s0,0x4
    4384:	0007da63          	bgez	a5,4398 <__mulsf3+0x23c>
    4388:	f80007b7          	lui	a5,0xf8000
    438c:	fff78793          	addi	a5,a5,-1 # f7ffffff <_memory_end+0xf7fdffff>
    4390:	00f47433          	and	s0,s0,a5
    4394:	08068713          	addi	a4,a3,128
    4398:	0fe00793          	li	a5,254
    439c:	0ae7ca63          	blt	a5,a4,4450 <__mulsf3+0x2f4>
    43a0:	00345793          	srli	a5,s0,0x3
    43a4:	01c12083          	lw	ra,28(sp)
    43a8:	01812403          	lw	s0,24(sp)
    43ac:	00979793          	slli	a5,a5,0x9
    43b0:	01771513          	slli	a0,a4,0x17
    43b4:	0097d793          	srli	a5,a5,0x9
    43b8:	01f99993          	slli	s3,s3,0x1f
    43bc:	00f56533          	or	a0,a0,a5
    43c0:	01412483          	lw	s1,20(sp)
    43c4:	01012903          	lw	s2,16(sp)
    43c8:	00812a03          	lw	s4,8(sp)
    43cc:	00412a83          	lw	s5,4(sp)
    43d0:	01356533          	or	a0,a0,s3
    43d4:	00c12983          	lw	s3,12(sp)
    43d8:	02010113          	addi	sp,sp,32
    43dc:	00008067          	ret
    43e0:	00f00613          	li	a2,15
    43e4:	06c78c63          	beq	a5,a2,445c <__mulsf3+0x300>
    43e8:	00b00613          	li	a2,11
    43ec:	f4c78ce3          	beq	a5,a2,4344 <__mulsf3+0x1e8>
    43f0:	00048413          	mv	s0,s1
    43f4:	000a0713          	mv	a4,s4
    43f8:	f51ff06f          	j	4348 <__mulsf3+0x1ec>
    43fc:	00100793          	li	a5,1
    4400:	40e787b3          	sub	a5,a5,a4
    4404:	01b00713          	li	a4,27
    4408:	06f74263          	blt	a4,a5,446c <__mulsf3+0x310>
    440c:	09e68693          	addi	a3,a3,158
    4410:	00d416b3          	sll	a3,s0,a3
    4414:	00f457b3          	srl	a5,s0,a5
    4418:	00d036b3          	snez	a3,a3
    441c:	00d7e7b3          	or	a5,a5,a3
    4420:	0077f713          	andi	a4,a5,7
    4424:	00070a63          	beqz	a4,4438 <__mulsf3+0x2dc>
    4428:	00f7f713          	andi	a4,a5,15
    442c:	00400693          	li	a3,4
    4430:	00d70463          	beq	a4,a3,4438 <__mulsf3+0x2dc>
    4434:	00478793          	addi	a5,a5,4
    4438:	00579713          	slli	a4,a5,0x5
    443c:	0037d793          	srli	a5,a5,0x3
    4440:	02075863          	bgez	a4,4470 <__mulsf3+0x314>
    4444:	00000793          	li	a5,0
    4448:	00100713          	li	a4,1
    444c:	f59ff06f          	j	43a4 <__mulsf3+0x248>
    4450:	00000793          	li	a5,0
    4454:	0ff00713          	li	a4,255
    4458:	f4dff06f          	j	43a4 <__mulsf3+0x248>
    445c:	004007b7          	lui	a5,0x400
    4460:	0ff00713          	li	a4,255
    4464:	00000993          	li	s3,0
    4468:	f3dff06f          	j	43a4 <__mulsf3+0x248>
    446c:	00000793          	li	a5,0
    4470:	00000713          	li	a4,0
    4474:	f31ff06f          	j	43a4 <__mulsf3+0x248>

00004478 <__subsf3>:
    4478:	008006b7          	lui	a3,0x800
    447c:	fff68693          	addi	a3,a3,-1 # 7fffff <_memory_end+0x7dffff>
    4480:	ff010113          	addi	sp,sp,-16
    4484:	00a6f633          	and	a2,a3,a0
    4488:	01755713          	srli	a4,a0,0x17
    448c:	00812423          	sw	s0,8(sp)
    4490:	01f55413          	srli	s0,a0,0x1f
    4494:	00361513          	slli	a0,a2,0x3
    4498:	0175d613          	srli	a2,a1,0x17
    449c:	00b6f6b3          	and	a3,a3,a1
    44a0:	01212023          	sw	s2,0(sp)
    44a4:	00112623          	sw	ra,12(sp)
    44a8:	0ff77913          	zext.b	s2,a4
    44ac:	00912223          	sw	s1,4(sp)
    44b0:	0ff67613          	zext.b	a2,a2
    44b4:	0ff00713          	li	a4,255
    44b8:	01f5d593          	srli	a1,a1,0x1f
    44bc:	00369793          	slli	a5,a3,0x3
    44c0:	00e61463          	bne	a2,a4,44c8 <__subsf3+0x50>
    44c4:	00079463          	bnez	a5,44cc <__subsf3+0x54>
    44c8:	0015c593          	xori	a1,a1,1
    44cc:	40c906b3          	sub	a3,s2,a2
    44d0:	18859063          	bne	a1,s0,4650 <__subsf3+0x1d8>
    44d4:	08d05c63          	blez	a3,456c <__subsf3+0xf4>
    44d8:	02061663          	bnez	a2,4504 <__subsf3+0x8c>
    44dc:	02078063          	beqz	a5,44fc <__subsf3+0x84>
    44e0:	fff90693          	addi	a3,s2,-1
    44e4:	00069863          	bnez	a3,44f4 <__subsf3+0x7c>
    44e8:	00a787b3          	add	a5,a5,a0
    44ec:	00100913          	li	s2,1
    44f0:	04c0006f          	j	453c <__subsf3+0xc4>
    44f4:	0ff00713          	li	a4,255
    44f8:	00e91e63          	bne	s2,a4,4514 <__subsf3+0x9c>
    44fc:	00050793          	mv	a5,a0
    4500:	10c0006f          	j	460c <__subsf3+0x194>
    4504:	0ff00713          	li	a4,255
    4508:	fee90ae3          	beq	s2,a4,44fc <__subsf3+0x84>
    450c:	04000737          	lui	a4,0x4000
    4510:	00e7e7b3          	or	a5,a5,a4
    4514:	01b00613          	li	a2,27
    4518:	00100713          	li	a4,1
    451c:	00d64e63          	blt	a2,a3,4538 <__subsf3+0xc0>
    4520:	02000613          	li	a2,32
    4524:	00d7d733          	srl	a4,a5,a3
    4528:	40d606b3          	sub	a3,a2,a3
    452c:	00d796b3          	sll	a3,a5,a3
    4530:	00d036b3          	snez	a3,a3
    4534:	00d76733          	or	a4,a4,a3
    4538:	00a707b3          	add	a5,a4,a0
    453c:	00579713          	slli	a4,a5,0x5
    4540:	0c075663          	bgez	a4,460c <__subsf3+0x194>
    4544:	00190913          	addi	s2,s2,1
    4548:	0ff00713          	li	a4,255
    454c:	2ce90a63          	beq	s2,a4,4820 <__subsf3+0x3a8>
    4550:	7e000737          	lui	a4,0x7e000
    4554:	0017f693          	andi	a3,a5,1
    4558:	fff70713          	addi	a4,a4,-1 # 7dffffff <_memory_end+0x7dfdffff>
    455c:	0017d793          	srli	a5,a5,0x1
    4560:	00e7f7b3          	and	a5,a5,a4
    4564:	00d7e7b3          	or	a5,a5,a3
    4568:	0a40006f          	j	460c <__subsf3+0x194>
    456c:	06068663          	beqz	a3,45d8 <__subsf3+0x160>
    4570:	41260733          	sub	a4,a2,s2
    4574:	02091063          	bnez	s2,4594 <__subsf3+0x11c>
    4578:	0c050863          	beqz	a0,4648 <__subsf3+0x1d0>
    457c:	fff70693          	addi	a3,a4,-1
    4580:	f60684e3          	beqz	a3,44e8 <__subsf3+0x70>
    4584:	0ff00593          	li	a1,255
    4588:	02b71063          	bne	a4,a1,45a8 <__subsf3+0x130>
    458c:	0ff00913          	li	s2,255
    4590:	07c0006f          	j	460c <__subsf3+0x194>
    4594:	0ff00693          	li	a3,255
    4598:	fed60ae3          	beq	a2,a3,458c <__subsf3+0x114>
    459c:	040006b7          	lui	a3,0x4000
    45a0:	00d56533          	or	a0,a0,a3
    45a4:	00070693          	mv	a3,a4
    45a8:	01b00593          	li	a1,27
    45ac:	00100713          	li	a4,1
    45b0:	00d5ce63          	blt	a1,a3,45cc <__subsf3+0x154>
    45b4:	02000713          	li	a4,32
    45b8:	40d70733          	sub	a4,a4,a3
    45bc:	00e51733          	sll	a4,a0,a4
    45c0:	00d555b3          	srl	a1,a0,a3
    45c4:	00e03733          	snez	a4,a4
    45c8:	00e5e733          	or	a4,a1,a4
    45cc:	00e787b3          	add	a5,a5,a4
    45d0:	00060913          	mv	s2,a2
    45d4:	f69ff06f          	j	453c <__subsf3+0xc4>
    45d8:	00190713          	addi	a4,s2,1
    45dc:	0fe77693          	andi	a3,a4,254
    45e0:	04069c63          	bnez	a3,4638 <__subsf3+0x1c0>
    45e4:	04091263          	bnez	s2,4628 <__subsf3+0x1b0>
    45e8:	02050263          	beqz	a0,460c <__subsf3+0x194>
    45ec:	f00788e3          	beqz	a5,44fc <__subsf3+0x84>
    45f0:	00a787b3          	add	a5,a5,a0
    45f4:	00579713          	slli	a4,a5,0x5
    45f8:	00075a63          	bgez	a4,460c <__subsf3+0x194>
    45fc:	fc000737          	lui	a4,0xfc000
    4600:	fff70713          	addi	a4,a4,-1 # fbffffff <_memory_end+0xfbfdffff>
    4604:	00e7f7b3          	and	a5,a5,a4
    4608:	00100913          	li	s2,1
    460c:	0077f713          	andi	a4,a5,7
    4610:	20070a63          	beqz	a4,4824 <__subsf3+0x3ac>
    4614:	00f7f713          	andi	a4,a5,15
    4618:	00400693          	li	a3,4
    461c:	20d70463          	beq	a4,a3,4824 <__subsf3+0x3ac>
    4620:	00478793          	addi	a5,a5,4 # 400004 <_memory_end+0x3e0004>
    4624:	2000006f          	j	4824 <__subsf3+0x3ac>
    4628:	f60502e3          	beqz	a0,458c <__subsf3+0x114>
    462c:	16079663          	bnez	a5,4798 <__subsf3+0x320>
    4630:	00050793          	mv	a5,a0
    4634:	f59ff06f          	j	458c <__subsf3+0x114>
    4638:	0ff00693          	li	a3,255
    463c:	1ed70063          	beq	a4,a3,481c <__subsf3+0x3a4>
    4640:	00f507b3          	add	a5,a0,a5
    4644:	0017d793          	srli	a5,a5,0x1
    4648:	00070913          	mv	s2,a4
    464c:	fc1ff06f          	j	460c <__subsf3+0x194>
    4650:	06d05e63          	blez	a3,46cc <__subsf3+0x254>
    4654:	06061263          	bnez	a2,46b8 <__subsf3+0x240>
    4658:	ea0782e3          	beqz	a5,44fc <__subsf3+0x84>
    465c:	fff90693          	addi	a3,s2,-1
    4660:	00069863          	bnez	a3,4670 <__subsf3+0x1f8>
    4664:	40f507b3          	sub	a5,a0,a5
    4668:	00100913          	li	s2,1
    466c:	0340006f          	j	46a0 <__subsf3+0x228>
    4670:	0ff00713          	li	a4,255
    4674:	e8e904e3          	beq	s2,a4,44fc <__subsf3+0x84>
    4678:	01b00613          	li	a2,27
    467c:	00100713          	li	a4,1
    4680:	00d64e63          	blt	a2,a3,469c <__subsf3+0x224>
    4684:	02000613          	li	a2,32
    4688:	00d7d733          	srl	a4,a5,a3
    468c:	40d606b3          	sub	a3,a2,a3
    4690:	00d796b3          	sll	a3,a5,a3
    4694:	00d036b3          	snez	a3,a3
    4698:	00d76733          	or	a4,a4,a3
    469c:	40e507b3          	sub	a5,a0,a4
    46a0:	00579713          	slli	a4,a5,0x5
    46a4:	f60754e3          	bgez	a4,460c <__subsf3+0x194>
    46a8:	040004b7          	lui	s1,0x4000
    46ac:	fff48493          	addi	s1,s1,-1 # 3ffffff <_memory_end+0x3fdffff>
    46b0:	0097f4b3          	and	s1,a5,s1
    46b4:	1080006f          	j	47bc <__subsf3+0x344>
    46b8:	0ff00713          	li	a4,255
    46bc:	e4e900e3          	beq	s2,a4,44fc <__subsf3+0x84>
    46c0:	04000737          	lui	a4,0x4000
    46c4:	00e7e7b3          	or	a5,a5,a4
    46c8:	fb1ff06f          	j	4678 <__subsf3+0x200>
    46cc:	06068e63          	beqz	a3,4748 <__subsf3+0x2d0>
    46d0:	41260733          	sub	a4,a2,s2
    46d4:	02091663          	bnez	s2,4700 <__subsf3+0x288>
    46d8:	1a050e63          	beqz	a0,4894 <__subsf3+0x41c>
    46dc:	fff70693          	addi	a3,a4,-1 # 3ffffff <_memory_end+0x3fdffff>
    46e0:	00069863          	bnez	a3,46f0 <__subsf3+0x278>
    46e4:	40a787b3          	sub	a5,a5,a0
    46e8:	00058413          	mv	s0,a1
    46ec:	f7dff06f          	j	4668 <__subsf3+0x1f0>
    46f0:	0ff00813          	li	a6,255
    46f4:	03071063          	bne	a4,a6,4714 <__subsf3+0x29c>
    46f8:	0ff00913          	li	s2,255
    46fc:	19c0006f          	j	4898 <__subsf3+0x420>
    4700:	0ff00693          	li	a3,255
    4704:	fed60ae3          	beq	a2,a3,46f8 <__subsf3+0x280>
    4708:	040006b7          	lui	a3,0x4000
    470c:	00d56533          	or	a0,a0,a3
    4710:	00070693          	mv	a3,a4
    4714:	01b00813          	li	a6,27
    4718:	00100713          	li	a4,1
    471c:	00d84e63          	blt	a6,a3,4738 <__subsf3+0x2c0>
    4720:	02000713          	li	a4,32
    4724:	40d70733          	sub	a4,a4,a3
    4728:	00e51733          	sll	a4,a0,a4
    472c:	00d55833          	srl	a6,a0,a3
    4730:	00e03733          	snez	a4,a4
    4734:	00e86733          	or	a4,a6,a4
    4738:	40e787b3          	sub	a5,a5,a4
    473c:	00060913          	mv	s2,a2
    4740:	00058413          	mv	s0,a1
    4744:	f5dff06f          	j	46a0 <__subsf3+0x228>
    4748:	00190713          	addi	a4,s2,1
    474c:	0fe77713          	andi	a4,a4,254
    4750:	04071c63          	bnez	a4,47a8 <__subsf3+0x330>
    4754:	02091c63          	bnez	s2,478c <__subsf3+0x314>
    4758:	00051863          	bnez	a0,4768 <__subsf3+0x2f0>
    475c:	12079e63          	bnez	a5,4898 <__subsf3+0x420>
    4760:	00000413          	li	s0,0
    4764:	0c00006f          	j	4824 <__subsf3+0x3ac>
    4768:	d8078ae3          	beqz	a5,44fc <__subsf3+0x84>
    476c:	40f50733          	sub	a4,a0,a5
    4770:	00571693          	slli	a3,a4,0x5
    4774:	40a787b3          	sub	a5,a5,a0
    4778:	1206c063          	bltz	a3,4898 <__subsf3+0x420>
    477c:	00070793          	mv	a5,a4
    4780:	e80716e3          	bnez	a4,460c <__subsf3+0x194>
    4784:	00000793          	li	a5,0
    4788:	fd9ff06f          	j	4760 <__subsf3+0x2e8>
    478c:	ea0510e3          	bnez	a0,462c <__subsf3+0x1b4>
    4790:	00058413          	mv	s0,a1
    4794:	de079ce3          	bnez	a5,458c <__subsf3+0x114>
    4798:	00000413          	li	s0,0
    479c:	020007b7          	lui	a5,0x2000
    47a0:	0ff00913          	li	s2,255
    47a4:	0800006f          	j	4824 <__subsf3+0x3ac>
    47a8:	40f504b3          	sub	s1,a0,a5
    47ac:	00549713          	slli	a4,s1,0x5
    47b0:	04075463          	bgez	a4,47f8 <__subsf3+0x380>
    47b4:	40a784b3          	sub	s1,a5,a0
    47b8:	00058413          	mv	s0,a1
    47bc:	00048513          	mv	a0,s1
    47c0:	590000ef          	jal	4d50 <__clzsi2>
    47c4:	ffb50513          	addi	a0,a0,-5
    47c8:	00a494b3          	sll	s1,s1,a0
    47cc:	03254e63          	blt	a0,s2,4808 <__subsf3+0x390>
    47d0:	41250533          	sub	a0,a0,s2
    47d4:	00150513          	addi	a0,a0,1
    47d8:	02000713          	li	a4,32
    47dc:	40a70733          	sub	a4,a4,a0
    47e0:	00a4d7b3          	srl	a5,s1,a0
    47e4:	00e494b3          	sll	s1,s1,a4
    47e8:	009034b3          	snez	s1,s1
    47ec:	0097e7b3          	or	a5,a5,s1
    47f0:	00000913          	li	s2,0
    47f4:	e19ff06f          	j	460c <__subsf3+0x194>
    47f8:	fc0492e3          	bnez	s1,47bc <__subsf3+0x344>
    47fc:	00000793          	li	a5,0
    4800:	00000913          	li	s2,0
    4804:	f5dff06f          	j	4760 <__subsf3+0x2e8>
    4808:	fc0007b7          	lui	a5,0xfc000
    480c:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
    4810:	40a90933          	sub	s2,s2,a0
    4814:	00f4f7b3          	and	a5,s1,a5
    4818:	df5ff06f          	j	460c <__subsf3+0x194>
    481c:	0ff00913          	li	s2,255
    4820:	00000793          	li	a5,0
    4824:	00579713          	slli	a4,a5,0x5
    4828:	00075e63          	bgez	a4,4844 <__subsf3+0x3cc>
    482c:	00190913          	addi	s2,s2,1
    4830:	0ff00713          	li	a4,255
    4834:	06e90663          	beq	s2,a4,48a0 <__subsf3+0x428>
    4838:	fc000737          	lui	a4,0xfc000
    483c:	fff70713          	addi	a4,a4,-1 # fbffffff <_memory_end+0xfbfdffff>
    4840:	00e7f7b3          	and	a5,a5,a4
    4844:	0ff00713          	li	a4,255
    4848:	0037d793          	srli	a5,a5,0x3
    484c:	00e91863          	bne	s2,a4,485c <__subsf3+0x3e4>
    4850:	00078663          	beqz	a5,485c <__subsf3+0x3e4>
    4854:	004007b7          	lui	a5,0x400
    4858:	00000413          	li	s0,0
    485c:	00c12083          	lw	ra,12(sp)
    4860:	01791713          	slli	a4,s2,0x17
    4864:	01f41513          	slli	a0,s0,0x1f
    4868:	7f8006b7          	lui	a3,0x7f800
    486c:	00812403          	lw	s0,8(sp)
    4870:	00979793          	slli	a5,a5,0x9
    4874:	00d77733          	and	a4,a4,a3
    4878:	0097d793          	srli	a5,a5,0x9
    487c:	00f767b3          	or	a5,a4,a5
    4880:	00412483          	lw	s1,4(sp)
    4884:	00012903          	lw	s2,0(sp)
    4888:	00a7e533          	or	a0,a5,a0
    488c:	01010113          	addi	sp,sp,16
    4890:	00008067          	ret
    4894:	00070913          	mv	s2,a4
    4898:	00058413          	mv	s0,a1
    489c:	d71ff06f          	j	460c <__subsf3+0x194>
    48a0:	00000793          	li	a5,0
    48a4:	fa1ff06f          	j	4844 <__subsf3+0x3cc>

000048a8 <__fixsfsi>:
    48a8:	00800637          	lui	a2,0x800
    48ac:	01755713          	srli	a4,a0,0x17
    48b0:	fff60793          	addi	a5,a2,-1 # 7fffff <_memory_end+0x7dffff>
    48b4:	0ff77713          	zext.b	a4,a4
    48b8:	07e00593          	li	a1,126
    48bc:	00a7f7b3          	and	a5,a5,a0
    48c0:	01f55693          	srli	a3,a0,0x1f
    48c4:	04e5d663          	bge	a1,a4,4910 <__fixsfsi+0x68>
    48c8:	09d00593          	li	a1,157
    48cc:	00e5da63          	bge	a1,a4,48e0 <__fixsfsi+0x38>
    48d0:	80000537          	lui	a0,0x80000
    48d4:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
    48d8:	00a68533          	add	a0,a3,a0
    48dc:	00008067          	ret
    48e0:	00c7e533          	or	a0,a5,a2
    48e4:	09500793          	li	a5,149
    48e8:	00e7dc63          	bge	a5,a4,4900 <__fixsfsi+0x58>
    48ec:	f6a70713          	addi	a4,a4,-150
    48f0:	00e51533          	sll	a0,a0,a4
    48f4:	02068063          	beqz	a3,4914 <__fixsfsi+0x6c>
    48f8:	40a00533          	neg	a0,a0
    48fc:	00008067          	ret
    4900:	09600793          	li	a5,150
    4904:	40e787b3          	sub	a5,a5,a4
    4908:	00f55533          	srl	a0,a0,a5
    490c:	fe9ff06f          	j	48f4 <__fixsfsi+0x4c>
    4910:	00000513          	li	a0,0
    4914:	00008067          	ret

00004918 <__floatsisf>:
    4918:	ff010113          	addi	sp,sp,-16
    491c:	00112623          	sw	ra,12(sp)
    4920:	00812423          	sw	s0,8(sp)
    4924:	00912223          	sw	s1,4(sp)
    4928:	00050793          	mv	a5,a0
    492c:	0e050063          	beqz	a0,4a0c <__floatsisf+0xf4>
    4930:	41f55713          	srai	a4,a0,0x1f
    4934:	00a74433          	xor	s0,a4,a0
    4938:	40e40433          	sub	s0,s0,a4
    493c:	01f55493          	srli	s1,a0,0x1f
    4940:	00040513          	mv	a0,s0
    4944:	40c000ef          	jal	4d50 <__clzsi2>
    4948:	09e00793          	li	a5,158
    494c:	40a787b3          	sub	a5,a5,a0
    4950:	09600713          	li	a4,150
    4954:	04f74063          	blt	a4,a5,4994 <__floatsisf+0x7c>
    4958:	00800713          	li	a4,8
    495c:	0ae50e63          	beq	a0,a4,4a18 <__floatsisf+0x100>
    4960:	ff850513          	addi	a0,a0,-8
    4964:	00a41433          	sll	s0,s0,a0
    4968:	00941413          	slli	s0,s0,0x9
    496c:	00945413          	srli	s0,s0,0x9
    4970:	01779793          	slli	a5,a5,0x17
    4974:	00c12083          	lw	ra,12(sp)
    4978:	0087e7b3          	or	a5,a5,s0
    497c:	00812403          	lw	s0,8(sp)
    4980:	01f49513          	slli	a0,s1,0x1f
    4984:	00a7e533          	or	a0,a5,a0
    4988:	00412483          	lw	s1,4(sp)
    498c:	01010113          	addi	sp,sp,16
    4990:	00008067          	ret
    4994:	09900713          	li	a4,153
    4998:	06f75463          	bge	a4,a5,4a00 <__floatsisf+0xe8>
    499c:	00500713          	li	a4,5
    49a0:	40a70733          	sub	a4,a4,a0
    49a4:	01b50693          	addi	a3,a0,27
    49a8:	00e45733          	srl	a4,s0,a4
    49ac:	00d41433          	sll	s0,s0,a3
    49b0:	00803433          	snez	s0,s0
    49b4:	00876733          	or	a4,a4,s0
    49b8:	fc000437          	lui	s0,0xfc000
    49bc:	fff40413          	addi	s0,s0,-1 # fbffffff <_memory_end+0xfbfdffff>
    49c0:	00777693          	andi	a3,a4,7
    49c4:	00877433          	and	s0,a4,s0
    49c8:	00068a63          	beqz	a3,49dc <__floatsisf+0xc4>
    49cc:	00f77713          	andi	a4,a4,15
    49d0:	00400693          	li	a3,4
    49d4:	00d70463          	beq	a4,a3,49dc <__floatsisf+0xc4>
    49d8:	00440413          	addi	s0,s0,4
    49dc:	00541713          	slli	a4,s0,0x5
    49e0:	00075c63          	bgez	a4,49f8 <__floatsisf+0xe0>
    49e4:	fc0007b7          	lui	a5,0xfc000
    49e8:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
    49ec:	00f47433          	and	s0,s0,a5
    49f0:	09f00793          	li	a5,159
    49f4:	40a787b3          	sub	a5,a5,a0
    49f8:	00345413          	srli	s0,s0,0x3
    49fc:	f6dff06f          	j	4968 <__floatsisf+0x50>
    4a00:	ffb50713          	addi	a4,a0,-5
    4a04:	00e41733          	sll	a4,s0,a4
    4a08:	fb1ff06f          	j	49b8 <__floatsisf+0xa0>
    4a0c:	00000493          	li	s1,0
    4a10:	00000413          	li	s0,0
    4a14:	f55ff06f          	j	4968 <__floatsisf+0x50>
    4a18:	09600793          	li	a5,150
    4a1c:	f4dff06f          	j	4968 <__floatsisf+0x50>

00004a20 <__floatunsisf>:
    4a20:	ff010113          	addi	sp,sp,-16
    4a24:	00812423          	sw	s0,8(sp)
    4a28:	00112623          	sw	ra,12(sp)
    4a2c:	00050413          	mv	s0,a0
    4a30:	00000713          	li	a4,0
    4a34:	02050463          	beqz	a0,4a5c <__floatunsisf+0x3c>
    4a38:	318000ef          	jal	4d50 <__clzsi2>
    4a3c:	09e00713          	li	a4,158
    4a40:	40a70733          	sub	a4,a4,a0
    4a44:	09600793          	li	a5,150
    4a48:	02e7ca63          	blt	a5,a4,4a7c <__floatunsisf+0x5c>
    4a4c:	00800793          	li	a5,8
    4a50:	0af50263          	beq	a0,a5,4af4 <__floatunsisf+0xd4>
    4a54:	ff850513          	addi	a0,a0,-8
    4a58:	00a41433          	sll	s0,s0,a0
    4a5c:	00941413          	slli	s0,s0,0x9
    4a60:	00945413          	srli	s0,s0,0x9
    4a64:	01771513          	slli	a0,a4,0x17
    4a68:	00c12083          	lw	ra,12(sp)
    4a6c:	00856533          	or	a0,a0,s0
    4a70:	00812403          	lw	s0,8(sp)
    4a74:	01010113          	addi	sp,sp,16
    4a78:	00008067          	ret
    4a7c:	09900793          	li	a5,153
    4a80:	06e7d463          	bge	a5,a4,4ae8 <__floatunsisf+0xc8>
    4a84:	01b50793          	addi	a5,a0,27
    4a88:	00500693          	li	a3,5
    4a8c:	00f417b3          	sll	a5,s0,a5
    4a90:	40a686b3          	sub	a3,a3,a0
    4a94:	00f037b3          	snez	a5,a5
    4a98:	00d45433          	srl	s0,s0,a3
    4a9c:	0087e7b3          	or	a5,a5,s0
    4aa0:	fc000437          	lui	s0,0xfc000
    4aa4:	fff40413          	addi	s0,s0,-1 # fbffffff <_memory_end+0xfbfdffff>
    4aa8:	0077f693          	andi	a3,a5,7
    4aac:	0087f433          	and	s0,a5,s0
    4ab0:	00068a63          	beqz	a3,4ac4 <__floatunsisf+0xa4>
    4ab4:	00f7f793          	andi	a5,a5,15
    4ab8:	00400693          	li	a3,4
    4abc:	00d78463          	beq	a5,a3,4ac4 <__floatunsisf+0xa4>
    4ac0:	00440413          	addi	s0,s0,4
    4ac4:	00541793          	slli	a5,s0,0x5
    4ac8:	0007dc63          	bgez	a5,4ae0 <__floatunsisf+0xc0>
    4acc:	fc0007b7          	lui	a5,0xfc000
    4ad0:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
    4ad4:	09f00713          	li	a4,159
    4ad8:	00f47433          	and	s0,s0,a5
    4adc:	40a70733          	sub	a4,a4,a0
    4ae0:	00345413          	srli	s0,s0,0x3
    4ae4:	f79ff06f          	j	4a5c <__floatunsisf+0x3c>
    4ae8:	ffb50793          	addi	a5,a0,-5
    4aec:	00f417b3          	sll	a5,s0,a5
    4af0:	fb1ff06f          	j	4aa0 <__floatunsisf+0x80>
    4af4:	09600713          	li	a4,150
    4af8:	f65ff06f          	j	4a5c <__floatunsisf+0x3c>

00004afc <__extendsfdf2>:
    4afc:	01755713          	srli	a4,a0,0x17
    4b00:	0ff77713          	zext.b	a4,a4
    4b04:	ff010113          	addi	sp,sp,-16
    4b08:	00170793          	addi	a5,a4,1
    4b0c:	00812423          	sw	s0,8(sp)
    4b10:	00912223          	sw	s1,4(sp)
    4b14:	00951413          	slli	s0,a0,0x9
    4b18:	00112623          	sw	ra,12(sp)
    4b1c:	0fe7f793          	andi	a5,a5,254
    4b20:	00945413          	srli	s0,s0,0x9
    4b24:	01f55493          	srli	s1,a0,0x1f
    4b28:	04078263          	beqz	a5,4b6c <__extendsfdf2+0x70>
    4b2c:	00345793          	srli	a5,s0,0x3
    4b30:	38070713          	addi	a4,a4,896
    4b34:	01d41413          	slli	s0,s0,0x1d
    4b38:	00c79793          	slli	a5,a5,0xc
    4b3c:	00c7d793          	srli	a5,a5,0xc
    4b40:	01471713          	slli	a4,a4,0x14
    4b44:	01f49513          	slli	a0,s1,0x1f
    4b48:	00f76733          	or	a4,a4,a5
    4b4c:	00c12083          	lw	ra,12(sp)
    4b50:	00a767b3          	or	a5,a4,a0
    4b54:	00040513          	mv	a0,s0
    4b58:	00812403          	lw	s0,8(sp)
    4b5c:	00412483          	lw	s1,4(sp)
    4b60:	00078593          	mv	a1,a5
    4b64:	01010113          	addi	sp,sp,16
    4b68:	00008067          	ret
    4b6c:	04071663          	bnez	a4,4bb8 <__extendsfdf2+0xbc>
    4b70:	00000793          	li	a5,0
    4b74:	fc0402e3          	beqz	s0,4b38 <__extendsfdf2+0x3c>
    4b78:	00040513          	mv	a0,s0
    4b7c:	1d4000ef          	jal	4d50 <__clzsi2>
    4b80:	00a00793          	li	a5,10
    4b84:	02a7c263          	blt	a5,a0,4ba8 <__extendsfdf2+0xac>
    4b88:	00b00793          	li	a5,11
    4b8c:	40a787b3          	sub	a5,a5,a0
    4b90:	01550713          	addi	a4,a0,21
    4b94:	00f457b3          	srl	a5,s0,a5
    4b98:	00e41433          	sll	s0,s0,a4
    4b9c:	38900713          	li	a4,905
    4ba0:	40a70733          	sub	a4,a4,a0
    4ba4:	f95ff06f          	j	4b38 <__extendsfdf2+0x3c>
    4ba8:	ff550793          	addi	a5,a0,-11
    4bac:	00f417b3          	sll	a5,s0,a5
    4bb0:	00000413          	li	s0,0
    4bb4:	fe9ff06f          	j	4b9c <__extendsfdf2+0xa0>
    4bb8:	00000793          	li	a5,0
    4bbc:	00040a63          	beqz	s0,4bd0 <__extendsfdf2+0xd4>
    4bc0:	00345793          	srli	a5,s0,0x3
    4bc4:	00080737          	lui	a4,0x80
    4bc8:	01d41413          	slli	s0,s0,0x1d
    4bcc:	00e7e7b3          	or	a5,a5,a4
    4bd0:	7ff00713          	li	a4,2047
    4bd4:	f65ff06f          	j	4b38 <__extendsfdf2+0x3c>

00004bd8 <__truncdfsf2>:
    4bd8:	0145d613          	srli	a2,a1,0x14
    4bdc:	7ff67613          	andi	a2,a2,2047
    4be0:	00c59793          	slli	a5,a1,0xc
    4be4:	00160713          	addi	a4,a2,1
    4be8:	0097d793          	srli	a5,a5,0x9
    4bec:	01d55693          	srli	a3,a0,0x1d
    4bf0:	7fe77713          	andi	a4,a4,2046
    4bf4:	00f6e6b3          	or	a3,a3,a5
    4bf8:	01f5d593          	srli	a1,a1,0x1f
    4bfc:	00351793          	slli	a5,a0,0x3
    4c00:	0a070663          	beqz	a4,4cac <__truncdfsf2+0xd4>
    4c04:	c8060713          	addi	a4,a2,-896
    4c08:	0fe00813          	li	a6,254
    4c0c:	0ce84263          	blt	a6,a4,4cd0 <__truncdfsf2+0xf8>
    4c10:	08e04063          	bgtz	a4,4c90 <__truncdfsf2+0xb8>
    4c14:	fe900513          	li	a0,-23
    4c18:	10a74a63          	blt	a4,a0,4d2c <__truncdfsf2+0x154>
    4c1c:	00800537          	lui	a0,0x800
    4c20:	00a6e6b3          	or	a3,a3,a0
    4c24:	01e00513          	li	a0,30
    4c28:	40e50533          	sub	a0,a0,a4
    4c2c:	01f00813          	li	a6,31
    4c30:	02a84863          	blt	a6,a0,4c60 <__truncdfsf2+0x88>
    4c34:	c8260613          	addi	a2,a2,-894
    4c38:	00a7d533          	srl	a0,a5,a0
    4c3c:	00c797b3          	sll	a5,a5,a2
    4c40:	00f037b3          	snez	a5,a5
    4c44:	00c696b3          	sll	a3,a3,a2
    4c48:	00d7e7b3          	or	a5,a5,a3
    4c4c:	00f567b3          	or	a5,a0,a5
    4c50:	00000713          	li	a4,0
    4c54:	0077f693          	andi	a3,a5,7
    4c58:	08068063          	beqz	a3,4cd8 <__truncdfsf2+0x100>
    4c5c:	0d80006f          	j	4d34 <__truncdfsf2+0x15c>
    4c60:	ffe00813          	li	a6,-2
    4c64:	40e80833          	sub	a6,a6,a4
    4c68:	02000893          	li	a7,32
    4c6c:	0106d833          	srl	a6,a3,a6
    4c70:	00000713          	li	a4,0
    4c74:	01150663          	beq	a0,a7,4c80 <__truncdfsf2+0xa8>
    4c78:	ca260613          	addi	a2,a2,-862
    4c7c:	00c69733          	sll	a4,a3,a2
    4c80:	00f76733          	or	a4,a4,a5
    4c84:	00e03733          	snez	a4,a4
    4c88:	00e867b3          	or	a5,a6,a4
    4c8c:	fc5ff06f          	j	4c50 <__truncdfsf2+0x78>
    4c90:	00651513          	slli	a0,a0,0x6
    4c94:	00a03533          	snez	a0,a0
    4c98:	00369693          	slli	a3,a3,0x3
    4c9c:	01d7d793          	srli	a5,a5,0x1d
    4ca0:	00d566b3          	or	a3,a0,a3
    4ca4:	00f6e7b3          	or	a5,a3,a5
    4ca8:	fadff06f          	j	4c54 <__truncdfsf2+0x7c>
    4cac:	00f6e7b3          	or	a5,a3,a5
    4cb0:	00061663          	bnez	a2,4cbc <__truncdfsf2+0xe4>
    4cb4:	00f037b3          	snez	a5,a5
    4cb8:	f99ff06f          	j	4c50 <__truncdfsf2+0x78>
    4cbc:	0ff00713          	li	a4,255
    4cc0:	00078c63          	beqz	a5,4cd8 <__truncdfsf2+0x100>
    4cc4:	00369693          	slli	a3,a3,0x3
    4cc8:	020007b7          	lui	a5,0x2000
    4ccc:	fd9ff06f          	j	4ca4 <__truncdfsf2+0xcc>
    4cd0:	00000793          	li	a5,0
    4cd4:	0ff00713          	li	a4,255
    4cd8:	00579693          	slli	a3,a5,0x5
    4cdc:	0006de63          	bgez	a3,4cf8 <__truncdfsf2+0x120>
    4ce0:	00170713          	addi	a4,a4,1 # 80001 <_memory_end+0x60001>
    4ce4:	0ff00693          	li	a3,255
    4ce8:	06d70063          	beq	a4,a3,4d48 <__truncdfsf2+0x170>
    4cec:	fc0006b7          	lui	a3,0xfc000
    4cf0:	fff68693          	addi	a3,a3,-1 # fbffffff <_memory_end+0xfbfdffff>
    4cf4:	00d7f7b3          	and	a5,a5,a3
    4cf8:	0ff00693          	li	a3,255
    4cfc:	0037d793          	srli	a5,a5,0x3
    4d00:	00d71863          	bne	a4,a3,4d10 <__truncdfsf2+0x138>
    4d04:	00078663          	beqz	a5,4d10 <__truncdfsf2+0x138>
    4d08:	004007b7          	lui	a5,0x400
    4d0c:	00000593          	li	a1,0
    4d10:	7f8006b7          	lui	a3,0x7f800
    4d14:	01771713          	slli	a4,a4,0x17
    4d18:	00d77733          	and	a4,a4,a3
    4d1c:	00f76733          	or	a4,a4,a5
    4d20:	01f59513          	slli	a0,a1,0x1f
    4d24:	00a76533          	or	a0,a4,a0
    4d28:	00008067          	ret
    4d2c:	00100793          	li	a5,1
    4d30:	00000713          	li	a4,0
    4d34:	00f7f693          	andi	a3,a5,15
    4d38:	00400613          	li	a2,4
    4d3c:	f8c68ee3          	beq	a3,a2,4cd8 <__truncdfsf2+0x100>
    4d40:	00478793          	addi	a5,a5,4 # 400004 <_memory_end+0x3e0004>
    4d44:	f95ff06f          	j	4cd8 <__truncdfsf2+0x100>
    4d48:	00000793          	li	a5,0
    4d4c:	fadff06f          	j	4cf8 <__truncdfsf2+0x120>

00004d50 <__clzsi2>:
    4d50:	000107b7          	lui	a5,0x10
    4d54:	02f57863          	bgeu	a0,a5,4d84 <__clzsi2+0x34>
    4d58:	10053793          	sltiu	a5,a0,256
    4d5c:	0017b793          	seqz	a5,a5
    4d60:	00379793          	slli	a5,a5,0x3
    4d64:	02000693          	li	a3,32
    4d68:	40f686b3          	sub	a3,a3,a5
    4d6c:	00f55533          	srl	a0,a0,a5
    4d70:	5c418793          	addi	a5,gp,1476 # 535c <__clz_tab>
    4d74:	00a787b3          	add	a5,a5,a0
    4d78:	0007c503          	lbu	a0,0(a5) # 10000 <_bss_end+0xab04>
    4d7c:	40a68533          	sub	a0,a3,a0
    4d80:	00008067          	ret
    4d84:	01000737          	lui	a4,0x1000
    4d88:	01800793          	li	a5,24
    4d8c:	fce57ce3          	bgeu	a0,a4,4d64 <__clzsi2+0x14>
    4d90:	01000793          	li	a5,16
    4d94:	fd1ff06f          	j	4d64 <__clzsi2+0x14>
