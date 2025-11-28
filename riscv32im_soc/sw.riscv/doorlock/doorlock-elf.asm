
doorlock.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00004197          	auipc	gp,0x4
       4:	6c018193          	addi	gp,gp,1728 # 46c0 <__global_pointer$>
       8:	00020117          	auipc	sp,0x20
       c:	ff810113          	addi	sp,sp,-8 # 20000 <_memory_end>
      10:	54018e13          	addi	t3,gp,1344 # 4c00 <current_i2c_id>
      14:	54418e93          	addi	t4,gp,1348 # 4c04 <_bss_end>
      18:	00c0006f          	j	24 <clear_bss_end>

0000001c <clear_bss32>:
      1c:	000e2023          	sw	zero,0(t3)
      20:	004e0e13          	addi	t3,t3,4

00000024 <clear_bss_end>:
      24:	ffde6ce3          	bltu	t3,t4,1c <clear_bss32>

00000028 <main_entry>:
      28:	00000513          	li	a0,0
      2c:	00000593          	li	a1,0
      30:	060000ef          	jal	90 <main>
      34:	00040513          	mv	a0,s0

00000038 <terminate>:
      38:	00100293          	li	t0,1
      3c:	4d818313          	addi	t1,gp,1240 # 4b98 <tohost>
      40:	00532023          	sw	t0,0(t1)
      44:	0000006f          	j	44 <terminate+0xc>

00000048 <delay>:
      48:	fd010113          	addi	sp,sp,-48
      4c:	02812623          	sw	s0,44(sp)
      50:	03010413          	addi	s0,sp,48
      54:	fca42e23          	sw	a0,-36(s0)
      58:	fe042623          	sw	zero,-20(s0)
      5c:	0140006f          	j	70 <delay+0x28>
      60:	00000013          	nop
      64:	fec42783          	lw	a5,-20(s0)
      68:	00178793          	addi	a5,a5,1
      6c:	fef42623          	sw	a5,-20(s0)
      70:	fec42783          	lw	a5,-20(s0)
      74:	fdc42703          	lw	a4,-36(s0)
      78:	fee7e4e3          	bltu	a5,a4,60 <delay+0x18>
      7c:	00000013          	nop
      80:	00000013          	nop
      84:	02c12403          	lw	s0,44(sp)
      88:	03010113          	addi	sp,sp,48
      8c:	00008067          	ret

00000090 <main>:
      90:	fc010113          	addi	sp,sp,-64
      94:	02112e23          	sw	ra,60(sp)
      98:	02812c23          	sw	s0,56(sp)
      9c:	04010413          	addi	s0,sp,64
      a0:	00100713          	li	a4,1
      a4:	00000693          	li	a3,0
      a8:	00800613          	li	a2,8
      ac:	0001c7b7          	lui	a5,0x1c
      b0:	20078593          	addi	a1,a5,512 # 1c200 <_bss_end+0x175fc>
      b4:	00000513          	li	a0,0
      b8:	1ed000ef          	jal	aa4 <uart_init>
      bc:	00018513          	mv	a0,gp
      c0:	3b8000ef          	jal	478 <my_printf>
      c4:	90050537          	lui	a0,0x90050
      c8:	7f4020ef          	jal	28bc <i2c_set_addr>
      cc:	000187b7          	lui	a5,0x18
      d0:	6a078513          	addi	a0,a5,1696 # 186a0 <_bss_end+0x13a9c>
      d4:	33c020ef          	jal	2410 <i2c_init>
      d8:	18c020ef          	jal	2264 <i2c_enable>
      dc:	fc040ba3          	sb	zero,-41(s0)
      e0:	ddccc7b7          	lui	a5,0xddccc
      e4:	baa78793          	addi	a5,a5,-1110 # ddccbbaa <_memory_end+0xddcabbaa>
      e8:	fcf42423          	sw	a5,-56(s0)
      ec:	02418513          	addi	a0,gp,36 # 46e4 <__global_pointer$+0x24>
      f0:	388000ef          	jal	478 <my_printf>
      f4:	fd744783          	lbu	a5,-41(s0)
      f8:	00078593          	mv	a1,a5
      fc:	03c18513          	addi	a0,gp,60 # 46fc <__global_pointer$+0x3c>
     100:	378000ef          	jal	478 <my_printf>
     104:	00100793          	li	a5,1
     108:	fef42623          	sw	a5,-20(s0)
     10c:	fe042423          	sw	zero,-24(s0)
     110:	0800006f          	j	190 <main+0x100>
     114:	fe842783          	lw	a5,-24(s0)
     118:	0ff7f793          	zext.b	a5,a5
     11c:	fd744703          	lbu	a4,-41(s0)
     120:	00e787b3          	add	a5,a5,a4
     124:	0ff7f713          	zext.b	a4,a5
     128:	fe842783          	lw	a5,-24(s0)
     12c:	ff078793          	addi	a5,a5,-16
     130:	008787b3          	add	a5,a5,s0
     134:	fd87c783          	lbu	a5,-40(a5)
     138:	00078613          	mv	a2,a5
     13c:	00070593          	mv	a1,a4
     140:	05700513          	li	a0,87
     144:	4ac010ef          	jal	15f0 <i2c_write_d7r8>
     148:	fca42623          	sw	a0,-52(s0)
     14c:	fcc42783          	lw	a5,-52(s0)
     150:	02079263          	bnez	a5,174 <main+0xe4>
     154:	fe842783          	lw	a5,-24(s0)
     158:	ff078793          	addi	a5,a5,-16
     15c:	008787b3          	add	a5,a5,s0
     160:	fd87c783          	lbu	a5,-40(a5)
     164:	00078593          	mv	a1,a5
     168:	05418513          	addi	a0,gp,84 # 4714 <__global_pointer$+0x54>
     16c:	30c000ef          	jal	478 <my_printf>
     170:	0140006f          	j	184 <main+0xf4>
     174:	fcc42583          	lw	a1,-52(s0)
     178:	05c18513          	addi	a0,gp,92 # 471c <__global_pointer$+0x5c>
     17c:	2fc000ef          	jal	478 <my_printf>
     180:	fe042623          	sw	zero,-20(s0)
     184:	fe842783          	lw	a5,-24(s0)
     188:	00178793          	addi	a5,a5,1
     18c:	fef42423          	sw	a5,-24(s0)
     190:	fe842703          	lw	a4,-24(s0)
     194:	00300793          	li	a5,3
     198:	f6e7dee3          	bge	a5,a4,114 <main+0x84>
     19c:	06818513          	addi	a0,gp,104 # 4728 <__global_pointer$+0x68>
     1a0:	2d8000ef          	jal	478 <my_printf>
     1a4:	fec42783          	lw	a5,-20(s0)
     1a8:	00079a63          	bnez	a5,1bc <main+0x12c>
     1ac:	06c18513          	addi	a0,gp,108 # 472c <__global_pointer$+0x6c>
     1b0:	2c8000ef          	jal	478 <my_printf>
     1b4:	fff00793          	li	a5,-1
     1b8:	19c0006f          	j	354 <main+0x2c4>
     1bc:	000187b7          	lui	a5,0x18
     1c0:	6a078513          	addi	a0,a5,1696 # 186a0 <_bss_end+0x13a9c>
     1c4:	e85ff0ef          	jal	48 <delay>
     1c8:	07c18513          	addi	a0,gp,124 # 473c <__global_pointer$+0x7c>
     1cc:	2ac000ef          	jal	478 <my_printf>
     1d0:	09c18513          	addi	a0,gp,156 # 475c <__global_pointer$+0x9c>
     1d4:	2a4000ef          	jal	478 <my_printf>
     1d8:	fd744783          	lbu	a5,-41(s0)
     1dc:	00078593          	mv	a1,a5
     1e0:	03c18513          	addi	a0,gp,60 # 46fc <__global_pointer$+0x3c>
     1e4:	294000ef          	jal	478 <my_printf>
     1e8:	00100793          	li	a5,1
     1ec:	fef42223          	sw	a5,-28(s0)
     1f0:	fe042023          	sw	zero,-32(s0)
     1f4:	07c0006f          	j	270 <main+0x1e0>
     1f8:	fe042783          	lw	a5,-32(s0)
     1fc:	0ff7f793          	zext.b	a5,a5
     200:	fd744703          	lbu	a4,-41(s0)
     204:	00e787b3          	add	a5,a5,a4
     208:	0ff7f693          	zext.b	a3,a5
     20c:	fc440713          	addi	a4,s0,-60
     210:	fe042783          	lw	a5,-32(s0)
     214:	00f707b3          	add	a5,a4,a5
     218:	00078613          	mv	a2,a5
     21c:	00068593          	mv	a1,a3
     220:	05700513          	li	a0,87
     224:	729000ef          	jal	114c <i2c_read_d7r8>
     228:	fca42823          	sw	a0,-48(s0)
     22c:	fd042783          	lw	a5,-48(s0)
     230:	02079263          	bnez	a5,254 <main+0x1c4>
     234:	fe042783          	lw	a5,-32(s0)
     238:	ff078793          	addi	a5,a5,-16
     23c:	008787b3          	add	a5,a5,s0
     240:	fd47c783          	lbu	a5,-44(a5)
     244:	00078593          	mv	a1,a5
     248:	05418513          	addi	a0,gp,84 # 4714 <__global_pointer$+0x54>
     24c:	22c000ef          	jal	478 <my_printf>
     250:	0140006f          	j	264 <main+0x1d4>
     254:	fd042583          	lw	a1,-48(s0)
     258:	05c18513          	addi	a0,gp,92 # 471c <__global_pointer$+0x5c>
     25c:	21c000ef          	jal	478 <my_printf>
     260:	fe042223          	sw	zero,-28(s0)
     264:	fe042783          	lw	a5,-32(s0)
     268:	00178793          	addi	a5,a5,1
     26c:	fef42023          	sw	a5,-32(s0)
     270:	fe042703          	lw	a4,-32(s0)
     274:	00300793          	li	a5,3
     278:	f8e7d0e3          	bge	a5,a4,1f8 <main+0x168>
     27c:	06818513          	addi	a0,gp,104 # 4728 <__global_pointer$+0x68>
     280:	1f8000ef          	jal	478 <my_printf>
     284:	fe442783          	lw	a5,-28(s0)
     288:	00079a63          	bnez	a5,29c <main+0x20c>
     28c:	0b418513          	addi	a0,gp,180 # 4774 <__global_pointer$+0xb4>
     290:	1e8000ef          	jal	478 <my_printf>
     294:	fff00793          	li	a5,-1
     298:	0bc0006f          	j	354 <main+0x2c4>
     29c:	0c418513          	addi	a0,gp,196 # 4784 <__global_pointer$+0xc4>
     2a0:	1d8000ef          	jal	478 <my_printf>
     2a4:	00100793          	li	a5,1
     2a8:	fcf42e23          	sw	a5,-36(s0)
     2ac:	fc042c23          	sw	zero,-40(s0)
     2b0:	0700006f          	j	320 <main+0x290>
     2b4:	fd842783          	lw	a5,-40(s0)
     2b8:	ff078793          	addi	a5,a5,-16
     2bc:	008787b3          	add	a5,a5,s0
     2c0:	fd87c703          	lbu	a4,-40(a5)
     2c4:	fd842783          	lw	a5,-40(s0)
     2c8:	ff078793          	addi	a5,a5,-16
     2cc:	008787b3          	add	a5,a5,s0
     2d0:	fd47c783          	lbu	a5,-44(a5)
     2d4:	04f70063          	beq	a4,a5,314 <main+0x284>
     2d8:	fc042e23          	sw	zero,-36(s0)
     2dc:	fd842783          	lw	a5,-40(s0)
     2e0:	ff078793          	addi	a5,a5,-16
     2e4:	008787b3          	add	a5,a5,s0
     2e8:	fd87c783          	lbu	a5,-40(a5)
     2ec:	00078713          	mv	a4,a5
     2f0:	fd842783          	lw	a5,-40(s0)
     2f4:	ff078793          	addi	a5,a5,-16
     2f8:	008787b3          	add	a5,a5,s0
     2fc:	fd47c783          	lbu	a5,-44(a5)
     300:	00078693          	mv	a3,a5
     304:	00070613          	mv	a2,a4
     308:	fd842583          	lw	a1,-40(s0)
     30c:	0d418513          	addi	a0,gp,212 # 4794 <__global_pointer$+0xd4>
     310:	168000ef          	jal	478 <my_printf>
     314:	fd842783          	lw	a5,-40(s0)
     318:	00178793          	addi	a5,a5,1
     31c:	fcf42c23          	sw	a5,-40(s0)
     320:	fd842703          	lw	a4,-40(s0)
     324:	00300793          	li	a5,3
     328:	f8e7d6e3          	bge	a5,a4,2b4 <main+0x224>
     32c:	fdc42783          	lw	a5,-36(s0)
     330:	00078863          	beqz	a5,340 <main+0x2b0>
     334:	10418513          	addi	a0,gp,260 # 47c4 <__global_pointer$+0x104>
     338:	140000ef          	jal	478 <my_printf>
     33c:	00c0006f          	j	348 <main+0x2b8>
     340:	10c18513          	addi	a0,gp,268 # 47cc <__global_pointer$+0x10c>
     344:	134000ef          	jal	478 <my_printf>
     348:	11418513          	addi	a0,gp,276 # 47d4 <__global_pointer$+0x114>
     34c:	12c000ef          	jal	478 <my_printf>
     350:	00000793          	li	a5,0
     354:	00078513          	mv	a0,a5
     358:	03c12083          	lw	ra,60(sp)
     35c:	03812403          	lw	s0,56(sp)
     360:	04010113          	addi	sp,sp,64
     364:	00008067          	ret

00000368 <my_putc>:
     368:	fe010113          	addi	sp,sp,-32
     36c:	00112e23          	sw	ra,28(sp)
     370:	00812c23          	sw	s0,24(sp)
     374:	02010413          	addi	s0,sp,32
     378:	fea42623          	sw	a0,-20(s0)
     37c:	feb42423          	sw	a1,-24(s0)
     380:	fec42783          	lw	a5,-20(s0)
     384:	0ff7f793          	zext.b	a5,a5
     388:	00078513          	mv	a0,a5
     38c:	229000ef          	jal	db4 <uart_put_char>
     390:	00050793          	mv	a5,a0
     394:	00078513          	mv	a0,a5
     398:	01c12083          	lw	ra,28(sp)
     39c:	01812403          	lw	s0,24(sp)
     3a0:	02010113          	addi	sp,sp,32
     3a4:	00008067          	ret

000003a8 <my_putchar>:
     3a8:	fe010113          	addi	sp,sp,-32
     3ac:	00112e23          	sw	ra,28(sp)
     3b0:	00812c23          	sw	s0,24(sp)
     3b4:	02010413          	addi	s0,sp,32
     3b8:	fea42623          	sw	a0,-20(s0)
     3bc:	fec42783          	lw	a5,-20(s0)
     3c0:	0ff7f793          	zext.b	a5,a5
     3c4:	00078513          	mv	a0,a5
     3c8:	1ed000ef          	jal	db4 <uart_put_char>
     3cc:	00050793          	mv	a5,a0
     3d0:	00078513          	mv	a0,a5
     3d4:	01c12083          	lw	ra,28(sp)
     3d8:	01812403          	lw	s0,24(sp)
     3dc:	02010113          	addi	sp,sp,32
     3e0:	00008067          	ret

000003e4 <my_getc>:
     3e4:	fe010113          	addi	sp,sp,-32
     3e8:	00112e23          	sw	ra,28(sp)
     3ec:	00812c23          	sw	s0,24(sp)
     3f0:	02010413          	addi	s0,sp,32
     3f4:	fea42623          	sw	a0,-20(s0)
     3f8:	17d000ef          	jal	d74 <uart_get_char>
     3fc:	00050793          	mv	a5,a0
     400:	00078513          	mv	a0,a5
     404:	01c12083          	lw	ra,28(sp)
     408:	01812403          	lw	s0,24(sp)
     40c:	02010113          	addi	sp,sp,32
     410:	00008067          	ret

00000414 <my_getchar>:
     414:	ff010113          	addi	sp,sp,-16
     418:	00112623          	sw	ra,12(sp)
     41c:	00812423          	sw	s0,8(sp)
     420:	01010413          	addi	s0,sp,16
     424:	151000ef          	jal	d74 <uart_get_char>
     428:	00050793          	mv	a5,a0
     42c:	00078513          	mv	a0,a5
     430:	00c12083          	lw	ra,12(sp)
     434:	00812403          	lw	s0,8(sp)
     438:	01010113          	addi	sp,sp,16
     43c:	00008067          	ret

00000440 <my_puts>:
     440:	fd010113          	addi	sp,sp,-48
     444:	02112623          	sw	ra,44(sp)
     448:	02812423          	sw	s0,40(sp)
     44c:	03010413          	addi	s0,sp,48
     450:	fca42e23          	sw	a0,-36(s0)
     454:	fdc42503          	lw	a0,-36(s0)
     458:	1bd000ef          	jal	e14 <uart_put_string>
     45c:	fea42623          	sw	a0,-20(s0)
     460:	fec42783          	lw	a5,-20(s0)
     464:	00078513          	mv	a0,a5
     468:	02c12083          	lw	ra,44(sp)
     46c:	02812403          	lw	s0,40(sp)
     470:	03010113          	addi	sp,sp,48
     474:	00008067          	ret

00000478 <my_printf>:
     478:	fb010113          	addi	sp,sp,-80
     47c:	02112623          	sw	ra,44(sp)
     480:	02812423          	sw	s0,40(sp)
     484:	03010413          	addi	s0,sp,48
     488:	fca42e23          	sw	a0,-36(s0)
     48c:	00b42223          	sw	a1,4(s0)
     490:	00c42423          	sw	a2,8(s0)
     494:	00d42623          	sw	a3,12(s0)
     498:	00e42823          	sw	a4,16(s0)
     49c:	00f42a23          	sw	a5,20(s0)
     4a0:	01042c23          	sw	a6,24(s0)
     4a4:	01142e23          	sw	a7,28(s0)
     4a8:	02040793          	addi	a5,s0,32
     4ac:	fcf42c23          	sw	a5,-40(s0)
     4b0:	fd842783          	lw	a5,-40(s0)
     4b4:	fe478793          	addi	a5,a5,-28
     4b8:	fef42423          	sw	a5,-24(s0)
     4bc:	fe842783          	lw	a5,-24(s0)
     4c0:	00078593          	mv	a1,a5
     4c4:	fdc42503          	lw	a0,-36(s0)
     4c8:	28c000ef          	jal	754 <my_vprintf>
     4cc:	fea42623          	sw	a0,-20(s0)
     4d0:	fec42783          	lw	a5,-20(s0)
     4d4:	00078513          	mv	a0,a5
     4d8:	02c12083          	lw	ra,44(sp)
     4dc:	02812403          	lw	s0,40(sp)
     4e0:	05010113          	addi	sp,sp,80
     4e4:	00008067          	ret

000004e8 <my_printn>:
     4e8:	fd010113          	addi	sp,sp,-48
     4ec:	02112623          	sw	ra,44(sp)
     4f0:	02812423          	sw	s0,40(sp)
     4f4:	03010413          	addi	s0,sp,48
     4f8:	fca42e23          	sw	a0,-36(s0)
     4fc:	fcb42c23          	sw	a1,-40(s0)
     500:	fcc42a23          	sw	a2,-44(s0)
     504:	fe042623          	sw	zero,-20(s0)
     508:	fd842703          	lw	a4,-40(s0)
     50c:	00a00793          	li	a5,10
     510:	02f71863          	bne	a4,a5,540 <my_printn+0x58>
     514:	fdc42783          	lw	a5,-36(s0)
     518:	0207d463          	bgez	a5,540 <my_printn+0x58>
     51c:	02d00513          	li	a0,45
     520:	095000ef          	jal	db4 <uart_put_char>
     524:	00050713          	mv	a4,a0
     528:	fec42783          	lw	a5,-20(s0)
     52c:	00f707b3          	add	a5,a4,a5
     530:	fef42623          	sw	a5,-20(s0)
     534:	fdc42783          	lw	a5,-36(s0)
     538:	40f007b3          	neg	a5,a5
     53c:	fcf42e23          	sw	a5,-36(s0)
     540:	fd842783          	lw	a5,-40(s0)
     544:	fdc42703          	lw	a4,-36(s0)
     548:	02f757b3          	divu	a5,a4,a5
     54c:	fef42423          	sw	a5,-24(s0)
     550:	fe842783          	lw	a5,-24(s0)
     554:	00079863          	bnez	a5,564 <my_printn+0x7c>
     558:	fd442703          	lw	a4,-44(s0)
     55c:	00100793          	li	a5,1
     560:	02e7d863          	bge	a5,a4,590 <my_printn+0xa8>
     564:	fd442783          	lw	a5,-44(s0)
     568:	fff78793          	addi	a5,a5,-1
     56c:	fcf42a23          	sw	a5,-44(s0)
     570:	fd442603          	lw	a2,-44(s0)
     574:	fd842583          	lw	a1,-40(s0)
     578:	fe842503          	lw	a0,-24(s0)
     57c:	f6dff0ef          	jal	4e8 <my_printn>
     580:	00050713          	mv	a4,a0
     584:	fec42783          	lw	a5,-20(s0)
     588:	00e787b3          	add	a5,a5,a4
     58c:	fef42623          	sw	a5,-20(s0)
     590:	fd842783          	lw	a5,-40(s0)
     594:	fdc42703          	lw	a4,-36(s0)
     598:	02f777b3          	remu	a5,a4,a5
     59c:	00078713          	mv	a4,a5
     5a0:	12818793          	addi	a5,gp,296 # 47e8 <__global_pointer$+0x128>
     5a4:	00e787b3          	add	a5,a5,a4
     5a8:	0007c783          	lbu	a5,0(a5)
     5ac:	00078513          	mv	a0,a5
     5b0:	005000ef          	jal	db4 <uart_put_char>
     5b4:	00050713          	mv	a4,a0
     5b8:	fec42783          	lw	a5,-20(s0)
     5bc:	00f707b3          	add	a5,a4,a5
     5c0:	fef42623          	sw	a5,-20(s0)
     5c4:	fec42783          	lw	a5,-20(s0)
     5c8:	00078513          	mv	a0,a5
     5cc:	02c12083          	lw	ra,44(sp)
     5d0:	02812403          	lw	s0,40(sp)
     5d4:	03010113          	addi	sp,sp,48
     5d8:	00008067          	ret

000005dc <my_printflt>:
     5dc:	fd010113          	addi	sp,sp,-48
     5e0:	02112623          	sw	ra,44(sp)
     5e4:	02812423          	sw	s0,40(sp)
     5e8:	03010413          	addi	s0,sp,48
     5ec:	fca42e23          	sw	a0,-36(s0)
     5f0:	fcb42c23          	sw	a1,-40(s0)
     5f4:	fe042423          	sw	zero,-24(s0)
     5f8:	00000593          	li	a1,0
     5fc:	fdc42503          	lw	a0,-36(s0)
     600:	3d8030ef          	jal	39d8 <__lesf2>
     604:	00050793          	mv	a5,a0
     608:	0207d663          	bgez	a5,634 <my_printflt+0x58>
     60c:	02d00513          	li	a0,45
     610:	7a4000ef          	jal	db4 <uart_put_char>
     614:	00050713          	mv	a4,a0
     618:	fe842783          	lw	a5,-24(s0)
     61c:	00f707b3          	add	a5,a4,a5
     620:	fef42423          	sw	a5,-24(s0)
     624:	fdc42703          	lw	a4,-36(s0)
     628:	800007b7          	lui	a5,0x80000
     62c:	00f747b3          	xor	a5,a4,a5
     630:	fcf42e23          	sw	a5,-36(s0)
     634:	fdc42503          	lw	a0,-36(s0)
     638:	399030ef          	jal	41d0 <__fixsfsi>
     63c:	00050793          	mv	a5,a0
     640:	fef42223          	sw	a5,-28(s0)
     644:	fe442783          	lw	a5,-28(s0)
     648:	fd842603          	lw	a2,-40(s0)
     64c:	00a00593          	li	a1,10
     650:	00078513          	mv	a0,a5
     654:	e95ff0ef          	jal	4e8 <my_printn>
     658:	00050713          	mv	a4,a0
     65c:	fe842783          	lw	a5,-24(s0)
     660:	00e787b3          	add	a5,a5,a4
     664:	fef42423          	sw	a5,-24(s0)
     668:	02e00513          	li	a0,46
     66c:	748000ef          	jal	db4 <uart_put_char>
     670:	00050713          	mv	a4,a0
     674:	fe842783          	lw	a5,-24(s0)
     678:	00f707b3          	add	a5,a4,a5
     67c:	fef42423          	sw	a5,-24(s0)
     680:	fe442503          	lw	a0,-28(s0)
     684:	3bd030ef          	jal	4240 <__floatsisf>
     688:	00050793          	mv	a5,a0
     68c:	00078593          	mv	a1,a5
     690:	fdc42503          	lw	a0,-36(s0)
     694:	70c030ef          	jal	3da0 <__subsf3>
     698:	00050793          	mv	a5,a0
     69c:	fcf42e23          	sw	a5,-36(s0)
     6a0:	fe042623          	sw	zero,-20(s0)
     6a4:	1941a583          	lw	a1,404(gp) # 4854 <__global_pointer$+0x194>
     6a8:	fdc42503          	lw	a0,-36(s0)
     6ac:	3d8030ef          	jal	3a84 <__mulsf3>
     6b0:	00050793          	mv	a5,a0
     6b4:	fcf42e23          	sw	a5,-36(s0)
     6b8:	fdc42503          	lw	a0,-36(s0)
     6bc:	315030ef          	jal	41d0 <__fixsfsi>
     6c0:	00050793          	mv	a5,a0
     6c4:	fef42223          	sw	a5,-28(s0)
     6c8:	fe442783          	lw	a5,-28(s0)
     6cc:	0ff7f793          	zext.b	a5,a5
     6d0:	03078793          	addi	a5,a5,48 # 80000030 <_memory_end+0x7ffe0030>
     6d4:	0ff7f793          	zext.b	a5,a5
     6d8:	00078513          	mv	a0,a5
     6dc:	6d8000ef          	jal	db4 <uart_put_char>
     6e0:	00050713          	mv	a4,a0
     6e4:	fe842783          	lw	a5,-24(s0)
     6e8:	00f707b3          	add	a5,a4,a5
     6ec:	fef42423          	sw	a5,-24(s0)
     6f0:	fe442503          	lw	a0,-28(s0)
     6f4:	34d030ef          	jal	4240 <__floatsisf>
     6f8:	00050793          	mv	a5,a0
     6fc:	00078593          	mv	a1,a5
     700:	fdc42503          	lw	a0,-36(s0)
     704:	69c030ef          	jal	3da0 <__subsf3>
     708:	00050793          	mv	a5,a0
     70c:	fcf42e23          	sw	a5,-36(s0)
     710:	fec42783          	lw	a5,-20(s0)
     714:	00178793          	addi	a5,a5,1
     718:	fef42623          	sw	a5,-20(s0)
     71c:	00000593          	li	a1,0
     720:	fdc42503          	lw	a0,-36(s0)
     724:	24c030ef          	jal	3970 <__eqsf2>
     728:	00050793          	mv	a5,a0
     72c:	00078863          	beqz	a5,73c <my_printflt+0x160>
     730:	fec42703          	lw	a4,-20(s0)
     734:	00500793          	li	a5,5
     738:	f6e7d6e3          	bge	a5,a4,6a4 <my_printflt+0xc8>
     73c:	fe842783          	lw	a5,-24(s0)
     740:	00078513          	mv	a0,a5
     744:	02c12083          	lw	ra,44(sp)
     748:	02812403          	lw	s0,40(sp)
     74c:	03010113          	addi	sp,sp,48
     750:	00008067          	ret

00000754 <my_vprintf>:
     754:	fc010113          	addi	sp,sp,-64
     758:	02112e23          	sw	ra,60(sp)
     75c:	02812c23          	sw	s0,56(sp)
     760:	04010413          	addi	s0,sp,64
     764:	fca42623          	sw	a0,-52(s0)
     768:	fcb42423          	sw	a1,-56(s0)
     76c:	fe042023          	sw	zero,-32(s0)
     770:	3000006f          	j	a70 <my_vprintf+0x31c>
     774:	fe842703          	lw	a4,-24(s0)
     778:	02500793          	li	a5,37
     77c:	2cf71063          	bne	a4,a5,a3c <my_vprintf+0x2e8>
     780:	fcc42783          	lw	a5,-52(s0)
     784:	0007c783          	lbu	a5,0(a5)
     788:	fef42423          	sw	a5,-24(s0)
     78c:	fe042623          	sw	zero,-20(s0)
     790:	0440006f          	j	7d4 <my_vprintf+0x80>
     794:	fec42703          	lw	a4,-20(s0)
     798:	00070793          	mv	a5,a4
     79c:	00279793          	slli	a5,a5,0x2
     7a0:	00e787b3          	add	a5,a5,a4
     7a4:	00179793          	slli	a5,a5,0x1
     7a8:	00078713          	mv	a4,a5
     7ac:	fe842783          	lw	a5,-24(s0)
     7b0:	00f707b3          	add	a5,a4,a5
     7b4:	fd078793          	addi	a5,a5,-48
     7b8:	fef42623          	sw	a5,-20(s0)
     7bc:	fcc42783          	lw	a5,-52(s0)
     7c0:	00178793          	addi	a5,a5,1
     7c4:	fcf42623          	sw	a5,-52(s0)
     7c8:	fcc42783          	lw	a5,-52(s0)
     7cc:	0007c783          	lbu	a5,0(a5)
     7d0:	fef42423          	sw	a5,-24(s0)
     7d4:	fe842703          	lw	a4,-24(s0)
     7d8:	02f00793          	li	a5,47
     7dc:	00e7d863          	bge	a5,a4,7ec <my_vprintf+0x98>
     7e0:	fe842703          	lw	a4,-24(s0)
     7e4:	03900793          	li	a5,57
     7e8:	fae7d6e3          	bge	a5,a4,794 <my_vprintf+0x40>
     7ec:	fcc42783          	lw	a5,-52(s0)
     7f0:	00178713          	addi	a4,a5,1
     7f4:	fce42623          	sw	a4,-52(s0)
     7f8:	0007c783          	lbu	a5,0(a5)
     7fc:	fef42423          	sw	a5,-24(s0)
     800:	fe842703          	lw	a4,-24(s0)
     804:	02500793          	li	a5,37
     808:	1ef70863          	beq	a4,a5,9f8 <my_vprintf+0x2a4>
     80c:	fe842703          	lw	a4,-24(s0)
     810:	02500793          	li	a5,37
     814:	20f74063          	blt	a4,a5,a14 <my_vprintf+0x2c0>
     818:	fe842703          	lw	a4,-24(s0)
     81c:	07800793          	li	a5,120
     820:	1ee7ca63          	blt	a5,a4,a14 <my_vprintf+0x2c0>
     824:	fe842703          	lw	a4,-24(s0)
     828:	06300793          	li	a5,99
     82c:	1ef74463          	blt	a4,a5,a14 <my_vprintf+0x2c0>
     830:	fe842783          	lw	a5,-24(s0)
     834:	f9d78793          	addi	a5,a5,-99
     838:	01500713          	li	a4,21
     83c:	1cf76c63          	bltu	a4,a5,a14 <my_vprintf+0x2c0>
     840:	00279713          	slli	a4,a5,0x2
     844:	13c18793          	addi	a5,gp,316 # 47fc <__global_pointer$+0x13c>
     848:	00f707b3          	add	a5,a4,a5
     84c:	0007a783          	lw	a5,0(a5)
     850:	00078067          	jr	a5
     854:	fc842783          	lw	a5,-56(s0)
     858:	00478713          	addi	a4,a5,4
     85c:	fce42423          	sw	a4,-56(s0)
     860:	0007a783          	lw	a5,0(a5)
     864:	fcf40ba3          	sb	a5,-41(s0)
     868:	fd744783          	lbu	a5,-41(s0)
     86c:	00078513          	mv	a0,a5
     870:	544000ef          	jal	db4 <uart_put_char>
     874:	00050713          	mv	a4,a0
     878:	fe042783          	lw	a5,-32(s0)
     87c:	00f707b3          	add	a5,a4,a5
     880:	fef42023          	sw	a5,-32(s0)
     884:	1ec0006f          	j	a70 <my_vprintf+0x31c>
     888:	fc842783          	lw	a5,-56(s0)
     88c:	00478713          	addi	a4,a5,4
     890:	fce42423          	sw	a4,-56(s0)
     894:	0007a783          	lw	a5,0(a5)
     898:	fcf42e23          	sw	a5,-36(s0)
     89c:	fdc42783          	lw	a5,-36(s0)
     8a0:	fec42603          	lw	a2,-20(s0)
     8a4:	00800593          	li	a1,8
     8a8:	00078513          	mv	a0,a5
     8ac:	c3dff0ef          	jal	4e8 <my_printn>
     8b0:	00050713          	mv	a4,a0
     8b4:	fe042783          	lw	a5,-32(s0)
     8b8:	00e787b3          	add	a5,a5,a4
     8bc:	fef42023          	sw	a5,-32(s0)
     8c0:	1b00006f          	j	a70 <my_vprintf+0x31c>
     8c4:	fc842783          	lw	a5,-56(s0)
     8c8:	00478713          	addi	a4,a5,4
     8cc:	fce42423          	sw	a4,-56(s0)
     8d0:	0007a783          	lw	a5,0(a5)
     8d4:	fcf42e23          	sw	a5,-36(s0)
     8d8:	fdc42783          	lw	a5,-36(s0)
     8dc:	fec42603          	lw	a2,-20(s0)
     8e0:	00a00593          	li	a1,10
     8e4:	00078513          	mv	a0,a5
     8e8:	c01ff0ef          	jal	4e8 <my_printn>
     8ec:	00050713          	mv	a4,a0
     8f0:	fe042783          	lw	a5,-32(s0)
     8f4:	00e787b3          	add	a5,a5,a4
     8f8:	fef42023          	sw	a5,-32(s0)
     8fc:	1740006f          	j	a70 <my_vprintf+0x31c>
     900:	fc842783          	lw	a5,-56(s0)
     904:	00478713          	addi	a4,a5,4
     908:	fce42423          	sw	a4,-56(s0)
     90c:	0007a783          	lw	a5,0(a5)
     910:	fcf42e23          	sw	a5,-36(s0)
     914:	fdc42783          	lw	a5,-36(s0)
     918:	fec42603          	lw	a2,-20(s0)
     91c:	01000593          	li	a1,16
     920:	00078513          	mv	a0,a5
     924:	bc5ff0ef          	jal	4e8 <my_printn>
     928:	00050713          	mv	a4,a0
     92c:	fe042783          	lw	a5,-32(s0)
     930:	00e787b3          	add	a5,a5,a4
     934:	fef42023          	sw	a5,-32(s0)
     938:	1380006f          	j	a70 <my_vprintf+0x31c>
     93c:	fc842783          	lw	a5,-56(s0)
     940:	00478713          	addi	a4,a5,4
     944:	fce42423          	sw	a4,-56(s0)
     948:	0007a783          	lw	a5,0(a5)
     94c:	fef42223          	sw	a5,-28(s0)
     950:	0480006f          	j	998 <my_vprintf+0x244>
     954:	fe442783          	lw	a5,-28(s0)
     958:	0007c783          	lbu	a5,0(a5)
     95c:	00078513          	mv	a0,a5
     960:	454000ef          	jal	db4 <uart_put_char>
     964:	00050713          	mv	a4,a0
     968:	fe042783          	lw	a5,-32(s0)
     96c:	00f707b3          	add	a5,a4,a5
     970:	fef42023          	sw	a5,-32(s0)
     974:	fe442783          	lw	a5,-28(s0)
     978:	0007c703          	lbu	a4,0(a5)
     97c:	00a00793          	li	a5,10
     980:	00f71663          	bne	a4,a5,98c <my_vprintf+0x238>
     984:	00d00513          	li	a0,13
     988:	42c000ef          	jal	db4 <uart_put_char>
     98c:	fe442783          	lw	a5,-28(s0)
     990:	00178793          	addi	a5,a5,1
     994:	fef42223          	sw	a5,-28(s0)
     998:	fe442783          	lw	a5,-28(s0)
     99c:	0007c783          	lbu	a5,0(a5)
     9a0:	fa079ae3          	bnez	a5,954 <my_vprintf+0x200>
     9a4:	0cc0006f          	j	a70 <my_vprintf+0x31c>
     9a8:	fc842783          	lw	a5,-56(s0)
     9ac:	00778793          	addi	a5,a5,7
     9b0:	ff87f793          	andi	a5,a5,-8
     9b4:	00878713          	addi	a4,a5,8
     9b8:	fce42423          	sw	a4,-56(s0)
     9bc:	0007a703          	lw	a4,0(a5)
     9c0:	0047a783          	lw	a5,4(a5)
     9c4:	00070513          	mv	a0,a4
     9c8:	00078593          	mv	a1,a5
     9cc:	335030ef          	jal	4500 <__truncdfsf2>
     9d0:	00050793          	mv	a5,a0
     9d4:	fcf42c23          	sw	a5,-40(s0)
     9d8:	fec42583          	lw	a1,-20(s0)
     9dc:	fd842503          	lw	a0,-40(s0)
     9e0:	bfdff0ef          	jal	5dc <my_printflt>
     9e4:	00050713          	mv	a4,a0
     9e8:	fe042783          	lw	a5,-32(s0)
     9ec:	00e787b3          	add	a5,a5,a4
     9f0:	fef42023          	sw	a5,-32(s0)
     9f4:	07c0006f          	j	a70 <my_vprintf+0x31c>
     9f8:	02500513          	li	a0,37
     9fc:	3b8000ef          	jal	db4 <uart_put_char>
     a00:	00050713          	mv	a4,a0
     a04:	fe042783          	lw	a5,-32(s0)
     a08:	00f707b3          	add	a5,a4,a5
     a0c:	fef42023          	sw	a5,-32(s0)
     a10:	0600006f          	j	a70 <my_vprintf+0x31c>
     a14:	02500513          	li	a0,37
     a18:	39c000ef          	jal	db4 <uart_put_char>
     a1c:	00050713          	mv	a4,a0
     a20:	fe042783          	lw	a5,-32(s0)
     a24:	00f707b3          	add	a5,a4,a5
     a28:	fef42023          	sw	a5,-32(s0)
     a2c:	fcc42783          	lw	a5,-52(s0)
     a30:	fff78793          	addi	a5,a5,-1
     a34:	fcf42623          	sw	a5,-52(s0)
     a38:	0380006f          	j	a70 <my_vprintf+0x31c>
     a3c:	fe842783          	lw	a5,-24(s0)
     a40:	0ff7f793          	zext.b	a5,a5
     a44:	00078513          	mv	a0,a5
     a48:	36c000ef          	jal	db4 <uart_put_char>
     a4c:	00050713          	mv	a4,a0
     a50:	fe042783          	lw	a5,-32(s0)
     a54:	00f707b3          	add	a5,a4,a5
     a58:	fef42023          	sw	a5,-32(s0)
     a5c:	fe842703          	lw	a4,-24(s0)
     a60:	00a00793          	li	a5,10
     a64:	00f71663          	bne	a4,a5,a70 <my_vprintf+0x31c>
     a68:	00d00513          	li	a0,13
     a6c:	348000ef          	jal	db4 <uart_put_char>
     a70:	fcc42783          	lw	a5,-52(s0)
     a74:	00178713          	addi	a4,a5,1
     a78:	fce42623          	sw	a4,-52(s0)
     a7c:	0007c783          	lbu	a5,0(a5)
     a80:	fef42423          	sw	a5,-24(s0)
     a84:	fe842783          	lw	a5,-24(s0)
     a88:	ce0796e3          	bnez	a5,774 <my_vprintf+0x20>
     a8c:	fe042783          	lw	a5,-32(s0)
     a90:	00078513          	mv	a0,a5
     a94:	03c12083          	lw	ra,60(sp)
     a98:	03812403          	lw	s0,56(sp)
     a9c:	04010113          	addi	sp,sp,64
     aa0:	00008067          	ret

