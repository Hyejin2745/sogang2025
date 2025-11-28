//------------------------------------------------------------------------------
// Simulation primitives for Xilinx FPGA components
//------------------------------------------------------------------------------
`timescale 1ns/1ps

// IOBUF simulation model
module IOBUF (
    input  I,    // Input from fabric
    output O,    // Output to fabric  
    input  T,    // Tristate control (1=tristate, 0=drive)
    inout  IO    // Bidirectional pin
);

    assign IO = T ? 1'bz : I;  // Drive IO when T=0, tristate when T=1
    assign O = IO;             // Always pass IO to output

endmodule

// IBUF simulation model  
module IBUF (
    input  I,
    output O
);
    assign O = I;
endmodule

// OBUF simulation model
module OBUF (
    input  I,
    output O
);
    assign O = I;
endmodule
