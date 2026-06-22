module filo;
integer intQ[$:10];

task put(input int data);
if(intQ.size()<10) begin
intQ.push_back(data);
$display("Inserted : %0d",data);
end
else
$display("FILO is full");
endtask

task get(output int data);
if(intQ.size()>0) begin
data=intQ.pop_back();
$display("Removed : %0d",data);
end
else
$display("FILO is empty");
endtask

endmodule

module top;
fifo i1();
integer num;

initial begin
for(int i=0;i<11;i++) begin
i1.put($urandom_range(10,30));
end
$display("FILO : %p",i1.intQ);
$display("Data coming out from FILO");
for(int i=0;i<11;i++) begin
i1.get(num);
end
$display("FILO : %p",i1.intQ);
end
endmodule
