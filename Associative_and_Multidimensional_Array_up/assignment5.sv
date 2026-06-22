module tb;
bit [3:0]bitA,bitB,bitC,bitD;
bit [1:0]bitslice;
initial begin
{bitA,bitB}=$random();
//bitB=&bitA;
//bitC=|bitA;
//bitD=^bitA;
bitC=bitA&bitB;
$display("AND : bitA=%b , bitB=%b , bitC=%b ",bitA,bitB,bitC);
bitC=bitA|bitB;
$display("OR : bitA=%b , bitB=%b , bitC=%b ",bitA,bitB,bitC);
bitC=bitA^bitB;
$display("XOR : bitA=%b , bitB=%b , bitC=%b ",bitA,bitB,bitC);
bitslice=bitC[3:2];
$display("slice : bitC=%b , bitslice=%b",bitC,bitslice);
end
endmodule
