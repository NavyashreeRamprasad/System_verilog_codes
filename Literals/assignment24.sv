module tb;
string str="HELLO";
string rev="";

initial begin
 for (int i=str.len()-1;i>=0;i--) begin
rev={rev,str[i]};
 end

    $display("Original String = %0s", str);
    $display("Reversed String = %0s", rev);
end
endmodule
