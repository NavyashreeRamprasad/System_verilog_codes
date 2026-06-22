module tb;
reg [7:0][9:0] multi_arr[8][6:0];

initial begin
for(int i=0;i<8;i++) begin
for(int j=0;j<7;j++) begin
multi_arr[i][j]=0;
end
end
//$display("%p",multi_arr);
for(int i=0;i<8;i++) begin
for(int j=0;j<7;j++) begin
$display("multi_arr[%0d][%0d]=%b",i,j,multi_arr[i][j]);
end
end

end
endmodule

//multi_arr[6]=560
//multi_arr[6][2]=80
//multi_arr[6][2][1]=10
//multi_arr[6][2][1][4]=1



