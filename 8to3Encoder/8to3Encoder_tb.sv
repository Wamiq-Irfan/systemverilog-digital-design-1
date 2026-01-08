`timescale 1ns/1ps
module encoder_tb_full;
    reg  [7:0] in;
    wire [2:0] out;
    wire valid;
    encoder8to3 dut (
        .in(in),
        .out(out),
        .valid(valid)
    );
    integer passed;
    integer failed;
    integer i;

    task automatic compute_expected(input  [7:0] in_val,
                                    output reg [2:0] exp_out,
                                    output reg       exp_valid);
        integer j;
        begin
            exp_valid = 1'b0;
            exp_out   = 3'b000;
            for (j = 7; j >= 0; j = j - 1) begin
                if (in_val[j]) begin
                    exp_out = j[2:0];
                    exp_valid = 1'b1;
                    return; 
                end
            end
        end
    endtask
    task automatic run_vector(input [7:0] test_in, input string case_name = "");
        reg [2:0] exp_out;
        reg       exp_valid;
        begin
            in = test_in;
            #1; 
            compute_expected(test_in, exp_out, exp_valid);

            if ((out === exp_out) && (valid === exp_valid)) begin
                $display("PASS: %s in=%b out=%0d valid=%b", case_name, test_in, out, valid);
                passed = passed + 1;
            end else begin
                $display("FAIL: %s in=%b expected_out=%0d expected_valid=%b got_out=%0d got_valid=%b",
                         case_name, test_in, exp_out, exp_valid, out, valid);
                failed = failed + 1;
            end
        end
    endtask

    initial begin
        passed = 0;
        failed = 0;
        in = 8'b0;

        $dumpfile("encoder_tb_full.vcd");
        $dumpvars(0, encoder_tb_full);

        $display("Starting encoder8to3 full self-checking testbench...");
        for (i = 0; i < 8; i = i + 1) begin
            run_vector(8'b1 << i, $sformatf("single_bit_%0d", i));
        end
        run_vector(8'b0000_0000, "zero_input");
        run_vector(8'b0000_0011, "multi_bits_0_1"); 
        run_vector(8'b0101_0000, "multi_bits_6_4"); 
        run_vector(8'b1000_0001, "multi_bits_7_0"); 
        run_vector(8'b0011_1100, "multi_bits_5_2"); 
        run_vector(8'b1111_1111, "all_ones");       
        for (i = 0; i < 1000; i = i + 1) begin
            run_vector($urandom_range(0, 255), $sformatf("rand_%0d", i));
        end
        #5 $finish;
    end
endmodule

