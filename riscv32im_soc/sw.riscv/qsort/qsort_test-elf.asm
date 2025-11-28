
qsort_test.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00002197          	auipc	gp,0x2
       4:	7a818193          	addi	gp,gp,1960 # 27a8 <__global_pointer$>
       8:	00020117          	auipc	sp,0x20
       c:	ff810113          	addi	sp,sp,-8 # 20000 <_memory_end>
      10:	23818e13          	addi	t3,gp,568 # 29e0 <DP>
      14:	33818e93          	addi	t4,gp,824 # 2ae0 <_bss_end>
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
      3c:	20018313          	addi	t1,gp,512 # 29a8 <tohost>
      40:	00532023          	sw	t0,0(t1)
      44:	0000006f          	j	44 <terminate+0xc>

00000048 <main>:
      48:	fe010113          	addi	sp,sp,-32
      4c:	00112e23          	sw	ra,28(sp)
      50:	00812c23          	sw	s0,24(sp)
      54:	02010413          	addi	s0,sp,32
      58:	900207b7          	lui	a5,0x90020
      5c:	fef42623          	sw	a5,-20(s0)
      60:	0001c7b7          	lui	a5,0x1c
      64:	20078793          	addi	a5,a5,512 # 1c200 <_bss_end+0x19720>
      68:	fef42423          	sw	a5,-24(s0)
      6c:	fec42503          	lw	a0,-20(s0)
      70:	270010ef          	jal	12e0 <uart_set_addr>
      74:	00100713          	li	a4,1
      78:	00000693          	li	a3,0
      7c:	00800613          	li	a2,8
      80:	fe842583          	lw	a1,-24(s0)
      84:	05f5e7b7          	lui	a5,0x5f5e
      88:	10078513          	addi	a0,a5,256 # 5f5e100 <_memory_end+0x5f3e100>
      8c:	445000ef          	jal	cd0 <uart_init>
      90:	024000ef          	jal	b4 <qsort_main>
      94:	00018513          	mv	a0,gp
      98:	7a9000ef          	jal	1040 <uart_put_string>
      9c:	00000793          	li	a5,0
      a0:	00078513          	mv	a0,a5
      a4:	01c12083          	lw	ra,28(sp)
      a8:	01812403          	lw	s0,24(sp)
      ac:	02010113          	addi	sp,sp,32
      b0:	00008067          	ret

000000b4 <qsort_main>:
      b4:	ff010113          	addi	sp,sp,-16
      b8:	00112623          	sw	ra,12(sp)
      bc:	00812423          	sw	s0,8(sp)
      c0:	01010413          	addi	s0,sp,16
      c4:	2101a783          	lw	a5,528(gp) # 29b8 <size>
      c8:	00078593          	mv	a1,a5
      cc:	00c18513          	addi	a0,gp,12 # 27b4 <__global_pointer$+0xc>
      d0:	5d4000ef          	jal	6a4 <my_printf>
      d4:	2101a783          	lw	a5,528(gp) # 29b8 <size>
      d8:	00078593          	mv	a1,a5
      dc:	23818513          	addi	a0,gp,568 # 29e0 <DP>
      e0:	274000ef          	jal	354 <make_data>
      e4:	2101a783          	lw	a5,528(gp) # 29b8 <size>
      e8:	fff78793          	addi	a5,a5,-1
      ec:	00078613          	mv	a2,a5
      f0:	00000593          	li	a1,0
      f4:	23818513          	addi	a0,gp,568 # 29e0 <DP>
      f8:	038000ef          	jal	130 <qsort>
      fc:	2101a783          	lw	a5,528(gp) # 29b8 <size>
     100:	00078593          	mv	a1,a5
     104:	23818513          	addi	a0,gp,568 # 29e0 <DP>
     108:	2c4000ef          	jal	3cc <test>
     10c:	2101a783          	lw	a5,528(gp) # 29b8 <size>
     110:	00078593          	mv	a1,a5
     114:	23818513          	addi	a0,gp,568 # 29e0 <DP>
     118:	368000ef          	jal	480 <output>
     11c:	00000013          	nop
     120:	00c12083          	lw	ra,12(sp)
     124:	00812403          	lw	s0,8(sp)
     128:	01010113          	addi	sp,sp,16
     12c:	00008067          	ret

00000130 <qsort>:
     130:	fd010113          	addi	sp,sp,-48
     134:	02112623          	sw	ra,44(sp)
     138:	02812423          	sw	s0,40(sp)
     13c:	03010413          	addi	s0,sp,48
     140:	fca42e23          	sw	a0,-36(s0)
     144:	fcb42c23          	sw	a1,-40(s0)
     148:	fcc42a23          	sw	a2,-44(s0)
     14c:	fd842703          	lw	a4,-40(s0)
     150:	fd442783          	lw	a5,-44(s0)
     154:	04f75463          	bge	a4,a5,19c <qsort+0x6c>
     158:	fd442603          	lw	a2,-44(s0)
     15c:	fd842583          	lw	a1,-40(s0)
     160:	fdc42503          	lw	a0,-36(s0)
     164:	04c000ef          	jal	1b0 <partition>
     168:	fea42623          	sw	a0,-20(s0)
     16c:	fec42783          	lw	a5,-20(s0)
     170:	fff78793          	addi	a5,a5,-1
     174:	00078613          	mv	a2,a5
     178:	fd842583          	lw	a1,-40(s0)
     17c:	fdc42503          	lw	a0,-36(s0)
     180:	fb1ff0ef          	jal	130 <qsort>
     184:	fec42783          	lw	a5,-20(s0)
     188:	00178793          	addi	a5,a5,1
     18c:	fd442603          	lw	a2,-44(s0)
     190:	00078593          	mv	a1,a5
     194:	fdc42503          	lw	a0,-36(s0)
     198:	f99ff0ef          	jal	130 <qsort>
     19c:	00000013          	nop
     1a0:	02c12083          	lw	ra,44(sp)
     1a4:	02812403          	lw	s0,40(sp)
     1a8:	03010113          	addi	sp,sp,48
     1ac:	00008067          	ret

000001b0 <partition>:
     1b0:	fd010113          	addi	sp,sp,-48
     1b4:	02112623          	sw	ra,44(sp)
     1b8:	02812423          	sw	s0,40(sp)
     1bc:	03010413          	addi	s0,sp,48
     1c0:	fca42e23          	sw	a0,-36(s0)
     1c4:	fcb42c23          	sw	a1,-40(s0)
     1c8:	fcc42a23          	sw	a2,-44(s0)
     1cc:	fd842783          	lw	a5,-40(s0)
     1d0:	fef42623          	sw	a5,-20(s0)
     1d4:	fd842783          	lw	a5,-40(s0)
     1d8:	00178793          	addi	a5,a5,1
     1dc:	fcf42c23          	sw	a5,-40(s0)
     1e0:	0940006f          	j	274 <partition+0xc4>
     1e4:	fd842783          	lw	a5,-40(s0)
     1e8:	00178793          	addi	a5,a5,1
     1ec:	fcf42c23          	sw	a5,-40(s0)
     1f0:	fd842783          	lw	a5,-40(s0)
     1f4:	00279793          	slli	a5,a5,0x2
     1f8:	fdc42703          	lw	a4,-36(s0)
     1fc:	00f707b3          	add	a5,a4,a5
     200:	0007a703          	lw	a4,0(a5)
     204:	fec42783          	lw	a5,-20(s0)
     208:	00279793          	slli	a5,a5,0x2
     20c:	fdc42683          	lw	a3,-36(s0)
     210:	00f687b3          	add	a5,a3,a5
     214:	0007a783          	lw	a5,0(a5)
     218:	fce7d6e3          	bge	a5,a4,1e4 <partition+0x34>
     21c:	0100006f          	j	22c <partition+0x7c>
     220:	fd442783          	lw	a5,-44(s0)
     224:	fff78793          	addi	a5,a5,-1
     228:	fcf42a23          	sw	a5,-44(s0)
     22c:	fec42783          	lw	a5,-20(s0)
     230:	00279793          	slli	a5,a5,0x2
     234:	fdc42703          	lw	a4,-36(s0)
     238:	00f707b3          	add	a5,a4,a5
     23c:	0007a703          	lw	a4,0(a5)
     240:	fd442783          	lw	a5,-44(s0)
     244:	00279793          	slli	a5,a5,0x2
     248:	fdc42683          	lw	a3,-36(s0)
     24c:	00f687b3          	add	a5,a3,a5
     250:	0007a783          	lw	a5,0(a5)
     254:	fcf746e3          	blt	a4,a5,220 <partition+0x70>
     258:	fd842703          	lw	a4,-40(s0)
     25c:	fd442783          	lw	a5,-44(s0)
     260:	00f75a63          	bge	a4,a5,274 <partition+0xc4>
     264:	fd442603          	lw	a2,-44(s0)
     268:	fd842583          	lw	a1,-40(s0)
     26c:	fdc42503          	lw	a0,-36(s0)
     270:	064000ef          	jal	2d4 <swap>
     274:	fd842703          	lw	a4,-40(s0)
     278:	fd442783          	lw	a5,-44(s0)
     27c:	f6f74ae3          	blt	a4,a5,1f0 <partition+0x40>
     280:	fec42783          	lw	a5,-20(s0)
     284:	00279793          	slli	a5,a5,0x2
     288:	fdc42703          	lw	a4,-36(s0)
     28c:	00f707b3          	add	a5,a4,a5
     290:	0007a703          	lw	a4,0(a5)
     294:	fd442783          	lw	a5,-44(s0)
     298:	00279793          	slli	a5,a5,0x2
     29c:	fdc42683          	lw	a3,-36(s0)
     2a0:	00f687b3          	add	a5,a3,a5
     2a4:	0007a783          	lw	a5,0(a5)
     2a8:	00e7da63          	bge	a5,a4,2bc <partition+0x10c>
     2ac:	fd442603          	lw	a2,-44(s0)
     2b0:	fec42583          	lw	a1,-20(s0)
     2b4:	fdc42503          	lw	a0,-36(s0)
     2b8:	01c000ef          	jal	2d4 <swap>
     2bc:	fd442783          	lw	a5,-44(s0)
     2c0:	00078513          	mv	a0,a5
     2c4:	02c12083          	lw	ra,44(sp)
     2c8:	02812403          	lw	s0,40(sp)
     2cc:	03010113          	addi	sp,sp,48
     2d0:	00008067          	ret

000002d4 <swap>:
     2d4:	fd010113          	addi	sp,sp,-48
     2d8:	02812623          	sw	s0,44(sp)
     2dc:	03010413          	addi	s0,sp,48
     2e0:	fca42e23          	sw	a0,-36(s0)
     2e4:	fcb42c23          	sw	a1,-40(s0)
     2e8:	fcc42a23          	sw	a2,-44(s0)
     2ec:	fd842783          	lw	a5,-40(s0)
     2f0:	00279793          	slli	a5,a5,0x2
     2f4:	fdc42703          	lw	a4,-36(s0)
     2f8:	00f707b3          	add	a5,a4,a5
     2fc:	0007a783          	lw	a5,0(a5)
     300:	fef42623          	sw	a5,-20(s0)
     304:	fd442783          	lw	a5,-44(s0)
     308:	00279793          	slli	a5,a5,0x2
     30c:	fdc42703          	lw	a4,-36(s0)
     310:	00f70733          	add	a4,a4,a5
     314:	fd842783          	lw	a5,-40(s0)
     318:	00279793          	slli	a5,a5,0x2
     31c:	fdc42683          	lw	a3,-36(s0)
     320:	00f687b3          	add	a5,a3,a5
     324:	00072703          	lw	a4,0(a4)
     328:	00e7a023          	sw	a4,0(a5)
     32c:	fd442783          	lw	a5,-44(s0)
     330:	00279793          	slli	a5,a5,0x2
     334:	fdc42703          	lw	a4,-36(s0)
     338:	00f707b3          	add	a5,a4,a5
     33c:	fec42703          	lw	a4,-20(s0)
     340:	00e7a023          	sw	a4,0(a5)
     344:	00000013          	nop
     348:	02c12403          	lw	s0,44(sp)
     34c:	03010113          	addi	sp,sp,48
     350:	00008067          	ret

00000354 <make_data>:
     354:	fd010113          	addi	sp,sp,-48
     358:	02112623          	sw	ra,44(sp)
     35c:	02812423          	sw	s0,40(sp)
     360:	03010413          	addi	s0,sp,48
     364:	fca42e23          	sw	a0,-36(s0)
     368:	fcb42c23          	sw	a1,-40(s0)
     36c:	fe042623          	sw	zero,-20(s0)
     370:	0380006f          	j	3a8 <make_data+0x54>
     374:	1a4000ef          	jal	518 <rand>
     378:	00050693          	mv	a3,a0
     37c:	fec42783          	lw	a5,-20(s0)
     380:	00279793          	slli	a5,a5,0x2
     384:	fdc42703          	lw	a4,-36(s0)
     388:	00f707b3          	add	a5,a4,a5
     38c:	00010737          	lui	a4,0x10
     390:	fff70713          	addi	a4,a4,-1 # ffff <_bss_end+0xd51f>
     394:	00e6f733          	and	a4,a3,a4
     398:	00e7a023          	sw	a4,0(a5)
     39c:	fec42783          	lw	a5,-20(s0)
     3a0:	00178793          	addi	a5,a5,1
     3a4:	fef42623          	sw	a5,-20(s0)
     3a8:	fec42703          	lw	a4,-20(s0)
     3ac:	fd842783          	lw	a5,-40(s0)
     3b0:	fcf742e3          	blt	a4,a5,374 <make_data+0x20>
     3b4:	00000013          	nop
     3b8:	00000013          	nop
     3bc:	02c12083          	lw	ra,44(sp)
     3c0:	02812403          	lw	s0,40(sp)
     3c4:	03010113          	addi	sp,sp,48
     3c8:	00008067          	ret

000003cc <test>:
     3cc:	fd010113          	addi	sp,sp,-48
     3d0:	02112623          	sw	ra,44(sp)
     3d4:	02812423          	sw	s0,40(sp)
     3d8:	03010413          	addi	s0,sp,48
     3dc:	fca42e23          	sw	a0,-36(s0)
     3e0:	fcb42c23          	sw	a1,-40(s0)
     3e4:	fe042423          	sw	zero,-24(s0)
     3e8:	fe042623          	sw	zero,-20(s0)
     3ec:	04c0006f          	j	438 <test+0x6c>
     3f0:	fec42783          	lw	a5,-20(s0)
     3f4:	00279793          	slli	a5,a5,0x2
     3f8:	fdc42703          	lw	a4,-36(s0)
     3fc:	00f707b3          	add	a5,a4,a5
     400:	0007a703          	lw	a4,0(a5)
     404:	fec42783          	lw	a5,-20(s0)
     408:	00178793          	addi	a5,a5,1
     40c:	00279793          	slli	a5,a5,0x2
     410:	fdc42683          	lw	a3,-36(s0)
     414:	00f687b3          	add	a5,a3,a5
     418:	0007a783          	lw	a5,0(a5)
     41c:	00e7d863          	bge	a5,a4,42c <test+0x60>
     420:	fe842783          	lw	a5,-24(s0)
     424:	00178793          	addi	a5,a5,1
     428:	fef42423          	sw	a5,-24(s0)
     42c:	fec42783          	lw	a5,-20(s0)
     430:	00178793          	addi	a5,a5,1
     434:	fef42623          	sw	a5,-20(s0)
     438:	fd842783          	lw	a5,-40(s0)
     43c:	fff78793          	addi	a5,a5,-1
     440:	fec42703          	lw	a4,-20(s0)
     444:	faf746e3          	blt	a4,a5,3f0 <test+0x24>
     448:	fe842783          	lw	a5,-24(s0)
     44c:	00078a63          	beqz	a5,460 <test+0x94>
     450:	fe842583          	lw	a1,-24(s0)
     454:	02818513          	addi	a0,gp,40 # 27d0 <__global_pointer$+0x28>
     458:	24c000ef          	jal	6a4 <my_printf>
     45c:	0100006f          	j	46c <test+0xa0>
     460:	fd842583          	lw	a1,-40(s0)
     464:	04c18513          	addi	a0,gp,76 # 27f4 <__global_pointer$+0x4c>
     468:	23c000ef          	jal	6a4 <my_printf>
     46c:	00000013          	nop
     470:	02c12083          	lw	ra,44(sp)
     474:	02812403          	lw	s0,40(sp)
     478:	03010113          	addi	sp,sp,48
     47c:	00008067          	ret

00000480 <output>:
     480:	fd010113          	addi	sp,sp,-48
     484:	02112623          	sw	ra,44(sp)
     488:	02812423          	sw	s0,40(sp)
     48c:	03010413          	addi	s0,sp,48
     490:	fca42e23          	sw	a0,-36(s0)
     494:	fcb42c23          	sw	a1,-40(s0)
     498:	06418513          	addi	a0,gp,100 # 280c <__global_pointer$+0x64>
     49c:	208000ef          	jal	6a4 <my_printf>
     4a0:	fe042623          	sw	zero,-20(s0)
     4a4:	04c0006f          	j	4f0 <output+0x70>
     4a8:	fec42783          	lw	a5,-20(s0)
     4ac:	00279793          	slli	a5,a5,0x2
     4b0:	fdc42703          	lw	a4,-36(s0)
     4b4:	00f707b3          	add	a5,a4,a5
     4b8:	0007a783          	lw	a5,0(a5)
     4bc:	00078593          	mv	a1,a5
     4c0:	07818513          	addi	a0,gp,120 # 2820 <__global_pointer$+0x78>
     4c4:	1e0000ef          	jal	6a4 <my_printf>
     4c8:	fec42703          	lw	a4,-20(s0)
     4cc:	00a00793          	li	a5,10
     4d0:	02f76733          	rem	a4,a4,a5
     4d4:	00900793          	li	a5,9
     4d8:	00f71663          	bne	a4,a5,4e4 <output+0x64>
     4dc:	08018513          	addi	a0,gp,128 # 2828 <__global_pointer$+0x80>
     4e0:	1c4000ef          	jal	6a4 <my_printf>
     4e4:	fec42783          	lw	a5,-20(s0)
     4e8:	00178793          	addi	a5,a5,1
     4ec:	fef42623          	sw	a5,-20(s0)
     4f0:	fec42703          	lw	a4,-20(s0)
     4f4:	fd842783          	lw	a5,-40(s0)
     4f8:	faf748e3          	blt	a4,a5,4a8 <output+0x28>
     4fc:	08018513          	addi	a0,gp,128 # 2828 <__global_pointer$+0x80>
     500:	1a4000ef          	jal	6a4 <my_printf>
     504:	00000013          	nop
     508:	02c12083          	lw	ra,44(sp)
     50c:	02812403          	lw	s0,40(sp)
     510:	03010113          	addi	sp,sp,48
     514:	00008067          	ret