00000aa4 <uart_init>:
     aa4:	fc010113          	addi	sp,sp,-64
     aa8:	02112e23          	sw	ra,60(sp)
     aac:	02812c23          	sw	s0,56(sp)
     ab0:	04010413          	addi	s0,sp,64
     ab4:	fca42e23          	sw	a0,-36(s0)
     ab8:	fcb42c23          	sw	a1,-40(s0)
     abc:	fcc42a23          	sw	a2,-44(s0)
     ac0:	fcd42823          	sw	a3,-48(s0)
     ac4:	fce42623          	sw	a4,-52(s0)
     ac8:	fdc42783          	lw	a5,-36(s0)
     acc:	00079663          	bnez	a5,ad8 <uart_init+0x34>
     ad0:	5b0000ef          	jal	1080 <uart_get_clk_freq>
     ad4:	fca42e23          	sw	a0,-36(s0)
     ad8:	fdc42703          	lw	a4,-36(s0)
     adc:	fd842783          	lw	a5,-40(s0)
     ae0:	02f757b3          	divu	a5,a4,a5
     ae4:	00078513          	mv	a0,a5
     ae8:	609020ef          	jal	38f0 <__floatunsidf>
     aec:	00050713          	mv	a4,a0
     af0:	00058793          	mv	a5,a1
     af4:	1981a603          	lw	a2,408(gp) # 4858 <__global_pointer$+0x198>
     af8:	19c1a683          	lw	a3,412(gp) # 485c <__global_pointer$+0x19c>
     afc:	00070513          	mv	a0,a4
     b00:	00078593          	mv	a1,a5
     b04:	685010ef          	jal	2988 <__adddf3>
     b08:	00050713          	mv	a4,a0
     b0c:	00058793          	mv	a5,a1
     b10:	00070513          	mv	a0,a4
     b14:	00078593          	mv	a1,a5
     b18:	4dd020ef          	jal	37f4 <__fixdfsi>
     b1c:	00050793          	mv	a5,a0
     b20:	00078713          	mv	a4,a5
     b24:	000107b7          	lui	a5,0x10
     b28:	fff78793          	addi	a5,a5,-1 # ffff <_bss_end+0xb3fb>
     b2c:	00f777b3          	and	a5,a4,a5
     b30:	fef42623          	sw	a5,-20(s0)
     b34:	fd442703          	lw	a4,-44(s0)
     b38:	00800793          	li	a5,8
     b3c:	00f71663          	bne	a4,a5,b48 <uart_init+0xa4>
     b40:	00000793          	li	a5,0
     b44:	0080006f          	j	b4c <uart_init+0xa8>
     b48:	000107b7          	lui	a5,0x10
     b4c:	fec42703          	lw	a4,-20(s0)
     b50:	00e7e7b3          	or	a5,a5,a4
     b54:	fef42623          	sw	a5,-20(s0)
     b58:	fd042783          	lw	a5,-48(s0)
     b5c:	00079663          	bnez	a5,b68 <uart_init+0xc4>
     b60:	00000793          	li	a5,0
     b64:	0080006f          	j	b6c <uart_init+0xc8>
     b68:	000207b7          	lui	a5,0x20
     b6c:	fec42703          	lw	a4,-20(s0)
     b70:	00e7e7b3          	or	a5,a5,a4
     b74:	fef42623          	sw	a5,-20(s0)
     b78:	fd042703          	lw	a4,-48(s0)
     b7c:	00100793          	li	a5,1
     b80:	00f71663          	bne	a4,a5,b8c <uart_init+0xe8>
     b84:	00000793          	li	a5,0
     b88:	0080006f          	j	b90 <uart_init+0xec>
     b8c:	000407b7          	lui	a5,0x40
     b90:	fec42703          	lw	a4,-20(s0)
     b94:	00e7e7b3          	or	a5,a5,a4
     b98:	fef42623          	sw	a5,-20(s0)
     b9c:	fcc42703          	lw	a4,-52(s0)
     ba0:	00100793          	li	a5,1
     ba4:	00f71663          	bne	a4,a5,bb0 <uart_init+0x10c>
     ba8:	00000793          	li	a5,0
     bac:	0080006f          	j	bb4 <uart_init+0x110>
     bb0:	000807b7          	lui	a5,0x80
     bb4:	fec42703          	lw	a4,-20(s0)
     bb8:	00e7e7b3          	or	a5,a5,a4
     bbc:	fef42623          	sw	a5,-20(s0)
     bc0:	4f41a783          	lw	a5,1268(gp) # 4bb4 <UART_CONTROL>
     bc4:	fef42423          	sw	a5,-24(s0)
     bc8:	fe842783          	lw	a5,-24(s0)
     bcc:	fec42703          	lw	a4,-20(s0)
     bd0:	00e7a023          	sw	a4,0(a5) # 80000 <_memory_end+0x60000>
     bd4:	00000013          	nop
     bd8:	03c12083          	lw	ra,60(sp)
     bdc:	03812403          	lw	s0,56(sp)
     be0:	04010113          	addi	sp,sp,64
     be4:	00008067          	ret

00000be8 <uart_init_ext>:
     be8:	fc010113          	addi	sp,sp,-64
     bec:	02112e23          	sw	ra,60(sp)
     bf0:	02812c23          	sw	s0,56(sp)
     bf4:	04010413          	addi	s0,sp,64
     bf8:	fca42e23          	sw	a0,-36(s0)
     bfc:	fcb42c23          	sw	a1,-40(s0)
     c00:	fcc42a23          	sw	a2,-44(s0)
     c04:	fcd42823          	sw	a3,-48(s0)
     c08:	fce42623          	sw	a4,-52(s0)
     c0c:	fcf42423          	sw	a5,-56(s0)
     c10:	fd042223          	sw	a6,-60(s0)
     c14:	fdc42783          	lw	a5,-36(s0)
     c18:	00079663          	bnez	a5,c24 <uart_init_ext+0x3c>
     c1c:	464000ef          	jal	1080 <uart_get_clk_freq>
     c20:	fca42e23          	sw	a0,-36(s0)
     c24:	fdc42703          	lw	a4,-36(s0)
     c28:	fd842783          	lw	a5,-40(s0)
     c2c:	02f757b3          	divu	a5,a4,a5
     c30:	00078513          	mv	a0,a5
     c34:	4bd020ef          	jal	38f0 <__floatunsidf>
     c38:	00050713          	mv	a4,a0
     c3c:	00058793          	mv	a5,a1
     c40:	1981a603          	lw	a2,408(gp) # 4858 <__global_pointer$+0x198>
     c44:	19c1a683          	lw	a3,412(gp) # 485c <__global_pointer$+0x19c>
     c48:	00070513          	mv	a0,a4
     c4c:	00078593          	mv	a1,a5
     c50:	539010ef          	jal	2988 <__adddf3>
     c54:	00050713          	mv	a4,a0
     c58:	00058793          	mv	a5,a1
     c5c:	00070513          	mv	a0,a4
     c60:	00078593          	mv	a1,a5
     c64:	391020ef          	jal	37f4 <__fixdfsi>
     c68:	00050793          	mv	a5,a0
     c6c:	00078713          	mv	a4,a5
     c70:	000107b7          	lui	a5,0x10
     c74:	fff78793          	addi	a5,a5,-1 # ffff <_bss_end+0xb3fb>
     c78:	00f777b3          	and	a5,a4,a5
     c7c:	fef42623          	sw	a5,-20(s0)
     c80:	fd442703          	lw	a4,-44(s0)
     c84:	00800793          	li	a5,8
     c88:	00f71663          	bne	a4,a5,c94 <uart_init_ext+0xac>
     c8c:	00000793          	li	a5,0
     c90:	0080006f          	j	c98 <uart_init_ext+0xb0>
     c94:	000107b7          	lui	a5,0x10
     c98:	fec42703          	lw	a4,-20(s0)
     c9c:	00e7e7b3          	or	a5,a5,a4
     ca0:	fef42623          	sw	a5,-20(s0)
     ca4:	fd042783          	lw	a5,-48(s0)
     ca8:	00079663          	bnez	a5,cb4 <uart_init_ext+0xcc>
     cac:	00000793          	li	a5,0
     cb0:	0080006f          	j	cb8 <uart_init_ext+0xd0>
     cb4:	000207b7          	lui	a5,0x20
     cb8:	fec42703          	lw	a4,-20(s0)
     cbc:	00e7e7b3          	or	a5,a5,a4
     cc0:	fef42623          	sw	a5,-20(s0)
     cc4:	fd042703          	lw	a4,-48(s0)
     cc8:	00100793          	li	a5,1
     ccc:	00f71663          	bne	a4,a5,cd8 <uart_init_ext+0xf0>
     cd0:	00000793          	li	a5,0
     cd4:	0080006f          	j	cdc <uart_init_ext+0xf4>
     cd8:	000407b7          	lui	a5,0x40
     cdc:	fec42703          	lw	a4,-20(s0)
     ce0:	00e7e7b3          	or	a5,a5,a4
     ce4:	fef42623          	sw	a5,-20(s0)
     ce8:	fcc42703          	lw	a4,-52(s0)
     cec:	00100793          	li	a5,1
     cf0:	00f71663          	bne	a4,a5,cfc <uart_init_ext+0x114>
     cf4:	00000793          	li	a5,0
     cf8:	0080006f          	j	d00 <uart_init_ext+0x118>
     cfc:	000807b7          	lui	a5,0x80
     d00:	fec42703          	lw	a4,-20(s0)
     d04:	00e7e7b3          	or	a5,a5,a4
     d08:	fef42623          	sw	a5,-20(s0)
     d0c:	fc842783          	lw	a5,-56(s0)
     d10:	00079663          	bnez	a5,d1c <uart_init_ext+0x134>
     d14:	00000793          	li	a5,0
     d18:	0080006f          	j	d20 <uart_init_ext+0x138>
     d1c:	002007b7          	lui	a5,0x200
     d20:	fec42703          	lw	a4,-20(s0)
     d24:	00e7e7b3          	or	a5,a5,a4
     d28:	fef42623          	sw	a5,-20(s0)
     d2c:	fc442783          	lw	a5,-60(s0)
     d30:	00079663          	bnez	a5,d3c <uart_init_ext+0x154>
     d34:	00000793          	li	a5,0
     d38:	0080006f          	j	d40 <uart_init_ext+0x158>
     d3c:	001007b7          	lui	a5,0x100
     d40:	fec42703          	lw	a4,-20(s0)
     d44:	00e7e7b3          	or	a5,a5,a4
     d48:	fef42623          	sw	a5,-20(s0)
     d4c:	4f41a783          	lw	a5,1268(gp) # 4bb4 <UART_CONTROL>
     d50:	fef42423          	sw	a5,-24(s0)
     d54:	fe842783          	lw	a5,-24(s0)
     d58:	fec42703          	lw	a4,-20(s0)
     d5c:	00e7a023          	sw	a4,0(a5) # 100000 <_memory_end+0xe0000>
     d60:	00000013          	nop
     d64:	03c12083          	lw	ra,60(sp)
     d68:	03812403          	lw	s0,56(sp)
     d6c:	04010113          	addi	sp,sp,64
     d70:	00008067          	ret

00000d74 <uart_get_char>:
     d74:	fe010113          	addi	sp,sp,-32
     d78:	00812e23          	sw	s0,28(sp)
     d7c:	02010413          	addi	s0,sp,32
     d80:	5001a783          	lw	a5,1280(gp) # 4bc0 <UART_RX>
     d84:	fef42423          	sw	a5,-24(s0)
     d88:	fe842783          	lw	a5,-24(s0)
     d8c:	0007a783          	lw	a5,0(a5)
     d90:	fef42623          	sw	a5,-20(s0)
     d94:	fec42783          	lw	a5,-20(s0)
     d98:	fe07d4e3          	bgez	a5,d80 <uart_get_char+0xc>
     d9c:	fec42783          	lw	a5,-20(s0)
     da0:	0ff7f793          	zext.b	a5,a5
     da4:	00078513          	mv	a0,a5
     da8:	01c12403          	lw	s0,28(sp)
     dac:	02010113          	addi	sp,sp,32
     db0:	00008067          	ret

00000db4 <uart_put_char>:
     db4:	fd010113          	addi	sp,sp,-48
     db8:	02812623          	sw	s0,44(sp)
     dbc:	03010413          	addi	s0,sp,48
     dc0:	00050793          	mv	a5,a0
     dc4:	fcf40fa3          	sb	a5,-33(s0)
     dc8:	4fc1a783          	lw	a5,1276(gp) # 4bbc <UART_TX>
     dcc:	fef42423          	sw	a5,-24(s0)
     dd0:	fe842783          	lw	a5,-24(s0)
     dd4:	0007a783          	lw	a5,0(a5)
     dd8:	fef42623          	sw	a5,-20(s0)
     ddc:	fec42783          	lw	a5,-20(s0)
     de0:	fe07c4e3          	bltz	a5,dc8 <uart_put_char+0x14>
     de4:	fdf44783          	lbu	a5,-33(s0)
     de8:	fef42623          	sw	a5,-20(s0)
     dec:	4fc1a783          	lw	a5,1276(gp) # 4bbc <UART_TX>
     df0:	fef42223          	sw	a5,-28(s0)
     df4:	fe442783          	lw	a5,-28(s0)
     df8:	fec42703          	lw	a4,-20(s0)
     dfc:	00e7a023          	sw	a4,0(a5)
     e00:	fdf44783          	lbu	a5,-33(s0)
     e04:	00078513          	mv	a0,a5
     e08:	02c12403          	lw	s0,44(sp)
     e0c:	03010113          	addi	sp,sp,48
     e10:	00008067          	ret

00000e14 <uart_put_string>:
     e14:	fc010113          	addi	sp,sp,-64
     e18:	02812e23          	sw	s0,60(sp)
     e1c:	04010413          	addi	s0,sp,64
     e20:	fca42623          	sw	a0,-52(s0)
     e24:	fe042623          	sw	zero,-20(s0)
     e28:	0400006f          	j	e68 <uart_put_string+0x54>
     e2c:	4fc1a783          	lw	a5,1276(gp) # 4bbc <UART_TX>
     e30:	fef42023          	sw	a5,-32(s0)
     e34:	fe042783          	lw	a5,-32(s0)
     e38:	0007a783          	lw	a5,0(a5)
     e3c:	fef42223          	sw	a5,-28(s0)
     e40:	fe442783          	lw	a5,-28(s0)
     e44:	fe07c4e3          	bltz	a5,e2c <uart_put_string+0x18>
     e48:	4fc1a783          	lw	a5,1276(gp) # 4bbc <UART_TX>
     e4c:	fcf42e23          	sw	a5,-36(s0)
     e50:	fdc42783          	lw	a5,-36(s0)
     e54:	feb44703          	lbu	a4,-21(s0)
     e58:	00e7a023          	sw	a4,0(a5)
     e5c:	fec42783          	lw	a5,-20(s0)
     e60:	00178793          	addi	a5,a5,1
     e64:	fef42623          	sw	a5,-20(s0)
     e68:	fcc42783          	lw	a5,-52(s0)
     e6c:	00178713          	addi	a4,a5,1
     e70:	fce42623          	sw	a4,-52(s0)
     e74:	0007c783          	lbu	a5,0(a5)
     e78:	fef405a3          	sb	a5,-21(s0)
     e7c:	feb44783          	lbu	a5,-21(s0)
     e80:	fa0796e3          	bnez	a5,e2c <uart_put_string+0x18>
     e84:	fec42783          	lw	a5,-20(s0)
     e88:	00078513          	mv	a0,a5
     e8c:	03c12403          	lw	s0,60(sp)
     e90:	04010113          	addi	sp,sp,64
     e94:	00008067          	ret

00000e98 <uart_put_int>:
     e98:	fc010113          	addi	sp,sp,-64
     e9c:	02112e23          	sw	ra,60(sp)
     ea0:	02812c23          	sw	s0,56(sp)
     ea4:	04010413          	addi	s0,sp,64
     ea8:	fca42623          	sw	a0,-52(s0)
     eac:	fcc42703          	lw	a4,-52(s0)
     eb0:	00a00793          	li	a5,10
     eb4:	02f757b3          	divu	a5,a4,a5
     eb8:	fef42623          	sw	a5,-20(s0)
     ebc:	fec42783          	lw	a5,-20(s0)
     ec0:	00078863          	beqz	a5,ed0 <uart_put_int+0x38>
     ec4:	fec42783          	lw	a5,-20(s0)
     ec8:	00078513          	mv	a0,a5
     ecc:	fcdff0ef          	jal	e98 <uart_put_int>
     ed0:	fcc42703          	lw	a4,-52(s0)
     ed4:	00a00793          	li	a5,10
     ed8:	02f777b3          	remu	a5,a4,a5
     edc:	0ff7f793          	zext.b	a5,a5
     ee0:	03078793          	addi	a5,a5,48
     ee4:	fef405a3          	sb	a5,-21(s0)
     ee8:	4fc1a783          	lw	a5,1276(gp) # 4bbc <UART_TX>
     eec:	fcf42a23          	sw	a5,-44(s0)
     ef0:	fd442783          	lw	a5,-44(s0)
     ef4:	0007a783          	lw	a5,0(a5)
     ef8:	fcf42c23          	sw	a5,-40(s0)
     efc:	fd842783          	lw	a5,-40(s0)
     f00:	fe07c4e3          	bltz	a5,ee8 <uart_put_int+0x50>
     f04:	4fc1a783          	lw	a5,1276(gp) # 4bbc <UART_TX>
     f08:	fcf42823          	sw	a5,-48(s0)
     f0c:	fd042783          	lw	a5,-48(s0)
     f10:	feb44703          	lbu	a4,-21(s0)
     f14:	00e7a023          	sw	a4,0(a5)
     f18:	00000013          	nop
     f1c:	03c12083          	lw	ra,60(sp)
     f20:	03812403          	lw	s0,56(sp)
     f24:	04010113          	addi	sp,sp,64
     f28:	00008067          	ret

00000f2c <uart_put_hex>:
     f2c:	fc010113          	addi	sp,sp,-64
     f30:	02112e23          	sw	ra,60(sp)
     f34:	02812c23          	sw	s0,56(sp)
     f38:	04010413          	addi	s0,sp,64
     f3c:	fca42623          	sw	a0,-52(s0)
     f40:	fcc42783          	lw	a5,-52(s0)
     f44:	0047d793          	srli	a5,a5,0x4
     f48:	fef42423          	sw	a5,-24(s0)
     f4c:	fe842783          	lw	a5,-24(s0)
     f50:	00078863          	beqz	a5,f60 <uart_put_hex+0x34>
     f54:	fe842783          	lw	a5,-24(s0)
     f58:	00078513          	mv	a0,a5
     f5c:	fd1ff0ef          	jal	f2c <uart_put_hex>
     f60:	fcc42783          	lw	a5,-52(s0)
     f64:	00f7f793          	andi	a5,a5,15
     f68:	fef42423          	sw	a5,-24(s0)
     f6c:	fe842703          	lw	a4,-24(s0)
     f70:	00900793          	li	a5,9
     f74:	00e7cc63          	blt	a5,a4,f8c <uart_put_hex+0x60>
     f78:	fe842783          	lw	a5,-24(s0)
     f7c:	0ff7f793          	zext.b	a5,a5
     f80:	03078793          	addi	a5,a5,48
     f84:	fef407a3          	sb	a5,-17(s0)
     f88:	0140006f          	j	f9c <uart_put_hex+0x70>
     f8c:	fe842783          	lw	a5,-24(s0)
     f90:	0ff7f793          	zext.b	a5,a5
     f94:	03778793          	addi	a5,a5,55
     f98:	fef407a3          	sb	a5,-17(s0)
     f9c:	4fc1a783          	lw	a5,1276(gp) # 4bbc <UART_TX>
     fa0:	fef42023          	sw	a5,-32(s0)
     fa4:	fe042783          	lw	a5,-32(s0)
     fa8:	0007a783          	lw	a5,0(a5)
     fac:	fef42223          	sw	a5,-28(s0)
     fb0:	fe442783          	lw	a5,-28(s0)
     fb4:	fe07c4e3          	bltz	a5,f9c <uart_put_hex+0x70>
     fb8:	4fc1a783          	lw	a5,1276(gp) # 4bbc <UART_TX>
     fbc:	fcf42e23          	sw	a5,-36(s0)
     fc0:	fdc42783          	lw	a5,-36(s0)
     fc4:	fef44703          	lbu	a4,-17(s0)
     fc8:	00e7a023          	sw	a4,0(a5)
     fcc:	00000013          	nop
     fd0:	03c12083          	lw	ra,60(sp)
     fd4:	03812403          	lw	s0,56(sp)
     fd8:	04010113          	addi	sp,sp,64
     fdc:	00008067          	ret

00000fe0 <uart_cler_tx_irq>:
     fe0:	fe010113          	addi	sp,sp,-32
     fe4:	00812e23          	sw	s0,28(sp)
     fe8:	02010413          	addi	s0,sp,32
     fec:	4f81a783          	lw	a5,1272(gp) # 4bb8 <UART_STATUS>
     ff0:	fef42423          	sw	a5,-24(s0)
     ff4:	fe842783          	lw	a5,-24(s0)
     ff8:	0007a783          	lw	a5,0(a5)
     ffc:	fef42623          	sw	a5,-20(s0)
    1000:	fec42783          	lw	a5,-20(s0)
    1004:	ffe7f793          	andi	a5,a5,-2
    1008:	fef42623          	sw	a5,-20(s0)
    100c:	4f81a783          	lw	a5,1272(gp) # 4bb8 <UART_STATUS>
    1010:	fef42223          	sw	a5,-28(s0)
    1014:	fe442783          	lw	a5,-28(s0)
    1018:	fec42703          	lw	a4,-20(s0)
    101c:	00e7a023          	sw	a4,0(a5)
    1020:	00000013          	nop
    1024:	01c12403          	lw	s0,28(sp)
    1028:	02010113          	addi	sp,sp,32
    102c:	00008067          	ret

00001030 <uart_cler_rx_irq>:
    1030:	fe010113          	addi	sp,sp,-32
    1034:	00812e23          	sw	s0,28(sp)
    1038:	02010413          	addi	s0,sp,32
    103c:	4f81a783          	lw	a5,1272(gp) # 4bb8 <UART_STATUS>
    1040:	fef42423          	sw	a5,-24(s0)
    1044:	fe842783          	lw	a5,-24(s0)
    1048:	0007a783          	lw	a5,0(a5)
    104c:	fef42623          	sw	a5,-20(s0)
    1050:	fec42783          	lw	a5,-20(s0)
    1054:	ffd7f793          	andi	a5,a5,-3
    1058:	fef42623          	sw	a5,-20(s0)
    105c:	4f81a783          	lw	a5,1272(gp) # 4bb8 <UART_STATUS>
    1060:	fef42223          	sw	a5,-28(s0)
    1064:	fe442783          	lw	a5,-28(s0)
    1068:	fec42703          	lw	a4,-20(s0)
    106c:	00e7a023          	sw	a4,0(a5)
    1070:	00000013          	nop
    1074:	01c12403          	lw	s0,28(sp)
    1078:	02010113          	addi	sp,sp,32
    107c:	00008067          	ret

00001080 <uart_get_clk_freq>:
    1080:	fe010113          	addi	sp,sp,-32
    1084:	00812e23          	sw	s0,28(sp)
    1088:	02010413          	addi	s0,sp,32
    108c:	5041a783          	lw	a5,1284(gp) # 4bc4 <UART_CLK_FREQ>
    1090:	fef42423          	sw	a5,-24(s0)
    1094:	fe842783          	lw	a5,-24(s0)
    1098:	0007a783          	lw	a5,0(a5)
    109c:	fef42623          	sw	a5,-20(s0)
    10a0:	fec42783          	lw	a5,-20(s0)
    10a4:	00078513          	mv	a0,a5
    10a8:	01c12403          	lw	s0,28(sp)
    10ac:	02010113          	addi	sp,sp,32
    10b0:	00008067          	ret

000010b4 <uart_set_addr>:
    10b4:	fe010113          	addi	sp,sp,-32
    10b8:	00812e23          	sw	s0,28(sp)
    10bc:	02010413          	addi	s0,sp,32
    10c0:	fea42623          	sw	a0,-20(s0)
    10c4:	fec42703          	lw	a4,-20(s0)
    10c8:	4ee1a423          	sw	a4,1256(gp) # 4ba8 <UART_ADDR_BASE>
    10cc:	fec42703          	lw	a4,-20(s0)
    10d0:	4ee1a623          	sw	a4,1260(gp) # 4bac <UART_VERSION>
    10d4:	fec42783          	lw	a5,-20(s0)
    10d8:	00478713          	addi	a4,a5,4
    10dc:	4ee1a823          	sw	a4,1264(gp) # 4bb0 <UART_NAME>
    10e0:	fec42783          	lw	a5,-20(s0)
    10e4:	01078713          	addi	a4,a5,16
    10e8:	4ee1aa23          	sw	a4,1268(gp) # 4bb4 <UART_CONTROL>
    10ec:	fec42783          	lw	a5,-20(s0)
    10f0:	01478713          	addi	a4,a5,20
    10f4:	4ee1ac23          	sw	a4,1272(gp) # 4bb8 <UART_STATUS>
    10f8:	fec42783          	lw	a5,-20(s0)
    10fc:	01878713          	addi	a4,a5,24
    1100:	4ee1ae23          	sw	a4,1276(gp) # 4bbc <UART_TX>
    1104:	fec42783          	lw	a5,-20(s0)
    1108:	01c78713          	addi	a4,a5,28
    110c:	50e1a023          	sw	a4,1280(gp) # 4bc0 <UART_RX>
    1110:	fec42783          	lw	a5,-20(s0)
    1114:	02078713          	addi	a4,a5,32
    1118:	50e1a223          	sw	a4,1284(gp) # 4bc4 <UART_CLK_FREQ>
    111c:	00000013          	nop
    1120:	01c12403          	lw	s0,28(sp)
    1124:	02010113          	addi	sp,sp,32
    1128:	00008067          	ret

0000112c <uart_get_addr>:
    112c:	ff010113          	addi	sp,sp,-16
    1130:	00812623          	sw	s0,12(sp)
    1134:	01010413          	addi	s0,sp,16
    1138:	4e81a783          	lw	a5,1256(gp) # 4ba8 <UART_ADDR_BASE>
    113c:	00078513          	mv	a0,a5
    1140:	00c12403          	lw	s0,12(sp)
    1144:	01010113          	addi	sp,sp,16
    1148:	00008067          	ret

