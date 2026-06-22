module tb;
logic [7:0] a= -35;

initial begin
$display("a=%0d a=%b",a,a); // a=221 a=11011101
end
endmodule
