module register4(
    input clk,
    input [3:0] D,
    output reg [3:0] Q
);

always @(posedge clk)
begin
    Q <= D;
end

endmodule