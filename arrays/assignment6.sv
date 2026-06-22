module tb;
int intQ[$];
int intQ1[$:4];
int value;

initial begin
$display("queue 1");
for(int i=0;i<5;i++) begin
value=$urandom_range(50,100);
//$display("value = %0d",value);
intQ.push_back(value);
$display("intQ[%0d] = %0d",i,intQ[i]);
end


$display("queue 2");
for(int i=0;i<5;i++) begin
value=$urandom_range(10,20);
//$display("value = %0d",value);
intQ1.push_back(value);
$display("intQ1[%0d] = %0d",i,intQ1[i]);
end

for(int i=0;i<$size(intQ);i++) begin
intQ[i]=intQ1[i];
end

$display("using foreach");
foreach(intQ[i]) begin
if(intQ[i]==intQ1[i])
$display("intQ[%0d]=%0d , intQ1[%0d]=%0d ,equal",i,intQ[i],i,intQ1[i]);
else
$display("intQ[%0d]=%0d , intQ1[%0d]=%0d ,not equal",i,intQ[i],i,intQ1[i]);
end

/*$display("using for loop");
for(int i=0;i<$size(intQ);i++) begin
if(intQ[i]==intQ1[i])
$display("intQ[%0d]=%0d , intQ1[%0d]=%0d ,equal",i,intQ[i],i,intQ1[i]);
else
$display("intQ[%0d]=%0d , intQ1[%0d]=%0d ,not equal",i,intQ[i],i,intQ1[i]);
end*/


/*$display("foreach loop");
foreach(intQ[i]) begin
$display("intQ[%0d]=%0d",i,intQ[i]);
end

$display("for loop");
for(int i=0;i<$size(intQ);i++) begin
$display("intQ[%0d] = %0d",i,intQ[i]);
end

$display("packed format");
$display("intQ = %p",intQ);*/


end
endmodule
