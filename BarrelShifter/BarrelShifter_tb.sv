module barrel_shifter_tb;
    logic [31:0] data_in;
    logic [4:0]  shift_amt;
    logic dir;
    logic [31:0] data_out;
    logic [31:0] exp_out;
    int pass = 0, fail = 0;
    barrel_shifter dut (
        .data_in   (data_in),
        .shift_amt (shift_amt),
        .dir       (dir),
        .data_out  (data_out)
    );
    task check_output;
        begin
            if (data_out === exp_out) begin
                $display("PASS: data_in=%h shift=%0d dir=%0b", data_in, shift_amt, dir);
                pass++;
            end
            else begin
                $display("FAIL: data_in=%h shift=%0d dir=%0b : expected=%h got=%h",
                          data_in, shift_amt, dir, exp_out, data_out);
                fail++;
            end
        end
    endtask

    initial begin
        data_in = 32'h80000000; shift_amt = 1; dir = 0; exp_out = data_in << 1; #1; check_output();
        data_in = 32'h00000001; shift_amt = 1; dir = 1; exp_out = data_in >> 1; #1; check_output();

        repeat (50) begin
            data_in   = $random;
            shift_amt = $random;
            dir       = $random;

            exp_out = (dir == 0) ? (data_in << shift_amt) : (data_in >> shift_amt);
            #1;
            check_output();
        end
    end
endmodule
