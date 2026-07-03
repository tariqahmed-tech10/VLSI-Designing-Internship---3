`timescale 1ns / 1ps

module jk_flipflop_tb;
    reg clk;
    reg J;
    reg K;

    wire Q;

    jk_flipflop uut(
        .clk(clk),
        .J(J),
        .K(K),
        .Q(Q)
    );

    always #5 clk = ~clk;
    initial begin
        $dumpfile("jk_flipflop.vcd");
        $dumpvars(0, jk_flipflop_tb);

        clk = 0;
        J = 0;
        K = 0;

        $monitor("Time=0%t | J=%b K=%b | Q=%b", $time, J, K, Q);

        #10 J = 0; K = 0;
        #10 J = 0; K = 1;
        #10 J = 1; K = 0;
        #10 J = 1; K = 1;
        #10 J = 1; K = 1;
        #10 J = 0; K = 0;

        #10 $finish;
    end

endmodule        
              