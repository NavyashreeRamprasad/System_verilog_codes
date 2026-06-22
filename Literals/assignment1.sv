module top;
integer p,q;
integer add;
function sum(input integer int1,input integer int2,output integer add);
add= int1+int2;
endfunction

initial begin
repeat(5) begin
p=$urandom_range(10,50);
q=$urandom_range(20,50);
#1;
sum(p,q,add);
$display("p=%0d, q =%0d , sum = %0d",p,q,add);
end
end
endmodule
