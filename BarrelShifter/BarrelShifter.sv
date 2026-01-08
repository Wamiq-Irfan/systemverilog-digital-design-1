module barrel_shifter (
    input  logic [31:0] data_in,
    input  logic [4:0]  shift_amt,
    input  logic dir,       
    output logic [31:0] data_out
);
    always_comb begin
        if (dir == 1'b0) begin
            data_out = data_in << shift_amt;
        end
        else begin
            data_out = data_in >> shift_amt;
        end
    end
endmodule
