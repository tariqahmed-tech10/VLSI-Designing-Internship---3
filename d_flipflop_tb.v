`timescale 1ns / 1ps

module d_flipflop_tb;
   reg clk;
   reg D;

   wire Q;

   d_flipflop uut(
    .clk(clk),
    .D(D),
    .Q(Q)
   );

   initial begin
       clk = 0;
       forever #5 clk = ~clk;
   end

   initial begin
       $display("Time | clk | D | Q");
       $display("-------------------");
       $monitor("%4t |  %b  | %b | %b", $time, clk, D, Q);
   end    

   initial begin 
       $dumpfile("d_flipflop.vcd");
       $dumpvars(0, d_flipflop_tb);

       D = 0;

       #12 D = 1;
       #10 D = 0;
       #15 D = 1;
       #20;

       $finish;
   end

endmodule   