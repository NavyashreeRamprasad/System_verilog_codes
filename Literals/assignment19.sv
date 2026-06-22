module tb;

string s = "SystemVerilog";
int ch;
string sub;
string s1 = "HELLO";
string s2 = "hello";
int result;
initial begin
    $display("Length = %0d", s.len());
	s.putc(1,"E");
    $display("%s",s);
	s=s.toupper();
	$display("%s",s);
    ch = s.getc(0);
    $display("ASCII = %0d", ch);
	s = s.tolower();
    $display("%s", s);
	sub = s.substr(0,5);
    $display("%s", sub);

$display("for compare");
	result = s1.compare(s2);
    if(result == 0)
        $display("Strings are equal");
    else
        $display("Strings are NOT equal");

$display("for icompare");
	result = s1.icompare(s2);
    if(result == 0)
        $display("Strings are equal");
    else
        $display("Strings are NOT equal");
end

endmodule