00000518 <rand>:
     518:	ff010113          	addi	sp,sp,-16
     51c:	00812623          	sw	s0,12(sp)
     520:	01010413          	addi	s0,sp,16
     524:	2141a703          	lw	a4,532(gp) # 29bc <_Randseed>
     528:	41c657b7          	lui	a5,0x41c65
     52c:	e6d78793          	addi	a5,a5,-403 # 41c64e6d <_memory_end+0x41c44e6d>
     530:	02f70733          	mul	a4,a4,a5
     534:	000037b7          	lui	a5,0x3
     538:	03978793          	addi	a5,a5,57 # 3039 <_bss_end+0x559>
     53c:	00f70733          	add	a4,a4,a5
     540:	20e1aa23          	sw	a4,532(gp) # 29bc <_Randseed>
     544:	2141a783          	lw	a5,532(gp) # 29bc <_Randseed>
     548:	0107d793          	srli	a5,a5,0x10
     54c:	00078713          	mv	a4,a5
     550:	000087b7          	lui	a5,0x8
     554:	fff78793          	addi	a5,a5,-1 # 7fff <_bss_end+0x551f>
     558:	00f777b3          	and	a5,a4,a5
     55c:	00078513          	mv	a0,a5
     560:	00c12403          	lw	s0,12(sp)
     564:	01010113          	addi	sp,sp,16
     568:	00008067          	ret

0000056c <srand>:
     56c:	fe010113          	addi	sp,sp,-32
     570:	00812e23          	sw	s0,28(sp)
     574:	02010413          	addi	s0,sp,32
     578:	fea42623          	sw	a0,-20(s0)
     57c:	fec42703          	lw	a4,-20(s0)
     580:	20e1aa23          	sw	a4,532(gp) # 29bc <_Randseed>
     584:	00000013          	nop
     588:	01c12403          	lw	s0,28(sp)
     58c:	02010113          	addi	sp,sp,32
     590:	00008067          	ret

00000594 <my_putc>:
     594:	fe010113          	addi	sp,sp,-32
     598:	00112e23          	sw	ra,28(sp)
     59c:	00812c23          	sw	s0,24(sp)
     5a0:	02010413          	addi	s0,sp,32
     5a4:	fea42623          	sw	a0,-20(s0)
     5a8:	feb42423          	sw	a1,-24(s0)
     5ac:	fec42783          	lw	a5,-20(s0)
     5b0:	0ff7f793          	zext.b	a5,a5
     5b4:	00078513          	mv	a0,a5
     5b8:	229000ef          	jal	fe0 <uart_put_char>
     5bc:	00050793          	mv	a5,a0
     5c0:	00078513          	mv	a0,a5
     5c4:	01c12083          	lw	ra,28(sp)
     5c8:	01812403          	lw	s0,24(sp)
     5cc:	02010113          	addi	sp,sp,32
     5d0:	00008067          	ret

000005d4 <my_putchar>:
     5d4:	fe010113          	addi	sp,sp,-32
     5d8:	00112e23          	sw	ra,28(sp)
     5dc:	00812c23          	sw	s0,24(sp)
     5e0:	02010413          	addi	s0,sp,32
     5e4:	fea42623          	sw	a0,-20(s0)
     5e8:	fec42783          	lw	a5,-20(s0)
     5ec:	0ff7f793          	zext.b	a5,a5
     5f0:	00078513          	mv	a0,a5
     5f4:	1ed000ef          	jal	fe0 <uart_put_char>
     5f8:	00050793          	mv	a5,a0
     5fc:	00078513          	mv	a0,a5
     600:	01c12083          	lw	ra,28(sp)
     604:	01812403          	lw	s0,24(sp)
     608:	02010113          	addi	sp,sp,32
     60c:	00008067          	ret

00000610 <my_getc>:
     610:	fe010113          	addi	sp,sp,-32
     614:	00112e23          	sw	ra,28(sp)
     618:	00812c23          	sw	s0,24(sp)
     61c:	02010413          	addi	s0,sp,32
     620:	fea42623          	sw	a0,-20(s0)
     624:	17d000ef          	jal	fa0 <uart_get_char>
     628:	00050793          	mv	a5,a0
     62c:	00078513          	mv	a0,a5
     630:	01c12083          	lw	ra,28(sp)
     634:	01812403          	lw	s0,24(sp)
     638:	02010113          	addi	sp,sp,32
     63c:	00008067          	ret

00000640 <my_getchar>:
     640:	ff010113          	addi	sp,sp,-16
     644:	00112623          	sw	ra,12(sp)
     648:	00812423          	sw	s0,8(sp)
     64c:	01010413          	addi	s0,sp,16
     650:	151000ef          	jal	fa0 <uart_get_char>
     654:	00050793          	mv	a5,a0
     658:	00078513          	mv	a0,a5
     65c:	00c12083          	lw	ra,12(sp)
     660:	00812403          	lw	s0,8(sp)
     664:	01010113          	addi	sp,sp,16
     668:	00008067          	ret

0000066c <my_puts>:
     66c:	fd010113          	addi	sp,sp,-48
     670:	02112623          	sw	ra,44(sp)
     674:	02812423          	sw	s0,40(sp)
     678:	03010413          	addi	s0,sp,48
     67c:	fca42e23          	sw	a0,-36(s0)
     680:	fdc42503          	lw	a0,-36(s0)
     684:	1bd000ef          	jal	1040 <uart_put_string>
     688:	fea42623          	sw	a0,-20(s0)
     68c:	fec42783          	lw	a5,-20(s0)
     690:	00078513          	mv	a0,a5
     694:	02c12083          	lw	ra,44(sp)
     698:	02812403          	lw	s0,40(sp)
     69c:	03010113          	addi	sp,sp,48
     6a0:	00008067          	ret

000006a4 <my_printf>:
     6a4:	fb010113          	addi	sp,sp,-80
     6a8:	02112623          	sw	ra,44(sp)
     6ac:	02812423          	sw	s0,40(sp)
     6b0:	03010413          	addi	s0,sp,48
     6b4:	fca42e23          	sw	a0,-36(s0)
     6b8:	00b42223          	sw	a1,4(s0)
     6bc:	00c42423          	sw	a2,8(s0)
     6c0:	00d42623          	sw	a3,12(s0)
     6c4:	00e42823          	sw	a4,16(s0)
     6c8:	00f42a23          	sw	a5,20(s0)
     6cc:	01042c23          	sw	a6,24(s0)
     6d0:	01142e23          	sw	a7,28(s0)
     6d4:	02040793          	addi	a5,s0,32
     6d8:	fcf42c23          	sw	a5,-40(s0)
     6dc:	fd842783          	lw	a5,-40(s0)
     6e0:	fe478793          	addi	a5,a5,-28
     6e4:	fef42423          	sw	a5,-24(s0)
     6e8:	fe842783          	lw	a5,-24(s0)
     6ec:	00078593          	mv	a1,a5
     6f0:	fdc42503          	lw	a0,-36(s0)
     6f4:	28c000ef          	jal	980 <my_vprintf>
     6f8:	fea42623          	sw	a0,-20(s0)
     6fc:	fec42783          	lw	a5,-20(s0)
     700:	00078513          	mv	a0,a5
     704:	02c12083          	lw	ra,44(sp)
     708:	02812403          	lw	s0,40(sp)
     70c:	05010113          	addi	sp,sp,80
     710:	00008067          	ret

00000714 <my_printn>:
     714:	fd010113          	addi	sp,sp,-48
     718:	02112623          	sw	ra,44(sp)
     71c:	02812423          	sw	s0,40(sp)
     720:	03010413          	addi	s0,sp,48
     724:	fca42e23          	sw	a0,-36(s0)
     728:	fcb42c23          	sw	a1,-40(s0)
     72c:	fcc42a23          	sw	a2,-44(s0)
     730:	fe042623          	sw	zero,-20(s0)
     734:	fd842703          	lw	a4,-40(s0)
     738:	00a00793          	li	a5,10
     73c:	02f71863          	bne	a4,a5,76c <my_printn+0x58>
     740:	fdc42783          	lw	a5,-36(s0)
     744:	0207d463          	bgez	a5,76c <my_printn+0x58>
     748:	02d00513          	li	a0,45
     74c:	095000ef          	jal	fe0 <uart_put_char>
     750:	00050713          	mv	a4,a0
     754:	fec42783          	lw	a5,-20(s0)
     758:	00f707b3          	add	a5,a4,a5
     75c:	fef42623          	sw	a5,-20(s0)
     760:	fdc42783          	lw	a5,-36(s0)
     764:	40f007b3          	neg	a5,a5
     768:	fcf42e23          	sw	a5,-36(s0)
     76c:	fd842783          	lw	a5,-40(s0)
     770:	fdc42703          	lw	a4,-36(s0)
     774:	02f757b3          	divu	a5,a4,a5
     778:	fef42423          	sw	a5,-24(s0)
     77c:	fe842783          	lw	a5,-24(s0)
     780:	00079863          	bnez	a5,790 <my_printn+0x7c>
     784:	fd442703          	lw	a4,-44(s0)
     788:	00100793          	li	a5,1
     78c:	02e7d863          	bge	a5,a4,7bc <my_printn+0xa8>
     790:	fd442783          	lw	a5,-44(s0)
     794:	fff78793          	addi	a5,a5,-1
     798:	fcf42a23          	sw	a5,-44(s0)
     79c:	fd442603          	lw	a2,-44(s0)
     7a0:	fd842583          	lw	a1,-40(s0)
     7a4:	fe842503          	lw	a0,-24(s0)
     7a8:	f6dff0ef          	jal	714 <my_printn>
     7ac:	00050713          	mv	a4,a0
     7b0:	fec42783          	lw	a5,-20(s0)
     7b4:	00e787b3          	add	a5,a5,a4
     7b8:	fef42623          	sw	a5,-20(s0)
     7bc:	fd842783          	lw	a5,-40(s0)
     7c0:	fdc42703          	lw	a4,-36(s0)
     7c4:	02f777b3          	remu	a5,a4,a5
     7c8:	00078713          	mv	a4,a5
     7cc:	08418793          	addi	a5,gp,132 # 282c <__global_pointer$+0x84>
     7d0:	00e787b3          	add	a5,a5,a4
     7d4:	0007c783          	lbu	a5,0(a5)
     7d8:	00078513          	mv	a0,a5
     7dc:	005000ef          	jal	fe0 <uart_put_char>
     7e0:	00050713          	mv	a4,a0
     7e4:	fec42783          	lw	a5,-20(s0)
     7e8:	00f707b3          	add	a5,a4,a5
     7ec:	fef42623          	sw	a5,-20(s0)
     7f0:	fec42783          	lw	a5,-20(s0)
     7f4:	00078513          	mv	a0,a5
     7f8:	02c12083          	lw	ra,44(sp)
     7fc:	02812403          	lw	s0,40(sp)
     800:	03010113          	addi	sp,sp,48
     804:	00008067          	ret

00000808 <my_printflt>:
     808:	fd010113          	addi	sp,sp,-48
     80c:	02112623          	sw	ra,44(sp)
     810:	02812423          	sw	s0,40(sp)
     814:	03010413          	addi	s0,sp,48
     818:	fca42e23          	sw	a0,-36(s0)
     81c:	fcb42c23          	sw	a1,-40(s0)
     820:	fe042423          	sw	zero,-24(s0)
     824:	00000593          	li	a1,0
     828:	fdc42503          	lw	a0,-36(s0)
     82c:	448010ef          	jal	1c74 <__lesf2>
     830:	00050793          	mv	a5,a0
     834:	0207d663          	bgez	a5,860 <my_printflt+0x58>
     838:	02d00513          	li	a0,45
     83c:	7a4000ef          	jal	fe0 <uart_put_char>
     840:	00050713          	mv	a4,a0
     844:	fe842783          	lw	a5,-24(s0)
     848:	00f707b3          	add	a5,a4,a5
     84c:	fef42423          	sw	a5,-24(s0)
     850:	fdc42703          	lw	a4,-36(s0)
     854:	800007b7          	lui	a5,0x80000
     858:	00f747b3          	xor	a5,a4,a5
     85c:	fcf42e23          	sw	a5,-36(s0)
     860:	fdc42503          	lw	a0,-36(s0)
     864:	409010ef          	jal	246c <__fixsfsi>
     868:	00050793          	mv	a5,a0
     86c:	fef42223          	sw	a5,-28(s0)
     870:	fe442783          	lw	a5,-28(s0)
     874:	fd842603          	lw	a2,-40(s0)
     878:	00a00593          	li	a1,10
     87c:	00078513          	mv	a0,a5
     880:	e95ff0ef          	jal	714 <my_printn>
     884:	00050713          	mv	a4,a0
     888:	fe842783          	lw	a5,-24(s0)
     88c:	00e787b3          	add	a5,a5,a4
     890:	fef42423          	sw	a5,-24(s0)
     894:	02e00513          	li	a0,46
     898:	748000ef          	jal	fe0 <uart_put_char>
     89c:	00050713          	mv	a4,a0
     8a0:	fe842783          	lw	a5,-24(s0)
     8a4:	00f707b3          	add	a5,a4,a5
     8a8:	fef42423          	sw	a5,-24(s0)
     8ac:	fe442503          	lw	a0,-28(s0)
     8b0:	42d010ef          	jal	24dc <__floatsisf>
     8b4:	00050793          	mv	a5,a0
     8b8:	00078593          	mv	a1,a5
     8bc:	fdc42503          	lw	a0,-36(s0)
     8c0:	77c010ef          	jal	203c <__subsf3>
     8c4:	00050793          	mv	a5,a0
     8c8:	fcf42e23          	sw	a5,-36(s0)
     8cc:	fe042623          	sw	zero,-20(s0)
     8d0:	0f01a583          	lw	a1,240(gp) # 2898 <__global_pointer$+0xf0>
     8d4:	fdc42503          	lw	a0,-36(s0)
     8d8:	448010ef          	jal	1d20 <__mulsf3>
     8dc:	00050793          	mv	a5,a0
     8e0:	fcf42e23          	sw	a5,-36(s0)
     8e4:	fdc42503          	lw	a0,-36(s0)
     8e8:	385010ef          	jal	246c <__fixsfsi>
     8ec:	00050793          	mv	a5,a0
     8f0:	fef42223          	sw	a5,-28(s0)
     8f4:	fe442783          	lw	a5,-28(s0)
     8f8:	0ff7f793          	zext.b	a5,a5
     8fc:	03078793          	addi	a5,a5,48 # 80000030 <_memory_end+0x7ffe0030>
     900:	0ff7f793          	zext.b	a5,a5
     904:	00078513          	mv	a0,a5
     908:	6d8000ef          	jal	fe0 <uart_put_char>
     90c:	00050713          	mv	a4,a0
     910:	fe842783          	lw	a5,-24(s0)
     914:	00f707b3          	add	a5,a4,a5
     918:	fef42423          	sw	a5,-24(s0)
     91c:	fe442503          	lw	a0,-28(s0)
     920:	3bd010ef          	jal	24dc <__floatsisf>
     924:	00050793          	mv	a5,a0
     928:	00078593          	mv	a1,a5
     92c:	fdc42503          	lw	a0,-36(s0)
     930:	70c010ef          	jal	203c <__subsf3>
     934:	00050793          	mv	a5,a0
     938:	fcf42e23          	sw	a5,-36(s0)
     93c:	fec42783          	lw	a5,-20(s0)
     940:	00178793          	addi	a5,a5,1
     944:	fef42623          	sw	a5,-20(s0)
     948:	00000593          	li	a1,0
     94c:	fdc42503          	lw	a0,-36(s0)
     950:	2bc010ef          	jal	1c0c <__eqsf2>
     954:	00050793          	mv	a5,a0
     958:	00078863          	beqz	a5,968 <my_printflt+0x160>
     95c:	fec42703          	lw	a4,-20(s0)
     960:	00500793          	li	a5,5
     964:	f6e7d6e3          	bge	a5,a4,8d0 <my_printflt+0xc8>
     968:	fe842783          	lw	a5,-24(s0)
     96c:	00078513          	mv	a0,a5
     970:	02c12083          	lw	ra,44(sp)
     974:	02812403          	lw	s0,40(sp)
     978:	03010113          	addi	sp,sp,48
     97c:	00008067          	ret

