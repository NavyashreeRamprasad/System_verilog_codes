module tb;
initial begin

fork:fork1
#1 $display("%0t, statement1",$time);
#1 $display("%0t, statement2",$time);
join_none
#1;
fork:fork2
$display("%0t, statement3",$time);
$display("%0t, statement4",$time);
join
disable fork1;

end
endmodule
