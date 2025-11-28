
sieve_test.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00002197          	auipc	gp,0x2
       4:	7f018193          	addi	gp,gp,2032 # 27f0 <__global_pointer$>
       8:	00020117          	auipc	sp,0x20
       c:	ff810113          	addi	sp,sp,-8 # 20000 <_memory_end>
      10:	20818e13          	addi	t3,gp,520 # 29f8 <bitmap>
      14:	21418e93          	addi	t4,gp,532 # 2a04 <_bss_end>
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
      3c:	1d818313          	addi	t1,gp,472 # 29c8 <tohost>
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
      64:	20078793          	addi	a5,a5,512 # 1c200 <_bss_end+0x197fc>
      68:	fef42423          	sw	a5,-24(s0)
      6c:	fec42503          	lw	a0,-20(s0)
      70:	2b8010ef          	jal	1328 <uart_set_addr>
      74:	00100713          	li	a4,1
      78:	00000693          	li	a3,0
      7c:	00800613          	li	a2,8
      80:	fe842583          	lw	a1,-24(s0)
      84:	05f5e7b7          	lui	a5,0x5f5e
      88:	10078513          	addi	a0,a5,256 # 5f5e100 <_memory_end+0x5f3e100>
      8c:	48d000ef          	jal	d18 <uart_init>
      90:	3f0000ef          	jal	480 <sieve>
      94:	00018513          	mv	a0,gp
      98:	7f1000ef          	jal	1088 <uart_put_string>
      9c:	00000793          	li	a5,0
      a0:	00078513          	mv	a0,a5
      a4:	01c12083          	lw	ra,28(sp)
      a8:	01812403          	lw	s0,24(sp)
      ac:	02010113          	addi	sp,sp,32
      b0:	00008067          	ret

000000b4 <print_chr>:
      b4:	fe010113          	addi	sp,sp,-32
      b8:	00112e23          	sw	ra,28(sp)
      bc:	00812c23          	sw	s0,24(sp)
      c0:	02010413          	addi	s0,sp,32
      c4:	00050793          	mv	a5,a0
      c8:	fef407a3          	sb	a5,-17(s0)
      cc:	fef44783          	lbu	a5,-17(s0)
      d0:	00078513          	mv	a0,a5
      d4:	755000ef          	jal	1028 <uart_put_char>
      d8:	00000013          	nop
      dc:	01c12083          	lw	ra,28(sp)
      e0:	01812403          	lw	s0,24(sp)
      e4:	02010113          	addi	sp,sp,32
      e8:	00008067          	ret

000000ec <print_str>:
      ec:	fe010113          	addi	sp,sp,-32
      f0:	00112e23          	sw	ra,28(sp)
      f4:	00812c23          	sw	s0,24(sp)
      f8:	02010413          	addi	s0,sp,32
      fc:	fea42623          	sw	a0,-20(s0)
     100:	fec42503          	lw	a0,-20(s0)
     104:	785000ef          	jal	1088 <uart_put_string>
     108:	00000013          	nop
     10c:	01c12083          	lw	ra,28(sp)
     110:	01812403          	lw	s0,24(sp)
     114:	02010113          	addi	sp,sp,32
     118:	00008067          	ret

0000011c <print_dec>:
     11c:	fc010113          	addi	sp,sp,-64
     120:	02112e23          	sw	ra,60(sp)
     124:	02812c23          	sw	s0,56(sp)
     128:	04010413          	addi	s0,sp,64
     12c:	fca42623          	sw	a0,-52(s0)
     130:	fdc40793          	addi	a5,s0,-36
     134:	fef42623          	sw	a5,-20(s0)
     138:	0340006f          	j	16c <print_dec+0x50>
     13c:	fcc42703          	lw	a4,-52(s0)
     140:	00a00793          	li	a5,10
     144:	02f776b3          	remu	a3,a4,a5
     148:	fec42783          	lw	a5,-20(s0)
     14c:	00178713          	addi	a4,a5,1
     150:	fee42623          	sw	a4,-20(s0)
     154:	0ff6f713          	zext.b	a4,a3
     158:	00e78023          	sb	a4,0(a5)
     15c:	fcc42703          	lw	a4,-52(s0)
     160:	00a00793          	li	a5,10
     164:	02f757b3          	divu	a5,a4,a5
     168:	fcf42623          	sw	a5,-52(s0)
     16c:	fcc42783          	lw	a5,-52(s0)
     170:	fc0796e3          	bnez	a5,13c <print_dec+0x20>
     174:	fdc40793          	addi	a5,s0,-36
     178:	fec42703          	lw	a4,-20(s0)
     17c:	fcf700e3          	beq	a4,a5,13c <print_dec+0x20>
     180:	0300006f          	j	1b0 <print_dec+0x94>
     184:	fec42783          	lw	a5,-20(s0)
     188:	fff78793          	addi	a5,a5,-1
     18c:	fef42623          	sw	a5,-20(s0)
     190:	fec42783          	lw	a5,-20(s0)
     194:	0007c783          	lbu	a5,0(a5)
     198:	03078793          	addi	a5,a5,48
     19c:	fef42423          	sw	a5,-24(s0)
     1a0:	fe842783          	lw	a5,-24(s0)
     1a4:	0ff7f793          	zext.b	a5,a5
     1a8:	00078513          	mv	a0,a5
     1ac:	67d000ef          	jal	1028 <uart_put_char>
     1b0:	fdc40793          	addi	a5,s0,-36
     1b4:	fec42703          	lw	a4,-20(s0)
     1b8:	fcf716e3          	bne	a4,a5,184 <print_dec+0x68>
     1bc:	00000013          	nop
     1c0:	00000013          	nop
     1c4:	03c12083          	lw	ra,60(sp)
     1c8:	03812403          	lw	s0,56(sp)
     1cc:	04010113          	addi	sp,sp,64
     1d0:	00008067          	ret

000001d4 <print_hex>:
     1d4:	fd010113          	addi	sp,sp,-48
     1d8:	02112623          	sw	ra,44(sp)
     1dc:	02812423          	sw	s0,40(sp)
     1e0:	03010413          	addi	s0,sp,48
     1e4:	fca42e23          	sw	a0,-36(s0)
     1e8:	fcb42c23          	sw	a1,-40(s0)
     1ec:	fd842783          	lw	a5,-40(s0)
     1f0:	fff78793          	addi	a5,a5,-1
     1f4:	00279793          	slli	a5,a5,0x2
     1f8:	fef42623          	sw	a5,-20(s0)
     1fc:	0400006f          	j	23c <print_hex+0x68>
     200:	fec42783          	lw	a5,-20(s0)
     204:	fdc42703          	lw	a4,-36(s0)
     208:	00f757b3          	srl	a5,a4,a5
     20c:	00f7f793          	andi	a5,a5,15
     210:	00c18713          	addi	a4,gp,12 # 27fc <__global_pointer$+0xc>
     214:	00f707b3          	add	a5,a4,a5
     218:	0007c783          	lbu	a5,0(a5)
     21c:	fef42423          	sw	a5,-24(s0)
     220:	fe842783          	lw	a5,-24(s0)
     224:	0ff7f793          	zext.b	a5,a5
     228:	00078513          	mv	a0,a5
     22c:	5fd000ef          	jal	1028 <uart_put_char>
     230:	fec42783          	lw	a5,-20(s0)
     234:	ffc78793          	addi	a5,a5,-4
     238:	fef42623          	sw	a5,-20(s0)
     23c:	fec42783          	lw	a5,-20(s0)
     240:	fc07d0e3          	bgez	a5,200 <print_hex+0x2c>
     244:	00000013          	nop
     248:	00000013          	nop
     24c:	02c12083          	lw	ra,44(sp)
     250:	02812403          	lw	s0,40(sp)
     254:	03010113          	addi	sp,sp,48
     258:	00008067          	ret

0000025c <mkhash>:
     25c:	fe010113          	addi	sp,sp,-32
     260:	00812e23          	sw	s0,28(sp)
     264:	02010413          	addi	s0,sp,32
     268:	fea42623          	sw	a0,-20(s0)
     26c:	feb42423          	sw	a1,-24(s0)
     270:	fec42783          	lw	a5,-20(s0)
     274:	00579713          	slli	a4,a5,0x5
     278:	fec42783          	lw	a5,-20(s0)
     27c:	00f70733          	add	a4,a4,a5
     280:	fe842783          	lw	a5,-24(s0)
     284:	00f747b3          	xor	a5,a4,a5
     288:	00078513          	mv	a0,a5
     28c:	01c12403          	lw	s0,28(sp)
     290:	02010113          	addi	sp,sp,32
     294:	00008067          	ret

00000298 <bitmap_set>:
     298:	fe010113          	addi	sp,sp,-32
     29c:	00812e23          	sw	s0,28(sp)
     2a0:	02010413          	addi	s0,sp,32
     2a4:	fea42623          	sw	a0,-20(s0)
     2a8:	fec42783          	lw	a5,-20(s0)
     2ac:	41f7d713          	srai	a4,a5,0x1f
     2b0:	01f77713          	andi	a4,a4,31
     2b4:	00f707b3          	add	a5,a4,a5
     2b8:	4057d793          	srai	a5,a5,0x5
     2bc:	20818693          	addi	a3,gp,520 # 29f8 <bitmap>
     2c0:	00279713          	slli	a4,a5,0x2
     2c4:	00e68733          	add	a4,a3,a4
     2c8:	00072703          	lw	a4,0(a4)
     2cc:	fec42683          	lw	a3,-20(s0)
     2d0:	01f6f693          	andi	a3,a3,31
     2d4:	00100613          	li	a2,1
     2d8:	00d616b3          	sll	a3,a2,a3
     2dc:	00d76733          	or	a4,a4,a3
     2e0:	20818693          	addi	a3,gp,520 # 29f8 <bitmap>
     2e4:	00279793          	slli	a5,a5,0x2
     2e8:	00f687b3          	add	a5,a3,a5
     2ec:	00e7a023          	sw	a4,0(a5)
     2f0:	00000013          	nop
     2f4:	01c12403          	lw	s0,28(sp)
     2f8:	02010113          	addi	sp,sp,32
     2fc:	00008067          	ret

00000300 <bitmap_get>:
     300:	fe010113          	addi	sp,sp,-32
     304:	00812e23          	sw	s0,28(sp)
     308:	02010413          	addi	s0,sp,32
     30c:	fea42623          	sw	a0,-20(s0)
     310:	fec42783          	lw	a5,-20(s0)
     314:	41f7d713          	srai	a4,a5,0x1f
     318:	01f77713          	andi	a4,a4,31
     31c:	00f707b3          	add	a5,a4,a5
     320:	4057d793          	srai	a5,a5,0x5
     324:	00078693          	mv	a3,a5
     328:	20818713          	addi	a4,gp,520 # 29f8 <bitmap>
     32c:	00269793          	slli	a5,a3,0x2
     330:	00f707b3          	add	a5,a4,a5
     334:	0007a783          	lw	a5,0(a5)
     338:	fec42703          	lw	a4,-20(s0)
     33c:	01f77713          	andi	a4,a4,31
     340:	00100693          	li	a3,1
     344:	00e69733          	sll	a4,a3,a4
     348:	00e7f7b3          	and	a5,a5,a4
     34c:	00078663          	beqz	a5,358 <bitmap_get+0x58>
     350:	00100793          	li	a5,1
     354:	0080006f          	j	35c <bitmap_get+0x5c>
     358:	00000793          	li	a5,0
     35c:	00078513          	mv	a0,a5
     360:	01c12403          	lw	s0,28(sp)
     364:	02010113          	addi	sp,sp,32
     368:	00008067          	ret

0000036c <print_prime>:
     36c:	fe010113          	addi	sp,sp,-32
     370:	00112e23          	sw	ra,28(sp)
     374:	00812c23          	sw	s0,24(sp)
     378:	02010413          	addi	s0,sp,32
     37c:	fea42623          	sw	a0,-20(s0)
     380:	feb42423          	sw	a1,-24(s0)
     384:	fec42703          	lw	a4,-20(s0)
     388:	00900793          	li	a5,9
     38c:	00e7c663          	blt	a5,a4,398 <print_prime+0x2c>
     390:	02018513          	addi	a0,gp,32 # 2810 <__global_pointer$+0x20>
     394:	d59ff0ef          	jal	ec <print_str>
     398:	fec42783          	lw	a5,-20(s0)
     39c:	00078513          	mv	a0,a5
     3a0:	d7dff0ef          	jal	11c <print_dec>
     3a4:	fec42783          	lw	a5,-20(s0)
     3a8:	ff678713          	addi	a4,a5,-10
     3ac:	00900793          	li	a5,9
     3b0:	04e7fc63          	bgeu	a5,a4,408 <print_prime+0x9c>
     3b4:	fec42703          	lw	a4,-20(s0)
     3b8:	00a00793          	li	a5,10
     3bc:	02f767b3          	rem	a5,a4,a5
     3c0:	00300713          	li	a4,3
     3c4:	02e78c63          	beq	a5,a4,3fc <print_prime+0x90>
     3c8:	00300713          	li	a4,3
     3cc:	04f74063          	blt	a4,a5,40c <print_prime+0xa0>
     3d0:	00100713          	li	a4,1
     3d4:	00e78863          	beq	a5,a4,3e4 <print_prime+0x78>
     3d8:	00200713          	li	a4,2
     3dc:	00e78a63          	beq	a5,a4,3f0 <print_prime+0x84>
     3e0:	02c0006f          	j	40c <print_prime+0xa0>
     3e4:	02418513          	addi	a0,gp,36 # 2814 <__global_pointer$+0x24>
     3e8:	d05ff0ef          	jal	ec <print_str>
     3ec:	02c0006f          	j	418 <print_prime+0xac>
     3f0:	02818513          	addi	a0,gp,40 # 2818 <__global_pointer$+0x28>
     3f4:	cf9ff0ef          	jal	ec <print_str>
     3f8:	0200006f          	j	418 <print_prime+0xac>
     3fc:	02c18513          	addi	a0,gp,44 # 281c <__global_pointer$+0x2c>
     400:	cedff0ef          	jal	ec <print_str>
     404:	0140006f          	j	418 <print_prime+0xac>
     408:	00000013          	nop
     40c:	03018513          	addi	a0,gp,48 # 2820 <__global_pointer$+0x30>
     410:	cddff0ef          	jal	ec <print_str>
     414:	00000013          	nop
     418:	03418513          	addi	a0,gp,52 # 2824 <__global_pointer$+0x34>
     41c:	cd1ff0ef          	jal	ec <print_str>
     420:	fe842783          	lw	a5,-24(s0)
     424:	00078513          	mv	a0,a5
     428:	cf5ff0ef          	jal	11c <print_dec>
     42c:	04018513          	addi	a0,gp,64 # 2830 <__global_pointer$+0x40>
     430:	cbdff0ef          	jal	ec <print_str>
     434:	2101a783          	lw	a5,528(gp) # 2a00 <hash>
     438:	fec42703          	lw	a4,-20(s0)
     43c:	00070593          	mv	a1,a4
     440:	00078513          	mv	a0,a5
     444:	e19ff0ef          	jal	25c <mkhash>
     448:	00050713          	mv	a4,a0
     44c:	20e1a823          	sw	a4,528(gp) # 2a00 <hash>
     450:	2101a783          	lw	a5,528(gp) # 2a00 <hash>
     454:	fe842703          	lw	a4,-24(s0)
     458:	00070593          	mv	a1,a4
     45c:	00078513          	mv	a0,a5
     460:	dfdff0ef          	jal	25c <mkhash>
     464:	00050713          	mv	a4,a0
     468:	20e1a823          	sw	a4,528(gp) # 2a00 <hash>
     46c:	00000013          	nop
     470:	01c12083          	lw	ra,28(sp)
     474:	01812403          	lw	s0,24(sp)
     478:	02010113          	addi	sp,sp,32
     47c:	00008067          	ret

00000480 <sieve>:
     480:	fe010113          	addi	sp,sp,-32
     484:	00112e23          	sw	ra,28(sp)
     488:	00812c23          	sw	s0,24(sp)
     48c:	02010413          	addi	s0,sp,32
     490:	00100793          	li	a5,1
     494:	fef42623          	sw	a5,-20(s0)
     498:	00001737          	lui	a4,0x1
     49c:	50570713          	addi	a4,a4,1285 # 1505 <__adddf3+0x145>
     4a0:	20e1a823          	sw	a4,528(gp) # 2a00 <hash>
     4a4:	fec42783          	lw	a5,-20(s0)
     4a8:	00178713          	addi	a4,a5,1
     4ac:	fee42623          	sw	a4,-20(s0)
     4b0:	00200593          	li	a1,2
     4b4:	00078513          	mv	a0,a5
     4b8:	eb5ff0ef          	jal	36c <print_prime>
     4bc:	fe042423          	sw	zero,-24(s0)
     4c0:	0c00006f          	j	580 <sieve+0x100>
     4c4:	fe842503          	lw	a0,-24(s0)
     4c8:	e39ff0ef          	jal	300 <bitmap_get>
     4cc:	00050793          	mv	a5,a0
     4d0:	08079c63          	bnez	a5,568 <sieve+0xe8>
     4d4:	fec42783          	lw	a5,-20(s0)
     4d8:	00178713          	addi	a4,a5,1
     4dc:	fee42623          	sw	a4,-20(s0)
     4e0:	fe842703          	lw	a4,-24(s0)
     4e4:	00171713          	slli	a4,a4,0x1
     4e8:	00370713          	addi	a4,a4,3
     4ec:	00070593          	mv	a1,a4
     4f0:	00078513          	mv	a0,a5
     4f4:	e79ff0ef          	jal	36c <print_prime>
     4f8:	fe842783          	lw	a5,-24(s0)
     4fc:	00179793          	slli	a5,a5,0x1
     500:	00378793          	addi	a5,a5,3
     504:	00179793          	slli	a5,a5,0x1
     508:	fef42223          	sw	a5,-28(s0)
     50c:	fe442783          	lw	a5,-28(s0)
     510:	0017f793          	andi	a5,a5,1
     514:	02078a63          	beqz	a5,548 <sieve+0xc8>
     518:	fe442783          	lw	a5,-28(s0)
     51c:	ffd78793          	addi	a5,a5,-3
     520:	01f7d713          	srli	a4,a5,0x1f
     524:	00f707b3          	add	a5,a4,a5
     528:	4017d793          	srai	a5,a5,0x1
     52c:	fef42023          	sw	a5,-32(s0)
     530:	fe042703          	lw	a4,-32(s0)
     534:	03f00793          	li	a5,63
     538:	02e7cc63          	blt	a5,a4,570 <sieve+0xf0>
     53c:	fe042503          	lw	a0,-32(s0)
     540:	d59ff0ef          	jal	298 <bitmap_set>
     544:	0080006f          	j	54c <sieve+0xcc>
     548:	00000013          	nop
     54c:	fe842783          	lw	a5,-24(s0)
     550:	00179793          	slli	a5,a5,0x1
     554:	00378793          	addi	a5,a5,3
     558:	fe442703          	lw	a4,-28(s0)
     55c:	00f707b3          	add	a5,a4,a5
     560:	fef42223          	sw	a5,-28(s0)
     564:	fa9ff06f          	j	50c <sieve+0x8c>
     568:	00000013          	nop
     56c:	0080006f          	j	574 <sieve+0xf4>
     570:	00000013          	nop
     574:	fe842783          	lw	a5,-24(s0)
     578:	00178793          	addi	a5,a5,1
     57c:	fef42423          	sw	a5,-24(s0)
     580:	fe842703          	lw	a4,-24(s0)
     584:	03f00793          	li	a5,63
     588:	f2e7dee3          	bge	a5,a4,4c4 <sieve+0x44>
     58c:	04418513          	addi	a0,gp,68 # 2834 <__global_pointer$+0x44>
     590:	b5dff0ef          	jal	ec <print_str>
     594:	2101a783          	lw	a5,528(gp) # 2a00 <hash>
     598:	00800593          	li	a1,8
     59c:	00078513          	mv	a0,a5
     5a0:	c35ff0ef          	jal	1d4 <print_hex>
     5a4:	2101a703          	lw	a4,528(gp) # 2a00 <hash>
     5a8:	1772a7b7          	lui	a5,0x1772a
     5ac:	48f78793          	addi	a5,a5,1167 # 1772a48f <_memory_end+0x1770a48f>
     5b0:	00f71863          	bne	a4,a5,5c0 <sieve+0x140>
     5b4:	05018513          	addi	a0,gp,80 # 2840 <__global_pointer$+0x50>
     5b8:	b35ff0ef          	jal	ec <print_str>
     5bc:	00c0006f          	j	5c8 <sieve+0x148>
     5c0:	05818513          	addi	a0,gp,88 # 2848 <__global_pointer$+0x58>
     5c4:	b29ff0ef          	jal	ec <print_str>
     5c8:	00000013          	nop
     5cc:	01c12083          	lw	ra,28(sp)
     5d0:	01812403          	lw	s0,24(sp)
     5d4:	02010113          	addi	sp,sp,32
     5d8:	00008067          	ret

