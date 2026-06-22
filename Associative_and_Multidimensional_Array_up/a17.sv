module tb;
int intA [2:0][3:0];
logic [4:0][5:0] array [7:0];

initial begin
for(int i=0;i<3;i++) begin
	for(int j=0;j<4;j++) begin
		intA[i][j]=$urandom_range(200,300);
	end
end
$display("intA= %p",intA);

for(int i=0;i<8;i++) begin
		array[i]=$urandom_range(200,300);
end

$display("array= %p",array);
//for(int i=0;i<8;i++) begin
//  		$display("array[%0d]= %0d",i,array[i]);
//end

end
endmodule
