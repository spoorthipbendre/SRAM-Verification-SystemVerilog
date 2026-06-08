`include "sram_if.sv"
`include "sram.v"
`include "sram_assertion1.sv"
`include "sram_coverage1.sv"
`include "filelist.f"

module sram_top;

bit clk,rst;

sram_if vif(clk,rst);

sram_test1 test1;
sram_test2 test2;
sram_test3 test3;

initial begin
	clk =0;
	forever #5 clk = ~clk;
end

sram DUT(.clk(clk),.rst(rst),.wr(vif.wr),.addr(vif.addr),.data_in(vif.data_in),.data_out(vif.data_out));

bind sram sram_assert asst(.clk(clk),.rst(rst),.wr(vif.wr),.addr(vif.addr),.data_in(vif.data_in),.data_out(vif.data_out));

sram_coverage cvg_md (.clk(clk),.rst(rst),.wr(vif.wr),.addr(vif.addr),.data_in(vif.data_in),.data_out(vif.data_out));

initial begin
	rst = 0;
	#10;
	rst =1;
	#10 rst =0;
end
initial begin
	`ifdef "test1"
		$display("displaying from test1 ---------");
		test1  = new(vif);
		test1.run();
	`endif
	`ifdef "test2"
		test2  = new(vif);
		test2.run();
	`endif
	`ifdef "test3"
		test3  = new(vif);
		test3.run();
	`endif
end
initial begin

	#1000 $finish;
end

endmodule