//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki.
// All rights are reserved by Ando Ki.
//------------------------------------------------------------------------------
// main.cpp
//------------------------------------------------------------------------------
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <inttypes.h>
#include <getopt.h>
#include <signal.h>
#include <math.h>
#include <iostream>
#if defined(COSIM_BFM)
#	include "cosim_bfm_api.h"
#elif defined(TRX_AXI)||defined(BFM_AXI)
#	include "trx_axi_api.h"
#endif
#include "etc.h"
#include "mem_test.h"

const char program[]="test";
const unsigned int version=0x20250220;

int   mem_test=0;
#if defined(RIGOR)
int   rigor = 1;
#else
int   rigor = 0;
#endif
int   verbose = 0;

int   cid = 0;

#if defined(TRX_AXI)||defined(BFM_AXI)
    con_Handle_t handle=NULL;
    int  get_confmc( con_Handle_t handle );
#endif

//------------------------------------------------------------------------------
int main(int argc, char* argv[])
{
    extern void sig_handle( int );
    extern int  arg_parser( int, char ** );

    if ((signal(SIGINT, sig_handle)==SIG_ERR)
            #ifndef WIN32
            ||(signal(SIGQUIT, sig_handle)==SIG_ERR)
            #endif
            ) {
          myError("signal error\n");
          exit(1);
    }
    
    if (arg_parser(argc, argv)) return 1;

#if defined(COSIM_BFM)
    bfm_set_verbose(verbose); // optional
    bfm_open(cid); // mandatory
    bfm_barrier(cid); // mandatory
#elif defined(TRX_AXI)||defined(BFM_AXI)
    if ((handle=conInit(cid, CON_MODE_CMD, CONAPI_LOG_LEVEL_INFO))==NULL) {
       myError("cannot initialize CON-FMC\n");
       myError("%d %s\n", conGetErrorConapi(), conErrorMsgConapi(conGetErrorConapi()));
       return 0;
    }
    if (verbose>1) get_confmc(handle);
#endif

    if (mem_test>0) {
        // check memory map in 'hw/design/verilog/fpga_zed.v'
        // localparam MEM_ONCHIP_ADDR = 32'h0000_0000;//Lowest on-chip memory address.
        // localparam MEM_ONCHIP_SIZE =128*1024;//size of on-chip memory
        // localparam MEM_OFFCHIP_ADDR= 32'h0200_0000;//Lowest off-chip memory address.
        // localparam MEM_OFFCHIP_SIZE=128*1024;//size of off-chip memory
        uint32_t  addr=0x00000000; // on-chip memory
        uint32_t  depth=1024;
        test_mem( addr, depth );

        addr=0x02000000; // off-chip memory
        test_mem( addr, depth );

        addr=0x90030000; // memory axi-lite
        test_mem( addr, depth );
    }

#if defined(COSIM_BFM)
    bfm_close(cid); // mandatory
#elif defined(TRX_AXI)||defined(BFM_AXI)
    if (handle!=NULL) conRelease(handle);
#endif

    return 0;
}

//------------------------------------------------------------------------------
#if defined(TRX_AXI)||defined(BFM_AXI)
int get_confmc( con_Handle_t handle )
{
  struct _usb usb;
  conGetUsbInfo( handle, &usb);
  printf("USB information\n");
  printf("    DevSpeed         =%d%cbps\n", (usb.speed>10000) ? usb.speed/10000
                                                              : usb.speed/10
                                          , (usb.speed>10000) ? 'G' : 'M');
  printf("    BulkMaxPktSizeOut=%d\n", usb.bulk_max_pkt_size_out);
  printf("    BulkMaxPktSizeIn =%d\n", usb.bulk_max_pkt_size_in );
  printf("    IsoMaxPktSizeOut =%d\n", usb.iso_max_pkt_size_out );
  printf("    IsoMaxPktSizeIn  =%d\n", usb.iso_max_pkt_size_in  );
  fflush(stdout);

  con_MasterInfo_t gpif2mst_info;
  if (conGetMasterInfo(handle, &gpif2mst_info)) {
      myError("cannot get gpif2mst info\n");
      return 1;
  }
  printf("gpif2mst information\n");
  printf("         version 0x%08X\n", gpif2mst_info.version);
  printf("         pclk_freq %d-Mhz (%s)\n", gpif2mst_info.clk_mhz
                                             , (gpif2mst_info.clk_inv)
                                             ? "inverted"
                                             : "not-inverted");
  printf("         DepthCu2f=%d, DepthDu2f=%d, DepthDf2u=%d\n"
                               , gpif2mst_info.depth_cmd
                               , gpif2mst_info.depth_u2f
                               , gpif2mst_info.depth_f2u);
  fflush(stdout);

  return 0;
}
#endif