000005dc <my_putc>:
     5dc:	fe010113          	addi	sp,sp,-32
     5e0:	00112e23          	sw	ra,28(sp)
     5e4:	00812c23          	sw	s0,24(sp)
     5e8:	02010413          	addi	s0,sp,32
     5ec:	fea42623          	sw	a0,-20(s0)
     5f0:	feb42423          	sw	a1,-24(s0)
     5f4:	fec42783          	lw	a5,-20(s0)
     5f8:	0ff7f793          	zext.b	a5,a5
     5fc:	00078513          	mv	a0,a5
     600:	229000ef          	jal	1028 <uart_put_char>
     604:	00050793          	mv	a5,a0
     608:	00078513          	mv	a0,a5
     60c:	01c12083          	lw	ra,28(sp)
     610:	01812403          	lw	s0,24(sp)
     614:	02010113          	addi	sp,sp,32
     618:	00008067          	ret

0000061c <my_putchar>:
     61c:	fe010113          	addi	sp,sp,-32
     620:	00112e23          	sw	ra,28(sp)
     624:	00812c23          	sw	s0,24(sp)
     628:	02010413          	addi	s0,sp,32
     62c:	fea42623          	sw	a0,-20(s0)
     630:	fec42783          	lw	a5,-20(s0)
     634:	0ff7f793          	zext.b	a5,a5
     638:	00078513          	mv	a0,a5
     63c:	1ed000ef          	jal	1028 <uart_put_char>
     640:	00050793          	mv	a5,a0
     644:	00078513          	mv	a0,a5
     648:	01c12083          	lw	ra,28(sp)
     64c:	01812403          	lw	s0,24(sp)
     650:	02010113          	addi	sp,sp,32
     654:	00008067          	ret

00000658 <my_getc>:
     658:	fe010113          	addi	sp,sp,-32
     65c:	00112e23          	sw	ra,28(sp)
     660:	00812c23          	sw	s0,24(sp)
     664:	02010413          	addi	s0,sp,32
     668:	fea42623          	sw	a0,-20(s0)
     66c:	17d000ef          	jal	fe8 <uart_get_char>
     670:	00050793          	mv	a5,a0
     674:	00078513          	mv	a0,a5
     678:	01c12083          	lw	ra,28(sp)
     67c:	01812403          	lw	s0,24(sp)
     680:	02010113          	addi	sp,sp,32
     684:	00008067          	ret

00000688 <my_getchar>:
     688:	ff010113          	addi	sp,sp,-16
     68c:	00112623          	sw	ra,12(sp)
     690:	00812423          	sw	s0,8(sp)
     694:	01010413          	addi	s0,sp,16
     698:	151000ef          	jal	fe8 <uart_get_char>
     69c:	00050793          	mv	a5,a0
     6a0:	00078513          	mv	a0,a5
     6a4:	00c12083          	lw	ra,12(sp)
     6a8:	00812403          	lw	s0,8(sp)
     6ac:	01010113          	addi	sp,sp,16
     6b0:	00008067          	ret

000006b4 <my_puts>:
     6b4:	fd010113          	addi	sp,sp,-48
     6b8:	02112623          	sw	ra,44(sp)
     6bc:	02812423          	sw	s0,40(sp)
     6c0:	03010413          	addi	s0,sp,48
     6c4:	fca42e23          	sw	a0,-36(s0)
     6c8:	fdc42503          	lw	a0,-36(s0)
     6cc:	1bd000ef          	jal	1088 <uart_put_string>
     6d0:	fea42623          	sw	a0,-20(s0)
     6d4:	fec42783          	lw	a5,-20(s0)
     6d8:	00078513          	mv	a0,a5
     6dc:	02c12083          	lw	ra,44(sp)
     6e0:	02812403          	lw	s0,40(sp)
     6e4:	03010113          	addi	sp,sp,48
     6e8:	00008067          	ret

000006ec <my_printf>:
     6ec:	fb010113          	addi	sp,sp,-80
     6f0:	02112623          	sw	ra,44(sp)
     6f4:	02812423          	sw	s0,40(sp)
     6f8:	03010413          	addi	s0,sp,48
     6fc:	fca42e23          	sw	a0,-36(s0)
     700:	00b42223          	sw	a1,4(s0)
     704:	00c42423          	sw	a2,8(s0)
     708:	00d42623          	sw	a3,12(s0)
     70c:	00e42823          	sw	a4,16(s0)
     710:	00f42a23          	sw	a5,20(s0)
     714:	01042c23          	sw	a6,24(s0)
     718:	01142e23          	sw	a7,28(s0)
     71c:	02040793          	addi	a5,s0,32
     720:	fcf42c23          	sw	a5,-40(s0)
     724:	fd842783          	lw	a5,-40(s0)
     728:	fe478793          	addi	a5,a5,-28
     72c:	fef42423          	sw	a5,-24(s0)
     730:	fe842783          	lw	a5,-24(s0)
     734:	00078593          	mv	a1,a5
     738:	fdc42503          	lw	a0,-36(s0)
     73c:	28c000ef          	jal	9c8 <my_vprintf>
     740:	fea42623          	sw	a0,-20(s0)
     744:	fec42783          	lw	a5,-20(s0)
     748:	00078513          	mv	a0,a5
     74c:	02c12083          	lw	ra,44(sp)
     750:	02812403          	lw	s0,40(sp)
     754:	05010113          	addi	sp,sp,80
     758:	00008067          	ret

0000075c <my_printn>:
     75c:	fd010113          	addi	sp,sp,-48
     760:	02112623          	sw	ra,44(sp)
     764:	02812423          	sw	s0,40(sp)
     768:	03010413          	addi	s0,sp,48
     76c:	fca42e23          	sw	a0,-36(s0)
     770:	fcb42c23          	sw	a1,-40(s0)
     774:	fcc42a23          	sw	a2,-44(s0)
     778:	fe042623          	sw	zero,-20(s0)
     77c:	fd842703          	lw	a4,-40(s0)
     780:	00a00793          	li	a5,10
     784:	02f71863          	bne	a4,a5,7b4 <my_printn+0x58>
     788:	fdc42783          	lw	a5,-36(s0)
     78c:	0207d463          	bgez	a5,7b4 <my_printn+0x58>
     790:	02d00513          	li	a0,45
     794:	095000ef          	jal	1028 <uart_put_char>
     798:	00050713          	mv	a4,a0
     79c:	fec42783          	lw	a5,-20(s0)
     7a0:	00f707b3          	add	a5,a4,a5
     7a4:	fef42623          	sw	a5,-20(s0)
     7a8:	fdc42783          	lw	a5,-36(s0)
     7ac:	40f007b3          	neg	a5,a5
     7b0:	fcf42e23          	sw	a5,-36(s0)
     7b4:	fd842783          	lw	a5,-40(s0)
     7b8:	fdc42703          	lw	a4,-36(s0)
     7bc:	02f757b3          	divu	a5,a4,a5
     7c0:	fef42423          	sw	a5,-24(s0)
     7c4:	fe842783          	lw	a5,-24(s0)
     7c8:	00079863          	bnez	a5,7d8 <my_printn+0x7c>
     7cc:	fd442703          	lw	a4,-44(s0)
     7d0:	00100793          	li	a5,1
     7d4:	02e7d863          	bge	a5,a4,804 <my_printn+0xa8>
     7d8:	fd442783          	lw	a5,-44(s0)
     7dc:	fff78793          	addi	a5,a5,-1
     7e0:	fcf42a23          	sw	a5,-44(s0)
     7e4:	fd442603          	lw	a2,-44(s0)
     7e8:	fd842583          	lw	a1,-40(s0)
     7ec:	fe842503          	lw	a0,-24(s0)
     7f0:	f6dff0ef          	jal	75c <my_printn>
     7f4:	00050713          	mv	a4,a0
     7f8:	fec42783          	lw	a5,-20(s0)
     7fc:	00e787b3          	add	a5,a5,a4
     800:	fef42623          	sw	a5,-20(s0)
     804:	fd842783          	lw	a5,-40(s0)
     808:	fdc42703          	lw	a4,-36(s0)
     80c:	02f777b3          	remu	a5,a4,a5
     810:	00078713          	mv	a4,a5
     814:	06018793          	addi	a5,gp,96 # 2850 <__global_pointer$+0x60>
     818:	00e787b3          	add	a5,a5,a4
     81c:	0007c783          	lbu	a5,0(a5)
     820:	00078513          	mv	a0,a5
     824:	005000ef          	jal	1028 <uart_put_char>
     828:	00050713          	mv	a4,a0
     82c:	fec42783          	lw	a5,-20(s0)
     830:	00f707b3          	add	a5,a4,a5
     834:	fef42623          	sw	a5,-20(s0)
     838:	fec42783          	lw	a5,-20(s0)
     83c:	00078513          	mv	a0,a5
     840:	02c12083          	lw	ra,44(sp)
     844:	02812403          	lw	s0,40(sp)
     848:	03010113          	addi	sp,sp,48
     84c:	00008067          	ret

00000850 <my_printflt>:
     850:	fd010113          	addi	sp,sp,-48
     854:	02112623          	sw	ra,44(sp)
     858:	02812423          	sw	s0,40(sp)
     85c:	03010413          	addi	s0,sp,48
     860:	fca42e23          	sw	a0,-36(s0)
     864:	fcb42c23          	sw	a1,-40(s0)
     868:	fe042423          	sw	zero,-24(s0)
     86c:	00000593          	li	a1,0
     870:	fdc42503          	lw	a0,-36(s0)
     874:	448010ef          	jal	1cbc <__lesf2>
     878:	00050793          	mv	a5,a0
     87c:	0207d663          	bgez	a5,8a8 <my_printflt+0x58>
     880:	02d00513          	li	a0,45
     884:	7a4000ef          	jal	1028 <uart_put_char>
     888:	00050713          	mv	a4,a0
     88c:	fe842783          	lw	a5,-24(s0)
     890:	00f707b3          	add	a5,a4,a5
     894:	fef42423          	sw	a5,-24(s0)
     898:	fdc42703          	lw	a4,-36(s0)
     89c:	800007b7          	lui	a5,0x80000
     8a0:	00f747b3          	xor	a5,a4,a5
     8a4:	fcf42e23          	sw	a5,-36(s0)
     8a8:	fdc42503          	lw	a0,-36(s0)
     8ac:	409010ef          	jal	24b4 <__fixsfsi>
     8b0:	00050793          	mv	a5,a0
     8b4:	fef42223          	sw	a5,-28(s0)
     8b8:	fe442783          	lw	a5,-28(s0)
     8bc:	fd842603          	lw	a2,-40(s0)
     8c0:	00a00593          	li	a1,10
     8c4:	00078513          	mv	a0,a5
     8c8:	e95ff0ef          	jal	75c <my_printn>
     8cc:	00050713          	mv	a4,a0
     8d0:	fe842783          	lw	a5,-24(s0)
     8d4:	00e787b3          	add	a5,a5,a4
     8d8:	fef42423          	sw	a5,-24(s0)
     8dc:	02e00513          	li	a0,46
     8e0:	748000ef          	jal	1028 <uart_put_char>
     8e4:	00050713          	mv	a4,a0
     8e8:	fe842783          	lw	a5,-24(s0)
     8ec:	00f707b3          	add	a5,a4,a5
     8f0:	fef42423          	sw	a5,-24(s0)
     8f4:	fe442503          	lw	a0,-28(s0)
     8f8:	42d010ef          	jal	2524 <__floatsisf>
     8fc:	00050793          	mv	a5,a0
     900:	00078593          	mv	a1,a5
     904:	fdc42503          	lw	a0,-36(s0)
     908:	77c010ef          	jal	2084 <__subsf3>
     90c:	00050793          	mv	a5,a0
     910:	fcf42e23          	sw	a5,-36(s0)
     914:	fe042623          	sw	zero,-20(s0)
     918:	0cc1a583          	lw	a1,204(gp) # 28bc <__global_pointer$+0xcc>
     91c:	fdc42503          	lw	a0,-36(s0)
     920:	448010ef          	jal	1d68 <__mulsf3>
     924:	00050793          	mv	a5,a0
     928:	fcf42e23          	sw	a5,-36(s0)
     92c:	fdc42503          	lw	a0,-36(s0)
     930:	385010ef          	jal	24b4 <__fixsfsi>
     934:	00050793          	mv	a5,a0
     938:	fef42223          	sw	a5,-28(s0)
     93c:	fe442783          	lw	a5,-28(s0)
     940:	0ff7f793          	zext.b	a5,a5
     944:	03078793          	addi	a5,a5,48 # 80000030 <_memory_end+0x7ffe0030>
     948:	0ff7f793          	zext.b	a5,a5
     94c:	00078513          	mv	a0,a5
     950:	6d8000ef          	jal	1028 <uart_put_char>
     954:	00050713          	mv	a4,a0
     958:	fe842783          	lw	a5,-24(s0)
     95c:	00f707b3          	add	a5,a4,a5
     960:	fef42423          	sw	a5,-24(s0)
     964:	fe442503          	lw	a0,-28(s0)
     968:	3bd010ef          	jal	2524 <__floatsisf>
     96c:	00050793          	mv	a5,a0
     970:	00078593          	mv	a1,a5
     974:	fdc42503          	lw	a0,-36(s0)
     978:	70c010ef          	jal	2084 <__subsf3>
     97c:	00050793          	mv	a5,a0
     980:	fcf42e23          	sw	a5,-36(s0)
     984:	fec42783          	lw	a5,-20(s0)
     988:	00178793          	addi	a5,a5,1
     98c:	fef42623          	sw	a5,-20(s0)
     990:	00000593          	li	a1,0
     994:	fdc42503          	lw	a0,-36(s0)
     998:	2bc010ef          	jal	1c54 <__eqsf2>
     99c:	00050793          	mv	a5,a0
     9a0:	00078863          	beqz	a5,9b0 <my_printflt+0x160>
     9a4:	fec42703          	lw	a4,-20(s0)
     9a8:	00500793          	li	a5,5
     9ac:	f6e7d6e3          	bge	a5,a4,918 <my_printflt+0xc8>
     9b0:	fe842783          	lw	a5,-24(s0)
     9b4:	00078513          	mv	a0,a5
     9b8:	02c12083          	lw	ra,44(sp)
     9bc:	02812403          	lw	s0,40(sp)
     9c0:	03010113          	addi	sp,sp,48
     9c4:	00008067          	ret

