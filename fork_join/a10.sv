module tb;
  initial begin
    for (int i=0; i<5; i++) begin
      fork
          $display("time=%0t, i=%0d", $time, i);
      join_any
      wait fork;
    end
  end
endmodule

//# time=0, i=0
//# time=0, i=1
//# time=0, i=2
//# time=0, i=3
//# time=0, i=4