//------------------------------------------------------------------------------
int arg_parser(int argc, char **argv)
{
    int opt;
    int longidx=0;
    extern void help(int, char **);
    extern void print_license(void);
    extern void print_version(void);

    struct option longopts[] = {
          {"cid"        , required_argument, 0, 'C'}
        , {"memtest"    , required_argument, 0, 'T'}
        , {"verbose"    , required_argument, 0, 'g'}
        , {"rigor"      , required_argument, 0, 'r'}
        , {"version"    , no_argument      , 0, 'v'}
        , {"license"    , no_argument      , 0, 'l'}
        , {"help"       , no_argument      , 0, 'h'}
        , { 0           , 0                , 0,  0 }
    };

    while ((opt=getopt_long(argc, argv, "C:I:T:g:r:pvlh?", longopts, &longidx))!=-1) {
       switch (opt) {
       case 'C': cid = atoi(optarg); break;
       case 'T': mem_test = atoi(optarg); break;
       case 'g': verbose = atoi(optarg); break;
       case 'r': rigor = atoi(optarg); break;
       case 'v': print_version(); exit(0); break;
       case 'l': print_license(); exit(0); break;
       case 'h':
       case '?': help(argc, argv); exit(0); break;
       case  0 : return -1;
                 break;
       default: 
          myError("undefined option: %c\n", optopt);
          help(argc, argv);
          exit(1);
       }
    }

    return 0;
}

//------------------------------------------------------------------------------
void help(int argc, char **argv)
{
  printf("[Usage] %s [options]\n", argv[0]);
  printf("\t-C,--cid=num       channel id (default: %d)\n", cid);
  printf("\t-T,--memtest=level test memory\n");
  printf("\t-g,--verbose=num   verbose level  (default: %d)\n", verbose);
  printf("\t-r,--rigor=num     rigorous check (default: %d)\n", rigor);
  printf("\t-v,--version       print version\n");
  printf("\t-l,--license       print license message\n");
  printf("\t-h                 print help message\n");
  printf("\n");
}

//------------------------------------------------------------------------------
const char license[] =
"Copyright (c) 2025 by Ando Ki (andoki@gmail.com).\n\n\
This contents and its associated materials are licensed with the 2-clause BSD license to make the program and library useful in open and closed source products independent of their licensing scheme. Each contributor holds copyright over their respective contribution.\n\
All contents are provided as it is WITHOUT ANY WARRANTY and NO TECHNICAL SUPPORT will be provided for problems that might arise.\n";
void print_license(void)
{
     printf("%s %X\n\n", program, version);
     printf("%s", license);
}

//------------------------------------------------------------------------------
void print_version(void)
{
     printf("%X\n", version);
}

//------------------------------------------------------------------------------
void sig_handle(int sig)
{
   extern void cleanup();
   switch (sig) {
   case SIGINT:
   #ifndef WIN32
   case SIGQUIT:
   #endif
   case SIGSEGV:
        exit(0);
        break;
   }
}

//------------------------------------------------------------------------------
// Revision history
//
// 2021.08.01: Started by Ando Ki.
//------------------------------------------------------------------------------
