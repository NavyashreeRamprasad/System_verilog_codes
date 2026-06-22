1)Fixed-size array
Size set at compile time, cannot be changed. Packed or unpacked.
✓ Synthesizable
logic [3:0] nibbles [8]; // unpacked, 8 elements
logic [7:0][3:0] packed_2d; // fully packed 2-D
supported operations:
-> a[i] - Element access by constant or variable index.
-> a[hi:lo] - Packed slice — e.g. data[7:4]. Only valid on packed dimensions.
-> $size(a,d) - Returns the number of elements in dimension d (1-indexed).
-> $left/$right - First/last index declared for that dimension.
-> $low/$high - Lower/upper bound of the dimension, regardless of direction.
-> $bits(a) - Total number of bits in the array.

2)Dynamic array
Heap-allocated, resizable 1-D unpacked array. Must be new'd before use.
✗ Not synthesizable
int d[];
d = new[8]; // allocate 8 ints
d = new[16](d); // resize, copy existing

Methods:
-> .size() - Returns current number of elements.
-> new[n] - Allocates n elements. Previous contents lost unless copy form used.
-> new[n](src) - Allocates n elements copying from src; extra elements zero-initialised.
-> delete() - Frees the array (size becomes 0). Equivalent to d = new[0]
-> .sort() - Sorts elements ascending in place.
-> .rsort() - Sorts elements descending in place.
-> .shuffle() - Randomises element order in place.
-> .reverse() - Reverses element order in place.
-> .sum() - Returns arithmetic sum of all elements.
-> .product() - Returns product of all elements.
-> .and() - Returns bitwise AND of all elements.
-> .or() - Returns bitwise OR of all elements.
-> .xor() - Returns bitwise XOR of all elements.
Array locator methods (return a queue)
-> .find(x) with (expr) - Returns elements where expr is true. x is the iterator variable.
-> .find_index(x) with (expr) - Returns indices of matching elements
-> .find_first(x) with (expr) - Returns first matching element.
-> .find_first_index(x) with (expr) - Returns index of first match.
-> .find_last(x) with (expr) - Returns last matching element.
-> .find_last_index(x) with (expr) - Returns index of last match.
-> .min() - Returns queue containing the minimum value element.
-> .max() - Returns queue containing the maximum value element.
-> .unique() - Returns queue of elements with duplicate values removed.
-> .unique_index() - Returns queue of indices of unique-value elements.

3) Queue array
Ordered, variable-size collection with O(1) push/pop at both ends. Automatically managed.
⚠ Partially synthesizable
int q[$]; // unbounded queue
int q[$:255]; // bounded to 256 elements
q = {1, 2, 3}; // literal initialisation

Methods:
->.push_back(val) - Appends val to the end (tail).
-> .push_front(val) - Prepends val at the beginning (head).
-> .pop_back() - Removes and returns the last element.
-> .pop_front() - Removes and returns the first element
-> .size() - Returns current number of elements.
-> .insert(i, val) - Inserts val at index i, shifting existing elements right.
-> .delete(i) - Deletes element at index i. If called with no arg, empties the queue.
-> .delete() - Empties the entire queue (size becomes 0).
Manipulation & reduction (inherited) 
-> .sort() / .rsort() - Sorts ascending / descending in place.
-> .shuffle() - Randomises element order.
-> .reverse() - Reverses element order.
-> .sum() / .product() - Arithmetic reduction over all elements
-> .and() / .or() / .xor() - Bitwise reductions.
Locator methods (same as dynamic array)
-> .find / .find_index - With clause — returns matching elements or indices.
-> .find_first / .find_last - First or last matching element / index.
-> .min() / .max() - Minimum / maximum element (as a queue).
-> .unique() / .unique_index() - Unique values or indices.

4)Associative array
Sparse, hash-like collection indexed by any integral, string, or class type key.
✗ Not synthesizable
int aa[string]; // string-keyed
int aa[bit[63:0]]; // 64-bit key
int aa[*]; // wildcard key (any integral)

Methods:
Element access
-> aa[key] - Access or create element. Reading a non-existent key returns the default value without creating it.
-> aa[key] = v - Write — creates the entry if absent.
Existence & deletion
-> .exists(key) - Returns 1 if key is present, 0 otherwise. Safe check before read.
-> .delete(key) - Removes the entry for key.
-> .delete() - Removes all entries (empties the array).
Traversal
-> .first(ref key) - Sets key to the smallest key present; returns 1 if non-empty.
-> .last(ref key) - Sets key to the largest key; returns 1 if non-empty.
-> .next(ref key) - Advances key to the next larger key; returns 1 if one exists.
-> .prev(ref key) - Moves key to the next smaller key; returns 1 if one exists.
-> .num() - Returns the number of entries currently stored.
-> .size() - Synonym for .num().
Manipulation & locator methods
-> .sort() / .rsort() - Sorts by value (keys remain associated).
-> .find / .find_index - Locator with clause — keys act as 'indices' in results.
-> .min() / .max() - Minimum / maximum value in the array.
-> .unique() - Values with duplicates removed.
-> .sum() / .product() / .and() / .or() / .xor() - Reductions over all stored values.


	2)list down the differences in array declarations in verilog and system verilog:
	Verilog:
    reg [7:0] data [0:7];        // index range [0:7] must be explicit
 
  SystemVerilog:
    logic [7:0] data [8];        // just write size [8], SV infers [0:7]

	3)Arrays vs Mailbox in SystemVerilog

