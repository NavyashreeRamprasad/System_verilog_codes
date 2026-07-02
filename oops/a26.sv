int g = 10;    // Global scope
int c =100;
class A;
  //int c = 20;  // Class scope

  function void display();
    int t = 30;  // Function scope
    int g = 20;
    $display("Global=%0d Class=%0d Function=%0d", g, c, t);
  endfunction
endclass

module tb;
  A obj;
  initial begin
    obj = new();
    obj.display();
  end
endmodule