000009c8 <my_vprintf>:
     9c8:	fc010113          	addi	sp,sp,-64
     9cc:	02112e23          	sw	ra,60(sp)
     9d0:	02812c23          	sw	s0,56(sp)
     9d4:	04010413          	addi	s0,sp,64
     9d8:	fca42623          	sw	a0,-52(s0)
     9dc:	fcb42423          	sw	a1,-56(s0)
     9e0:	fe042023          	sw	zero,-32(s0)
     9e4:	3000006f          	j	ce4 <my_vprintf+0x31c>
     9e8:	fe842703          	lw	a4,-24(s0)
     9ec:	02500793          	li	a5,37
     9f0:	2cf71063          	bne	a4,a5,cb0 <my_vprintf+0x2e8>
     9f4:	fcc42783          	lw	a5,-52(s0)
     9f8:	0007c783          	lbu	a5,0(a5)
     9fc:	fef42423          	sw	a5,-24(s0)
     a00:	fe042623          	sw	zero,-20(s0)
     a04:	0440006f          	j	a48 <my_vprintf+0x80>
     a08:	fec42703          	lw	a4,-20(s0)
     a0c:	00070793          	mv	a5,a4
     a10:	00279793          	slli	a5,a5,0x2
     a14:	00e787b3          	add	a5,a5,a4
     a18:	00179793          	slli	a5,a5,0x1
     a1c:	00078713          	mv	a4,a5
     a20:	fe842783          	lw	a5,-24(s0)
     a24:	00f707b3          	add	a5,a4,a5
     a28:	fd078793          	addi	a5,a5,-48
     a2c:	fef42623          	sw	a5,-20(s0)
     a30:	fcc42783          	lw	a5,-52(s0)
     a34:	00178793          	addi	a5,a5,1
     a38:	fcf42623          	sw	a5,-52(s0)
     a3c:	fcc42783          	lw	a5,-52(s0)
     a40:	0007c783          	lbu	a5,0(a5)
     a44:	fef42423          	sw	a5,-24(s0)
     a48:	fe842703          	lw	a4,-24(s0)
     a4c:	02f00793          	li	a5,47
     a50:	00e7d863          	bge	a5,a4,a60 <my_vprintf+0x98>
     a54:	fe842703          	lw	a4,-24(s0)
     a58:	03900793          	li	a5,57
     a5c:	fae7d6e3          	bge	a5,a4,a08 <my_vprintf+0x40>
     a60:	fcc42783          	lw	a5,-52(s0)
     a64:	00178713          	addi	a4,a5,1
     a68:	fce42623          	sw	a4,-52(s0)
     a6c:	0007c783          	lbu	a5,0(a5)
     a70:	fef42423          	sw	a5,-24(s0)
     a74:	fe842703          	lw	a4,-24(s0)
     a78:	02500793          	li	a5,37
     a7c:	1ef70863          	beq	a4,a5,c6c <my_vprintf+0x2a4>
     a80:	fe842703          	lw	a4,-24(s0)
     a84:	02500793          	li	a5,37
     a88:	20f74063          	blt	a4,a5,c88 <my_vprintf+0x2c0>
     a8c:	fe842703          	lw	a4,-24(s0)
     a90:	07800793          	li	a5,120
     a94:	1ee7ca63          	blt	a5,a4,c88 <my_vprintf+0x2c0>
     a98:	fe842703          	lw	a4,-24(s0)
     a9c:	06300793          	li	a5,99
     aa0:	1ef74463          	blt	a4,a5,c88 <my_vprintf+0x2c0>
     aa4:	fe842783          	lw	a5,-24(s0)
     aa8:	f9d78793          	addi	a5,a5,-99
     aac:	01500713          	li	a4,21
     ab0:	1cf76c63          	bltu	a4,a5,c88 <my_vprintf+0x2c0>
     ab4:	00279713          	slli	a4,a5,0x2
     ab8:	07418793          	addi	a5,gp,116 # 2864 <__global_pointer$+0x74>
     abc:	00f707b3          	add	a5,a4,a5
     ac0:	0007a783          	lw	a5,0(a5)
     ac4:	00078067          	jr	a5
     ac8:	fc842783          	lw	a5,-56(s0)
     acc:	00478713          	addi	a4,a5,4
     ad0:	fce42423          	sw	a4,-56(s0)
     ad4:	0007a783          	lw	a5,0(a5)
     ad8:	fcf40ba3          	sb	a5,-41(s0)
     adc:	fd744783          	lbu	a5,-41(s0)
     ae0:	00078513          	mv	a0,a5
     ae4:	544000ef          	jal	1028 <uart_put_char>
     ae8:	00050713          	mv	a4,a0
     aec:	fe042783          	lw	a5,-32(s0)
     af0:	00f707b3          	add	a5,a4,a5
     af4:	fef42023          	sw	a5,-32(s0)
     af8:	1ec0006f          	j	ce4 <my_vprintf+0x31c>
     afc:	fc842783          	lw	a5,-56(s0)
     b00:	00478713          	addi	a4,a5,4
     b04:	fce42423          	sw	a4,-56(s0)
     b08:	0007a783          	lw	a5,0(a5)
     b0c:	fcf42e23          	sw	a5,-36(s0)
     b10:	fdc42783          	lw	a5,-36(s0)
     b14:	fec42603          	lw	a2,-20(s0)
     b18:	00800593          	li	a1,8
     b1c:	00078513          	mv	a0,a5
     b20:	c3dff0ef          	jal	75c <my_printn>
     b24:	00050713          	mv	a4,a0
     b28:	fe042783          	lw	a5,-32(s0)
     b2c:	00e787b3          	add	a5,a5,a4
     b30:	fef42023          	sw	a5,-32(s0)
     b34:	1b00006f          	j	ce4 <my_vprintf+0x31c>
     b38:	fc842783          	lw	a5,-56(s0)
     b3c:	00478713          	addi	a4,a5,4
     b40:	fce42423          	sw	a4,-56(s0)
     b44:	0007a783          	lw	a5,0(a5)
     b48:	fcf42e23          	sw	a5,-36(s0)
     b4c:	fdc42783          	lw	a5,-36(s0)
     b50:	fec42603          	lw	a2,-20(s0)
     b54:	00a00593          	li	a1,10
     b58:	00078513          	mv	a0,a5
     b5c:	c01ff0ef          	jal	75c <my_printn>
     b60:	00050713          	mv	a4,a0
     b64:	fe042783          	lw	a5,-32(s0)
     b68:	00e787b3          	add	a5,a5,a4
     b6c:	fef42023          	sw	a5,-32(s0)
     b70:	1740006f          	j	ce4 <my_vprintf+0x31c>
     b74:	fc842783          	lw	a5,-56(s0)
     b78:	00478713          	addi	a4,a5,4
     b7c:	fce42423          	sw	a4,-56(s0)
     b80:	0007a783          	lw	a5,0(a5)
     b84:	fcf42e23          	sw	a5,-36(s0)
     b88:	fdc42783          	lw	a5,-36(s0)
     b8c:	fec42603          	lw	a2,-20(s0)
     b90:	01000593          	li	a1,16
     b94:	00078513          	mv	a0,a5
     b98:	bc5ff0ef          	jal	75c <my_printn>
     b9c:	00050713          	mv	a4,a0
     ba0:	fe042783          	lw	a5,-32(s0)
     ba4:	00e787b3          	add	a5,a5,a4
     ba8:	fef42023          	sw	a5,-32(s0)
     bac:	1380006f          	j	ce4 <my_vprintf+0x31c>
     bb0:	fc842783          	lw	a5,-56(s0)
     bb4:	00478713          	addi	a4,a5,4
     bb8:	fce42423          	sw	a4,-56(s0)
     bbc:	0007a783          	lw	a5,0(a5)
     bc0:	fef42223          	sw	a5,-28(s0)
     bc4:	0480006f          	j	c0c <my_vprintf+0x244>
     bc8:	fe442783          	lw	a5,-28(s0)
     bcc:	0007c783          	lbu	a5,0(a5)
     bd0:	00078513          	mv	a0,a5
     bd4:	454000ef          	jal	1028 <uart_put_char>
     bd8:	00050713          	mv	a4,a0
     bdc:	fe042783          	lw	a5,-32(s0)
     be0:	00f707b3          	add	a5,a4,a5
     be4:	fef42023          	sw	a5,-32(s0)
     be8:	fe442783          	lw	a5,-28(s0)
     bec:	0007c703          	lbu	a4,0(a5)
     bf0:	00a00793          	li	a5,10
     bf4:	00f71663          	bne	a4,a5,c00 <my_vprintf+0x238>
     bf8:	00d00513          	li	a0,13
     bfc:	42c000ef          	jal	1028 <uart_put_char>
     c00:	fe442783          	lw	a5,-28(s0)
     c04:	00178793          	addi	a5,a5,1
     c08:	fef42223          	sw	a5,-28(s0)
     c0c:	fe442783          	lw	a5,-28(s0)
     c10:	0007c783          	lbu	a5,0(a5)
     c14:	fa079ae3          	bnez	a5,bc8 <my_vprintf+0x200>
     c18:	0cc0006f          	j	ce4 <my_vprintf+0x31c>
     c1c:	fc842783          	lw	a5,-56(s0)
     c20:	00778793          	addi	a5,a5,7
     c24:	ff87f793          	andi	a5,a5,-8
     c28:	00878713          	addi	a4,a5,8
     c2c:	fce42423          	sw	a4,-56(s0)
     c30:	0007a703          	lw	a4,0(a5)
     c34:	0047a783          	lw	a5,4(a5)
     c38:	00070513          	mv	a0,a4
     c3c:	00078593          	mv	a1,a5
     c40:	1ed010ef          	jal	262c <__truncdfsf2>
     c44:	00050793          	mv	a5,a0
     c48:	fcf42c23          	sw	a5,-40(s0)
     c4c:	fec42583          	lw	a1,-20(s0)
     c50:	fd842503          	lw	a0,-40(s0)
     c54:	bfdff0ef          	jal	850 <my_printflt>
     c58:	00050713          	mv	a4,a0
     c5c:	fe042783          	lw	a5,-32(s0)
     c60:	00e787b3          	add	a5,a5,a4
     c64:	fef42023          	sw	a5,-32(s0)
     c68:	07c0006f          	j	ce4 <my_vprintf+0x31c>
     c6c:	02500513          	li	a0,37
     c70:	3b8000ef          	jal	1028 <uart_put_char>
     c74:	00050713          	mv	a4,a0
     c78:	fe042783          	lw	a5,-32(s0)
     c7c:	00f707b3          	add	a5,a4,a5
     c80:	fef42023          	sw	a5,-32(s0)
     c84:	0600006f          	j	ce4 <my_vprintf+0x31c>
     c88:	02500513          	li	a0,37
     c8c:	39c000ef          	jal	1028 <uart_put_char>
     c90:	00050713          	mv	a4,a0
     c94:	fe042783          	lw	a5,-32(s0)
     c98:	00f707b3          	add	a5,a4,a5
     c9c:	fef42023          	sw	a5,-32(s0)
     ca0:	fcc42783          	lw	a5,-52(s0)
     ca4:	fff78793          	addi	a5,a5,-1
     ca8:	fcf42623          	sw	a5,-52(s0)
     cac:	0380006f          	j	ce4 <my_vprintf+0x31c>
     cb0:	fe842783          	lw	a5,-24(s0)
     cb4:	0ff7f793          	zext.b	a5,a5
     cb8:	00078513          	mv	a0,a5
     cbc:	36c000ef          	jal	1028 <uart_put_char>
     cc0:	00050713          	mv	a4,a0
     cc4:	fe042783          	lw	a5,-32(s0)
     cc8:	00f707b3          	add	a5,a4,a5
     ccc:	fef42023          	sw	a5,-32(s0)
     cd0:	fe842703          	lw	a4,-24(s0)
     cd4:	00a00793          	li	a5,10
     cd8:	00f71663          	bne	a4,a5,ce4 <my_vprintf+0x31c>
     cdc:	00d00513          	li	a0,13
     ce0:	348000ef          	jal	1028 <uart_put_char>
     ce4:	fcc42783          	lw	a5,-52(s0)
     ce8:	00178713          	addi	a4,a5,1
     cec:	fce42623          	sw	a4,-52(s0)
     cf0:	0007c783          	lbu	a5,0(a5)
     cf4:	fef42423          	sw	a5,-24(s0)
     cf8:	fe842783          	lw	a5,-24(s0)
     cfc:	ce0796e3          	bnez	a5,9e8 <my_vprintf+0x20>
     d00:	fe042783          	lw	a5,-32(s0)
     d04:	00078513          	mv	a0,a5
     d08:	03c12083          	lw	ra,60(sp)
     d0c:	03812403          	lw	s0,56(sp)
     d10:	04010113          	addi	sp,sp,64
     d14:	00008067          	ret

00000d18 <uart_init>:
     d18:	fc010113          	addi	sp,sp,-64
     d1c:	02112e23          	sw	ra,60(sp)
     d20:	02812c23          	sw	s0,56(sp)
     d24:	04010413          	addi	s0,sp,64
     d28:	fca42e23          	sw	a0,-36(s0)
     d2c:	fcb42c23          	sw	a1,-40(s0)
     d30:	fcc42a23          	sw	a2,-44(s0)
     d34:	fcd42823          	sw	a3,-48(s0)
     d38:	fce42623          	sw	a4,-52(s0)
     d3c:	fdc42783          	lw	a5,-36(s0)
     d40:	00079663          	bnez	a5,d4c <uart_init+0x34>
     d44:	5b0000ef          	jal	12f4 <uart_get_clk_freq>
     d48:	fca42e23          	sw	a0,-36(s0)
     d4c:	fdc42703          	lw	a4,-36(s0)
     d50:	fd842783          	lw	a5,-40(s0)
     d54:	02f757b3          	divu	a5,a4,a5
     d58:	00078513          	mv	a0,a5
     d5c:	679000ef          	jal	1bd4 <__floatunsidf>
     d60:	00050713          	mv	a4,a0
     d64:	00058793          	mv	a5,a1
     d68:	0d01a603          	lw	a2,208(gp) # 28c0 <__global_pointer$+0xd0>
     d6c:	0d41a683          	lw	a3,212(gp) # 28c4 <__global_pointer$+0xd4>
     d70:	00070513          	mv	a0,a4
     d74:	00078593          	mv	a1,a5
     d78:	648000ef          	jal	13c0 <__adddf3>
     d7c:	00050713          	mv	a4,a0
     d80:	00058793          	mv	a5,a1
     d84:	00070513          	mv	a0,a4
     d88:	00078593          	mv	a1,a5
     d8c:	5c9000ef          	jal	1b54 <__fixdfsi>
     d90:	00050793          	mv	a5,a0
     d94:	00078713          	mv	a4,a5
     d98:	000107b7          	lui	a5,0x10
     d9c:	fff78793          	addi	a5,a5,-1 # ffff <_bss_end+0xd5fb>
     da0:	00f777b3          	and	a5,a4,a5
     da4:	fef42623          	sw	a5,-20(s0)
     da8:	fd442703          	lw	a4,-44(s0)
     dac:	00800793          	li	a5,8
     db0:	00f71663          	bne	a4,a5,dbc <uart_init+0xa4>
     db4:	00000793          	li	a5,0
     db8:	0080006f          	j	dc0 <uart_init+0xa8>
     dbc:	000107b7          	lui	a5,0x10
     dc0:	fec42703          	lw	a4,-20(s0)
     dc4:	00e7e7b3          	or	a5,a5,a4
     dc8:	fef42623          	sw	a5,-20(s0)
     dcc:	fd042783          	lw	a5,-48(s0)
     dd0:	00079663          	bnez	a5,ddc <uart_init+0xc4>
     dd4:	00000793          	li	a5,0
     dd8:	0080006f          	j	de0 <uart_init+0xc8>
     ddc:	000207b7          	lui	a5,0x20
     de0:	fec42703          	lw	a4,-20(s0)
     de4:	00e7e7b3          	or	a5,a5,a4
     de8:	fef42623          	sw	a5,-20(s0)
     dec:	fd042703          	lw	a4,-48(s0)
     df0:	00100793          	li	a5,1
     df4:	00f71663          	bne	a4,a5,e00 <uart_init+0xe8>
     df8:	00000793          	li	a5,0
     dfc:	0080006f          	j	e04 <uart_init+0xec>
     e00:	000407b7          	lui	a5,0x40
     e04:	fec42703          	lw	a4,-20(s0)
     e08:	00e7e7b3          	or	a5,a5,a4
     e0c:	fef42623          	sw	a5,-20(s0)
     e10:	fcc42703          	lw	a4,-52(s0)
     e14:	00100793          	li	a5,1
     e18:	00f71663          	bne	a4,a5,e24 <uart_init+0x10c>
     e1c:	00000793          	li	a5,0
     e20:	0080006f          	j	e28 <uart_init+0x110>
     e24:	000807b7          	lui	a5,0x80
     e28:	fec42703          	lw	a4,-20(s0)
     e2c:	00e7e7b3          	or	a5,a5,a4
     e30:	fef42623          	sw	a5,-20(s0)
     e34:	1f41a783          	lw	a5,500(gp) # 29e4 <UART_CONTROL>
     e38:	fef42423          	sw	a5,-24(s0)
     e3c:	fe842783          	lw	a5,-24(s0)
     e40:	fec42703          	lw	a4,-20(s0)
     e44:	00e7a023          	sw	a4,0(a5) # 80000 <_memory_end+0x60000>
     e48:	00000013          	nop
     e4c:	03c12083          	lw	ra,60(sp)
     e50:	03812403          	lw	s0,56(sp)
     e54:	04010113          	addi	sp,sp,64
     e58:	00008067          	ret

00000e5c <uart_init_ext>:
     e5c:	fc010113          	addi	sp,sp,-64
     e60:	02112e23          	sw	ra,60(sp)
     e64:	02812c23          	sw	s0,56(sp)
     e68:	04010413          	addi	s0,sp,64
     e6c:	fca42e23          	sw	a0,-36(s0)
     e70:	fcb42c23          	sw	a1,-40(s0)
     e74:	fcc42a23          	sw	a2,-44(s0)
     e78:	fcd42823          	sw	a3,-48(s0)
     e7c:	fce42623          	sw	a4,-52(s0)
     e80:	fcf42423          	sw	a5,-56(s0)
     e84:	fd042223          	sw	a6,-60(s0)
     e88:	fdc42783          	lw	a5,-36(s0)
     e8c:	00079663          	bnez	a5,e98 <uart_init_ext+0x3c>
     e90:	464000ef          	jal	12f4 <uart_get_clk_freq>
     e94:	fca42e23          	sw	a0,-36(s0)
     e98:	fdc42703          	lw	a4,-36(s0)
     e9c:	fd842783          	lw	a5,-40(s0)
     ea0:	02f757b3          	divu	a5,a4,a5
     ea4:	00078513          	mv	a0,a5
     ea8:	52d000ef          	jal	1bd4 <__floatunsidf>
     eac:	00050713          	mv	a4,a0
     eb0:	00058793          	mv	a5,a1
     eb4:	0d01a603          	lw	a2,208(gp) # 28c0 <__global_pointer$+0xd0>
     eb8:	0d41a683          	lw	a3,212(gp) # 28c4 <__global_pointer$+0xd4>
     ebc:	00070513          	mv	a0,a4
     ec0:	00078593          	mv	a1,a5
     ec4:	4fc000ef          	jal	13c0 <__adddf3>
     ec8:	00050713          	mv	a4,a0
     ecc:	00058793          	mv	a5,a1
     ed0:	00070513          	mv	a0,a4
     ed4:	00078593          	mv	a1,a5
     ed8:	47d000ef          	jal	1b54 <__fixdfsi>
     edc:	00050793          	mv	a5,a0
     ee0:	00078713          	mv	a4,a5
     ee4:	000107b7          	lui	a5,0x10
     ee8:	fff78793          	addi	a5,a5,-1 # ffff <_bss_end+0xd5fb>
     eec:	00f777b3          	and	a5,a4,a5
     ef0:	fef42623          	sw	a5,-20(s0)
     ef4:	fd442703          	lw	a4,-44(s0)
     ef8:	00800793          	li	a5,8
     efc:	00f71663          	bne	a4,a5,f08 <uart_init_ext+0xac>
     f00:	00000793          	li	a5,0
     f04:	0080006f          	j	f0c <uart_init_ext+0xb0>
     f08:	000107b7          	lui	a5,0x10
     f0c:	fec42703          	lw	a4,-20(s0)
     f10:	00e7e7b3          	or	a5,a5,a4
     f14:	fef42623          	sw	a5,-20(s0)
     f18:	fd042783          	lw	a5,-48(s0)
     f1c:	00079663          	bnez	a5,f28 <uart_init_ext+0xcc>
     f20:	00000793          	li	a5,0
     f24:	0080006f          	j	f2c <uart_init_ext+0xd0>
     f28:	000207b7          	lui	a5,0x20
     f2c:	fec42703          	lw	a4,-20(s0)
     f30:	00e7e7b3          	or	a5,a5,a4
     f34:	fef42623          	sw	a5,-20(s0)
     f38:	fd042703          	lw	a4,-48(s0)
     f3c:	00100793          	li	a5,1
     f40:	00f71663          	bne	a4,a5,f4c <uart_init_ext+0xf0>
     f44:	00000793          	li	a5,0
     f48:	0080006f          	j	f50 <uart_init_ext+0xf4>
     f4c:	000407b7          	lui	a5,0x40
     f50:	fec42703          	lw	a4,-20(s0)
     f54:	00e7e7b3          	or	a5,a5,a4
     f58:	fef42623          	sw	a5,-20(s0)
     f5c:	fcc42703          	lw	a4,-52(s0)
     f60:	00100793          	li	a5,1
     f64:	00f71663          	bne	a4,a5,f70 <uart_init_ext+0x114>
     f68:	00000793          	li	a5,0
     f6c:	0080006f          	j	f74 <uart_init_ext+0x118>
     f70:	000807b7          	lui	a5,0x80
     f74:	fec42703          	lw	a4,-20(s0)
     f78:	00e7e7b3          	or	a5,a5,a4
     f7c:	fef42623          	sw	a5,-20(s0)
     f80:	fc842783          	lw	a5,-56(s0)
     f84:	00079663          	bnez	a5,f90 <uart_init_ext+0x134>
     f88:	00000793          	li	a5,0
     f8c:	0080006f          	j	f94 <uart_init_ext+0x138>
     f90:	002007b7          	lui	a5,0x200
     f94:	fec42703          	lw	a4,-20(s0)
     f98:	00e7e7b3          	or	a5,a5,a4
     f9c:	fef42623          	sw	a5,-20(s0)
     fa0:	fc442783          	lw	a5,-60(s0)
     fa4:	00079663          	bnez	a5,fb0 <uart_init_ext+0x154>
     fa8:	00000793          	li	a5,0
     fac:	0080006f          	j	fb4 <uart_init_ext+0x158>
     fb0:	001007b7          	lui	a5,0x100
     fb4:	fec42703          	lw	a4,-20(s0)
     fb8:	00e7e7b3          	or	a5,a5,a4
     fbc:	fef42623          	sw	a5,-20(s0)
     fc0:	1f41a783          	lw	a5,500(gp) # 29e4 <UART_CONTROL>
     fc4:	fef42423          	sw	a5,-24(s0)
     fc8:	fe842783          	lw	a5,-24(s0)
     fcc:	fec42703          	lw	a4,-20(s0)
     fd0:	00e7a023          	sw	a4,0(a5) # 100000 <_memory_end+0xe0000>
     fd4:	00000013          	nop
     fd8:	03c12083          	lw	ra,60(sp)
     fdc:	03812403          	lw	s0,56(sp)
     fe0:	04010113          	addi	sp,sp,64
     fe4:	00008067          	ret

