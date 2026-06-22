module tb;
  initial begin
    for (int i=0; i<5; i++)begin
      fork
        $display(" i =%0d",i);
      join_none
    end
  end
endmodule

// i =5
//  i =5
//  i =5
//  i =5
// i =5

