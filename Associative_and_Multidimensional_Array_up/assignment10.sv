module tb;
int arr[100];
int value;
initial begin
	for(int i=0;i<100;i++) begin
		value = $urandom_range(1,100);
		arr[i]=value;
	end
$display("arr=%p",arr);
end
endmodule