00000980 <my_vprintf>:
     980:	fc010113          	addi	sp,sp,-64
     984:	02112e23          	sw	ra,60(sp)
     988:	02812c23          	sw	s0,56(sp)
     98c:	04010413          	addi	s0,sp,64
     990:	fca42623          	sw	a0,-52(s0)
     994:	fcb42423          	sw	a1,-56(s0)
     998:	fe042023          	sw	zero,-32(s0)
     99c:	3000006f          	j	c9c <my_vprintf+0x31c>
     9a0:	fe842703          	lw	a4,-24(s0)
     9a4:	02500793          	li	a5,37
     9a8:	2cf71063          	bne	a4,a5,c68 <my_vprintf+0x2e8>
     9ac:	fcc42783          	lw	a5,-52(s0)
     9b0:	0007c783          	lbu	a5,0(a5)
     9b4:	fef42423          	sw	a5,-24(s0)
     9b8:	fe042623          	sw	zero,-20(s0)
     9bc:	0440006f          	j	a00 <my_vprintf+0x80>
     9c0:	fec42703          	lw	a4,-20(s0)
     9c4:	00070793          	mv	a5,a4
     9c8:	00279793          	slli	a5,a5,0x2
     9cc:	00e787b3          	add	a5,a5,a4
     9d0:	00179793          	slli	a5,a5,0x1
     9d4:	00078713          	mv	a4,a5
     9d8:	fe842783          	lw	a5,-24(s0)
     9dc:	00f707b3          	add	a5,a4,a5
     9e0:	fd078793          	addi	a5,a5,-48
     9e4:	fef42623          	sw	a5,-20(s0)
     9e8:	fcc42783          	lw	a5,-52(s0)
     9ec:	00178793          	addi	a5,a5,1
     9f0:	fcf42623          	sw	a5,-52(s0)
     9f4:	fcc42783          	lw	a5,-52(s0)
     9f8:	0007c783          	lbu	a5,0(a5)
     9fc:	fef42423          	sw	a5,-24(s0)
     a00:	fe842703          	lw	a4,-24(s0)
     a04:	02f00793          	li	a5,47
     a08:	00e7d863          	bge	a5,a4,a18 <my_vprintf+0x98>
     a0c:	fe842703          	lw	a4,-24(s0)
     a10:	03900793          	li	a5,57
     a14:	fae7d6e3          	bge	a5,a4,9c0 <my_vprintf+0x40>
     a18:	fcc42783          	lw	a5,-52(s0)
     a1c:	00178713          	addi	a4,a5,1
     a20:	fce42623          	sw	a4,-52(s0)
     a24:	0007c783          	lbu	a5,0(a5)
     a28:	fef42423          	sw	a5,-24(s0)
     a2c:	fe842703          	lw	a4,-24(s0)
     a30:	02500793          	li	a5,37
     a34:	1ef70863          	beq	a4,a5,c24 <my_vprintf+0x2a4>
     a38:	fe842703          	lw	a4,-24(s0)
     a3c:	02500793          	li	a5,37
     a40:	20f74063          	blt	a4,a5,c40 <my_vprintf+0x2c0>
     a44:	fe842703          	lw	a4,-24(s0)
     a48:	07800793          	li	a5,120
     a4c:	1ee7ca63          	blt	a5,a4,c40 <my_vprintf+0x2c0>
     a50:	fe842703          	lw	a4,-24(s0)
     a54:	06300793          	li	a5,99
     a58:	1ef74463          	blt	a4,a5,c40 <my_vprintf+0x2c0>
     a5c:	fe842783          	lw	a5,-24(s0)
     a60:	f9d78793          	addi	a5,a5,-99
     a64:	01500713          	li	a4,21
     a68:	1cf76c63          	bltu	a4,a5,c40 <my_vprintf+0x2c0>
     a6c:	00279713          	slli	a4,a5,0x2
     a70:	09818793          	addi	a5,gp,152 # 2840 <__global_pointer$+0x98>
     a74:	00f707b3          	add	a5,a4,a5
     a78:	0007a783          	lw	a5,0(a5)
     a7c:	00078067          	jr	a5
     a80:	fc842783          	lw	a5,-56(s0)
     a84:	00478713          	addi	a4,a5,4
     a88:	fce42423          	sw	a4,-56(s0)
     a8c:	0007a783          	lw	a5,0(a5)
     a90:	fcf40ba3          	sb	a5,-41(s0)
     a94:	fd744783          	lbu	a5,-41(s0)
     a98:	00078513          	mv	a0,a5
     a9c:	544000ef          	jal	fe0 <uart_put_char>
     aa0:	00050713          	mv	a4,a0
     aa4:	fe042783          	lw	a5,-32(s0)
     aa8:	00f707b3          	add	a5,a4,a5
     aac:	fef42023          	sw	a5,-32(s0)
     ab0:	1ec0006f          	j	c9c <my_vprintf+0x31c>
     ab4:	fc842783          	lw	a5,-56(s0)
     ab8:	00478713          	addi	a4,a5,4
     abc:	fce42423          	sw	a4,-56(s0)
     ac0:	0007a783          	lw	a5,0(a5)
     ac4:	fcf42e23          	sw	a5,-36(s0)
     ac8:	fdc42783          	lw	a5,-36(s0)
     acc:	fec42603          	lw	a2,-20(s0)
     ad0:	00800593          	li	a1,8
     ad4:	00078513          	mv	a0,a5
     ad8:	c3dff0ef          	jal	714 <my_printn>
     adc:	00050713          	mv	a4,a0
     ae0:	fe042783          	lw	a5,-32(s0)
     ae4:	00e787b3          	add	a5,a5,a4
     ae8:	fef42023          	sw	a5,-32(s0)
     aec:	1b00006f          	j	c9c <my_vprintf+0x31c>
     af0:	fc842783          	lw	a5,-56(s0)
     af4:	00478713          	addi	a4,a5,4
     af8:	fce42423          	sw	a4,-56(s0)
     afc:	0007a783          	lw	a5,0(a5)
     b00:	fcf42e23          	sw	a5,-36(s0)
     b04:	fdc42783          	lw	a5,-36(s0)
     b08:	fec42603          	lw	a2,-20(s0)
     b0c:	00a00593          	li	a1,10
     b10:	00078513          	mv	a0,a5
     b14:	c01ff0ef          	jal	714 <my_printn>
     b18:	00050713          	mv	a4,a0
     b1c:	fe042783          	lw	a5,-32(s0)
     b20:	00e787b3          	add	a5,a5,a4
     b24:	fef42023          	sw	a5,-32(s0)
     b28:	1740006f          	j	c9c <my_vprintf+0x31c>
     b2c:	fc842783          	lw	a5,-56(s0)
     b30:	00478713          	addi	a4,a5,4
     b34:	fce42423          	sw	a4,-56(s0)
     b38:	0007a783          	lw	a5,0(a5)
     b3c:	fcf42e23          	sw	a5,-36(s0)
     b40:	fdc42783          	lw	a5,-36(s0)
     b44:	fec42603          	lw	a2,-20(s0)
     b48:	01000593          	li	a1,16
     b4c:	00078513          	mv	a0,a5
     b50:	bc5ff0ef          	jal	714 <my_printn>
     b54:	00050713          	mv	a4,a0
     b58:	fe042783          	lw	a5,-32(s0)
     b5c:	00e787b3          	add	a5,a5,a4
     b60:	fef42023          	sw	a5,-32(s0)
     b64:	1380006f          	j	c9c <my_vprintf+0x31c>
     b68:	fc842783          	lw	a5,-56(s0)
     b6c:	00478713          	addi	a4,a5,4
     b70:	fce42423          	sw	a4,-56(s0)
     b74:	0007a783          	lw	a5,0(a5)
     b78:	fef42223          	sw	a5,-28(s0)
     b7c:	0480006f          	j	bc4 <my_vprintf+0x244>
     b80:	fe442783          	lw	a5,-28(s0)
     b84:	0007c783          	lbu	a5,0(a5)
     b88:	00078513          	mv	a0,a5
     b8c:	454000ef          	jal	fe0 <uart_put_char>
     b90:	00050713          	mv	a4,a0
     b94:	fe042783          	lw	a5,-32(s0)
     b98:	00f707b3          	add	a5,a4,a5
     b9c:	fef42023          	sw	a5,-32(s0)
     ba0:	fe442783          	lw	a5,-28(s0)
     ba4:	0007c703          	lbu	a4,0(a5)
     ba8:	00a00793          	li	a5,10
     bac:	00f71663          	bne	a4,a5,bb8 <my_vprintf+0x238>
     bb0:	00d00513          	li	a0,13
     bb4:	42c000ef          	jal	fe0 <uart_put_char>
     bb8:	fe442783          	lw	a5,-28(s0)
     bbc:	00178793          	addi	a5,a5,1
     bc0:	fef42223          	sw	a5,-28(s0)
     bc4:	fe442783          	lw	a5,-28(s0)
     bc8:	0007c783          	lbu	a5,0(a5)
     bcc:	fa079ae3          	bnez	a5,b80 <my_vprintf+0x200>
     bd0:	0cc0006f          	j	c9c <my_vprintf+0x31c>
     bd4:	fc842783          	lw	a5,-56(s0)
     bd8:	00778793          	addi	a5,a5,7
     bdc:	ff87f793          	andi	a5,a5,-8
     be0:	00878713          	addi	a4,a5,8
     be4:	fce42423          	sw	a4,-56(s0)
     be8:	0007a703          	lw	a4,0(a5)
     bec:	0047a783          	lw	a5,4(a5)
     bf0:	00070513          	mv	a0,a4
     bf4:	00078593          	mv	a1,a5
     bf8:	1ed010ef          	jal	25e4 <__truncdfsf2>
     bfc:	00050793          	mv	a5,a0
     c00:	fcf42c23          	sw	a5,-40(s0)
     c04:	fec42583          	lw	a1,-20(s0)
     c08:	fd842503          	lw	a0,-40(s0)
     c0c:	bfdff0ef          	jal	808 <my_printflt>
     c10:	00050713          	mv	a4,a0
     c14:	fe042783          	lw	a5,-32(s0)
     c18:	00e787b3          	add	a5,a5,a4
     c1c:	fef42023          	sw	a5,-32(s0)
     c20:	07c0006f          	j	c9c <my_vprintf+0x31c>
     c24:	02500513          	li	a0,37
     c28:	3b8000ef          	jal	fe0 <uart_put_char>
     c2c:	00050713          	mv	a4,a0
     c30:	fe042783          	lw	a5,-32(s0)
     c34:	00f707b3          	add	a5,a4,a5
     c38:	fef42023          	sw	a5,-32(s0)
     c3c:	0600006f          	j	c9c <my_vprintf+0x31c>
     c40:	02500513          	li	a0,37
     c44:	39c000ef          	jal	fe0 <uart_put_char>
     c48:	00050713          	mv	a4,a0
     c4c:	fe042783          	lw	a5,-32(s0)
     c50:	00f707b3          	add	a5,a4,a5
     c54:	fef42023          	sw	a5,-32(s0)
     c58:	fcc42783          	lw	a5,-52(s0)
     c5c:	fff78793          	addi	a5,a5,-1
     c60:	fcf42623          	sw	a5,-52(s0)
     c64:	0380006f          	j	c9c <my_vprintf+0x31c>
     c68:	fe842783          	lw	a5,-24(s0)
     c6c:	0ff7f793          	zext.b	a5,a5
     c70:	00078513          	mv	a0,a5
     c74:	36c000ef          	jal	fe0 <uart_put_char>
     c78:	00050713          	mv	a4,a0
     c7c:	fe042783          	lw	a5,-32(s0)
     c80:	00f707b3          	add	a5,a4,a5
     c84:	fef42023          	sw	a5,-32(s0)
     c88:	fe842703          	lw	a4,-24(s0)
     c8c:	00a00793          	li	a5,10
     c90:	00f71663          	bne	a4,a5,c9c <my_vprintf+0x31c>
     c94:	00d00513          	li	a0,13
     c98:	348000ef          	jal	fe0 <uart_put_char>
     c9c:	fcc42783          	lw	a5,-52(s0)
     ca0:	00178713          	addi	a4,a5,1
     ca4:	fce42623          	sw	a4,-52(s0)
     ca8:	0007c783          	lbu	a5,0(a5)
     cac:	fef42423          	sw	a5,-24(s0)
     cb0:	fe842783          	lw	a5,-24(s0)
     cb4:	ce0796e3          	bnez	a5,9a0 <my_vprintf+0x20>
     cb8:	fe042783          	lw	a5,-32(s0)
     cbc:	00078513          	mv	a0,a5
     cc0:	03c12083          	lw	ra,60(sp)
     cc4:	03812403          	lw	s0,56(sp)
     cc8:	04010113          	addi	sp,sp,64
     ccc:	00008067          	ret

00000cd0 <uart_init>:
     cd0:	fc010113          	addi	sp,sp,-64
     cd4:	02112e23          	sw	ra,60(sp)
     cd8:	02812c23          	sw	s0,56(sp)
     cdc:	04010413          	addi	s0,sp,64
     ce0:	fca42e23          	sw	a0,-36(s0)
     ce4:	fcb42c23          	sw	a1,-40(s0)
     ce8:	fcc42a23          	sw	a2,-44(s0)
     cec:	fcd42823          	sw	a3,-48(s0)
     cf0:	fce42623          	sw	a4,-52(s0)
     cf4:	fdc42783          	lw	a5,-36(s0)
     cf8:	00079663          	bnez	a5,d04 <uart_init+0x34>
     cfc:	5b0000ef          	jal	12ac <uart_get_clk_freq>
     d00:	fca42e23          	sw	a0,-36(s0)
     d04:	fdc42703          	lw	a4,-36(s0)
     d08:	fd842783          	lw	a5,-40(s0)
     d0c:	02f757b3          	divu	a5,a4,a5
     d10:	00078513          	mv	a0,a5
     d14:	679000ef          	jal	1b8c <__floatunsidf>
     d18:	00050713          	mv	a4,a0
     d1c:	00058793          	mv	a5,a1
     d20:	0f81a603          	lw	a2,248(gp) # 28a0 <__global_pointer$+0xf8>
     d24:	0fc1a683          	lw	a3,252(gp) # 28a4 <__global_pointer$+0xfc>
     d28:	00070513          	mv	a0,a4
     d2c:	00078593          	mv	a1,a5
     d30:	648000ef          	jal	1378 <__adddf3>
     d34:	00050713          	mv	a4,a0
     d38:	00058793          	mv	a5,a1
     d3c:	00070513          	mv	a0,a4
     d40:	00078593          	mv	a1,a5
     d44:	5c9000ef          	jal	1b0c <__fixdfsi>
     d48:	00050793          	mv	a5,a0
     d4c:	00078713          	mv	a4,a5
     d50:	000107b7          	lui	a5,0x10
     d54:	fff78793          	addi	a5,a5,-1 # ffff <_bss_end+0xd51f>
     d58:	00f777b3          	and	a5,a4,a5
     d5c:	fef42623          	sw	a5,-20(s0)
     d60:	fd442703          	lw	a4,-44(s0)
     d64:	00800793          	li	a5,8
     d68:	00f71663          	bne	a4,a5,d74 <uart_init+0xa4>
     d6c:	00000793          	li	a5,0
     d70:	0080006f          	j	d78 <uart_init+0xa8>
     d74:	000107b7          	lui	a5,0x10
     d78:	fec42703          	lw	a4,-20(s0)
     d7c:	00e7e7b3          	or	a5,a5,a4
     d80:	fef42623          	sw	a5,-20(s0)
     d84:	fd042783          	lw	a5,-48(s0)
     d88:	00079663          	bnez	a5,d94 <uart_init+0xc4>
     d8c:	00000793          	li	a5,0
     d90:	0080006f          	j	d98 <uart_init+0xc8>
     d94:	000207b7          	lui	a5,0x20
     d98:	fec42703          	lw	a4,-20(s0)
     d9c:	00e7e7b3          	or	a5,a5,a4
     da0:	fef42623          	sw	a5,-20(s0)
     da4:	fd042703          	lw	a4,-48(s0)
     da8:	00100793          	li	a5,1
     dac:	00f71663          	bne	a4,a5,db8 <uart_init+0xe8>
     db0:	00000793          	li	a5,0
     db4:	0080006f          	j	dbc <uart_init+0xec>
     db8:	000407b7          	lui	a5,0x40
     dbc:	fec42703          	lw	a4,-20(s0)
     dc0:	00e7e7b3          	or	a5,a5,a4
     dc4:	fef42623          	sw	a5,-20(s0)
     dc8:	fcc42703          	lw	a4,-52(s0)
     dcc:	00100793          	li	a5,1
     dd0:	00f71663          	bne	a4,a5,ddc <uart_init+0x10c>
     dd4:	00000793          	li	a5,0
     dd8:	0080006f          	j	de0 <uart_init+0x110>
     ddc:	000807b7          	lui	a5,0x80
     de0:	fec42703          	lw	a4,-20(s0)
     de4:	00e7e7b3          	or	a5,a5,a4
     de8:	fef42623          	sw	a5,-20(s0)
     dec:	2241a783          	lw	a5,548(gp) # 29cc <UART_CONTROL>
     df0:	fef42423          	sw	a5,-24(s0)
     df4:	fe842783          	lw	a5,-24(s0)
     df8:	fec42703          	lw	a4,-20(s0)
     dfc:	00e7a023          	sw	a4,0(a5) # 80000 <_memory_end+0x60000>
     e00:	00000013          	nop
     e04:	03c12083          	lw	ra,60(sp)
     e08:	03812403          	lw	s0,56(sp)
     e0c:	04010113          	addi	sp,sp,64
     e10:	00008067          	ret

00000e14 <uart_init_ext>:
     e14:	fc010113          	addi	sp,sp,-64
     e18:	02112e23          	sw	ra,60(sp)
     e1c:	02812c23          	sw	s0,56(sp)
     e20:	04010413          	addi	s0,sp,64
     e24:	fca42e23          	sw	a0,-36(s0)
     e28:	fcb42c23          	sw	a1,-40(s0)
     e2c:	fcc42a23          	sw	a2,-44(s0)
     e30:	fcd42823          	sw	a3,-48(s0)
     e34:	fce42623          	sw	a4,-52(s0)
     e38:	fcf42423          	sw	a5,-56(s0)
     e3c:	fd042223          	sw	a6,-60(s0)
     e40:	fdc42783          	lw	a5,-36(s0)
     e44:	00079663          	bnez	a5,e50 <uart_init_ext+0x3c>
     e48:	464000ef          	jal	12ac <uart_get_clk_freq>
     e4c:	fca42e23          	sw	a0,-36(s0)
     e50:	fdc42703          	lw	a4,-36(s0)
     e54:	fd842783          	lw	a5,-40(s0)
     e58:	02f757b3          	divu	a5,a4,a5
     e5c:	00078513          	mv	a0,a5
     e60:	52d000ef          	jal	1b8c <__floatunsidf>
     e64:	00050713          	mv	a4,a0
     e68:	00058793          	mv	a5,a1
     e6c:	0f81a603          	lw	a2,248(gp) # 28a0 <__global_pointer$+0xf8>
     e70:	0fc1a683          	lw	a3,252(gp) # 28a4 <__global_pointer$+0xfc>
     e74:	00070513          	mv	a0,a4
     e78:	00078593          	mv	a1,a5
     e7c:	4fc000ef          	jal	1378 <__adddf3>
     e80:	00050713          	mv	a4,a0
     e84:	00058793          	mv	a5,a1
     e88:	00070513          	mv	a0,a4
     e8c:	00078593          	mv	a1,a5
     e90:	47d000ef          	jal	1b0c <__fixdfsi>
     e94:	00050793          	mv	a5,a0
     e98:	00078713          	mv	a4,a5
     e9c:	000107b7          	lui	a5,0x10
     ea0:	fff78793          	addi	a5,a5,-1 # ffff <_bss_end+0xd51f>
     ea4:	00f777b3          	and	a5,a4,a5
     ea8:	fef42623          	sw	a5,-20(s0)
     eac:	fd442703          	lw	a4,-44(s0)
     eb0:	00800793          	li	a5,8
     eb4:	00f71663          	bne	a4,a5,ec0 <uart_init_ext+0xac>
     eb8:	00000793          	li	a5,0
     ebc:	0080006f          	j	ec4 <uart_init_ext+0xb0>
     ec0:	000107b7          	lui	a5,0x10
     ec4:	fec42703          	lw	a4,-20(s0)
     ec8:	00e7e7b3          	or	a5,a5,a4
     ecc:	fef42623          	sw	a5,-20(s0)
     ed0:	fd042783          	lw	a5,-48(s0)
     ed4:	00079663          	bnez	a5,ee0 <uart_init_ext+0xcc>
     ed8:	00000793          	li	a5,0
     edc:	0080006f          	j	ee4 <uart_init_ext+0xd0>
     ee0:	000207b7          	lui	a5,0x20
     ee4:	fec42703          	lw	a4,-20(s0)
     ee8:	00e7e7b3          	or	a5,a5,a4
     eec:	fef42623          	sw	a5,-20(s0)
     ef0:	fd042703          	lw	a4,-48(s0)
     ef4:	00100793          	li	a5,1
     ef8:	00f71663          	bne	a4,a5,f04 <uart_init_ext+0xf0>
     efc:	00000793          	li	a5,0
     f00:	0080006f          	j	f08 <uart_init_ext+0xf4>
     f04:	000407b7          	lui	a5,0x40
     f08:	fec42703          	lw	a4,-20(s0)
     f0c:	00e7e7b3          	or	a5,a5,a4
     f10:	fef42623          	sw	a5,-20(s0)
     f14:	fcc42703          	lw	a4,-52(s0)
     f18:	00100793          	li	a5,1
     f1c:	00f71663          	bne	a4,a5,f28 <uart_init_ext+0x114>
     f20:	00000793          	li	a5,0
     f24:	0080006f          	j	f2c <uart_init_ext+0x118>
     f28:	000807b7          	lui	a5,0x80
     f2c:	fec42703          	lw	a4,-20(s0)
     f30:	00e7e7b3          	or	a5,a5,a4
     f34:	fef42623          	sw	a5,-20(s0)
     f38:	fc842783          	lw	a5,-56(s0)
     f3c:	00079663          	bnez	a5,f48 <uart_init_ext+0x134>
     f40:	00000793          	li	a5,0
     f44:	0080006f          	j	f4c <uart_init_ext+0x138>
     f48:	002007b7          	lui	a5,0x200
     f4c:	fec42703          	lw	a4,-20(s0)
     f50:	00e7e7b3          	or	a5,a5,a4
     f54:	fef42623          	sw	a5,-20(s0)
     f58:	fc442783          	lw	a5,-60(s0)
     f5c:	00079663          	bnez	a5,f68 <uart_init_ext+0x154>
     f60:	00000793          	li	a5,0
     f64:	0080006f          	j	f6c <uart_init_ext+0x158>
     f68:	001007b7          	lui	a5,0x100
     f6c:	fec42703          	lw	a4,-20(s0)
     f70:	00e7e7b3          	or	a5,a5,a4
     f74:	fef42623          	sw	a5,-20(s0)
     f78:	2241a783          	lw	a5,548(gp) # 29cc <UART_CONTROL>
     f7c:	fef42423          	sw	a5,-24(s0)
     f80:	fe842783          	lw	a5,-24(s0)
     f84:	fec42703          	lw	a4,-20(s0)
     f88:	00e7a023          	sw	a4,0(a5) # 100000 <_memory_end+0xe0000>
     f8c:	00000013          	nop
     f90:	03c12083          	lw	ra,60(sp)
     f94:	03812403          	lw	s0,56(sp)
     f98:	04010113          	addi	sp,sp,64
     f9c:	00008067          	ret

