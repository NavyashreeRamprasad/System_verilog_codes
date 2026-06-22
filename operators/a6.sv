module tb;
int a,b,c,d,e,f,g,h,i,j,k,l;

initial begin
b=20;c=30;d=40;e=50;f=60;g=70;h=80;i=90;j=100;k=110;l=120;

a = (b==c)?d:(e==60)?g:(h==40)?i:(j==b)?k:l;

assert(a==120)
	$display("a = %0d , the expected value of a is received",a);

if(b==c) 
	a=d;
else if(e==60)
	a=g;
else if(h==40)
	a=i;
else if(j==b)
	a=k;
else
	a=l;
$display("using if else");

assert(a==120)
	$display("a = %0d , the expected value of a is received",a);


end

endmodule