00000fe8 <uart_get_char>:
     fe8:	fe010113          	addi	sp,sp,-32
     fec:	00812e23          	sw	s0,28(sp)
     ff0:	02010413          	addi	s0,sp,32
     ff4:	2001a783          	lw	a5,512(gp) # 29f0 <UART_RX>
     ff8:	fef42423          	sw	a5,-24(s0)
     ffc:	fe842783          	lw	a5,-24(s0)
    1000:	0007a783          	lw	a5,0(a5)
    1004:	fef42623          	sw	a5,-20(s0)
    1008:	fec42783          	lw	a5,-20(s0)
    100c:	fe07d4e3          	bgez	a5,ff4 <uart_get_char+0xc>
    1010:	fec42783          	lw	a5,-20(s0)
    1014:	0ff7f793          	zext.b	a5,a5
    1018:	00078513          	mv	a0,a5
    101c:	01c12403          	lw	s0,28(sp)
    1020:	02010113          	addi	sp,sp,32
    1024:	00008067          	ret

00001028 <uart_put_char>:
    1028:	fd010113          	addi	sp,sp,-48
    102c:	02812623          	sw	s0,44(sp)
    1030:	03010413          	addi	s0,sp,48
    1034:	00050793          	mv	a5,a0
    1038:	fcf40fa3          	sb	a5,-33(s0)
    103c:	1fc1a783          	lw	a5,508(gp) # 29ec <UART_TX>
    1040:	fef42423          	sw	a5,-24(s0)
    1044:	fe842783          	lw	a5,-24(s0)
    1048:	0007a783          	lw	a5,0(a5)
    104c:	fef42623          	sw	a5,-20(s0)
    1050:	fec42783          	lw	a5,-20(s0)
    1054:	fe07c4e3          	bltz	a5,103c <uart_put_char+0x14>
    1058:	fdf44783          	lbu	a5,-33(s0)
    105c:	fef42623          	sw	a5,-20(s0)
    1060:	1fc1a783          	lw	a5,508(gp) # 29ec <UART_TX>
    1064:	fef42223          	sw	a5,-28(s0)
    1068:	fe442783          	lw	a5,-28(s0)
    106c:	fec42703          	lw	a4,-20(s0)
    1070:	00e7a023          	sw	a4,0(a5)
    1074:	fdf44783          	lbu	a5,-33(s0)
    1078:	00078513          	mv	a0,a5
    107c:	02c12403          	lw	s0,44(sp)
    1080:	03010113          	addi	sp,sp,48
    1084:	00008067          	ret

00001088 <uart_put_string>:
    1088:	fc010113          	addi	sp,sp,-64
    108c:	02812e23          	sw	s0,60(sp)
    1090:	04010413          	addi	s0,sp,64
    1094:	fca42623          	sw	a0,-52(s0)
    1098:	fe042623          	sw	zero,-20(s0)
    109c:	0400006f          	j	10dc <uart_put_string+0x54>
    10a0:	1fc1a783          	lw	a5,508(gp) # 29ec <UART_TX>
    10a4:	fef42023          	sw	a5,-32(s0)
    10a8:	fe042783          	lw	a5,-32(s0)
    10ac:	0007a783          	lw	a5,0(a5)
    10b0:	fef42223          	sw	a5,-28(s0)
    10b4:	fe442783          	lw	a5,-28(s0)
    10b8:	fe07c4e3          	bltz	a5,10a0 <uart_put_string+0x18>
    10bc:	1fc1a783          	lw	a5,508(gp) # 29ec <UART_TX>
    10c0:	fcf42e23          	sw	a5,-36(s0)
    10c4:	fdc42783          	lw	a5,-36(s0)
    10c8:	feb44703          	lbu	a4,-21(s0)
    10cc:	00e7a023          	sw	a4,0(a5)
    10d0:	fec42783          	lw	a5,-20(s0)
    10d4:	00178793          	addi	a5,a5,1
    10d8:	fef42623          	sw	a5,-20(s0)
    10dc:	fcc42783          	lw	a5,-52(s0)
    10e0:	00178713          	addi	a4,a5,1
    10e4:	fce42623          	sw	a4,-52(s0)
    10e8:	0007c783          	lbu	a5,0(a5)
    10ec:	fef405a3          	sb	a5,-21(s0)
    10f0:	feb44783          	lbu	a5,-21(s0)
    10f4:	fa0796e3          	bnez	a5,10a0 <uart_put_string+0x18>
    10f8:	fec42783          	lw	a5,-20(s0)
    10fc:	00078513          	mv	a0,a5
    1100:	03c12403          	lw	s0,60(sp)
    1104:	04010113          	addi	sp,sp,64
    1108:	00008067          	ret

0000110c <uart_put_int>:
    110c:	fc010113          	addi	sp,sp,-64
    1110:	02112e23          	sw	ra,60(sp)
    1114:	02812c23          	sw	s0,56(sp)
    1118:	04010413          	addi	s0,sp,64
    111c:	fca42623          	sw	a0,-52(s0)
    1120:	fcc42703          	lw	a4,-52(s0)
    1124:	00a00793          	li	a5,10
    1128:	02f757b3          	divu	a5,a4,a5
    112c:	fef42623          	sw	a5,-20(s0)
    1130:	fec42783          	lw	a5,-20(s0)
    1134:	00078863          	beqz	a5,1144 <uart_put_int+0x38>
    1138:	fec42783          	lw	a5,-20(s0)
    113c:	00078513          	mv	a0,a5
    1140:	fcdff0ef          	jal	110c <uart_put_int>
    1144:	fcc42703          	lw	a4,-52(s0)
    1148:	00a00793          	li	a5,10
    114c:	02f777b3          	remu	a5,a4,a5
    1150:	0ff7f793          	zext.b	a5,a5
    1154:	03078793          	addi	a5,a5,48
    1158:	fef405a3          	sb	a5,-21(s0)
    115c:	1fc1a783          	lw	a5,508(gp) # 29ec <UART_TX>
    1160:	fcf42a23          	sw	a5,-44(s0)
    1164:	fd442783          	lw	a5,-44(s0)
    1168:	0007a783          	lw	a5,0(a5)
    116c:	fcf42c23          	sw	a5,-40(s0)
    1170:	fd842783          	lw	a5,-40(s0)
    1174:	fe07c4e3          	bltz	a5,115c <uart_put_int+0x50>
    1178:	1fc1a783          	lw	a5,508(gp) # 29ec <UART_TX>
    117c:	fcf42823          	sw	a5,-48(s0)
    1180:	fd042783          	lw	a5,-48(s0)
    1184:	feb44703          	lbu	a4,-21(s0)
    1188:	00e7a023          	sw	a4,0(a5)
    118c:	00000013          	nop
    1190:	03c12083          	lw	ra,60(sp)
    1194:	03812403          	lw	s0,56(sp)
    1198:	04010113          	addi	sp,sp,64
    119c:	00008067          	ret

000011a0 <uart_put_hex>:
    11a0:	fc010113          	addi	sp,sp,-64
    11a4:	02112e23          	sw	ra,60(sp)
    11a8:	02812c23          	sw	s0,56(sp)
    11ac:	04010413          	addi	s0,sp,64
    11b0:	fca42623          	sw	a0,-52(s0)
    11b4:	fcc42783          	lw	a5,-52(s0)
    11b8:	0047d793          	srli	a5,a5,0x4
    11bc:	fef42423          	sw	a5,-24(s0)
    11c0:	fe842783          	lw	a5,-24(s0)
    11c4:	00078863          	beqz	a5,11d4 <uart_put_hex+0x34>
    11c8:	fe842783          	lw	a5,-24(s0)
    11cc:	00078513          	mv	a0,a5
    11d0:	fd1ff0ef          	jal	11a0 <uart_put_hex>
    11d4:	fcc42783          	lw	a5,-52(s0)
    11d8:	00f7f793          	andi	a5,a5,15
    11dc:	fef42423          	sw	a5,-24(s0)
    11e0:	fe842703          	lw	a4,-24(s0)
    11e4:	00900793          	li	a5,9
    11e8:	00e7cc63          	blt	a5,a4,1200 <uart_put_hex+0x60>
    11ec:	fe842783          	lw	a5,-24(s0)
    11f0:	0ff7f793          	zext.b	a5,a5
    11f4:	03078793          	addi	a5,a5,48
    11f8:	fef407a3          	sb	a5,-17(s0)
    11fc:	0140006f          	j	1210 <uart_put_hex+0x70>
    1200:	fe842783          	lw	a5,-24(s0)
    1204:	0ff7f793          	zext.b	a5,a5
    1208:	03778793          	addi	a5,a5,55
    120c:	fef407a3          	sb	a5,-17(s0)
    1210:	1fc1a783          	lw	a5,508(gp) # 29ec <UART_TX>
    1214:	fef42023          	sw	a5,-32(s0)
    1218:	fe042783          	lw	a5,-32(s0)
    121c:	0007a783          	lw	a5,0(a5)
    1220:	fef42223          	sw	a5,-28(s0)
    1224:	fe442783          	lw	a5,-28(s0)
    1228:	fe07c4e3          	bltz	a5,1210 <uart_put_hex+0x70>
    122c:	1fc1a783          	lw	a5,508(gp) # 29ec <UART_TX>
    1230:	fcf42e23          	sw	a5,-36(s0)
    1234:	fdc42783          	lw	a5,-36(s0)
    1238:	fef44703          	lbu	a4,-17(s0)
    123c:	00e7a023          	sw	a4,0(a5)
    1240:	00000013          	nop
    1244:	03c12083          	lw	ra,60(sp)
    1248:	03812403          	lw	s0,56(sp)
    124c:	04010113          	addi	sp,sp,64
    1250:	00008067          	ret

00001254 <uart_cler_tx_irq>:
    1254:	fe010113          	addi	sp,sp,-32
    1258:	00812e23          	sw	s0,28(sp)
    125c:	02010413          	addi	s0,sp,32
    1260:	1f81a783          	lw	a5,504(gp) # 29e8 <UART_STATUS>
    1264:	fef42423          	sw	a5,-24(s0)
    1268:	fe842783          	lw	a5,-24(s0)
    126c:	0007a783          	lw	a5,0(a5)
    1270:	fef42623          	sw	a5,-20(s0)
    1274:	fec42783          	lw	a5,-20(s0)
    1278:	ffe7f793          	andi	a5,a5,-2
    127c:	fef42623          	sw	a5,-20(s0)
    1280:	1f81a783          	lw	a5,504(gp) # 29e8 <UART_STATUS>
    1284:	fef42223          	sw	a5,-28(s0)
    1288:	fe442783          	lw	a5,-28(s0)
    128c:	fec42703          	lw	a4,-20(s0)
    1290:	00e7a023          	sw	a4,0(a5)
    1294:	00000013          	nop
    1298:	01c12403          	lw	s0,28(sp)
    129c:	02010113          	addi	sp,sp,32
    12a0:	00008067          	ret

000012a4 <uart_cler_rx_irq>:
    12a4:	fe010113          	addi	sp,sp,-32
    12a8:	00812e23          	sw	s0,28(sp)
    12ac:	02010413          	addi	s0,sp,32
    12b0:	1f81a783          	lw	a5,504(gp) # 29e8 <UART_STATUS>
    12b4:	fef42423          	sw	a5,-24(s0)
    12b8:	fe842783          	lw	a5,-24(s0)
    12bc:	0007a783          	lw	a5,0(a5)
    12c0:	fef42623          	sw	a5,-20(s0)
    12c4:	fec42783          	lw	a5,-20(s0)
    12c8:	ffd7f793          	andi	a5,a5,-3
    12cc:	fef42623          	sw	a5,-20(s0)
    12d0:	1f81a783          	lw	a5,504(gp) # 29e8 <UART_STATUS>
    12d4:	fef42223          	sw	a5,-28(s0)
    12d8:	fe442783          	lw	a5,-28(s0)
    12dc:	fec42703          	lw	a4,-20(s0)
    12e0:	00e7a023          	sw	a4,0(a5)
    12e4:	00000013          	nop
    12e8:	01c12403          	lw	s0,28(sp)
    12ec:	02010113          	addi	sp,sp,32
    12f0:	00008067          	ret

000012f4 <uart_get_clk_freq>:
    12f4:	fe010113          	addi	sp,sp,-32
    12f8:	00812e23          	sw	s0,28(sp)
    12fc:	02010413          	addi	s0,sp,32
    1300:	2041a783          	lw	a5,516(gp) # 29f4 <UART_CLK_FREQ>
    1304:	fef42423          	sw	a5,-24(s0)
    1308:	fe842783          	lw	a5,-24(s0)
    130c:	0007a783          	lw	a5,0(a5)
    1310:	fef42623          	sw	a5,-20(s0)
    1314:	fec42783          	lw	a5,-20(s0)
    1318:	00078513          	mv	a0,a5
    131c:	01c12403          	lw	s0,28(sp)
    1320:	02010113          	addi	sp,sp,32
    1324:	00008067          	ret

00001328 <uart_set_addr>:
    1328:	fe010113          	addi	sp,sp,-32
    132c:	00812e23          	sw	s0,28(sp)
    1330:	02010413          	addi	s0,sp,32
    1334:	fea42623          	sw	a0,-20(s0)
    1338:	fec42703          	lw	a4,-20(s0)
    133c:	1ee1a423          	sw	a4,488(gp) # 29d8 <UART_ADDR_BASE>
    1340:	fec42703          	lw	a4,-20(s0)
    1344:	1ee1a623          	sw	a4,492(gp) # 29dc <UART_VERSION>
    1348:	fec42783          	lw	a5,-20(s0)
    134c:	00478713          	addi	a4,a5,4
    1350:	1ee1a823          	sw	a4,496(gp) # 29e0 <UART_NAME>
    1354:	fec42783          	lw	a5,-20(s0)
    1358:	01078713          	addi	a4,a5,16
    135c:	1ee1aa23          	sw	a4,500(gp) # 29e4 <UART_CONTROL>
    1360:	fec42783          	lw	a5,-20(s0)
    1364:	01478713          	addi	a4,a5,20
    1368:	1ee1ac23          	sw	a4,504(gp) # 29e8 <UART_STATUS>
    136c:	fec42783          	lw	a5,-20(s0)
    1370:	01878713          	addi	a4,a5,24
    1374:	1ee1ae23          	sw	a4,508(gp) # 29ec <UART_TX>
    1378:	fec42783          	lw	a5,-20(s0)
    137c:	01c78713          	addi	a4,a5,28
    1380:	20e1a023          	sw	a4,512(gp) # 29f0 <UART_RX>
    1384:	fec42783          	lw	a5,-20(s0)
    1388:	02078713          	addi	a4,a5,32
    138c:	20e1a223          	sw	a4,516(gp) # 29f4 <UART_CLK_FREQ>
    1390:	00000013          	nop
    1394:	01c12403          	lw	s0,28(sp)
    1398:	02010113          	addi	sp,sp,32
    139c:	00008067          	ret

000013a0 <uart_get_addr>:
    13a0:	ff010113          	addi	sp,sp,-16
    13a4:	00812623          	sw	s0,12(sp)
    13a8:	01010413          	addi	s0,sp,16
    13ac:	1e81a783          	lw	a5,488(gp) # 29d8 <UART_ADDR_BASE>
    13b0:	00078513          	mv	a0,a5
    13b4:	00c12403          	lw	s0,12(sp)
    13b8:	01010113          	addi	sp,sp,16
    13bc:	00008067          	ret

