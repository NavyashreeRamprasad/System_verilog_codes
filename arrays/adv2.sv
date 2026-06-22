module tb;
integer arr[];

initial begin
for(int i=0;i<10;i++) begin
arr[i]=$urandom_range(10,20);
$display("arr=%p",arr);
end
end
endmodule
