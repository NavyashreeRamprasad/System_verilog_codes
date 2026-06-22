module tb;
int intadd;
real realadd;
logic [3:0] logicadd;
string concatenate;

function int add_int(input int a,b);
return a+b;
endfunction

function real add_real(input real a,b);
return a+b;
endfunction

function logic[3:0] add_logic(input logic[3:0] a,b);
return a+b;
endfunction

//function string add_str(input string a,b);
//return $sformatf("%0s",a+b);// fails as we cannot perform + on unpacked datatypes
//endfunction

initial begin
intadd=add_int(5,10);
realadd = add_real(3.0,6.2);
logicadd = add_logic(4'b0101,4'b1111);

//concatenate = add_str("Navya","shree");

$display("intadd = %0d",intadd);//15
$display("realadd = %0f",realadd);//9.2
$display("logicadd = %b",logicadd);//0100
//$display("concatenate = %0s",concatenate);//Navyashree

end
endmodule
