module top;
integer intA1[5],intA2[5];
integer intA3[5];
function sum(input integer int1,input integer int2,output integer add);
add= int1+int2;
endfunction

initial begin
for(int i=0;i<5;i++) begin
intA1[i]=$urandom_range(10,50);
intA2[i]=$urandom_range(20,50);
#1;
sum(intA1[i],intA2[i],intA3[i]);
end
$display("intA1=%p",intA1);
$display("intA2=%p",intA2);
$display("intA3=%p",intA3);
end
endmodule
