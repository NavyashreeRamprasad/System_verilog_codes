module tb;
int arr[int];
int j;
int nextt;
int max_indx,max_val;

initial begin

for(int i=0;i<10;i++) begin
	j=$urandom_range(10,40);

	arr[j] = $urandom_range(200,300);
end
$display("arr=%p",arr);

arr.last(nextt);
for (int i=0;i<arr.num();i++) begin
	
	$display("arr[%0d] = %0d",nextt,arr[nextt]);
	arr.prev(nextt);
end

if(arr.first(nextt)) begin
	max_val=arr[nextt];
	while(arr.next(nextt)) begin
		if(arr[nextt]>max_val) begin
			max_val= arr[nextt];
		end
	end
end
$display("the maximum value is %0d",max_val);

if(arr.first(nextt)) begin
	max_indx=nextt;
	while(arr.next(nextt)) begin
		if(nextt>max_indx) begin
			max_indx= nextt;
		end
	end
end
$display("the maximum index value is %0d",max_indx);
end
endmodule
