module tb;
bit a[7:0], b[7:0], c[7:0];

initial begin
c = a + b;      // invalid
$display("c= %p",c);
$display("%p",a[3:1]);         // invalid
end
endmodule