00000fa0 <uart_get_char>:
     fa0:	fe010113          	addi	sp,sp,-32
     fa4:	00812e23          	sw	s0,28(sp)
     fa8:	02010413          	addi	s0,sp,32
     fac:	2301a783          	lw	a5,560(gp) # 29d8 <UART_RX>
     fb0:	fef42423          	sw	a5,-24(s0)
     fb4:	fe842783          	lw	a5,-24(s0)
     fb8:	0007a783          	lw	a5,0(a5)
     fbc:	fef42623          	sw	a5,-20(s0)
     fc0:	fec42783          	lw	a5,-20(s0)
     fc4:	fe07d4e3          	bgez	a5,fac <uart_get_char+0xc>
     fc8:	fec42783          	lw	a5,-20(s0)
     fcc:	0ff7f793          	zext.b	a5,a5
     fd0:	00078513          	mv	a0,a5
     fd4:	01c12403          	lw	s0,28(sp)
     fd8:	02010113          	addi	sp,sp,32
     fdc:	00008067          	ret

00000fe0 <uart_put_char>:
     fe0:	fd010113          	addi	sp,sp,-48
     fe4:	02812623          	sw	s0,44(sp)
     fe8:	03010413          	addi	s0,sp,48
     fec:	00050793          	mv	a5,a0
     ff0:	fcf40fa3          	sb	a5,-33(s0)
     ff4:	22c1a783          	lw	a5,556(gp) # 29d4 <UART_TX>
     ff8:	fef42423          	sw	a5,-24(s0)
     ffc:	fe842783          	lw	a5,-24(s0)
    1000:	0007a783          	lw	a5,0(a5)
    1004:	fef42623          	sw	a5,-20(s0)
    1008:	fec42783          	lw	a5,-20(s0)
    100c:	fe07c4e3          	bltz	a5,ff4 <uart_put_char+0x14>
    1010:	fdf44783          	lbu	a5,-33(s0)
    1014:	fef42623          	sw	a5,-20(s0)
    1018:	22c1a783          	lw	a5,556(gp) # 29d4 <UART_TX>
    101c:	fef42223          	sw	a5,-28(s0)
    1020:	fe442783          	lw	a5,-28(s0)
    1024:	fec42703          	lw	a4,-20(s0)
    1028:	00e7a023          	sw	a4,0(a5)
    102c:	fdf44783          	lbu	a5,-33(s0)
    1030:	00078513          	mv	a0,a5
    1034:	02c12403          	lw	s0,44(sp)
    1038:	03010113          	addi	sp,sp,48
    103c:	00008067          	ret

00001040 <uart_put_string>:
    1040:	fc010113          	addi	sp,sp,-64
    1044:	02812e23          	sw	s0,60(sp)
    1048:	04010413          	addi	s0,sp,64
    104c:	fca42623          	sw	a0,-52(s0)
    1050:	fe042623          	sw	zero,-20(s0)
    1054:	0400006f          	j	1094 <uart_put_string+0x54>
    1058:	22c1a783          	lw	a5,556(gp) # 29d4 <UART_TX>
    105c:	fef42023          	sw	a5,-32(s0)
    1060:	fe042783          	lw	a5,-32(s0)
    1064:	0007a783          	lw	a5,0(a5)
    1068:	fef42223          	sw	a5,-28(s0)
    106c:	fe442783          	lw	a5,-28(s0)
    1070:	fe07c4e3          	bltz	a5,1058 <uart_put_string+0x18>
    1074:	22c1a783          	lw	a5,556(gp) # 29d4 <UART_TX>
    1078:	fcf42e23          	sw	a5,-36(s0)
    107c:	fdc42783          	lw	a5,-36(s0)
    1080:	feb44703          	lbu	a4,-21(s0)
    1084:	00e7a023          	sw	a4,0(a5)
    1088:	fec42783          	lw	a5,-20(s0)
    108c:	00178793          	addi	a5,a5,1
    1090:	fef42623          	sw	a5,-20(s0)
    1094:	fcc42783          	lw	a5,-52(s0)
    1098:	00178713          	addi	a4,a5,1
    109c:	fce42623          	sw	a4,-52(s0)
    10a0:	0007c783          	lbu	a5,0(a5)
    10a4:	fef405a3          	sb	a5,-21(s0)
    10a8:	feb44783          	lbu	a5,-21(s0)
    10ac:	fa0796e3          	bnez	a5,1058 <uart_put_string+0x18>
    10b0:	fec42783          	lw	a5,-20(s0)
    10b4:	00078513          	mv	a0,a5
    10b8:	03c12403          	lw	s0,60(sp)
    10bc:	04010113          	addi	sp,sp,64
    10c0:	00008067          	ret

000010c4 <uart_put_int>:
    10c4:	fc010113          	addi	sp,sp,-64
    10c8:	02112e23          	sw	ra,60(sp)
    10cc:	02812c23          	sw	s0,56(sp)
    10d0:	04010413          	addi	s0,sp,64
    10d4:	fca42623          	sw	a0,-52(s0)
    10d8:	fcc42703          	lw	a4,-52(s0)
    10dc:	00a00793          	li	a5,10
    10e0:	02f757b3          	divu	a5,a4,a5
    10e4:	fef42623          	sw	a5,-20(s0)
    10e8:	fec42783          	lw	a5,-20(s0)
    10ec:	00078863          	beqz	a5,10fc <uart_put_int+0x38>
    10f0:	fec42783          	lw	a5,-20(s0)
    10f4:	00078513          	mv	a0,a5
    10f8:	fcdff0ef          	jal	10c4 <uart_put_int>
    10fc:	fcc42703          	lw	a4,-52(s0)
    1100:	00a00793          	li	a5,10
    1104:	02f777b3          	remu	a5,a4,a5
    1108:	0ff7f793          	zext.b	a5,a5
    110c:	03078793          	addi	a5,a5,48
    1110:	fef405a3          	sb	a5,-21(s0)
    1114:	22c1a783          	lw	a5,556(gp) # 29d4 <UART_TX>
    1118:	fcf42a23          	sw	a5,-44(s0)
    111c:	fd442783          	lw	a5,-44(s0)
    1120:	0007a783          	lw	a5,0(a5)
    1124:	fcf42c23          	sw	a5,-40(s0)
    1128:	fd842783          	lw	a5,-40(s0)
    112c:	fe07c4e3          	bltz	a5,1114 <uart_put_int+0x50>
    1130:	22c1a783          	lw	a5,556(gp) # 29d4 <UART_TX>
    1134:	fcf42823          	sw	a5,-48(s0)
    1138:	fd042783          	lw	a5,-48(s0)
    113c:	feb44703          	lbu	a4,-21(s0)
    1140:	00e7a023          	sw	a4,0(a5)
    1144:	00000013          	nop
    1148:	03c12083          	lw	ra,60(sp)
    114c:	03812403          	lw	s0,56(sp)
    1150:	04010113          	addi	sp,sp,64
    1154:	00008067          	ret

00001158 <uart_put_hex>:
    1158:	fc010113          	addi	sp,sp,-64
    115c:	02112e23          	sw	ra,60(sp)
    1160:	02812c23          	sw	s0,56(sp)
    1164:	04010413          	addi	s0,sp,64
    1168:	fca42623          	sw	a0,-52(s0)
    116c:	fcc42783          	lw	a5,-52(s0)
    1170:	0047d793          	srli	a5,a5,0x4
    1174:	fef42423          	sw	a5,-24(s0)
    1178:	fe842783          	lw	a5,-24(s0)
    117c:	00078863          	beqz	a5,118c <uart_put_hex+0x34>
    1180:	fe842783          	lw	a5,-24(s0)
    1184:	00078513          	mv	a0,a5
    1188:	fd1ff0ef          	jal	1158 <uart_put_hex>
    118c:	fcc42783          	lw	a5,-52(s0)
    1190:	00f7f793          	andi	a5,a5,15
    1194:	fef42423          	sw	a5,-24(s0)
    1198:	fe842703          	lw	a4,-24(s0)
    119c:	00900793          	li	a5,9
    11a0:	00e7cc63          	blt	a5,a4,11b8 <uart_put_hex+0x60>
    11a4:	fe842783          	lw	a5,-24(s0)
    11a8:	0ff7f793          	zext.b	a5,a5
    11ac:	03078793          	addi	a5,a5,48
    11b0:	fef407a3          	sb	a5,-17(s0)
    11b4:	0140006f          	j	11c8 <uart_put_hex+0x70>
    11b8:	fe842783          	lw	a5,-24(s0)
    11bc:	0ff7f793          	zext.b	a5,a5
    11c0:	03778793          	addi	a5,a5,55
    11c4:	fef407a3          	sb	a5,-17(s0)
    11c8:	22c1a783          	lw	a5,556(gp) # 29d4 <UART_TX>
    11cc:	fef42023          	sw	a5,-32(s0)
    11d0:	fe042783          	lw	a5,-32(s0)
    11d4:	0007a783          	lw	a5,0(a5)
    11d8:	fef42223          	sw	a5,-28(s0)
    11dc:	fe442783          	lw	a5,-28(s0)
    11e0:	fe07c4e3          	bltz	a5,11c8 <uart_put_hex+0x70>
    11e4:	22c1a783          	lw	a5,556(gp) # 29d4 <UART_TX>
    11e8:	fcf42e23          	sw	a5,-36(s0)
    11ec:	fdc42783          	lw	a5,-36(s0)
    11f0:	fef44703          	lbu	a4,-17(s0)
    11f4:	00e7a023          	sw	a4,0(a5)
    11f8:	00000013          	nop
    11fc:	03c12083          	lw	ra,60(sp)
    1200:	03812403          	lw	s0,56(sp)
    1204:	04010113          	addi	sp,sp,64
    1208:	00008067          	ret

0000120c <uart_cler_tx_irq>:
    120c:	fe010113          	addi	sp,sp,-32
    1210:	00812e23          	sw	s0,28(sp)
    1214:	02010413          	addi	s0,sp,32
    1218:	2281a783          	lw	a5,552(gp) # 29d0 <UART_STATUS>
    121c:	fef42423          	sw	a5,-24(s0)
    1220:	fe842783          	lw	a5,-24(s0)
    1224:	0007a783          	lw	a5,0(a5)
    1228:	fef42623          	sw	a5,-20(s0)
    122c:	fec42783          	lw	a5,-20(s0)
    1230:	ffe7f793          	andi	a5,a5,-2
    1234:	fef42623          	sw	a5,-20(s0)
    1238:	2281a783          	lw	a5,552(gp) # 29d0 <UART_STATUS>
    123c:	fef42223          	sw	a5,-28(s0)
    1240:	fe442783          	lw	a5,-28(s0)
    1244:	fec42703          	lw	a4,-20(s0)
    1248:	00e7a023          	sw	a4,0(a5)
    124c:	00000013          	nop
    1250:	01c12403          	lw	s0,28(sp)
    1254:	02010113          	addi	sp,sp,32
    1258:	00008067          	ret

0000125c <uart_cler_rx_irq>:
    125c:	fe010113          	addi	sp,sp,-32
    1260:	00812e23          	sw	s0,28(sp)
    1264:	02010413          	addi	s0,sp,32
    1268:	2281a783          	lw	a5,552(gp) # 29d0 <UART_STATUS>
    126c:	fef42423          	sw	a5,-24(s0)
    1270:	fe842783          	lw	a5,-24(s0)
    1274:	0007a783          	lw	a5,0(a5)
    1278:	fef42623          	sw	a5,-20(s0)
    127c:	fec42783          	lw	a5,-20(s0)
    1280:	ffd7f793          	andi	a5,a5,-3
    1284:	fef42623          	sw	a5,-20(s0)
    1288:	2281a783          	lw	a5,552(gp) # 29d0 <UART_STATUS>
    128c:	fef42223          	sw	a5,-28(s0)
    1290:	fe442783          	lw	a5,-28(s0)
    1294:	fec42703          	lw	a4,-20(s0)
    1298:	00e7a023          	sw	a4,0(a5)
    129c:	00000013          	nop
    12a0:	01c12403          	lw	s0,28(sp)
    12a4:	02010113          	addi	sp,sp,32
    12a8:	00008067          	ret

000012ac <uart_get_clk_freq>:
    12ac:	fe010113          	addi	sp,sp,-32
    12b0:	00812e23          	sw	s0,28(sp)
    12b4:	02010413          	addi	s0,sp,32
    12b8:	2341a783          	lw	a5,564(gp) # 29dc <UART_CLK_FREQ>
    12bc:	fef42423          	sw	a5,-24(s0)
    12c0:	fe842783          	lw	a5,-24(s0)
    12c4:	0007a783          	lw	a5,0(a5)
    12c8:	fef42623          	sw	a5,-20(s0)
    12cc:	fec42783          	lw	a5,-20(s0)
    12d0:	00078513          	mv	a0,a5
    12d4:	01c12403          	lw	s0,28(sp)
    12d8:	02010113          	addi	sp,sp,32
    12dc:	00008067          	ret

000012e0 <uart_set_addr>:
    12e0:	fe010113          	addi	sp,sp,-32
    12e4:	00812e23          	sw	s0,28(sp)
    12e8:	02010413          	addi	s0,sp,32
    12ec:	fea42623          	sw	a0,-20(s0)
    12f0:	fec42703          	lw	a4,-20(s0)
    12f4:	20e1ac23          	sw	a4,536(gp) # 29c0 <UART_ADDR_BASE>
    12f8:	fec42703          	lw	a4,-20(s0)
    12fc:	20e1ae23          	sw	a4,540(gp) # 29c4 <UART_VERSION>
    1300:	fec42783          	lw	a5,-20(s0)
    1304:	00478713          	addi	a4,a5,4
    1308:	22e1a023          	sw	a4,544(gp) # 29c8 <UART_NAME>
    130c:	fec42783          	lw	a5,-20(s0)
    1310:	01078713          	addi	a4,a5,16
    1314:	22e1a223          	sw	a4,548(gp) # 29cc <UART_CONTROL>
    1318:	fec42783          	lw	a5,-20(s0)
    131c:	01478713          	addi	a4,a5,20
    1320:	22e1a423          	sw	a4,552(gp) # 29d0 <UART_STATUS>
    1324:	fec42783          	lw	a5,-20(s0)
    1328:	01878713          	addi	a4,a5,24
    132c:	22e1a623          	sw	a4,556(gp) # 29d4 <UART_TX>
    1330:	fec42783          	lw	a5,-20(s0)
    1334:	01c78713          	addi	a4,a5,28
    1338:	22e1a823          	sw	a4,560(gp) # 29d8 <UART_RX>
    133c:	fec42783          	lw	a5,-20(s0)
    1340:	02078713          	addi	a4,a5,32
    1344:	22e1aa23          	sw	a4,564(gp) # 29dc <UART_CLK_FREQ>
    1348:	00000013          	nop
    134c:	01c12403          	lw	s0,28(sp)
    1350:	02010113          	addi	sp,sp,32
    1354:	00008067          	ret

00001358 <uart_get_addr>:
    1358:	ff010113          	addi	sp,sp,-16
    135c:	00812623          	sw	s0,12(sp)
    1360:	01010413          	addi	s0,sp,16
    1364:	2181a783          	lw	a5,536(gp) # 29c0 <UART_ADDR_BASE>
    1368:	00078513          	mv	a0,a5
    136c:	00c12403          	lw	s0,12(sp)
    1370:	01010113          	addi	sp,sp,16
    1374:	00008067          	ret

