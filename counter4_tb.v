`timescale 1ns / 1ps

module counter4_tb;

    reg clk;

    wire [3:0] count;

    counter4 uut(
        .clk(clk),
        .count(count)
    );

    initial begin 
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\t clk\t count(Bin)\t count(Dec)");
        $display("------------------------------------------");

        $monitor("%4d\t  %b \t  %b \t\t %d", $time, clk, count, count);

    end

    initial begin
        $dumpfile("counter4.vcd");
        $dumpvars(0, counter4_tb);

        #200;

        $finish;
    end

endmodule    

