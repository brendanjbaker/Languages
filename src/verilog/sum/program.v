module program;
	integer i;
	integer total;

	initial begin
			total = 0;
			for (i = 0; i <= 100; i = i + 1) begin
				total = total + i;
			end

			$display("%0d", total);
			$finish;
	end
endmodule
