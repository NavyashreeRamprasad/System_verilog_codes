module tb;
//int [3:0] arr;
bit [3] arr=3'b101;
initial begin
$display("%b",arr);
end
endmodule

In SystemVerilog, packed arrays behave like a single vector, so many operations can be performed on them.
id="r0w4na"
bit [7:0] a,b;
bit [15:0] c;

# 1. Assignment

id="8k7sh8"
a = 8'b10101010;
b = a;

# 2. Bitwise Operations

id="jlwm0g"
c = a & b;
c = a | b;
c = a ^ b;
c = ~a;

# 3. Arithmetic Operations

id="h4b9nl"
c = a + b;
c = a - b;
c = a * b;
c = a / b;

# 4. Shift Operations

id="h8m3xk"
a = a << 1;
a = a >> 2;
a = a <<< 1;
a = a >>> 1;

# 5. Relational Operations

id="0aj5vk"
if(a > b)
    $display("a greater");

# 6. Equality Operations

id="0x0p7d"
if(a == b)
    $display("equal");

if(a != b)
    $display("not equal");

# 7. Reduction Operations

These reduce all bits to a single bit.

id="nd0s0u"
&a;   // reduction AND
|a;   // reduction OR
^a;   // reduction XOR
~&a;
~|a;
~^a;

# 8. Concatenation

id="l8k5qz"
c = {a,b};

# 9. Replication

id="j8d3ra"
c = {4{2'b10}};


# 10. Part Select

id="h5w2me"
a[3:0]
a[7:4]

# 11. Bit Select

id="1b7s2m"
a[2]

# 12. Streaming Operations

id="3c8kqn"
c = {<<{a}};
c = {>>{a}};

# 13. Casting

id="a6m9xr"
int x;
x = int'(a);

# 14. Comparison with Case Equality

id="9q4vxm"
if(a === b)

# 15. Packing/Unpacking Structures

Packed arrays can be treated as contiguous bits.

id="m2v9pd"
typedef struct packed {
   bit [3:0] a;
   bit [3:0] b;
} pkt;

Packed arrays are heavily used in RTL design, buses, ALUs, registers, FSM encoding, and verification environments.


//UNPACKED ARRAYS

In SystemVerilog, **unpacked arrays** are stored as separate elements, unlike packed arrays which behave like one contiguous vector.
Because of this, some operations are allowed and some are not.

# Example of Unpacked Array

id="f7m2qp"
bit arr[3:0];


# Operations that CAN be performed on unpacked arrays

## 1. Element Access

id="r5k9sw"
arr[0] = 1;
arr[1] = 0;


## 2. Iteration

foreach(arr[i])
    $display(arr[i]);

---

## 3. Assignment Between Same Type Arrays

bit a[3:0];
bit b[3:0];

a = b;

---

## 4. Array Methods (dynamic/queue/associative)

arr.size();
arr.delete();


---

# Operations that CANNOT be performed

# (a) Whole Vector Arithmetic Operations Can’t Be Done

Unpacked arrays are not treated as a single vector.

## Incorrect

bit a[3:0];
bit b[3:0];
bit c[3:0];

c = a + b;

### Why?

`a` and `b` are collections of separate elements, not continuous bits.

---

## Correct Way

Operate element by element.

for(int i=0;i<4;i++)
    c[i] = a[i] + b[i];

---

# (b) Slicing Cannot Be Done

Part-select operations like `[3:1]` work only on packed arrays.

## Incorrect

bit arr[7:0];

$display(arr[3:1]);

This gives an error because unpacked arrays do not support vector slicing.

---

## Correct Way

Access elements individually.

$display(arr[3], arr[2], arr[1]);

---