00001378 <__adddf3>:
    1378:	00100837          	lui	a6,0x100
    137c:	fff80813          	addi	a6,a6,-1 # fffff <_memory_end+0xdffff>
    1380:	fe010113          	addi	sp,sp,-32
    1384:	00b878b3          	and	a7,a6,a1
    1388:	0145d713          	srli	a4,a1,0x14
    138c:	01d55793          	srli	a5,a0,0x1d
    1390:	00d87833          	and	a6,a6,a3
    1394:	00912a23          	sw	s1,20(sp)
    1398:	7ff77493          	andi	s1,a4,2047
    139c:	00389713          	slli	a4,a7,0x3
    13a0:	0146d893          	srli	a7,a3,0x14
    13a4:	00381813          	slli	a6,a6,0x3
    13a8:	01212823          	sw	s2,16(sp)
    13ac:	00e7e7b3          	or	a5,a5,a4
    13b0:	7ff8f893          	andi	a7,a7,2047
    13b4:	01d65713          	srli	a4,a2,0x1d
    13b8:	00112e23          	sw	ra,28(sp)
    13bc:	00812c23          	sw	s0,24(sp)
    13c0:	01312623          	sw	s3,12(sp)
    13c4:	01f5d913          	srli	s2,a1,0x1f
    13c8:	01f6d693          	srli	a3,a3,0x1f
    13cc:	01076733          	or	a4,a4,a6
    13d0:	00351513          	slli	a0,a0,0x3
    13d4:	00361613          	slli	a2,a2,0x3
    13d8:	41148833          	sub	a6,s1,a7
    13dc:	2ad91a63          	bne	s2,a3,1690 <__adddf3+0x318>
    13e0:	11005c63          	blez	a6,14f8 <__adddf3+0x180>
    13e4:	04089063          	bnez	a7,1424 <__adddf3+0xac>
    13e8:	00c766b3          	or	a3,a4,a2
    13ec:	66068063          	beqz	a3,1a4c <__adddf3+0x6d4>
    13f0:	fff80593          	addi	a1,a6,-1
    13f4:	02059063          	bnez	a1,1414 <__adddf3+0x9c>
    13f8:	00c50633          	add	a2,a0,a2
    13fc:	00a636b3          	sltu	a3,a2,a0
    1400:	00e78733          	add	a4,a5,a4
    1404:	00060513          	mv	a0,a2
    1408:	00d707b3          	add	a5,a4,a3
    140c:	00100493          	li	s1,1
    1410:	06c0006f          	j	147c <__adddf3+0x104>
    1414:	7ff00693          	li	a3,2047
    1418:	02d81063          	bne	a6,a3,1438 <__adddf3+0xc0>
    141c:	7ff00493          	li	s1,2047
    1420:	1f80006f          	j	1618 <__adddf3+0x2a0>
    1424:	7ff00693          	li	a3,2047
    1428:	1ed48863          	beq	s1,a3,1618 <__adddf3+0x2a0>
    142c:	008006b7          	lui	a3,0x800
    1430:	00d76733          	or	a4,a4,a3
    1434:	00080593          	mv	a1,a6
    1438:	03800693          	li	a3,56
    143c:	0ab6c863          	blt	a3,a1,14ec <__adddf3+0x174>
    1440:	01f00693          	li	a3,31
    1444:	06b6ca63          	blt	a3,a1,14b8 <__adddf3+0x140>
    1448:	02000813          	li	a6,32
    144c:	40b80833          	sub	a6,a6,a1
    1450:	010716b3          	sll	a3,a4,a6
    1454:	00b658b3          	srl	a7,a2,a1
    1458:	01061833          	sll	a6,a2,a6
    145c:	0116e6b3          	or	a3,a3,a7
    1460:	01003833          	snez	a6,a6
    1464:	0106e6b3          	or	a3,a3,a6
    1468:	00b755b3          	srl	a1,a4,a1
    146c:	00a68533          	add	a0,a3,a0
    1470:	00f585b3          	add	a1,a1,a5
    1474:	00d536b3          	sltu	a3,a0,a3
    1478:	00d587b3          	add	a5,a1,a3
    147c:	00879713          	slli	a4,a5,0x8
    1480:	18075c63          	bgez	a4,1618 <__adddf3+0x2a0>
    1484:	00148493          	addi	s1,s1,1
    1488:	7ff00713          	li	a4,2047
    148c:	5ae48a63          	beq	s1,a4,1a40 <__adddf3+0x6c8>
    1490:	ff800737          	lui	a4,0xff800
    1494:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    1498:	00e7f733          	and	a4,a5,a4
    149c:	00155793          	srli	a5,a0,0x1
    14a0:	00157513          	andi	a0,a0,1
    14a4:	00a7e7b3          	or	a5,a5,a0
    14a8:	01f71513          	slli	a0,a4,0x1f
    14ac:	00f56533          	or	a0,a0,a5
    14b0:	00175793          	srli	a5,a4,0x1
    14b4:	1640006f          	j	1618 <__adddf3+0x2a0>
    14b8:	fe058693          	addi	a3,a1,-32
    14bc:	02000893          	li	a7,32
    14c0:	00d756b3          	srl	a3,a4,a3
    14c4:	00000813          	li	a6,0
    14c8:	01158863          	beq	a1,a7,14d8 <__adddf3+0x160>
    14cc:	04000813          	li	a6,64
    14d0:	40b80833          	sub	a6,a6,a1
    14d4:	01071833          	sll	a6,a4,a6
    14d8:	00c86833          	or	a6,a6,a2
    14dc:	01003833          	snez	a6,a6
    14e0:	0106e6b3          	or	a3,a3,a6
    14e4:	00000593          	li	a1,0
    14e8:	f85ff06f          	j	146c <__adddf3+0xf4>
    14ec:	00c766b3          	or	a3,a4,a2
    14f0:	00d036b3          	snez	a3,a3
    14f4:	ff1ff06f          	j	14e4 <__adddf3+0x16c>
    14f8:	0c080a63          	beqz	a6,15cc <__adddf3+0x254>
    14fc:	409886b3          	sub	a3,a7,s1
    1500:	02049463          	bnez	s1,1528 <__adddf3+0x1b0>
    1504:	00a7e5b3          	or	a1,a5,a0
    1508:	50058e63          	beqz	a1,1a24 <__adddf3+0x6ac>
    150c:	fff68593          	addi	a1,a3,-1 # 7fffff <_memory_end+0x7dffff>
    1510:	ee0584e3          	beqz	a1,13f8 <__adddf3+0x80>
    1514:	7ff00813          	li	a6,2047
    1518:	03069263          	bne	a3,a6,153c <__adddf3+0x1c4>
    151c:	00070793          	mv	a5,a4
    1520:	00060513          	mv	a0,a2
    1524:	ef9ff06f          	j	141c <__adddf3+0xa4>
    1528:	7ff00593          	li	a1,2047
    152c:	feb888e3          	beq	a7,a1,151c <__adddf3+0x1a4>
    1530:	008005b7          	lui	a1,0x800
    1534:	00b7e7b3          	or	a5,a5,a1
    1538:	00068593          	mv	a1,a3
    153c:	03800693          	li	a3,56
    1540:	08b6c063          	blt	a3,a1,15c0 <__adddf3+0x248>
    1544:	01f00693          	li	a3,31
    1548:	04b6c263          	blt	a3,a1,158c <__adddf3+0x214>
    154c:	02000813          	li	a6,32
    1550:	40b80833          	sub	a6,a6,a1
    1554:	010796b3          	sll	a3,a5,a6
    1558:	00b55333          	srl	t1,a0,a1
    155c:	01051833          	sll	a6,a0,a6
    1560:	0066e6b3          	or	a3,a3,t1
    1564:	01003833          	snez	a6,a6
    1568:	0106e6b3          	or	a3,a3,a6
    156c:	00b7d5b3          	srl	a1,a5,a1
    1570:	00c68633          	add	a2,a3,a2
    1574:	00e585b3          	add	a1,a1,a4
    1578:	00d636b3          	sltu	a3,a2,a3
    157c:	00060513          	mv	a0,a2
    1580:	00d587b3          	add	a5,a1,a3
    1584:	00088493          	mv	s1,a7
    1588:	ef5ff06f          	j	147c <__adddf3+0x104>
    158c:	fe058693          	addi	a3,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    1590:	02000313          	li	t1,32
    1594:	00d7d6b3          	srl	a3,a5,a3
    1598:	00000813          	li	a6,0
    159c:	00658863          	beq	a1,t1,15ac <__adddf3+0x234>
    15a0:	04000813          	li	a6,64
    15a4:	40b80833          	sub	a6,a6,a1
    15a8:	01079833          	sll	a6,a5,a6
    15ac:	00a86833          	or	a6,a6,a0
    15b0:	01003833          	snez	a6,a6
    15b4:	0106e6b3          	or	a3,a3,a6
    15b8:	00000593          	li	a1,0
    15bc:	fb5ff06f          	j	1570 <__adddf3+0x1f8>
    15c0:	00a7e6b3          	or	a3,a5,a0
    15c4:	00d036b3          	snez	a3,a3
    15c8:	ff1ff06f          	j	15b8 <__adddf3+0x240>
    15cc:	00148693          	addi	a3,s1,1
    15d0:	7fe6f593          	andi	a1,a3,2046
    15d4:	08059663          	bnez	a1,1660 <__adddf3+0x2e8>
    15d8:	00a7e6b3          	or	a3,a5,a0
    15dc:	06049263          	bnez	s1,1640 <__adddf3+0x2c8>
    15e0:	44068863          	beqz	a3,1a30 <__adddf3+0x6b8>
    15e4:	00c766b3          	or	a3,a4,a2
    15e8:	02068863          	beqz	a3,1618 <__adddf3+0x2a0>
    15ec:	00c50633          	add	a2,a0,a2
    15f0:	00a636b3          	sltu	a3,a2,a0
    15f4:	00e78733          	add	a4,a5,a4
    15f8:	00d707b3          	add	a5,a4,a3
    15fc:	00879713          	slli	a4,a5,0x8
    1600:	00060513          	mv	a0,a2
    1604:	00075a63          	bgez	a4,1618 <__adddf3+0x2a0>
    1608:	ff800737          	lui	a4,0xff800
    160c:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    1610:	00e7f7b3          	and	a5,a5,a4
    1614:	00100493          	li	s1,1
    1618:	00757713          	andi	a4,a0,7
    161c:	44070863          	beqz	a4,1a6c <__adddf3+0x6f4>
    1620:	00f57713          	andi	a4,a0,15
    1624:	00400693          	li	a3,4
    1628:	44d70263          	beq	a4,a3,1a6c <__adddf3+0x6f4>
    162c:	00450713          	addi	a4,a0,4
    1630:	00a736b3          	sltu	a3,a4,a0
    1634:	00d787b3          	add	a5,a5,a3
    1638:	00070513          	mv	a0,a4
    163c:	4300006f          	j	1a6c <__adddf3+0x6f4>
    1640:	ec068ee3          	beqz	a3,151c <__adddf3+0x1a4>
    1644:	00c76633          	or	a2,a4,a2
    1648:	dc060ae3          	beqz	a2,141c <__adddf3+0xa4>
    164c:	00000913          	li	s2,0
    1650:	004007b7          	lui	a5,0x400
    1654:	00000513          	li	a0,0
    1658:	7ff00493          	li	s1,2047
    165c:	4100006f          	j	1a6c <__adddf3+0x6f4>
    1660:	7ff00593          	li	a1,2047
    1664:	3cb68c63          	beq	a3,a1,1a3c <__adddf3+0x6c4>
    1668:	00c50633          	add	a2,a0,a2
    166c:	00a63533          	sltu	a0,a2,a0
    1670:	00e78733          	add	a4,a5,a4
    1674:	00a70733          	add	a4,a4,a0
    1678:	01f71513          	slli	a0,a4,0x1f
    167c:	00165613          	srli	a2,a2,0x1
    1680:	00c56533          	or	a0,a0,a2
    1684:	00175793          	srli	a5,a4,0x1
    1688:	00068493          	mv	s1,a3
    168c:	f8dff06f          	j	1618 <__adddf3+0x2a0>
    1690:	0f005c63          	blez	a6,1788 <__adddf3+0x410>
    1694:	08089e63          	bnez	a7,1730 <__adddf3+0x3b8>
    1698:	00c766b3          	or	a3,a4,a2
    169c:	3a068863          	beqz	a3,1a4c <__adddf3+0x6d4>
    16a0:	fff80693          	addi	a3,a6,-1
    16a4:	02069063          	bnez	a3,16c4 <__adddf3+0x34c>
    16a8:	40c50633          	sub	a2,a0,a2
    16ac:	00c536b3          	sltu	a3,a0,a2
    16b0:	40e78733          	sub	a4,a5,a4
    16b4:	00060513          	mv	a0,a2
    16b8:	40d707b3          	sub	a5,a4,a3
    16bc:	00100493          	li	s1,1
    16c0:	0540006f          	j	1714 <__adddf3+0x39c>
    16c4:	7ff00593          	li	a1,2047
    16c8:	d4b80ae3          	beq	a6,a1,141c <__adddf3+0xa4>
    16cc:	03800593          	li	a1,56
    16d0:	0ad5c663          	blt	a1,a3,177c <__adddf3+0x404>
    16d4:	01f00593          	li	a1,31
    16d8:	06d5c863          	blt	a1,a3,1748 <__adddf3+0x3d0>
    16dc:	02000813          	li	a6,32
    16e0:	40d80833          	sub	a6,a6,a3
    16e4:	00d658b3          	srl	a7,a2,a3
    16e8:	010715b3          	sll	a1,a4,a6
    16ec:	01061833          	sll	a6,a2,a6
    16f0:	0115e5b3          	or	a1,a1,a7
    16f4:	01003833          	snez	a6,a6
    16f8:	0105e633          	or	a2,a1,a6
    16fc:	00d756b3          	srl	a3,a4,a3
    1700:	40c50633          	sub	a2,a0,a2
    1704:	00c53733          	sltu	a4,a0,a2
    1708:	40d786b3          	sub	a3,a5,a3
    170c:	00060513          	mv	a0,a2
    1710:	40e687b3          	sub	a5,a3,a4
    1714:	00879713          	slli	a4,a5,0x8
    1718:	f00750e3          	bgez	a4,1618 <__adddf3+0x2a0>
    171c:	00800437          	lui	s0,0x800
    1720:	fff40413          	addi	s0,s0,-1 # 7fffff <_memory_end+0x7dffff>
    1724:	0087f433          	and	s0,a5,s0
    1728:	00050993          	mv	s3,a0
    172c:	2100006f          	j	193c <__adddf3+0x5c4>
    1730:	7ff00693          	li	a3,2047
    1734:	eed482e3          	beq	s1,a3,1618 <__adddf3+0x2a0>
    1738:	008006b7          	lui	a3,0x800
    173c:	00d76733          	or	a4,a4,a3
    1740:	00080693          	mv	a3,a6
    1744:	f89ff06f          	j	16cc <__adddf3+0x354>
    1748:	fe068593          	addi	a1,a3,-32 # 7fffe0 <_memory_end+0x7dffe0>
    174c:	02000893          	li	a7,32
    1750:	00b755b3          	srl	a1,a4,a1
    1754:	00000813          	li	a6,0
    1758:	01168863          	beq	a3,a7,1768 <__adddf3+0x3f0>
    175c:	04000813          	li	a6,64
    1760:	40d80833          	sub	a6,a6,a3
    1764:	01071833          	sll	a6,a4,a6
    1768:	00c86833          	or	a6,a6,a2
    176c:	01003833          	snez	a6,a6
    1770:	0105e633          	or	a2,a1,a6
    1774:	00000693          	li	a3,0
    1778:	f89ff06f          	j	1700 <__adddf3+0x388>
    177c:	00c76633          	or	a2,a4,a2
    1780:	00c03633          	snez	a2,a2
    1784:	ff1ff06f          	j	1774 <__adddf3+0x3fc>
    1788:	0e080863          	beqz	a6,1878 <__adddf3+0x500>
    178c:	40988833          	sub	a6,a7,s1
    1790:	04049263          	bnez	s1,17d4 <__adddf3+0x45c>
    1794:	00a7e5b3          	or	a1,a5,a0
    1798:	2a058e63          	beqz	a1,1a54 <__adddf3+0x6dc>
    179c:	fff80593          	addi	a1,a6,-1
    17a0:	00059e63          	bnez	a1,17bc <__adddf3+0x444>
    17a4:	40a60533          	sub	a0,a2,a0
    17a8:	40f70733          	sub	a4,a4,a5
    17ac:	00a63633          	sltu	a2,a2,a0
    17b0:	40c707b3          	sub	a5,a4,a2
    17b4:	00068913          	mv	s2,a3
    17b8:	f05ff06f          	j	16bc <__adddf3+0x344>
    17bc:	7ff00313          	li	t1,2047
    17c0:	02681463          	bne	a6,t1,17e8 <__adddf3+0x470>
    17c4:	00070793          	mv	a5,a4
    17c8:	00060513          	mv	a0,a2
    17cc:	7ff00493          	li	s1,2047
    17d0:	0d00006f          	j	18a0 <__adddf3+0x528>
    17d4:	7ff00593          	li	a1,2047
    17d8:	feb886e3          	beq	a7,a1,17c4 <__adddf3+0x44c>
    17dc:	008005b7          	lui	a1,0x800
    17e0:	00b7e7b3          	or	a5,a5,a1
    17e4:	00080593          	mv	a1,a6
    17e8:	03800813          	li	a6,56
    17ec:	08b84063          	blt	a6,a1,186c <__adddf3+0x4f4>
    17f0:	01f00813          	li	a6,31
    17f4:	04b84263          	blt	a6,a1,1838 <__adddf3+0x4c0>
    17f8:	02000313          	li	t1,32
    17fc:	40b30333          	sub	t1,t1,a1
    1800:	00b55e33          	srl	t3,a0,a1
    1804:	00679833          	sll	a6,a5,t1
    1808:	00651333          	sll	t1,a0,t1
    180c:	01c86833          	or	a6,a6,t3
    1810:	00603333          	snez	t1,t1
    1814:	00686533          	or	a0,a6,t1
    1818:	00b7d5b3          	srl	a1,a5,a1
    181c:	40a60533          	sub	a0,a2,a0
    1820:	40b705b3          	sub	a1,a4,a1
    1824:	00a63633          	sltu	a2,a2,a0
    1828:	40c587b3          	sub	a5,a1,a2
    182c:	00088493          	mv	s1,a7
    1830:	00068913          	mv	s2,a3
    1834:	ee1ff06f          	j	1714 <__adddf3+0x39c>
    1838:	fe058813          	addi	a6,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    183c:	02000e13          	li	t3,32
    1840:	0107d833          	srl	a6,a5,a6
    1844:	00000313          	li	t1,0
    1848:	01c58863          	beq	a1,t3,1858 <__adddf3+0x4e0>
    184c:	04000313          	li	t1,64
    1850:	40b30333          	sub	t1,t1,a1
    1854:	00679333          	sll	t1,a5,t1
    1858:	00a36333          	or	t1,t1,a0
    185c:	00603333          	snez	t1,t1
    1860:	00686533          	or	a0,a6,t1
    1864:	00000593          	li	a1,0
    1868:	fb5ff06f          	j	181c <__adddf3+0x4a4>
    186c:	00a7e533          	or	a0,a5,a0
    1870:	00a03533          	snez	a0,a0
    1874:	ff1ff06f          	j	1864 <__adddf3+0x4ec>
    1878:	00148593          	addi	a1,s1,1
    187c:	7fe5f593          	andi	a1,a1,2046
    1880:	08059663          	bnez	a1,190c <__adddf3+0x594>
    1884:	00a7e833          	or	a6,a5,a0
    1888:	00c765b3          	or	a1,a4,a2
    188c:	06049063          	bnez	s1,18ec <__adddf3+0x574>
    1890:	00081c63          	bnez	a6,18a8 <__adddf3+0x530>
    1894:	10058e63          	beqz	a1,19b0 <__adddf3+0x638>
    1898:	00070793          	mv	a5,a4
    189c:	00060513          	mv	a0,a2
    18a0:	00068913          	mv	s2,a3
    18a4:	d75ff06f          	j	1618 <__adddf3+0x2a0>
    18a8:	d60588e3          	beqz	a1,1618 <__adddf3+0x2a0>
    18ac:	40c50833          	sub	a6,a0,a2
    18b0:	010538b3          	sltu	a7,a0,a6
    18b4:	40e785b3          	sub	a1,a5,a4
    18b8:	411585b3          	sub	a1,a1,a7
    18bc:	00859893          	slli	a7,a1,0x8
    18c0:	0008dc63          	bgez	a7,18d8 <__adddf3+0x560>
    18c4:	40a60533          	sub	a0,a2,a0
    18c8:	40f70733          	sub	a4,a4,a5
    18cc:	00a63633          	sltu	a2,a2,a0
    18d0:	40c707b3          	sub	a5,a4,a2
    18d4:	fcdff06f          	j	18a0 <__adddf3+0x528>
    18d8:	00b86533          	or	a0,a6,a1
    18dc:	18050463          	beqz	a0,1a64 <__adddf3+0x6ec>
    18e0:	00058793          	mv	a5,a1
    18e4:	00080513          	mv	a0,a6
    18e8:	d31ff06f          	j	1618 <__adddf3+0x2a0>
    18ec:	00081c63          	bnez	a6,1904 <__adddf3+0x58c>
    18f0:	d4058ee3          	beqz	a1,164c <__adddf3+0x2d4>
    18f4:	00070793          	mv	a5,a4
    18f8:	00060513          	mv	a0,a2
    18fc:	00068913          	mv	s2,a3
    1900:	b1dff06f          	j	141c <__adddf3+0xa4>
    1904:	b0058ce3          	beqz	a1,141c <__adddf3+0xa4>
    1908:	d45ff06f          	j	164c <__adddf3+0x2d4>
    190c:	40c505b3          	sub	a1,a0,a2
    1910:	00b53833          	sltu	a6,a0,a1
    1914:	40e78433          	sub	s0,a5,a4
    1918:	41040433          	sub	s0,s0,a6
    191c:	00841813          	slli	a6,s0,0x8
    1920:	00058993          	mv	s3,a1
    1924:	08085063          	bgez	a6,19a4 <__adddf3+0x62c>
    1928:	40a609b3          	sub	s3,a2,a0
    192c:	40f70433          	sub	s0,a4,a5
    1930:	01363633          	sltu	a2,a2,s3
    1934:	40c40433          	sub	s0,s0,a2
    1938:	00068913          	mv	s2,a3
    193c:	06040e63          	beqz	s0,19b8 <__adddf3+0x640>
    1940:	00040513          	mv	a0,s0
    1944:	619000ef          	jal	275c <__clzsi2>
    1948:	ff850693          	addi	a3,a0,-8
    194c:	02000793          	li	a5,32
    1950:	40d787b3          	sub	a5,a5,a3
    1954:	00d41433          	sll	s0,s0,a3
    1958:	00f9d7b3          	srl	a5,s3,a5
    195c:	0087e7b3          	or	a5,a5,s0
    1960:	00d99433          	sll	s0,s3,a3
    1964:	0a96c463          	blt	a3,s1,1a0c <__adddf3+0x694>
    1968:	409686b3          	sub	a3,a3,s1
    196c:	00168613          	addi	a2,a3,1
    1970:	01f00713          	li	a4,31
    1974:	06c74263          	blt	a4,a2,19d8 <__adddf3+0x660>
    1978:	02000713          	li	a4,32
    197c:	40c70733          	sub	a4,a4,a2
    1980:	00e79533          	sll	a0,a5,a4
    1984:	00c456b3          	srl	a3,s0,a2
    1988:	00e41733          	sll	a4,s0,a4
    198c:	00d56533          	or	a0,a0,a3
    1990:	00e03733          	snez	a4,a4
    1994:	00e56533          	or	a0,a0,a4
    1998:	00c7d7b3          	srl	a5,a5,a2
    199c:	00000493          	li	s1,0
    19a0:	c79ff06f          	j	1618 <__adddf3+0x2a0>
    19a4:	0085e5b3          	or	a1,a1,s0
    19a8:	f8059ae3          	bnez	a1,193c <__adddf3+0x5c4>
    19ac:	00000493          	li	s1,0
    19b0:	00000913          	li	s2,0
    19b4:	08c0006f          	j	1a40 <__adddf3+0x6c8>
    19b8:	00098513          	mv	a0,s3
    19bc:	5a1000ef          	jal	275c <__clzsi2>
    19c0:	01850693          	addi	a3,a0,24
    19c4:	01f00793          	li	a5,31
    19c8:	f8d7d2e3          	bge	a5,a3,194c <__adddf3+0x5d4>
    19cc:	ff850793          	addi	a5,a0,-8
    19d0:	00f997b3          	sll	a5,s3,a5
    19d4:	f91ff06f          	j	1964 <__adddf3+0x5ec>
    19d8:	fe168693          	addi	a3,a3,-31
    19dc:	00d7d533          	srl	a0,a5,a3
    19e0:	02000693          	li	a3,32
    19e4:	00000713          	li	a4,0
    19e8:	00d60863          	beq	a2,a3,19f8 <__adddf3+0x680>
    19ec:	04000713          	li	a4,64
    19f0:	40c70733          	sub	a4,a4,a2
    19f4:	00e79733          	sll	a4,a5,a4
    19f8:	00e46733          	or	a4,s0,a4
    19fc:	00e03733          	snez	a4,a4
    1a00:	00e56533          	or	a0,a0,a4
    1a04:	00000793          	li	a5,0
    1a08:	f95ff06f          	j	199c <__adddf3+0x624>
    1a0c:	ff800737          	lui	a4,0xff800
    1a10:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    1a14:	40d484b3          	sub	s1,s1,a3
    1a18:	00e7f7b3          	and	a5,a5,a4
    1a1c:	00040513          	mv	a0,s0
    1a20:	bf9ff06f          	j	1618 <__adddf3+0x2a0>
    1a24:	00070793          	mv	a5,a4
    1a28:	00060513          	mv	a0,a2
    1a2c:	c5dff06f          	j	1688 <__adddf3+0x310>
    1a30:	00070793          	mv	a5,a4
    1a34:	00060513          	mv	a0,a2
    1a38:	be1ff06f          	j	1618 <__adddf3+0x2a0>
    1a3c:	7ff00493          	li	s1,2047
    1a40:	00000793          	li	a5,0
    1a44:	00000513          	li	a0,0
    1a48:	0240006f          	j	1a6c <__adddf3+0x6f4>
    1a4c:	00080493          	mv	s1,a6
    1a50:	bc9ff06f          	j	1618 <__adddf3+0x2a0>
    1a54:	00070793          	mv	a5,a4
    1a58:	00060513          	mv	a0,a2
    1a5c:	00080493          	mv	s1,a6
    1a60:	e41ff06f          	j	18a0 <__adddf3+0x528>
    1a64:	00000793          	li	a5,0
    1a68:	00000913          	li	s2,0
    1a6c:	00879713          	slli	a4,a5,0x8
    1a70:	00075e63          	bgez	a4,1a8c <__adddf3+0x714>
    1a74:	00148493          	addi	s1,s1,1
    1a78:	7ff00713          	li	a4,2047
    1a7c:	08e48263          	beq	s1,a4,1b00 <__adddf3+0x788>
    1a80:	ff800737          	lui	a4,0xff800
    1a84:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    1a88:	00e7f7b3          	and	a5,a5,a4
    1a8c:	01d79693          	slli	a3,a5,0x1d
    1a90:	00355513          	srli	a0,a0,0x3
    1a94:	7ff00713          	li	a4,2047
    1a98:	00a6e6b3          	or	a3,a3,a0
    1a9c:	0037d793          	srli	a5,a5,0x3
    1aa0:	00e49e63          	bne	s1,a4,1abc <__adddf3+0x744>
    1aa4:	00f6e6b3          	or	a3,a3,a5
    1aa8:	00000793          	li	a5,0
    1aac:	00068863          	beqz	a3,1abc <__adddf3+0x744>
    1ab0:	000807b7          	lui	a5,0x80
    1ab4:	00000693          	li	a3,0
    1ab8:	00000913          	li	s2,0
    1abc:	01449713          	slli	a4,s1,0x14
    1ac0:	7ff00637          	lui	a2,0x7ff00
    1ac4:	00c79793          	slli	a5,a5,0xc
    1ac8:	00c77733          	and	a4,a4,a2
    1acc:	01c12083          	lw	ra,28(sp)
    1ad0:	01812403          	lw	s0,24(sp)
    1ad4:	00c7d793          	srli	a5,a5,0xc
    1ad8:	00f767b3          	or	a5,a4,a5
    1adc:	01f91713          	slli	a4,s2,0x1f
    1ae0:	00e7e633          	or	a2,a5,a4
    1ae4:	01412483          	lw	s1,20(sp)
    1ae8:	01012903          	lw	s2,16(sp)
    1aec:	00c12983          	lw	s3,12(sp)
    1af0:	00068513          	mv	a0,a3
    1af4:	00060593          	mv	a1,a2
    1af8:	02010113          	addi	sp,sp,32
    1afc:	00008067          	ret
    1b00:	00000793          	li	a5,0
    1b04:	00000513          	li	a0,0
    1b08:	f85ff06f          	j	1a8c <__adddf3+0x714>

