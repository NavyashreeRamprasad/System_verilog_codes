module tb #(parameter type q_type = reg [2:0], parameter int width = 3);
q_type queue[$:width];

initial begin
for(int i=0;i<width;i++)
	queue.push_front($urandom_range(30,80));
$display("queue= %p",queue);
for(int i=0;i<width-1;i++)
	queue.pop_front();
$display("queue= %p",queue);

end
endmodule

