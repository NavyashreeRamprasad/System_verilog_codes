module tb;
int var1;
int intA[100];
int intA1[200];
bit flag=1'b0;
bit exist_f=1'b0;
initial begin
var1= $urandom_range(100,200);
$display("var1 = %0d",var1);
for(int i=0;i<$size(intA);i++) begin
intA[i]=$urandom_range(100,300);
end
$display("intA = %p",intA);
for(int i=0;i<$size(intA1);i++) begin
intA1[i]=$urandom_range(100,300);
end
$display("intA1 = %p",intA1);

//foreach(intA[i]) begin
//if(var1==intA[i]) begin
//	flag=1'b1;
//	break;
//end
//end
//if(flag==1'b1) begin
//foreach(intA1[i]) begin
//		if(var1==intA1[i]) begin
//			exist_f=1'b1;
//			break;
//	end
//end
//end
if(var1 inside{intA} && var1 inside{intA1})
	exist_f=1'b1;
$display("exist_f = %b",exist_f);

end
endmodule