0000114c <i2c_read_d7r8>:
    114c:	fc010113          	addi	sp,sp,-64
    1150:	02112e23          	sw	ra,60(sp)
    1154:	02812c23          	sw	s0,56(sp)
    1158:	04010413          	addi	s0,sp,64
    115c:	00050793          	mv	a5,a0
    1160:	00058713          	mv	a4,a1
    1164:	fcc42423          	sw	a2,-56(s0)
    1168:	fcf407a3          	sb	a5,-49(s0)
    116c:	00070793          	mv	a5,a4
    1170:	fcf40723          	sb	a5,-50(s0)
    1174:	fc842783          	lw	a5,-56(s0)
    1178:	00079663          	bnez	a5,1184 <i2c_read_d7r8+0x38>
    117c:	00000793          	li	a5,0
    1180:	1a40006f          	j	1324 <i2c_read_d7r8+0x1d8>
    1184:	fcf44783          	lbu	a5,-49(s0)
    1188:	00179793          	slli	a5,a5,0x1
    118c:	0ff7f793          	zext.b	a5,a5
    1190:	3007e793          	ori	a5,a5,768
    1194:	fef42223          	sw	a5,-28(s0)
    1198:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    119c:	00078713          	mv	a4,a5
    11a0:	fe442783          	lw	a5,-28(s0)
    11a4:	00f72023          	sw	a5,0(a4)
    11a8:	fce44703          	lbu	a4,-50(s0)
    11ac:	000017b7          	lui	a5,0x1
    11b0:	20078793          	addi	a5,a5,512 # 1200 <i2c_read_d7r8+0xb4>
    11b4:	00f767b3          	or	a5,a4,a5
    11b8:	fef42223          	sw	a5,-28(s0)
    11bc:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    11c0:	00078713          	mv	a4,a5
    11c4:	fe442783          	lw	a5,-28(s0)
    11c8:	00f72023          	sw	a5,0(a4)
    11cc:	fcf44783          	lbu	a5,-49(s0)
    11d0:	00179793          	slli	a5,a5,0x1
    11d4:	0ff7f793          	zext.b	a5,a5
    11d8:	3017e793          	ori	a5,a5,769
    11dc:	fef42223          	sw	a5,-28(s0)
    11e0:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    11e4:	00078713          	mv	a4,a5
    11e8:	fe442783          	lw	a5,-28(s0)
    11ec:	00f72023          	sw	a5,0(a4)
    11f0:	000017b7          	lui	a5,0x1
    11f4:	c0078793          	addi	a5,a5,-1024 # c00 <uart_init_ext+0x18>
    11f8:	fef42223          	sw	a5,-28(s0)
    11fc:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1200:	00078713          	mv	a4,a5
    1204:	fe442783          	lw	a5,-28(s0)
    1208:	00f72023          	sw	a5,0(a4)
    120c:	00400793          	li	a5,4
    1210:	fef42023          	sw	a5,-32(s0)
    1214:	fe042783          	lw	a5,-32(s0)
    1218:	01879793          	slli	a5,a5,0x18
    121c:	0017e793          	ori	a5,a5,1
    1220:	fef42223          	sw	a5,-28(s0)
    1224:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    1228:	00078713          	mv	a4,a5
    122c:	fe442783          	lw	a5,-28(s0)
    1230:	00f72023          	sw	a5,0(a4)
    1234:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    1238:	0007a783          	lw	a5,0(a5)
    123c:	fcf42e23          	sw	a5,-36(s0)
    1240:	fdc42783          	lw	a5,-36(s0)
    1244:	0017f793          	andi	a5,a5,1
    1248:	fe0796e3          	bnez	a5,1234 <i2c_read_d7r8+0xe8>
    124c:	fdc42783          	lw	a5,-36(s0)
    1250:	0187d793          	srli	a5,a5,0x18
    1254:	fe042703          	lw	a4,-32(s0)
    1258:	00f70663          	beq	a4,a5,1264 <i2c_read_d7r8+0x118>
    125c:	fff00793          	li	a5,-1
    1260:	0c40006f          	j	1324 <i2c_read_d7r8+0x1d8>
    1264:	fe042623          	sw	zero,-20(s0)
    1268:	fe042423          	sw	zero,-24(s0)
    126c:	0500006f          	j	12bc <i2c_read_d7r8+0x170>
    1270:	5341a783          	lw	a5,1332(gp) # 4bf4 <CSRA_I2C_RX_DATA>
    1274:	0007a783          	lw	a5,0(a5)
    1278:	fcf42e23          	sw	a5,-36(s0)
    127c:	fdc42783          	lw	a5,-36(s0)
    1280:	1007f793          	andi	a5,a5,256
    1284:	02079663          	bnez	a5,12b0 <i2c_read_d7r8+0x164>
    1288:	fec42783          	lw	a5,-20(s0)
    128c:	00178793          	addi	a5,a5,1
    1290:	fef42623          	sw	a5,-20(s0)
    1294:	fcf44783          	lbu	a5,-49(s0)
    1298:	fce44683          	lbu	a3,-50(s0)
    129c:	fe842703          	lw	a4,-24(s0)
    12a0:	00078613          	mv	a2,a5
    12a4:	2fc18593          	addi	a1,gp,764 # 49bc <__FUNCTION__.7>
    12a8:	1a018513          	addi	a0,gp,416 # 4860 <__global_pointer$+0x1a0>
    12ac:	9ccff0ef          	jal	478 <my_printf>
    12b0:	fe842783          	lw	a5,-24(s0)
    12b4:	00178793          	addi	a5,a5,1
    12b8:	fef42423          	sw	a5,-24(s0)
    12bc:	fe042783          	lw	a5,-32(s0)
    12c0:	fff78713          	addi	a4,a5,-1
    12c4:	fe842783          	lw	a5,-24(s0)
    12c8:	fae7e4e3          	bltu	a5,a4,1270 <i2c_read_d7r8+0x124>
    12cc:	5341a783          	lw	a5,1332(gp) # 4bf4 <CSRA_I2C_RX_DATA>
    12d0:	0007a783          	lw	a5,0(a5)
    12d4:	fcf42e23          	sw	a5,-36(s0)
    12d8:	fdc42783          	lw	a5,-36(s0)
    12dc:	1007f793          	andi	a5,a5,256
    12e0:	02078063          	beqz	a5,1300 <i2c_read_d7r8+0x1b4>
    12e4:	fec42783          	lw	a5,-20(s0)
    12e8:	00178793          	addi	a5,a5,1
    12ec:	fef42623          	sw	a5,-20(s0)
    12f0:	fe842603          	lw	a2,-24(s0)
    12f4:	2fc18593          	addi	a1,gp,764 # 49bc <__FUNCTION__.7>
    12f8:	1c418513          	addi	a0,gp,452 # 4884 <__global_pointer$+0x1c4>
    12fc:	97cff0ef          	jal	478 <my_printf>
    1300:	fdc42783          	lw	a5,-36(s0)
    1304:	0ff7f713          	zext.b	a4,a5
    1308:	fc842783          	lw	a5,-56(s0)
    130c:	00e78023          	sb	a4,0(a5)
    1310:	fec42783          	lw	a5,-20(s0)
    1314:	00078663          	beqz	a5,1320 <i2c_read_d7r8+0x1d4>
    1318:	fff00793          	li	a5,-1
    131c:	0080006f          	j	1324 <i2c_read_d7r8+0x1d8>
    1320:	00000793          	li	a5,0
    1324:	00078513          	mv	a0,a5
    1328:	03c12083          	lw	ra,60(sp)
    132c:	03812403          	lw	s0,56(sp)
    1330:	04010113          	addi	sp,sp,64
    1334:	00008067          	ret

00001338 <i2c_readN_d7r8>:
    1338:	fc010113          	addi	sp,sp,-64
    133c:	02112e23          	sw	ra,60(sp)
    1340:	02812c23          	sw	s0,56(sp)
    1344:	04010413          	addi	s0,sp,64
    1348:	00050793          	mv	a5,a0
    134c:	fcc42423          	sw	a2,-56(s0)
    1350:	00068713          	mv	a4,a3
    1354:	fcf407a3          	sb	a5,-49(s0)
    1358:	00058793          	mv	a5,a1
    135c:	fcf40723          	sb	a5,-50(s0)
    1360:	00070793          	mv	a5,a4
    1364:	fcf406a3          	sb	a5,-51(s0)
    1368:	fc842783          	lw	a5,-56(s0)
    136c:	00079663          	bnez	a5,1378 <i2c_readN_d7r8+0x40>
    1370:	00000793          	li	a5,0
    1374:	2680006f          	j	15dc <i2c_readN_d7r8+0x2a4>
    1378:	fcf44783          	lbu	a5,-49(s0)
    137c:	00179793          	slli	a5,a5,0x1
    1380:	0ff7f793          	zext.b	a5,a5
    1384:	3007e793          	ori	a5,a5,768
    1388:	fcf42e23          	sw	a5,-36(s0)
    138c:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1390:	00078713          	mv	a4,a5
    1394:	fdc42783          	lw	a5,-36(s0)
    1398:	00f72023          	sw	a5,0(a4)
    139c:	fce44703          	lbu	a4,-50(s0)
    13a0:	000017b7          	lui	a5,0x1
    13a4:	20078793          	addi	a5,a5,512 # 1200 <i2c_read_d7r8+0xb4>
    13a8:	00f767b3          	or	a5,a4,a5
    13ac:	fcf42e23          	sw	a5,-36(s0)
    13b0:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    13b4:	00078713          	mv	a4,a5
    13b8:	fdc42783          	lw	a5,-36(s0)
    13bc:	00f72023          	sw	a5,0(a4)
    13c0:	fcf44783          	lbu	a5,-49(s0)
    13c4:	00179793          	slli	a5,a5,0x1
    13c8:	0ff7f793          	zext.b	a5,a5
    13cc:	3017e793          	ori	a5,a5,769
    13d0:	fcf42e23          	sw	a5,-36(s0)
    13d4:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    13d8:	00078713          	mv	a4,a5
    13dc:	fdc42783          	lw	a5,-36(s0)
    13e0:	00f72023          	sw	a5,0(a4)
    13e4:	fe0407a3          	sb	zero,-17(s0)
    13e8:	0280006f          	j	1410 <i2c_readN_d7r8+0xd8>
    13ec:	40000793          	li	a5,1024
    13f0:	fcf42e23          	sw	a5,-36(s0)
    13f4:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    13f8:	00078713          	mv	a4,a5
    13fc:	fdc42783          	lw	a5,-36(s0)
    1400:	00f72023          	sw	a5,0(a4)
    1404:	fef44783          	lbu	a5,-17(s0)
    1408:	00178793          	addi	a5,a5,1
    140c:	fef407a3          	sb	a5,-17(s0)
    1410:	fef44703          	lbu	a4,-17(s0)
    1414:	fcd44783          	lbu	a5,-51(s0)
    1418:	fff78793          	addi	a5,a5,-1
    141c:	fcf748e3          	blt	a4,a5,13ec <i2c_readN_d7r8+0xb4>
    1420:	000017b7          	lui	a5,0x1
    1424:	c0078793          	addi	a5,a5,-1024 # c00 <uart_init_ext+0x18>
    1428:	fcf42e23          	sw	a5,-36(s0)
    142c:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1430:	00078713          	mv	a4,a5
    1434:	fdc42783          	lw	a5,-36(s0)
    1438:	00f72023          	sw	a5,0(a4)
    143c:	fcd44783          	lbu	a5,-51(s0)
    1440:	00378793          	addi	a5,a5,3
    1444:	fcf42c23          	sw	a5,-40(s0)
    1448:	fd842783          	lw	a5,-40(s0)
    144c:	01879793          	slli	a5,a5,0x18
    1450:	0017e793          	ori	a5,a5,1
    1454:	fcf42e23          	sw	a5,-36(s0)
    1458:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    145c:	00078713          	mv	a4,a5
    1460:	fdc42783          	lw	a5,-36(s0)
    1464:	00f72023          	sw	a5,0(a4)
    1468:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    146c:	0007a783          	lw	a5,0(a5)
    1470:	fcf42a23          	sw	a5,-44(s0)
    1474:	fd442783          	lw	a5,-44(s0)
    1478:	0017f793          	andi	a5,a5,1
    147c:	fe0796e3          	bnez	a5,1468 <i2c_readN_d7r8+0x130>
    1480:	fd442783          	lw	a5,-44(s0)
    1484:	0187d793          	srli	a5,a5,0x18
    1488:	fd842703          	lw	a4,-40(s0)
    148c:	00f70663          	beq	a4,a5,1498 <i2c_readN_d7r8+0x160>
    1490:	fff00793          	li	a5,-1
    1494:	1480006f          	j	15dc <i2c_readN_d7r8+0x2a4>
    1498:	fe042423          	sw	zero,-24(s0)
    149c:	fe042223          	sw	zero,-28(s0)
    14a0:	0500006f          	j	14f0 <i2c_readN_d7r8+0x1b8>
    14a4:	5341a783          	lw	a5,1332(gp) # 4bf4 <CSRA_I2C_RX_DATA>
    14a8:	0007a783          	lw	a5,0(a5)
    14ac:	fcf42a23          	sw	a5,-44(s0)
    14b0:	fd442783          	lw	a5,-44(s0)
    14b4:	1007f793          	andi	a5,a5,256
    14b8:	02079663          	bnez	a5,14e4 <i2c_readN_d7r8+0x1ac>
    14bc:	fe842783          	lw	a5,-24(s0)
    14c0:	00178793          	addi	a5,a5,1
    14c4:	fef42423          	sw	a5,-24(s0)
    14c8:	fcf44783          	lbu	a5,-49(s0)
    14cc:	fce44683          	lbu	a3,-50(s0)
    14d0:	fe442703          	lw	a4,-28(s0)
    14d4:	00078613          	mv	a2,a5
    14d8:	30c18593          	addi	a1,gp,780 # 49cc <__FUNCTION__.6>
    14dc:	1a018513          	addi	a0,gp,416 # 4860 <__global_pointer$+0x1a0>
    14e0:	f99fe0ef          	jal	478 <my_printf>
    14e4:	fe442783          	lw	a5,-28(s0)
    14e8:	00178793          	addi	a5,a5,1
    14ec:	fef42223          	sw	a5,-28(s0)
    14f0:	fe442703          	lw	a4,-28(s0)
    14f4:	00200793          	li	a5,2
    14f8:	fae7d6e3          	bge	a5,a4,14a4 <i2c_readN_d7r8+0x16c>
    14fc:	fe0401a3          	sb	zero,-29(s0)
    1500:	fe0401a3          	sb	zero,-29(s0)
    1504:	0680006f          	j	156c <i2c_readN_d7r8+0x234>
    1508:	5341a783          	lw	a5,1332(gp) # 4bf4 <CSRA_I2C_RX_DATA>
    150c:	0007a783          	lw	a5,0(a5)
    1510:	fcf42a23          	sw	a5,-44(s0)
    1514:	fd442783          	lw	a5,-44(s0)
    1518:	1007f793          	andi	a5,a5,256
    151c:	02079663          	bnez	a5,1548 <i2c_readN_d7r8+0x210>
    1520:	fe842783          	lw	a5,-24(s0)
    1524:	00178793          	addi	a5,a5,1
    1528:	fef42423          	sw	a5,-24(s0)
    152c:	fe344703          	lbu	a4,-29(s0)
    1530:	fe442783          	lw	a5,-28(s0)
    1534:	00f707b3          	add	a5,a4,a5
    1538:	00078613          	mv	a2,a5
    153c:	30c18593          	addi	a1,gp,780 # 49cc <__FUNCTION__.6>
    1540:	1f818513          	addi	a0,gp,504 # 48b8 <__global_pointer$+0x1f8>
    1544:	f35fe0ef          	jal	478 <my_printf>
    1548:	fe344783          	lbu	a5,-29(s0)
    154c:	fc842703          	lw	a4,-56(s0)
    1550:	00f707b3          	add	a5,a4,a5
    1554:	fd442703          	lw	a4,-44(s0)
    1558:	0ff77713          	zext.b	a4,a4
    155c:	00e78023          	sb	a4,0(a5)
    1560:	fe344783          	lbu	a5,-29(s0)
    1564:	00178793          	addi	a5,a5,1
    1568:	fef401a3          	sb	a5,-29(s0)
    156c:	fe344703          	lbu	a4,-29(s0)
    1570:	fcd44783          	lbu	a5,-51(s0)
    1574:	fff78793          	addi	a5,a5,-1
    1578:	f8f748e3          	blt	a4,a5,1508 <i2c_readN_d7r8+0x1d0>
    157c:	5341a783          	lw	a5,1332(gp) # 4bf4 <CSRA_I2C_RX_DATA>
    1580:	0007a783          	lw	a5,0(a5)
    1584:	fcf42a23          	sw	a5,-44(s0)
    1588:	fd442783          	lw	a5,-44(s0)
    158c:	1007f793          	andi	a5,a5,256
    1590:	02078063          	beqz	a5,15b0 <i2c_readN_d7r8+0x278>
    1594:	fe842783          	lw	a5,-24(s0)
    1598:	00178793          	addi	a5,a5,1
    159c:	fef42423          	sw	a5,-24(s0)
    15a0:	fe442603          	lw	a2,-28(s0)
    15a4:	30c18593          	addi	a1,gp,780 # 49cc <__FUNCTION__.6>
    15a8:	1c418513          	addi	a0,gp,452 # 4884 <__global_pointer$+0x1c4>
    15ac:	ecdfe0ef          	jal	478 <my_printf>
    15b0:	fe344783          	lbu	a5,-29(s0)
    15b4:	fc842703          	lw	a4,-56(s0)
    15b8:	00f707b3          	add	a5,a4,a5
    15bc:	fd442703          	lw	a4,-44(s0)
    15c0:	0ff77713          	zext.b	a4,a4
    15c4:	00e78023          	sb	a4,0(a5)
    15c8:	fe842783          	lw	a5,-24(s0)
    15cc:	00078663          	beqz	a5,15d8 <i2c_readN_d7r8+0x2a0>
    15d0:	fff00793          	li	a5,-1
    15d4:	0080006f          	j	15dc <i2c_readN_d7r8+0x2a4>
    15d8:	00000793          	li	a5,0
    15dc:	00078513          	mv	a0,a5
    15e0:	03c12083          	lw	ra,60(sp)
    15e4:	03812403          	lw	s0,56(sp)
    15e8:	04010113          	addi	sp,sp,64
    15ec:	00008067          	ret

000015f0 <i2c_write_d7r8>:
    15f0:	fc010113          	addi	sp,sp,-64
    15f4:	02112e23          	sw	ra,60(sp)
    15f8:	02812c23          	sw	s0,56(sp)
    15fc:	04010413          	addi	s0,sp,64
    1600:	00050793          	mv	a5,a0
    1604:	00058693          	mv	a3,a1
    1608:	00060713          	mv	a4,a2
    160c:	fcf407a3          	sb	a5,-49(s0)
    1610:	00068793          	mv	a5,a3
    1614:	fcf40723          	sb	a5,-50(s0)
    1618:	00070793          	mv	a5,a4
    161c:	fcf406a3          	sb	a5,-51(s0)
    1620:	fcf44783          	lbu	a5,-49(s0)
    1624:	00179793          	slli	a5,a5,0x1
    1628:	0ff7f793          	zext.b	a5,a5
    162c:	3007e793          	ori	a5,a5,768
    1630:	fef42223          	sw	a5,-28(s0)
    1634:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1638:	00078713          	mv	a4,a5
    163c:	fe442783          	lw	a5,-28(s0)
    1640:	00f72023          	sw	a5,0(a4)
    1644:	fce44783          	lbu	a5,-50(s0)
    1648:	2007e793          	ori	a5,a5,512
    164c:	fef42223          	sw	a5,-28(s0)
    1650:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1654:	00078713          	mv	a4,a5
    1658:	fe442783          	lw	a5,-28(s0)
    165c:	00f72023          	sw	a5,0(a4)
    1660:	fcd44703          	lbu	a4,-51(s0)
    1664:	000017b7          	lui	a5,0x1
    1668:	a0078793          	addi	a5,a5,-1536 # a00 <my_vprintf+0x2ac>
    166c:	00f767b3          	or	a5,a4,a5
    1670:	fef42223          	sw	a5,-28(s0)
    1674:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1678:	00078713          	mv	a4,a5
    167c:	fe442783          	lw	a5,-28(s0)
    1680:	00f72023          	sw	a5,0(a4)
    1684:	00300793          	li	a5,3
    1688:	fef42023          	sw	a5,-32(s0)
    168c:	fe042783          	lw	a5,-32(s0)
    1690:	01879793          	slli	a5,a5,0x18
    1694:	0017e793          	ori	a5,a5,1
    1698:	fef42223          	sw	a5,-28(s0)
    169c:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    16a0:	00078713          	mv	a4,a5
    16a4:	fe442783          	lw	a5,-28(s0)
    16a8:	00f72023          	sw	a5,0(a4)
    16ac:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    16b0:	0007a783          	lw	a5,0(a5)
    16b4:	fcf42e23          	sw	a5,-36(s0)
    16b8:	fdc42783          	lw	a5,-36(s0)
    16bc:	0017f793          	andi	a5,a5,1
    16c0:	fe0796e3          	bnez	a5,16ac <i2c_write_d7r8+0xbc>
    16c4:	fdc42783          	lw	a5,-36(s0)
    16c8:	0187d793          	srli	a5,a5,0x18
    16cc:	fe042703          	lw	a4,-32(s0)
    16d0:	00f70663          	beq	a4,a5,16dc <i2c_write_d7r8+0xec>
    16d4:	fff00793          	li	a5,-1
    16d8:	07c0006f          	j	1754 <i2c_write_d7r8+0x164>
    16dc:	fe042623          	sw	zero,-20(s0)
    16e0:	fe042423          	sw	zero,-24(s0)
    16e4:	0500006f          	j	1734 <i2c_write_d7r8+0x144>
    16e8:	5341a783          	lw	a5,1332(gp) # 4bf4 <CSRA_I2C_RX_DATA>
    16ec:	0007a783          	lw	a5,0(a5)
    16f0:	fcf42e23          	sw	a5,-36(s0)
    16f4:	fdc42783          	lw	a5,-36(s0)
    16f8:	1007f793          	andi	a5,a5,256
    16fc:	02079663          	bnez	a5,1728 <i2c_write_d7r8+0x138>
    1700:	fec42783          	lw	a5,-20(s0)
    1704:	00178793          	addi	a5,a5,1
    1708:	fef42623          	sw	a5,-20(s0)
    170c:	fcf44783          	lbu	a5,-49(s0)
    1710:	fce44683          	lbu	a3,-50(s0)
    1714:	fe842703          	lw	a4,-24(s0)
    1718:	00078613          	mv	a2,a5
    171c:	31c18593          	addi	a1,gp,796 # 49dc <__FUNCTION__.5>
    1720:	1a018513          	addi	a0,gp,416 # 4860 <__global_pointer$+0x1a0>
    1724:	d55fe0ef          	jal	478 <my_printf>
    1728:	fe842783          	lw	a5,-24(s0)
    172c:	00178793          	addi	a5,a5,1
    1730:	fef42423          	sw	a5,-24(s0)
    1734:	fe842783          	lw	a5,-24(s0)
    1738:	fe042703          	lw	a4,-32(s0)
    173c:	fae7e6e3          	bltu	a5,a4,16e8 <i2c_write_d7r8+0xf8>
    1740:	fec42783          	lw	a5,-20(s0)
    1744:	00078663          	beqz	a5,1750 <i2c_write_d7r8+0x160>
    1748:	fff00793          	li	a5,-1
    174c:	0080006f          	j	1754 <i2c_write_d7r8+0x164>
    1750:	00000793          	li	a5,0
    1754:	00078513          	mv	a0,a5
    1758:	03c12083          	lw	ra,60(sp)
    175c:	03812403          	lw	s0,56(sp)
    1760:	04010113          	addi	sp,sp,64
    1764:	00008067          	ret

00001768 <i2c_writeN_d7r8>:
    1768:	fc010113          	addi	sp,sp,-64
    176c:	02112e23          	sw	ra,60(sp)
    1770:	02812c23          	sw	s0,56(sp)
    1774:	04010413          	addi	s0,sp,64
    1778:	00050793          	mv	a5,a0
    177c:	fcc42423          	sw	a2,-56(s0)
    1780:	00068713          	mv	a4,a3
    1784:	fcf407a3          	sb	a5,-49(s0)
    1788:	00058793          	mv	a5,a1
    178c:	fcf40723          	sb	a5,-50(s0)
    1790:	00070793          	mv	a5,a4
    1794:	fcf406a3          	sb	a5,-51(s0)
    1798:	fcf44783          	lbu	a5,-49(s0)
    179c:	00179793          	slli	a5,a5,0x1
    17a0:	0ff7f793          	zext.b	a5,a5
    17a4:	3007e793          	ori	a5,a5,768
    17a8:	fef42023          	sw	a5,-32(s0)
    17ac:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    17b0:	00078713          	mv	a4,a5
    17b4:	fe042783          	lw	a5,-32(s0)
    17b8:	00f72023          	sw	a5,0(a4)
    17bc:	fce44783          	lbu	a5,-50(s0)
    17c0:	2007e793          	ori	a5,a5,512
    17c4:	fef42023          	sw	a5,-32(s0)
    17c8:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    17cc:	00078713          	mv	a4,a5
    17d0:	fe042783          	lw	a5,-32(s0)
    17d4:	00f72023          	sw	a5,0(a4)
    17d8:	fe0407a3          	sb	zero,-17(s0)
    17dc:	0380006f          	j	1814 <i2c_writeN_d7r8+0xac>
    17e0:	fef44783          	lbu	a5,-17(s0)
    17e4:	fc842703          	lw	a4,-56(s0)
    17e8:	00f707b3          	add	a5,a4,a5
    17ec:	0007c783          	lbu	a5,0(a5)
    17f0:	2007e793          	ori	a5,a5,512
    17f4:	fef42023          	sw	a5,-32(s0)
    17f8:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    17fc:	00078713          	mv	a4,a5
    1800:	fe042783          	lw	a5,-32(s0)
    1804:	00f72023          	sw	a5,0(a4)
    1808:	fef44783          	lbu	a5,-17(s0)
    180c:	00178793          	addi	a5,a5,1
    1810:	fef407a3          	sb	a5,-17(s0)
    1814:	fef44703          	lbu	a4,-17(s0)
    1818:	fcd44783          	lbu	a5,-51(s0)
    181c:	fff78793          	addi	a5,a5,-1
    1820:	fcf740e3          	blt	a4,a5,17e0 <i2c_writeN_d7r8+0x78>
    1824:	fef44783          	lbu	a5,-17(s0)
    1828:	fc842703          	lw	a4,-56(s0)
    182c:	00f707b3          	add	a5,a4,a5
    1830:	0007c783          	lbu	a5,0(a5)
    1834:	00078713          	mv	a4,a5
    1838:	000017b7          	lui	a5,0x1
    183c:	a0078793          	addi	a5,a5,-1536 # a00 <my_vprintf+0x2ac>
    1840:	00f767b3          	or	a5,a4,a5
    1844:	fef42023          	sw	a5,-32(s0)
    1848:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    184c:	00078713          	mv	a4,a5
    1850:	fe042783          	lw	a5,-32(s0)
    1854:	00f72023          	sw	a5,0(a4)
    1858:	fcd44783          	lbu	a5,-51(s0)
    185c:	00278793          	addi	a5,a5,2
    1860:	fcf42e23          	sw	a5,-36(s0)
    1864:	fdc42783          	lw	a5,-36(s0)
    1868:	01879793          	slli	a5,a5,0x18
    186c:	0017e793          	ori	a5,a5,1
    1870:	fef42023          	sw	a5,-32(s0)
    1874:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    1878:	00078713          	mv	a4,a5
    187c:	fe042783          	lw	a5,-32(s0)
    1880:	00f72023          	sw	a5,0(a4)
    1884:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    1888:	0007a783          	lw	a5,0(a5)
    188c:	fcf42c23          	sw	a5,-40(s0)
    1890:	fd842783          	lw	a5,-40(s0)
    1894:	0017f793          	andi	a5,a5,1
    1898:	fe0796e3          	bnez	a5,1884 <i2c_writeN_d7r8+0x11c>
    189c:	fd842783          	lw	a5,-40(s0)
    18a0:	0187d793          	srli	a5,a5,0x18
    18a4:	fdc42703          	lw	a4,-36(s0)
    18a8:	00f70663          	beq	a4,a5,18b4 <i2c_writeN_d7r8+0x14c>
    18ac:	fff00793          	li	a5,-1
    18b0:	07c0006f          	j	192c <i2c_writeN_d7r8+0x1c4>
    18b4:	fe042423          	sw	zero,-24(s0)
    18b8:	fe042223          	sw	zero,-28(s0)
    18bc:	0500006f          	j	190c <i2c_writeN_d7r8+0x1a4>
    18c0:	5341a783          	lw	a5,1332(gp) # 4bf4 <CSRA_I2C_RX_DATA>
    18c4:	0007a783          	lw	a5,0(a5)
    18c8:	fcf42c23          	sw	a5,-40(s0)
    18cc:	fd842783          	lw	a5,-40(s0)
    18d0:	1007f793          	andi	a5,a5,256
    18d4:	02079663          	bnez	a5,1900 <i2c_writeN_d7r8+0x198>
    18d8:	fe842783          	lw	a5,-24(s0)
    18dc:	00178793          	addi	a5,a5,1
    18e0:	fef42423          	sw	a5,-24(s0)
    18e4:	fcf44783          	lbu	a5,-49(s0)
    18e8:	fce44683          	lbu	a3,-50(s0)
    18ec:	fe442703          	lw	a4,-28(s0)
    18f0:	00078613          	mv	a2,a5
    18f4:	32c18593          	addi	a1,gp,812 # 49ec <__FUNCTION__.4>
    18f8:	1a018513          	addi	a0,gp,416 # 4860 <__global_pointer$+0x1a0>
    18fc:	b7dfe0ef          	jal	478 <my_printf>
    1900:	fe442783          	lw	a5,-28(s0)
    1904:	00178793          	addi	a5,a5,1
    1908:	fef42223          	sw	a5,-28(s0)
    190c:	fe442783          	lw	a5,-28(s0)
    1910:	fdc42703          	lw	a4,-36(s0)
    1914:	fae7e6e3          	bltu	a5,a4,18c0 <i2c_writeN_d7r8+0x158>
    1918:	fe842783          	lw	a5,-24(s0)
    191c:	00078663          	beqz	a5,1928 <i2c_writeN_d7r8+0x1c0>
    1920:	fff00793          	li	a5,-1
    1924:	0080006f          	j	192c <i2c_writeN_d7r8+0x1c4>
    1928:	00000793          	li	a5,0
    192c:	00078513          	mv	a0,a5
    1930:	03c12083          	lw	ra,60(sp)
    1934:	03812403          	lw	s0,56(sp)
    1938:	04010113          	addi	sp,sp,64
    193c:	00008067          	ret

00001940 <i2c_read_d7r16>:
    1940:	fc010113          	addi	sp,sp,-64
    1944:	02112e23          	sw	ra,60(sp)
    1948:	02812c23          	sw	s0,56(sp)
    194c:	04010413          	addi	s0,sp,64
    1950:	00050793          	mv	a5,a0
    1954:	00058713          	mv	a4,a1
    1958:	fcc42423          	sw	a2,-56(s0)
    195c:	fcf407a3          	sb	a5,-49(s0)
    1960:	00070793          	mv	a5,a4
    1964:	fcf41623          	sh	a5,-52(s0)
    1968:	fc842783          	lw	a5,-56(s0)
    196c:	00079663          	bnez	a5,1978 <i2c_read_d7r16+0x38>
    1970:	00000793          	li	a5,0
    1974:	1d40006f          	j	1b48 <i2c_read_d7r16+0x208>
    1978:	fcf44783          	lbu	a5,-49(s0)
    197c:	00179793          	slli	a5,a5,0x1
    1980:	0ff7f793          	zext.b	a5,a5
    1984:	3007e793          	ori	a5,a5,768
    1988:	fef42223          	sw	a5,-28(s0)
    198c:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1990:	00078713          	mv	a4,a5
    1994:	fe442783          	lw	a5,-28(s0)
    1998:	00f72023          	sw	a5,0(a4)
    199c:	fcc45783          	lhu	a5,-52(s0)
    19a0:	0087d793          	srli	a5,a5,0x8
    19a4:	01079793          	slli	a5,a5,0x10
    19a8:	0107d793          	srli	a5,a5,0x10
    19ac:	0ff7f793          	zext.b	a5,a5
    19b0:	2007e793          	ori	a5,a5,512
    19b4:	fef42223          	sw	a5,-28(s0)
    19b8:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    19bc:	00078713          	mv	a4,a5
    19c0:	fe442783          	lw	a5,-28(s0)
    19c4:	00f72023          	sw	a5,0(a4)
    19c8:	fcc45783          	lhu	a5,-52(s0)
    19cc:	0ff7f713          	zext.b	a4,a5
    19d0:	000017b7          	lui	a5,0x1
    19d4:	20078793          	addi	a5,a5,512 # 1200 <i2c_read_d7r8+0xb4>
    19d8:	00f767b3          	or	a5,a4,a5
    19dc:	fef42223          	sw	a5,-28(s0)
    19e0:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    19e4:	00078713          	mv	a4,a5
    19e8:	fe442783          	lw	a5,-28(s0)
    19ec:	00f72023          	sw	a5,0(a4)
    19f0:	fcf44783          	lbu	a5,-49(s0)
    19f4:	00179793          	slli	a5,a5,0x1
    19f8:	0ff7f793          	zext.b	a5,a5
    19fc:	3017e793          	ori	a5,a5,769
    1a00:	fef42223          	sw	a5,-28(s0)
    1a04:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1a08:	00078713          	mv	a4,a5
    1a0c:	fe442783          	lw	a5,-28(s0)
    1a10:	00f72023          	sw	a5,0(a4)
    1a14:	000017b7          	lui	a5,0x1
    1a18:	c0078793          	addi	a5,a5,-1024 # c00 <uart_init_ext+0x18>
    1a1c:	fef42223          	sw	a5,-28(s0)
    1a20:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1a24:	00078713          	mv	a4,a5
    1a28:	fe442783          	lw	a5,-28(s0)
    1a2c:	00f72023          	sw	a5,0(a4)
    1a30:	00500793          	li	a5,5
    1a34:	fef42023          	sw	a5,-32(s0)
    1a38:	fe042783          	lw	a5,-32(s0)
    1a3c:	01879793          	slli	a5,a5,0x18
    1a40:	0017e793          	ori	a5,a5,1
    1a44:	fef42223          	sw	a5,-28(s0)
    1a48:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    1a4c:	00078713          	mv	a4,a5
    1a50:	fe442783          	lw	a5,-28(s0)
    1a54:	00f72023          	sw	a5,0(a4)
    1a58:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    1a5c:	0007a783          	lw	a5,0(a5)
    1a60:	fcf42e23          	sw	a5,-36(s0)
    1a64:	fdc42783          	lw	a5,-36(s0)
    1a68:	0017f793          	andi	a5,a5,1
    1a6c:	fe0796e3          	bnez	a5,1a58 <i2c_read_d7r16+0x118>
    1a70:	fdc42783          	lw	a5,-36(s0)
    1a74:	0187d793          	srli	a5,a5,0x18
    1a78:	fe042703          	lw	a4,-32(s0)
    1a7c:	00f70663          	beq	a4,a5,1a88 <i2c_read_d7r16+0x148>
    1a80:	fff00793          	li	a5,-1
    1a84:	0c40006f          	j	1b48 <i2c_read_d7r16+0x208>
    1a88:	fe042623          	sw	zero,-20(s0)
    1a8c:	fe042423          	sw	zero,-24(s0)
    1a90:	0500006f          	j	1ae0 <i2c_read_d7r16+0x1a0>
    1a94:	5341a783          	lw	a5,1332(gp) # 4bf4 <CSRA_I2C_RX_DATA>
    1a98:	0007a783          	lw	a5,0(a5)
    1a9c:	fcf42e23          	sw	a5,-36(s0)
    1aa0:	fdc42783          	lw	a5,-36(s0)
    1aa4:	1007f793          	andi	a5,a5,256
    1aa8:	02079663          	bnez	a5,1ad4 <i2c_read_d7r16+0x194>
    1aac:	fec42783          	lw	a5,-20(s0)
    1ab0:	00178793          	addi	a5,a5,1
    1ab4:	fef42623          	sw	a5,-20(s0)
    1ab8:	fcf44783          	lbu	a5,-49(s0)
    1abc:	fcc45683          	lhu	a3,-52(s0)
    1ac0:	fe842703          	lw	a4,-24(s0)
    1ac4:	00078613          	mv	a2,a5
    1ac8:	33c18593          	addi	a1,gp,828 # 49fc <__FUNCTION__.3>
    1acc:	1a018513          	addi	a0,gp,416 # 4860 <__global_pointer$+0x1a0>
    1ad0:	9a9fe0ef          	jal	478 <my_printf>
    1ad4:	fe842783          	lw	a5,-24(s0)
    1ad8:	00178793          	addi	a5,a5,1
    1adc:	fef42423          	sw	a5,-24(s0)
    1ae0:	fe042783          	lw	a5,-32(s0)
    1ae4:	fff78713          	addi	a4,a5,-1
    1ae8:	fe842783          	lw	a5,-24(s0)
    1aec:	fae7e4e3          	bltu	a5,a4,1a94 <i2c_read_d7r16+0x154>
    1af0:	5341a783          	lw	a5,1332(gp) # 4bf4 <CSRA_I2C_RX_DATA>
    1af4:	0007a783          	lw	a5,0(a5)
    1af8:	fcf42e23          	sw	a5,-36(s0)
    1afc:	fdc42783          	lw	a5,-36(s0)
    1b00:	1007f793          	andi	a5,a5,256
    1b04:	02078063          	beqz	a5,1b24 <i2c_read_d7r16+0x1e4>
    1b08:	fec42783          	lw	a5,-20(s0)
    1b0c:	00178793          	addi	a5,a5,1
    1b10:	fef42623          	sw	a5,-20(s0)
    1b14:	fe842603          	lw	a2,-24(s0)
    1b18:	33c18593          	addi	a1,gp,828 # 49fc <__FUNCTION__.3>
    1b1c:	1c418513          	addi	a0,gp,452 # 4884 <__global_pointer$+0x1c4>
    1b20:	959fe0ef          	jal	478 <my_printf>
    1b24:	fdc42783          	lw	a5,-36(s0)
    1b28:	0ff7f713          	zext.b	a4,a5
    1b2c:	fc842783          	lw	a5,-56(s0)
    1b30:	00e78023          	sb	a4,0(a5)
    1b34:	fec42783          	lw	a5,-20(s0)
    1b38:	00078663          	beqz	a5,1b44 <i2c_read_d7r16+0x204>
    1b3c:	fff00793          	li	a5,-1
    1b40:	0080006f          	j	1b48 <i2c_read_d7r16+0x208>
    1b44:	00000793          	li	a5,0
    1b48:	00078513          	mv	a0,a5
    1b4c:	03c12083          	lw	ra,60(sp)
    1b50:	03812403          	lw	s0,56(sp)
    1b54:	04010113          	addi	sp,sp,64
    1b58:	00008067          	ret

