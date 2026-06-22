module tb;

int arr1[5] = '{10,30,20,50,40};
int arr2[5];
int i;
int total;
int q[$];


// Task to display array
task display_array(input int a[5]);
    int j;
    for(j=0;j<$size(a);j++)
        $display("a[%0d] = %0d",j,a[j]);
endtask


initial begin

    // Accessing Elements
    $display("First Element = %0d",arr1[0]);
    $display("Last Element  = %0d",arr1[4]);

    // Updating Elements
    arr1[2] = 100;

    // Traversing using for loop
    $display("\nTraversal using for loop");
    for(i=0;i<5;i++)
        $display("arr1[%0d] = %0d",i,arr1[i]);

    // Traversing using foreach
    $display("\nTraversal using foreach");
    foreach(arr1[i])
        $display("arr1[%0d] = %0d",i,arr1[i]);

    // Array Copying / Assignment
    arr2 = arr1;

    $display("\nCopied Array");
    $display("%p",arr2);

    // Array Comparison
    if(arr1 == arr2)
        $display("\nArrays are Equal");
    else
        $display("\nArrays are Not Equal");

    // Sum Operation
    total = arr1.sum();
    $display("\nSum = %0d",total);

    // Min and Max
    $display("Minimum = %p",arr1.min());
    $display("Maximum = %p",arr1.max());

    // Sorting
    arr1.sort();
    $display("\nSorted Array = %p",arr1);

    // Reversing
    arr1.reverse();
    $display("Reversed Array = %p",arr1);

    // Searching
    q = arr1.find(x) with (x > 30);
    $display("\nElements Greater than 30 = %p",q);

    // Randomization
    foreach(arr2[i])
        arr2[i] = $urandom_range(1,100);

    $display("\nRandomized Array = %p",arr2);

    // Passing Array to Task
    $display("\nPassing Array to Task");
    display_array(arr1);

end

endmodule
