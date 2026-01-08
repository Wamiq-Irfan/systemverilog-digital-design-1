
module adder32 (
    input  logic [31:0] a,
    input  logic [31:0] b,
    input  logic cin,
    output logic [31:0] sum,
    output logic cout
);
    logic [32:0] t_sum;
    always_comb begin
        t_sum = a + b + cin;
        sum  = t_sum[31:0];
        cout = t_sum[32];
    end
endmodule