00001b5c <i2c_readN_d7r16>:
    1b5c:	fc010113          	addi	sp,sp,-64
    1b60:	02112e23          	sw	ra,60(sp)
    1b64:	02812c23          	sw	s0,56(sp)
    1b68:	04010413          	addi	s0,sp,64
    1b6c:	00050793          	mv	a5,a0
    1b70:	fcc42423          	sw	a2,-56(s0)
    1b74:	00068713          	mv	a4,a3
    1b78:	fcf407a3          	sb	a5,-49(s0)
    1b7c:	00058793          	mv	a5,a1
    1b80:	fcf41623          	sh	a5,-52(s0)
    1b84:	00070793          	mv	a5,a4
    1b88:	fcf40723          	sb	a5,-50(s0)
    1b8c:	fc842783          	lw	a5,-56(s0)
    1b90:	00079663          	bnez	a5,1b9c <i2c_readN_d7r16+0x40>
    1b94:	00000793          	li	a5,0
    1b98:	2980006f          	j	1e30 <i2c_readN_d7r16+0x2d4>
    1b9c:	fcf44783          	lbu	a5,-49(s0)
    1ba0:	00179793          	slli	a5,a5,0x1
    1ba4:	0ff7f793          	zext.b	a5,a5
    1ba8:	3007e793          	ori	a5,a5,768
    1bac:	fcf42e23          	sw	a5,-36(s0)
    1bb0:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1bb4:	00078713          	mv	a4,a5
    1bb8:	fdc42783          	lw	a5,-36(s0)
    1bbc:	00f72023          	sw	a5,0(a4)
    1bc0:	fcc45783          	lhu	a5,-52(s0)
    1bc4:	0087d793          	srli	a5,a5,0x8
    1bc8:	01079793          	slli	a5,a5,0x10
    1bcc:	0107d793          	srli	a5,a5,0x10
    1bd0:	0ff7f793          	zext.b	a5,a5
    1bd4:	2007e793          	ori	a5,a5,512
    1bd8:	fcf42e23          	sw	a5,-36(s0)
    1bdc:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1be0:	00078713          	mv	a4,a5
    1be4:	fdc42783          	lw	a5,-36(s0)
    1be8:	00f72023          	sw	a5,0(a4)
    1bec:	fcc45783          	lhu	a5,-52(s0)
    1bf0:	0ff7f713          	zext.b	a4,a5
    1bf4:	000017b7          	lui	a5,0x1
    1bf8:	20078793          	addi	a5,a5,512 # 1200 <i2c_read_d7r8+0xb4>
    1bfc:	00f767b3          	or	a5,a4,a5
    1c00:	fcf42e23          	sw	a5,-36(s0)
    1c04:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1c08:	00078713          	mv	a4,a5
    1c0c:	fdc42783          	lw	a5,-36(s0)
    1c10:	00f72023          	sw	a5,0(a4)
    1c14:	fcf44783          	lbu	a5,-49(s0)
    1c18:	00179793          	slli	a5,a5,0x1
    1c1c:	0ff7f793          	zext.b	a5,a5
    1c20:	3017e793          	ori	a5,a5,769
    1c24:	fcf42e23          	sw	a5,-36(s0)
    1c28:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1c2c:	00078713          	mv	a4,a5
    1c30:	fdc42783          	lw	a5,-36(s0)
    1c34:	00f72023          	sw	a5,0(a4)
    1c38:	fe0407a3          	sb	zero,-17(s0)
    1c3c:	0280006f          	j	1c64 <i2c_readN_d7r16+0x108>
    1c40:	40000793          	li	a5,1024
    1c44:	fcf42e23          	sw	a5,-36(s0)
    1c48:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1c4c:	00078713          	mv	a4,a5
    1c50:	fdc42783          	lw	a5,-36(s0)
    1c54:	00f72023          	sw	a5,0(a4)
    1c58:	fef44783          	lbu	a5,-17(s0)
    1c5c:	00178793          	addi	a5,a5,1
    1c60:	fef407a3          	sb	a5,-17(s0)
    1c64:	fef44703          	lbu	a4,-17(s0)
    1c68:	fce44783          	lbu	a5,-50(s0)
    1c6c:	fff78793          	addi	a5,a5,-1
    1c70:	fcf748e3          	blt	a4,a5,1c40 <i2c_readN_d7r16+0xe4>
    1c74:	000017b7          	lui	a5,0x1
    1c78:	c0078793          	addi	a5,a5,-1024 # c00 <uart_init_ext+0x18>
    1c7c:	fcf42e23          	sw	a5,-36(s0)
    1c80:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1c84:	00078713          	mv	a4,a5
    1c88:	fdc42783          	lw	a5,-36(s0)
    1c8c:	00f72023          	sw	a5,0(a4)
    1c90:	fce44783          	lbu	a5,-50(s0)
    1c94:	00478793          	addi	a5,a5,4
    1c98:	fcf42c23          	sw	a5,-40(s0)
    1c9c:	fd842783          	lw	a5,-40(s0)
    1ca0:	01879793          	slli	a5,a5,0x18
    1ca4:	0017e793          	ori	a5,a5,1
    1ca8:	fcf42e23          	sw	a5,-36(s0)
    1cac:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    1cb0:	00078713          	mv	a4,a5
    1cb4:	fdc42783          	lw	a5,-36(s0)
    1cb8:	00f72023          	sw	a5,0(a4)
    1cbc:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    1cc0:	0007a783          	lw	a5,0(a5)
    1cc4:	fcf42a23          	sw	a5,-44(s0)
    1cc8:	fd442783          	lw	a5,-44(s0)
    1ccc:	0017f793          	andi	a5,a5,1
    1cd0:	fe0796e3          	bnez	a5,1cbc <i2c_readN_d7r16+0x160>
    1cd4:	fd442783          	lw	a5,-44(s0)
    1cd8:	0187d793          	srli	a5,a5,0x18
    1cdc:	fd842703          	lw	a4,-40(s0)
    1ce0:	00f70663          	beq	a4,a5,1cec <i2c_readN_d7r16+0x190>
    1ce4:	fff00793          	li	a5,-1
    1ce8:	1480006f          	j	1e30 <i2c_readN_d7r16+0x2d4>
    1cec:	fe042423          	sw	zero,-24(s0)
    1cf0:	fe042223          	sw	zero,-28(s0)
    1cf4:	0500006f          	j	1d44 <i2c_readN_d7r16+0x1e8>
    1cf8:	5341a783          	lw	a5,1332(gp) # 4bf4 <CSRA_I2C_RX_DATA>
    1cfc:	0007a783          	lw	a5,0(a5)
    1d00:	fcf42a23          	sw	a5,-44(s0)
    1d04:	fd442783          	lw	a5,-44(s0)
    1d08:	1007f793          	andi	a5,a5,256
    1d0c:	02079663          	bnez	a5,1d38 <i2c_readN_d7r16+0x1dc>
    1d10:	fe842783          	lw	a5,-24(s0)
    1d14:	00178793          	addi	a5,a5,1
    1d18:	fef42423          	sw	a5,-24(s0)
    1d1c:	fcf44783          	lbu	a5,-49(s0)
    1d20:	fcc45683          	lhu	a3,-52(s0)
    1d24:	fe442703          	lw	a4,-28(s0)
    1d28:	00078613          	mv	a2,a5
    1d2c:	34c18593          	addi	a1,gp,844 # 4a0c <__FUNCTION__.2>
    1d30:	1a018513          	addi	a0,gp,416 # 4860 <__global_pointer$+0x1a0>
    1d34:	f44fe0ef          	jal	478 <my_printf>
    1d38:	fe442783          	lw	a5,-28(s0)
    1d3c:	00178793          	addi	a5,a5,1
    1d40:	fef42223          	sw	a5,-28(s0)
    1d44:	fe442703          	lw	a4,-28(s0)
    1d48:	00300793          	li	a5,3
    1d4c:	fae7d6e3          	bge	a5,a4,1cf8 <i2c_readN_d7r16+0x19c>
    1d50:	fe0401a3          	sb	zero,-29(s0)
    1d54:	fe0401a3          	sb	zero,-29(s0)
    1d58:	0680006f          	j	1dc0 <i2c_readN_d7r16+0x264>
    1d5c:	5341a783          	lw	a5,1332(gp) # 4bf4 <CSRA_I2C_RX_DATA>
    1d60:	0007a783          	lw	a5,0(a5)
    1d64:	fcf42a23          	sw	a5,-44(s0)
    1d68:	fd442783          	lw	a5,-44(s0)
    1d6c:	1007f793          	andi	a5,a5,256
    1d70:	02079663          	bnez	a5,1d9c <i2c_readN_d7r16+0x240>
    1d74:	fe842783          	lw	a5,-24(s0)
    1d78:	00178793          	addi	a5,a5,1
    1d7c:	fef42423          	sw	a5,-24(s0)
    1d80:	fe344703          	lbu	a4,-29(s0)
    1d84:	fe442783          	lw	a5,-28(s0)
    1d88:	00f707b3          	add	a5,a4,a5
    1d8c:	00078613          	mv	a2,a5
    1d90:	34c18593          	addi	a1,gp,844 # 4a0c <__FUNCTION__.2>
    1d94:	1f818513          	addi	a0,gp,504 # 48b8 <__global_pointer$+0x1f8>
    1d98:	ee0fe0ef          	jal	478 <my_printf>
    1d9c:	fe344783          	lbu	a5,-29(s0)
    1da0:	fc842703          	lw	a4,-56(s0)
    1da4:	00f707b3          	add	a5,a4,a5
    1da8:	fd442703          	lw	a4,-44(s0)
    1dac:	0ff77713          	zext.b	a4,a4
    1db0:	00e78023          	sb	a4,0(a5)
    1db4:	fe344783          	lbu	a5,-29(s0)
    1db8:	00178793          	addi	a5,a5,1
    1dbc:	fef401a3          	sb	a5,-29(s0)
    1dc0:	fe344703          	lbu	a4,-29(s0)
    1dc4:	fce44783          	lbu	a5,-50(s0)
    1dc8:	fff78793          	addi	a5,a5,-1
    1dcc:	f8f748e3          	blt	a4,a5,1d5c <i2c_readN_d7r16+0x200>
    1dd0:	5341a783          	lw	a5,1332(gp) # 4bf4 <CSRA_I2C_RX_DATA>
    1dd4:	0007a783          	lw	a5,0(a5)
    1dd8:	fcf42a23          	sw	a5,-44(s0)
    1ddc:	fd442783          	lw	a5,-44(s0)
    1de0:	1007f793          	andi	a5,a5,256
    1de4:	02078063          	beqz	a5,1e04 <i2c_readN_d7r16+0x2a8>
    1de8:	fe842783          	lw	a5,-24(s0)
    1dec:	00178793          	addi	a5,a5,1
    1df0:	fef42423          	sw	a5,-24(s0)
    1df4:	fe442603          	lw	a2,-28(s0)
    1df8:	34c18593          	addi	a1,gp,844 # 4a0c <__FUNCTION__.2>
    1dfc:	1c418513          	addi	a0,gp,452 # 4884 <__global_pointer$+0x1c4>
    1e00:	e78fe0ef          	jal	478 <my_printf>
    1e04:	fe344783          	lbu	a5,-29(s0)
    1e08:	fc842703          	lw	a4,-56(s0)
    1e0c:	00f707b3          	add	a5,a4,a5
    1e10:	fd442703          	lw	a4,-44(s0)
    1e14:	0ff77713          	zext.b	a4,a4
    1e18:	00e78023          	sb	a4,0(a5)
    1e1c:	fe842783          	lw	a5,-24(s0)
    1e20:	00078663          	beqz	a5,1e2c <i2c_readN_d7r16+0x2d0>
    1e24:	fff00793          	li	a5,-1
    1e28:	0080006f          	j	1e30 <i2c_readN_d7r16+0x2d4>
    1e2c:	00000793          	li	a5,0
    1e30:	00078513          	mv	a0,a5
    1e34:	03c12083          	lw	ra,60(sp)
    1e38:	03812403          	lw	s0,56(sp)
    1e3c:	04010113          	addi	sp,sp,64
    1e40:	00008067          	ret

00001e44 <i2c_write_d7r16>:
    1e44:	fc010113          	addi	sp,sp,-64
    1e48:	02112e23          	sw	ra,60(sp)
    1e4c:	02812c23          	sw	s0,56(sp)
    1e50:	04010413          	addi	s0,sp,64
    1e54:	00050793          	mv	a5,a0
    1e58:	00058693          	mv	a3,a1
    1e5c:	00060713          	mv	a4,a2
    1e60:	fcf407a3          	sb	a5,-49(s0)
    1e64:	00068793          	mv	a5,a3
    1e68:	fcf41623          	sh	a5,-52(s0)
    1e6c:	00070793          	mv	a5,a4
    1e70:	fcf40723          	sb	a5,-50(s0)
    1e74:	fcf44783          	lbu	a5,-49(s0)
    1e78:	00179793          	slli	a5,a5,0x1
    1e7c:	0ff7f793          	zext.b	a5,a5
    1e80:	3007e793          	ori	a5,a5,768
    1e84:	fef42223          	sw	a5,-28(s0)
    1e88:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1e8c:	00078713          	mv	a4,a5
    1e90:	fe442783          	lw	a5,-28(s0)
    1e94:	00f72023          	sw	a5,0(a4)
    1e98:	fcc45783          	lhu	a5,-52(s0)
    1e9c:	0087d793          	srli	a5,a5,0x8
    1ea0:	01079793          	slli	a5,a5,0x10
    1ea4:	0107d793          	srli	a5,a5,0x10
    1ea8:	0ff7f793          	zext.b	a5,a5
    1eac:	2007e793          	ori	a5,a5,512
    1eb0:	fef42223          	sw	a5,-28(s0)
    1eb4:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1eb8:	00078713          	mv	a4,a5
    1ebc:	fe442783          	lw	a5,-28(s0)
    1ec0:	00f72023          	sw	a5,0(a4)
    1ec4:	fcc45783          	lhu	a5,-52(s0)
    1ec8:	0ff7f793          	zext.b	a5,a5
    1ecc:	2007e793          	ori	a5,a5,512
    1ed0:	fef42223          	sw	a5,-28(s0)
    1ed4:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1ed8:	00078713          	mv	a4,a5
    1edc:	fe442783          	lw	a5,-28(s0)
    1ee0:	00f72023          	sw	a5,0(a4)
    1ee4:	fce44703          	lbu	a4,-50(s0)
    1ee8:	000017b7          	lui	a5,0x1
    1eec:	a0078793          	addi	a5,a5,-1536 # a00 <my_vprintf+0x2ac>
    1ef0:	00f767b3          	or	a5,a4,a5
    1ef4:	fef42223          	sw	a5,-28(s0)
    1ef8:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    1efc:	00078713          	mv	a4,a5
    1f00:	fe442783          	lw	a5,-28(s0)
    1f04:	00f72023          	sw	a5,0(a4)
    1f08:	00400793          	li	a5,4
    1f0c:	fef42023          	sw	a5,-32(s0)
    1f10:	fe042783          	lw	a5,-32(s0)
    1f14:	01879793          	slli	a5,a5,0x18
    1f18:	0017e793          	ori	a5,a5,1
    1f1c:	fef42223          	sw	a5,-28(s0)
    1f20:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    1f24:	00078713          	mv	a4,a5
    1f28:	fe442783          	lw	a5,-28(s0)
    1f2c:	00f72023          	sw	a5,0(a4)
    1f30:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    1f34:	0007a783          	lw	a5,0(a5)
    1f38:	fcf42e23          	sw	a5,-36(s0)
    1f3c:	fdc42783          	lw	a5,-36(s0)
    1f40:	0017f793          	andi	a5,a5,1
    1f44:	fe0796e3          	bnez	a5,1f30 <i2c_write_d7r16+0xec>
    1f48:	fdc42783          	lw	a5,-36(s0)
    1f4c:	0187d793          	srli	a5,a5,0x18
    1f50:	fe042703          	lw	a4,-32(s0)
    1f54:	00f70663          	beq	a4,a5,1f60 <i2c_write_d7r16+0x11c>
    1f58:	fff00793          	li	a5,-1
    1f5c:	07c0006f          	j	1fd8 <i2c_write_d7r16+0x194>
    1f60:	fe042623          	sw	zero,-20(s0)
    1f64:	fe042423          	sw	zero,-24(s0)
    1f68:	0500006f          	j	1fb8 <i2c_write_d7r16+0x174>
    1f6c:	5341a783          	lw	a5,1332(gp) # 4bf4 <CSRA_I2C_RX_DATA>
    1f70:	0007a783          	lw	a5,0(a5)
    1f74:	fcf42e23          	sw	a5,-36(s0)
    1f78:	fdc42783          	lw	a5,-36(s0)
    1f7c:	1007f793          	andi	a5,a5,256
    1f80:	02079663          	bnez	a5,1fac <i2c_write_d7r16+0x168>
    1f84:	fec42783          	lw	a5,-20(s0)
    1f88:	00178793          	addi	a5,a5,1
    1f8c:	fef42623          	sw	a5,-20(s0)
    1f90:	fcf44783          	lbu	a5,-49(s0)
    1f94:	fcc45683          	lhu	a3,-52(s0)
    1f98:	fe842703          	lw	a4,-24(s0)
    1f9c:	00078613          	mv	a2,a5
    1fa0:	35c18593          	addi	a1,gp,860 # 4a1c <__FUNCTION__.1>
    1fa4:	1a018513          	addi	a0,gp,416 # 4860 <__global_pointer$+0x1a0>
    1fa8:	cd0fe0ef          	jal	478 <my_printf>
    1fac:	fe842783          	lw	a5,-24(s0)
    1fb0:	00178793          	addi	a5,a5,1
    1fb4:	fef42423          	sw	a5,-24(s0)
    1fb8:	fe842783          	lw	a5,-24(s0)
    1fbc:	fe042703          	lw	a4,-32(s0)
    1fc0:	fae7e6e3          	bltu	a5,a4,1f6c <i2c_write_d7r16+0x128>
    1fc4:	fec42783          	lw	a5,-20(s0)
    1fc8:	00078663          	beqz	a5,1fd4 <i2c_write_d7r16+0x190>
    1fcc:	fff00793          	li	a5,-1
    1fd0:	0080006f          	j	1fd8 <i2c_write_d7r16+0x194>
    1fd4:	00000793          	li	a5,0
    1fd8:	00078513          	mv	a0,a5
    1fdc:	03c12083          	lw	ra,60(sp)
    1fe0:	03812403          	lw	s0,56(sp)
    1fe4:	04010113          	addi	sp,sp,64
    1fe8:	00008067          	ret

00001fec <i2c_writeN_d7r16>:
    1fec:	fc010113          	addi	sp,sp,-64
    1ff0:	02112e23          	sw	ra,60(sp)
    1ff4:	02812c23          	sw	s0,56(sp)
    1ff8:	04010413          	addi	s0,sp,64
    1ffc:	00050793          	mv	a5,a0
    2000:	fcc42423          	sw	a2,-56(s0)
    2004:	00068713          	mv	a4,a3
    2008:	fcf407a3          	sb	a5,-49(s0)
    200c:	00058793          	mv	a5,a1
    2010:	fcf41623          	sh	a5,-52(s0)
    2014:	00070793          	mv	a5,a4
    2018:	fcf40723          	sb	a5,-50(s0)
    201c:	fcf44783          	lbu	a5,-49(s0)
    2020:	00179793          	slli	a5,a5,0x1
    2024:	0ff7f793          	zext.b	a5,a5
    2028:	3007e793          	ori	a5,a5,768
    202c:	fef42023          	sw	a5,-32(s0)
    2030:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    2034:	00078713          	mv	a4,a5
    2038:	fe042783          	lw	a5,-32(s0)
    203c:	00f72023          	sw	a5,0(a4)
    2040:	fcc45783          	lhu	a5,-52(s0)
    2044:	0087d793          	srli	a5,a5,0x8
    2048:	01079793          	slli	a5,a5,0x10
    204c:	0107d793          	srli	a5,a5,0x10
    2050:	0ff7f793          	zext.b	a5,a5
    2054:	2007e793          	ori	a5,a5,512
    2058:	fef42023          	sw	a5,-32(s0)
    205c:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    2060:	00078713          	mv	a4,a5
    2064:	fe042783          	lw	a5,-32(s0)
    2068:	00f72023          	sw	a5,0(a4)
    206c:	fcc45783          	lhu	a5,-52(s0)
    2070:	0ff7f793          	zext.b	a5,a5
    2074:	2007e793          	ori	a5,a5,512
    2078:	fef42023          	sw	a5,-32(s0)
    207c:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    2080:	00078713          	mv	a4,a5
    2084:	fe042783          	lw	a5,-32(s0)
    2088:	00f72023          	sw	a5,0(a4)
    208c:	fe0407a3          	sb	zero,-17(s0)
    2090:	0380006f          	j	20c8 <i2c_writeN_d7r16+0xdc>
    2094:	fef44783          	lbu	a5,-17(s0)
    2098:	fc842703          	lw	a4,-56(s0)
    209c:	00f707b3          	add	a5,a4,a5
    20a0:	0007c783          	lbu	a5,0(a5)
    20a4:	2007e793          	ori	a5,a5,512
    20a8:	fef42023          	sw	a5,-32(s0)
    20ac:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    20b0:	00078713          	mv	a4,a5
    20b4:	fe042783          	lw	a5,-32(s0)
    20b8:	00f72023          	sw	a5,0(a4)
    20bc:	fef44783          	lbu	a5,-17(s0)
    20c0:	00178793          	addi	a5,a5,1
    20c4:	fef407a3          	sb	a5,-17(s0)
    20c8:	fef44703          	lbu	a4,-17(s0)
    20cc:	fce44783          	lbu	a5,-50(s0)
    20d0:	fff78793          	addi	a5,a5,-1
    20d4:	fcf740e3          	blt	a4,a5,2094 <i2c_writeN_d7r16+0xa8>
    20d8:	fef44783          	lbu	a5,-17(s0)
    20dc:	fc842703          	lw	a4,-56(s0)
    20e0:	00f707b3          	add	a5,a4,a5
    20e4:	0007c783          	lbu	a5,0(a5)
    20e8:	00078713          	mv	a4,a5
    20ec:	000017b7          	lui	a5,0x1
    20f0:	a0078793          	addi	a5,a5,-1536 # a00 <my_vprintf+0x2ac>
    20f4:	00f767b3          	or	a5,a4,a5
    20f8:	fef42023          	sw	a5,-32(s0)
    20fc:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    2100:	00078713          	mv	a4,a5
    2104:	fe042783          	lw	a5,-32(s0)
    2108:	00f72023          	sw	a5,0(a4)
    210c:	fce44783          	lbu	a5,-50(s0)
    2110:	00378793          	addi	a5,a5,3
    2114:	fcf42e23          	sw	a5,-36(s0)
    2118:	fdc42783          	lw	a5,-36(s0)
    211c:	01879793          	slli	a5,a5,0x18
    2120:	0017e793          	ori	a5,a5,1
    2124:	fef42023          	sw	a5,-32(s0)
    2128:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    212c:	00078713          	mv	a4,a5
    2130:	fe042783          	lw	a5,-32(s0)
    2134:	00f72023          	sw	a5,0(a4)
    2138:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    213c:	0007a783          	lw	a5,0(a5)
    2140:	fcf42c23          	sw	a5,-40(s0)
    2144:	fd842783          	lw	a5,-40(s0)
    2148:	0017f793          	andi	a5,a5,1
    214c:	fe0796e3          	bnez	a5,2138 <i2c_writeN_d7r16+0x14c>
    2150:	fd842783          	lw	a5,-40(s0)
    2154:	0187d793          	srli	a5,a5,0x18
    2158:	fdc42703          	lw	a4,-36(s0)
    215c:	00f70663          	beq	a4,a5,2168 <i2c_writeN_d7r16+0x17c>
    2160:	fff00793          	li	a5,-1
    2164:	07c0006f          	j	21e0 <i2c_writeN_d7r16+0x1f4>
    2168:	fe042423          	sw	zero,-24(s0)
    216c:	fe042223          	sw	zero,-28(s0)
    2170:	0500006f          	j	21c0 <i2c_writeN_d7r16+0x1d4>
    2174:	5341a783          	lw	a5,1332(gp) # 4bf4 <CSRA_I2C_RX_DATA>
    2178:	0007a783          	lw	a5,0(a5)
    217c:	fcf42c23          	sw	a5,-40(s0)
    2180:	fd842783          	lw	a5,-40(s0)
    2184:	1007f793          	andi	a5,a5,256
    2188:	02079663          	bnez	a5,21b4 <i2c_writeN_d7r16+0x1c8>
    218c:	fe842783          	lw	a5,-24(s0)
    2190:	00178793          	addi	a5,a5,1
    2194:	fef42423          	sw	a5,-24(s0)
    2198:	fcf44783          	lbu	a5,-49(s0)
    219c:	fcc45683          	lhu	a3,-52(s0)
    21a0:	fe442703          	lw	a4,-28(s0)
    21a4:	00078613          	mv	a2,a5
    21a8:	36c18593          	addi	a1,gp,876 # 4a2c <__FUNCTION__.0>
    21ac:	1a018513          	addi	a0,gp,416 # 4860 <__global_pointer$+0x1a0>
    21b0:	ac8fe0ef          	jal	478 <my_printf>
    21b4:	fe442783          	lw	a5,-28(s0)
    21b8:	00178793          	addi	a5,a5,1
    21bc:	fef42223          	sw	a5,-28(s0)
    21c0:	fe442783          	lw	a5,-28(s0)
    21c4:	fdc42703          	lw	a4,-36(s0)
    21c8:	fae7e6e3          	bltu	a5,a4,2174 <i2c_writeN_d7r16+0x188>
    21cc:	fe842783          	lw	a5,-24(s0)
    21d0:	00078663          	beqz	a5,21dc <i2c_writeN_d7r16+0x1f0>
    21d4:	fff00793          	li	a5,-1
    21d8:	0080006f          	j	21e0 <i2c_writeN_d7r16+0x1f4>
    21dc:	00000793          	li	a5,0
    21e0:	00078513          	mv	a0,a5
    21e4:	03c12083          	lw	ra,60(sp)
    21e8:	03812403          	lw	s0,56(sp)
    21ec:	04010113          	addi	sp,sp,64
    21f0:	00008067          	ret

000021f4 <i2c_rst>:
    21f4:	fe010113          	addi	sp,sp,-32
    21f8:	00812e23          	sw	s0,28(sp)
    21fc:	02010413          	addi	s0,sp,32
    2200:	5101a783          	lw	a5,1296(gp) # 4bd0 <CSRA_I2C_CONTROL>
    2204:	0007a783          	lw	a5,0(a5)
    2208:	fef42623          	sw	a5,-20(s0)
    220c:	fec42703          	lw	a4,-20(s0)
    2210:	800007b7          	lui	a5,0x80000
    2214:	00f767b3          	or	a5,a4,a5
    2218:	fef42423          	sw	a5,-24(s0)
    221c:	5101a783          	lw	a5,1296(gp) # 4bd0 <CSRA_I2C_CONTROL>
    2220:	00078713          	mv	a4,a5
    2224:	fe842783          	lw	a5,-24(s0)
    2228:	00f72023          	sw	a5,0(a4)
    222c:	fec42703          	lw	a4,-20(s0)
    2230:	800007b7          	lui	a5,0x80000
    2234:	fff78793          	addi	a5,a5,-1 # 7fffffff <_memory_end+0x7ffdffff>
    2238:	00f777b3          	and	a5,a4,a5
    223c:	fef42423          	sw	a5,-24(s0)
    2240:	5101a783          	lw	a5,1296(gp) # 4bd0 <CSRA_I2C_CONTROL>
    2244:	00078713          	mv	a4,a5
    2248:	fe842783          	lw	a5,-24(s0)
    224c:	00f72023          	sw	a5,0(a4)
    2250:	00000793          	li	a5,0
    2254:	00078513          	mv	a0,a5
    2258:	01c12403          	lw	s0,28(sp)
    225c:	02010113          	addi	sp,sp,32
    2260:	00008067          	ret

00002264 <i2c_enable>:
    2264:	fe010113          	addi	sp,sp,-32
    2268:	00812e23          	sw	s0,28(sp)
    226c:	02010413          	addi	s0,sp,32
    2270:	5101a783          	lw	a5,1296(gp) # 4bd0 <CSRA_I2C_CONTROL>
    2274:	0007a783          	lw	a5,0(a5)
    2278:	fef42623          	sw	a5,-20(s0)
    227c:	fec42783          	lw	a5,-20(s0)
    2280:	0017e793          	ori	a5,a5,1
    2284:	fef42423          	sw	a5,-24(s0)
    2288:	5101a783          	lw	a5,1296(gp) # 4bd0 <CSRA_I2C_CONTROL>
    228c:	00078713          	mv	a4,a5
    2290:	fe842783          	lw	a5,-24(s0)
    2294:	00f72023          	sw	a5,0(a4)
    2298:	00000793          	li	a5,0
    229c:	00078513          	mv	a0,a5
    22a0:	01c12403          	lw	s0,28(sp)
    22a4:	02010113          	addi	sp,sp,32
    22a8:	00008067          	ret

000022ac <i2c_disable>:
    22ac:	fe010113          	addi	sp,sp,-32
    22b0:	00812e23          	sw	s0,28(sp)
    22b4:	02010413          	addi	s0,sp,32
    22b8:	5101a783          	lw	a5,1296(gp) # 4bd0 <CSRA_I2C_CONTROL>
    22bc:	0007a783          	lw	a5,0(a5)
    22c0:	fef42623          	sw	a5,-20(s0)
    22c4:	fec42783          	lw	a5,-20(s0)
    22c8:	ffe7f793          	andi	a5,a5,-2
    22cc:	fef42423          	sw	a5,-24(s0)
    22d0:	5101a783          	lw	a5,1296(gp) # 4bd0 <CSRA_I2C_CONTROL>
    22d4:	00078713          	mv	a4,a5
    22d8:	fe842783          	lw	a5,-24(s0)
    22dc:	00f72023          	sw	a5,0(a4)
    22e0:	00000793          	li	a5,0
    22e4:	00078513          	mv	a0,a5
    22e8:	01c12403          	lw	s0,28(sp)
    22ec:	02010113          	addi	sp,sp,32
    22f0:	00008067          	ret

000022f4 <i2c_sel>:
    22f4:	fd010113          	addi	sp,sp,-48
    22f8:	02812623          	sw	s0,44(sp)
    22fc:	03010413          	addi	s0,sp,48
    2300:	fca42e23          	sw	a0,-36(s0)
    2304:	fdc42783          	lw	a5,-36(s0)
    2308:	00f7f793          	andi	a5,a5,15
    230c:	fef42623          	sw	a5,-20(s0)
    2310:	51c1a783          	lw	a5,1308(gp) # 4bdc <CSRA_I2C_SEL>
    2314:	00078713          	mv	a4,a5
    2318:	fec42783          	lw	a5,-20(s0)
    231c:	00f72023          	sw	a5,0(a4)
    2320:	fdc42783          	lw	a5,-36(s0)
    2324:	00f7f713          	andi	a4,a5,15
    2328:	54e1a023          	sw	a4,1344(gp) # 4c00 <current_i2c_id>
    232c:	00000793          	li	a5,0
    2330:	00078513          	mv	a0,a5
    2334:	02c12403          	lw	s0,44(sp)
    2338:	03010113          	addi	sp,sp,48
    233c:	00008067          	ret

00002340 <i2c_config>:
    2340:	fd010113          	addi	sp,sp,-48
    2344:	02112623          	sw	ra,44(sp)
    2348:	02812423          	sw	s0,40(sp)
    234c:	03010413          	addi	s0,sp,48
    2350:	fca42e23          	sw	a0,-36(s0)
    2354:	fcb42c23          	sw	a1,-40(s0)
    2358:	fcc42a23          	sw	a2,-44(s0)
    235c:	fcd42823          	sw	a3,-48(s0)
    2360:	fdc42703          	lw	a4,-36(s0)
    2364:	00f00793          	li	a5,15
    2368:	02e7e463          	bltu	a5,a4,2390 <i2c_config+0x50>
    236c:	fd842703          	lw	a4,-40(s0)
    2370:	00f00793          	li	a5,15
    2374:	00e7ee63          	bltu	a5,a4,2390 <i2c_config+0x50>
    2378:	fd442703          	lw	a4,-44(s0)
    237c:	00f00793          	li	a5,15
    2380:	00e7e863          	bltu	a5,a4,2390 <i2c_config+0x50>
    2384:	fd042703          	lw	a4,-48(s0)
    2388:	00f00793          	li	a5,15
    238c:	00e7f663          	bgeu	a5,a4,2398 <i2c_config+0x58>
    2390:	fff00793          	li	a5,-1
    2394:	0680006f          	j	23fc <i2c_config+0xbc>
    2398:	f15ff0ef          	jal	22ac <i2c_disable>
    239c:	fdc42783          	lw	a5,-36(s0)
    23a0:	00c79713          	slli	a4,a5,0xc
    23a4:	000107b7          	lui	a5,0x10
    23a8:	fff78793          	addi	a5,a5,-1 # ffff <_bss_end+0xb3fb>
    23ac:	00f77733          	and	a4,a4,a5
    23b0:	fd842783          	lw	a5,-40(s0)
    23b4:	00879693          	slli	a3,a5,0x8
    23b8:	000017b7          	lui	a5,0x1
    23bc:	f0078793          	addi	a5,a5,-256 # f00 <uart_put_int+0x68>
    23c0:	00f6f7b3          	and	a5,a3,a5
    23c4:	00f76733          	or	a4,a4,a5
    23c8:	fd442783          	lw	a5,-44(s0)
    23cc:	00479793          	slli	a5,a5,0x4
    23d0:	0ff7f793          	zext.b	a5,a5
    23d4:	00f76733          	or	a4,a4,a5
    23d8:	fd042783          	lw	a5,-48(s0)
    23dc:	00f7f793          	andi	a5,a5,15
    23e0:	00f767b3          	or	a5,a4,a5
    23e4:	fef42623          	sw	a5,-20(s0)
    23e8:	5181a783          	lw	a5,1304(gp) # 4bd8 <CSRA_I2C_CONFIG>
    23ec:	00078713          	mv	a4,a5
    23f0:	fec42783          	lw	a5,-20(s0)
    23f4:	00f72023          	sw	a5,0(a4)
    23f8:	00000793          	li	a5,0
    23fc:	00078513          	mv	a0,a5
    2400:	02c12083          	lw	ra,44(sp)
    2404:	02812403          	lw	s0,40(sp)
    2408:	03010113          	addi	sp,sp,48
    240c:	00008067          	ret

