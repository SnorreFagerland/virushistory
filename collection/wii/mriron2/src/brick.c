for( i=0;i != 0xFFFF;++i ) { // 0xFFFF = unmapped or blank memory
  for( j=0;j != 0xFFFF;++j) { // do the same here
    syscall(i,j); // call them both for mayhem
  }
}