000013c0 <__adddf3>:
    13c0:	00100837          	lui	a6,0x100
    13c4:	fff80813          	addi	a6,a6,-1 # fffff <_memory_end+0xdffff>
    13c8:	fe010113          	addi	sp,sp,-32
    13cc:	00b878b3          	and	a7,a6,a1
    13d0:	0145d713          	srli	a4,a1,0x14
    13d4:	01d55793          	srli	a5,a0,0x1d
    13d8:	00d87833          	and	a6,a6,a3
    13dc:	00912a23          	sw	s1,20(sp)
    13e0:	7ff77493          	andi	s1,a4,2047
    13e4:	00389713          	slli	a4,a7,0x3
    13e8:	0146d893          	srli	a7,a3,0x14
    13ec:	00381813          	slli	a6,a6,0x3
    13f0:	01212823          	sw	s2,16(sp)
    13f4:	00e7e7b3          	or	a5,a5,a4
    13f8:	7ff8f893          	andi	a7,a7,2047
    13fc:	01d65713          	srli	a4,a2,0x1d
    1400:	00112e23          	sw	ra,28(sp)
    1404:	00812c23          	sw	s0,24(sp)
    1408:	01312623          	sw	s3,12(sp)
    140c:	01f5d913          	srli	s2,a1,0x1f
    1410:	01f6d693          	srli	a3,a3,0x1f
    1414:	01076733          	or	a4,a4,a6
    1418:	00351513          	slli	a0,a0,0x3
    141c:	00361613          	slli	a2,a2,0x3
    1420:	41148833          	sub	a6,s1,a7
    1424:	2ad91a63          	bne	s2,a3,16d8 <__adddf3+0x318>
    1428:	11005c63          	blez	a6,1540 <__adddf3+0x180>
    142c:	04089063          	bnez	a7,146c <__adddf3+0xac>
    1430:	00c766b3          	or	a3,a4,a2
    1434:	66068063          	beqz	a3,1a94 <__adddf3+0x6d4>
    1438:	fff80593          	addi	a1,a6,-1
    143c:	02059063          	bnez	a1,145c <__adddf3+0x9c>
    1440:	00c50633          	add	a2,a0,a2
    1444:	00a636b3          	sltu	a3,a2,a0
    1448:	00e78733          	add	a4,a5,a4
    144c:	00060513          	mv	a0,a2
    1450:	00d707b3          	add	a5,a4,a3
    1454:	00100493          	li	s1,1
    1458:	06c0006f          	j	14c4 <__adddf3+0x104>
    145c:	7ff00693          	li	a3,2047
    1460:	02d81063          	bne	a6,a3,1480 <__adddf3+0xc0>
    1464:	7ff00493          	li	s1,2047
    1468:	1f80006f          	j	1660 <__adddf3+0x2a0>
    146c:	7ff00693          	li	a3,2047
    1470:	1ed48863          	beq	s1,a3,1660 <__adddf3+0x2a0>
    1474:	008006b7          	lui	a3,0x800
    1478:	00d76733          	or	a4,a4,a3
    147c:	00080593          	mv	a1,a6
    1480:	03800693          	li	a3,56
    1484:	0ab6c863          	blt	a3,a1,1534 <__adddf3+0x174>
    1488:	01f00693          	li	a3,31
    148c:	06b6ca63          	blt	a3,a1,1500 <__adddf3+0x140>
    1490:	02000813          	li	a6,32
    1494:	40b80833          	sub	a6,a6,a1
    1498:	010716b3          	sll	a3,a4,a6
    149c:	00b658b3          	srl	a7,a2,a1
    14a0:	01061833          	sll	a6,a2,a6
    14a4:	0116e6b3          	or	a3,a3,a7
    14a8:	01003833          	snez	a6,a6
    14ac:	0106e6b3          	or	a3,a3,a6
    14b0:	00b755b3          	srl	a1,a4,a1
    14b4:	00a68533          	add	a0,a3,a0
    14b8:	00f585b3          	add	a1,a1,a5
    14bc:	00d536b3          	sltu	a3,a0,a3
    14c0:	00d587b3          	add	a5,a1,a3
    14c4:	00879713          	slli	a4,a5,0x8
    14c8:	18075c63          	bgez	a4,1660 <__adddf3+0x2a0>
    14cc:	00148493          	addi	s1,s1,1
    14d0:	7ff00713          	li	a4,2047
    14d4:	5ae48a63          	beq	s1,a4,1a88 <__adddf3+0x6c8>
    14d8:	ff800737          	lui	a4,0xff800
    14dc:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    14e0:	00e7f733          	and	a4,a5,a4
    14e4:	00155793          	srli	a5,a0,0x1
    14e8:	00157513          	andi	a0,a0,1
    14ec:	00a7e7b3          	or	a5,a5,a0
    14f0:	01f71513          	slli	a0,a4,0x1f
    14f4:	00f56533          	or	a0,a0,a5
    14f8:	00175793          	srli	a5,a4,0x1
    14fc:	1640006f          	j	1660 <__adddf3+0x2a0>
    1500:	fe058693          	addi	a3,a1,-32
    1504:	02000893          	li	a7,32
    1508:	00d756b3          	srl	a3,a4,a3
    150c:	00000813          	li	a6,0
    1510:	01158863          	beq	a1,a7,1520 <__adddf3+0x160>
    1514:	04000813          	li	a6,64
    1518:	40b80833          	sub	a6,a6,a1
    151c:	01071833          	sll	a6,a4,a6
    1520:	00c86833          	or	a6,a6,a2
    1524:	01003833          	snez	a6,a6
    1528:	0106e6b3          	or	a3,a3,a6
    152c:	00000593          	li	a1,0
    1530:	f85ff06f          	j	14b4 <__adddf3+0xf4>
    1534:	00c766b3          	or	a3,a4,a2
    1538:	00d036b3          	snez	a3,a3
    153c:	ff1ff06f          	j	152c <__adddf3+0x16c>
    1540:	0c080a63          	beqz	a6,1614 <__adddf3+0x254>
    1544:	409886b3          	sub	a3,a7,s1
    1548:	02049463          	bnez	s1,1570 <__adddf3+0x1b0>
    154c:	00a7e5b3          	or	a1,a5,a0
    1550:	50058e63          	beqz	a1,1a6c <__adddf3+0x6ac>
    1554:	fff68593          	addi	a1,a3,-1 # 7fffff <_memory_end+0x7dffff>
    1558:	ee0584e3          	beqz	a1,1440 <__adddf3+0x80>
    155c:	7ff00813          	li	a6,2047
    1560:	03069263          	bne	a3,a6,1584 <__adddf3+0x1c4>
    1564:	00070793          	mv	a5,a4
    1568:	00060513          	mv	a0,a2
    156c:	ef9ff06f          	j	1464 <__adddf3+0xa4>
    1570:	7ff00593          	li	a1,2047
    1574:	feb888e3          	beq	a7,a1,1564 <__adddf3+0x1a4>
    1578:	008005b7          	lui	a1,0x800
    157c:	00b7e7b3          	or	a5,a5,a1
    1580:	00068593          	mv	a1,a3
    1584:	03800693          	li	a3,56
    1588:	08b6c063          	blt	a3,a1,1608 <__adddf3+0x248>
    158c:	01f00693          	li	a3,31
    1590:	04b6c263          	blt	a3,a1,15d4 <__adddf3+0x214>
    1594:	02000813          	li	a6,32
    1598:	40b80833          	sub	a6,a6,a1
    159c:	010796b3          	sll	a3,a5,a6
    15a0:	00b55333          	srl	t1,a0,a1
    15a4:	01051833          	sll	a6,a0,a6
    15a8:	0066e6b3          	or	a3,a3,t1
    15ac:	01003833          	snez	a6,a6
    15b0:	0106e6b3          	or	a3,a3,a6
    15b4:	00b7d5b3          	srl	a1,a5,a1
    15b8:	00c68633          	add	a2,a3,a2
    15bc:	00e585b3          	add	a1,a1,a4
    15c0:	00d636b3          	sltu	a3,a2,a3
    15c4:	00060513          	mv	a0,a2
    15c8:	00d587b3          	add	a5,a1,a3
    15cc:	00088493          	mv	s1,a7
    15d0:	ef5ff06f          	j	14c4 <__adddf3+0x104>
    15d4:	fe058693          	addi	a3,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    15d8:	02000313          	li	t1,32
    15dc:	00d7d6b3          	srl	a3,a5,a3
    15e0:	00000813          	li	a6,0
    15e4:	00658863          	beq	a1,t1,15f4 <__adddf3+0x234>
    15e8:	04000813          	li	a6,64
    15ec:	40b80833          	sub	a6,a6,a1
    15f0:	01079833          	sll	a6,a5,a6
    15f4:	00a86833          	or	a6,a6,a0
    15f8:	01003833          	snez	a6,a6
    15fc:	0106e6b3          	or	a3,a3,a6
    1600:	00000593          	li	a1,0
    1604:	fb5ff06f          	j	15b8 <__adddf3+0x1f8>
    1608:	00a7e6b3          	or	a3,a5,a0
    160c:	00d036b3          	snez	a3,a3
    1610:	ff1ff06f          	j	1600 <__adddf3+0x240>
    1614:	00148693          	addi	a3,s1,1
    1618:	7fe6f593          	andi	a1,a3,2046
    161c:	08059663          	bnez	a1,16a8 <__adddf3+0x2e8>
    1620:	00a7e6b3          	or	a3,a5,a0
    1624:	06049263          	bnez	s1,1688 <__adddf3+0x2c8>
    1628:	44068863          	beqz	a3,1a78 <__adddf3+0x6b8>
    162c:	00c766b3          	or	a3,a4,a2
    1630:	02068863          	beqz	a3,1660 <__adddf3+0x2a0>
    1634:	00c50633          	add	a2,a0,a2
    1638:	00a636b3          	sltu	a3,a2,a0
    163c:	00e78733          	add	a4,a5,a4
    1640:	00d707b3          	add	a5,a4,a3
    1644:	00879713          	slli	a4,a5,0x8
    1648:	00060513          	mv	a0,a2
    164c:	00075a63          	bgez	a4,1660 <__adddf3+0x2a0>
    1650:	ff800737          	lui	a4,0xff800
    1654:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    1658:	00e7f7b3          	and	a5,a5,a4
    165c:	00100493          	li	s1,1
    1660:	00757713          	andi	a4,a0,7
    1664:	44070863          	beqz	a4,1ab4 <__adddf3+0x6f4>
    1668:	00f57713          	andi	a4,a0,15
    166c:	00400693          	li	a3,4
    1670:	44d70263          	beq	a4,a3,1ab4 <__adddf3+0x6f4>
    1674:	00450713          	addi	a4,a0,4
    1678:	00a736b3          	sltu	a3,a4,a0
    167c:	00d787b3          	add	a5,a5,a3
    1680:	00070513          	mv	a0,a4
    1684:	4300006f          	j	1ab4 <__adddf3+0x6f4>
    1688:	ec068ee3          	beqz	a3,1564 <__adddf3+0x1a4>
    168c:	00c76633          	or	a2,a4,a2
    1690:	dc060ae3          	beqz	a2,1464 <__adddf3+0xa4>
    1694:	00000913          	li	s2,0
    1698:	004007b7          	lui	a5,0x400
    169c:	00000513          	li	a0,0
    16a0:	7ff00493          	li	s1,2047
    16a4:	4100006f          	j	1ab4 <__adddf3+0x6f4>
    16a8:	7ff00593          	li	a1,2047
    16ac:	3cb68c63          	beq	a3,a1,1a84 <__adddf3+0x6c4>
    16b0:	00c50633          	add	a2,a0,a2
    16b4:	00a63533          	sltu	a0,a2,a0
    16b8:	00e78733          	add	a4,a5,a4
    16bc:	00a70733          	add	a4,a4,a0
    16c0:	01f71513          	slli	a0,a4,0x1f
    16c4:	00165613          	srli	a2,a2,0x1
    16c8:	00c56533          	or	a0,a0,a2
    16cc:	00175793          	srli	a5,a4,0x1
    16d0:	00068493          	mv	s1,a3
    16d4:	f8dff06f          	j	1660 <__adddf3+0x2a0>
    16d8:	0f005c63          	blez	a6,17d0 <__adddf3+0x410>
    16dc:	08089e63          	bnez	a7,1778 <__adddf3+0x3b8>
    16e0:	00c766b3          	or	a3,a4,a2
    16e4:	3a068863          	beqz	a3,1a94 <__adddf3+0x6d4>
    16e8:	fff80693          	addi	a3,a6,-1
    16ec:	02069063          	bnez	a3,170c <__adddf3+0x34c>
    16f0:	40c50633          	sub	a2,a0,a2
    16f4:	00c536b3          	sltu	a3,a0,a2
    16f8:	40e78733          	sub	a4,a5,a4
    16fc:	00060513          	mv	a0,a2
    1700:	40d707b3          	sub	a5,a4,a3
    1704:	00100493          	li	s1,1
    1708:	0540006f          	j	175c <__adddf3+0x39c>
    170c:	7ff00593          	li	a1,2047
    1710:	d4b80ae3          	beq	a6,a1,1464 <__adddf3+0xa4>
    1714:	03800593          	li	a1,56
    1718:	0ad5c663          	blt	a1,a3,17c4 <__adddf3+0x404>
    171c:	01f00593          	li	a1,31
    1720:	06d5c863          	blt	a1,a3,1790 <__adddf3+0x3d0>
    1724:	02000813          	li	a6,32
    1728:	40d80833          	sub	a6,a6,a3
    172c:	00d658b3          	srl	a7,a2,a3
    1730:	010715b3          	sll	a1,a4,a6
    1734:	01061833          	sll	a6,a2,a6
    1738:	0115e5b3          	or	a1,a1,a7
    173c:	01003833          	snez	a6,a6
    1740:	0105e633          	or	a2,a1,a6
    1744:	00d756b3          	srl	a3,a4,a3
    1748:	40c50633          	sub	a2,a0,a2
    174c:	00c53733          	sltu	a4,a0,a2
    1750:	40d786b3          	sub	a3,a5,a3
    1754:	00060513          	mv	a0,a2
    1758:	40e687b3          	sub	a5,a3,a4
    175c:	00879713          	slli	a4,a5,0x8
    1760:	f00750e3          	bgez	a4,1660 <__adddf3+0x2a0>
    1764:	00800437          	lui	s0,0x800
    1768:	fff40413          	addi	s0,s0,-1 # 7fffff <_memory_end+0x7dffff>
    176c:	0087f433          	and	s0,a5,s0
    1770:	00050993          	mv	s3,a0
    1774:	2100006f          	j	1984 <__adddf3+0x5c4>
    1778:	7ff00693          	li	a3,2047
    177c:	eed482e3          	beq	s1,a3,1660 <__adddf3+0x2a0>
    1780:	008006b7          	lui	a3,0x800
    1784:	00d76733          	or	a4,a4,a3
    1788:	00080693          	mv	a3,a6
    178c:	f89ff06f          	j	1714 <__adddf3+0x354>
    1790:	fe068593          	addi	a1,a3,-32 # 7fffe0 <_memory_end+0x7dffe0>
    1794:	02000893          	li	a7,32
    1798:	00b755b3          	srl	a1,a4,a1
    179c:	00000813          	li	a6,0
    17a0:	01168863          	beq	a3,a7,17b0 <__adddf3+0x3f0>
    17a4:	04000813          	li	a6,64
    17a8:	40d80833          	sub	a6,a6,a3
    17ac:	01071833          	sll	a6,a4,a6
    17b0:	00c86833          	or	a6,a6,a2
    17b4:	01003833          	snez	a6,a6
    17b8:	0105e633          	or	a2,a1,a6
    17bc:	00000693          	li	a3,0
    17c0:	f89ff06f          	j	1748 <__adddf3+0x388>
    17c4:	00c76633          	or	a2,a4,a2
    17c8:	00c03633          	snez	a2,a2
    17cc:	ff1ff06f          	j	17bc <__adddf3+0x3fc>
    17d0:	0e080863          	beqz	a6,18c0 <__adddf3+0x500>
    17d4:	40988833          	sub	a6,a7,s1
    17d8:	04049263          	bnez	s1,181c <__adddf3+0x45c>
    17dc:	00a7e5b3          	or	a1,a5,a0
    17e0:	2a058e63          	beqz	a1,1a9c <__adddf3+0x6dc>
    17e4:	fff80593          	addi	a1,a6,-1
    17e8:	00059e63          	bnez	a1,1804 <__adddf3+0x444>
    17ec:	40a60533          	sub	a0,a2,a0
    17f0:	40f70733          	sub	a4,a4,a5
    17f4:	00a63633          	sltu	a2,a2,a0
    17f8:	40c707b3          	sub	a5,a4,a2
    17fc:	00068913          	mv	s2,a3
    1800:	f05ff06f          	j	1704 <__adddf3+0x344>
    1804:	7ff00313          	li	t1,2047
    1808:	02681463          	bne	a6,t1,1830 <__adddf3+0x470>
    180c:	00070793          	mv	a5,a4
    1810:	00060513          	mv	a0,a2
    1814:	7ff00493          	li	s1,2047
    1818:	0d00006f          	j	18e8 <__adddf3+0x528>
    181c:	7ff00593          	li	a1,2047
    1820:	feb886e3          	beq	a7,a1,180c <__adddf3+0x44c>
    1824:	008005b7          	lui	a1,0x800
    1828:	00b7e7b3          	or	a5,a5,a1
    182c:	00080593          	mv	a1,a6
    1830:	03800813          	li	a6,56
    1834:	08b84063          	blt	a6,a1,18b4 <__adddf3+0x4f4>
    1838:	01f00813          	li	a6,31
    183c:	04b84263          	blt	a6,a1,1880 <__adddf3+0x4c0>
    1840:	02000313          	li	t1,32
    1844:	40b30333          	sub	t1,t1,a1
    1848:	00b55e33          	srl	t3,a0,a1
    184c:	00679833          	sll	a6,a5,t1
    1850:	00651333          	sll	t1,a0,t1
    1854:	01c86833          	or	a6,a6,t3
    1858:	00603333          	snez	t1,t1
    185c:	00686533          	or	a0,a6,t1
    1860:	00b7d5b3          	srl	a1,a5,a1
    1864:	40a60533          	sub	a0,a2,a0
    1868:	40b705b3          	sub	a1,a4,a1
    186c:	00a63633          	sltu	a2,a2,a0
    1870:	40c587b3          	sub	a5,a1,a2
    1874:	00088493          	mv	s1,a7
    1878:	00068913          	mv	s2,a3
    187c:	ee1ff06f          	j	175c <__adddf3+0x39c>
    1880:	fe058813          	addi	a6,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    1884:	02000e13          	li	t3,32
    1888:	0107d833          	srl	a6,a5,a6
    188c:	00000313          	li	t1,0
    1890:	01c58863          	beq	a1,t3,18a0 <__adddf3+0x4e0>
    1894:	04000313          	li	t1,64
    1898:	40b30333          	sub	t1,t1,a1
    189c:	00679333          	sll	t1,a5,t1
    18a0:	00a36333          	or	t1,t1,a0
    18a4:	00603333          	snez	t1,t1
    18a8:	00686533          	or	a0,a6,t1
    18ac:	00000593          	li	a1,0
    18b0:	fb5ff06f          	j	1864 <__adddf3+0x4a4>
    18b4:	00a7e533          	or	a0,a5,a0
    18b8:	00a03533          	snez	a0,a0
    18bc:	ff1ff06f          	j	18ac <__adddf3+0x4ec>
    18c0:	00148593          	addi	a1,s1,1
    18c4:	7fe5f593          	andi	a1,a1,2046
    18c8:	08059663          	bnez	a1,1954 <__adddf3+0x594>
    18cc:	00a7e833          	or	a6,a5,a0
    18d0:	00c765b3          	or	a1,a4,a2
    18d4:	06049063          	bnez	s1,1934 <__adddf3+0x574>
    18d8:	00081c63          	bnez	a6,18f0 <__adddf3+0x530>
    18dc:	10058e63          	beqz	a1,19f8 <__adddf3+0x638>
    18e0:	00070793          	mv	a5,a4
    18e4:	00060513          	mv	a0,a2
    18e8:	00068913          	mv	s2,a3
    18ec:	d75ff06f          	j	1660 <__adddf3+0x2a0>
    18f0:	d60588e3          	beqz	a1,1660 <__adddf3+0x2a0>
    18f4:	40c50833          	sub	a6,a0,a2
    18f8:	010538b3          	sltu	a7,a0,a6
    18fc:	40e785b3          	sub	a1,a5,a4
    1900:	411585b3          	sub	a1,a1,a7
    1904:	00859893          	slli	a7,a1,0x8
    1908:	0008dc63          	bgez	a7,1920 <__adddf3+0x560>
    190c:	40a60533          	sub	a0,a2,a0
    1910:	40f70733          	sub	a4,a4,a5
    1914:	00a63633          	sltu	a2,a2,a0
    1918:	40c707b3          	sub	a5,a4,a2
    191c:	fcdff06f          	j	18e8 <__adddf3+0x528>
    1920:	00b86533          	or	a0,a6,a1
    1924:	18050463          	beqz	a0,1aac <__adddf3+0x6ec>
    1928:	00058793          	mv	a5,a1
    192c:	00080513          	mv	a0,a6
    1930:	d31ff06f          	j	1660 <__adddf3+0x2a0>
    1934:	00081c63          	bnez	a6,194c <__adddf3+0x58c>
    1938:	d4058ee3          	beqz	a1,1694 <__adddf3+0x2d4>
    193c:	00070793          	mv	a5,a4
    1940:	00060513          	mv	a0,a2
    1944:	00068913          	mv	s2,a3
    1948:	b1dff06f          	j	1464 <__adddf3+0xa4>
    194c:	b0058ce3          	beqz	a1,1464 <__adddf3+0xa4>
    1950:	d45ff06f          	j	1694 <__adddf3+0x2d4>
    1954:	40c505b3          	sub	a1,a0,a2
    1958:	00b53833          	sltu	a6,a0,a1
    195c:	40e78433          	sub	s0,a5,a4
    1960:	41040433          	sub	s0,s0,a6
    1964:	00841813          	slli	a6,s0,0x8
    1968:	00058993          	mv	s3,a1
    196c:	08085063          	bgez	a6,19ec <__adddf3+0x62c>
    1970:	40a609b3          	sub	s3,a2,a0
    1974:	40f70433          	sub	s0,a4,a5
    1978:	01363633          	sltu	a2,a2,s3
    197c:	40c40433          	sub	s0,s0,a2
    1980:	00068913          	mv	s2,a3
    1984:	06040e63          	beqz	s0,1a00 <__adddf3+0x640>
    1988:	00040513          	mv	a0,s0
    198c:	619000ef          	jal	27a4 <__clzsi2>
    1990:	ff850693          	addi	a3,a0,-8
    1994:	02000793          	li	a5,32
    1998:	40d787b3          	sub	a5,a5,a3
    199c:	00d41433          	sll	s0,s0,a3
    19a0:	00f9d7b3          	srl	a5,s3,a5
    19a4:	0087e7b3          	or	a5,a5,s0
    19a8:	00d99433          	sll	s0,s3,a3
    19ac:	0a96c463          	blt	a3,s1,1a54 <__adddf3+0x694>
    19b0:	409686b3          	sub	a3,a3,s1
    19b4:	00168613          	addi	a2,a3,1
    19b8:	01f00713          	li	a4,31
    19bc:	06c74263          	blt	a4,a2,1a20 <__adddf3+0x660>
    19c0:	02000713          	li	a4,32
    19c4:	40c70733          	sub	a4,a4,a2
    19c8:	00e79533          	sll	a0,a5,a4
    19cc:	00c456b3          	srl	a3,s0,a2
    19d0:	00e41733          	sll	a4,s0,a4
    19d4:	00d56533          	or	a0,a0,a3
    19d8:	00e03733          	snez	a4,a4
    19dc:	00e56533          	or	a0,a0,a4
    19e0:	00c7d7b3          	srl	a5,a5,a2
    19e4:	00000493          	li	s1,0
    19e8:	c79ff06f          	j	1660 <__adddf3+0x2a0>
    19ec:	0085e5b3          	or	a1,a1,s0
    19f0:	f8059ae3          	bnez	a1,1984 <__adddf3+0x5c4>
    19f4:	00000493          	li	s1,0
    19f8:	00000913          	li	s2,0
    19fc:	08c0006f          	j	1a88 <__adddf3+0x6c8>
    1a00:	00098513          	mv	a0,s3
    1a04:	5a1000ef          	jal	27a4 <__clzsi2>
    1a08:	01850693          	addi	a3,a0,24
    1a0c:	01f00793          	li	a5,31
    1a10:	f8d7d2e3          	bge	a5,a3,1994 <__adddf3+0x5d4>
    1a14:	ff850793          	addi	a5,a0,-8
    1a18:	00f997b3          	sll	a5,s3,a5
    1a1c:	f91ff06f          	j	19ac <__adddf3+0x5ec>
    1a20:	fe168693          	addi	a3,a3,-31
    1a24:	00d7d533          	srl	a0,a5,a3
    1a28:	02000693          	li	a3,32
    1a2c:	00000713          	li	a4,0
    1a30:	00d60863          	beq	a2,a3,1a40 <__adddf3+0x680>
    1a34:	04000713          	li	a4,64
    1a38:	40c70733          	sub	a4,a4,a2
    1a3c:	00e79733          	sll	a4,a5,a4
    1a40:	00e46733          	or	a4,s0,a4
    1a44:	00e03733          	snez	a4,a4
    1a48:	00e56533          	or	a0,a0,a4
    1a4c:	00000793          	li	a5,0
    1a50:	f95ff06f          	j	19e4 <__adddf3+0x624>
    1a54:	ff800737          	lui	a4,0xff800
    1a58:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    1a5c:	40d484b3          	sub	s1,s1,a3
    1a60:	00e7f7b3          	and	a5,a5,a4
    1a64:	00040513          	mv	a0,s0
    1a68:	bf9ff06f          	j	1660 <__adddf3+0x2a0>
    1a6c:	00070793          	mv	a5,a4
    1a70:	00060513          	mv	a0,a2
    1a74:	c5dff06f          	j	16d0 <__adddf3+0x310>
    1a78:	00070793          	mv	a5,a4
    1a7c:	00060513          	mv	a0,a2
    1a80:	be1ff06f          	j	1660 <__adddf3+0x2a0>
    1a84:	7ff00493          	li	s1,2047
    1a88:	00000793          	li	a5,0
    1a8c:	00000513          	li	a0,0
    1a90:	0240006f          	j	1ab4 <__adddf3+0x6f4>
    1a94:	00080493          	mv	s1,a6
    1a98:	bc9ff06f          	j	1660 <__adddf3+0x2a0>
    1a9c:	00070793          	mv	a5,a4
    1aa0:	00060513          	mv	a0,a2
    1aa4:	00080493          	mv	s1,a6
    1aa8:	e41ff06f          	j	18e8 <__adddf3+0x528>
    1aac:	00000793          	li	a5,0
    1ab0:	00000913          	li	s2,0
    1ab4:	00879713          	slli	a4,a5,0x8
    1ab8:	00075e63          	bgez	a4,1ad4 <__adddf3+0x714>
    1abc:	00148493          	addi	s1,s1,1
    1ac0:	7ff00713          	li	a4,2047
    1ac4:	08e48263          	beq	s1,a4,1b48 <__adddf3+0x788>
    1ac8:	ff800737          	lui	a4,0xff800
    1acc:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    1ad0:	00e7f7b3          	and	a5,a5,a4
    1ad4:	01d79693          	slli	a3,a5,0x1d
    1ad8:	00355513          	srli	a0,a0,0x3
    1adc:	7ff00713          	li	a4,2047
    1ae0:	00a6e6b3          	or	a3,a3,a0
    1ae4:	0037d793          	srli	a5,a5,0x3
    1ae8:	00e49e63          	bne	s1,a4,1b04 <__adddf3+0x744>
    1aec:	00f6e6b3          	or	a3,a3,a5
    1af0:	00000793          	li	a5,0
    1af4:	00068863          	beqz	a3,1b04 <__adddf3+0x744>
    1af8:	000807b7          	lui	a5,0x80
    1afc:	00000693          	li	a3,0
    1b00:	00000913          	li	s2,0
    1b04:	01449713          	slli	a4,s1,0x14
    1b08:	7ff00637          	lui	a2,0x7ff00
    1b0c:	00c79793          	slli	a5,a5,0xc
    1b10:	00c77733          	and	a4,a4,a2
    1b14:	01c12083          	lw	ra,28(sp)
    1b18:	01812403          	lw	s0,24(sp)
    1b1c:	00c7d793          	srli	a5,a5,0xc
    1b20:	00f767b3          	or	a5,a4,a5
    1b24:	01f91713          	slli	a4,s2,0x1f
    1b28:	00e7e633          	or	a2,a5,a4
    1b2c:	01412483          	lw	s1,20(sp)
    1b30:	01012903          	lw	s2,16(sp)
    1b34:	00c12983          	lw	s3,12(sp)
    1b38:	00068513          	mv	a0,a3
    1b3c:	00060593          	mv	a1,a2
    1b40:	02010113          	addi	sp,sp,32
    1b44:	00008067          	ret
    1b48:	00000793          	li	a5,0
    1b4c:	00000513          	li	a0,0
    1b50:	f85ff06f          	j	1ad4 <__adddf3+0x714>