00002410 <i2c_init>:
    2410:	fc010113          	addi	sp,sp,-64
    2414:	02112e23          	sw	ra,60(sp)
    2418:	02812c23          	sw	s0,56(sp)
    241c:	03212a23          	sw	s2,52(sp)
    2420:	03312823          	sw	s3,48(sp)
    2424:	04010413          	addi	s0,sp,64
    2428:	fca42623          	sw	a0,-52(s0)
    242c:	e81ff0ef          	jal	22ac <i2c_disable>
    2430:	5141a783          	lw	a5,1300(gp) # 4bd4 <CSRA_I2C_STATUS>
    2434:	0007a783          	lw	a5,0(a5)
    2438:	fef42623          	sw	a5,-20(s0)
    243c:	fec42783          	lw	a5,-20(s0)
    2440:	0087d793          	srli	a5,a5,0x8
    2444:	0ff7f713          	zext.b	a4,a5
    2448:	52e1ae23          	sw	a4,1340(gp) # 4bfc <ftx_num>
    244c:	fec42783          	lw	a5,-20(s0)
    2450:	0107d793          	srli	a5,a5,0x10
    2454:	0ff7f713          	zext.b	a4,a5
    2458:	52e1ac23          	sw	a4,1336(gp) # 4bf8 <frx_num>
    245c:	5201a783          	lw	a5,1312(gp) # 4be0 <CSRA_I2C_CLK_FREQ>
    2460:	0007a783          	lw	a5,0(a5)
    2464:	fef42623          	sw	a5,-20(s0)
    2468:	fec42783          	lw	a5,-20(s0)
    246c:	fef42423          	sw	a5,-24(s0)
    2470:	fe842503          	lw	a0,-24(s0)
    2474:	47c010ef          	jal	38f0 <__floatunsidf>
    2478:	00050913          	mv	s2,a0
    247c:	00058993          	mv	s3,a1
    2480:	fcc42503          	lw	a0,-52(s0)
    2484:	46c010ef          	jal	38f0 <__floatunsidf>
    2488:	00050713          	mv	a4,a0
    248c:	00058793          	mv	a5,a1
    2490:	00070613          	mv	a2,a4
    2494:	00078693          	mv	a3,a5
    2498:	00090513          	mv	a0,s2
    249c:	00098593          	mv	a1,s3
    24a0:	47d000ef          	jal	311c <__divdf3>
    24a4:	00050713          	mv	a4,a0
    24a8:	00058793          	mv	a5,a1
    24ac:	00070513          	mv	a0,a4
    24b0:	00078593          	mv	a1,a5
    24b4:	3801a603          	lw	a2,896(gp) # 4a40 <__FUNCTION__.0+0x14>
    24b8:	3841a683          	lw	a3,900(gp) # 4a44 <__FUNCTION__.0+0x18>
    24bc:	4cc000ef          	jal	2988 <__adddf3>
    24c0:	00050713          	mv	a4,a0
    24c4:	00058793          	mv	a5,a1
    24c8:	fee42023          	sw	a4,-32(s0)
    24cc:	fef42223          	sw	a5,-28(s0)
    24d0:	fe042503          	lw	a0,-32(s0)
    24d4:	fe442583          	lw	a1,-28(s0)
    24d8:	39c010ef          	jal	3874 <__fixunsdfsi>
    24dc:	00050793          	mv	a5,a0
    24e0:	fcf42e23          	sw	a5,-36(s0)
    24e4:	5241a783          	lw	a5,1316(gp) # 4be4 <CSRA_I2C_SPEED>
    24e8:	00078713          	mv	a4,a5
    24ec:	fcc42783          	lw	a5,-52(s0)
    24f0:	00f72023          	sw	a5,0(a4)
    24f4:	5281a783          	lw	a5,1320(gp) # 4be8 <CSRA_I2C_CLKDIV>
    24f8:	00078713          	mv	a4,a5
    24fc:	fdc42783          	lw	a5,-36(s0)
    2500:	00f72023          	sw	a5,0(a4)
    2504:	00000793          	li	a5,0
    2508:	00078513          	mv	a0,a5
    250c:	03c12083          	lw	ra,60(sp)
    2510:	03812403          	lw	s0,56(sp)
    2514:	03412903          	lw	s2,52(sp)
    2518:	03012983          	lw	s3,48(sp)
    251c:	04010113          	addi	sp,sp,64
    2520:	00008067          	ret

00002524 <i2c_csr_read>:
    2524:	fd010113          	addi	sp,sp,-48
    2528:	02812623          	sw	s0,44(sp)
    252c:	03010413          	addi	s0,sp,48
    2530:	fca42e23          	sw	a0,-36(s0)
    2534:	fcb42c23          	sw	a1,-40(s0)
    2538:	fd842783          	lw	a5,-40(s0)
    253c:	00079663          	bnez	a5,2548 <i2c_csr_read+0x24>
    2540:	00000793          	li	a5,0
    2544:	0200006f          	j	2564 <i2c_csr_read+0x40>
    2548:	fdc42783          	lw	a5,-36(s0)
    254c:	0007a783          	lw	a5,0(a5)
    2550:	fef42623          	sw	a5,-20(s0)
    2554:	fd842783          	lw	a5,-40(s0)
    2558:	fec42703          	lw	a4,-20(s0)
    255c:	00e7a023          	sw	a4,0(a5)
    2560:	00000793          	li	a5,0
    2564:	00078513          	mv	a0,a5
    2568:	02c12403          	lw	s0,44(sp)
    256c:	03010113          	addi	sp,sp,48
    2570:	00008067          	ret

00002574 <i2c_csr_write>:
    2574:	fe010113          	addi	sp,sp,-32
    2578:	00812e23          	sw	s0,28(sp)
    257c:	02010413          	addi	s0,sp,32
    2580:	fea42623          	sw	a0,-20(s0)
    2584:	feb42423          	sw	a1,-24(s0)
    2588:	fec42783          	lw	a5,-20(s0)
    258c:	fe842703          	lw	a4,-24(s0)
    2590:	00e7a023          	sw	a4,0(a5)
    2594:	00000793          	li	a5,0
    2598:	00078513          	mv	a0,a5
    259c:	01c12403          	lw	s0,28(sp)
    25a0:	02010113          	addi	sp,sp,32
    25a4:	00008067          	ret

000025a8 <i2c_csr_check>:
    25a8:	fe010113          	addi	sp,sp,-32
    25ac:	00112e23          	sw	ra,28(sp)
    25b0:	00812c23          	sw	s0,24(sp)
    25b4:	02010413          	addi	s0,sp,32
    25b8:	50c1a783          	lw	a5,1292(gp) # 4bcc <CSRA_I2C_VERSION>
    25bc:	0007a783          	lw	a5,0(a5)
    25c0:	fef42623          	sw	a5,-20(s0)
    25c4:	fec42583          	lw	a1,-20(s0)
    25c8:	21018513          	addi	a0,gp,528 # 48d0 <__global_pointer$+0x210>
    25cc:	eadfd0ef          	jal	478 <my_printf>
    25d0:	5101a783          	lw	a5,1296(gp) # 4bd0 <CSRA_I2C_CONTROL>
    25d4:	0007a783          	lw	a5,0(a5)
    25d8:	fef42623          	sw	a5,-20(s0)
    25dc:	fec42583          	lw	a1,-20(s0)
    25e0:	22418513          	addi	a0,gp,548 # 48e4 <__global_pointer$+0x224>
    25e4:	e95fd0ef          	jal	478 <my_printf>
    25e8:	5141a783          	lw	a5,1300(gp) # 4bd4 <CSRA_I2C_STATUS>
    25ec:	0007a783          	lw	a5,0(a5)
    25f0:	fef42623          	sw	a5,-20(s0)
    25f4:	fec42583          	lw	a1,-20(s0)
    25f8:	23818513          	addi	a0,gp,568 # 48f8 <__global_pointer$+0x238>
    25fc:	e7dfd0ef          	jal	478 <my_printf>
    2600:	5181a783          	lw	a5,1304(gp) # 4bd8 <CSRA_I2C_CONFIG>
    2604:	0007a783          	lw	a5,0(a5)
    2608:	fef42623          	sw	a5,-20(s0)
    260c:	fec42583          	lw	a1,-20(s0)
    2610:	24c18513          	addi	a0,gp,588 # 490c <__global_pointer$+0x24c>
    2614:	e65fd0ef          	jal	478 <my_printf>
    2618:	51c1a783          	lw	a5,1308(gp) # 4bdc <CSRA_I2C_SEL>
    261c:	0007a783          	lw	a5,0(a5)
    2620:	fef42623          	sw	a5,-20(s0)
    2624:	fec42583          	lw	a1,-20(s0)
    2628:	26018513          	addi	a0,gp,608 # 4920 <__global_pointer$+0x260>
    262c:	e4dfd0ef          	jal	478 <my_printf>
    2630:	5201a783          	lw	a5,1312(gp) # 4be0 <CSRA_I2C_CLK_FREQ>
    2634:	0007a783          	lw	a5,0(a5)
    2638:	fef42623          	sw	a5,-20(s0)
    263c:	fec42503          	lw	a0,-20(s0)
    2640:	509010ef          	jal	4348 <__floatunsisf>
    2644:	00050793          	mv	a5,a0
    2648:	00078513          	mv	a0,a5
    264c:	5d9010ef          	jal	4424 <__extendsfdf2>
    2650:	00050713          	mv	a4,a0
    2654:	00058793          	mv	a5,a1
    2658:	3881a603          	lw	a2,904(gp) # 4a48 <__FUNCTION__.0+0x1c>
    265c:	38c1a683          	lw	a3,908(gp) # 4a4c <__FUNCTION__.0+0x20>
    2660:	00070513          	mv	a0,a4
    2664:	00078593          	mv	a1,a5
    2668:	2b5000ef          	jal	311c <__divdf3>
    266c:	00050713          	mv	a4,a0
    2670:	00058793          	mv	a5,a1
    2674:	00070613          	mv	a2,a4
    2678:	00078693          	mv	a3,a5
    267c:	fec42583          	lw	a1,-20(s0)
    2680:	27418513          	addi	a0,gp,628 # 4934 <__global_pointer$+0x274>
    2684:	df5fd0ef          	jal	478 <my_printf>
    2688:	5241a783          	lw	a5,1316(gp) # 4be4 <CSRA_I2C_SPEED>
    268c:	0007a783          	lw	a5,0(a5)
    2690:	fef42623          	sw	a5,-20(s0)
    2694:	fec42503          	lw	a0,-20(s0)
    2698:	4b1010ef          	jal	4348 <__floatunsisf>
    269c:	00050793          	mv	a5,a0
    26a0:	00078513          	mv	a0,a5
    26a4:	581010ef          	jal	4424 <__extendsfdf2>
    26a8:	00050713          	mv	a4,a0
    26ac:	00058793          	mv	a5,a1
    26b0:	3901a603          	lw	a2,912(gp) # 4a50 <__FUNCTION__.0+0x24>
    26b4:	3941a683          	lw	a3,916(gp) # 4a54 <__FUNCTION__.0+0x28>
    26b8:	00070513          	mv	a0,a4
    26bc:	00078593          	mv	a1,a5
    26c0:	25d000ef          	jal	311c <__divdf3>
    26c4:	00050713          	mv	a4,a0
    26c8:	00058793          	mv	a5,a1
    26cc:	00070613          	mv	a2,a4
    26d0:	00078693          	mv	a3,a5
    26d4:	fec42583          	lw	a1,-20(s0)
    26d8:	29018513          	addi	a0,gp,656 # 4950 <__global_pointer$+0x290>
    26dc:	d9dfd0ef          	jal	478 <my_printf>
    26e0:	5281a783          	lw	a5,1320(gp) # 4be8 <CSRA_I2C_CLKDIV>
    26e4:	0007a783          	lw	a5,0(a5)
    26e8:	fef42623          	sw	a5,-20(s0)
    26ec:	fec42583          	lw	a1,-20(s0)
    26f0:	2ac18513          	addi	a0,gp,684 # 496c <__global_pointer$+0x2ac>
    26f4:	d85fd0ef          	jal	478 <my_printf>
    26f8:	52c1a783          	lw	a5,1324(gp) # 4bec <CSRA_I2C_RUN>
    26fc:	0007a783          	lw	a5,0(a5)
    2700:	fef42623          	sw	a5,-20(s0)
    2704:	fec42583          	lw	a1,-20(s0)
    2708:	2c018513          	addi	a0,gp,704 # 4980 <__global_pointer$+0x2c0>
    270c:	d6dfd0ef          	jal	478 <my_printf>
    2710:	5301a783          	lw	a5,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    2714:	0007a783          	lw	a5,0(a5)
    2718:	fef42623          	sw	a5,-20(s0)
    271c:	fec42583          	lw	a1,-20(s0)
    2720:	2d418513          	addi	a0,gp,724 # 4994 <__global_pointer$+0x2d4>
    2724:	d55fd0ef          	jal	478 <my_printf>
    2728:	5341a783          	lw	a5,1332(gp) # 4bf4 <CSRA_I2C_RX_DATA>
    272c:	0007a783          	lw	a5,0(a5)
    2730:	fef42623          	sw	a5,-20(s0)
    2734:	fec42583          	lw	a1,-20(s0)
    2738:	2e818513          	addi	a0,gp,744 # 49a8 <__global_pointer$+0x2e8>
    273c:	d3dfd0ef          	jal	478 <my_printf>
    2740:	00000793          	li	a5,0
    2744:	00078513          	mv	a0,a5
    2748:	01c12083          	lw	ra,28(sp)
    274c:	01812403          	lw	s0,24(sp)
    2750:	02010113          	addi	sp,sp,32
    2754:	00008067          	ret

00002758 <i2c_get_config>:
    2758:	fd010113          	addi	sp,sp,-48
    275c:	02812623          	sw	s0,44(sp)
    2760:	03010413          	addi	s0,sp,48
    2764:	fca42e23          	sw	a0,-36(s0)
    2768:	fcb42c23          	sw	a1,-40(s0)
    276c:	fcc42a23          	sw	a2,-44(s0)
    2770:	fcd42823          	sw	a3,-48(s0)
    2774:	5181a783          	lw	a5,1304(gp) # 4bd8 <CSRA_I2C_CONFIG>
    2778:	0007a783          	lw	a5,0(a5)
    277c:	fef42623          	sw	a5,-20(s0)
    2780:	fdc42783          	lw	a5,-36(s0)
    2784:	00078c63          	beqz	a5,279c <i2c_get_config+0x44>
    2788:	fec42783          	lw	a5,-20(s0)
    278c:	00c7d793          	srli	a5,a5,0xc
    2790:	00f7f713          	andi	a4,a5,15
    2794:	fdc42783          	lw	a5,-36(s0)
    2798:	00e7a023          	sw	a4,0(a5)
    279c:	fd842783          	lw	a5,-40(s0)
    27a0:	00078c63          	beqz	a5,27b8 <i2c_get_config+0x60>
    27a4:	fec42783          	lw	a5,-20(s0)
    27a8:	0087d793          	srli	a5,a5,0x8
    27ac:	00f7f713          	andi	a4,a5,15
    27b0:	fd842783          	lw	a5,-40(s0)
    27b4:	00e7a023          	sw	a4,0(a5)
    27b8:	fd442783          	lw	a5,-44(s0)
    27bc:	00078c63          	beqz	a5,27d4 <i2c_get_config+0x7c>
    27c0:	fec42783          	lw	a5,-20(s0)
    27c4:	0047d793          	srli	a5,a5,0x4
    27c8:	00f7f713          	andi	a4,a5,15
    27cc:	fd442783          	lw	a5,-44(s0)
    27d0:	00e7a023          	sw	a4,0(a5)
    27d4:	fd042783          	lw	a5,-48(s0)
    27d8:	00078a63          	beqz	a5,27ec <i2c_get_config+0x94>
    27dc:	fec42783          	lw	a5,-20(s0)
    27e0:	00f7f713          	andi	a4,a5,15
    27e4:	fd042783          	lw	a5,-48(s0)
    27e8:	00e7a023          	sw	a4,0(a5)
    27ec:	00000793          	li	a5,0
    27f0:	00078513          	mv	a0,a5
    27f4:	02c12403          	lw	s0,44(sp)
    27f8:	03010113          	addi	sp,sp,48
    27fc:	00008067          	ret

00002800 <i2c_get_busy>:
    2800:	fe010113          	addi	sp,sp,-32
    2804:	00812e23          	sw	s0,28(sp)
    2808:	02010413          	addi	s0,sp,32
    280c:	5141a783          	lw	a5,1300(gp) # 4bd4 <CSRA_I2C_STATUS>
    2810:	0007a783          	lw	a5,0(a5)
    2814:	fef42623          	sw	a5,-20(s0)
    2818:	fec42703          	lw	a4,-20(s0)
    281c:	400007b7          	lui	a5,0x40000
    2820:	00f777b3          	and	a5,a4,a5
    2824:	00078513          	mv	a0,a5
    2828:	01c12403          	lw	s0,28(sp)
    282c:	02010113          	addi	sp,sp,32
    2830:	00008067          	ret

00002834 <i2c_get_sel>:
    2834:	fe010113          	addi	sp,sp,-32
    2838:	00812e23          	sw	s0,28(sp)
    283c:	02010413          	addi	s0,sp,32
    2840:	51c1a783          	lw	a5,1308(gp) # 4bdc <CSRA_I2C_SEL>
    2844:	0007a783          	lw	a5,0(a5) # 40000000 <_memory_end+0x3ffe0000>
    2848:	fef42623          	sw	a5,-20(s0)
    284c:	fec42783          	lw	a5,-20(s0)
    2850:	00f7f793          	andi	a5,a5,15
    2854:	00078513          	mv	a0,a5
    2858:	01c12403          	lw	s0,28(sp)
    285c:	02010113          	addi	sp,sp,32
    2860:	00008067          	ret

00002864 <i2c_get_clk_freq>:
    2864:	fe010113          	addi	sp,sp,-32
    2868:	00812e23          	sw	s0,28(sp)
    286c:	02010413          	addi	s0,sp,32
    2870:	5201a783          	lw	a5,1312(gp) # 4be0 <CSRA_I2C_CLK_FREQ>
    2874:	0007a783          	lw	a5,0(a5)
    2878:	fef42623          	sw	a5,-20(s0)
    287c:	fec42783          	lw	a5,-20(s0)
    2880:	00078513          	mv	a0,a5
    2884:	01c12403          	lw	s0,28(sp)
    2888:	02010113          	addi	sp,sp,32
    288c:	00008067          	ret

00002890 <i2c_get_clk_div>:
    2890:	fe010113          	addi	sp,sp,-32
    2894:	00812e23          	sw	s0,28(sp)
    2898:	02010413          	addi	s0,sp,32
    289c:	5281a783          	lw	a5,1320(gp) # 4be8 <CSRA_I2C_CLKDIV>
    28a0:	0007a783          	lw	a5,0(a5)
    28a4:	fef42623          	sw	a5,-20(s0)
    28a8:	fec42783          	lw	a5,-20(s0)
    28ac:	00078513          	mv	a0,a5
    28b0:	01c12403          	lw	s0,28(sp)
    28b4:	02010113          	addi	sp,sp,32
    28b8:	00008067          	ret

000028bc <i2c_set_addr>:
    28bc:	fe010113          	addi	sp,sp,-32
    28c0:	00812e23          	sw	s0,28(sp)
    28c4:	02010413          	addi	s0,sp,32
    28c8:	fea42623          	sw	a0,-20(s0)
    28cc:	fec42703          	lw	a4,-20(s0)
    28d0:	50e1a423          	sw	a4,1288(gp) # 4bc8 <CSRA_I2C_BASE>
    28d4:	fec42703          	lw	a4,-20(s0)
    28d8:	50e1a623          	sw	a4,1292(gp) # 4bcc <CSRA_I2C_VERSION>
    28dc:	fec42783          	lw	a5,-20(s0)
    28e0:	00478713          	addi	a4,a5,4
    28e4:	50e1a823          	sw	a4,1296(gp) # 4bd0 <CSRA_I2C_CONTROL>
    28e8:	fec42783          	lw	a5,-20(s0)
    28ec:	00878713          	addi	a4,a5,8
    28f0:	50e1aa23          	sw	a4,1300(gp) # 4bd4 <CSRA_I2C_STATUS>
    28f4:	fec42783          	lw	a5,-20(s0)
    28f8:	00c78713          	addi	a4,a5,12
    28fc:	50e1ac23          	sw	a4,1304(gp) # 4bd8 <CSRA_I2C_CONFIG>
    2900:	fec42783          	lw	a5,-20(s0)
    2904:	01078713          	addi	a4,a5,16
    2908:	50e1ae23          	sw	a4,1308(gp) # 4bdc <CSRA_I2C_SEL>
    290c:	fec42783          	lw	a5,-20(s0)
    2910:	02078713          	addi	a4,a5,32
    2914:	52e1a023          	sw	a4,1312(gp) # 4be0 <CSRA_I2C_CLK_FREQ>
    2918:	fec42783          	lw	a5,-20(s0)
    291c:	02478713          	addi	a4,a5,36
    2920:	52e1a223          	sw	a4,1316(gp) # 4be4 <CSRA_I2C_SPEED>
    2924:	fec42783          	lw	a5,-20(s0)
    2928:	02878713          	addi	a4,a5,40
    292c:	52e1a423          	sw	a4,1320(gp) # 4be8 <CSRA_I2C_CLKDIV>
    2930:	fec42783          	lw	a5,-20(s0)
    2934:	03078713          	addi	a4,a5,48
    2938:	52e1a623          	sw	a4,1324(gp) # 4bec <CSRA_I2C_RUN>
    293c:	fec42783          	lw	a5,-20(s0)
    2940:	04078713          	addi	a4,a5,64
    2944:	52e1a823          	sw	a4,1328(gp) # 4bf0 <CSRA_I2C_TX_DATA>
    2948:	fec42783          	lw	a5,-20(s0)
    294c:	05078713          	addi	a4,a5,80
    2950:	52e1aa23          	sw	a4,1332(gp) # 4bf4 <CSRA_I2C_RX_DATA>
    2954:	00000793          	li	a5,0
    2958:	00078513          	mv	a0,a5
    295c:	01c12403          	lw	s0,28(sp)
    2960:	02010113          	addi	sp,sp,32
    2964:	00008067          	ret

00002968 <i2c_get_addr>:
    2968:	ff010113          	addi	sp,sp,-16
    296c:	00812623          	sw	s0,12(sp)
    2970:	01010413          	addi	s0,sp,16
    2974:	5081a783          	lw	a5,1288(gp) # 4bc8 <CSRA_I2C_BASE>
    2978:	00078513          	mv	a0,a5
    297c:	00c12403          	lw	s0,12(sp)
    2980:	01010113          	addi	sp,sp,16
    2984:	00008067          	ret

