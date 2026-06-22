
//STRING IN VERILOG
1)	Verilog reg vector used as string
2)	Fixed size	
3)	Stored as packed array of bits
4)	Size must be declared	
5)	Difficult string manipulation	
6)	Example: reg [8*10:1] name;	
7)	No built-in methods	

//STRING IN SYSTEM VERILOG

1)SystemVerilog string data type
2)Dynamic size
3)Stored as sequence of characters
4)No need to declare size
5)Easy string handling methods
6)Example: string name;
7)Has methods like len(), toupper(), substr()


module tb;

reg [8*5:1] a = "HELLO";
string b = "HELLO";

initial begin
    $display("a = %s", a);
    $display("b = %s", b);
end

endmodule
