module tb;

    bit        a = 1'b1;
    bit [3:0]  b = 4'b1011;
    integer    num = 5;
bit [7:0] data = 8'b11111111;
    initial begin
 $display("a: %b", a); 
 $display("b: %b", b); 
 $display("num: %0d", num); 
 $display("data: %b", data); 
        //--------------------------------------------------------------------
        // 1. Unary Plus (+)
        //--------------------------------------------------------------------
        // Application:
        // Explicitly indicates positive value.
        // Mostly used for readability in arithmetic expressions.

        $display("Unary + : %0d", +num);   // +5


        //--------------------------------------------------------------------
        // 2. Unary Minus (-)
        //--------------------------------------------------------------------
        // Application:
        // Negates a number.
        // Used in arithmetic calculations, offsets, coordinate systems.

        $display("Unary - : %0d", -num);   // -5


        //--------------------------------------------------------------------
        // 3. Logical NOT (!)
        //--------------------------------------------------------------------
        // Application:
        // Used in IF conditions, reset checks, enable checks.
        // Converts TRUE->FALSE and FALSE->TRUE.

        $display("Logical NOT (!a) = %b", !a);

        if(!a)
            $display("a is FALSE");
        else
            $display("a is TRUE");

        $display("Logical NOT (!b) = %b", !b);

        if(!b)
            $display("b is FALSE");
        else
            $display("b is TRUE");

        //--------------------------------------------------------------------
        // 4. Bitwise NOT (~)
        //--------------------------------------------------------------------
        // Application:
        // Invert all bits.
        // Used in mask generation and complement operations.

        $display("Bitwise NOT (~b) = %b", ~b);


        //--------------------------------------------------------------------
        // 5. Reduction AND (&)
        //--------------------------------------------------------------------
        // Application:
        // Checks if ALL bits are 1.
        // Common in grant/ready/full flag generation.

        $display("Reduction AND (&b) = %b", &b);

        // Equivalent to:
        // b[3] & b[2] & b[1] & b[0]


        //--------------------------------------------------------------------
        // 6. Reduction NAND (~&)
        //--------------------------------------------------------------------
        // Application:
        // Checks if NOT(all bits are 1).
        // Often used in control logic.

        $display("Reduction NAND (~&b) = %b", ~&b);


        //--------------------------------------------------------------------
        // 7. Reduction OR (|)
        //--------------------------------------------------------------------
        // Application:
        // Checks if ANY bit is 1.
        // Used in interrupt detection and activity detection.

        $display("Reduction OR (|b) = %b", |b);

        // Equivalent to:
        // b[3] | b[2] | b[1] | b[0]


        //--------------------------------------------------------------------
        // 8. Reduction NOR (~|)
        //--------------------------------------------------------------------
        // Application:
        // Checks if ALL bits are 0.
        // Used for idle detection and zero detection.

        $display("Reduction NOR (~|b) = %b", ~|b);


        //--------------------------------------------------------------------
        // 9. Reduction XOR (^)
        //--------------------------------------------------------------------
        // Application:
        // Generates parity bit.
        // Very common in communication protocols.

        $display("Reduction XOR (^b) = %b", ^b);

        // Equivalent to:
        // b[3] ^ b[2] ^ b[1] ^ b[0]


        //--------------------------------------------------------------------
        // 10. Reduction XNOR (~^)
        //--------------------------------------------------------------------
        // Application:
        // Even parity generation/checking.

        $display("Reduction XNOR (~^b) = %b", ~^b);


        //--------------------------------------------------------------------
        // 11. Alternative XNOR (^~)
        //--------------------------------------------------------------------
        // Application:
        // Same as ~^
        // Supported for compatibility.

        $display("Reduction XNOR (^~b) = %b", ^~b);


        //--------------------------------------------------------------------
        // Example Applications Used in Verification
        //--------------------------------------------------------------------

        

        // Check all bits are 1
        if(&data)
            $display("PASS : All bits set");

        // Check any bit is active
        if(|data)
            $display("Activity detected");

        // Generate parity
        $display("Parity = %b", ^data);

        // Check vector is zero
        if(~|data)
            $display("Vector is zero");
        else
            $display("Vector is non-zero");

    end

endmodule

//	+	Explicit positive value
//	-	Negation, offset calculations
//	!	Reset checks, enable checks, condition inversion
//	~	Bit inversion, mask generation
//	&	Check if all bits are 1
//	~&	Check if not all bits are 1
//	^	Parity generation/checking
//	~^ / ^~	Even parity checking
