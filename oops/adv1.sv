class pkt;
endclass

class good_pkt extends pkt;
endclass

module tb;
  pkt p;
  good_pkt gp;

  initial begin
    p = new();   // Base class object

    if ($cast(gp, p))
      $display("Cast Successful");
    else
      $display("Cast Failed");
  end
endmodule
