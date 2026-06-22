module tb;
bit [3:0]a=4'b1011;

initial begin
$display("a= %b",a);
$display("!a= %b",!a);//0 logical inversion
$display("~a= %b",~a);//0100 bitwise inversion

end
endmodule
