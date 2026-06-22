module tb;
int arr[100];
int repetition=0;
int count=0;
int value;
initial begin
while(count<100) begin
repetition=0;
value = $urandom_range(1,100);
	for(int j=0;j<=count;j++) begin
		if(arr[j]==value) begin
			repetition=1;
			break;
			end
	end
	if(!repetition) begin
		arr[count]=value;
		count++;
	end
end
$display("arr=%p",arr);
end
endmodule
