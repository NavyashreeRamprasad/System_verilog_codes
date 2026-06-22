module tb;
int intDA1[5:1];
int intDA2[1:5];
initial begin

for(int i=1;i<=$size(intDA1);i++)
	intDA1[i]=$urandom_range(20,70);
for(int i=1;i<=$size(intDA1);i++)
	$display("intDA1[%0d] = %0d",i,intDA1[i]);

$display(" ");
intDA2=intDA1;
for(int i=1;i<=$size(intDA2);i++)
	$display("intDA2[%0d] = %0d",i,intDA2[i]);

end
endmodule

//intDA1[1] = 29
//intDA1[2] = 57
//intDA1[3] = 69
//intDA1[4] = 37
//intDA1[5] = 66
// 
//intDA2[1] = 66
//intDA2[2] = 37
//intDA2[3] = 69
//intDA2[4] = 57
//intDA2[5] = 29