00001b54 <__fixdfsi>:
    1b54:	0145d713          	srli	a4,a1,0x14
    1b58:	001006b7          	lui	a3,0x100
    1b5c:	fff68793          	addi	a5,a3,-1 # fffff <_memory_end+0xdffff>
    1b60:	7ff77713          	andi	a4,a4,2047
    1b64:	3fe00613          	li	a2,1022
    1b68:	00b7f7b3          	and	a5,a5,a1
    1b6c:	01f5d593          	srli	a1,a1,0x1f
    1b70:	04e65e63          	bge	a2,a4,1bcc <__fixdfsi+0x78>
    1b74:	41d00613          	li	a2,1053
    1b78:	00e65a63          	bge	a2,a4,1b8c <__fixdfsi+0x38>
    1b7c:	80000537          	lui	a0,0x80000
    1b80:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
    1b84:	00a58533          	add	a0,a1,a0
    1b88:	00008067          	ret
    1b8c:	00d7e7b3          	or	a5,a5,a3
    1b90:	43300693          	li	a3,1075
    1b94:	40e686b3          	sub	a3,a3,a4
    1b98:	01f00613          	li	a2,31
    1b9c:	02d64063          	blt	a2,a3,1bbc <__fixdfsi+0x68>
    1ba0:	bed70713          	addi	a4,a4,-1043
    1ba4:	00e797b3          	sll	a5,a5,a4
    1ba8:	00d55533          	srl	a0,a0,a3
    1bac:	00a7e533          	or	a0,a5,a0
    1bb0:	02058063          	beqz	a1,1bd0 <__fixdfsi+0x7c>
    1bb4:	40a00533          	neg	a0,a0
    1bb8:	00008067          	ret
    1bbc:	41300693          	li	a3,1043
    1bc0:	40e68733          	sub	a4,a3,a4
    1bc4:	00e7d533          	srl	a0,a5,a4
    1bc8:	fe9ff06f          	j	1bb0 <__fixdfsi+0x5c>
    1bcc:	00000513          	li	a0,0
    1bd0:	00008067          	ret

00001bd4 <__floatunsidf>:
    1bd4:	ff010113          	addi	sp,sp,-16
    1bd8:	00812423          	sw	s0,8(sp)
    1bdc:	00112623          	sw	ra,12(sp)
    1be0:	00050413          	mv	s0,a0
    1be4:	06050263          	beqz	a0,1c48 <__floatunsidf+0x74>
    1be8:	3bd000ef          	jal	27a4 <__clzsi2>
    1bec:	41e00713          	li	a4,1054
    1bf0:	00a00793          	li	a5,10
    1bf4:	40a70733          	sub	a4,a4,a0
    1bf8:	04a7c063          	blt	a5,a0,1c38 <__floatunsidf+0x64>
    1bfc:	00b00793          	li	a5,11
    1c00:	40a787b3          	sub	a5,a5,a0
    1c04:	01550513          	addi	a0,a0,21
    1c08:	00f457b3          	srl	a5,s0,a5
    1c0c:	00a41433          	sll	s0,s0,a0
    1c10:	00c12083          	lw	ra,12(sp)
    1c14:	00040513          	mv	a0,s0
    1c18:	00c79793          	slli	a5,a5,0xc
    1c1c:	00812403          	lw	s0,8(sp)
    1c20:	01471713          	slli	a4,a4,0x14
    1c24:	00c7d793          	srli	a5,a5,0xc
    1c28:	00f766b3          	or	a3,a4,a5
    1c2c:	00068593          	mv	a1,a3
    1c30:	01010113          	addi	sp,sp,16
    1c34:	00008067          	ret
    1c38:	ff550513          	addi	a0,a0,-11
    1c3c:	00a417b3          	sll	a5,s0,a0
    1c40:	00000413          	li	s0,0
    1c44:	fcdff06f          	j	1c10 <__floatunsidf+0x3c>
    1c48:	00000793          	li	a5,0
    1c4c:	00000713          	li	a4,0
    1c50:	fc1ff06f          	j	1c10 <__floatunsidf+0x3c>

00001c54 <__eqsf2>:
    1c54:	01755693          	srli	a3,a0,0x17
    1c58:	008007b7          	lui	a5,0x800
    1c5c:	fff78793          	addi	a5,a5,-1 # 7fffff <_memory_end+0x7dffff>
    1c60:	0175d613          	srli	a2,a1,0x17
    1c64:	0ff6f693          	zext.b	a3,a3
    1c68:	0ff00893          	li	a7,255
    1c6c:	00a7f833          	and	a6,a5,a0
    1c70:	01f55713          	srli	a4,a0,0x1f
    1c74:	00b7f7b3          	and	a5,a5,a1
    1c78:	0ff67613          	zext.b	a2,a2
    1c7c:	01f5d593          	srli	a1,a1,0x1f
    1c80:	00100513          	li	a0,1
    1c84:	01169a63          	bne	a3,a7,1c98 <__eqsf2+0x44>
    1c88:	00081663          	bnez	a6,1c94 <__eqsf2+0x40>
    1c8c:	00d61463          	bne	a2,a3,1c94 <__eqsf2+0x40>
    1c90:	00078a63          	beqz	a5,1ca4 <__eqsf2+0x50>
    1c94:	00008067          	ret
    1c98:	ff160ee3          	beq	a2,a7,1c94 <__eqsf2+0x40>
    1c9c:	fec69ce3          	bne	a3,a2,1c94 <__eqsf2+0x40>
    1ca0:	fef81ae3          	bne	a6,a5,1c94 <__eqsf2+0x40>
    1ca4:	00000513          	li	a0,0
    1ca8:	feb706e3          	beq	a4,a1,1c94 <__eqsf2+0x40>
    1cac:	00100513          	li	a0,1
    1cb0:	fe0692e3          	bnez	a3,1c94 <__eqsf2+0x40>
    1cb4:	01003533          	snez	a0,a6
    1cb8:	00008067          	ret

00001cbc <__lesf2>:
    1cbc:	008007b7          	lui	a5,0x800
    1cc0:	fff78793          	addi	a5,a5,-1 # 7fffff <_memory_end+0x7dffff>
    1cc4:	01755693          	srli	a3,a0,0x17
    1cc8:	00a7f633          	and	a2,a5,a0
    1ccc:	01f55713          	srli	a4,a0,0x1f
    1cd0:	0ff6f693          	zext.b	a3,a3
    1cd4:	0175d513          	srli	a0,a1,0x17
    1cd8:	0ff00813          	li	a6,255
    1cdc:	00b7f7b3          	and	a5,a5,a1
    1ce0:	0ff57513          	zext.b	a0,a0
    1ce4:	01f5d593          	srli	a1,a1,0x1f
    1ce8:	01069463          	bne	a3,a6,1cf0 <__lesf2+0x34>
    1cec:	04061263          	bnez	a2,1d30 <__lesf2+0x74>
    1cf0:	0ff00813          	li	a6,255
    1cf4:	01051463          	bne	a0,a6,1cfc <__lesf2+0x40>
    1cf8:	02079c63          	bnez	a5,1d30 <__lesf2+0x74>
    1cfc:	04069a63          	bnez	a3,1d50 <__lesf2+0x94>
    1d00:	02051c63          	bnez	a0,1d38 <__lesf2+0x7c>
    1d04:	04061863          	bnez	a2,1d54 <__lesf2+0x98>
    1d08:	04078263          	beqz	a5,1d4c <__lesf2+0x90>
    1d0c:	00100513          	li	a0,1
    1d10:	02059e63          	bnez	a1,1d4c <__lesf2+0x90>
    1d14:	fff00513          	li	a0,-1
    1d18:	00008067          	ret
    1d1c:	fea6c8e3          	blt	a3,a0,1d0c <__lesf2+0x50>
    1d20:	02c7e263          	bltu	a5,a2,1d44 <__lesf2+0x88>
    1d24:	00000513          	li	a0,0
    1d28:	02f67263          	bgeu	a2,a5,1d4c <__lesf2+0x90>
    1d2c:	fe1ff06f          	j	1d0c <__lesf2+0x50>
    1d30:	00200513          	li	a0,2
    1d34:	00008067          	ret
    1d38:	fc060ae3          	beqz	a2,1d0c <__lesf2+0x50>
    1d3c:	00e59e63          	bne	a1,a4,1d58 <__lesf2+0x9c>
    1d40:	fcd55ee3          	bge	a0,a3,1d1c <__lesf2+0x60>
    1d44:	fff00513          	li	a0,-1
    1d48:	00058c63          	beqz	a1,1d60 <__lesf2+0xa4>
    1d4c:	00008067          	ret
    1d50:	fe0516e3          	bnez	a0,1d3c <__lesf2+0x80>
    1d54:	fe0794e3          	bnez	a5,1d3c <__lesf2+0x80>
    1d58:	fff00513          	li	a0,-1
    1d5c:	fe0718e3          	bnez	a4,1d4c <__lesf2+0x90>
    1d60:	00100513          	li	a0,1
    1d64:	00008067          	ret

