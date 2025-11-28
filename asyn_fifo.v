`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Create Date: 26.11.2025 18:48:12
// Design Name: 
// Module Name: asyn_FIFO
// Project Name: ASYNCHRONOUS FIFO
// Target Devices: 
// Tool Versions: 
// Description: module to show working of an asynchronous fifo
// Dependencies: 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module asyn_FIFO #( parameter DATA_WIDTH=8,                 // width of FIFO data
                    parameter ADDR_WIDTH=4)                 //0000 TO 1111 are 15 locations
                   (input wr_en,                            // enable write
                    input [DATA_WIDTH-1:0] wr_data,         // data to be written 
                    input wr_clk,                           // write clock
                    input wr_rst,                           // resetting write pointer
                    input rd_en,                            // enable read
                    input rd_clk,                           // read clock
                    input rd_rst,                           // resetting read pointer
                    output reg [DATA_WIDTH-1:0] rd_data,    // data which is read   
                    output full,                            // pointer to indicate  if FIFO is full   
                    output empty                            // pointer to indicate if FIFO is empty
                    );
   localparam DEPTH = 1<< ADDR_WIDTH;
   
   // internal signals
   reg [DATA_WIDTH-1:0] mem [0: DEPTH];                     // memory unit of depth 16 (2^4) and data width of 8
   reg [ADDR_WIDTH:0] wr_ptr_bin;                           // write pointer in binary : 5 bits
   reg [ADDR_WIDTH:0] wr_ptr_gray;                          // write pointer in gray code : 5 bits
   reg [ADDR_WIDTH:0] rd_ptr_bin;                           // read pointer in binary: 5 bits                        
   reg [ADDR_WIDTH:0] rd_ptr_gray;                          // read pointer in gray code : 5 bits
   
   // synchronised pointers across clock domains
   reg [ADDR_WIDTH:0] wr_ptr_gray_rdclk1, wr_ptr_gray_rdclk2;       // read block to write block pointer passed through 2 flop synchronization        
   reg [ADDR_WIDTH:0] rd_ptr_gray_wrclk1, rd_ptr_gray_wrclk2;       // write block to read block pointer passed through 2 flop synchronization
       
    // write side
    always @(posedge wr_clk or posedge wr_rst)
    begin
        if(wr_rst)
        begin
            wr_ptr_bin <=0;
            wr_ptr_gray <=0;
        end
       else if(wr_en && (full!=1))
       begin
            mem[wr_ptr_bin[ADDR_WIDTH-1:0]]<= wr_data;
            wr_ptr_bin <= wr_ptr_bin+1'b1;                              // addition can be done in binary form only not in gray form
            wr_ptr_gray <= (wr_ptr_bin+1'b1)^((wr_ptr_bin+1'b1)>>1);    // finding gray code of next binary index
       end
    end
    
    // read side
    always @(posedge rd_clk or posedge rd_en)
    begin
        if(rd_rst)
        begin
            rd_ptr_bin <=0;
            rd_ptr_gray <=0;
            rd_data <=0;
        end
        else if(rd_en && (empty!=1))
        begin
            rd_data <= mem[rd_ptr_bin[ADDR_WIDTH-1:0]];
            rd_ptr_bin <= rd_ptr_bin +1'b1;
            rd_ptr_gray <= (rd_ptr_bin+1'b1)^((rd_ptr_bin+1'b1)>>1);
        end
    end
    
    // 2 flop synchronization
    // WRITE POINTER TO READ DOMAIN
    always @(posedge rd_clk)
    begin
        wr_ptr_gray_rdclk1 <= wr_ptr_gray;
        wr_ptr_gray_rdclk2 <= wr_ptr_gray_rdclk1;
    end
    
    // READ POINTER TO WRITE DOMAIN
    always @(posedge wr_clk)
    begin
        rd_ptr_gray_wrclk1 <= rd_ptr_gray;
        rd_ptr_gray_wrclk2 <= rd_ptr_gray_wrclk1;
    end
    
    // full and empty detection
    assign full= (wr_ptr_gray == {(~rd_ptr_gray_wrclk2[ADDR_WIDTH: ADDR_WIDTH-1]),rd_ptr_gray_wrclk2[ADDR_WIDTH-2:0]});
    assign empty= (rd_ptr_gray == wr_ptr_gray_rdclk2);
    
endmodule
