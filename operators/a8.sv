module tb;

  reg [1:0] A;
  reg [1:0] B;
  
  logic result_std;
  logic result_wild;

  initial begin
    $display("=========================================================");
    $display("Testing Equality Operators with 'x' States");
    $display("=========================================================");

    // -------------------------------------------------------
    // CASE 1: No Common Value -> Output must be 0
    // -------------------------------------------------------
    A = 2'b1x; // Expands to: 2'b10 or 2'b11
    B = 2'b00; // No overlap possible with A
    
    result_std  = (A == B);
    result_wild = (A ==? B);
    
    $display("CASE 1 (No Common Value):");
    $display("Inputs: A = %b, B = %b", A, B);
    $display("  Standard Equality (A == B)  : %b (Expected: 0)", result_std);
    $display("  Wildcard Equality (A ==? B) : %b (Expected: 0)", result_wild);
    $display("-------------------------------------------------------");
    A = 2'b1x; // Expands to: 2'b10 or 2'b11
    B = 2'b10; // Overlaps with one of the possible states of A
    
    result_std  = (B == A);
    result_wild = (B ==? A);
    
    $display("CASE 2 (Has Common Value):");
    $display("Inputs: A = %b, B = %b", A, B);
    $display("  Standard Equality (B == A)  : %b (Expected: x)", result_std);
    $display("  Wildcard Equality (B ==? A) : %b (Expected: 1)", result_wild);
    $display("=========================================================");
  end

endmodule
