module tb;

  string arr[string];
  string key, val;

  initial begin

    repeat(10) begin

    key = $sformatf("%c", $urandom_range(65, 90));
    val = $sformatf("%c", $urandom_range(65, 90));

    arr[key] = val;
end
    $display("arr = %p", arr);

  end

endmodule