00001b0c <__fixdfsi>:
    1b0c:	0145d713          	srli	a4,a1,0x14
    1b10:	001006b7          	lui	a3,0x100
    1b14:	fff68793          	addi	a5,a3,-1 # fffff <_memory_end+0xdffff>
    1b18:	7ff77713          	andi	a4,a4,2047
    1b1c:	3fe00613          	li	a2,1022
    1b20:	00b7f7b3          	and	a5,a5,a1
    1b24:	01f5d593          	srli	a1,a1,0x1f
    1b28:	04e65e63          	bge	a2,a4,1b84 <__fixdfsi+0x78>
    1b2c:	41d00613          	li	a2,1053
    1b30:	00e65a63          	bge	a2,a4,1b44 <__fixdfsi+0x38>
    1b34:	80000537          	lui	a0,0x80000
    1b38:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
    1b3c:	00a58533          	add	a0,a1,a0
    1b40:	00008067          	ret
    1b44:	00d7e7b3          	or	a5,a5,a3
    1b48:	43300693          	li	a3,1075
    1b4c:	40e686b3          	sub	a3,a3,a4
    1b50:	01f00613          	li	a2,31
    1b54:	02d64063          	blt	a2,a3,1b74 <__fixdfsi+0x68>
    1b58:	bed70713          	addi	a4,a4,-1043
    1b5c:	00e797b3          	sll	a5,a5,a4
    1b60:	00d55533          	srl	a0,a0,a3
    1b64:	00a7e533          	or	a0,a5,a0
    1b68:	02058063          	beqz	a1,1b88 <__fixdfsi+0x7c>
    1b6c:	40a00533          	neg	a0,a0
    1b70:	00008067          	ret
    1b74:	41300693          	li	a3,1043
    1b78:	40e68733          	sub	a4,a3,a4
    1b7c:	00e7d533          	srl	a0,a5,a4
    1b80:	fe9ff06f          	j	1b68 <__fixdfsi+0x5c>
    1b84:	00000513          	li	a0,0
    1b88:	00008067          	ret

00001b8c <__floatunsidf>:
    1b8c:	ff010113          	addi	sp,sp,-16
    1b90:	00812423          	sw	s0,8(sp)
    1b94:	00112623          	sw	ra,12(sp)
    1b98:	00050413          	mv	s0,a0
    1b9c:	06050263          	beqz	a0,1c00 <__floatunsidf+0x74>
    1ba0:	3bd000ef          	jal	275c <__clzsi2>
    1ba4:	41e00713          	li	a4,1054
    1ba8:	00a00793          	li	a5,10
    1bac:	40a70733          	sub	a4,a4,a0
    1bb0:	04a7c063          	blt	a5,a0,1bf0 <__floatunsidf+0x64>
    1bb4:	00b00793          	li	a5,11
    1bb8:	40a787b3          	sub	a5,a5,a0
    1bbc:	01550513          	addi	a0,a0,21
    1bc0:	00f457b3          	srl	a5,s0,a5
    1bc4:	00a41433          	sll	s0,s0,a0
    1bc8:	00c12083          	lw	ra,12(sp)
    1bcc:	00040513          	mv	a0,s0
    1bd0:	00c79793          	slli	a5,a5,0xc
    1bd4:	00812403          	lw	s0,8(sp)
    1bd8:	01471713          	slli	a4,a4,0x14
    1bdc:	00c7d793          	srli	a5,a5,0xc
    1be0:	00f766b3          	or	a3,a4,a5
    1be4:	00068593          	mv	a1,a3
    1be8:	01010113          	addi	sp,sp,16
    1bec:	00008067          	ret
    1bf0:	ff550513          	addi	a0,a0,-11
    1bf4:	00a417b3          	sll	a5,s0,a0
    1bf8:	00000413          	li	s0,0
    1bfc:	fcdff06f          	j	1bc8 <__floatunsidf+0x3c>
    1c00:	00000793          	li	a5,0
    1c04:	00000713          	li	a4,0
    1c08:	fc1ff06f          	j	1bc8 <__floatunsidf+0x3c>

00001c0c <__eqsf2>:
    1c0c:	01755693          	srli	a3,a0,0x17
    1c10:	008007b7          	lui	a5,0x800
    1c14:	fff78793          	addi	a5,a5,-1 # 7fffff <_memory_end+0x7dffff>
    1c18:	0175d613          	srli	a2,a1,0x17
    1c1c:	0ff6f693          	zext.b	a3,a3
    1c20:	0ff00893          	li	a7,255
    1c24:	00a7f833          	and	a6,a5,a0
    1c28:	01f55713          	srli	a4,a0,0x1f
    1c2c:	00b7f7b3          	and	a5,a5,a1
    1c30:	0ff67613          	zext.b	a2,a2
    1c34:	01f5d593          	srli	a1,a1,0x1f
    1c38:	00100513          	li	a0,1
    1c3c:	01169a63          	bne	a3,a7,1c50 <__eqsf2+0x44>
    1c40:	00081663          	bnez	a6,1c4c <__eqsf2+0x40>
    1c44:	00d61463          	bne	a2,a3,1c4c <__eqsf2+0x40>
    1c48:	00078a63          	beqz	a5,1c5c <__eqsf2+0x50>
    1c4c:	00008067          	ret
    1c50:	ff160ee3          	beq	a2,a7,1c4c <__eqsf2+0x40>
    1c54:	fec69ce3          	bne	a3,a2,1c4c <__eqsf2+0x40>
    1c58:	fef81ae3          	bne	a6,a5,1c4c <__eqsf2+0x40>
    1c5c:	00000513          	li	a0,0
    1c60:	feb706e3          	beq	a4,a1,1c4c <__eqsf2+0x40>
    1c64:	00100513          	li	a0,1
    1c68:	fe0692e3          	bnez	a3,1c4c <__eqsf2+0x40>
    1c6c:	01003533          	snez	a0,a6
    1c70:	00008067          	ret

00001c74 <__lesf2>:
    1c74:	008007b7          	lui	a5,0x800
    1c78:	fff78793          	addi	a5,a5,-1 # 7fffff <_memory_end+0x7dffff>
    1c7c:	01755693          	srli	a3,a0,0x17
    1c80:	00a7f633          	and	a2,a5,a0
    1c84:	01f55713          	srli	a4,a0,0x1f
    1c88:	0ff6f693          	zext.b	a3,a3
    1c8c:	0175d513          	srli	a0,a1,0x17
    1c90:	0ff00813          	li	a6,255
    1c94:	00b7f7b3          	and	a5,a5,a1
    1c98:	0ff57513          	zext.b	a0,a0
    1c9c:	01f5d593          	srli	a1,a1,0x1f
    1ca0:	01069463          	bne	a3,a6,1ca8 <__lesf2+0x34>
    1ca4:	04061263          	bnez	a2,1ce8 <__lesf2+0x74>
    1ca8:	0ff00813          	li	a6,255
    1cac:	01051463          	bne	a0,a6,1cb4 <__lesf2+0x40>
    1cb0:	02079c63          	bnez	a5,1ce8 <__lesf2+0x74>
    1cb4:	04069a63          	bnez	a3,1d08 <__lesf2+0x94>
    1cb8:	02051c63          	bnez	a0,1cf0 <__lesf2+0x7c>
    1cbc:	04061863          	bnez	a2,1d0c <__lesf2+0x98>
    1cc0:	04078263          	beqz	a5,1d04 <__lesf2+0x90>
    1cc4:	00100513          	li	a0,1
    1cc8:	02059e63          	bnez	a1,1d04 <__lesf2+0x90>
    1ccc:	fff00513          	li	a0,-1
    1cd0:	00008067          	ret
    1cd4:	fea6c8e3          	blt	a3,a0,1cc4 <__lesf2+0x50>
    1cd8:	02c7e263          	bltu	a5,a2,1cfc <__lesf2+0x88>
    1cdc:	00000513          	li	a0,0
    1ce0:	02f67263          	bgeu	a2,a5,1d04 <__lesf2+0x90>
    1ce4:	fe1ff06f          	j	1cc4 <__lesf2+0x50>
    1ce8:	00200513          	li	a0,2
    1cec:	00008067          	ret
    1cf0:	fc060ae3          	beqz	a2,1cc4 <__lesf2+0x50>
    1cf4:	00e59e63          	bne	a1,a4,1d10 <__lesf2+0x9c>
    1cf8:	fcd55ee3          	bge	a0,a3,1cd4 <__lesf2+0x60>
    1cfc:	fff00513          	li	a0,-1
    1d00:	00058c63          	beqz	a1,1d18 <__lesf2+0xa4>
    1d04:	00008067          	ret
    1d08:	fe0516e3          	bnez	a0,1cf4 <__lesf2+0x80>
    1d0c:	fe0794e3          	bnez	a5,1cf4 <__lesf2+0x80>
    1d10:	fff00513          	li	a0,-1
    1d14:	fe0718e3          	bnez	a4,1d04 <__lesf2+0x90>
    1d18:	00100513          	li	a0,1
    1d1c:	00008067          	ret

