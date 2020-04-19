//
// HARDWARE DEFINITIONS
//

//Choose CPU architecture to use
`define PICORV32
//use picorv's lookahead interface
//`define USE_LA_IF

//`define DARKRV

//Optional memories (passed as command line macro)
`define USE_RAM
`define INIT_RAM

//`define USE_DDR
//`define INIT_DDR

//`define USE_BOOT

//main memory address space (log2 of byte size)
`define MAINRAM_ADDR_W 13

// SLAVES
`define N_SLAVES 3
//bits reserved to identify slave
//please insert manually...
`define N_SLAVES_W 2

//peripheral address prefixes
`define SRAM_BASE 0
`define SOFT_RESET_BASE 1
//`define DDR_BASE 2
`define UART_BASE 2






//////////////////////////////////////////////////////////////////////////
//DO NOT EDIT BEYOND HERE
//
//address width
`define ADDR_W 32
//data width
`define DATA_W 32


//boot rom memory address space (log2 of byte size)
`define BOOTROM_ADDR_W 12

//definitions to be passed to software
//peripheral base addresses
`define UART ((1<<31) | (UART_BASE<<(DATA_W-N_SLAVES_W-1)))
`define SOFT_RESET ((1<<31) | (SOFT_RESET_BASE<<(ADDR_W-N_SLAVES_W-1)))
`define DDR ((1<<31) | (DDR_BASE<<(DATA_W-N_SLAVES_W-1)))
`define SRAM ((1<<31) | (SRAM_BASE<<(DATA_W-N_SLAVES_W-1)))

//internal memory address space (log2 of byte size)
//this code is just copied to system.h; not used in the verilog code
`ifdef USE_DDR
 `define RAM_ADDR_W (BOOTROM_ADDR_W+1)
`else
 `define RAM_ADDR_W MAINRAM_ADDR_W 
`endif