00002988 <__adddf3>:
    2988:	00100837          	lui	a6,0x100
    298c:	fff80813          	addi	a6,a6,-1 # fffff <_memory_end+0xdffff>
    2990:	fe010113          	addi	sp,sp,-32
    2994:	00b878b3          	and	a7,a6,a1
    2998:	0145d713          	srli	a4,a1,0x14
    299c:	01d55793          	srli	a5,a0,0x1d
    29a0:	00d87833          	and	a6,a6,a3
    29a4:	00912a23          	sw	s1,20(sp)
    29a8:	7ff77493          	andi	s1,a4,2047
    29ac:	00389713          	slli	a4,a7,0x3
    29b0:	0146d893          	srli	a7,a3,0x14
    29b4:	00381813          	slli	a6,a6,0x3
    29b8:	01212823          	sw	s2,16(sp)
    29bc:	00e7e7b3          	or	a5,a5,a4
    29c0:	7ff8f893          	andi	a7,a7,2047
    29c4:	01d65713          	srli	a4,a2,0x1d
    29c8:	00112e23          	sw	ra,28(sp)
    29cc:	00812c23          	sw	s0,24(sp)
    29d0:	01312623          	sw	s3,12(sp)
    29d4:	01f5d913          	srli	s2,a1,0x1f
    29d8:	01f6d693          	srli	a3,a3,0x1f
    29dc:	01076733          	or	a4,a4,a6
    29e0:	00351513          	slli	a0,a0,0x3
    29e4:	00361613          	slli	a2,a2,0x3
    29e8:	41148833          	sub	a6,s1,a7
    29ec:	2ad91a63          	bne	s2,a3,2ca0 <__adddf3+0x318>
    29f0:	11005c63          	blez	a6,2b08 <__adddf3+0x180>
    29f4:	04089063          	bnez	a7,2a34 <__adddf3+0xac>
    29f8:	00c766b3          	or	a3,a4,a2
    29fc:	66068063          	beqz	a3,305c <__adddf3+0x6d4>
    2a00:	fff80593          	addi	a1,a6,-1
    2a04:	02059063          	bnez	a1,2a24 <__adddf3+0x9c>
    2a08:	00c50633          	add	a2,a0,a2
    2a0c:	00a636b3          	sltu	a3,a2,a0
    2a10:	00e78733          	add	a4,a5,a4
    2a14:	00060513          	mv	a0,a2
    2a18:	00d707b3          	add	a5,a4,a3
    2a1c:	00100493          	li	s1,1
    2a20:	06c0006f          	j	2a8c <__adddf3+0x104>
    2a24:	7ff00693          	li	a3,2047
    2a28:	02d81063          	bne	a6,a3,2a48 <__adddf3+0xc0>
    2a2c:	7ff00493          	li	s1,2047
    2a30:	1f80006f          	j	2c28 <__adddf3+0x2a0>
    2a34:	7ff00693          	li	a3,2047
    2a38:	1ed48863          	beq	s1,a3,2c28 <__adddf3+0x2a0>
    2a3c:	008006b7          	lui	a3,0x800
    2a40:	00d76733          	or	a4,a4,a3
    2a44:	00080593          	mv	a1,a6
    2a48:	03800693          	li	a3,56
    2a4c:	0ab6c863          	blt	a3,a1,2afc <__adddf3+0x174>
    2a50:	01f00693          	li	a3,31
    2a54:	06b6ca63          	blt	a3,a1,2ac8 <__adddf3+0x140>
    2a58:	02000813          	li	a6,32
    2a5c:	40b80833          	sub	a6,a6,a1
    2a60:	010716b3          	sll	a3,a4,a6
    2a64:	00b658b3          	srl	a7,a2,a1
    2a68:	01061833          	sll	a6,a2,a6
    2a6c:	0116e6b3          	or	a3,a3,a7
    2a70:	01003833          	snez	a6,a6
    2a74:	0106e6b3          	or	a3,a3,a6
    2a78:	00b755b3          	srl	a1,a4,a1
    2a7c:	00a68533          	add	a0,a3,a0
    2a80:	00f585b3          	add	a1,a1,a5
    2a84:	00d536b3          	sltu	a3,a0,a3
    2a88:	00d587b3          	add	a5,a1,a3
    2a8c:	00879713          	slli	a4,a5,0x8
    2a90:	18075c63          	bgez	a4,2c28 <__adddf3+0x2a0>
    2a94:	00148493          	addi	s1,s1,1
    2a98:	7ff00713          	li	a4,2047
    2a9c:	5ae48a63          	beq	s1,a4,3050 <__adddf3+0x6c8>
    2aa0:	ff800737          	lui	a4,0xff800
    2aa4:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    2aa8:	00e7f733          	and	a4,a5,a4
    2aac:	00155793          	srli	a5,a0,0x1
    2ab0:	00157513          	andi	a0,a0,1
    2ab4:	00a7e7b3          	or	a5,a5,a0
    2ab8:	01f71513          	slli	a0,a4,0x1f
    2abc:	00f56533          	or	a0,a0,a5
    2ac0:	00175793          	srli	a5,a4,0x1
    2ac4:	1640006f          	j	2c28 <__adddf3+0x2a0>
    2ac8:	fe058693          	addi	a3,a1,-32
    2acc:	02000893          	li	a7,32
    2ad0:	00d756b3          	srl	a3,a4,a3
    2ad4:	00000813          	li	a6,0
    2ad8:	01158863          	beq	a1,a7,2ae8 <__adddf3+0x160>
    2adc:	04000813          	li	a6,64
    2ae0:	40b80833          	sub	a6,a6,a1
    2ae4:	01071833          	sll	a6,a4,a6
    2ae8:	00c86833          	or	a6,a6,a2
    2aec:	01003833          	snez	a6,a6
    2af0:	0106e6b3          	or	a3,a3,a6
    2af4:	00000593          	li	a1,0
    2af8:	f85ff06f          	j	2a7c <__adddf3+0xf4>
    2afc:	00c766b3          	or	a3,a4,a2
    2b00:	00d036b3          	snez	a3,a3
    2b04:	ff1ff06f          	j	2af4 <__adddf3+0x16c>
    2b08:	0c080a63          	beqz	a6,2bdc <__adddf3+0x254>
    2b0c:	409886b3          	sub	a3,a7,s1
    2b10:	02049463          	bnez	s1,2b38 <__adddf3+0x1b0>
    2b14:	00a7e5b3          	or	a1,a5,a0
    2b18:	50058e63          	beqz	a1,3034 <__adddf3+0x6ac>
    2b1c:	fff68593          	addi	a1,a3,-1 # 7fffff <_memory_end+0x7dffff>
    2b20:	ee0584e3          	beqz	a1,2a08 <__adddf3+0x80>
    2b24:	7ff00813          	li	a6,2047
    2b28:	03069263          	bne	a3,a6,2b4c <__adddf3+0x1c4>
    2b2c:	00070793          	mv	a5,a4
    2b30:	00060513          	mv	a0,a2
    2b34:	ef9ff06f          	j	2a2c <__adddf3+0xa4>
    2b38:	7ff00593          	li	a1,2047
    2b3c:	feb888e3          	beq	a7,a1,2b2c <__adddf3+0x1a4>
    2b40:	008005b7          	lui	a1,0x800
    2b44:	00b7e7b3          	or	a5,a5,a1
    2b48:	00068593          	mv	a1,a3
    2b4c:	03800693          	li	a3,56
    2b50:	08b6c063          	blt	a3,a1,2bd0 <__adddf3+0x248>
    2b54:	01f00693          	li	a3,31
    2b58:	04b6c263          	blt	a3,a1,2b9c <__adddf3+0x214>
    2b5c:	02000813          	li	a6,32
    2b60:	40b80833          	sub	a6,a6,a1
    2b64:	010796b3          	sll	a3,a5,a6
    2b68:	00b55333          	srl	t1,a0,a1
    2b6c:	01051833          	sll	a6,a0,a6
    2b70:	0066e6b3          	or	a3,a3,t1
    2b74:	01003833          	snez	a6,a6
    2b78:	0106e6b3          	or	a3,a3,a6
    2b7c:	00b7d5b3          	srl	a1,a5,a1
    2b80:	00c68633          	add	a2,a3,a2
    2b84:	00e585b3          	add	a1,a1,a4
    2b88:	00d636b3          	sltu	a3,a2,a3
    2b8c:	00060513          	mv	a0,a2
    2b90:	00d587b3          	add	a5,a1,a3
    2b94:	00088493          	mv	s1,a7
    2b98:	ef5ff06f          	j	2a8c <__adddf3+0x104>
    2b9c:	fe058693          	addi	a3,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    2ba0:	02000313          	li	t1,32
    2ba4:	00d7d6b3          	srl	a3,a5,a3
    2ba8:	00000813          	li	a6,0
    2bac:	00658863          	beq	a1,t1,2bbc <__adddf3+0x234>
    2bb0:	04000813          	li	a6,64
    2bb4:	40b80833          	sub	a6,a6,a1
    2bb8:	01079833          	sll	a6,a5,a6
    2bbc:	00a86833          	or	a6,a6,a0
    2bc0:	01003833          	snez	a6,a6
    2bc4:	0106e6b3          	or	a3,a3,a6
    2bc8:	00000593          	li	a1,0
    2bcc:	fb5ff06f          	j	2b80 <__adddf3+0x1f8>
    2bd0:	00a7e6b3          	or	a3,a5,a0
    2bd4:	00d036b3          	snez	a3,a3
    2bd8:	ff1ff06f          	j	2bc8 <__adddf3+0x240>
    2bdc:	00148693          	addi	a3,s1,1
    2be0:	7fe6f593          	andi	a1,a3,2046
    2be4:	08059663          	bnez	a1,2c70 <__adddf3+0x2e8>
    2be8:	00a7e6b3          	or	a3,a5,a0
    2bec:	06049263          	bnez	s1,2c50 <__adddf3+0x2c8>
    2bf0:	44068863          	beqz	a3,3040 <__adddf3+0x6b8>
    2bf4:	00c766b3          	or	a3,a4,a2
    2bf8:	02068863          	beqz	a3,2c28 <__adddf3+0x2a0>
    2bfc:	00c50633          	add	a2,a0,a2
    2c00:	00a636b3          	sltu	a3,a2,a0
    2c04:	00e78733          	add	a4,a5,a4
    2c08:	00d707b3          	add	a5,a4,a3
    2c0c:	00879713          	slli	a4,a5,0x8
    2c10:	00060513          	mv	a0,a2
    2c14:	00075a63          	bgez	a4,2c28 <__adddf3+0x2a0>
    2c18:	ff800737          	lui	a4,0xff800
    2c1c:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    2c20:	00e7f7b3          	and	a5,a5,a4
    2c24:	00100493          	li	s1,1
    2c28:	00757713          	andi	a4,a0,7
    2c2c:	44070863          	beqz	a4,307c <__adddf3+0x6f4>
    2c30:	00f57713          	andi	a4,a0,15
    2c34:	00400693          	li	a3,4
    2c38:	44d70263          	beq	a4,a3,307c <__adddf3+0x6f4>
    2c3c:	00450713          	addi	a4,a0,4 # 90050004 <_memory_end+0x90030004>
    2c40:	00a736b3          	sltu	a3,a4,a0
    2c44:	00d787b3          	add	a5,a5,a3
    2c48:	00070513          	mv	a0,a4
    2c4c:	4300006f          	j	307c <__adddf3+0x6f4>
    2c50:	ec068ee3          	beqz	a3,2b2c <__adddf3+0x1a4>
    2c54:	00c76633          	or	a2,a4,a2
    2c58:	dc060ae3          	beqz	a2,2a2c <__adddf3+0xa4>
    2c5c:	00000913          	li	s2,0
    2c60:	004007b7          	lui	a5,0x400
    2c64:	00000513          	li	a0,0
    2c68:	7ff00493          	li	s1,2047
    2c6c:	4100006f          	j	307c <__adddf3+0x6f4>
    2c70:	7ff00593          	li	a1,2047
    2c74:	3cb68c63          	beq	a3,a1,304c <__adddf3+0x6c4>
    2c78:	00c50633          	add	a2,a0,a2
    2c7c:	00a63533          	sltu	a0,a2,a0
    2c80:	00e78733          	add	a4,a5,a4
    2c84:	00a70733          	add	a4,a4,a0
    2c88:	01f71513          	slli	a0,a4,0x1f
    2c8c:	00165613          	srli	a2,a2,0x1
    2c90:	00c56533          	or	a0,a0,a2
    2c94:	00175793          	srli	a5,a4,0x1
    2c98:	00068493          	mv	s1,a3
    2c9c:	f8dff06f          	j	2c28 <__adddf3+0x2a0>
    2ca0:	0f005c63          	blez	a6,2d98 <__adddf3+0x410>
    2ca4:	08089e63          	bnez	a7,2d40 <__adddf3+0x3b8>
    2ca8:	00c766b3          	or	a3,a4,a2
    2cac:	3a068863          	beqz	a3,305c <__adddf3+0x6d4>
    2cb0:	fff80693          	addi	a3,a6,-1
    2cb4:	02069063          	bnez	a3,2cd4 <__adddf3+0x34c>
    2cb8:	40c50633          	sub	a2,a0,a2
    2cbc:	00c536b3          	sltu	a3,a0,a2
    2cc0:	40e78733          	sub	a4,a5,a4
    2cc4:	00060513          	mv	a0,a2
    2cc8:	40d707b3          	sub	a5,a4,a3
    2ccc:	00100493          	li	s1,1
    2cd0:	0540006f          	j	2d24 <__adddf3+0x39c>
    2cd4:	7ff00593          	li	a1,2047
    2cd8:	d4b80ae3          	beq	a6,a1,2a2c <__adddf3+0xa4>
    2cdc:	03800593          	li	a1,56
    2ce0:	0ad5c663          	blt	a1,a3,2d8c <__adddf3+0x404>
    2ce4:	01f00593          	li	a1,31
    2ce8:	06d5c863          	blt	a1,a3,2d58 <__adddf3+0x3d0>
    2cec:	02000813          	li	a6,32
    2cf0:	40d80833          	sub	a6,a6,a3
    2cf4:	00d658b3          	srl	a7,a2,a3
    2cf8:	010715b3          	sll	a1,a4,a6
    2cfc:	01061833          	sll	a6,a2,a6
    2d00:	0115e5b3          	or	a1,a1,a7
    2d04:	01003833          	snez	a6,a6
    2d08:	0105e633          	or	a2,a1,a6
    2d0c:	00d756b3          	srl	a3,a4,a3
    2d10:	40c50633          	sub	a2,a0,a2
    2d14:	00c53733          	sltu	a4,a0,a2
    2d18:	40d786b3          	sub	a3,a5,a3
    2d1c:	00060513          	mv	a0,a2
    2d20:	40e687b3          	sub	a5,a3,a4
    2d24:	00879713          	slli	a4,a5,0x8
    2d28:	f00750e3          	bgez	a4,2c28 <__adddf3+0x2a0>
    2d2c:	00800437          	lui	s0,0x800
    2d30:	fff40413          	addi	s0,s0,-1 # 7fffff <_memory_end+0x7dffff>
    2d34:	0087f433          	and	s0,a5,s0
    2d38:	00050993          	mv	s3,a0
    2d3c:	2100006f          	j	2f4c <__adddf3+0x5c4>
    2d40:	7ff00693          	li	a3,2047
    2d44:	eed482e3          	beq	s1,a3,2c28 <__adddf3+0x2a0>
    2d48:	008006b7          	lui	a3,0x800
    2d4c:	00d76733          	or	a4,a4,a3
    2d50:	00080693          	mv	a3,a6
    2d54:	f89ff06f          	j	2cdc <__adddf3+0x354>
    2d58:	fe068593          	addi	a1,a3,-32 # 7fffe0 <_memory_end+0x7dffe0>
    2d5c:	02000893          	li	a7,32
    2d60:	00b755b3          	srl	a1,a4,a1
    2d64:	00000813          	li	a6,0
    2d68:	01168863          	beq	a3,a7,2d78 <__adddf3+0x3f0>
    2d6c:	04000813          	li	a6,64
    2d70:	40d80833          	sub	a6,a6,a3
    2d74:	01071833          	sll	a6,a4,a6
    2d78:	00c86833          	or	a6,a6,a2
    2d7c:	01003833          	snez	a6,a6
    2d80:	0105e633          	or	a2,a1,a6
    2d84:	00000693          	li	a3,0
    2d88:	f89ff06f          	j	2d10 <__adddf3+0x388>
    2d8c:	00c76633          	or	a2,a4,a2
    2d90:	00c03633          	snez	a2,a2
    2d94:	ff1ff06f          	j	2d84 <__adddf3+0x3fc>
    2d98:	0e080863          	beqz	a6,2e88 <__adddf3+0x500>
    2d9c:	40988833          	sub	a6,a7,s1
    2da0:	04049263          	bnez	s1,2de4 <__adddf3+0x45c>
    2da4:	00a7e5b3          	or	a1,a5,a0
    2da8:	2a058e63          	beqz	a1,3064 <__adddf3+0x6dc>
    2dac:	fff80593          	addi	a1,a6,-1
    2db0:	00059e63          	bnez	a1,2dcc <__adddf3+0x444>
    2db4:	40a60533          	sub	a0,a2,a0
    2db8:	40f70733          	sub	a4,a4,a5
    2dbc:	00a63633          	sltu	a2,a2,a0
    2dc0:	40c707b3          	sub	a5,a4,a2
    2dc4:	00068913          	mv	s2,a3
    2dc8:	f05ff06f          	j	2ccc <__adddf3+0x344>
    2dcc:	7ff00313          	li	t1,2047
    2dd0:	02681463          	bne	a6,t1,2df8 <__adddf3+0x470>
    2dd4:	00070793          	mv	a5,a4
    2dd8:	00060513          	mv	a0,a2
    2ddc:	7ff00493          	li	s1,2047
    2de0:	0d00006f          	j	2eb0 <__adddf3+0x528>
    2de4:	7ff00593          	li	a1,2047
    2de8:	feb886e3          	beq	a7,a1,2dd4 <__adddf3+0x44c>
    2dec:	008005b7          	lui	a1,0x800
    2df0:	00b7e7b3          	or	a5,a5,a1
    2df4:	00080593          	mv	a1,a6
    2df8:	03800813          	li	a6,56
    2dfc:	08b84063          	blt	a6,a1,2e7c <__adddf3+0x4f4>
    2e00:	01f00813          	li	a6,31
    2e04:	04b84263          	blt	a6,a1,2e48 <__adddf3+0x4c0>
    2e08:	02000313          	li	t1,32
    2e0c:	40b30333          	sub	t1,t1,a1
    2e10:	00b55e33          	srl	t3,a0,a1
    2e14:	00679833          	sll	a6,a5,t1
    2e18:	00651333          	sll	t1,a0,t1
    2e1c:	01c86833          	or	a6,a6,t3
    2e20:	00603333          	snez	t1,t1
    2e24:	00686533          	or	a0,a6,t1
    2e28:	00b7d5b3          	srl	a1,a5,a1
    2e2c:	40a60533          	sub	a0,a2,a0
    2e30:	40b705b3          	sub	a1,a4,a1
    2e34:	00a63633          	sltu	a2,a2,a0
    2e38:	40c587b3          	sub	a5,a1,a2
    2e3c:	00088493          	mv	s1,a7
    2e40:	00068913          	mv	s2,a3
    2e44:	ee1ff06f          	j	2d24 <__adddf3+0x39c>
    2e48:	fe058813          	addi	a6,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    2e4c:	02000e13          	li	t3,32
    2e50:	0107d833          	srl	a6,a5,a6
    2e54:	00000313          	li	t1,0
    2e58:	01c58863          	beq	a1,t3,2e68 <__adddf3+0x4e0>
    2e5c:	04000313          	li	t1,64
    2e60:	40b30333          	sub	t1,t1,a1
    2e64:	00679333          	sll	t1,a5,t1
    2e68:	00a36333          	or	t1,t1,a0
    2e6c:	00603333          	snez	t1,t1
    2e70:	00686533          	or	a0,a6,t1
    2e74:	00000593          	li	a1,0
    2e78:	fb5ff06f          	j	2e2c <__adddf3+0x4a4>
    2e7c:	00a7e533          	or	a0,a5,a0
    2e80:	00a03533          	snez	a0,a0
    2e84:	ff1ff06f          	j	2e74 <__adddf3+0x4ec>
    2e88:	00148593          	addi	a1,s1,1
    2e8c:	7fe5f593          	andi	a1,a1,2046
    2e90:	08059663          	bnez	a1,2f1c <__adddf3+0x594>
    2e94:	00a7e833          	or	a6,a5,a0
    2e98:	00c765b3          	or	a1,a4,a2
    2e9c:	06049063          	bnez	s1,2efc <__adddf3+0x574>
    2ea0:	00081c63          	bnez	a6,2eb8 <__adddf3+0x530>
    2ea4:	10058e63          	beqz	a1,2fc0 <__adddf3+0x638>
    2ea8:	00070793          	mv	a5,a4
    2eac:	00060513          	mv	a0,a2
    2eb0:	00068913          	mv	s2,a3
    2eb4:	d75ff06f          	j	2c28 <__adddf3+0x2a0>
    2eb8:	d60588e3          	beqz	a1,2c28 <__adddf3+0x2a0>
    2ebc:	40c50833          	sub	a6,a0,a2
    2ec0:	010538b3          	sltu	a7,a0,a6
    2ec4:	40e785b3          	sub	a1,a5,a4
    2ec8:	411585b3          	sub	a1,a1,a7
    2ecc:	00859893          	slli	a7,a1,0x8
    2ed0:	0008dc63          	bgez	a7,2ee8 <__adddf3+0x560>
    2ed4:	40a60533          	sub	a0,a2,a0
    2ed8:	40f70733          	sub	a4,a4,a5
    2edc:	00a63633          	sltu	a2,a2,a0
    2ee0:	40c707b3          	sub	a5,a4,a2
    2ee4:	fcdff06f          	j	2eb0 <__adddf3+0x528>
    2ee8:	00b86533          	or	a0,a6,a1
    2eec:	18050463          	beqz	a0,3074 <__adddf3+0x6ec>
    2ef0:	00058793          	mv	a5,a1
    2ef4:	00080513          	mv	a0,a6
    2ef8:	d31ff06f          	j	2c28 <__adddf3+0x2a0>
    2efc:	00081c63          	bnez	a6,2f14 <__adddf3+0x58c>
    2f00:	d4058ee3          	beqz	a1,2c5c <__adddf3+0x2d4>
    2f04:	00070793          	mv	a5,a4
    2f08:	00060513          	mv	a0,a2
    2f0c:	00068913          	mv	s2,a3
    2f10:	b1dff06f          	j	2a2c <__adddf3+0xa4>
    2f14:	b0058ce3          	beqz	a1,2a2c <__adddf3+0xa4>
    2f18:	d45ff06f          	j	2c5c <__adddf3+0x2d4>
    2f1c:	40c505b3          	sub	a1,a0,a2
    2f20:	00b53833          	sltu	a6,a0,a1
    2f24:	40e78433          	sub	s0,a5,a4
    2f28:	41040433          	sub	s0,s0,a6
    2f2c:	00841813          	slli	a6,s0,0x8
    2f30:	00058993          	mv	s3,a1
    2f34:	08085063          	bgez	a6,2fb4 <__adddf3+0x62c>
    2f38:	40a609b3          	sub	s3,a2,a0
    2f3c:	40f70433          	sub	s0,a4,a5
    2f40:	01363633          	sltu	a2,a2,s3
    2f44:	40c40433          	sub	s0,s0,a2
    2f48:	00068913          	mv	s2,a3
    2f4c:	06040e63          	beqz	s0,2fc8 <__adddf3+0x640>
    2f50:	00040513          	mv	a0,s0
    2f54:	724010ef          	jal	4678 <__clzsi2>
    2f58:	ff850693          	addi	a3,a0,-8
    2f5c:	02000793          	li	a5,32
    2f60:	40d787b3          	sub	a5,a5,a3
    2f64:	00d41433          	sll	s0,s0,a3
    2f68:	00f9d7b3          	srl	a5,s3,a5
    2f6c:	0087e7b3          	or	a5,a5,s0
    2f70:	00d99433          	sll	s0,s3,a3
    2f74:	0a96c463          	blt	a3,s1,301c <__adddf3+0x694>
    2f78:	409686b3          	sub	a3,a3,s1
    2f7c:	00168613          	addi	a2,a3,1
    2f80:	01f00713          	li	a4,31
    2f84:	06c74263          	blt	a4,a2,2fe8 <__adddf3+0x660>
    2f88:	02000713          	li	a4,32
    2f8c:	40c70733          	sub	a4,a4,a2
    2f90:	00e79533          	sll	a0,a5,a4
    2f94:	00c456b3          	srl	a3,s0,a2
    2f98:	00e41733          	sll	a4,s0,a4
    2f9c:	00d56533          	or	a0,a0,a3
    2fa0:	00e03733          	snez	a4,a4
    2fa4:	00e56533          	or	a0,a0,a4
    2fa8:	00c7d7b3          	srl	a5,a5,a2
    2fac:	00000493          	li	s1,0
    2fb0:	c79ff06f          	j	2c28 <__adddf3+0x2a0>
    2fb4:	0085e5b3          	or	a1,a1,s0
    2fb8:	f8059ae3          	bnez	a1,2f4c <__adddf3+0x5c4>
    2fbc:	00000493          	li	s1,0
    2fc0:	00000913          	li	s2,0
    2fc4:	08c0006f          	j	3050 <__adddf3+0x6c8>
    2fc8:	00098513          	mv	a0,s3
    2fcc:	6ac010ef          	jal	4678 <__clzsi2>
    2fd0:	01850693          	addi	a3,a0,24
    2fd4:	01f00793          	li	a5,31
    2fd8:	f8d7d2e3          	bge	a5,a3,2f5c <__adddf3+0x5d4>
    2fdc:	ff850793          	addi	a5,a0,-8
    2fe0:	00f997b3          	sll	a5,s3,a5
    2fe4:	f91ff06f          	j	2f74 <__adddf3+0x5ec>
    2fe8:	fe168693          	addi	a3,a3,-31
    2fec:	00d7d533          	srl	a0,a5,a3
    2ff0:	02000693          	li	a3,32
    2ff4:	00000713          	li	a4,0
    2ff8:	00d60863          	beq	a2,a3,3008 <__adddf3+0x680>
    2ffc:	04000713          	li	a4,64
    3000:	40c70733          	sub	a4,a4,a2
    3004:	00e79733          	sll	a4,a5,a4
    3008:	00e46733          	or	a4,s0,a4
    300c:	00e03733          	snez	a4,a4
    3010:	00e56533          	or	a0,a0,a4
    3014:	00000793          	li	a5,0
    3018:	f95ff06f          	j	2fac <__adddf3+0x624>
    301c:	ff800737          	lui	a4,0xff800
    3020:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    3024:	40d484b3          	sub	s1,s1,a3
    3028:	00e7f7b3          	and	a5,a5,a4
    302c:	00040513          	mv	a0,s0
    3030:	bf9ff06f          	j	2c28 <__adddf3+0x2a0>
    3034:	00070793          	mv	a5,a4
    3038:	00060513          	mv	a0,a2
    303c:	c5dff06f          	j	2c98 <__adddf3+0x310>
    3040:	00070793          	mv	a5,a4
    3044:	00060513          	mv	a0,a2
    3048:	be1ff06f          	j	2c28 <__adddf3+0x2a0>
    304c:	7ff00493          	li	s1,2047
    3050:	00000793          	li	a5,0
    3054:	00000513          	li	a0,0
    3058:	0240006f          	j	307c <__adddf3+0x6f4>
    305c:	00080493          	mv	s1,a6
    3060:	bc9ff06f          	j	2c28 <__adddf3+0x2a0>
    3064:	00070793          	mv	a5,a4
    3068:	00060513          	mv	a0,a2
    306c:	00080493          	mv	s1,a6
    3070:	e41ff06f          	j	2eb0 <__adddf3+0x528>
    3074:	00000793          	li	a5,0
    3078:	00000913          	li	s2,0
    307c:	00879713          	slli	a4,a5,0x8
    3080:	00075e63          	bgez	a4,309c <__adddf3+0x714>
    3084:	00148493          	addi	s1,s1,1
    3088:	7ff00713          	li	a4,2047
    308c:	08e48263          	beq	s1,a4,3110 <__adddf3+0x788>
    3090:	ff800737          	lui	a4,0xff800
    3094:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    3098:	00e7f7b3          	and	a5,a5,a4
    309c:	01d79693          	slli	a3,a5,0x1d
    30a0:	00355513          	srli	a0,a0,0x3
    30a4:	7ff00713          	li	a4,2047
    30a8:	00a6e6b3          	or	a3,a3,a0
    30ac:	0037d793          	srli	a5,a5,0x3
    30b0:	00e49e63          	bne	s1,a4,30cc <__adddf3+0x744>
    30b4:	00f6e6b3          	or	a3,a3,a5
    30b8:	00000793          	li	a5,0
    30bc:	00068863          	beqz	a3,30cc <__adddf3+0x744>
    30c0:	000807b7          	lui	a5,0x80
    30c4:	00000693          	li	a3,0
    30c8:	00000913          	li	s2,0
    30cc:	01449713          	slli	a4,s1,0x14
    30d0:	7ff00637          	lui	a2,0x7ff00
    30d4:	00c79793          	slli	a5,a5,0xc
    30d8:	00c77733          	and	a4,a4,a2
    30dc:	01c12083          	lw	ra,28(sp)
    30e0:	01812403          	lw	s0,24(sp)
    30e4:	00c7d793          	srli	a5,a5,0xc
    30e8:	00f767b3          	or	a5,a4,a5
    30ec:	01f91713          	slli	a4,s2,0x1f
    30f0:	00e7e633          	or	a2,a5,a4
    30f4:	01412483          	lw	s1,20(sp)
    30f8:	01012903          	lw	s2,16(sp)
    30fc:	00c12983          	lw	s3,12(sp)
    3100:	00068513          	mv	a0,a3
    3104:	00060593          	mv	a1,a2
    3108:	02010113          	addi	sp,sp,32
    310c:	00008067          	ret
    3110:	00000793          	li	a5,0
    3114:	00000513          	li	a0,0
    3118:	f85ff06f          	j	309c <__adddf3+0x714>

0000311c <__divdf3>:
    311c:	fd010113          	addi	sp,sp,-48
    3120:	0145d813          	srli	a6,a1,0x14
    3124:	02912223          	sw	s1,36(sp)
    3128:	03212023          	sw	s2,32(sp)
    312c:	01312e23          	sw	s3,28(sp)
    3130:	01612823          	sw	s6,16(sp)
    3134:	01712623          	sw	s7,12(sp)
    3138:	00c59493          	slli	s1,a1,0xc
    313c:	02112623          	sw	ra,44(sp)
    3140:	02812423          	sw	s0,40(sp)
    3144:	01412c23          	sw	s4,24(sp)
    3148:	01512a23          	sw	s5,20(sp)
    314c:	7ff87813          	andi	a6,a6,2047
    3150:	00050b13          	mv	s6,a0
    3154:	00060b93          	mv	s7,a2
    3158:	00068913          	mv	s2,a3
    315c:	00c4d493          	srli	s1,s1,0xc
    3160:	01f5d993          	srli	s3,a1,0x1f
    3164:	08080e63          	beqz	a6,3200 <__divdf3+0xe4>
    3168:	7ff00793          	li	a5,2047
    316c:	0ef80e63          	beq	a6,a5,3268 <__divdf3+0x14c>
    3170:	01d55a13          	srli	s4,a0,0x1d
    3174:	00349493          	slli	s1,s1,0x3
    3178:	009a6a33          	or	s4,s4,s1
    317c:	008007b7          	lui	a5,0x800
    3180:	00fa6a33          	or	s4,s4,a5
    3184:	00351413          	slli	s0,a0,0x3
    3188:	c0180a93          	addi	s5,a6,-1023
    318c:	00000b13          	li	s6,0
    3190:	01495713          	srli	a4,s2,0x14
    3194:	00c91493          	slli	s1,s2,0xc
    3198:	7ff77713          	andi	a4,a4,2047
    319c:	00c4d493          	srli	s1,s1,0xc
    31a0:	01f95913          	srli	s2,s2,0x1f
    31a4:	10070063          	beqz	a4,32a4 <__divdf3+0x188>
    31a8:	7ff00793          	li	a5,2047
    31ac:	16f70463          	beq	a4,a5,3314 <__divdf3+0x1f8>
    31b0:	00349493          	slli	s1,s1,0x3
    31b4:	01dbd793          	srli	a5,s7,0x1d
    31b8:	0097e7b3          	or	a5,a5,s1
    31bc:	008004b7          	lui	s1,0x800
    31c0:	0097e4b3          	or	s1,a5,s1
    31c4:	003b9f13          	slli	t5,s7,0x3
    31c8:	c0170713          	addi	a4,a4,-1023
    31cc:	00000793          	li	a5,0
    31d0:	40ea8833          	sub	a6,s5,a4
    31d4:	002b1713          	slli	a4,s6,0x2
    31d8:	00f76733          	or	a4,a4,a5
    31dc:	fff70713          	addi	a4,a4,-1
    31e0:	00e00693          	li	a3,14
    31e4:	0129c633          	xor	a2,s3,s2
    31e8:	16e6e263          	bltu	a3,a4,334c <__divdf3+0x230>
    31ec:	00271713          	slli	a4,a4,0x2
    31f0:	39818693          	addi	a3,gp,920 # 4a58 <__FUNCTION__.0+0x2c>
    31f4:	00d70733          	add	a4,a4,a3
    31f8:	00072703          	lw	a4,0(a4)
    31fc:	00070067          	jr	a4
    3200:	00a4ea33          	or	s4,s1,a0
    3204:	060a0e63          	beqz	s4,3280 <__divdf3+0x164>
    3208:	02048e63          	beqz	s1,3244 <__divdf3+0x128>
    320c:	00048513          	mv	a0,s1
    3210:	468010ef          	jal	4678 <__clzsi2>
    3214:	ff550793          	addi	a5,a0,-11
    3218:	01d00a13          	li	s4,29
    321c:	ff850713          	addi	a4,a0,-8
    3220:	40fa0a33          	sub	s4,s4,a5
    3224:	00e494b3          	sll	s1,s1,a4
    3228:	014b5a33          	srl	s4,s6,s4
    322c:	009a6a33          	or	s4,s4,s1
    3230:	00eb14b3          	sll	s1,s6,a4
    3234:	c0d00813          	li	a6,-1011
    3238:	40a80ab3          	sub	s5,a6,a0
    323c:	00048413          	mv	s0,s1
    3240:	f4dff06f          	j	318c <__divdf3+0x70>
    3244:	434010ef          	jal	4678 <__clzsi2>
    3248:	00050a13          	mv	s4,a0
    324c:	015a0793          	addi	a5,s4,21
    3250:	01c00713          	li	a4,28
    3254:	02050513          	addi	a0,a0,32
    3258:	fcf750e3          	bge	a4,a5,3218 <__divdf3+0xfc>
    325c:	ff8a0a13          	addi	s4,s4,-8
    3260:	014b1a33          	sll	s4,s6,s4
    3264:	fd1ff06f          	j	3234 <__divdf3+0x118>
    3268:	00a4ea33          	or	s4,s1,a0
    326c:	020a1263          	bnez	s4,3290 <__divdf3+0x174>
    3270:	00000413          	li	s0,0
    3274:	7ff00a93          	li	s5,2047
    3278:	00200b13          	li	s6,2
    327c:	f15ff06f          	j	3190 <__divdf3+0x74>
    3280:	00000413          	li	s0,0
    3284:	00000a93          	li	s5,0
    3288:	00100b13          	li	s6,1
    328c:	f05ff06f          	j	3190 <__divdf3+0x74>
    3290:	00050413          	mv	s0,a0
    3294:	00048a13          	mv	s4,s1
    3298:	7ff00a93          	li	s5,2047
    329c:	00300b13          	li	s6,3
    32a0:	ef1ff06f          	j	3190 <__divdf3+0x74>
    32a4:	0174ef33          	or	t5,s1,s7
    32a8:	080f0263          	beqz	t5,332c <__divdf3+0x210>
    32ac:	04048063          	beqz	s1,32ec <__divdf3+0x1d0>
    32b0:	00048513          	mv	a0,s1
    32b4:	3c4010ef          	jal	4678 <__clzsi2>
    32b8:	ff550713          	addi	a4,a0,-11
    32bc:	01d00793          	li	a5,29
    32c0:	ff850693          	addi	a3,a0,-8
    32c4:	40e787b3          	sub	a5,a5,a4
    32c8:	00d494b3          	sll	s1,s1,a3
    32cc:	00fbd7b3          	srl	a5,s7,a5
    32d0:	0097e7b3          	or	a5,a5,s1
    32d4:	00db94b3          	sll	s1,s7,a3
    32d8:	c0d00713          	li	a4,-1011
    32dc:	00048f13          	mv	t5,s1
    32e0:	40a70733          	sub	a4,a4,a0
    32e4:	00078493          	mv	s1,a5
    32e8:	ee5ff06f          	j	31cc <__divdf3+0xb0>
    32ec:	000b8513          	mv	a0,s7
    32f0:	388010ef          	jal	4678 <__clzsi2>
    32f4:	00050793          	mv	a5,a0
    32f8:	01578713          	addi	a4,a5,21 # 800015 <_memory_end+0x7e0015>
    32fc:	01c00693          	li	a3,28
    3300:	02050513          	addi	a0,a0,32
    3304:	fae6dce3          	bge	a3,a4,32bc <__divdf3+0x1a0>
    3308:	ff878793          	addi	a5,a5,-8
    330c:	00fb97b3          	sll	a5,s7,a5
    3310:	fc9ff06f          	j	32d8 <__divdf3+0x1bc>
    3314:	0174ef33          	or	t5,s1,s7
    3318:	020f1263          	bnez	t5,333c <__divdf3+0x220>
    331c:	00000493          	li	s1,0
    3320:	7ff00713          	li	a4,2047
    3324:	00200793          	li	a5,2
    3328:	ea9ff06f          	j	31d0 <__divdf3+0xb4>
    332c:	00000493          	li	s1,0
    3330:	00000713          	li	a4,0
    3334:	00100793          	li	a5,1
    3338:	e99ff06f          	j	31d0 <__divdf3+0xb4>
    333c:	000b8f13          	mv	t5,s7
    3340:	7ff00713          	li	a4,2047
    3344:	00300793          	li	a5,3
    3348:	e89ff06f          	j	31d0 <__divdf3+0xb4>
    334c:	0144e663          	bltu	s1,s4,3358 <__divdf3+0x23c>
    3350:	349a1c63          	bne	s4,s1,36a8 <__divdf3+0x58c>
    3354:	35e46a63          	bltu	s0,t5,36a8 <__divdf3+0x58c>
    3358:	01fa1693          	slli	a3,s4,0x1f
    335c:	00145793          	srli	a5,s0,0x1
    3360:	01f41713          	slli	a4,s0,0x1f
    3364:	001a5a13          	srli	s4,s4,0x1
    3368:	00f6e433          	or	s0,a3,a5
    336c:	00849893          	slli	a7,s1,0x8
    3370:	018f5593          	srli	a1,t5,0x18
    3374:	0115e5b3          	or	a1,a1,a7
    3378:	0108d893          	srli	a7,a7,0x10
    337c:	031a5eb3          	divu	t4,s4,a7
    3380:	01059313          	slli	t1,a1,0x10
    3384:	01035313          	srli	t1,t1,0x10
    3388:	01045793          	srli	a5,s0,0x10
    338c:	008f1513          	slli	a0,t5,0x8
    3390:	031a7a33          	remu	s4,s4,a7
    3394:	000e8693          	mv	a3,t4
    3398:	03d30e33          	mul	t3,t1,t4
    339c:	010a1a13          	slli	s4,s4,0x10
    33a0:	0147e7b3          	or	a5,a5,s4
    33a4:	01c7fe63          	bgeu	a5,t3,33c0 <__divdf3+0x2a4>
    33a8:	00f587b3          	add	a5,a1,a5
    33ac:	fffe8693          	addi	a3,t4,-1
    33b0:	00b7e863          	bltu	a5,a1,33c0 <__divdf3+0x2a4>
    33b4:	01c7f663          	bgeu	a5,t3,33c0 <__divdf3+0x2a4>
    33b8:	ffee8693          	addi	a3,t4,-2
    33bc:	00b787b3          	add	a5,a5,a1
    33c0:	41c787b3          	sub	a5,a5,t3
    33c4:	0317df33          	divu	t5,a5,a7
    33c8:	01041413          	slli	s0,s0,0x10
    33cc:	01045413          	srli	s0,s0,0x10
    33d0:	0317f7b3          	remu	a5,a5,a7
    33d4:	000f0e13          	mv	t3,t5
    33d8:	03e30eb3          	mul	t4,t1,t5
    33dc:	01079793          	slli	a5,a5,0x10
    33e0:	00f467b3          	or	a5,s0,a5
    33e4:	01d7fe63          	bgeu	a5,t4,3400 <__divdf3+0x2e4>
    33e8:	00f587b3          	add	a5,a1,a5
    33ec:	ffff0e13          	addi	t3,t5,-1
    33f0:	00b7e863          	bltu	a5,a1,3400 <__divdf3+0x2e4>
    33f4:	01d7f663          	bgeu	a5,t4,3400 <__divdf3+0x2e4>
    33f8:	ffef0e13          	addi	t3,t5,-2
    33fc:	00b787b3          	add	a5,a5,a1
    3400:	01069693          	slli	a3,a3,0x10
    3404:	00010437          	lui	s0,0x10
    3408:	01c6e2b3          	or	t0,a3,t3
    340c:	fff40e13          	addi	t3,s0,-1 # ffff <_bss_end+0xb3fb>
    3410:	01c2f6b3          	and	a3,t0,t3
    3414:	0102df93          	srli	t6,t0,0x10
    3418:	01c57e33          	and	t3,a0,t3
    341c:	41d787b3          	sub	a5,a5,t4
    3420:	01055e93          	srli	t4,a0,0x10
    3424:	02de03b3          	mul	t2,t3,a3
    3428:	03cf84b3          	mul	s1,t6,t3
    342c:	02de86b3          	mul	a3,t4,a3
    3430:	00968f33          	add	t5,a3,s1
    3434:	0103d693          	srli	a3,t2,0x10
    3438:	01e686b3          	add	a3,a3,t5
    343c:	03df8fb3          	mul	t6,t6,t4
    3440:	0096f463          	bgeu	a3,s1,3448 <__divdf3+0x32c>
    3444:	008f8fb3          	add	t6,t6,s0
    3448:	0106df13          	srli	t5,a3,0x10
    344c:	01ff0f33          	add	t5,t5,t6
    3450:	00010fb7          	lui	t6,0x10
    3454:	ffff8f93          	addi	t6,t6,-1 # ffff <_bss_end+0xb3fb>
    3458:	01f6f6b3          	and	a3,a3,t6
    345c:	01069693          	slli	a3,a3,0x10
    3460:	01f3f3b3          	and	t2,t2,t6
    3464:	007686b3          	add	a3,a3,t2
    3468:	01e7e863          	bltu	a5,t5,3478 <__divdf3+0x35c>
    346c:	00028493          	mv	s1,t0
    3470:	05e79863          	bne	a5,t5,34c0 <__divdf3+0x3a4>
    3474:	04d77663          	bgeu	a4,a3,34c0 <__divdf3+0x3a4>
    3478:	00a70fb3          	add	t6,a4,a0
    347c:	00efb3b3          	sltu	t2,t6,a4
    3480:	00b38433          	add	s0,t2,a1
    3484:	008787b3          	add	a5,a5,s0
    3488:	fff28493          	addi	s1,t0,-1
    348c:	000f8713          	mv	a4,t6
    3490:	00f5e663          	bltu	a1,a5,349c <__divdf3+0x380>
    3494:	02f59663          	bne	a1,a5,34c0 <__divdf3+0x3a4>
    3498:	02039463          	bnez	t2,34c0 <__divdf3+0x3a4>
    349c:	01e7e663          	bltu	a5,t5,34a8 <__divdf3+0x38c>
    34a0:	02ff1063          	bne	t5,a5,34c0 <__divdf3+0x3a4>
    34a4:	00dffe63          	bgeu	t6,a3,34c0 <__divdf3+0x3a4>
    34a8:	01f50fb3          	add	t6,a0,t6
    34ac:	000f8713          	mv	a4,t6
    34b0:	00afbfb3          	sltu	t6,t6,a0
    34b4:	00bf8fb3          	add	t6,t6,a1
    34b8:	ffe28493          	addi	s1,t0,-2
    34bc:	01f787b3          	add	a5,a5,t6
    34c0:	40d706b3          	sub	a3,a4,a3
    34c4:	41e787b3          	sub	a5,a5,t5
    34c8:	00d73733          	sltu	a4,a4,a3
    34cc:	40e787b3          	sub	a5,a5,a4
    34d0:	fff00f13          	li	t5,-1
    34d4:	12f58663          	beq	a1,a5,3600 <__divdf3+0x4e4>
    34d8:	0317dfb3          	divu	t6,a5,a7
    34dc:	0106d713          	srli	a4,a3,0x10
    34e0:	0317f7b3          	remu	a5,a5,a7
    34e4:	03f30f33          	mul	t5,t1,t6
    34e8:	01079793          	slli	a5,a5,0x10
    34ec:	00f767b3          	or	a5,a4,a5
    34f0:	000f8713          	mv	a4,t6
    34f4:	01e7fe63          	bgeu	a5,t5,3510 <__divdf3+0x3f4>
    34f8:	00f587b3          	add	a5,a1,a5
    34fc:	ffff8713          	addi	a4,t6,-1
    3500:	00b7e863          	bltu	a5,a1,3510 <__divdf3+0x3f4>
    3504:	01e7f663          	bgeu	a5,t5,3510 <__divdf3+0x3f4>
    3508:	ffef8713          	addi	a4,t6,-2
    350c:	00b787b3          	add	a5,a5,a1
    3510:	41e787b3          	sub	a5,a5,t5
    3514:	0317df33          	divu	t5,a5,a7
    3518:	01069693          	slli	a3,a3,0x10
    351c:	0106d693          	srli	a3,a3,0x10
    3520:	0317f7b3          	remu	a5,a5,a7
    3524:	000f0893          	mv	a7,t5
    3528:	03e30333          	mul	t1,t1,t5
    352c:	01079793          	slli	a5,a5,0x10
    3530:	00f6e7b3          	or	a5,a3,a5
    3534:	0067fe63          	bgeu	a5,t1,3550 <__divdf3+0x434>
    3538:	00f587b3          	add	a5,a1,a5
    353c:	ffff0893          	addi	a7,t5,-1
    3540:	00b7e863          	bltu	a5,a1,3550 <__divdf3+0x434>
    3544:	0067f663          	bgeu	a5,t1,3550 <__divdf3+0x434>
    3548:	ffef0893          	addi	a7,t5,-2
    354c:	00b787b3          	add	a5,a5,a1
    3550:	01071693          	slli	a3,a4,0x10
    3554:	0116e6b3          	or	a3,a3,a7
    3558:	01069713          	slli	a4,a3,0x10
    355c:	01075713          	srli	a4,a4,0x10
    3560:	406787b3          	sub	a5,a5,t1
    3564:	0106d313          	srli	t1,a3,0x10
    3568:	03c70f33          	mul	t5,a4,t3
    356c:	03c30e33          	mul	t3,t1,t3
    3570:	026e8333          	mul	t1,t4,t1
    3574:	02ee8eb3          	mul	t4,t4,a4
    3578:	010f5713          	srli	a4,t5,0x10
    357c:	01ce8eb3          	add	t4,t4,t3
    3580:	01d70733          	add	a4,a4,t4
    3584:	01c77663          	bgeu	a4,t3,3590 <__divdf3+0x474>
    3588:	000108b7          	lui	a7,0x10
    358c:	01130333          	add	t1,t1,a7
    3590:	01075893          	srli	a7,a4,0x10
    3594:	006888b3          	add	a7,a7,t1
    3598:	00010337          	lui	t1,0x10
    359c:	fff30313          	addi	t1,t1,-1 # ffff <_bss_end+0xb3fb>
    35a0:	00677733          	and	a4,a4,t1
    35a4:	01071713          	slli	a4,a4,0x10
    35a8:	006f7f33          	and	t5,t5,t1
    35ac:	01e70733          	add	a4,a4,t5
    35b0:	0117e863          	bltu	a5,a7,35c0 <__divdf3+0x4a4>
    35b4:	23179c63          	bne	a5,a7,37ec <__divdf3+0x6d0>
    35b8:	00068f13          	mv	t5,a3
    35bc:	04070263          	beqz	a4,3600 <__divdf3+0x4e4>
    35c0:	00f587b3          	add	a5,a1,a5
    35c4:	fff68f13          	addi	t5,a3,-1
    35c8:	00078313          	mv	t1,a5
    35cc:	02b7e463          	bltu	a5,a1,35f4 <__divdf3+0x4d8>
    35d0:	0117e663          	bltu	a5,a7,35dc <__divdf3+0x4c0>
    35d4:	21179a63          	bne	a5,a7,37e8 <__divdf3+0x6cc>
    35d8:	02e57063          	bgeu	a0,a4,35f8 <__divdf3+0x4dc>
    35dc:	ffe68f13          	addi	t5,a3,-2
    35e0:	00151693          	slli	a3,a0,0x1
    35e4:	00a6b333          	sltu	t1,a3,a0
    35e8:	00b30333          	add	t1,t1,a1
    35ec:	00678333          	add	t1,a5,t1
    35f0:	00068513          	mv	a0,a3
    35f4:	01131463          	bne	t1,a7,35fc <__divdf3+0x4e0>
    35f8:	00a70463          	beq	a4,a0,3600 <__divdf3+0x4e4>
    35fc:	001f6f13          	ori	t5,t5,1
    3600:	3ff80713          	addi	a4,a6,1023
    3604:	10e05263          	blez	a4,3708 <__divdf3+0x5ec>
    3608:	007f7793          	andi	a5,t5,7
    360c:	02078063          	beqz	a5,362c <__divdf3+0x510>
    3610:	00ff7793          	andi	a5,t5,15
    3614:	00400693          	li	a3,4
    3618:	00d78a63          	beq	a5,a3,362c <__divdf3+0x510>
    361c:	004f0793          	addi	a5,t5,4
    3620:	01e7b6b3          	sltu	a3,a5,t5
    3624:	00d484b3          	add	s1,s1,a3
    3628:	00078f13          	mv	t5,a5
    362c:	00749793          	slli	a5,s1,0x7
    3630:	0007da63          	bgez	a5,3644 <__divdf3+0x528>
    3634:	ff0007b7          	lui	a5,0xff000
    3638:	fff78793          	addi	a5,a5,-1 # feffffff <_memory_end+0xfefdffff>
    363c:	00f4f4b3          	and	s1,s1,a5
    3640:	40080713          	addi	a4,a6,1024
    3644:	7fe00793          	li	a5,2046
    3648:	08e7ca63          	blt	a5,a4,36dc <__divdf3+0x5c0>
    364c:	003f5f13          	srli	t5,t5,0x3
    3650:	01d49793          	slli	a5,s1,0x1d
    3654:	01e7ef33          	or	t5,a5,t5
    3658:	0034d513          	srli	a0,s1,0x3
    365c:	00c51513          	slli	a0,a0,0xc
    3660:	02c12083          	lw	ra,44(sp)
    3664:	02812403          	lw	s0,40(sp)
    3668:	00c55513          	srli	a0,a0,0xc
    366c:	01471713          	slli	a4,a4,0x14
    3670:	00a76733          	or	a4,a4,a0
    3674:	01f61613          	slli	a2,a2,0x1f
    3678:	00c767b3          	or	a5,a4,a2
    367c:	02412483          	lw	s1,36(sp)
    3680:	02012903          	lw	s2,32(sp)
    3684:	01c12983          	lw	s3,28(sp)
    3688:	01812a03          	lw	s4,24(sp)
    368c:	01412a83          	lw	s5,20(sp)
    3690:	01012b03          	lw	s6,16(sp)
    3694:	00c12b83          	lw	s7,12(sp)
    3698:	000f0513          	mv	a0,t5
    369c:	00078593          	mv	a1,a5
    36a0:	03010113          	addi	sp,sp,48
    36a4:	00008067          	ret
    36a8:	fff80813          	addi	a6,a6,-1
    36ac:	00000713          	li	a4,0
    36b0:	cbdff06f          	j	336c <__divdf3+0x250>
    36b4:	00098613          	mv	a2,s3
    36b8:	000a0493          	mv	s1,s4
    36bc:	00040f13          	mv	t5,s0
    36c0:	000b0793          	mv	a5,s6
    36c4:	00300713          	li	a4,3
    36c8:	0ee78863          	beq	a5,a4,37b8 <__divdf3+0x69c>
    36cc:	00100713          	li	a4,1
    36d0:	0ee78e63          	beq	a5,a4,37cc <__divdf3+0x6b0>
    36d4:	00200713          	li	a4,2
    36d8:	f2e794e3          	bne	a5,a4,3600 <__divdf3+0x4e4>
    36dc:	00000513          	li	a0,0
    36e0:	00000f13          	li	t5,0
    36e4:	7ff00713          	li	a4,2047
    36e8:	f75ff06f          	j	365c <__divdf3+0x540>
    36ec:	00090613          	mv	a2,s2
    36f0:	fd5ff06f          	j	36c4 <__divdf3+0x5a8>
    36f4:	000804b7          	lui	s1,0x80
    36f8:	00000f13          	li	t5,0
    36fc:	00000613          	li	a2,0
    3700:	00300793          	li	a5,3
    3704:	fc1ff06f          	j	36c4 <__divdf3+0x5a8>
    3708:	00100513          	li	a0,1
    370c:	40e50533          	sub	a0,a0,a4
    3710:	03800793          	li	a5,56
    3714:	0aa7cc63          	blt	a5,a0,37cc <__divdf3+0x6b0>
    3718:	01f00793          	li	a5,31
    371c:	06a7c463          	blt	a5,a0,3784 <__divdf3+0x668>
    3720:	41e80813          	addi	a6,a6,1054
    3724:	010497b3          	sll	a5,s1,a6
    3728:	00af5733          	srl	a4,t5,a0
    372c:	010f1833          	sll	a6,t5,a6
    3730:	00e7e7b3          	or	a5,a5,a4
    3734:	01003833          	snez	a6,a6
    3738:	0107e7b3          	or	a5,a5,a6
    373c:	00a4d533          	srl	a0,s1,a0
    3740:	0077f713          	andi	a4,a5,7
    3744:	02070063          	beqz	a4,3764 <__divdf3+0x648>
    3748:	00f7f713          	andi	a4,a5,15
    374c:	00400693          	li	a3,4
    3750:	00d70a63          	beq	a4,a3,3764 <__divdf3+0x648>
    3754:	00478713          	addi	a4,a5,4
    3758:	00f736b3          	sltu	a3,a4,a5
    375c:	00d50533          	add	a0,a0,a3
    3760:	00070793          	mv	a5,a4
    3764:	00851713          	slli	a4,a0,0x8
    3768:	06074863          	bltz	a4,37d8 <__divdf3+0x6bc>
    376c:	01d51f13          	slli	t5,a0,0x1d
    3770:	0037d793          	srli	a5,a5,0x3
    3774:	00ff6f33          	or	t5,t5,a5
    3778:	00355513          	srli	a0,a0,0x3
    377c:	00000713          	li	a4,0
    3780:	eddff06f          	j	365c <__divdf3+0x540>
    3784:	fe100793          	li	a5,-31
    3788:	40e787b3          	sub	a5,a5,a4
    378c:	02000693          	li	a3,32
    3790:	00f4d7b3          	srl	a5,s1,a5
    3794:	00000713          	li	a4,0
    3798:	00d50663          	beq	a0,a3,37a4 <__divdf3+0x688>
    379c:	43e80713          	addi	a4,a6,1086
    37a0:	00e49733          	sll	a4,s1,a4
    37a4:	01e76733          	or	a4,a4,t5
    37a8:	00e03733          	snez	a4,a4
    37ac:	00e7e7b3          	or	a5,a5,a4
    37b0:	00000513          	li	a0,0
    37b4:	f8dff06f          	j	3740 <__divdf3+0x624>
    37b8:	00080537          	lui	a0,0x80
    37bc:	00000f13          	li	t5,0
    37c0:	7ff00713          	li	a4,2047
    37c4:	00000613          	li	a2,0
    37c8:	e95ff06f          	j	365c <__divdf3+0x540>
    37cc:	00000513          	li	a0,0
    37d0:	00000f13          	li	t5,0
    37d4:	fa9ff06f          	j	377c <__divdf3+0x660>
    37d8:	00000513          	li	a0,0
    37dc:	00000f13          	li	t5,0
    37e0:	00100713          	li	a4,1
    37e4:	e79ff06f          	j	365c <__divdf3+0x540>
    37e8:	000f0693          	mv	a3,t5
    37ec:	00068f13          	mv	t5,a3
    37f0:	e0dff06f          	j	35fc <__divdf3+0x4e0>

