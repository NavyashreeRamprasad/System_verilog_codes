module tb;
int arr[5]='{1,2,3,4,5};
string arr2[5];

initial begin
for(int i=0;i<$size(arr);i++) begin
//arr2[i]= string'(arr[i]); string casting works mainly with packed data/characters, not integer-to-decimal text conversion.
arr2[i]= $sformatf("%0d",arr[i]); 
end
$display("arr2=%p",arr2);
end
endmodule
