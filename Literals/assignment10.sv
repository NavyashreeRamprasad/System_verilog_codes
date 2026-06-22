module tb;
int a;
integer b;

initial begin
$display("integer b =%0d",b);//4 state default = x
$display("int a = %0d",a);//2 state default = 0
end
endmodule


/*bit datatype
Stores only 1 bit
Can hold:
0
1
It is a 2-state datatype (cannot store x or z)*/

/* byte datatype
Stores 8 bits
Signed by default
Range:
Signed: -128 to 127
Also a 2-state datatype */

//range of byte -> -128 to 127 (signed by default) 8 bits
//range of shortint -> -32768 to 32767 (16 bits , signed by default)


// range of 8 bit vector -> 0 to 255 (unsigned)
// range of byte -> -128 to 127 (because it is signed)

//bit -> 2 state datatype (0,1)
//logic -> 4 state datatype (0,1,x,z)

/*Datatype	Size	Default  Signedness	Value States	Default Value
    bit	      1       bit	  Unsigned	  2-state          	  0
   logic	  1       bit	  Unsigned	  4-state	          x
    reg	      1       bit	  Unsigned	  4-state	          x
   byte	      8       bits	  Signed	  2-state			  0
 shortint	  16      bits	  Signed	  2-state			  0
    int	      32 	  bits	  Signed	  2-state			  0
  longint	  64 	  bits	  Signed	  2-state			  0
  integer	  32 	  bits	  Signed	  4-state			  x
  time	      64      bits	  Unsigned	  4-state			  x */







