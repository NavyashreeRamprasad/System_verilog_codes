`timescale 1ns/1ps

module tb;

time t;
realtime rt;

initial begin

    #15.25;
    $display("time     = %0t", $time);
    $display("realtime = %0f", $realtime);

end

endmodule
