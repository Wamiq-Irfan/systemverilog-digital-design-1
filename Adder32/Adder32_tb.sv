module adder32_tb;
    logic [31:0] a, b;
    logic        cin;
    logic [31:0] sum;
    logic        cout;
    logic [32:0] expected;
    int pass_count = 0;
    int fail_count = 0;

    adder32 dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    task check;
        expected = a + b + cin;
        #1;
        if ({cout, sum} === expected) begin
            pass_count++;
             $display("PASS: a=%h b=%h cin=%b sum=%h cout=%b",
              a, b, cin, sum, cout);
        end 
	else begin
            fail_count++;
            $display("FAIL: a=%h b=%h cin=%b | expected=%h got=%b%h",
              a, b, cin, expected, cout, sum);
        end
    endtask

    initial begin
        a = 32'h0; b = 32'h0; cin = 0; check();
        a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; cin = 0; check();
        a = 32'hFFFFFFFF; b = 32'h1; cin = 0; check();
        a = 32'h80000000; b = 32'h80000000; cin = 0; check();

        repeat (50) begin
            a   = $random;
            b   = $random;
            cin = $random % 2;
            check();
        end
        $finish;
    end
endmodule
