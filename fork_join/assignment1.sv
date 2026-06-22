module tb;

initial begin
//used for Multi-Port Packet Injection & Registration.
fork 
begin
#3 $display("%0t process 1",$time);//3
#5 $display("%0t process 2",$time);//8
end
#8 $display("%0t process 3",$time);//8
#12 $display("%0t process 5",$time);//12
join
$display("%0t  fork join executed",$time);//12

//used for Protocol Timeout Watchdog.
fork
begin
$display("%0t process 6",$time);//12
#3 $display("%0t process 7",$time);//15
end
#3 $display("%0t process 8",$time);//15
#9 $display("%0t process 9",$time);//21
join_any
$display("%0t  fork join_any executed",$time);//15

//used for Dynamic Interface Monitors & Heartbeat Trackers
fork
begin
$display("%0t process 10",$time);//15
#2 $display("%0t process 11",$time);//17
end
#3 $display("%0t process 12",$time);//18
#5 $display("%0t process 13",$time);//20
join_none
$display("%0t  fork join_none executed",$time);//15

//used for Cleaning up speculative threads / Error Recovery
disable fork;//15
$display("%0t fork diabled",$time);//15

end
endmodule

