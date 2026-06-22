module tb;
typedef bit [3:0] nibble;
bit [127:0] data;
byte que[$];
nibble nib_que[$];


initial begin
data = $urandom;
$displayh("data = %0h",data);

//byte queue
que = {<<byte{data}}; //left streaming
$displayh("que = %p",que);
que = {>>byte{data}}; //right streaming
$displayh("que = %p",que);

//nibble queue
nib_que = {<<{data}}; //left streaming
$displayh("nib_que = %p",nib_que);
nib_que = {>>{data}}; //right streaming
$displayh("que = %p",nib_que);


end

endmodule
