`include "a1.sv"
class stack_base;

   static int total_count;

endclass

class stack #(parameter DEPTH , parameter type T );
T stack_t [$:DEPTH-1];

function new();
      stack_base::total_count++;
endfunction

task put(T item);
stack_t.push_front(item);
endtask

task get(output T item);
item = stack_t.pop_front();
endtask

endclass


module top;
stack #(.DEPTH(16),.T(byte)) byte_stack;
stack #(.DEPTH(16),.T(string)) string_stack;
stack #(.DEPTH(16),.T(apb_tx)) apb_stack;
initial begin
apb_tx put_tx;
apb_tx get_tx;
apb_tx ref_q[$];

apb_stack = new();
//for apb_tx
repeat(10) begin
put_tx = new();
assert(put_tx.randomize());
 ref_q.push_front(put_tx); 
apb_stack.put(put_tx);
put_tx.print("put_tx");
end

//$display("pushed stack items = %p",apb_stack.stack_t);

repeat(10) begin
apb_stack.get(get_tx);
get_tx.print("get_tx");
    if(get_tx.compare(ref_q.pop_front()))
        $display("PASS");
    else
        $display("FAIL");
end
$display(stack_base::total_count);
end
endmodule