000037f4 <__fixdfsi>:
    37f4:	0145d713          	srli	a4,a1,0x14
    37f8:	001006b7          	lui	a3,0x100
    37fc:	fff68793          	addi	a5,a3,-1 # fffff <_memory_end+0xdffff>
    3800:	7ff77713          	andi	a4,a4,2047
    3804:	3fe00613          	li	a2,1022
    3808:	00b7f7b3          	and	a5,a5,a1
    380c:	01f5d593          	srli	a1,a1,0x1f
    3810:	04e65e63          	bge	a2,a4,386c <__fixdfsi+0x78>
    3814:	41d00613          	li	a2,1053
    3818:	00e65a63          	bge	a2,a4,382c <__fixdfsi+0x38>
    381c:	80000537          	lui	a0,0x80000
    3820:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
    3824:	00a58533          	add	a0,a1,a0
    3828:	00008067          	ret
    382c:	00d7e7b3          	or	a5,a5,a3
    3830:	43300693          	li	a3,1075
    3834:	40e686b3          	sub	a3,a3,a4
    3838:	01f00613          	li	a2,31
    383c:	02d64063          	blt	a2,a3,385c <__fixdfsi+0x68>
    3840:	bed70713          	addi	a4,a4,-1043
    3844:	00e797b3          	sll	a5,a5,a4
    3848:	00d55533          	srl	a0,a0,a3
    384c:	00a7e533          	or	a0,a5,a0
    3850:	02058063          	beqz	a1,3870 <__fixdfsi+0x7c>
    3854:	40a00533          	neg	a0,a0
    3858:	00008067          	ret
    385c:	41300693          	li	a3,1043
    3860:	40e68733          	sub	a4,a3,a4
    3864:	00e7d533          	srl	a0,a5,a4
    3868:	fe9ff06f          	j	3850 <__fixdfsi+0x5c>
    386c:	00000513          	li	a0,0
    3870:	00008067          	ret

00003874 <__fixunsdfsi>:
    3874:	0145d713          	srli	a4,a1,0x14
    3878:	00100837          	lui	a6,0x100
    387c:	fff80793          	addi	a5,a6,-1 # fffff <_memory_end+0xdffff>
    3880:	7ff77713          	andi	a4,a4,2047
    3884:	3fe00613          	li	a2,1022
    3888:	00b7f7b3          	and	a5,a5,a1
    388c:	00050693          	mv	a3,a0
    3890:	01f5d593          	srli	a1,a1,0x1f
    3894:	04e65a63          	bge	a2,a4,38e8 <__fixunsdfsi+0x74>
    3898:	0015c613          	xori	a2,a1,1
    389c:	41e60613          	addi	a2,a2,1054 # 7ff0041e <_memory_end+0x7fee041e>
    38a0:	fff58513          	addi	a0,a1,-1
    38a4:	04c75463          	bge	a4,a2,38ec <__fixunsdfsi+0x78>
    38a8:	00000513          	li	a0,0
    38ac:	04059063          	bnez	a1,38ec <__fixunsdfsi+0x78>
    38b0:	43300613          	li	a2,1075
    38b4:	40e60633          	sub	a2,a2,a4
    38b8:	01f00593          	li	a1,31
    38bc:	0107e7b3          	or	a5,a5,a6
    38c0:	00c5cc63          	blt	a1,a2,38d8 <__fixunsdfsi+0x64>
    38c4:	bed70713          	addi	a4,a4,-1043
    38c8:	00e797b3          	sll	a5,a5,a4
    38cc:	00c6d533          	srl	a0,a3,a2
    38d0:	00a7e533          	or	a0,a5,a0
    38d4:	00008067          	ret
    38d8:	41300693          	li	a3,1043
    38dc:	40e68733          	sub	a4,a3,a4
    38e0:	00e7d533          	srl	a0,a5,a4
    38e4:	00008067          	ret
    38e8:	00000513          	li	a0,0
    38ec:	00008067          	ret

000038f0 <__floatunsidf>:
    38f0:	ff010113          	addi	sp,sp,-16
    38f4:	00812423          	sw	s0,8(sp)
    38f8:	00112623          	sw	ra,12(sp)
    38fc:	00050413          	mv	s0,a0
    3900:	06050263          	beqz	a0,3964 <__floatunsidf+0x74>
    3904:	575000ef          	jal	4678 <__clzsi2>
    3908:	41e00713          	li	a4,1054
    390c:	00a00793          	li	a5,10
    3910:	40a70733          	sub	a4,a4,a0
    3914:	04a7c063          	blt	a5,a0,3954 <__floatunsidf+0x64>
    3918:	00b00793          	li	a5,11
    391c:	40a787b3          	sub	a5,a5,a0
    3920:	01550513          	addi	a0,a0,21
    3924:	00f457b3          	srl	a5,s0,a5
    3928:	00a41433          	sll	s0,s0,a0
    392c:	00c12083          	lw	ra,12(sp)
    3930:	00040513          	mv	a0,s0
    3934:	00c79793          	slli	a5,a5,0xc
    3938:	00812403          	lw	s0,8(sp)
    393c:	01471713          	slli	a4,a4,0x14
    3940:	00c7d793          	srli	a5,a5,0xc
    3944:	00f766b3          	or	a3,a4,a5
    3948:	00068593          	mv	a1,a3
    394c:	01010113          	addi	sp,sp,16
    3950:	00008067          	ret
    3954:	ff550513          	addi	a0,a0,-11
    3958:	00a417b3          	sll	a5,s0,a0
    395c:	00000413          	li	s0,0
    3960:	fcdff06f          	j	392c <__floatunsidf+0x3c>
    3964:	00000793          	li	a5,0
    3968:	00000713          	li	a4,0
    396c:	fc1ff06f          	j	392c <__floatunsidf+0x3c>

00003970 <__eqsf2>:
    3970:	01755693          	srli	a3,a0,0x17
    3974:	008007b7          	lui	a5,0x800
    3978:	fff78793          	addi	a5,a5,-1 # 7fffff <_memory_end+0x7dffff>
    397c:	0175d613          	srli	a2,a1,0x17
    3980:	0ff6f693          	zext.b	a3,a3
    3984:	0ff00893          	li	a7,255
    3988:	00a7f833          	and	a6,a5,a0
    398c:	01f55713          	srli	a4,a0,0x1f
    3990:	00b7f7b3          	and	a5,a5,a1
    3994:	0ff67613          	zext.b	a2,a2
    3998:	01f5d593          	srli	a1,a1,0x1f
    399c:	00100513          	li	a0,1
    39a0:	01169a63          	bne	a3,a7,39b4 <__eqsf2+0x44>
    39a4:	00081663          	bnez	a6,39b0 <__eqsf2+0x40>
    39a8:	00d61463          	bne	a2,a3,39b0 <__eqsf2+0x40>
    39ac:	00078a63          	beqz	a5,39c0 <__eqsf2+0x50>
    39b0:	00008067          	ret
    39b4:	ff160ee3          	beq	a2,a7,39b0 <__eqsf2+0x40>
    39b8:	fec69ce3          	bne	a3,a2,39b0 <__eqsf2+0x40>
    39bc:	fef81ae3          	bne	a6,a5,39b0 <__eqsf2+0x40>
    39c0:	00000513          	li	a0,0
    39c4:	feb706e3          	beq	a4,a1,39b0 <__eqsf2+0x40>
    39c8:	00100513          	li	a0,1
    39cc:	fe0692e3          	bnez	a3,39b0 <__eqsf2+0x40>
    39d0:	01003533          	snez	a0,a6
    39d4:	00008067          	ret

000039d8 <__lesf2>:
    39d8:	008007b7          	lui	a5,0x800
    39dc:	fff78793          	addi	a5,a5,-1 # 7fffff <_memory_end+0x7dffff>
    39e0:	01755693          	srli	a3,a0,0x17
    39e4:	00a7f633          	and	a2,a5,a0
    39e8:	01f55713          	srli	a4,a0,0x1f
    39ec:	0ff6f693          	zext.b	a3,a3
    39f0:	0175d513          	srli	a0,a1,0x17
    39f4:	0ff00813          	li	a6,255
    39f8:	00b7f7b3          	and	a5,a5,a1
    39fc:	0ff57513          	zext.b	a0,a0
    3a00:	01f5d593          	srli	a1,a1,0x1f
    3a04:	01069463          	bne	a3,a6,3a0c <__lesf2+0x34>
    3a08:	04061263          	bnez	a2,3a4c <__lesf2+0x74>
    3a0c:	0ff00813          	li	a6,255
    3a10:	01051463          	bne	a0,a6,3a18 <__lesf2+0x40>
    3a14:	02079c63          	bnez	a5,3a4c <__lesf2+0x74>
    3a18:	04069a63          	bnez	a3,3a6c <__lesf2+0x94>
    3a1c:	02051c63          	bnez	a0,3a54 <__lesf2+0x7c>
    3a20:	04061863          	bnez	a2,3a70 <__lesf2+0x98>
    3a24:	04078263          	beqz	a5,3a68 <__lesf2+0x90>
    3a28:	00100513          	li	a0,1
    3a2c:	02059e63          	bnez	a1,3a68 <__lesf2+0x90>
    3a30:	fff00513          	li	a0,-1
    3a34:	00008067          	ret
    3a38:	fea6c8e3          	blt	a3,a0,3a28 <__lesf2+0x50>
    3a3c:	02c7e263          	bltu	a5,a2,3a60 <__lesf2+0x88>
    3a40:	00000513          	li	a0,0
    3a44:	02f67263          	bgeu	a2,a5,3a68 <__lesf2+0x90>
    3a48:	fe1ff06f          	j	3a28 <__lesf2+0x50>
    3a4c:	00200513          	li	a0,2
    3a50:	00008067          	ret
    3a54:	fc060ae3          	beqz	a2,3a28 <__lesf2+0x50>
    3a58:	00e59e63          	bne	a1,a4,3a74 <__lesf2+0x9c>
    3a5c:	fcd55ee3          	bge	a0,a3,3a38 <__lesf2+0x60>
    3a60:	fff00513          	li	a0,-1
    3a64:	00058c63          	beqz	a1,3a7c <__lesf2+0xa4>
    3a68:	00008067          	ret
    3a6c:	fe0516e3          	bnez	a0,3a58 <__lesf2+0x80>
    3a70:	fe0794e3          	bnez	a5,3a58 <__lesf2+0x80>
    3a74:	fff00513          	li	a0,-1
    3a78:	fe0718e3          	bnez	a4,3a68 <__lesf2+0x90>
    3a7c:	00100513          	li	a0,1
    3a80:	00008067          	ret

00003a84 <__mulsf3>:
    3a84:	fe010113          	addi	sp,sp,-32
    3a88:	01212823          	sw	s2,16(sp)
    3a8c:	01755913          	srli	s2,a0,0x17
    3a90:	00912a23          	sw	s1,20(sp)
    3a94:	01312623          	sw	s3,12(sp)
    3a98:	01512223          	sw	s5,4(sp)
    3a9c:	00951493          	slli	s1,a0,0x9
    3aa0:	00112e23          	sw	ra,28(sp)
    3aa4:	00812c23          	sw	s0,24(sp)
    3aa8:	01412423          	sw	s4,8(sp)
    3aac:	0ff97913          	zext.b	s2,s2
    3ab0:	00058a93          	mv	s5,a1
    3ab4:	0094d493          	srli	s1,s1,0x9
    3ab8:	01f55993          	srli	s3,a0,0x1f
    3abc:	10090863          	beqz	s2,3bcc <__mulsf3+0x148>
    3ac0:	0ff00793          	li	a5,255
    3ac4:	12f90463          	beq	s2,a5,3bec <__mulsf3+0x168>
    3ac8:	00349493          	slli	s1,s1,0x3
    3acc:	040007b7          	lui	a5,0x4000
    3ad0:	00f4e4b3          	or	s1,s1,a5
    3ad4:	f8190913          	addi	s2,s2,-127
    3ad8:	00000a13          	li	s4,0
    3adc:	017ad793          	srli	a5,s5,0x17
    3ae0:	009a9413          	slli	s0,s5,0x9
    3ae4:	0ff7f793          	zext.b	a5,a5
    3ae8:	00945413          	srli	s0,s0,0x9
    3aec:	01fada93          	srli	s5,s5,0x1f
    3af0:	10078e63          	beqz	a5,3c0c <__mulsf3+0x188>
    3af4:	0ff00713          	li	a4,255
    3af8:	12e78a63          	beq	a5,a4,3c2c <__mulsf3+0x1a8>
    3afc:	00341413          	slli	s0,s0,0x3
    3b00:	04000737          	lui	a4,0x4000
    3b04:	00e46433          	or	s0,s0,a4
    3b08:	f8178793          	addi	a5,a5,-127 # 3ffff81 <_memory_end+0x3fdff81>
    3b0c:	00000713          	li	a4,0
    3b10:	00f90933          	add	s2,s2,a5
    3b14:	002a1793          	slli	a5,s4,0x2
    3b18:	00e7e7b3          	or	a5,a5,a4
    3b1c:	00a00613          	li	a2,10
    3b20:	00190693          	addi	a3,s2,1
    3b24:	1ef64263          	blt	a2,a5,3d08 <__mulsf3+0x284>
    3b28:	00200613          	li	a2,2
    3b2c:	0159c9b3          	xor	s3,s3,s5
    3b30:	10f64e63          	blt	a2,a5,3c4c <__mulsf3+0x1c8>
    3b34:	fff78793          	addi	a5,a5,-1
    3b38:	00100613          	li	a2,1
    3b3c:	12f67a63          	bgeu	a2,a5,3c70 <__mulsf3+0x1ec>
    3b40:	00010837          	lui	a6,0x10
    3b44:	fff80513          	addi	a0,a6,-1 # ffff <_bss_end+0xb3fb>
    3b48:	0104d613          	srli	a2,s1,0x10
    3b4c:	01045793          	srli	a5,s0,0x10
    3b50:	00a4f4b3          	and	s1,s1,a0
    3b54:	00a47433          	and	s0,s0,a0
    3b58:	029405b3          	mul	a1,s0,s1
    3b5c:	02860433          	mul	s0,a2,s0
    3b60:	02f60633          	mul	a2,a2,a5
    3b64:	029787b3          	mul	a5,a5,s1
    3b68:	00878733          	add	a4,a5,s0
    3b6c:	0105d793          	srli	a5,a1,0x10
    3b70:	00e787b3          	add	a5,a5,a4
    3b74:	0087f463          	bgeu	a5,s0,3b7c <__mulsf3+0xf8>
    3b78:	01060633          	add	a2,a2,a6
    3b7c:	00a7f733          	and	a4,a5,a0
    3b80:	01071713          	slli	a4,a4,0x10
    3b84:	00a5f5b3          	and	a1,a1,a0
    3b88:	00b70733          	add	a4,a4,a1
    3b8c:	0107d793          	srli	a5,a5,0x10
    3b90:	00671413          	slli	s0,a4,0x6
    3b94:	00c787b3          	add	a5,a5,a2
    3b98:	01a75713          	srli	a4,a4,0x1a
    3b9c:	00679793          	slli	a5,a5,0x6
    3ba0:	00803433          	snez	s0,s0
    3ba4:	00e46433          	or	s0,s0,a4
    3ba8:	00479713          	slli	a4,a5,0x4
    3bac:	0087e433          	or	s0,a5,s0
    3bb0:	00075a63          	bgez	a4,3bc4 <__mulsf3+0x140>
    3bb4:	00145793          	srli	a5,s0,0x1
    3bb8:	00147413          	andi	s0,s0,1
    3bbc:	0087e433          	or	s0,a5,s0
    3bc0:	00068913          	mv	s2,a3
    3bc4:	00090693          	mv	a3,s2
    3bc8:	0c00006f          	j	3c88 <__mulsf3+0x204>
    3bcc:	02048a63          	beqz	s1,3c00 <__mulsf3+0x17c>
    3bd0:	00048513          	mv	a0,s1
    3bd4:	2a5000ef          	jal	4678 <__clzsi2>
    3bd8:	ffb50793          	addi	a5,a0,-5
    3bdc:	f8a00913          	li	s2,-118
    3be0:	00f494b3          	sll	s1,s1,a5
    3be4:	40a90933          	sub	s2,s2,a0
    3be8:	ef1ff06f          	j	3ad8 <__mulsf3+0x54>
    3bec:	0ff00913          	li	s2,255
    3bf0:	00200a13          	li	s4,2
    3bf4:	ee0484e3          	beqz	s1,3adc <__mulsf3+0x58>
    3bf8:	00300a13          	li	s4,3
    3bfc:	ee1ff06f          	j	3adc <__mulsf3+0x58>
    3c00:	00000913          	li	s2,0
    3c04:	00100a13          	li	s4,1
    3c08:	ed5ff06f          	j	3adc <__mulsf3+0x58>
    3c0c:	02040a63          	beqz	s0,3c40 <__mulsf3+0x1bc>
    3c10:	00040513          	mv	a0,s0
    3c14:	265000ef          	jal	4678 <__clzsi2>
    3c18:	ffb50793          	addi	a5,a0,-5
    3c1c:	00f41433          	sll	s0,s0,a5
    3c20:	f8a00793          	li	a5,-118
    3c24:	40a787b3          	sub	a5,a5,a0
    3c28:	ee5ff06f          	j	3b0c <__mulsf3+0x88>
    3c2c:	0ff00793          	li	a5,255
    3c30:	00200713          	li	a4,2
    3c34:	ec040ee3          	beqz	s0,3b10 <__mulsf3+0x8c>
    3c38:	00300713          	li	a4,3
    3c3c:	ed5ff06f          	j	3b10 <__mulsf3+0x8c>
    3c40:	00000793          	li	a5,0
    3c44:	00100713          	li	a4,1
    3c48:	ec9ff06f          	j	3b10 <__mulsf3+0x8c>
    3c4c:	00100613          	li	a2,1
    3c50:	00f617b3          	sll	a5,a2,a5
    3c54:	5307f613          	andi	a2,a5,1328
    3c58:	0c061063          	bnez	a2,3d18 <__mulsf3+0x294>
    3c5c:	2407f613          	andi	a2,a5,576
    3c60:	12061263          	bnez	a2,3d84 <__mulsf3+0x300>
    3c64:	0887f793          	andi	a5,a5,136
    3c68:	ec078ce3          	beqz	a5,3b40 <__mulsf3+0xbc>
    3c6c:	000a8993          	mv	s3,s5
    3c70:	00200793          	li	a5,2
    3c74:	10f70263          	beq	a4,a5,3d78 <__mulsf3+0x2f4>
    3c78:	00300793          	li	a5,3
    3c7c:	10f70463          	beq	a4,a5,3d84 <__mulsf3+0x300>
    3c80:	00100793          	li	a5,1
    3c84:	10f70863          	beq	a4,a5,3d94 <__mulsf3+0x310>
    3c88:	07f68713          	addi	a4,a3,127
    3c8c:	08e05c63          	blez	a4,3d24 <__mulsf3+0x2a0>
    3c90:	00747793          	andi	a5,s0,7
    3c94:	00078a63          	beqz	a5,3ca8 <__mulsf3+0x224>
    3c98:	00f47793          	andi	a5,s0,15
    3c9c:	00400613          	li	a2,4
    3ca0:	00c78463          	beq	a5,a2,3ca8 <__mulsf3+0x224>
    3ca4:	00440413          	addi	s0,s0,4
    3ca8:	00441793          	slli	a5,s0,0x4
    3cac:	0007da63          	bgez	a5,3cc0 <__mulsf3+0x23c>
    3cb0:	f80007b7          	lui	a5,0xf8000
    3cb4:	fff78793          	addi	a5,a5,-1 # f7ffffff <_memory_end+0xf7fdffff>
    3cb8:	00f47433          	and	s0,s0,a5
    3cbc:	08068713          	addi	a4,a3,128
    3cc0:	0fe00793          	li	a5,254
    3cc4:	0ae7ca63          	blt	a5,a4,3d78 <__mulsf3+0x2f4>
    3cc8:	00345793          	srli	a5,s0,0x3
    3ccc:	01c12083          	lw	ra,28(sp)
    3cd0:	01812403          	lw	s0,24(sp)
    3cd4:	00979793          	slli	a5,a5,0x9
    3cd8:	01771513          	slli	a0,a4,0x17
    3cdc:	0097d793          	srli	a5,a5,0x9
    3ce0:	01f99993          	slli	s3,s3,0x1f
    3ce4:	00f56533          	or	a0,a0,a5
    3ce8:	01412483          	lw	s1,20(sp)
    3cec:	01012903          	lw	s2,16(sp)
    3cf0:	00812a03          	lw	s4,8(sp)
    3cf4:	00412a83          	lw	s5,4(sp)
    3cf8:	01356533          	or	a0,a0,s3
    3cfc:	00c12983          	lw	s3,12(sp)
    3d00:	02010113          	addi	sp,sp,32
    3d04:	00008067          	ret
    3d08:	00f00613          	li	a2,15
    3d0c:	06c78c63          	beq	a5,a2,3d84 <__mulsf3+0x300>
    3d10:	00b00613          	li	a2,11
    3d14:	f4c78ce3          	beq	a5,a2,3c6c <__mulsf3+0x1e8>
    3d18:	00048413          	mv	s0,s1
    3d1c:	000a0713          	mv	a4,s4
    3d20:	f51ff06f          	j	3c70 <__mulsf3+0x1ec>
    3d24:	00100793          	li	a5,1
    3d28:	40e787b3          	sub	a5,a5,a4
    3d2c:	01b00713          	li	a4,27
    3d30:	06f74263          	blt	a4,a5,3d94 <__mulsf3+0x310>
    3d34:	09e68693          	addi	a3,a3,158
    3d38:	00d416b3          	sll	a3,s0,a3
    3d3c:	00f457b3          	srl	a5,s0,a5
    3d40:	00d036b3          	snez	a3,a3
    3d44:	00d7e7b3          	or	a5,a5,a3
    3d48:	0077f713          	andi	a4,a5,7
    3d4c:	00070a63          	beqz	a4,3d60 <__mulsf3+0x2dc>
    3d50:	00f7f713          	andi	a4,a5,15
    3d54:	00400693          	li	a3,4
    3d58:	00d70463          	beq	a4,a3,3d60 <__mulsf3+0x2dc>
    3d5c:	00478793          	addi	a5,a5,4
    3d60:	00579713          	slli	a4,a5,0x5
    3d64:	0037d793          	srli	a5,a5,0x3
    3d68:	02075863          	bgez	a4,3d98 <__mulsf3+0x314>
    3d6c:	00000793          	li	a5,0
    3d70:	00100713          	li	a4,1
    3d74:	f59ff06f          	j	3ccc <__mulsf3+0x248>
    3d78:	00000793          	li	a5,0
    3d7c:	0ff00713          	li	a4,255
    3d80:	f4dff06f          	j	3ccc <__mulsf3+0x248>
    3d84:	004007b7          	lui	a5,0x400
    3d88:	0ff00713          	li	a4,255
    3d8c:	00000993          	li	s3,0
    3d90:	f3dff06f          	j	3ccc <__mulsf3+0x248>
    3d94:	00000793          	li	a5,0
    3d98:	00000713          	li	a4,0
    3d9c:	f31ff06f          	j	3ccc <__mulsf3+0x248>