00001d68 <__mulsf3>:
    1d68:	fe010113          	addi	sp,sp,-32
    1d6c:	01212823          	sw	s2,16(sp)
    1d70:	01755913          	srli	s2,a0,0x17
    1d74:	00912a23          	sw	s1,20(sp)
    1d78:	01312623          	sw	s3,12(sp)
    1d7c:	01512223          	sw	s5,4(sp)
    1d80:	00951493          	slli	s1,a0,0x9
    1d84:	00112e23          	sw	ra,28(sp)
    1d88:	00812c23          	sw	s0,24(sp)
    1d8c:	01412423          	sw	s4,8(sp)
    1d90:	0ff97913          	zext.b	s2,s2
    1d94:	00058a93          	mv	s5,a1
    1d98:	0094d493          	srli	s1,s1,0x9
    1d9c:	01f55993          	srli	s3,a0,0x1f
    1da0:	10090863          	beqz	s2,1eb0 <__mulsf3+0x148>
    1da4:	0ff00793          	li	a5,255
    1da8:	12f90463          	beq	s2,a5,1ed0 <__mulsf3+0x168>
    1dac:	00349493          	slli	s1,s1,0x3
    1db0:	040007b7          	lui	a5,0x4000
    1db4:	00f4e4b3          	or	s1,s1,a5
    1db8:	f8190913          	addi	s2,s2,-127
    1dbc:	00000a13          	li	s4,0
    1dc0:	017ad793          	srli	a5,s5,0x17
    1dc4:	009a9413          	slli	s0,s5,0x9
    1dc8:	0ff7f793          	zext.b	a5,a5
    1dcc:	00945413          	srli	s0,s0,0x9
    1dd0:	01fada93          	srli	s5,s5,0x1f
    1dd4:	10078e63          	beqz	a5,1ef0 <__mulsf3+0x188>
    1dd8:	0ff00713          	li	a4,255
    1ddc:	12e78a63          	beq	a5,a4,1f10 <__mulsf3+0x1a8>
    1de0:	00341413          	slli	s0,s0,0x3
    1de4:	04000737          	lui	a4,0x4000
    1de8:	00e46433          	or	s0,s0,a4
    1dec:	f8178793          	addi	a5,a5,-127 # 3ffff81 <_memory_end+0x3fdff81>
    1df0:	00000713          	li	a4,0
    1df4:	00f90933          	add	s2,s2,a5
    1df8:	002a1793          	slli	a5,s4,0x2
    1dfc:	00e7e7b3          	or	a5,a5,a4
    1e00:	00a00613          	li	a2,10
    1e04:	00190693          	addi	a3,s2,1
    1e08:	1ef64263          	blt	a2,a5,1fec <__mulsf3+0x284>
    1e0c:	00200613          	li	a2,2
    1e10:	0159c9b3          	xor	s3,s3,s5
    1e14:	10f64e63          	blt	a2,a5,1f30 <__mulsf3+0x1c8>
    1e18:	fff78793          	addi	a5,a5,-1
    1e1c:	00100613          	li	a2,1
    1e20:	12f67a63          	bgeu	a2,a5,1f54 <__mulsf3+0x1ec>
    1e24:	00010837          	lui	a6,0x10
    1e28:	fff80513          	addi	a0,a6,-1 # ffff <_bss_end+0xd5fb>
    1e2c:	0104d613          	srli	a2,s1,0x10
    1e30:	01045793          	srli	a5,s0,0x10
    1e34:	00a4f4b3          	and	s1,s1,a0
    1e38:	00a47433          	and	s0,s0,a0
    1e3c:	029405b3          	mul	a1,s0,s1
    1e40:	02860433          	mul	s0,a2,s0
    1e44:	02f60633          	mul	a2,a2,a5
    1e48:	029787b3          	mul	a5,a5,s1
    1e4c:	00878733          	add	a4,a5,s0
    1e50:	0105d793          	srli	a5,a1,0x10
    1e54:	00e787b3          	add	a5,a5,a4
    1e58:	0087f463          	bgeu	a5,s0,1e60 <__mulsf3+0xf8>
    1e5c:	01060633          	add	a2,a2,a6
    1e60:	00a7f733          	and	a4,a5,a0
    1e64:	01071713          	slli	a4,a4,0x10
    1e68:	00a5f5b3          	and	a1,a1,a0
    1e6c:	00b70733          	add	a4,a4,a1
    1e70:	0107d793          	srli	a5,a5,0x10
    1e74:	00671413          	slli	s0,a4,0x6
    1e78:	00c787b3          	add	a5,a5,a2
    1e7c:	01a75713          	srli	a4,a4,0x1a
    1e80:	00679793          	slli	a5,a5,0x6
    1e84:	00803433          	snez	s0,s0
    1e88:	00e46433          	or	s0,s0,a4
    1e8c:	00479713          	slli	a4,a5,0x4
    1e90:	0087e433          	or	s0,a5,s0
    1e94:	00075a63          	bgez	a4,1ea8 <__mulsf3+0x140>
    1e98:	00145793          	srli	a5,s0,0x1
    1e9c:	00147413          	andi	s0,s0,1
    1ea0:	0087e433          	or	s0,a5,s0
    1ea4:	00068913          	mv	s2,a3
    1ea8:	00090693          	mv	a3,s2
    1eac:	0c00006f          	j	1f6c <__mulsf3+0x204>
    1eb0:	02048a63          	beqz	s1,1ee4 <__mulsf3+0x17c>
    1eb4:	00048513          	mv	a0,s1
    1eb8:	0ed000ef          	jal	27a4 <__clzsi2>
    1ebc:	ffb50793          	addi	a5,a0,-5
    1ec0:	f8a00913          	li	s2,-118
    1ec4:	00f494b3          	sll	s1,s1,a5
    1ec8:	40a90933          	sub	s2,s2,a0
    1ecc:	ef1ff06f          	j	1dbc <__mulsf3+0x54>
    1ed0:	0ff00913          	li	s2,255
    1ed4:	00200a13          	li	s4,2
    1ed8:	ee0484e3          	beqz	s1,1dc0 <__mulsf3+0x58>
    1edc:	00300a13          	li	s4,3
    1ee0:	ee1ff06f          	j	1dc0 <__mulsf3+0x58>
    1ee4:	00000913          	li	s2,0
    1ee8:	00100a13          	li	s4,1
    1eec:	ed5ff06f          	j	1dc0 <__mulsf3+0x58>
    1ef0:	02040a63          	beqz	s0,1f24 <__mulsf3+0x1bc>
    1ef4:	00040513          	mv	a0,s0
    1ef8:	0ad000ef          	jal	27a4 <__clzsi2>
    1efc:	ffb50793          	addi	a5,a0,-5
    1f00:	00f41433          	sll	s0,s0,a5
    1f04:	f8a00793          	li	a5,-118
    1f08:	40a787b3          	sub	a5,a5,a0
    1f0c:	ee5ff06f          	j	1df0 <__mulsf3+0x88>
    1f10:	0ff00793          	li	a5,255
    1f14:	00200713          	li	a4,2
    1f18:	ec040ee3          	beqz	s0,1df4 <__mulsf3+0x8c>
    1f1c:	00300713          	li	a4,3
    1f20:	ed5ff06f          	j	1df4 <__mulsf3+0x8c>
    1f24:	00000793          	li	a5,0
    1f28:	00100713          	li	a4,1
    1f2c:	ec9ff06f          	j	1df4 <__mulsf3+0x8c>
    1f30:	00100613          	li	a2,1
    1f34:	00f617b3          	sll	a5,a2,a5
    1f38:	5307f613          	andi	a2,a5,1328
    1f3c:	0c061063          	bnez	a2,1ffc <__mulsf3+0x294>
    1f40:	2407f613          	andi	a2,a5,576
    1f44:	12061263          	bnez	a2,2068 <__mulsf3+0x300>
    1f48:	0887f793          	andi	a5,a5,136
    1f4c:	ec078ce3          	beqz	a5,1e24 <__mulsf3+0xbc>
    1f50:	000a8993          	mv	s3,s5
    1f54:	00200793          	li	a5,2
    1f58:	10f70263          	beq	a4,a5,205c <__mulsf3+0x2f4>
    1f5c:	00300793          	li	a5,3
    1f60:	10f70463          	beq	a4,a5,2068 <__mulsf3+0x300>
    1f64:	00100793          	li	a5,1
    1f68:	10f70863          	beq	a4,a5,2078 <__mulsf3+0x310>
    1f6c:	07f68713          	addi	a4,a3,127
    1f70:	08e05c63          	blez	a4,2008 <__mulsf3+0x2a0>
    1f74:	00747793          	andi	a5,s0,7
    1f78:	00078a63          	beqz	a5,1f8c <__mulsf3+0x224>
    1f7c:	00f47793          	andi	a5,s0,15
    1f80:	00400613          	li	a2,4
    1f84:	00c78463          	beq	a5,a2,1f8c <__mulsf3+0x224>
    1f88:	00440413          	addi	s0,s0,4
    1f8c:	00441793          	slli	a5,s0,0x4
    1f90:	0007da63          	bgez	a5,1fa4 <__mulsf3+0x23c>
    1f94:	f80007b7          	lui	a5,0xf8000
    1f98:	fff78793          	addi	a5,a5,-1 # f7ffffff <_memory_end+0xf7fdffff>
    1f9c:	00f47433          	and	s0,s0,a5
    1fa0:	08068713          	addi	a4,a3,128
    1fa4:	0fe00793          	li	a5,254
    1fa8:	0ae7ca63          	blt	a5,a4,205c <__mulsf3+0x2f4>
    1fac:	00345793          	srli	a5,s0,0x3
    1fb0:	01c12083          	lw	ra,28(sp)
    1fb4:	01812403          	lw	s0,24(sp)
    1fb8:	00979793          	slli	a5,a5,0x9
    1fbc:	01771513          	slli	a0,a4,0x17
    1fc0:	0097d793          	srli	a5,a5,0x9
    1fc4:	01f99993          	slli	s3,s3,0x1f
    1fc8:	00f56533          	or	a0,a0,a5
    1fcc:	01412483          	lw	s1,20(sp)
    1fd0:	01012903          	lw	s2,16(sp)
    1fd4:	00812a03          	lw	s4,8(sp)
    1fd8:	00412a83          	lw	s5,4(sp)
    1fdc:	01356533          	or	a0,a0,s3
    1fe0:	00c12983          	lw	s3,12(sp)
    1fe4:	02010113          	addi	sp,sp,32
    1fe8:	00008067          	ret
    1fec:	00f00613          	li	a2,15
    1ff0:	06c78c63          	beq	a5,a2,2068 <__mulsf3+0x300>
    1ff4:	00b00613          	li	a2,11
    1ff8:	f4c78ce3          	beq	a5,a2,1f50 <__mulsf3+0x1e8>
    1ffc:	00048413          	mv	s0,s1
    2000:	000a0713          	mv	a4,s4
    2004:	f51ff06f          	j	1f54 <__mulsf3+0x1ec>
    2008:	00100793          	li	a5,1
    200c:	40e787b3          	sub	a5,a5,a4
    2010:	01b00713          	li	a4,27
    2014:	06f74263          	blt	a4,a5,2078 <__mulsf3+0x310>
    2018:	09e68693          	addi	a3,a3,158
    201c:	00d416b3          	sll	a3,s0,a3
    2020:	00f457b3          	srl	a5,s0,a5
    2024:	00d036b3          	snez	a3,a3
    2028:	00d7e7b3          	or	a5,a5,a3
    202c:	0077f713          	andi	a4,a5,7
    2030:	00070a63          	beqz	a4,2044 <__mulsf3+0x2dc>
    2034:	00f7f713          	andi	a4,a5,15
    2038:	00400693          	li	a3,4
    203c:	00d70463          	beq	a4,a3,2044 <__mulsf3+0x2dc>
    2040:	00478793          	addi	a5,a5,4
    2044:	00579713          	slli	a4,a5,0x5
    2048:	0037d793          	srli	a5,a5,0x3
    204c:	02075863          	bgez	a4,207c <__mulsf3+0x314>
    2050:	00000793          	li	a5,0
    2054:	00100713          	li	a4,1
    2058:	f59ff06f          	j	1fb0 <__mulsf3+0x248>
    205c:	00000793          	li	a5,0
    2060:	0ff00713          	li	a4,255
    2064:	f4dff06f          	j	1fb0 <__mulsf3+0x248>
    2068:	004007b7          	lui	a5,0x400
    206c:	0ff00713          	li	a4,255
    2070:	00000993          	li	s3,0
    2074:	f3dff06f          	j	1fb0 <__mulsf3+0x248>
    2078:	00000793          	li	a5,0
    207c:	00000713          	li	a4,0
    2080:	f31ff06f          	j	1fb0 <__mulsf3+0x248>

00002084 <__subsf3>:
    2084:	008006b7          	lui	a3,0x800
    2088:	fff68693          	addi	a3,a3,-1 # 7fffff <_memory_end+0x7dffff>
    208c:	ff010113          	addi	sp,sp,-16
    2090:	00a6f633          	and	a2,a3,a0
    2094:	01755713          	srli	a4,a0,0x17
    2098:	00812423          	sw	s0,8(sp)
    209c:	01f55413          	srli	s0,a0,0x1f
    20a0:	00361513          	slli	a0,a2,0x3
    20a4:	0175d613          	srli	a2,a1,0x17
    20a8:	00b6f6b3          	and	a3,a3,a1
    20ac:	01212023          	sw	s2,0(sp)
    20b0:	00112623          	sw	ra,12(sp)
    20b4:	0ff77913          	zext.b	s2,a4
    20b8:	00912223          	sw	s1,4(sp)
    20bc:	0ff67613          	zext.b	a2,a2
    20c0:	0ff00713          	li	a4,255
    20c4:	01f5d593          	srli	a1,a1,0x1f
    20c8:	00369793          	slli	a5,a3,0x3
    20cc:	00e61463          	bne	a2,a4,20d4 <__subsf3+0x50>
    20d0:	00079463          	bnez	a5,20d8 <__subsf3+0x54>
    20d4:	0015c593          	xori	a1,a1,1
    20d8:	40c906b3          	sub	a3,s2,a2
    20dc:	18859063          	bne	a1,s0,225c <__subsf3+0x1d8>
    20e0:	08d05c63          	blez	a3,2178 <__subsf3+0xf4>
    20e4:	02061663          	bnez	a2,2110 <__subsf3+0x8c>
    20e8:	02078063          	beqz	a5,2108 <__subsf3+0x84>
    20ec:	fff90693          	addi	a3,s2,-1
    20f0:	00069863          	bnez	a3,2100 <__subsf3+0x7c>
    20f4:	00a787b3          	add	a5,a5,a0
    20f8:	00100913          	li	s2,1
    20fc:	04c0006f          	j	2148 <__subsf3+0xc4>
    2100:	0ff00713          	li	a4,255
    2104:	00e91e63          	bne	s2,a4,2120 <__subsf3+0x9c>
    2108:	00050793          	mv	a5,a0
    210c:	10c0006f          	j	2218 <__subsf3+0x194>
    2110:	0ff00713          	li	a4,255
    2114:	fee90ae3          	beq	s2,a4,2108 <__subsf3+0x84>
    2118:	04000737          	lui	a4,0x4000
    211c:	00e7e7b3          	or	a5,a5,a4
    2120:	01b00613          	li	a2,27
    2124:	00100713          	li	a4,1
    2128:	00d64e63          	blt	a2,a3,2144 <__subsf3+0xc0>
    212c:	02000613          	li	a2,32
    2130:	00d7d733          	srl	a4,a5,a3
    2134:	40d606b3          	sub	a3,a2,a3
    2138:	00d796b3          	sll	a3,a5,a3
    213c:	00d036b3          	snez	a3,a3
    2140:	00d76733          	or	a4,a4,a3
    2144:	00a707b3          	add	a5,a4,a0
    2148:	00579713          	slli	a4,a5,0x5
    214c:	0c075663          	bgez	a4,2218 <__subsf3+0x194>
    2150:	00190913          	addi	s2,s2,1
    2154:	0ff00713          	li	a4,255
    2158:	2ce90a63          	beq	s2,a4,242c <__subsf3+0x3a8>
    215c:	7e000737          	lui	a4,0x7e000
    2160:	0017f693          	andi	a3,a5,1
    2164:	fff70713          	addi	a4,a4,-1 # 7dffffff <_memory_end+0x7dfdffff>
    2168:	0017d793          	srli	a5,a5,0x1
    216c:	00e7f7b3          	and	a5,a5,a4
    2170:	00d7e7b3          	or	a5,a5,a3
    2174:	0a40006f          	j	2218 <__subsf3+0x194>
    2178:	06068663          	beqz	a3,21e4 <__subsf3+0x160>
    217c:	41260733          	sub	a4,a2,s2
    2180:	02091063          	bnez	s2,21a0 <__subsf3+0x11c>
    2184:	0c050863          	beqz	a0,2254 <__subsf3+0x1d0>
    2188:	fff70693          	addi	a3,a4,-1
    218c:	f60684e3          	beqz	a3,20f4 <__subsf3+0x70>
    2190:	0ff00593          	li	a1,255
    2194:	02b71063          	bne	a4,a1,21b4 <__subsf3+0x130>
    2198:	0ff00913          	li	s2,255
    219c:	07c0006f          	j	2218 <__subsf3+0x194>
    21a0:	0ff00693          	li	a3,255
    21a4:	fed60ae3          	beq	a2,a3,2198 <__subsf3+0x114>
    21a8:	040006b7          	lui	a3,0x4000
    21ac:	00d56533          	or	a0,a0,a3
    21b0:	00070693          	mv	a3,a4
    21b4:	01b00593          	li	a1,27
    21b8:	00100713          	li	a4,1
    21bc:	00d5ce63          	blt	a1,a3,21d8 <__subsf3+0x154>
    21c0:	02000713          	li	a4,32
    21c4:	40d70733          	sub	a4,a4,a3
    21c8:	00e51733          	sll	a4,a0,a4
    21cc:	00d555b3          	srl	a1,a0,a3
    21d0:	00e03733          	snez	a4,a4
    21d4:	00e5e733          	or	a4,a1,a4
    21d8:	00e787b3          	add	a5,a5,a4
    21dc:	00060913          	mv	s2,a2
    21e0:	f69ff06f          	j	2148 <__subsf3+0xc4>
    21e4:	00190713          	addi	a4,s2,1
    21e8:	0fe77693          	andi	a3,a4,254
    21ec:	04069c63          	bnez	a3,2244 <__subsf3+0x1c0>
    21f0:	04091263          	bnez	s2,2234 <__subsf3+0x1b0>
    21f4:	02050263          	beqz	a0,2218 <__subsf3+0x194>
    21f8:	f00788e3          	beqz	a5,2108 <__subsf3+0x84>
    21fc:	00a787b3          	add	a5,a5,a0
    2200:	00579713          	slli	a4,a5,0x5
    2204:	00075a63          	bgez	a4,2218 <__subsf3+0x194>
    2208:	fc000737          	lui	a4,0xfc000
    220c:	fff70713          	addi	a4,a4,-1 # fbffffff <_memory_end+0xfbfdffff>
    2210:	00e7f7b3          	and	a5,a5,a4
    2214:	00100913          	li	s2,1
    2218:	0077f713          	andi	a4,a5,7
    221c:	20070a63          	beqz	a4,2430 <__subsf3+0x3ac>
    2220:	00f7f713          	andi	a4,a5,15
    2224:	00400693          	li	a3,4
    2228:	20d70463          	beq	a4,a3,2430 <__subsf3+0x3ac>
    222c:	00478793          	addi	a5,a5,4 # 400004 <_memory_end+0x3e0004>
    2230:	2000006f          	j	2430 <__subsf3+0x3ac>
    2234:	f60502e3          	beqz	a0,2198 <__subsf3+0x114>
    2238:	16079663          	bnez	a5,23a4 <__subsf3+0x320>
    223c:	00050793          	mv	a5,a0
    2240:	f59ff06f          	j	2198 <__subsf3+0x114>
    2244:	0ff00693          	li	a3,255
    2248:	1ed70063          	beq	a4,a3,2428 <__subsf3+0x3a4>
    224c:	00f507b3          	add	a5,a0,a5
    2250:	0017d793          	srli	a5,a5,0x1
    2254:	00070913          	mv	s2,a4
    2258:	fc1ff06f          	j	2218 <__subsf3+0x194>
    225c:	06d05e63          	blez	a3,22d8 <__subsf3+0x254>
    2260:	06061263          	bnez	a2,22c4 <__subsf3+0x240>
    2264:	ea0782e3          	beqz	a5,2108 <__subsf3+0x84>
    2268:	fff90693          	addi	a3,s2,-1
    226c:	00069863          	bnez	a3,227c <__subsf3+0x1f8>
    2270:	40f507b3          	sub	a5,a0,a5
    2274:	00100913          	li	s2,1
    2278:	0340006f          	j	22ac <__subsf3+0x228>
    227c:	0ff00713          	li	a4,255
    2280:	e8e904e3          	beq	s2,a4,2108 <__subsf3+0x84>
    2284:	01b00613          	li	a2,27
    2288:	00100713          	li	a4,1
    228c:	00d64e63          	blt	a2,a3,22a8 <__subsf3+0x224>
    2290:	02000613          	li	a2,32
    2294:	00d7d733          	srl	a4,a5,a3
    2298:	40d606b3          	sub	a3,a2,a3
    229c:	00d796b3          	sll	a3,a5,a3
    22a0:	00d036b3          	snez	a3,a3
    22a4:	00d76733          	or	a4,a4,a3
    22a8:	40e507b3          	sub	a5,a0,a4
    22ac:	00579713          	slli	a4,a5,0x5
    22b0:	f60754e3          	bgez	a4,2218 <__subsf3+0x194>
    22b4:	040004b7          	lui	s1,0x4000
    22b8:	fff48493          	addi	s1,s1,-1 # 3ffffff <_memory_end+0x3fdffff>
    22bc:	0097f4b3          	and	s1,a5,s1
    22c0:	1080006f          	j	23c8 <__subsf3+0x344>
    22c4:	0ff00713          	li	a4,255
    22c8:	e4e900e3          	beq	s2,a4,2108 <__subsf3+0x84>
    22cc:	04000737          	lui	a4,0x4000
    22d0:	00e7e7b3          	or	a5,a5,a4
    22d4:	fb1ff06f          	j	2284 <__subsf3+0x200>
    22d8:	06068e63          	beqz	a3,2354 <__subsf3+0x2d0>
    22dc:	41260733          	sub	a4,a2,s2
    22e0:	02091663          	bnez	s2,230c <__subsf3+0x288>
    22e4:	1a050e63          	beqz	a0,24a0 <__subsf3+0x41c>
    22e8:	fff70693          	addi	a3,a4,-1 # 3ffffff <_memory_end+0x3fdffff>
    22ec:	00069863          	bnez	a3,22fc <__subsf3+0x278>
    22f0:	40a787b3          	sub	a5,a5,a0
    22f4:	00058413          	mv	s0,a1
    22f8:	f7dff06f          	j	2274 <__subsf3+0x1f0>
    22fc:	0ff00813          	li	a6,255
    2300:	03071063          	bne	a4,a6,2320 <__subsf3+0x29c>
    2304:	0ff00913          	li	s2,255
    2308:	19c0006f          	j	24a4 <__subsf3+0x420>
    230c:	0ff00693          	li	a3,255
    2310:	fed60ae3          	beq	a2,a3,2304 <__subsf3+0x280>
    2314:	040006b7          	lui	a3,0x4000
    2318:	00d56533          	or	a0,a0,a3
    231c:	00070693          	mv	a3,a4
    2320:	01b00813          	li	a6,27
    2324:	00100713          	li	a4,1
    2328:	00d84e63          	blt	a6,a3,2344 <__subsf3+0x2c0>
    232c:	02000713          	li	a4,32
    2330:	40d70733          	sub	a4,a4,a3
    2334:	00e51733          	sll	a4,a0,a4
    2338:	00d55833          	srl	a6,a0,a3
    233c:	00e03733          	snez	a4,a4
    2340:	00e86733          	or	a4,a6,a4
    2344:	40e787b3          	sub	a5,a5,a4
    2348:	00060913          	mv	s2,a2
    234c:	00058413          	mv	s0,a1
    2350:	f5dff06f          	j	22ac <__subsf3+0x228>
    2354:	00190713          	addi	a4,s2,1
    2358:	0fe77713          	andi	a4,a4,254
    235c:	04071c63          	bnez	a4,23b4 <__subsf3+0x330>
    2360:	02091c63          	bnez	s2,2398 <__subsf3+0x314>
    2364:	00051863          	bnez	a0,2374 <__subsf3+0x2f0>
    2368:	12079e63          	bnez	a5,24a4 <__subsf3+0x420>
    236c:	00000413          	li	s0,0
    2370:	0c00006f          	j	2430 <__subsf3+0x3ac>
    2374:	d8078ae3          	beqz	a5,2108 <__subsf3+0x84>
    2378:	40f50733          	sub	a4,a0,a5
    237c:	00571693          	slli	a3,a4,0x5
    2380:	40a787b3          	sub	a5,a5,a0
    2384:	1206c063          	bltz	a3,24a4 <__subsf3+0x420>
    2388:	00070793          	mv	a5,a4
    238c:	e80716e3          	bnez	a4,2218 <__subsf3+0x194>
    2390:	00000793          	li	a5,0
    2394:	fd9ff06f          	j	236c <__subsf3+0x2e8>
    2398:	ea0510e3          	bnez	a0,2238 <__subsf3+0x1b4>
    239c:	00058413          	mv	s0,a1
    23a0:	de079ce3          	bnez	a5,2198 <__subsf3+0x114>
    23a4:	00000413          	li	s0,0
    23a8:	020007b7          	lui	a5,0x2000
    23ac:	0ff00913          	li	s2,255
    23b0:	0800006f          	j	2430 <__subsf3+0x3ac>
    23b4:	40f504b3          	sub	s1,a0,a5
    23b8:	00549713          	slli	a4,s1,0x5
    23bc:	04075463          	bgez	a4,2404 <__subsf3+0x380>
    23c0:	40a784b3          	sub	s1,a5,a0
    23c4:	00058413          	mv	s0,a1
    23c8:	00048513          	mv	a0,s1
    23cc:	3d8000ef          	jal	27a4 <__clzsi2>
    23d0:	ffb50513          	addi	a0,a0,-5
    23d4:	00a494b3          	sll	s1,s1,a0
    23d8:	03254e63          	blt	a0,s2,2414 <__subsf3+0x390>
    23dc:	41250533          	sub	a0,a0,s2
    23e0:	00150513          	addi	a0,a0,1
    23e4:	02000713          	li	a4,32
    23e8:	40a70733          	sub	a4,a4,a0
    23ec:	00a4d7b3          	srl	a5,s1,a0
    23f0:	00e494b3          	sll	s1,s1,a4
    23f4:	009034b3          	snez	s1,s1
    23f8:	0097e7b3          	or	a5,a5,s1
    23fc:	00000913          	li	s2,0
    2400:	e19ff06f          	j	2218 <__subsf3+0x194>
    2404:	fc0492e3          	bnez	s1,23c8 <__subsf3+0x344>
    2408:	00000793          	li	a5,0
    240c:	00000913          	li	s2,0
    2410:	f5dff06f          	j	236c <__subsf3+0x2e8>
    2414:	fc0007b7          	lui	a5,0xfc000
    2418:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
    241c:	40a90933          	sub	s2,s2,a0
    2420:	00f4f7b3          	and	a5,s1,a5
    2424:	df5ff06f          	j	2218 <__subsf3+0x194>
    2428:	0ff00913          	li	s2,255
    242c:	00000793          	li	a5,0
    2430:	00579713          	slli	a4,a5,0x5
    2434:	00075e63          	bgez	a4,2450 <__subsf3+0x3cc>
    2438:	00190913          	addi	s2,s2,1
    243c:	0ff00713          	li	a4,255
    2440:	06e90663          	beq	s2,a4,24ac <__subsf3+0x428>
    2444:	fc000737          	lui	a4,0xfc000
    2448:	fff70713          	addi	a4,a4,-1 # fbffffff <_memory_end+0xfbfdffff>
    244c:	00e7f7b3          	and	a5,a5,a4
    2450:	0ff00713          	li	a4,255
    2454:	0037d793          	srli	a5,a5,0x3
    2458:	00e91863          	bne	s2,a4,2468 <__subsf3+0x3e4>
    245c:	00078663          	beqz	a5,2468 <__subsf3+0x3e4>
    2460:	004007b7          	lui	a5,0x400
    2464:	00000413          	li	s0,0
    2468:	00c12083          	lw	ra,12(sp)
    246c:	01791713          	slli	a4,s2,0x17
    2470:	01f41513          	slli	a0,s0,0x1f
    2474:	7f8006b7          	lui	a3,0x7f800
    2478:	00812403          	lw	s0,8(sp)
    247c:	00979793          	slli	a5,a5,0x9
    2480:	00d77733          	and	a4,a4,a3
    2484:	0097d793          	srli	a5,a5,0x9
    2488:	00f767b3          	or	a5,a4,a5
    248c:	00412483          	lw	s1,4(sp)
    2490:	00012903          	lw	s2,0(sp)
    2494:	00a7e533          	or	a0,a5,a0
    2498:	01010113          	addi	sp,sp,16
    249c:	00008067          	ret
    24a0:	00070913          	mv	s2,a4
    24a4:	00058413          	mv	s0,a1
    24a8:	d71ff06f          	j	2218 <__subsf3+0x194>
    24ac:	00000793          	li	a5,0
    24b0:	fa1ff06f          	j	2450 <__subsf3+0x3cc>

