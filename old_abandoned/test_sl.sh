#!/bin/bash
# Bash script to tester for project get_next_line from 42 Core Curriculum, by maweiss | https://github.com/WSSMRKS

echo "Running the single line tests..."
echo "Compiling the files..."
ROUND=1
while [ $ROUND -le 4 ]; do
  if [ $ROUND == 1 ]
  then
    cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=1 gnl_main.c get_next_line.c get_next_line_utils.c
    echo "Tests with BUFFER_SIZE=1"
  elif [ $ROUND == 2 ]
  then
    cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=10 gnl_main.c get_next_line.c get_next_line_utils.c
    echo "Tests with BUFFER_SIZE=10"
  elif [ $ROUND == 3 ]
  then
    cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=100 gnl_main.c get_next_line.c get_next_line_utils.c
    echo "Tests with BUFFER_SIZE=100"
  elif [ $ROUND == 4 ]
  then
    cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=100000000 gnl_main.c get_next_line.c get_next_line_utils.c
    echo "Tests with BUFFER_SIZE=100000000"
  fi
  SUCCESS=1
  SF=1
  S="/dev/null"
  LFILE="logfile.txt"
  TFILE="1_line_nl.txt"
  ./a.out 1 $TFILE > $S
  if [ "$(diff $LFILE $TFILE)" == "" ]
  then
    echo "Test 1: OK!"
  else
    echo "Test 1: KO!"
    SUCCESS=0
    echo $SUCCESS
  fi
  TFILE="1_line_0.txt"
  ./a.out 1 $TFILE > $S
  if [ "$(diff $LFILE $TFILE)" == "" ]
  then
    echo "Test 2: OK!"
  else
    echo "Test 2: KO!"
    SUCCESS=0
  fi
  TFILE="1_line_long_nl.txt"
  ./a.out 1 $TFILE > $S
  if [ "$(diff $LFILE $TFILE)" == "" ]
  then
    echo "Test 3: OK!"
  else
    echo "Test 3: KO!"
    SUCCESS=0
  fi
  TFILE="1_line_long_0.txt"
  ./a.out 1 $TFILE > $S
  if [ "$(diff $LFILE $TFILE)" == "" ]
  then
    echo "Test 4: OK!"
  else
    echo "Test 4: KO!"
    SUCCESS=0
  fi
  TFILE="1_line_only_nl.txt"
  ./a.out 1 $TFILE > $S
  if [ "$(diff $LFILE $TFILE)" == "" ]
  then
    echo "Test 5: OK!"
  else
    echo "Test 5: KO!"
    SUCCESS=0
  fi
  TFILE="1_line_empty.txt"
  ./a.out 1 $TFILE > $S
  if [ "$(diff $LFILE $TFILE)" == "" ]
  then
    echo "Test 6: OK!"
  else
    echo "Test 6: KO!"
    SUCCESS=0
  fi
  if [ "$SUCCESS" == "1" ]
  then
    echo "All single line tests passed!"
  else
    echo "Some single line testss failed!"
    SF=0
  fi
  ((ROUND=ROUND+1))
done