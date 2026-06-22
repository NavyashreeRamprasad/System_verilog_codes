module handshake #(parameter WIDTH = 8)
(
    input  logic clk,
    input  logic rst_n,

    input  logic valid,
    output logic ready,

    input  logic [WIDTH-1:0] data_in,
    output logic [WIDTH-1:0] data_out
);

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        ready    <= 0;
        data_out <= 0;
    end
    else begin
        ready <= 1;  // receiver ready

        // Handshake occurs only when both are asserted
        if(valid && ready)
            data_out <= data_in;
    end
end

endmodule

module tb;
parameter WIDTH =8;
    logic clk;
    logic rst_n;
	logic valid;
    logic ready;
	logic [WIDTH-1:0] data_in;
    logic [WIDTH-1:0] data_out;

handshake #(.WIDTH(WIDTH)) dut(clk,rst_n,valid,ready,data_in,data_out);

always #5 clk=~clk;

initial begin
$monitor("T=%0t valid=%0b ready=%0b data_out=%h",
              $time, valid, ready, data_out);

 clk = 0;
    rst_n = 0;
    valid = 0;
    data_in = 0;

    // Reset
    #10;
    rst_n = 1;

    // Transaction 1
   #10; 
    valid = 1;
    data_in = 8'hA5;

    // Transaction 2
	#10;
    data_in = 8'h3C;


    // No valid data
	#10;
    valid = 0;

    #100 $finish;
	end
endmodule