00001d20 <__mulsf3>:
    1d20:	fe010113          	addi	sp,sp,-32
    1d24:	01212823          	sw	s2,16(sp)
    1d28:	01755913          	srli	s2,a0,0x17
    1d2c:	00912a23          	sw	s1,20(sp)
    1d30:	01312623          	sw	s3,12(sp)
    1d34:	01512223          	sw	s5,4(sp)
    1d38:	00951493          	slli	s1,a0,0x9
    1d3c:	00112e23          	sw	ra,28(sp)
    1d40:	00812c23          	sw	s0,24(sp)
    1d44:	01412423          	sw	s4,8(sp)
    1d48:	0ff97913          	zext.b	s2,s2
    1d4c:	00058a93          	mv	s5,a1
    1d50:	0094d493          	srli	s1,s1,0x9
    1d54:	01f55993          	srli	s3,a0,0x1f
    1d58:	10090863          	beqz	s2,1e68 <__mulsf3+0x148>
    1d5c:	0ff00793          	li	a5,255
    1d60:	12f90463          	beq	s2,a5,1e88 <__mulsf3+0x168>
    1d64:	00349493          	slli	s1,s1,0x3
    1d68:	040007b7          	lui	a5,0x4000
    1d6c:	00f4e4b3          	or	s1,s1,a5
    1d70:	f8190913          	addi	s2,s2,-127
    1d74:	00000a13          	li	s4,0
    1d78:	017ad793          	srli	a5,s5,0x17
    1d7c:	009a9413          	slli	s0,s5,0x9
    1d80:	0ff7f793          	zext.b	a5,a5
    1d84:	00945413          	srli	s0,s0,0x9
    1d88:	01fada93          	srli	s5,s5,0x1f
    1d8c:	10078e63          	beqz	a5,1ea8 <__mulsf3+0x188>
    1d90:	0ff00713          	li	a4,255
    1d94:	12e78a63          	beq	a5,a4,1ec8 <__mulsf3+0x1a8>
    1d98:	00341413          	slli	s0,s0,0x3
    1d9c:	04000737          	lui	a4,0x4000
    1da0:	00e46433          	or	s0,s0,a4
    1da4:	f8178793          	addi	a5,a5,-127 # 3ffff81 <_memory_end+0x3fdff81>
    1da8:	00000713          	li	a4,0
    1dac:	00f90933          	add	s2,s2,a5
    1db0:	002a1793          	slli	a5,s4,0x2
    1db4:	00e7e7b3          	or	a5,a5,a4
    1db8:	00a00613          	li	a2,10
    1dbc:	00190693          	addi	a3,s2,1
    1dc0:	1ef64263          	blt	a2,a5,1fa4 <__mulsf3+0x284>
    1dc4:	00200613          	li	a2,2
    1dc8:	0159c9b3          	xor	s3,s3,s5
    1dcc:	10f64e63          	blt	a2,a5,1ee8 <__mulsf3+0x1c8>
    1dd0:	fff78793          	addi	a5,a5,-1
    1dd4:	00100613          	li	a2,1
    1dd8:	12f67a63          	bgeu	a2,a5,1f0c <__mulsf3+0x1ec>
    1ddc:	00010837          	lui	a6,0x10
    1de0:	fff80513          	addi	a0,a6,-1 # ffff <_bss_end+0xd51f>
    1de4:	0104d613          	srli	a2,s1,0x10
    1de8:	01045793          	srli	a5,s0,0x10
    1dec:	00a4f4b3          	and	s1,s1,a0
    1df0:	00a47433          	and	s0,s0,a0
    1df4:	029405b3          	mul	a1,s0,s1
    1df8:	02860433          	mul	s0,a2,s0
    1dfc:	02f60633          	mul	a2,a2,a5
    1e00:	029787b3          	mul	a5,a5,s1
    1e04:	00878733          	add	a4,a5,s0
    1e08:	0105d793          	srli	a5,a1,0x10
    1e0c:	00e787b3          	add	a5,a5,a4
    1e10:	0087f463          	bgeu	a5,s0,1e18 <__mulsf3+0xf8>
    1e14:	01060633          	add	a2,a2,a6
    1e18:	00a7f733          	and	a4,a5,a0
    1e1c:	01071713          	slli	a4,a4,0x10
    1e20:	00a5f5b3          	and	a1,a1,a0
    1e24:	00b70733          	add	a4,a4,a1
    1e28:	0107d793          	srli	a5,a5,0x10
    1e2c:	00671413          	slli	s0,a4,0x6
    1e30:	00c787b3          	add	a5,a5,a2
    1e34:	01a75713          	srli	a4,a4,0x1a
    1e38:	00679793          	slli	a5,a5,0x6
    1e3c:	00803433          	snez	s0,s0
    1e40:	00e46433          	or	s0,s0,a4
    1e44:	00479713          	slli	a4,a5,0x4
    1e48:	0087e433          	or	s0,a5,s0
    1e4c:	00075a63          	bgez	a4,1e60 <__mulsf3+0x140>
    1e50:	00145793          	srli	a5,s0,0x1
    1e54:	00147413          	andi	s0,s0,1
    1e58:	0087e433          	or	s0,a5,s0
    1e5c:	00068913          	mv	s2,a3
    1e60:	00090693          	mv	a3,s2
    1e64:	0c00006f          	j	1f24 <__mulsf3+0x204>
    1e68:	02048a63          	beqz	s1,1e9c <__mulsf3+0x17c>
    1e6c:	00048513          	mv	a0,s1
    1e70:	0ed000ef          	jal	275c <__clzsi2>
    1e74:	ffb50793          	addi	a5,a0,-5
    1e78:	f8a00913          	li	s2,-118
    1e7c:	00f494b3          	sll	s1,s1,a5
    1e80:	40a90933          	sub	s2,s2,a0
    1e84:	ef1ff06f          	j	1d74 <__mulsf3+0x54>
    1e88:	0ff00913          	li	s2,255
    1e8c:	00200a13          	li	s4,2
    1e90:	ee0484e3          	beqz	s1,1d78 <__mulsf3+0x58>
    1e94:	00300a13          	li	s4,3
    1e98:	ee1ff06f          	j	1d78 <__mulsf3+0x58>
    1e9c:	00000913          	li	s2,0
    1ea0:	00100a13          	li	s4,1
    1ea4:	ed5ff06f          	j	1d78 <__mulsf3+0x58>
    1ea8:	02040a63          	beqz	s0,1edc <__mulsf3+0x1bc>
    1eac:	00040513          	mv	a0,s0
    1eb0:	0ad000ef          	jal	275c <__clzsi2>
    1eb4:	ffb50793          	addi	a5,a0,-5
    1eb8:	00f41433          	sll	s0,s0,a5
    1ebc:	f8a00793          	li	a5,-118
    1ec0:	40a787b3          	sub	a5,a5,a0
    1ec4:	ee5ff06f          	j	1da8 <__mulsf3+0x88>
    1ec8:	0ff00793          	li	a5,255
    1ecc:	00200713          	li	a4,2
    1ed0:	ec040ee3          	beqz	s0,1dac <__mulsf3+0x8c>
    1ed4:	00300713          	li	a4,3
    1ed8:	ed5ff06f          	j	1dac <__mulsf3+0x8c>
    1edc:	00000793          	li	a5,0
    1ee0:	00100713          	li	a4,1
    1ee4:	ec9ff06f          	j	1dac <__mulsf3+0x8c>
    1ee8:	00100613          	li	a2,1
    1eec:	00f617b3          	sll	a5,a2,a5
    1ef0:	5307f613          	andi	a2,a5,1328
    1ef4:	0c061063          	bnez	a2,1fb4 <__mulsf3+0x294>
    1ef8:	2407f613          	andi	a2,a5,576
    1efc:	12061263          	bnez	a2,2020 <__mulsf3+0x300>
    1f00:	0887f793          	andi	a5,a5,136
    1f04:	ec078ce3          	beqz	a5,1ddc <__mulsf3+0xbc>
    1f08:	000a8993          	mv	s3,s5
    1f0c:	00200793          	li	a5,2
    1f10:	10f70263          	beq	a4,a5,2014 <__mulsf3+0x2f4>
    1f14:	00300793          	li	a5,3
    1f18:	10f70463          	beq	a4,a5,2020 <__mulsf3+0x300>
    1f1c:	00100793          	li	a5,1
    1f20:	10f70863          	beq	a4,a5,2030 <__mulsf3+0x310>
    1f24:	07f68713          	addi	a4,a3,127
    1f28:	08e05c63          	blez	a4,1fc0 <__mulsf3+0x2a0>
    1f2c:	00747793          	andi	a5,s0,7
    1f30:	00078a63          	beqz	a5,1f44 <__mulsf3+0x224>
    1f34:	00f47793          	andi	a5,s0,15
    1f38:	00400613          	li	a2,4
    1f3c:	00c78463          	beq	a5,a2,1f44 <__mulsf3+0x224>
    1f40:	00440413          	addi	s0,s0,4
    1f44:	00441793          	slli	a5,s0,0x4
    1f48:	0007da63          	bgez	a5,1f5c <__mulsf3+0x23c>
    1f4c:	f80007b7          	lui	a5,0xf8000
    1f50:	fff78793          	addi	a5,a5,-1 # f7ffffff <_memory_end+0xf7fdffff>
    1f54:	00f47433          	and	s0,s0,a5
    1f58:	08068713          	addi	a4,a3,128
    1f5c:	0fe00793          	li	a5,254
    1f60:	0ae7ca63          	blt	a5,a4,2014 <__mulsf3+0x2f4>
    1f64:	00345793          	srli	a5,s0,0x3
    1f68:	01c12083          	lw	ra,28(sp)
    1f6c:	01812403          	lw	s0,24(sp)
    1f70:	00979793          	slli	a5,a5,0x9
    1f74:	01771513          	slli	a0,a4,0x17
    1f78:	0097d793          	srli	a5,a5,0x9
    1f7c:	01f99993          	slli	s3,s3,0x1f
    1f80:	00f56533          	or	a0,a0,a5
    1f84:	01412483          	lw	s1,20(sp)
    1f88:	01012903          	lw	s2,16(sp)
    1f8c:	00812a03          	lw	s4,8(sp)
    1f90:	00412a83          	lw	s5,4(sp)
    1f94:	01356533          	or	a0,a0,s3
    1f98:	00c12983          	lw	s3,12(sp)
    1f9c:	02010113          	addi	sp,sp,32
    1fa0:	00008067          	ret
    1fa4:	00f00613          	li	a2,15
    1fa8:	06c78c63          	beq	a5,a2,2020 <__mulsf3+0x300>
    1fac:	00b00613          	li	a2,11
    1fb0:	f4c78ce3          	beq	a5,a2,1f08 <__mulsf3+0x1e8>
    1fb4:	00048413          	mv	s0,s1
    1fb8:	000a0713          	mv	a4,s4
    1fbc:	f51ff06f          	j	1f0c <__mulsf3+0x1ec>
    1fc0:	00100793          	li	a5,1
    1fc4:	40e787b3          	sub	a5,a5,a4
    1fc8:	01b00713          	li	a4,27
    1fcc:	06f74263          	blt	a4,a5,2030 <__mulsf3+0x310>
    1fd0:	09e68693          	addi	a3,a3,158
    1fd4:	00d416b3          	sll	a3,s0,a3
    1fd8:	00f457b3          	srl	a5,s0,a5
    1fdc:	00d036b3          	snez	a3,a3
    1fe0:	00d7e7b3          	or	a5,a5,a3
    1fe4:	0077f713          	andi	a4,a5,7
    1fe8:	00070a63          	beqz	a4,1ffc <__mulsf3+0x2dc>
    1fec:	00f7f713          	andi	a4,a5,15
    1ff0:	00400693          	li	a3,4
    1ff4:	00d70463          	beq	a4,a3,1ffc <__mulsf3+0x2dc>
    1ff8:	00478793          	addi	a5,a5,4
    1ffc:	00579713          	slli	a4,a5,0x5
    2000:	0037d793          	srli	a5,a5,0x3
    2004:	02075863          	bgez	a4,2034 <__mulsf3+0x314>
    2008:	00000793          	li	a5,0
    200c:	00100713          	li	a4,1
    2010:	f59ff06f          	j	1f68 <__mulsf3+0x248>
    2014:	00000793          	li	a5,0
    2018:	0ff00713          	li	a4,255
    201c:	f4dff06f          	j	1f68 <__mulsf3+0x248>
    2020:	004007b7          	lui	a5,0x400
    2024:	0ff00713          	li	a4,255
    2028:	00000993          	li	s3,0
    202c:	f3dff06f          	j	1f68 <__mulsf3+0x248>
    2030:	00000793          	li	a5,0
    2034:	00000713          	li	a4,0
    2038:	f31ff06f          	j	1f68 <__mulsf3+0x248>

0000203c <__subsf3>:
    203c:	008006b7          	lui	a3,0x800
    2040:	fff68693          	addi	a3,a3,-1 # 7fffff <_memory_end+0x7dffff>
    2044:	ff010113          	addi	sp,sp,-16
    2048:	00a6f633          	and	a2,a3,a0
    204c:	01755713          	srli	a4,a0,0x17
    2050:	00812423          	sw	s0,8(sp)
    2054:	01f55413          	srli	s0,a0,0x1f
    2058:	00361513          	slli	a0,a2,0x3
    205c:	0175d613          	srli	a2,a1,0x17
    2060:	00b6f6b3          	and	a3,a3,a1
    2064:	01212023          	sw	s2,0(sp)
    2068:	00112623          	sw	ra,12(sp)
    206c:	0ff77913          	zext.b	s2,a4
    2070:	00912223          	sw	s1,4(sp)
    2074:	0ff67613          	zext.b	a2,a2
    2078:	0ff00713          	li	a4,255
    207c:	01f5d593          	srli	a1,a1,0x1f
    2080:	00369793          	slli	a5,a3,0x3
    2084:	00e61463          	bne	a2,a4,208c <__subsf3+0x50>
    2088:	00079463          	bnez	a5,2090 <__subsf3+0x54>
    208c:	0015c593          	xori	a1,a1,1
    2090:	40c906b3          	sub	a3,s2,a2
    2094:	18859063          	bne	a1,s0,2214 <__subsf3+0x1d8>
    2098:	08d05c63          	blez	a3,2130 <__subsf3+0xf4>
    209c:	02061663          	bnez	a2,20c8 <__subsf3+0x8c>
    20a0:	02078063          	beqz	a5,20c0 <__subsf3+0x84>
    20a4:	fff90693          	addi	a3,s2,-1
    20a8:	00069863          	bnez	a3,20b8 <__subsf3+0x7c>
    20ac:	00a787b3          	add	a5,a5,a0
    20b0:	00100913          	li	s2,1
    20b4:	04c0006f          	j	2100 <__subsf3+0xc4>
    20b8:	0ff00713          	li	a4,255
    20bc:	00e91e63          	bne	s2,a4,20d8 <__subsf3+0x9c>
    20c0:	00050793          	mv	a5,a0
    20c4:	10c0006f          	j	21d0 <__subsf3+0x194>
    20c8:	0ff00713          	li	a4,255
    20cc:	fee90ae3          	beq	s2,a4,20c0 <__subsf3+0x84>
    20d0:	04000737          	lui	a4,0x4000
    20d4:	00e7e7b3          	or	a5,a5,a4
    20d8:	01b00613          	li	a2,27
    20dc:	00100713          	li	a4,1
    20e0:	00d64e63          	blt	a2,a3,20fc <__subsf3+0xc0>
    20e4:	02000613          	li	a2,32
    20e8:	00d7d733          	srl	a4,a5,a3
    20ec:	40d606b3          	sub	a3,a2,a3
    20f0:	00d796b3          	sll	a3,a5,a3
    20f4:	00d036b3          	snez	a3,a3
    20f8:	00d76733          	or	a4,a4,a3
    20fc:	00a707b3          	add	a5,a4,a0
    2100:	00579713          	slli	a4,a5,0x5
    2104:	0c075663          	bgez	a4,21d0 <__subsf3+0x194>
    2108:	00190913          	addi	s2,s2,1
    210c:	0ff00713          	li	a4,255
    2110:	2ce90a63          	beq	s2,a4,23e4 <__subsf3+0x3a8>
    2114:	7e000737          	lui	a4,0x7e000
    2118:	0017f693          	andi	a3,a5,1
    211c:	fff70713          	addi	a4,a4,-1 # 7dffffff <_memory_end+0x7dfdffff>
    2120:	0017d793          	srli	a5,a5,0x1
    2124:	00e7f7b3          	and	a5,a5,a4
    2128:	00d7e7b3          	or	a5,a5,a3
    212c:	0a40006f          	j	21d0 <__subsf3+0x194>
    2130:	06068663          	beqz	a3,219c <__subsf3+0x160>
    2134:	41260733          	sub	a4,a2,s2
    2138:	02091063          	bnez	s2,2158 <__subsf3+0x11c>
    213c:	0c050863          	beqz	a0,220c <__subsf3+0x1d0>
    2140:	fff70693          	addi	a3,a4,-1
    2144:	f60684e3          	beqz	a3,20ac <__subsf3+0x70>
    2148:	0ff00593          	li	a1,255
    214c:	02b71063          	bne	a4,a1,216c <__subsf3+0x130>
    2150:	0ff00913          	li	s2,255
    2154:	07c0006f          	j	21d0 <__subsf3+0x194>
    2158:	0ff00693          	li	a3,255
    215c:	fed60ae3          	beq	a2,a3,2150 <__subsf3+0x114>
    2160:	040006b7          	lui	a3,0x4000
    2164:	00d56533          	or	a0,a0,a3
    2168:	00070693          	mv	a3,a4
    216c:	01b00593          	li	a1,27
    2170:	00100713          	li	a4,1
    2174:	00d5ce63          	blt	a1,a3,2190 <__subsf3+0x154>
    2178:	02000713          	li	a4,32
    217c:	40d70733          	sub	a4,a4,a3
    2180:	00e51733          	sll	a4,a0,a4
    2184:	00d555b3          	srl	a1,a0,a3
    2188:	00e03733          	snez	a4,a4
    218c:	00e5e733          	or	a4,a1,a4
    2190:	00e787b3          	add	a5,a5,a4
    2194:	00060913          	mv	s2,a2
    2198:	f69ff06f          	j	2100 <__subsf3+0xc4>
    219c:	00190713          	addi	a4,s2,1
    21a0:	0fe77693          	andi	a3,a4,254
    21a4:	04069c63          	bnez	a3,21fc <__subsf3+0x1c0>
    21a8:	04091263          	bnez	s2,21ec <__subsf3+0x1b0>
    21ac:	02050263          	beqz	a0,21d0 <__subsf3+0x194>
    21b0:	f00788e3          	beqz	a5,20c0 <__subsf3+0x84>
    21b4:	00a787b3          	add	a5,a5,a0
    21b8:	00579713          	slli	a4,a5,0x5
    21bc:	00075a63          	bgez	a4,21d0 <__subsf3+0x194>
    21c0:	fc000737          	lui	a4,0xfc000
    21c4:	fff70713          	addi	a4,a4,-1 # fbffffff <_memory_end+0xfbfdffff>
    21c8:	00e7f7b3          	and	a5,a5,a4
    21cc:	00100913          	li	s2,1
    21d0:	0077f713          	andi	a4,a5,7
    21d4:	20070a63          	beqz	a4,23e8 <__subsf3+0x3ac>
    21d8:	00f7f713          	andi	a4,a5,15
    21dc:	00400693          	li	a3,4
    21e0:	20d70463          	beq	a4,a3,23e8 <__subsf3+0x3ac>
    21e4:	00478793          	addi	a5,a5,4 # 400004 <_memory_end+0x3e0004>
    21e8:	2000006f          	j	23e8 <__subsf3+0x3ac>
    21ec:	f60502e3          	beqz	a0,2150 <__subsf3+0x114>
    21f0:	16079663          	bnez	a5,235c <__subsf3+0x320>
    21f4:	00050793          	mv	a5,a0
    21f8:	f59ff06f          	j	2150 <__subsf3+0x114>
    21fc:	0ff00693          	li	a3,255
    2200:	1ed70063          	beq	a4,a3,23e0 <__subsf3+0x3a4>
    2204:	00f507b3          	add	a5,a0,a5
    2208:	0017d793          	srli	a5,a5,0x1
    220c:	00070913          	mv	s2,a4
    2210:	fc1ff06f          	j	21d0 <__subsf3+0x194>
    2214:	06d05e63          	blez	a3,2290 <__subsf3+0x254>
    2218:	06061263          	bnez	a2,227c <__subsf3+0x240>
    221c:	ea0782e3          	beqz	a5,20c0 <__subsf3+0x84>
    2220:	fff90693          	addi	a3,s2,-1
    2224:	00069863          	bnez	a3,2234 <__subsf3+0x1f8>
    2228:	40f507b3          	sub	a5,a0,a5
    222c:	00100913          	li	s2,1
    2230:	0340006f          	j	2264 <__subsf3+0x228>
    2234:	0ff00713          	li	a4,255
    2238:	e8e904e3          	beq	s2,a4,20c0 <__subsf3+0x84>
    223c:	01b00613          	li	a2,27
    2240:	00100713          	li	a4,1
    2244:	00d64e63          	blt	a2,a3,2260 <__subsf3+0x224>
    2248:	02000613          	li	a2,32
    224c:	00d7d733          	srl	a4,a5,a3
    2250:	40d606b3          	sub	a3,a2,a3
    2254:	00d796b3          	sll	a3,a5,a3
    2258:	00d036b3          	snez	a3,a3
    225c:	00d76733          	or	a4,a4,a3
    2260:	40e507b3          	sub	a5,a0,a4
    2264:	00579713          	slli	a4,a5,0x5
    2268:	f60754e3          	bgez	a4,21d0 <__subsf3+0x194>
    226c:	040004b7          	lui	s1,0x4000
    2270:	fff48493          	addi	s1,s1,-1 # 3ffffff <_memory_end+0x3fdffff>
    2274:	0097f4b3          	and	s1,a5,s1
    2278:	1080006f          	j	2380 <__subsf3+0x344>
    227c:	0ff00713          	li	a4,255
    2280:	e4e900e3          	beq	s2,a4,20c0 <__subsf3+0x84>
    2284:	04000737          	lui	a4,0x4000
    2288:	00e7e7b3          	or	a5,a5,a4
    228c:	fb1ff06f          	j	223c <__subsf3+0x200>
    2290:	06068e63          	beqz	a3,230c <__subsf3+0x2d0>
    2294:	41260733          	sub	a4,a2,s2
    2298:	02091663          	bnez	s2,22c4 <__subsf3+0x288>
    229c:	1a050e63          	beqz	a0,2458 <__subsf3+0x41c>
    22a0:	fff70693          	addi	a3,a4,-1 # 3ffffff <_memory_end+0x3fdffff>
    22a4:	00069863          	bnez	a3,22b4 <__subsf3+0x278>
    22a8:	40a787b3          	sub	a5,a5,a0
    22ac:	00058413          	mv	s0,a1
    22b0:	f7dff06f          	j	222c <__subsf3+0x1f0>
    22b4:	0ff00813          	li	a6,255
    22b8:	03071063          	bne	a4,a6,22d8 <__subsf3+0x29c>
    22bc:	0ff00913          	li	s2,255
    22c0:	19c0006f          	j	245c <__subsf3+0x420>
    22c4:	0ff00693          	li	a3,255
    22c8:	fed60ae3          	beq	a2,a3,22bc <__subsf3+0x280>
    22cc:	040006b7          	lui	a3,0x4000
    22d0:	00d56533          	or	a0,a0,a3
    22d4:	00070693          	mv	a3,a4
    22d8:	01b00813          	li	a6,27
    22dc:	00100713          	li	a4,1
    22e0:	00d84e63          	blt	a6,a3,22fc <__subsf3+0x2c0>
    22e4:	02000713          	li	a4,32
    22e8:	40d70733          	sub	a4,a4,a3
    22ec:	00e51733          	sll	a4,a0,a4
    22f0:	00d55833          	srl	a6,a0,a3
    22f4:	00e03733          	snez	a4,a4
    22f8:	00e86733          	or	a4,a6,a4
    22fc:	40e787b3          	sub	a5,a5,a4
    2300:	00060913          	mv	s2,a2
    2304:	00058413          	mv	s0,a1
    2308:	f5dff06f          	j	2264 <__subsf3+0x228>
    230c:	00190713          	addi	a4,s2,1
    2310:	0fe77713          	andi	a4,a4,254
    2314:	04071c63          	bnez	a4,236c <__subsf3+0x330>
    2318:	02091c63          	bnez	s2,2350 <__subsf3+0x314>
    231c:	00051863          	bnez	a0,232c <__subsf3+0x2f0>
    2320:	12079e63          	bnez	a5,245c <__subsf3+0x420>
    2324:	00000413          	li	s0,0
    2328:	0c00006f          	j	23e8 <__subsf3+0x3ac>
    232c:	d8078ae3          	beqz	a5,20c0 <__subsf3+0x84>
    2330:	40f50733          	sub	a4,a0,a5
    2334:	00571693          	slli	a3,a4,0x5
    2338:	40a787b3          	sub	a5,a5,a0
    233c:	1206c063          	bltz	a3,245c <__subsf3+0x420>
    2340:	00070793          	mv	a5,a4
    2344:	e80716e3          	bnez	a4,21d0 <__subsf3+0x194>
    2348:	00000793          	li	a5,0
    234c:	fd9ff06f          	j	2324 <__subsf3+0x2e8>
    2350:	ea0510e3          	bnez	a0,21f0 <__subsf3+0x1b4>
    2354:	00058413          	mv	s0,a1
    2358:	de079ce3          	bnez	a5,2150 <__subsf3+0x114>
    235c:	00000413          	li	s0,0
    2360:	020007b7          	lui	a5,0x2000
    2364:	0ff00913          	li	s2,255
    2368:	0800006f          	j	23e8 <__subsf3+0x3ac>
    236c:	40f504b3          	sub	s1,a0,a5
    2370:	00549713          	slli	a4,s1,0x5
    2374:	04075463          	bgez	a4,23bc <__subsf3+0x380>
    2378:	40a784b3          	sub	s1,a5,a0
    237c:	00058413          	mv	s0,a1
    2380:	00048513          	mv	a0,s1
    2384:	3d8000ef          	jal	275c <__clzsi2>
    2388:	ffb50513          	addi	a0,a0,-5
    238c:	00a494b3          	sll	s1,s1,a0
    2390:	03254e63          	blt	a0,s2,23cc <__subsf3+0x390>
    2394:	41250533          	sub	a0,a0,s2
    2398:	00150513          	addi	a0,a0,1
    239c:	02000713          	li	a4,32
    23a0:	40a70733          	sub	a4,a4,a0
    23a4:	00a4d7b3          	srl	a5,s1,a0
    23a8:	00e494b3          	sll	s1,s1,a4
    23ac:	009034b3          	snez	s1,s1
    23b0:	0097e7b3          	or	a5,a5,s1
    23b4:	00000913          	li	s2,0
    23b8:	e19ff06f          	j	21d0 <__subsf3+0x194>
    23bc:	fc0492e3          	bnez	s1,2380 <__subsf3+0x344>
    23c0:	00000793          	li	a5,0
    23c4:	00000913          	li	s2,0
    23c8:	f5dff06f          	j	2324 <__subsf3+0x2e8>
    23cc:	fc0007b7          	lui	a5,0xfc000
    23d0:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
    23d4:	40a90933          	sub	s2,s2,a0
    23d8:	00f4f7b3          	and	a5,s1,a5
    23dc:	df5ff06f          	j	21d0 <__subsf3+0x194>
    23e0:	0ff00913          	li	s2,255
    23e4:	00000793          	li	a5,0
    23e8:	00579713          	slli	a4,a5,0x5
    23ec:	00075e63          	bgez	a4,2408 <__subsf3+0x3cc>
    23f0:	00190913          	addi	s2,s2,1
    23f4:	0ff00713          	li	a4,255
    23f8:	06e90663          	beq	s2,a4,2464 <__subsf3+0x428>
    23fc:	fc000737          	lui	a4,0xfc000
    2400:	fff70713          	addi	a4,a4,-1 # fbffffff <_memory_end+0xfbfdffff>
    2404:	00e7f7b3          	and	a5,a5,a4
    2408:	0ff00713          	li	a4,255
    240c:	0037d793          	srli	a5,a5,0x3
    2410:	00e91863          	bne	s2,a4,2420 <__subsf3+0x3e4>
    2414:	00078663          	beqz	a5,2420 <__subsf3+0x3e4>
    2418:	004007b7          	lui	a5,0x400
    241c:	00000413          	li	s0,0
    2420:	00c12083          	lw	ra,12(sp)
    2424:	01791713          	slli	a4,s2,0x17
    2428:	01f41513          	slli	a0,s0,0x1f
    242c:	7f8006b7          	lui	a3,0x7f800
    2430:	00812403          	lw	s0,8(sp)
    2434:	00979793          	slli	a5,a5,0x9
    2438:	00d77733          	and	a4,a4,a3
    243c:	0097d793          	srli	a5,a5,0x9
    2440:	00f767b3          	or	a5,a4,a5
    2444:	00412483          	lw	s1,4(sp)
    2448:	00012903          	lw	s2,0(sp)
    244c:	00a7e533          	or	a0,a5,a0
    2450:	01010113          	addi	sp,sp,16
    2454:	00008067          	ret
    2458:	00070913          	mv	s2,a4
    245c:	00058413          	mv	s0,a1
    2460:	d71ff06f          	j	21d0 <__subsf3+0x194>
    2464:	00000793          	li	a5,0
    2468:	fa1ff06f          	j	2408 <__subsf3+0x3cc>

