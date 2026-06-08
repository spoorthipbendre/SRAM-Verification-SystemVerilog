class sram_transaction;

rand bit [7:0] addr;
rand bit wr;
rand bit [31:0] data_in;
bit [31:0] data_out;

/*constraint addrs{addr<20};
constraint data{data_in<200};

//constructor
	function new();
	
	endfunction
	
//callbacks
	function void pre_randomize();
	
	endfunction

	function void post_randomize();
	
	endfunction*/

//copy methods	
	function void copy(sram_transaction trans);
		this.addr = trans.addr;
		this.wr = trans.wr;
		this.data_in= trans.data_in;
		this.data_out = trans.data_out;
	endfunction
	
//display method
	function void print(string comment);
		$display("---------------------------------------");
		$display("----%s-----",comment);
		$display("\t addr = %0d",addr);
		$display("\t data_in = %0d",data_in);
		$display("\t wr = %0d",wr);
		$display("\t data_out = %0d",data_out);
		$display("---------------------------------------");
	endfunction
endclass