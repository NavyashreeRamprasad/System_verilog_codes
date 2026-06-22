module tb;
int a[4]='{1,2,3,4};
int b[4]='{5,6,7,8};
int c[8];
string str1="Navya";
string str2="shree";
string str3;

initial begin
$display("a= %p",a);
$display("b= %p",b);
c= {a,b};
$display("c= %p",c);

$display("string concatenation");

$display("str1= %s",str1);
$display("str2= %s",str2);
str3={str1,str2};
$display("str3= %s",str3);
end
endmodule
