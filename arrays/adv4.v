module tb;
integer intQ[$];
initial begin
intQ.push_back(10);
$display("%p",intQ);
end
endmodule
