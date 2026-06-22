class test;

  bit num[50];
  rand int pos[$];

  constraint c_pos {
    pos.size() == 5;

    pos[0] == 2;

    foreach(pos[i])
      if(i > 0)
        pos[i] == pos[i-1] + i + 3;
  }

  function void post_randomize();
    foreach(num[i])
      num[i] = 0;

    foreach(pos[i])
      num[pos[i]] = 1;
  endfunction

endclass
