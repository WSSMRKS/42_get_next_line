#!/bin/bash
# Bash script to tester for project get_next_line from 42 Core Curriculum, by maweiss | https://github.com/WSSMRKS

echo "Welcome to the automated Tester for the projext get_next_line of 42 Core Curriculum!"
echo "Please choose the test scenario:"
echo "1: Full test + Valgrind!"
echo "2: Full test including bonus + Valgrind!"
echo "3: Full test!"
echo "4: Full test including bonus!"
echo "5: Basic test with one line."
echo "6: Basic test with one file."
echo "7: Basic test reading from standard input."
echo "8: BONUS: Test for several different files at a time."
echo "0: Options for the tests."
echo "(all tests are performed with several different BUFFER_SIZES)"
echo "Type in your choice as a single digit!"
read line
if [ "$line" == "1" ]
then
  echo "You chose the full test + Valgrind!"
elif [ "$line" = '2' ]
then
  echo "You chose the full test including bonus + Valgind!"
elif [ "$line" = '3' ]
then
  echo "You chose the full test!"
elif [ "$line" = '4' ]
then
  echo "You chose the full test including bonus!"
elif [ "$line" = '5' ]
then
  echo "You chose the basic test with one line!"
elif [ "$line" = '6' ]
then
  echo "You chose the basic test with one file!"
elif [ "$line" = '7' ]
then
  echo "You chose the basic test reading from standard input!"
elif [ "$line" = '8' ]
then
  echo "You chose the BONUS: Test for several different files at a time!"
elif [ "$line" = '0' ]
then
  echo "Options for the tests:"
# [ ] Add Options
#   suspend Function output
#   Save detailed report
else
  echo "Invalid choice! Please type in a single digit!"
fi
if [ "$line" == "1" ]
then
  echo "You chose the full test including bonus!"
  echo "Running the single line tests..."
  echo "Compiling the files..."
  VALGRIND=0
  SUCCESS=1
  SF=1
  S="/dev/null"
  LFILE="logfile.txt"
  TFILE="1_line_nl.txt"
  PROG="./a.out"
  ARG1="1"
  VAL="valgrind"
  while [ $VALGRIND -le 1 ]; do
    if [ $VALGRIND == 0 ]
    then
      EXEC=$($PROG $ARGS)
    fi
    if [ $VALGRIND == 1 ]
    then
      EXEC=$(valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes $($PROG $ARGS))
    fi
    ROUND=1
    while [ $ROUND -le 4 ]; do
      if [ $ROUND == 1 ]
      then
        cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=1 gnl_main.c get_next_line.c get_next_line_utils.c
        echo "Tests with BUFFER_SIZE=1:"
      elif [ $ROUND == 2 ]
      then
        cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=10 gnl_main.c get_next_line.c get_next_line_utils.c
        echo "Tests with BUFFER_SIZE=10:"
      elif [ $ROUND == 3 ]
      then
        cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=100 gnl_main.c get_next_line.c get_next_line_utils.c
        echo "Tests with BUFFER_SIZE=100:"
      elif [ $ROUND == 4 ]
      then
        cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=100000000 gnl_main.c get_next_line.c get_next_line_utils.c
        echo "Tests with BUFFER_SIZE=100000000:"
      fi
      TFILE="1_line_nl.txt"
      ./a.out 1 $TFILE > $S
      if [ "$(diff $LFILE $TFILE)" == "" ]
      then
        echo "Test 1: OK!"
      else
        echo "Test 1: KO!"
        SUCCESS=0
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
  ((VALGRIND=VALGRIND+1))
      ROUND=1
    while [ $ROUND -le 4 ]; do
      if [ $ROUND == 1 ]
      then
        cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=1 gnl_main.c get_next_line.c get_next_line_utils.c
        echo "Tests with BUFFER_SIZE=1:"
      elif [ $ROUND == 2 ]
      then
        cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=10 gnl_main.c get_next_line.c get_next_line_utils.c
        echo "Tests with BUFFER_SIZE=10:"
      elif [ $ROUND == 3 ]
      then
        cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=100 gnl_main.c get_next_line.c get_next_line_utils.c
        echo "Tests with BUFFER_SIZE=100:"
      elif [ $ROUND == 4 ]
      then
        cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=100000000 gnl_main.c get_next_line.c get_next_line_utils.c
        echo "Tests with BUFFER_SIZE=100000000:"
      fi
      TFILE="1_line_nl.txt"
      valgrind --leak-check=full ./a.out 1 $TFILE > $S
      if [ "$(diff $LFILE $TFILE)" == "" ]
      then
        echo "Test 1: OK!"
      else
        echo "Test 1: KO!"
        SUCCESS=0
      fi
      TFILE="1_line_0.txt"
      valgrind --leak-check=full ./a.out 1 $TFILE > $S
      if [ "$(diff $LFILE $TFILE)" == "" ]
      then
        echo "Test 2: OK!"
      else
        echo "Test 2: KO!"
        SUCCESS=0
      fi
      TFILE="1_line_long_nl.txt"
      valgrind --leak-check=full ./a.out 1 $TFILE > $S
      if [ "$(diff $LFILE $TFILE)" == "" ]
      then
        echo "Test 3: OK!"
      else
        echo "Test 3: KO!"
        SUCCESS=0
      fi
      TFILE="1_line_long_0.txt"
      valgrind --leak-check=full ./a.out 1 $TFILE > $S
      if [ "$(diff $LFILE $TFILE)" == "" ]
      then
        echo "Test 4: OK!"
      else
        echo "Test 4: KO!"
        SUCCESS=0
      fi
      TFILE="1_line_only_nl.txt"
      valgrind --leak-check=full ./a.out 1 $TFILE > $S
      if [ "$(diff $LFILE $TFILE)" == "" ]
      then
        echo "Test 5: OK!"
      else
        echo "Test 5: KO!"
        SUCCESS=0
      fi
      TFILE="1_line_empty.txt"
      valgrind --leak-check=full ./a.out 1 $TFILE > $S
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
  echo "Running the single line tests with Valgrind..."
  done
  echo "Running the single file tests..."
  
# elif [ "$line" == "2" ]
# then
#   ./a.out 2 "example.txt"
# elif [ "$line" == "3" ]
# then
#   ./a.out 3 "example.txt"
# elif [ "$line" == "4" ]
# then
#   ./a.out 4 "example.txt"
# elif [ "$line" == "5" ]
# then
#   ./a.out 5 "example.txt"
# elif [ "$line" == "6" ]
# then
#   ./a.out 6 "example.txt"
fi