1. **Purpose** — Arrays store and index data. Mailboxes are inter-process communication channels (producer → consumer).

2. **Thread safety** — Arrays are not thread-safe; concurrent access from multiple threads can corrupt data. Mailboxes are built-in thread-safe by design.

3. **Blocking behavior** — Arrays never block; reads and writes always return immediately. `mailbox.get()` blocks if empty, `mailbox.put()` blocks if the mailbox is bounded and full.

4. **Access pattern** — Arrays support random access via index (`arr[3]`). Mailboxes are strictly FIFO — no index, no random access.

5. **Data removal** — Reading an array element does not remove it. `get()` on a mailbox consumes and removes the item.

6. **Type** — Arrays are a language construct built into SV. Mailbox is a built-in class (`mailbox` or `mailbox #(T)`).

7. **Synthesizability** — Fixed-size arrays are synthesizable. Mailboxes are not synthesizable — verification only.

8. **Sizing** — Arrays have a fixed or explicitly managed size. Mailboxes can be unbounded (`new()`) or bounded (`new(N)`).

9. **Non-blocking variants** — Arrays have no such concept. Mailboxes provide `try_put()` and `try_get()` which return 0 instead of blocking.

10. **Peek support** — Arrays let you read without side effects freely. Mailboxes have `peek()` — reads the head item without consuming it.

11. **Type safety** — Arrays are always typed at declaration. Unparameterized `mailbox` is loosely typed (uses `$cast` internally); `mailbox #(T)` is type-safe.

12. **Item count query** — Arrays use `$size()` or `.size()`. Mailboxes use `.num()` to check how many items are currently waiting.

13. **Synchronisation** — Arrays provide no synchronisation between threads. Mailboxes act as a synchronisation primitive — the receiver naturally waits for the sender.

14. **Typical use case** — Arrays: lookup tables, memories, scoreboards, data storage. Mailboxes: generator→driver, monitor→scoreboard handoff in UVM testbenches.

	4)**Static vs Dynamic Arrays in SystemVerilog**

1. **Size** — Static arrays have a fixed size set at compile time. Dynamic arrays can be resized at runtime using `new[n]`.

2. **Declaration** — Static arrays specify the size in the declaration (`logic [7:0] arr [8]`). Dynamic arrays use empty brackets (`int arr[]`) and are allocated later.

3. **Memory allocation** — Static arrays are allocated at elaboration time (before simulation starts). Dynamic arrays are heap-allocated at runtime only when `new[]` is called.

4. **Synthesizability** — Static arrays are synthesizable. Dynamic arrays are not synthesizable — simulation/verification only.

5. **Built-in methods** — Static arrays have no built-in methods; only system functions like `$size()`, `$bits()`. Dynamic arrays support `.size()`, `.delete()`, `.sort()`, `.rsort()`, `.shuffle()`, `.reverse()`, locator methods like `.find()`, `.min()`, `.max()`, `.unique()`, and reduction methods like `.sum()`, `.and()`, `.or()`.

6. **Resizing** — Static arrays cannot be resized after declaration. Dynamic arrays can be resized any number of times using `new[n](old)` — the copy form preserves existing data.

7. **Default value** — Static arrays are initialised to `x` (for `logic`/`reg`) or `0` (for `bit`/`int`) automatically. Dynamic arrays are `null` until `new[]` is called — accessing before allocation causes a runtime error.

8. **Memory release** — Static arrays exist for the lifetime of the module/scope. Dynamic arrays can be freed explicitly with `.delete()`, releasing heap memory.

9. **Initialisation syntax** — Static arrays can be initialised inline with `'{v1, v2, ...}`. Dynamic arrays must be allocated first with `new[]`, then values assigned individually or via a loop.

10. **Passing to functions** — Static arrays are passed by value (copied) by default. Dynamic arrays passed to functions share the same handle unless explicitly copied with `new[n](src)`.

11. **Multi-dimensional** — Both support multi-dimensional declarations. Static: `int arr[4][8]`. Dynamic: `int arr[][]` — each inner dimension must be separately allocated with `new[]`.

12. **Index range** — Static arrays support both compact (`[8]`) and explicit range (`[0:7]`) syntax. Dynamic arrays only use compact `[]` with no range.

13. **Iteration** — Both support `foreach` and `for` loops. Dynamic arrays additionally work with all array locator methods directly.

14. **Use case** — Static arrays: RTL memories, lookup tables, fixed-size buffers. Dynamic arrays: testbench data structures where size is only known at runtime, like collecting variable-length packet data.
