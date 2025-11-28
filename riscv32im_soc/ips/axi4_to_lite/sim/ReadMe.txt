How to change conditions: see bench/verilog/top.v
* AIX width == AXIS width: STREAM_WIDTH_DATA=(`WIDTH_DA)
* AIX width <  AXIS width: STREAM_WIDTH_DATA=(`WIDTH_DA*2)
* AIX width  > AXIS width: STREAM_WIDTH_DATA=(`WIDTH_DA/2)

'modelsim' has problem with asynch-FIFO.
       - item is missing occasionally.
'xsim' does work fine.
