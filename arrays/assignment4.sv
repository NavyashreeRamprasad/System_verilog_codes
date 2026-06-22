module tb;
int arr4 [5];
int arr5 [5];
initial begin
for(int i=0;i<$size(arr4);i++) begin
arr4[i]=$urandom_range(50,100);
end
$display("arr4= %p",arr4);
for(int j=0;j<$size(arr5);j++) begin
arr5[j]=$urandom_range(10,20);
end
$display("arr5= %p",arr5);
$display("\nComparison using foreach loop:");
    foreach(arr4[i]) begin
        if(arr4[i] == arr5[i])
            $display("Index %0d : Equal", i);
        else
            $display("Index %0d : Not Equal", i);
    end

for(int i=0;i<$size(arr4);i++) begin
arr5[i]=arr4[i];
end

$display("arr4= %p",arr4);
$display("arr5= %p",arr5);
$display("\nComparison using for loop:");
    for(int i = 0; i < 5; i++) begin
        if(arr4[i] == arr5[i])
            $display("Index %0d : Equal", i);
        else
            $display("Index %0d : Not Equal", i);
    end

/*$display("arr4= %p",arr4);
$display("using foreach");
foreach(arr4[i]) begin
$display("arr4[%0d]= %0d",i,arr4[i]);
end

$display("using for loop");
for(int i=0;i<$size(arr4);i++) begin
$display("arr4[%0d]= %0d",i,arr4[i]);
end*/

end
endmodule