0000246c <__fixsfsi>:
    246c:	00800637          	lui	a2,0x800
    2470:	01755713          	srli	a4,a0,0x17
    2474:	fff60793          	addi	a5,a2,-1 # 7fffff <_memory_end+0x7dffff>
    2478:	0ff77713          	zext.b	a4,a4
    247c:	07e00593          	li	a1,126
    2480:	00a7f7b3          	and	a5,a5,a0
    2484:	01f55693          	srli	a3,a0,0x1f
    2488:	04e5d663          	bge	a1,a4,24d4 <__fixsfsi+0x68>
    248c:	09d00593          	li	a1,157
    2490:	00e5da63          	bge	a1,a4,24a4 <__fixsfsi+0x38>
    2494:	80000537          	lui	a0,0x80000
    2498:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
    249c:	00a68533          	add	a0,a3,a0
    24a0:	00008067          	ret
    24a4:	00c7e533          	or	a0,a5,a2
    24a8:	09500793          	li	a5,149
    24ac:	00e7dc63          	bge	a5,a4,24c4 <__fixsfsi+0x58>
    24b0:	f6a70713          	addi	a4,a4,-150
    24b4:	00e51533          	sll	a0,a0,a4
    24b8:	02068063          	beqz	a3,24d8 <__fixsfsi+0x6c>
    24bc:	40a00533          	neg	a0,a0
    24c0:	00008067          	ret
    24c4:	09600793          	li	a5,150
    24c8:	40e787b3          	sub	a5,a5,a4
    24cc:	00f55533          	srl	a0,a0,a5
    24d0:	fe9ff06f          	j	24b8 <__fixsfsi+0x4c>
    24d4:	00000513          	li	a0,0
    24d8:	00008067          	ret

000024dc <__floatsisf>:
    24dc:	ff010113          	addi	sp,sp,-16
    24e0:	00112623          	sw	ra,12(sp)
    24e4:	00812423          	sw	s0,8(sp)
    24e8:	00912223          	sw	s1,4(sp)
    24ec:	00050793          	mv	a5,a0
    24f0:	0e050063          	beqz	a0,25d0 <__floatsisf+0xf4>
    24f4:	41f55713          	srai	a4,a0,0x1f
    24f8:	00a74433          	xor	s0,a4,a0
    24fc:	40e40433          	sub	s0,s0,a4
    2500:	01f55493          	srli	s1,a0,0x1f
    2504:	00040513          	mv	a0,s0
    2508:	254000ef          	jal	275c <__clzsi2>
    250c:	09e00793          	li	a5,158
    2510:	40a787b3          	sub	a5,a5,a0
    2514:	09600713          	li	a4,150
    2518:	04f74063          	blt	a4,a5,2558 <__floatsisf+0x7c>
    251c:	00800713          	li	a4,8
    2520:	0ae50e63          	beq	a0,a4,25dc <__floatsisf+0x100>
    2524:	ff850513          	addi	a0,a0,-8
    2528:	00a41433          	sll	s0,s0,a0
    252c:	00941413          	slli	s0,s0,0x9
    2530:	00945413          	srli	s0,s0,0x9
    2534:	01779793          	slli	a5,a5,0x17
    2538:	00c12083          	lw	ra,12(sp)
    253c:	0087e7b3          	or	a5,a5,s0
    2540:	00812403          	lw	s0,8(sp)
    2544:	01f49513          	slli	a0,s1,0x1f
    2548:	00a7e533          	or	a0,a5,a0
    254c:	00412483          	lw	s1,4(sp)
    2550:	01010113          	addi	sp,sp,16
    2554:	00008067          	ret
    2558:	09900713          	li	a4,153
    255c:	06f75463          	bge	a4,a5,25c4 <__floatsisf+0xe8>
    2560:	00500713          	li	a4,5
    2564:	40a70733          	sub	a4,a4,a0
    2568:	01b50693          	addi	a3,a0,27
    256c:	00e45733          	srl	a4,s0,a4
    2570:	00d41433          	sll	s0,s0,a3
    2574:	00803433          	snez	s0,s0
    2578:	00876733          	or	a4,a4,s0
    257c:	fc000437          	lui	s0,0xfc000
    2580:	fff40413          	addi	s0,s0,-1 # fbffffff <_memory_end+0xfbfdffff>
    2584:	00777693          	andi	a3,a4,7
    2588:	00877433          	and	s0,a4,s0
    258c:	00068a63          	beqz	a3,25a0 <__floatsisf+0xc4>
    2590:	00f77713          	andi	a4,a4,15
    2594:	00400693          	li	a3,4
    2598:	00d70463          	beq	a4,a3,25a0 <__floatsisf+0xc4>
    259c:	00440413          	addi	s0,s0,4
    25a0:	00541713          	slli	a4,s0,0x5
    25a4:	00075c63          	bgez	a4,25bc <__floatsisf+0xe0>
    25a8:	fc0007b7          	lui	a5,0xfc000
    25ac:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
    25b0:	00f47433          	and	s0,s0,a5
    25b4:	09f00793          	li	a5,159
    25b8:	40a787b3          	sub	a5,a5,a0
    25bc:	00345413          	srli	s0,s0,0x3
    25c0:	f6dff06f          	j	252c <__floatsisf+0x50>
    25c4:	ffb50713          	addi	a4,a0,-5
    25c8:	00e41733          	sll	a4,s0,a4
    25cc:	fb1ff06f          	j	257c <__floatsisf+0xa0>
    25d0:	00000493          	li	s1,0
    25d4:	00000413          	li	s0,0
    25d8:	f55ff06f          	j	252c <__floatsisf+0x50>
    25dc:	09600793          	li	a5,150
    25e0:	f4dff06f          	j	252c <__floatsisf+0x50>

000025e4 <__truncdfsf2>:
    25e4:	0145d613          	srli	a2,a1,0x14
    25e8:	7ff67613          	andi	a2,a2,2047
    25ec:	00c59793          	slli	a5,a1,0xc
    25f0:	00160713          	addi	a4,a2,1
    25f4:	0097d793          	srli	a5,a5,0x9
    25f8:	01d55693          	srli	a3,a0,0x1d
    25fc:	7fe77713          	andi	a4,a4,2046
    2600:	00f6e6b3          	or	a3,a3,a5
    2604:	01f5d593          	srli	a1,a1,0x1f
    2608:	00351793          	slli	a5,a0,0x3
    260c:	0a070663          	beqz	a4,26b8 <__truncdfsf2+0xd4>
    2610:	c8060713          	addi	a4,a2,-896
    2614:	0fe00813          	li	a6,254
    2618:	0ce84263          	blt	a6,a4,26dc <__truncdfsf2+0xf8>
    261c:	08e04063          	bgtz	a4,269c <__truncdfsf2+0xb8>
    2620:	fe900513          	li	a0,-23
    2624:	10a74a63          	blt	a4,a0,2738 <__truncdfsf2+0x154>
    2628:	00800537          	lui	a0,0x800
    262c:	00a6e6b3          	or	a3,a3,a0
    2630:	01e00513          	li	a0,30
    2634:	40e50533          	sub	a0,a0,a4
    2638:	01f00813          	li	a6,31
    263c:	02a84863          	blt	a6,a0,266c <__truncdfsf2+0x88>
    2640:	c8260613          	addi	a2,a2,-894
    2644:	00a7d533          	srl	a0,a5,a0
    2648:	00c797b3          	sll	a5,a5,a2
    264c:	00f037b3          	snez	a5,a5
    2650:	00c696b3          	sll	a3,a3,a2
    2654:	00d7e7b3          	or	a5,a5,a3
    2658:	00f567b3          	or	a5,a0,a5
    265c:	00000713          	li	a4,0
    2660:	0077f693          	andi	a3,a5,7
    2664:	08068063          	beqz	a3,26e4 <__truncdfsf2+0x100>
    2668:	0d80006f          	j	2740 <__truncdfsf2+0x15c>
    266c:	ffe00813          	li	a6,-2
    2670:	40e80833          	sub	a6,a6,a4
    2674:	02000893          	li	a7,32
    2678:	0106d833          	srl	a6,a3,a6
    267c:	00000713          	li	a4,0
    2680:	01150663          	beq	a0,a7,268c <__truncdfsf2+0xa8>
    2684:	ca260613          	addi	a2,a2,-862
    2688:	00c69733          	sll	a4,a3,a2
    268c:	00f76733          	or	a4,a4,a5
    2690:	00e03733          	snez	a4,a4
    2694:	00e867b3          	or	a5,a6,a4
    2698:	fc5ff06f          	j	265c <__truncdfsf2+0x78>
    269c:	00651513          	slli	a0,a0,0x6
    26a0:	00a03533          	snez	a0,a0
    26a4:	00369693          	slli	a3,a3,0x3
    26a8:	01d7d793          	srli	a5,a5,0x1d
    26ac:	00d566b3          	or	a3,a0,a3
    26b0:	00f6e7b3          	or	a5,a3,a5
    26b4:	fadff06f          	j	2660 <__truncdfsf2+0x7c>
    26b8:	00f6e7b3          	or	a5,a3,a5
    26bc:	00061663          	bnez	a2,26c8 <__truncdfsf2+0xe4>
    26c0:	00f037b3          	snez	a5,a5
    26c4:	f99ff06f          	j	265c <__truncdfsf2+0x78>
    26c8:	0ff00713          	li	a4,255
    26cc:	00078c63          	beqz	a5,26e4 <__truncdfsf2+0x100>
    26d0:	00369693          	slli	a3,a3,0x3
    26d4:	020007b7          	lui	a5,0x2000
    26d8:	fd9ff06f          	j	26b0 <__truncdfsf2+0xcc>
    26dc:	00000793          	li	a5,0
    26e0:	0ff00713          	li	a4,255
    26e4:	00579693          	slli	a3,a5,0x5
    26e8:	0006de63          	bgez	a3,2704 <__truncdfsf2+0x120>
    26ec:	00170713          	addi	a4,a4,1
    26f0:	0ff00693          	li	a3,255
    26f4:	06d70063          	beq	a4,a3,2754 <__truncdfsf2+0x170>
    26f8:	fc0006b7          	lui	a3,0xfc000
    26fc:	fff68693          	addi	a3,a3,-1 # fbffffff <_memory_end+0xfbfdffff>
    2700:	00d7f7b3          	and	a5,a5,a3
    2704:	0ff00693          	li	a3,255
    2708:	0037d793          	srli	a5,a5,0x3
    270c:	00d71863          	bne	a4,a3,271c <__truncdfsf2+0x138>
    2710:	00078663          	beqz	a5,271c <__truncdfsf2+0x138>
    2714:	004007b7          	lui	a5,0x400
    2718:	00000593          	li	a1,0
    271c:	7f8006b7          	lui	a3,0x7f800
    2720:	01771713          	slli	a4,a4,0x17
    2724:	00d77733          	and	a4,a4,a3
    2728:	00f76733          	or	a4,a4,a5
    272c:	01f59513          	slli	a0,a1,0x1f
    2730:	00a76533          	or	a0,a4,a0
    2734:	00008067          	ret
    2738:	00100793          	li	a5,1
    273c:	00000713          	li	a4,0
    2740:	00f7f693          	andi	a3,a5,15
    2744:	00400613          	li	a2,4
    2748:	f8c68ee3          	beq	a3,a2,26e4 <__truncdfsf2+0x100>
    274c:	00478793          	addi	a5,a5,4 # 400004 <_memory_end+0x3e0004>
    2750:	f95ff06f          	j	26e4 <__truncdfsf2+0x100>
    2754:	00000793          	li	a5,0
    2758:	fadff06f          	j	2704 <__truncdfsf2+0x120>

0000275c <__clzsi2>:
    275c:	000107b7          	lui	a5,0x10
    2760:	02f57863          	bgeu	a0,a5,2790 <__clzsi2+0x34>
    2764:	10053793          	sltiu	a5,a0,256
    2768:	0017b793          	seqz	a5,a5
    276c:	00379793          	slli	a5,a5,0x3
    2770:	02000693          	li	a3,32
    2774:	40f686b3          	sub	a3,a3,a5
    2778:	00f55533          	srl	a0,a0,a5
    277c:	10018793          	addi	a5,gp,256 # 28a8 <__clz_tab>
    2780:	00a787b3          	add	a5,a5,a0
    2784:	0007c503          	lbu	a0,0(a5) # 10000 <_bss_end+0xd520>
    2788:	40a68533          	sub	a0,a3,a0
    278c:	00008067          	ret
    2790:	01000737          	lui	a4,0x1000
    2794:	01800793          	li	a5,24
    2798:	fce57ce3          	bgeu	a0,a4,2770 <__clzsi2+0x14>
    279c:	01000793          	li	a5,16
    27a0:	fd1ff06f          	j	2770 <__clzsi2+0x14>
    27a4:	0000                	.insn	2, 0x
	...
