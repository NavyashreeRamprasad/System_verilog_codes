module tb;
  initial begin
    for (int i=0; i<5; i++) begin
      fork
        begin
          automatic int j = i;
          $display("time=%0t, j=%0d", $time, j);
        end
      join_none
    end
  end
endmodule

//# time=0, j=5
//# time=0, j=5
//# time=0, j=5
//# time=0, j=5
//# time=0, j=5