000024b4 <__fixsfsi>:
    24b4:	00800637          	lui	a2,0x800
    24b8:	01755713          	srli	a4,a0,0x17
    24bc:	fff60793          	addi	a5,a2,-1 # 7fffff <_memory_end+0x7dffff>
    24c0:	0ff77713          	zext.b	a4,a4
    24c4:	07e00593          	li	a1,126
    24c8:	00a7f7b3          	and	a5,a5,a0
    24cc:	01f55693          	srli	a3,a0,0x1f
    24d0:	04e5d663          	bge	a1,a4,251c <__fixsfsi+0x68>
    24d4:	09d00593          	li	a1,157
    24d8:	00e5da63          	bge	a1,a4,24ec <__fixsfsi+0x38>
    24dc:	80000537          	lui	a0,0x80000
    24e0:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
    24e4:	00a68533          	add	a0,a3,a0
    24e8:	00008067          	ret
    24ec:	00c7e533          	or	a0,a5,a2
    24f0:	09500793          	li	a5,149
    24f4:	00e7dc63          	bge	a5,a4,250c <__fixsfsi+0x58>
    24f8:	f6a70713          	addi	a4,a4,-150
    24fc:	00e51533          	sll	a0,a0,a4
    2500:	02068063          	beqz	a3,2520 <__fixsfsi+0x6c>
    2504:	40a00533          	neg	a0,a0
    2508:	00008067          	ret
    250c:	09600793          	li	a5,150
    2510:	40e787b3          	sub	a5,a5,a4
    2514:	00f55533          	srl	a0,a0,a5
    2518:	fe9ff06f          	j	2500 <__fixsfsi+0x4c>
    251c:	00000513          	li	a0,0
    2520:	00008067          	ret

00002524 <__floatsisf>:
    2524:	ff010113          	addi	sp,sp,-16
    2528:	00112623          	sw	ra,12(sp)
    252c:	00812423          	sw	s0,8(sp)
    2530:	00912223          	sw	s1,4(sp)
    2534:	00050793          	mv	a5,a0
    2538:	0e050063          	beqz	a0,2618 <__floatsisf+0xf4>
    253c:	41f55713          	srai	a4,a0,0x1f
    2540:	00a74433          	xor	s0,a4,a0
    2544:	40e40433          	sub	s0,s0,a4
    2548:	01f55493          	srli	s1,a0,0x1f
    254c:	00040513          	mv	a0,s0
    2550:	254000ef          	jal	27a4 <__clzsi2>
    2554:	09e00793          	li	a5,158
    2558:	40a787b3          	sub	a5,a5,a0
    255c:	09600713          	li	a4,150
    2560:	04f74063          	blt	a4,a5,25a0 <__floatsisf+0x7c>
    2564:	00800713          	li	a4,8
    2568:	0ae50e63          	beq	a0,a4,2624 <__floatsisf+0x100>
    256c:	ff850513          	addi	a0,a0,-8
    2570:	00a41433          	sll	s0,s0,a0
    2574:	00941413          	slli	s0,s0,0x9
    2578:	00945413          	srli	s0,s0,0x9
    257c:	01779793          	slli	a5,a5,0x17
    2580:	00c12083          	lw	ra,12(sp)
    2584:	0087e7b3          	or	a5,a5,s0
    2588:	00812403          	lw	s0,8(sp)
    258c:	01f49513          	slli	a0,s1,0x1f
    2590:	00a7e533          	or	a0,a5,a0
    2594:	00412483          	lw	s1,4(sp)
    2598:	01010113          	addi	sp,sp,16
    259c:	00008067          	ret
    25a0:	09900713          	li	a4,153
    25a4:	06f75463          	bge	a4,a5,260c <__floatsisf+0xe8>
    25a8:	00500713          	li	a4,5
    25ac:	40a70733          	sub	a4,a4,a0
    25b0:	01b50693          	addi	a3,a0,27
    25b4:	00e45733          	srl	a4,s0,a4
    25b8:	00d41433          	sll	s0,s0,a3
    25bc:	00803433          	snez	s0,s0
    25c0:	00876733          	or	a4,a4,s0
    25c4:	fc000437          	lui	s0,0xfc000
    25c8:	fff40413          	addi	s0,s0,-1 # fbffffff <_memory_end+0xfbfdffff>
    25cc:	00777693          	andi	a3,a4,7
    25d0:	00877433          	and	s0,a4,s0
    25d4:	00068a63          	beqz	a3,25e8 <__floatsisf+0xc4>
    25d8:	00f77713          	andi	a4,a4,15
    25dc:	00400693          	li	a3,4
    25e0:	00d70463          	beq	a4,a3,25e8 <__floatsisf+0xc4>
    25e4:	00440413          	addi	s0,s0,4
    25e8:	00541713          	slli	a4,s0,0x5
    25ec:	00075c63          	bgez	a4,2604 <__floatsisf+0xe0>
    25f0:	fc0007b7          	lui	a5,0xfc000
    25f4:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
    25f8:	00f47433          	and	s0,s0,a5
    25fc:	09f00793          	li	a5,159
    2600:	40a787b3          	sub	a5,a5,a0
    2604:	00345413          	srli	s0,s0,0x3
    2608:	f6dff06f          	j	2574 <__floatsisf+0x50>
    260c:	ffb50713          	addi	a4,a0,-5
    2610:	00e41733          	sll	a4,s0,a4
    2614:	fb1ff06f          	j	25c4 <__floatsisf+0xa0>
    2618:	00000493          	li	s1,0
    261c:	00000413          	li	s0,0
    2620:	f55ff06f          	j	2574 <__floatsisf+0x50>
    2624:	09600793          	li	a5,150
    2628:	f4dff06f          	j	2574 <__floatsisf+0x50>

0000262c <__truncdfsf2>:
    262c:	0145d613          	srli	a2,a1,0x14
    2630:	7ff67613          	andi	a2,a2,2047
    2634:	00c59793          	slli	a5,a1,0xc
    2638:	00160713          	addi	a4,a2,1
    263c:	0097d793          	srli	a5,a5,0x9
    2640:	01d55693          	srli	a3,a0,0x1d
    2644:	7fe77713          	andi	a4,a4,2046
    2648:	00f6e6b3          	or	a3,a3,a5
    264c:	01f5d593          	srli	a1,a1,0x1f
    2650:	00351793          	slli	a5,a0,0x3
    2654:	0a070663          	beqz	a4,2700 <__truncdfsf2+0xd4>
    2658:	c8060713          	addi	a4,a2,-896
    265c:	0fe00813          	li	a6,254
    2660:	0ce84263          	blt	a6,a4,2724 <__truncdfsf2+0xf8>
    2664:	08e04063          	bgtz	a4,26e4 <__truncdfsf2+0xb8>
    2668:	fe900513          	li	a0,-23
    266c:	10a74a63          	blt	a4,a0,2780 <__truncdfsf2+0x154>
    2670:	00800537          	lui	a0,0x800
    2674:	00a6e6b3          	or	a3,a3,a0
    2678:	01e00513          	li	a0,30
    267c:	40e50533          	sub	a0,a0,a4
    2680:	01f00813          	li	a6,31
    2684:	02a84863          	blt	a6,a0,26b4 <__truncdfsf2+0x88>
    2688:	c8260613          	addi	a2,a2,-894
    268c:	00a7d533          	srl	a0,a5,a0
    2690:	00c797b3          	sll	a5,a5,a2
    2694:	00f037b3          	snez	a5,a5
    2698:	00c696b3          	sll	a3,a3,a2
    269c:	00d7e7b3          	or	a5,a5,a3
    26a0:	00f567b3          	or	a5,a0,a5
    26a4:	00000713          	li	a4,0
    26a8:	0077f693          	andi	a3,a5,7
    26ac:	08068063          	beqz	a3,272c <__truncdfsf2+0x100>
    26b0:	0d80006f          	j	2788 <__truncdfsf2+0x15c>
    26b4:	ffe00813          	li	a6,-2
    26b8:	40e80833          	sub	a6,a6,a4
    26bc:	02000893          	li	a7,32
    26c0:	0106d833          	srl	a6,a3,a6
    26c4:	00000713          	li	a4,0
    26c8:	01150663          	beq	a0,a7,26d4 <__truncdfsf2+0xa8>
    26cc:	ca260613          	addi	a2,a2,-862
    26d0:	00c69733          	sll	a4,a3,a2
    26d4:	00f76733          	or	a4,a4,a5
    26d8:	00e03733          	snez	a4,a4
    26dc:	00e867b3          	or	a5,a6,a4
    26e0:	fc5ff06f          	j	26a4 <__truncdfsf2+0x78>
    26e4:	00651513          	slli	a0,a0,0x6
    26e8:	00a03533          	snez	a0,a0
    26ec:	00369693          	slli	a3,a3,0x3
    26f0:	01d7d793          	srli	a5,a5,0x1d
    26f4:	00d566b3          	or	a3,a0,a3
    26f8:	00f6e7b3          	or	a5,a3,a5
    26fc:	fadff06f          	j	26a8 <__truncdfsf2+0x7c>
    2700:	00f6e7b3          	or	a5,a3,a5
    2704:	00061663          	bnez	a2,2710 <__truncdfsf2+0xe4>
    2708:	00f037b3          	snez	a5,a5
    270c:	f99ff06f          	j	26a4 <__truncdfsf2+0x78>
    2710:	0ff00713          	li	a4,255
    2714:	00078c63          	beqz	a5,272c <__truncdfsf2+0x100>
    2718:	00369693          	slli	a3,a3,0x3
    271c:	020007b7          	lui	a5,0x2000
    2720:	fd9ff06f          	j	26f8 <__truncdfsf2+0xcc>
    2724:	00000793          	li	a5,0
    2728:	0ff00713          	li	a4,255
    272c:	00579693          	slli	a3,a5,0x5
    2730:	0006de63          	bgez	a3,274c <__truncdfsf2+0x120>
    2734:	00170713          	addi	a4,a4,1
    2738:	0ff00693          	li	a3,255
    273c:	06d70063          	beq	a4,a3,279c <__truncdfsf2+0x170>
    2740:	fc0006b7          	lui	a3,0xfc000
    2744:	fff68693          	addi	a3,a3,-1 # fbffffff <_memory_end+0xfbfdffff>
    2748:	00d7f7b3          	and	a5,a5,a3
    274c:	0ff00693          	li	a3,255
    2750:	0037d793          	srli	a5,a5,0x3
    2754:	00d71863          	bne	a4,a3,2764 <__truncdfsf2+0x138>
    2758:	00078663          	beqz	a5,2764 <__truncdfsf2+0x138>
    275c:	004007b7          	lui	a5,0x400
    2760:	00000593          	li	a1,0
    2764:	7f8006b7          	lui	a3,0x7f800
    2768:	01771713          	slli	a4,a4,0x17
    276c:	00d77733          	and	a4,a4,a3
    2770:	00f76733          	or	a4,a4,a5
    2774:	01f59513          	slli	a0,a1,0x1f
    2778:	00a76533          	or	a0,a4,a0
    277c:	00008067          	ret
    2780:	00100793          	li	a5,1
    2784:	00000713          	li	a4,0
    2788:	00f7f693          	andi	a3,a5,15
    278c:	00400613          	li	a2,4
    2790:	f8c68ee3          	beq	a3,a2,272c <__truncdfsf2+0x100>
    2794:	00478793          	addi	a5,a5,4 # 400004 <_memory_end+0x3e0004>
    2798:	f95ff06f          	j	272c <__truncdfsf2+0x100>
    279c:	00000793          	li	a5,0
    27a0:	fadff06f          	j	274c <__truncdfsf2+0x120>

000027a4 <__clzsi2>:
    27a4:	000107b7          	lui	a5,0x10
    27a8:	02f57863          	bgeu	a0,a5,27d8 <__clzsi2+0x34>
    27ac:	10053793          	sltiu	a5,a0,256
    27b0:	0017b793          	seqz	a5,a5
    27b4:	00379793          	slli	a5,a5,0x3
    27b8:	02000693          	li	a3,32
    27bc:	40f686b3          	sub	a3,a3,a5
    27c0:	00f55533          	srl	a0,a0,a5
    27c4:	0d818793          	addi	a5,gp,216 # 28c8 <__clz_tab>
    27c8:	00a787b3          	add	a5,a5,a0
    27cc:	0007c503          	lbu	a0,0(a5) # 10000 <_bss_end+0xd5fc>
    27d0:	40a68533          	sub	a0,a3,a0
    27d4:	00008067          	ret
    27d8:	01000737          	lui	a4,0x1000
    27dc:	01800793          	li	a5,24
    27e0:	fce57ce3          	bgeu	a0,a4,27b8 <__clzsi2+0x14>
    27e4:	01000793          	li	a5,16
    27e8:	fd1ff06f          	j	27b8 <__clzsi2+0x14>
    27ec:	0000                	.insn	2, 0x
	...
