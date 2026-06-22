module tb;
  integer i;
  initial begin
    for (i=0; i<5; i++) begin
      fork
	 // begin
        #0;
        $display("time=%0t, i=%0d", $time, i);
      //end
	  join_none
    end
  end
endmodule


//# time=0, i=5
//# time=0, i=5
//# time=0, i=5
//# time=0, i=5
//# time=0, i=5
