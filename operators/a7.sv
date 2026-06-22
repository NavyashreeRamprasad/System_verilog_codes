module tb;

logic [1:0] a,b;

initial begin
a=2'b1x;
b=2'b10;
$display("a=%b , b=%b for == we get the op as %b",a,b,a==b);

$display("a=%b , b=%b for === we get the op as %b",a,b,a===b);

a=2'bx1;
b=4'b10;
$display("a=%b , b=%b for == we get the op as %b",a,b,a==b);

$display("a=%b , b=%b for === we get the op as %b",a,b,a===b);
end
endmodule
