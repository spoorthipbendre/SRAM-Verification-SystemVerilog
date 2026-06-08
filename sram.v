module sram(clk,rst,wr,addr,data_in,data_out);

//parameters
parameter ADDR =8, DATA =32,DEPTH =256;

//input output declarations
input clk,rst,wr;
input [ADDR -1 :0]addr;
input [DATA-1:0]data_in;
output reg [DATA-1:0]data_out;

integer i;
//memory declaration
reg [DATA-1:0]mem[0:DEPTH-1];

//output logic 
always@(posedge clk)
begin
	if(rst)
	begin
		for(i=0;i<DEPTH;i = i+1)
			mem[i] = 0;
		data_out = 0;
	end
	else
	begin
		if(wr)
			mem[addr] <= data_in;
		else
			data_out <= mem[addr];
	end
end
endmodule