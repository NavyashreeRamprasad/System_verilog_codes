/*module tb;
int p,q;
bit flag;
function comp(input int a,b , output bit flag);
if(a==b)
flag=1'b1;
else
flag = 1'b0;
endfunction
initial begin
repeat(5) begin
p=$urandom_range(1,9);
q=$urandom_range(1,8);
#1;
comp(p,q,flag);
$display("p=%0d, q =%0d , flag = %b",p,q,flag);
end
end
endmodule*/

module tb;
int p,q;
bit flag;
function bit comp(input int a,b);
if(a==b)
comp = 1'b1;
else
comp = 1'b0;
endfunction

initial begin
repeat(10) begin
p=$urandom_range(1,9);
q=$urandom_range(1,8);
#1;
flag=comp(p,q);
$display("p=%0d, q =%0d , flag = %b",p,q,flag);
end
end
endmodule
