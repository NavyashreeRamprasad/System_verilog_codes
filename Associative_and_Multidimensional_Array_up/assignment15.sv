//62500
module tb;
reg [15:0] mem [62500];

task memory_initialize(); begin
for(int i=0;i<62500;i++)
mem[i]=0;
end
endtask

initial begin
memory_initialize();
$display("%p",mem);
end
endmodule
