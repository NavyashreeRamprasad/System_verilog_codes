module tb;
integer fd,out_fd;
string str;
real num;
real sum;
int n;
real arr[];

initial begin

fd = $fopen("number.txt","r");

    if(fd == 0) begin
        $display("ERROR : File not found");
        $finish;
    end
    while($fgets(str,fd)) begin
        $display("%0s",str);
		num = str.atoreal();
		arr=new[n+1](arr);
		arr[n]=num;
		$display("%0f",num);
		sum =sum+num;
		n++;
    end
		$display("array elements are %p",arr);
		$display("sum of %0d numbers is %0f",n,sum);
		$display("avg = %0f",sum/n);
    	$display("minimum number = %0f",arr.min());
    	$display("maximum number = %0f",arr.max());
		arr.sort();
		$display("sorted array %p",arr);
	$fclose(fd);
	
	out_fd = $fopen("array_output.txt","w");

    if(out_fd == 0) begin
        $display("ERROR : Cannot create file");
        $finish;
    end

    foreach(arr[i]) begin
        $fdisplay(out_fd, "%0f", arr[i]);
    end

    $fclose(out_fd);
	
end
endmodule
