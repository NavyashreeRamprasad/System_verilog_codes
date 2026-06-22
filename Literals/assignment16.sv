module tb;

integer a;
int b;

initial begin

    // Assign x and z values
    a = 32'b1010x1z0;
    b = 32'b1010x1z0;

    // Display values
    $display("integer a = %b", a);
    $display("int     b = %b", b);

    // Random negative number between -50 and -70
    a = -($urandom_range(50,70));
    b = -($urandom_range(50,70));
    $display("Random negative value = %0d", a);
    $display("Random negative value = %0d", b);
end

endmodule
