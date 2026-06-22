class apb_tx;

	rand logic [7:0] addr;
	rand logic [15:0] wdata;
	rand logic wr_rd;
	logic rdata;

	function void print(input string name = "apb_tx",input int i=0);
		$display("-----%0t -> %s(%0d)------",$time,name,i);
		$display("addr = %0h",addr);
		$display("wdata = %0d",wdata);
		$display("wr_rd= %b",wr_rd);
		$display("rdata= %0d",rdata);
		endfunction
	
	function void copy(input apb_tx tx);
		addr=tx.addr;
		wdata = tx.wdata;
		wr_rd = tx.wr_rd;
		rdata = tx.rdata;
	endfunction

	function bit compare(input apb_tx tx);
		if(addr == tx.addr && wdata == tx.wdata && wr_rd == tx.wr_rd && rdata === tx.rdata )
		return 1;

		else
		return 0;
	endfunction

	constraint c1{
		addr%4==0;

		};

	endclass


	module tb;
		//apb_tx tx;
		typedef apb_tx arr_tx[5];
		typedef apb_tx arr_tx_2[5];
		initial begin
			arr_tx arr;
			arr_tx_2 arr2;
			foreach(arr[i])
				arr[i] = new();
			foreach(arr2[i])
				arr2[i] = new();
			//tx.randomize();
			//tx.print();
			foreach(arr[i]) begin
				arr[i]. randomize();
				arr[i].print("arr",i);
			end


			foreach(arr[i])
				arr2[i].copy(arr[i]);


			foreach(arr2[i]) begin
				//arr[i]. randomize();
				arr2[i].print("arr2",i);
			end


			foreach(arr[i])
				$display("are they equal = %b",arr[i].compare(arr2[i]));

		end
	endmodule
