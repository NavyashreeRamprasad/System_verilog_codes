module tb;
  logic signed [3:0] a;
  logic signed [3:0] b;
  logic [3:0] ua;
  logic [3:0] ub;
  initial begin
    a = 4'b1000; // Decimal -8
    b = 4'b1000; // Decimal -8

    // 1. Logical Shift Assignment
    a >>= 2;     
    // Result: 4'b0100 (Decimal 4) - Vacated bit filled with 0

    // 2. Arithmetic Shift Assignment
    b >>>= 2;    
    // Result: 4'b1100 (Decimal -4) - Vacated bit filled with sign bit (1)
    
    $display("Logical result: %b", a);
    $display("Arithmetic result: %b", b);


	ua = 4'b1000; // Decimal 8
    ub = 4'b1000; // Decimal 8
    // 1. Logical Shift Assignment
    ua >>= 2; 
    // 2. Arithmetic Shift Assignment
    ub >>>= 2;      
	$display("Logical result: %b", ua);
    $display("Arithmetic result: %b", ub);
  end
endmodule

