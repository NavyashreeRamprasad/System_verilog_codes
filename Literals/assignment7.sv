module tb;
string s="hello";
integer a [4:0] = {1,2,3,4,5};
string arr [2:0] = {"hi","how","are"};
realtime t=0.00;
int b[2:0][3:0] = {{1,2,3,4},{5,6,7,8},{9,10,11,12}};

initial begin
$display("string s =%0s",s);
$display("array a =%0p",a);
$display("array arr =%0p",arr);
$display("realtime t =%0f",t);
$display("array b =%0p",b);

end
endmodule

//int a[5] = '{default:10};
//'{10,10,10,10,10}

//int a[5] = '{0:5, 3:9, default:0};
//'{5,0,0,9,0}

//int a[5] = '{0:11, 1:22, 2:33, 3:44, 4:55};


//int a[5] = '{5{7}};
//'{7,7,7,7,7}


