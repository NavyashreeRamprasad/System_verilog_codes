module tb;

int a = 25;
int b = 10;

string str;

initial begin

    str = $sformatf("Value of a = %0d and b = %0d", a, b);

    $display("%0s", str);

end

endmodule
//$sformatf is a SystemVerilog system function used to format data into a string and return the formatted string.

//It works similar to $display, but instead of printing to the console, it stores the formatted output into a string variable.

/*$sformatf is commonly used for:
creating dynamic messages,
generating filenames,
logging,
debug messages,
scoreboard reporting in verification.
*/
