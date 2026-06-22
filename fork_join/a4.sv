module tb;
  static int j;
  initial begin
    for (int i=0; i<5; i++) begin
      fork
        j = i;
        $display("time=%0t, j=%0d", $time, j);
	  join_none
    end
  end
endmodule


//# time=0, j=5
//# time=0, j=5
//# time=0, j=5
//# time=0, j=5
//# time=0, j=5
