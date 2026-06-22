module tb;
int a=10;
int ans;
int b =40;
initial begin
$display("a= %0d",a);
//multiply by 4
ans = a<<2;
$display("multiply by 4 ans = %0d",ans);
$display("b= %0d",b);
//divide by 4
ans =b>>2;
$display("divide by 4 ans = %0d",ans);

end
endmodule
