module tb;
bit [4:0] c = 5'b01x0z;
logic [4:0] d = 5'b01x0z;
initial begin
$display("c=%b",c);
$display("d=%b",d);

 // Logical equality
    if(c == d)
        $display("Using == : Equal");
    else
        $display("Using == : Not Equal");

    // Case equality
    if(c === d)
        $display("Using === : Equal");
    else
        $display("Using === : Not Equal");
end
endmodule

//Output
//c=01000
//d=01x0z
//Using == : Not Equal
//Using === : Not Equal


