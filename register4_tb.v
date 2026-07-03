`timescale 1ns / 1ps
module register4_tb;
    reg clk;
    reg [3:0] D;

    wire [3:0] Q;

    register4 uut(
        .clk(clk),
        .D(D),
        .Q(Q)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("register4.vcd");
        $dumpvars(0, register4_tb);

        $display(" Time | clk |  D  |  Q   ");
        $display("-------------------------");
        $monitor("  %2t  |  %b  | %b | %b ", $time, clk, D, Q);

        clk = 0;
        D = 4'b0000;

        #10 D = 4'b1010;
        #10 D = 4'b0011;
        #10 D = 4'b1111;
        #10 D = 4'b0101;

        #20 $finish;

    end
    
endmodule