module tb;
  initial begin
    for (int i=0; i<5; i++) begin
      int j;
      j = i;
      fork
        $display("time=%0t, j=%0d", $time, j);
      join_none
    end
  end
endmodule

//# time=0, j=4
// time=0, j=4
//time=0, j=4
// time=0, j=4
// time=0, j=4
