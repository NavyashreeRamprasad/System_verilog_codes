module tb #(parameter type q_type = int, parameter int width = 8);
q_type queue[$:width];

initial begin
for(int i=0;i<width;i++)
	queue.push_front($urandom_range(30,80));
$display("queue= %p",queue);
for(int i=0;i<width-1;i++)
	queue.pop_back();
$display("queue= %p",queue);

end
endmodule

