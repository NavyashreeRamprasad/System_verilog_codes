module tb;
reg [2:0] a,b;
reg c;
initial begin
a=3'b1x0;
b=3'b101;
c=(a==?b);
$display("c= %b",c);
end
endmodule