00003da0 <__subsf3>:
    3da0:	008006b7          	lui	a3,0x800
    3da4:	fff68693          	addi	a3,a3,-1 # 7fffff <_memory_end+0x7dffff>
    3da8:	ff010113          	addi	sp,sp,-16
    3dac:	00a6f633          	and	a2,a3,a0
    3db0:	01755713          	srli	a4,a0,0x17
    3db4:	00812423          	sw	s0,8(sp)
    3db8:	01f55413          	srli	s0,a0,0x1f
    3dbc:	00361513          	slli	a0,a2,0x3
    3dc0:	0175d613          	srli	a2,a1,0x17
    3dc4:	00b6f6b3          	and	a3,a3,a1
    3dc8:	01212023          	sw	s2,0(sp)
    3dcc:	00112623          	sw	ra,12(sp)
    3dd0:	0ff77913          	zext.b	s2,a4
    3dd4:	00912223          	sw	s1,4(sp)
    3dd8:	0ff67613          	zext.b	a2,a2
    3ddc:	0ff00713          	li	a4,255
    3de0:	01f5d593          	srli	a1,a1,0x1f
    3de4:	00369793          	slli	a5,a3,0x3
    3de8:	00e61463          	bne	a2,a4,3df0 <__subsf3+0x50>
    3dec:	00079463          	bnez	a5,3df4 <__subsf3+0x54>
    3df0:	0015c593          	xori	a1,a1,1
    3df4:	40c906b3          	sub	a3,s2,a2
    3df8:	18859063          	bne	a1,s0,3f78 <__subsf3+0x1d8>
    3dfc:	08d05c63          	blez	a3,3e94 <__subsf3+0xf4>
    3e00:	02061663          	bnez	a2,3e2c <__subsf3+0x8c>
    3e04:	02078063          	beqz	a5,3e24 <__subsf3+0x84>
    3e08:	fff90693          	addi	a3,s2,-1
    3e0c:	00069863          	bnez	a3,3e1c <__subsf3+0x7c>
    3e10:	00a787b3          	add	a5,a5,a0
    3e14:	00100913          	li	s2,1
    3e18:	04c0006f          	j	3e64 <__subsf3+0xc4>
    3e1c:	0ff00713          	li	a4,255
    3e20:	00e91e63          	bne	s2,a4,3e3c <__subsf3+0x9c>
    3e24:	00050793          	mv	a5,a0
    3e28:	10c0006f          	j	3f34 <__subsf3+0x194>
    3e2c:	0ff00713          	li	a4,255
    3e30:	fee90ae3          	beq	s2,a4,3e24 <__subsf3+0x84>
    3e34:	04000737          	lui	a4,0x4000
    3e38:	00e7e7b3          	or	a5,a5,a4
    3e3c:	01b00613          	li	a2,27
    3e40:	00100713          	li	a4,1
    3e44:	00d64e63          	blt	a2,a3,3e60 <__subsf3+0xc0>
    3e48:	02000613          	li	a2,32
    3e4c:	00d7d733          	srl	a4,a5,a3
    3e50:	40d606b3          	sub	a3,a2,a3
    3e54:	00d796b3          	sll	a3,a5,a3
    3e58:	00d036b3          	snez	a3,a3
    3e5c:	00d76733          	or	a4,a4,a3
    3e60:	00a707b3          	add	a5,a4,a0
    3e64:	00579713          	slli	a4,a5,0x5
    3e68:	0c075663          	bgez	a4,3f34 <__subsf3+0x194>
    3e6c:	00190913          	addi	s2,s2,1
    3e70:	0ff00713          	li	a4,255
    3e74:	2ce90a63          	beq	s2,a4,4148 <__subsf3+0x3a8>
    3e78:	7e000737          	lui	a4,0x7e000
    3e7c:	0017f693          	andi	a3,a5,1
    3e80:	fff70713          	addi	a4,a4,-1 # 7dffffff <_memory_end+0x7dfdffff>
    3e84:	0017d793          	srli	a5,a5,0x1
    3e88:	00e7f7b3          	and	a5,a5,a4
    3e8c:	00d7e7b3          	or	a5,a5,a3
    3e90:	0a40006f          	j	3f34 <__subsf3+0x194>
    3e94:	06068663          	beqz	a3,3f00 <__subsf3+0x160>
    3e98:	41260733          	sub	a4,a2,s2
    3e9c:	02091063          	bnez	s2,3ebc <__subsf3+0x11c>
    3ea0:	0c050863          	beqz	a0,3f70 <__subsf3+0x1d0>
    3ea4:	fff70693          	addi	a3,a4,-1
    3ea8:	f60684e3          	beqz	a3,3e10 <__subsf3+0x70>
    3eac:	0ff00593          	li	a1,255
    3eb0:	02b71063          	bne	a4,a1,3ed0 <__subsf3+0x130>
    3eb4:	0ff00913          	li	s2,255
    3eb8:	07c0006f          	j	3f34 <__subsf3+0x194>
    3ebc:	0ff00693          	li	a3,255
    3ec0:	fed60ae3          	beq	a2,a3,3eb4 <__subsf3+0x114>
    3ec4:	040006b7          	lui	a3,0x4000
    3ec8:	00d56533          	or	a0,a0,a3
    3ecc:	00070693          	mv	a3,a4
    3ed0:	01b00593          	li	a1,27
    3ed4:	00100713          	li	a4,1
    3ed8:	00d5ce63          	blt	a1,a3,3ef4 <__subsf3+0x154>
    3edc:	02000713          	li	a4,32
    3ee0:	40d70733          	sub	a4,a4,a3
    3ee4:	00e51733          	sll	a4,a0,a4
    3ee8:	00d555b3          	srl	a1,a0,a3
    3eec:	00e03733          	snez	a4,a4
    3ef0:	00e5e733          	or	a4,a1,a4
    3ef4:	00e787b3          	add	a5,a5,a4
    3ef8:	00060913          	mv	s2,a2
    3efc:	f69ff06f          	j	3e64 <__subsf3+0xc4>
    3f00:	00190713          	addi	a4,s2,1
    3f04:	0fe77693          	andi	a3,a4,254
    3f08:	04069c63          	bnez	a3,3f60 <__subsf3+0x1c0>
    3f0c:	04091263          	bnez	s2,3f50 <__subsf3+0x1b0>
    3f10:	02050263          	beqz	a0,3f34 <__subsf3+0x194>
    3f14:	f00788e3          	beqz	a5,3e24 <__subsf3+0x84>
    3f18:	00a787b3          	add	a5,a5,a0
    3f1c:	00579713          	slli	a4,a5,0x5
    3f20:	00075a63          	bgez	a4,3f34 <__subsf3+0x194>
    3f24:	fc000737          	lui	a4,0xfc000
    3f28:	fff70713          	addi	a4,a4,-1 # fbffffff <_memory_end+0xfbfdffff>
    3f2c:	00e7f7b3          	and	a5,a5,a4
    3f30:	00100913          	li	s2,1
    3f34:	0077f713          	andi	a4,a5,7
    3f38:	20070a63          	beqz	a4,414c <__subsf3+0x3ac>
    3f3c:	00f7f713          	andi	a4,a5,15
    3f40:	00400693          	li	a3,4
    3f44:	20d70463          	beq	a4,a3,414c <__subsf3+0x3ac>
    3f48:	00478793          	addi	a5,a5,4 # 400004 <_memory_end+0x3e0004>
    3f4c:	2000006f          	j	414c <__subsf3+0x3ac>
    3f50:	f60502e3          	beqz	a0,3eb4 <__subsf3+0x114>
    3f54:	16079663          	bnez	a5,40c0 <__subsf3+0x320>
    3f58:	00050793          	mv	a5,a0
    3f5c:	f59ff06f          	j	3eb4 <__subsf3+0x114>
    3f60:	0ff00693          	li	a3,255
    3f64:	1ed70063          	beq	a4,a3,4144 <__subsf3+0x3a4>
    3f68:	00f507b3          	add	a5,a0,a5
    3f6c:	0017d793          	srli	a5,a5,0x1
    3f70:	00070913          	mv	s2,a4
    3f74:	fc1ff06f          	j	3f34 <__subsf3+0x194>
    3f78:	06d05e63          	blez	a3,3ff4 <__subsf3+0x254>
    3f7c:	06061263          	bnez	a2,3fe0 <__subsf3+0x240>
    3f80:	ea0782e3          	beqz	a5,3e24 <__subsf3+0x84>
    3f84:	fff90693          	addi	a3,s2,-1
    3f88:	00069863          	bnez	a3,3f98 <__subsf3+0x1f8>
    3f8c:	40f507b3          	sub	a5,a0,a5
    3f90:	00100913          	li	s2,1
    3f94:	0340006f          	j	3fc8 <__subsf3+0x228>
    3f98:	0ff00713          	li	a4,255
    3f9c:	e8e904e3          	beq	s2,a4,3e24 <__subsf3+0x84>
    3fa0:	01b00613          	li	a2,27
    3fa4:	00100713          	li	a4,1
    3fa8:	00d64e63          	blt	a2,a3,3fc4 <__subsf3+0x224>
    3fac:	02000613          	li	a2,32
    3fb0:	00d7d733          	srl	a4,a5,a3
    3fb4:	40d606b3          	sub	a3,a2,a3
    3fb8:	00d796b3          	sll	a3,a5,a3
    3fbc:	00d036b3          	snez	a3,a3
    3fc0:	00d76733          	or	a4,a4,a3
    3fc4:	40e507b3          	sub	a5,a0,a4
    3fc8:	00579713          	slli	a4,a5,0x5
    3fcc:	f60754e3          	bgez	a4,3f34 <__subsf3+0x194>
    3fd0:	040004b7          	lui	s1,0x4000
    3fd4:	fff48493          	addi	s1,s1,-1 # 3ffffff <_memory_end+0x3fdffff>
    3fd8:	0097f4b3          	and	s1,a5,s1
    3fdc:	1080006f          	j	40e4 <__subsf3+0x344>
    3fe0:	0ff00713          	li	a4,255
    3fe4:	e4e900e3          	beq	s2,a4,3e24 <__subsf3+0x84>
    3fe8:	04000737          	lui	a4,0x4000
    3fec:	00e7e7b3          	or	a5,a5,a4
    3ff0:	fb1ff06f          	j	3fa0 <__subsf3+0x200>
    3ff4:	06068e63          	beqz	a3,4070 <__subsf3+0x2d0>
    3ff8:	41260733          	sub	a4,a2,s2
    3ffc:	02091663          	bnez	s2,4028 <__subsf3+0x288>
    4000:	1a050e63          	beqz	a0,41bc <__subsf3+0x41c>
    4004:	fff70693          	addi	a3,a4,-1 # 3ffffff <_memory_end+0x3fdffff>
    4008:	00069863          	bnez	a3,4018 <__subsf3+0x278>
    400c:	40a787b3          	sub	a5,a5,a0
    4010:	00058413          	mv	s0,a1
    4014:	f7dff06f          	j	3f90 <__subsf3+0x1f0>
    4018:	0ff00813          	li	a6,255
    401c:	03071063          	bne	a4,a6,403c <__subsf3+0x29c>
    4020:	0ff00913          	li	s2,255
    4024:	19c0006f          	j	41c0 <__subsf3+0x420>
    4028:	0ff00693          	li	a3,255
    402c:	fed60ae3          	beq	a2,a3,4020 <__subsf3+0x280>
    4030:	040006b7          	lui	a3,0x4000
    4034:	00d56533          	or	a0,a0,a3
    4038:	00070693          	mv	a3,a4
    403c:	01b00813          	li	a6,27
    4040:	00100713          	li	a4,1
    4044:	00d84e63          	blt	a6,a3,4060 <__subsf3+0x2c0>
    4048:	02000713          	li	a4,32
    404c:	40d70733          	sub	a4,a4,a3
    4050:	00e51733          	sll	a4,a0,a4
    4054:	00d55833          	srl	a6,a0,a3
    4058:	00e03733          	snez	a4,a4
    405c:	00e86733          	or	a4,a6,a4
    4060:	40e787b3          	sub	a5,a5,a4
    4064:	00060913          	mv	s2,a2
    4068:	00058413          	mv	s0,a1
    406c:	f5dff06f          	j	3fc8 <__subsf3+0x228>
    4070:	00190713          	addi	a4,s2,1
    4074:	0fe77713          	andi	a4,a4,254
    4078:	04071c63          	bnez	a4,40d0 <__subsf3+0x330>
    407c:	02091c63          	bnez	s2,40b4 <__subsf3+0x314>
    4080:	00051863          	bnez	a0,4090 <__subsf3+0x2f0>
    4084:	12079e63          	bnez	a5,41c0 <__subsf3+0x420>
    4088:	00000413          	li	s0,0
    408c:	0c00006f          	j	414c <__subsf3+0x3ac>
    4090:	d8078ae3          	beqz	a5,3e24 <__subsf3+0x84>
    4094:	40f50733          	sub	a4,a0,a5
    4098:	00571693          	slli	a3,a4,0x5
    409c:	40a787b3          	sub	a5,a5,a0
    40a0:	1206c063          	bltz	a3,41c0 <__subsf3+0x420>
    40a4:	00070793          	mv	a5,a4
    40a8:	e80716e3          	bnez	a4,3f34 <__subsf3+0x194>
    40ac:	00000793          	li	a5,0
    40b0:	fd9ff06f          	j	4088 <__subsf3+0x2e8>
    40b4:	ea0510e3          	bnez	a0,3f54 <__subsf3+0x1b4>
    40b8:	00058413          	mv	s0,a1
    40bc:	de079ce3          	bnez	a5,3eb4 <__subsf3+0x114>
    40c0:	00000413          	li	s0,0
    40c4:	020007b7          	lui	a5,0x2000
    40c8:	0ff00913          	li	s2,255
    40cc:	0800006f          	j	414c <__subsf3+0x3ac>
    40d0:	40f504b3          	sub	s1,a0,a5
    40d4:	00549713          	slli	a4,s1,0x5
    40d8:	04075463          	bgez	a4,4120 <__subsf3+0x380>
    40dc:	40a784b3          	sub	s1,a5,a0
    40e0:	00058413          	mv	s0,a1
    40e4:	00048513          	mv	a0,s1
    40e8:	590000ef          	jal	4678 <__clzsi2>
    40ec:	ffb50513          	addi	a0,a0,-5
    40f0:	00a494b3          	sll	s1,s1,a0
    40f4:	03254e63          	blt	a0,s2,4130 <__subsf3+0x390>
    40f8:	41250533          	sub	a0,a0,s2
    40fc:	00150513          	addi	a0,a0,1
    4100:	02000713          	li	a4,32
    4104:	40a70733          	sub	a4,a4,a0
    4108:	00a4d7b3          	srl	a5,s1,a0
    410c:	00e494b3          	sll	s1,s1,a4
    4110:	009034b3          	snez	s1,s1
    4114:	0097e7b3          	or	a5,a5,s1
    4118:	00000913          	li	s2,0
    411c:	e19ff06f          	j	3f34 <__subsf3+0x194>
    4120:	fc0492e3          	bnez	s1,40e4 <__subsf3+0x344>
    4124:	00000793          	li	a5,0
    4128:	00000913          	li	s2,0
    412c:	f5dff06f          	j	4088 <__subsf3+0x2e8>
    4130:	fc0007b7          	lui	a5,0xfc000
    4134:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
    4138:	40a90933          	sub	s2,s2,a0
    413c:	00f4f7b3          	and	a5,s1,a5
    4140:	df5ff06f          	j	3f34 <__subsf3+0x194>
    4144:	0ff00913          	li	s2,255
    4148:	00000793          	li	a5,0
    414c:	00579713          	slli	a4,a5,0x5
    4150:	00075e63          	bgez	a4,416c <__subsf3+0x3cc>
    4154:	00190913          	addi	s2,s2,1
    4158:	0ff00713          	li	a4,255
    415c:	06e90663          	beq	s2,a4,41c8 <__subsf3+0x428>
    4160:	fc000737          	lui	a4,0xfc000
    4164:	fff70713          	addi	a4,a4,-1 # fbffffff <_memory_end+0xfbfdffff>
    4168:	00e7f7b3          	and	a5,a5,a4
    416c:	0ff00713          	li	a4,255
    4170:	0037d793          	srli	a5,a5,0x3
    4174:	00e91863          	bne	s2,a4,4184 <__subsf3+0x3e4>
    4178:	00078663          	beqz	a5,4184 <__subsf3+0x3e4>
    417c:	004007b7          	lui	a5,0x400
    4180:	00000413          	li	s0,0
    4184:	00c12083          	lw	ra,12(sp)
    4188:	01791713          	slli	a4,s2,0x17
    418c:	01f41513          	slli	a0,s0,0x1f
    4190:	7f8006b7          	lui	a3,0x7f800
    4194:	00812403          	lw	s0,8(sp)
    4198:	00979793          	slli	a5,a5,0x9
    419c:	00d77733          	and	a4,a4,a3
    41a0:	0097d793          	srli	a5,a5,0x9
    41a4:	00f767b3          	or	a5,a4,a5
    41a8:	00412483          	lw	s1,4(sp)
    41ac:	00012903          	lw	s2,0(sp)
    41b0:	00a7e533          	or	a0,a5,a0
    41b4:	01010113          	addi	sp,sp,16
    41b8:	00008067          	ret
    41bc:	00070913          	mv	s2,a4
    41c0:	00058413          	mv	s0,a1
    41c4:	d71ff06f          	j	3f34 <__subsf3+0x194>
    41c8:	00000793          	li	a5,0
    41cc:	fa1ff06f          	j	416c <__subsf3+0x3cc>

000041d0 <__fixsfsi>:
    41d0:	00800637          	lui	a2,0x800
    41d4:	01755713          	srli	a4,a0,0x17
    41d8:	fff60793          	addi	a5,a2,-1 # 7fffff <_memory_end+0x7dffff>
    41dc:	0ff77713          	zext.b	a4,a4
    41e0:	07e00593          	li	a1,126
    41e4:	00a7f7b3          	and	a5,a5,a0
    41e8:	01f55693          	srli	a3,a0,0x1f
    41ec:	04e5d663          	bge	a1,a4,4238 <__fixsfsi+0x68>
    41f0:	09d00593          	li	a1,157
    41f4:	00e5da63          	bge	a1,a4,4208 <__fixsfsi+0x38>
    41f8:	80000537          	lui	a0,0x80000
    41fc:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
    4200:	00a68533          	add	a0,a3,a0
    4204:	00008067          	ret
    4208:	00c7e533          	or	a0,a5,a2
    420c:	09500793          	li	a5,149
    4210:	00e7dc63          	bge	a5,a4,4228 <__fixsfsi+0x58>
    4214:	f6a70713          	addi	a4,a4,-150
    4218:	00e51533          	sll	a0,a0,a4
    421c:	02068063          	beqz	a3,423c <__fixsfsi+0x6c>
    4220:	40a00533          	neg	a0,a0
    4224:	00008067          	ret
    4228:	09600793          	li	a5,150
    422c:	40e787b3          	sub	a5,a5,a4
    4230:	00f55533          	srl	a0,a0,a5
    4234:	fe9ff06f          	j	421c <__fixsfsi+0x4c>
    4238:	00000513          	li	a0,0
    423c:	00008067          	ret

00004240 <__floatsisf>:
    4240:	ff010113          	addi	sp,sp,-16
    4244:	00112623          	sw	ra,12(sp)
    4248:	00812423          	sw	s0,8(sp)
    424c:	00912223          	sw	s1,4(sp)
    4250:	00050793          	mv	a5,a0
    4254:	0e050063          	beqz	a0,4334 <__floatsisf+0xf4>
    4258:	41f55713          	srai	a4,a0,0x1f
    425c:	00a74433          	xor	s0,a4,a0
    4260:	40e40433          	sub	s0,s0,a4
    4264:	01f55493          	srli	s1,a0,0x1f
    4268:	00040513          	mv	a0,s0
    426c:	40c000ef          	jal	4678 <__clzsi2>
    4270:	09e00793          	li	a5,158
    4274:	40a787b3          	sub	a5,a5,a0
    4278:	09600713          	li	a4,150
    427c:	04f74063          	blt	a4,a5,42bc <__floatsisf+0x7c>
    4280:	00800713          	li	a4,8
    4284:	0ae50e63          	beq	a0,a4,4340 <__floatsisf+0x100>
    4288:	ff850513          	addi	a0,a0,-8
    428c:	00a41433          	sll	s0,s0,a0
    4290:	00941413          	slli	s0,s0,0x9
    4294:	00945413          	srli	s0,s0,0x9
    4298:	01779793          	slli	a5,a5,0x17
    429c:	00c12083          	lw	ra,12(sp)
    42a0:	0087e7b3          	or	a5,a5,s0
    42a4:	00812403          	lw	s0,8(sp)
    42a8:	01f49513          	slli	a0,s1,0x1f
    42ac:	00a7e533          	or	a0,a5,a0
    42b0:	00412483          	lw	s1,4(sp)
    42b4:	01010113          	addi	sp,sp,16
    42b8:	00008067          	ret
    42bc:	09900713          	li	a4,153
    42c0:	06f75463          	bge	a4,a5,4328 <__floatsisf+0xe8>
    42c4:	00500713          	li	a4,5
    42c8:	40a70733          	sub	a4,a4,a0
    42cc:	01b50693          	addi	a3,a0,27
    42d0:	00e45733          	srl	a4,s0,a4
    42d4:	00d41433          	sll	s0,s0,a3
    42d8:	00803433          	snez	s0,s0
    42dc:	00876733          	or	a4,a4,s0
    42e0:	fc000437          	lui	s0,0xfc000
    42e4:	fff40413          	addi	s0,s0,-1 # fbffffff <_memory_end+0xfbfdffff>
    42e8:	00777693          	andi	a3,a4,7
    42ec:	00877433          	and	s0,a4,s0
    42f0:	00068a63          	beqz	a3,4304 <__floatsisf+0xc4>
    42f4:	00f77713          	andi	a4,a4,15
    42f8:	00400693          	li	a3,4
    42fc:	00d70463          	beq	a4,a3,4304 <__floatsisf+0xc4>
    4300:	00440413          	addi	s0,s0,4
    4304:	00541713          	slli	a4,s0,0x5
    4308:	00075c63          	bgez	a4,4320 <__floatsisf+0xe0>
    430c:	fc0007b7          	lui	a5,0xfc000
    4310:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
    4314:	00f47433          	and	s0,s0,a5
    4318:	09f00793          	li	a5,159
    431c:	40a787b3          	sub	a5,a5,a0
    4320:	00345413          	srli	s0,s0,0x3
    4324:	f6dff06f          	j	4290 <__floatsisf+0x50>
    4328:	ffb50713          	addi	a4,a0,-5
    432c:	00e41733          	sll	a4,s0,a4
    4330:	fb1ff06f          	j	42e0 <__floatsisf+0xa0>
    4334:	00000493          	li	s1,0
    4338:	00000413          	li	s0,0
    433c:	f55ff06f          	j	4290 <__floatsisf+0x50>
    4340:	09600793          	li	a5,150
    4344:	f4dff06f          	j	4290 <__floatsisf+0x50>

00004348 <__floatunsisf>:
    4348:	ff010113          	addi	sp,sp,-16
    434c:	00812423          	sw	s0,8(sp)
    4350:	00112623          	sw	ra,12(sp)
    4354:	00050413          	mv	s0,a0
    4358:	00000713          	li	a4,0
    435c:	02050463          	beqz	a0,4384 <__floatunsisf+0x3c>
    4360:	318000ef          	jal	4678 <__clzsi2>
    4364:	09e00713          	li	a4,158
    4368:	40a70733          	sub	a4,a4,a0
    436c:	09600793          	li	a5,150
    4370:	02e7ca63          	blt	a5,a4,43a4 <__floatunsisf+0x5c>
    4374:	00800793          	li	a5,8
    4378:	0af50263          	beq	a0,a5,441c <__floatunsisf+0xd4>
    437c:	ff850513          	addi	a0,a0,-8
    4380:	00a41433          	sll	s0,s0,a0
    4384:	00941413          	slli	s0,s0,0x9
    4388:	00945413          	srli	s0,s0,0x9
    438c:	01771513          	slli	a0,a4,0x17
    4390:	00c12083          	lw	ra,12(sp)
    4394:	00856533          	or	a0,a0,s0
    4398:	00812403          	lw	s0,8(sp)
    439c:	01010113          	addi	sp,sp,16
    43a0:	00008067          	ret
    43a4:	09900793          	li	a5,153
    43a8:	06e7d463          	bge	a5,a4,4410 <__floatunsisf+0xc8>
    43ac:	01b50793          	addi	a5,a0,27
    43b0:	00500693          	li	a3,5
    43b4:	00f417b3          	sll	a5,s0,a5
    43b8:	40a686b3          	sub	a3,a3,a0
    43bc:	00f037b3          	snez	a5,a5
    43c0:	00d45433          	srl	s0,s0,a3
    43c4:	0087e7b3          	or	a5,a5,s0
    43c8:	fc000437          	lui	s0,0xfc000
    43cc:	fff40413          	addi	s0,s0,-1 # fbffffff <_memory_end+0xfbfdffff>
    43d0:	0077f693          	andi	a3,a5,7
    43d4:	0087f433          	and	s0,a5,s0
    43d8:	00068a63          	beqz	a3,43ec <__floatunsisf+0xa4>
    43dc:	00f7f793          	andi	a5,a5,15
    43e0:	00400693          	li	a3,4
    43e4:	00d78463          	beq	a5,a3,43ec <__floatunsisf+0xa4>
    43e8:	00440413          	addi	s0,s0,4
    43ec:	00541793          	slli	a5,s0,0x5
    43f0:	0007dc63          	bgez	a5,4408 <__floatunsisf+0xc0>
    43f4:	fc0007b7          	lui	a5,0xfc000
    43f8:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
    43fc:	09f00713          	li	a4,159
    4400:	00f47433          	and	s0,s0,a5
    4404:	40a70733          	sub	a4,a4,a0
    4408:	00345413          	srli	s0,s0,0x3
    440c:	f79ff06f          	j	4384 <__floatunsisf+0x3c>
    4410:	ffb50793          	addi	a5,a0,-5
    4414:	00f417b3          	sll	a5,s0,a5
    4418:	fb1ff06f          	j	43c8 <__floatunsisf+0x80>
    441c:	09600713          	li	a4,150
    4420:	f65ff06f          	j	4384 <__floatunsisf+0x3c>

00004424 <__extendsfdf2>:
    4424:	01755713          	srli	a4,a0,0x17
    4428:	0ff77713          	zext.b	a4,a4
    442c:	ff010113          	addi	sp,sp,-16
    4430:	00170793          	addi	a5,a4,1
    4434:	00812423          	sw	s0,8(sp)
    4438:	00912223          	sw	s1,4(sp)
    443c:	00951413          	slli	s0,a0,0x9
    4440:	00112623          	sw	ra,12(sp)
    4444:	0fe7f793          	andi	a5,a5,254
    4448:	00945413          	srli	s0,s0,0x9
    444c:	01f55493          	srli	s1,a0,0x1f
    4450:	04078263          	beqz	a5,4494 <__extendsfdf2+0x70>
    4454:	00345793          	srli	a5,s0,0x3
    4458:	38070713          	addi	a4,a4,896
    445c:	01d41413          	slli	s0,s0,0x1d
    4460:	00c79793          	slli	a5,a5,0xc
    4464:	00c7d793          	srli	a5,a5,0xc
    4468:	01471713          	slli	a4,a4,0x14
    446c:	01f49513          	slli	a0,s1,0x1f
    4470:	00f76733          	or	a4,a4,a5
    4474:	00c12083          	lw	ra,12(sp)
    4478:	00a767b3          	or	a5,a4,a0
    447c:	00040513          	mv	a0,s0
    4480:	00812403          	lw	s0,8(sp)
    4484:	00412483          	lw	s1,4(sp)
    4488:	00078593          	mv	a1,a5
    448c:	01010113          	addi	sp,sp,16
    4490:	00008067          	ret
    4494:	04071663          	bnez	a4,44e0 <__extendsfdf2+0xbc>
    4498:	00000793          	li	a5,0
    449c:	fc0402e3          	beqz	s0,4460 <__extendsfdf2+0x3c>
    44a0:	00040513          	mv	a0,s0
    44a4:	1d4000ef          	jal	4678 <__clzsi2>
    44a8:	00a00793          	li	a5,10
    44ac:	02a7c263          	blt	a5,a0,44d0 <__extendsfdf2+0xac>
    44b0:	00b00793          	li	a5,11
    44b4:	40a787b3          	sub	a5,a5,a0
    44b8:	01550713          	addi	a4,a0,21
    44bc:	00f457b3          	srl	a5,s0,a5
    44c0:	00e41433          	sll	s0,s0,a4
    44c4:	38900713          	li	a4,905
    44c8:	40a70733          	sub	a4,a4,a0
    44cc:	f95ff06f          	j	4460 <__extendsfdf2+0x3c>
    44d0:	ff550793          	addi	a5,a0,-11
    44d4:	00f417b3          	sll	a5,s0,a5
    44d8:	00000413          	li	s0,0
    44dc:	fe9ff06f          	j	44c4 <__extendsfdf2+0xa0>
    44e0:	00000793          	li	a5,0
    44e4:	00040a63          	beqz	s0,44f8 <__extendsfdf2+0xd4>
    44e8:	00345793          	srli	a5,s0,0x3
    44ec:	00080737          	lui	a4,0x80
    44f0:	01d41413          	slli	s0,s0,0x1d
    44f4:	00e7e7b3          	or	a5,a5,a4
    44f8:	7ff00713          	li	a4,2047
    44fc:	f65ff06f          	j	4460 <__extendsfdf2+0x3c>

00004500 <__truncdfsf2>:
    4500:	0145d613          	srli	a2,a1,0x14
    4504:	7ff67613          	andi	a2,a2,2047
    4508:	00c59793          	slli	a5,a1,0xc
    450c:	00160713          	addi	a4,a2,1
    4510:	0097d793          	srli	a5,a5,0x9
    4514:	01d55693          	srli	a3,a0,0x1d
    4518:	7fe77713          	andi	a4,a4,2046
    451c:	00f6e6b3          	or	a3,a3,a5
    4520:	01f5d593          	srli	a1,a1,0x1f
    4524:	00351793          	slli	a5,a0,0x3
    4528:	0a070663          	beqz	a4,45d4 <__truncdfsf2+0xd4>
    452c:	c8060713          	addi	a4,a2,-896
    4530:	0fe00813          	li	a6,254
    4534:	0ce84263          	blt	a6,a4,45f8 <__truncdfsf2+0xf8>
    4538:	08e04063          	bgtz	a4,45b8 <__truncdfsf2+0xb8>
    453c:	fe900513          	li	a0,-23
    4540:	10a74a63          	blt	a4,a0,4654 <__truncdfsf2+0x154>
    4544:	00800537          	lui	a0,0x800
    4548:	00a6e6b3          	or	a3,a3,a0
    454c:	01e00513          	li	a0,30
    4550:	40e50533          	sub	a0,a0,a4
    4554:	01f00813          	li	a6,31
    4558:	02a84863          	blt	a6,a0,4588 <__truncdfsf2+0x88>
    455c:	c8260613          	addi	a2,a2,-894
    4560:	00a7d533          	srl	a0,a5,a0
    4564:	00c797b3          	sll	a5,a5,a2
    4568:	00f037b3          	snez	a5,a5
    456c:	00c696b3          	sll	a3,a3,a2
    4570:	00d7e7b3          	or	a5,a5,a3
    4574:	00f567b3          	or	a5,a0,a5
    4578:	00000713          	li	a4,0
    457c:	0077f693          	andi	a3,a5,7
    4580:	08068063          	beqz	a3,4600 <__truncdfsf2+0x100>
    4584:	0d80006f          	j	465c <__truncdfsf2+0x15c>
    4588:	ffe00813          	li	a6,-2
    458c:	40e80833          	sub	a6,a6,a4
    4590:	02000893          	li	a7,32
    4594:	0106d833          	srl	a6,a3,a6
    4598:	00000713          	li	a4,0
    459c:	01150663          	beq	a0,a7,45a8 <__truncdfsf2+0xa8>
    45a0:	ca260613          	addi	a2,a2,-862
    45a4:	00c69733          	sll	a4,a3,a2
    45a8:	00f76733          	or	a4,a4,a5
    45ac:	00e03733          	snez	a4,a4
    45b0:	00e867b3          	or	a5,a6,a4
    45b4:	fc5ff06f          	j	4578 <__truncdfsf2+0x78>
    45b8:	00651513          	slli	a0,a0,0x6
    45bc:	00a03533          	snez	a0,a0
    45c0:	00369693          	slli	a3,a3,0x3
    45c4:	01d7d793          	srli	a5,a5,0x1d
    45c8:	00d566b3          	or	a3,a0,a3
    45cc:	00f6e7b3          	or	a5,a3,a5
    45d0:	fadff06f          	j	457c <__truncdfsf2+0x7c>
    45d4:	00f6e7b3          	or	a5,a3,a5
    45d8:	00061663          	bnez	a2,45e4 <__truncdfsf2+0xe4>
    45dc:	00f037b3          	snez	a5,a5
    45e0:	f99ff06f          	j	4578 <__truncdfsf2+0x78>
    45e4:	0ff00713          	li	a4,255
    45e8:	00078c63          	beqz	a5,4600 <__truncdfsf2+0x100>
    45ec:	00369693          	slli	a3,a3,0x3
    45f0:	020007b7          	lui	a5,0x2000
    45f4:	fd9ff06f          	j	45cc <__truncdfsf2+0xcc>
    45f8:	00000793          	li	a5,0
    45fc:	0ff00713          	li	a4,255
    4600:	00579693          	slli	a3,a5,0x5
    4604:	0006de63          	bgez	a3,4620 <__truncdfsf2+0x120>
    4608:	00170713          	addi	a4,a4,1 # 80001 <_memory_end+0x60001>
    460c:	0ff00693          	li	a3,255
    4610:	06d70063          	beq	a4,a3,4670 <__truncdfsf2+0x170>
    4614:	fc0006b7          	lui	a3,0xfc000
    4618:	fff68693          	addi	a3,a3,-1 # fbffffff <_memory_end+0xfbfdffff>
    461c:	00d7f7b3          	and	a5,a5,a3
    4620:	0ff00693          	li	a3,255
    4624:	0037d793          	srli	a5,a5,0x3
    4628:	00d71863          	bne	a4,a3,4638 <__truncdfsf2+0x138>
    462c:	00078663          	beqz	a5,4638 <__truncdfsf2+0x138>
    4630:	004007b7          	lui	a5,0x400
    4634:	00000593          	li	a1,0
    4638:	7f8006b7          	lui	a3,0x7f800
    463c:	01771713          	slli	a4,a4,0x17
    4640:	00d77733          	and	a4,a4,a3
    4644:	00f76733          	or	a4,a4,a5
    4648:	01f59513          	slli	a0,a1,0x1f
    464c:	00a76533          	or	a0,a4,a0
    4650:	00008067          	ret
    4654:	00100793          	li	a5,1
    4658:	00000713          	li	a4,0
    465c:	00f7f693          	andi	a3,a5,15
    4660:	00400613          	li	a2,4
    4664:	f8c68ee3          	beq	a3,a2,4600 <__truncdfsf2+0x100>
    4668:	00478793          	addi	a5,a5,4 # 400004 <_memory_end+0x3e0004>
    466c:	f95ff06f          	j	4600 <__truncdfsf2+0x100>
    4670:	00000793          	li	a5,0
    4674:	fadff06f          	j	4620 <__truncdfsf2+0x120>

00004678 <__clzsi2>:
    4678:	000107b7          	lui	a5,0x10
    467c:	02f57863          	bgeu	a0,a5,46ac <__clzsi2+0x34>
    4680:	10053793          	sltiu	a5,a0,256
    4684:	0017b793          	seqz	a5,a5
    4688:	00379793          	slli	a5,a5,0x3
    468c:	02000693          	li	a3,32
    4690:	40f686b3          	sub	a3,a3,a5
    4694:	00f55533          	srl	a0,a0,a5
    4698:	3d418793          	addi	a5,gp,980 # 4a94 <__clz_tab>
    469c:	00a787b3          	add	a5,a5,a0
    46a0:	0007c503          	lbu	a0,0(a5) # 10000 <_bss_end+0xb3fc>
    46a4:	40a68533          	sub	a0,a3,a0
    46a8:	00008067          	ret
    46ac:	01000737          	lui	a4,0x1000
    46b0:	01800793          	li	a5,24
    46b4:	fce57ce3          	bgeu	a0,a4,468c <__clzsi2+0x14>
    46b8:	01000793          	li	a5,16
    46bc:	fd1ff06f          	j	468c <__clzsi2+0x14>
