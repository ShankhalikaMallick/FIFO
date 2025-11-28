`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2025 08:28:07
// Design Name: 
// Module Name: asyn_FIFO_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module asyn_FIFO_tb();
    parameter DATA_WIDTH=8;
    parameter ADDR_WIDTH=4;
    reg wr_en;                            // enable write
    reg [DATA_WIDTH-1:0] wr_data;         // data to be written 
    reg wr_clk;                           // write clock
    reg wr_rst;                           // resetting write pointer
    reg rd_en;                            // enable read
    reg rd_clk;                           // read clock
    reg rd_rst;                           // resetting read pointer
    wire [DATA_WIDTH-1:0] rd_data;        // data which is read   
    wire full;                            // pointer to indicate if FIFO is full
    wire empty;                           // pointer to indicate if FIFO is empty
    asyn_FIFO ob(wr_en, wr_data, wr_clk, wr_rst, rd_en, rd_clk, rd_rst, rd_data, full, empty);
    initial
    begin
        $monitor($time, "\t wr_en=%0b, wr_data=%0h, rd_en=%0b, rd_data=%0h, full=%0b, empty=%0b", wr_en, wr_data, rd_en, rd_data, full, empty);
        wr_clk=1'b0;
        rd_clk=1'b0;
        wr_rst=1'b1;
        rd_rst=1'b1;
        wr_en=0;
        rd_en=0;
        wr_data=0;
        #20; 
        rd_en=0;
        wr_en=0;
        #20; 
        wr_rst=0;
        rd_rst=0;
        
        // for 16 locations of fifo write
        repeat(16)  begin                 
            @(posedge wr_clk);
            if(full!=1) begin
                wr_en=1'b1;
                wr_data=$random;
            end
        end
        
        // resetting write enable
        @(posedge wr_clk);
        wr_en=0;
        
        // for 16 locations of fifo read
        repeat(16) begin                 
            @(posedge rd_clk);
            if(empty!=1) begin
                rd_en=1'b1;
            end
        end
        
        // resetting read enable
        @(posedge rd_clk);
        rd_en=0;
        #30;
        $finish;
    end
    
    // write clock of time period 10  
    always begin                              
    #5; wr_clk=~wr_clk;
    end
    
    // read clock of time period 14
    always begin                          
    #7; rd_clk=~rd_clk;
    end
endmodule
