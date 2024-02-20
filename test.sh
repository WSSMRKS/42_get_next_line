#!/bin/bash
# Bash script of tester for project get_next_line from 42 Core Curriculum, by maweiss | https://github.com/WSSMRKS

	echo "Welcome to the automated Tester for get_next_line of 42 Core Curriculum!"
	echo "To run correctly the source files of the tester need to be put in the Project foler!"
	echo "The source files are: test.sh gnl_tester.c test_src/"
	echo "Results of the tests will be stored in: logfile.txt!"
	echo "Please choose the test scenario:"
	echo "1: Full test + Valgrind!"
	# echo "2: Full test including bonus + Valgrind!"
	# echo "3: Full test!"
	# echo "4: Full test including bonus!"
	# echo "5: Basic test with one line."
	# echo "6: Basic test with one file."
	# echo "7: Basic test reading from standard input."
	# echo "8: BONUS: Test for several different files at a time."
	# echo "0: Options for the tests."
	echo "(all tests are performed with several different BUFFER_SIZES)"
	echo "Type in your choice as a single digit!"
	read line
	rm logfile.txt
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
	#   test only specific Cases
	#	turn Testcases on and of
	else
		echo "Invalid choice! Please type in a single digit!"
	fi
	if [ "$line" == "1" ] || [ "$line" == "3" ]
	then
		# if [ "$line" == "1" ]
		# then
		# 	VALGRIND=1
		# 	echo "Running the single line tests including Valgrind!"
		# 	LEAK_CHECK="full"
		# else
		# 	VALGRIND=0
		# 	echo "Running the single line tests..."
		# fi
		# echo "Compiling the files..."
		# SUCCESS=1
		# SF=1
		# S="/dev/null"
		# LFILE="tmp.txt"
		# LOGFILE="logfile.txt"
		# ROUND=1
		# while [ $ROUND -le 4 ]; do
		# 	if [ $ROUND == 1 ]
		# 	then
		# 	BUFFER_SIZE=1
		# 	elif [ $ROUND == 2 ]
		# 	then
		# 	BUFFER_SIZE=10
		# 	elif [ $ROUND == 3 ]
		# 	then
		# 	BUFFER_SIZE=100
		# 	elif [ $ROUND == 4 ]
		# 	then
		# 	BUFFER_SIZE=100000000
		# 	fi
		# 	cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c
		# 	echo "Tests with BUFFER_SIZE=$BUFFER_SIZE:"
		# 	TFILE="test_src/1_line_nl.txt"
		# 	if [ $VALGRIND == 1 ]
		# 	then
		# 	valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S
		# 	else
		# 	./a.out 1 $TFILE > $S
		# 	fi
		# 	if [ $? == 5 ]
		# 	then
		# 	echo "valgrind error!"
		# 	echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
		# 	echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	elif [ $? == 0 ]
		# 	then
		# 	echo "program error"
		# 	echo "./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	elif [ $? == 1 ]
		# 	then
		# 	echo "Return value OK!" | tee -a $LOGFILE
		# 	else
		# 	echo "Return value undefined"
		# 	fi
		# 	if [ "$(diff $LFILE $TFILE)" == "" ]
		# 	then
		# 	echo "Diff 1: OK! (\"$TFILE\")" | tee -a $LOGFILE
		# 	else
		# 	echo "Diff 1: KO!"
		# 	echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
		# 	if [ $VALGRIND == 1 ]
		# 	then
		# 	echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	else
		# 	echo "./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	fi
		# 	SUCCESS=0
		# 	fi
		# 	TFILE="test_src/1_line_0.txt"
		# 	if [ $VALGRIND == 1 ]
		# 	then
		# 	valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S
		# 	else
		# 	./a.out 1 $TFILE > $S
		# 	fi
		# 	if [ $? == 5 ]
		# 	then
		# 	echo "valgrind error!"
		# 	echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
		# 	echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	elif [ $? == 0 ]
		# 	then
		# 	echo "program error"
		# 	echo "./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	elif [ $? == 1 ]
		# 	then
		# 	echo "Return value OK!" | tee -a $LOGFILE
		# 	else
		# 	echo "Return value undefined"
		# 	fi
		# 	if [ "$(diff $LFILE $TFILE)" == "" ]
		# 	then
		# 	echo "Diff 2: OK! \(\"$TFILE"\)" | tee -a $LOGFILE
		# 	else
		# 	echo "Diff 2: KO!"
		# 	echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
		# 	if [ $VALGRIND == 1 ]
		# 	then
		# 	echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	else
		# 	echo "./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	fi
		# 	SUCCESS=0
		# 	fi
		# 	TFILE="test_src/1_line_long_nl.txt"
		# 	if [ $VALGRIND == 1 ]
		# 	then
		# 	valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S
		# 	else
		# 	./a.out 1 $TFILE > $S
		# 	fi
		# 	if [ $? == 5 ]
		# 	then
		# 	echo "valgrind error!"
		# 	echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
		# 	echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	elif [ $? == 0 ]
		# 	then
		# 	echo "program error"
		# 	echo "./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	elif [ $? == 1 ]
		# 	then
		# 	echo "Return value OK!" | tee -a $LOGFILE
		# 	else
		# 	echo "Return value undefined"
		# 	fi
		# 	if [ "$(diff $LFILE $TFILE)" == "" ]
		# 	then
		# 	echo "Diff 3: OK! \(\"$TFILE"\)" | tee -a $LOGFILE
		# 	else
		# 	echo "Diff 3: KO!"
		# 	echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
		# 	if [ $VALGRIND == 1 ]
		# 	then
		# 	echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	else
		# 	echo "./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	fi
		# 	SUCCESS=0
		# 	fi
		# 	TFILE="test_src/1_line_long_0.txt"
		# 	if [ $VALGRIND == 1 ]
		# 	then
		# 	valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S
		# 	else
		# 	./a.out 1 $TFILE > $S
		# 	fi
		# 	if [ $? == 5 ]
		# 	then
		# 	echo "valgrind error!"
		# 	echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
		# 	echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	elif [ $? == 0 ]
		# 	then
		# 	echo "program error"
		# 	echo "./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	elif [ $? == 1 ]
		# 	then
		# 	echo "Return value OK!" | tee -a $LOGFILE
		# 	else
		# 	echo "Return value undefined"
		# 	fi
		# 	if [ "$(diff $LFILE $TFILE)" == "" ]
		# 	then
		# 	echo "Diff 4: OK! \(\"$TFILE"\)" | tee -a $LOGFILE
		# 	else
		# 	echo "Diff 4: KO!"
		# 	echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
		# 	if [ $VALGRIND == 1 ]
		# 	then
		# 	echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	else
		# 	echo "./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	fi
		# 	SUCCESS=0
		# 	fi
		# 	TFILE="test_src/1_line_only_nl.txt"
		# 	if [ $VALGRIND == 1 ]
		# 	then
		# 	valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S
		# 	else
		# 	./a.out 1 $TFILE > $S
		# 	fi
		# 	if [ $? == 5 ]
		# 	then
		# 	echo "valgrind error!"
		# 	echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
		# 	echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	elif [ $? == 0 ]
		# 	then
		# 	echo "program error"
		# 	echo "./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	elif [ $? == 1 ]
		# 	then
		# 	echo "Return value OK!" | tee -a $LOGFILE
		# 	else
		# 	echo "Return value undefined"
		# 	fi
		# 	if [ "$(diff $LFILE $TFILE)" == "" ]
		# 	then
		# 	echo "Diff 5: OK! \(\"$TFILE"\)" | tee -a $LOGFILE
		# 	else
		# 	echo "Diff 5: KO!"
		# 	echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
		# 	if [ $VALGRIND == 1 ]
		# 	then
		# 	echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	else
		# 	echo "./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	fi
		# 	SUCCESS=0
		# 	fi
		# 	TFILE="test_src/1_line_empty.txt"
		# 	if [ $VALGRIND == 1 ]
		# 	then
		# 	valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S
		# 	else
		# 	./a.out 1 $TFILE > $S
		# 	fi
		# 	if [ $? == 5 ]
		# 	then
		# 	echo "valgrind error!"
		# 	echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
		# 	echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	elif [ $? == 0 ]
		# 	then
		# 	echo "program error"
		# 	echo "./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	elif [ $? == 1 ]
		# 	then
		# 	echo "Return value OK!" | tee -a $LOGFILE
		# 	else
		# 	echo "Return value undefined"
		# 	fi
		# 	if [ "$(diff $LFILE $TFILE)" == "" ]
		# 	then
		# 	echo "Diff 6: OK! \(\"$TFILE"\)" | tee -a $LOGFILE
		# 	else
		# 	echo "Diff 6: KO!"
		# 	echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
		# 	if [ $VALGRIND == 1 ]
		# 	then
		# 	echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	else
		# 	echo "./a.out 1 $TFILE > $S" >> $LOGFILE
		# 	fi
		# 	SUCCESS=0
		# 	fi
		# 	if [ "$SUCCESS" == "1" ]
		# 	then
		# 	echo "All single line tests passed!"
		# 	else
		# 	echo "Some single line testss failed!"
		# 	SF=0
		# 	fi
		# 	((ROUND=ROUND+1))
		# done
		# Single line done!

		if [ "$line" == "1" ]
		then
			VALGRIND=1
			echo "Running the single file tests including Valgrind!"
			LEAK_CHECK="full"
		else
			VALGRIND=0
			echo "Running the single file tests..."
		fi
		echo "Compiling the files..."
		SUCCESS=1
		SF=1
		S="/dev/null"
		LFILE="tmp.txt"
		LOGFILE="logfile.txt"
		ROUND=1
		while [ $ROUND -le 6 ]; do
			if [ $ROUND == 1 ]
			then
			BUFFER_SIZE=1
			elif [ $ROUND == 2 ]
			then
			BUFFER_SIZE=41
			elif [ $ROUND == 3 ]
			then
			BUFFER_SIZE=42
			elif [ $ROUND == 4 ]
			then
			BUFFER_SIZE=43
			elif [ $ROUND == 5 ]
			then
			BUFFER_SIZE=100
			elif [ $ROUND == 6 ]
			then
			BUFFER_SIZE=1000000
			fi
			cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c
			echo "Tests with BUFFER_SIZE=$BUFFER_SIZE:" | tee -a $LOGFILE
			TFILE="test_src/2_file_5_lines.txt"
			if [ $VALGRIND == 1 ]
			then
			valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=full ./a.out 2 $TFILE > $S
			else
			./a.out 2 $TFILE > $S
			fi
			if [ $? == 5 ]
			then
			echo "valgrind error!"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 0 ]
			then
			echo "program error"
			echo "./a.out 1 $TFILE > $S" >> $LOGFILE
			elif [ $? == 1 ]
			then
			echo "Return value OK!" | tee -a $LOGFILE
			else
			echo "Return value undefined"
			fi
			if [ "$(diff $LFILE $TFILE)" == "" ]
			then
			echo "Diff 0: OK! (\"$TFILE\")" | tee -a $LOGFILE
			else
			echo "Diff 0: KO! (\"$TFILE\")"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			if [ $VALGRIND == 1 ]
			then
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			else
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			fi
			SUCCESS=0
			fi
			TFILE="test_src/42_with_nl"
			if [ $VALGRIND == 1 ]
			then
			valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 "$TFILE" > "$S"
			else
			./a.out 2 "$TFILE" > "$S"
			fi
			if [ $? == 5 ]
			then
			echo "valgrind error!"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 0 ]
			then
			echo "program error"
			echo "./a.out 1 $TFILE > $S" >> $LOGFILE
			elif [ $? == 1 ]
			then
			echo "Return value OK!" | tee -a $LOGFILE
			else
			echo "Return value undefined"
			fi
			if [ "$(diff $LFILE $TFILE)" == "" ]
			then
			echo "Diff 1: OK! (\"$TFILE\")" | tee -a $LOGFILE
			else
			echo "Diff 1: KO! (\"$TFILE\")"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			if [ $VALGRIND == 1 ]
			then
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			else
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			fi
			SUCCESS=0
			fi
			TFILE="test_src/1_line_0.txt"
			if [ $VALGRIND == 1 ]
			then
			valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 "$TFILE" > "$S"
			else
			./a.out 2 "$TFILE" > "$S"
			fi
			if [ $? == 5 ]
			then
			echo "valgrind error!"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 0 ]
			then
			echo "program error"
			echo "./a.out 1 $TFILE > $S" >> $LOGFILE
			elif [ $? == 1 ]
			then
			echo "Return value OK!" | tee -a $LOGFILE
			else
			echo "Return value undefined"
			fi
			if [ "$(diff $LFILE $TFILE)" == "" ]
			then
			echo "Diff 2: OK! (\"$TFILE\")" | tee -a $LOGFILE
			else
			echo "Diff 2: KO! (\"$TFILE\")"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			if [ $VALGRIND == 1 ]
			then
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			else
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			fi
			SUCCESS=0
			fi
			TFILE="test_src/1_line_long_nl.txt"
			if [ $VALGRIND == 1 ]
			then
			valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S
			else
			./a.out 2 $TFILE > $S
			fi
			if [ $? == 5 ]
			then
			echo "valgrind error!"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 0 ]
			then
			echo "program error"
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 1 ]
			then
			echo "Return value OK!" | tee -a $LOGFILE
			else
			echo "Return value undefined"
			fi
			if [ "$(diff $LFILE $TFILE)" == "" ]
			then
			echo "Diff 3: OK! (\"$TFILE\")" | tee -a $LOGFILE
			else
			echo "Diff 3: KO! (\"$TFILE\")"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			if [ $VALGRIND == 1 ]
			then
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			else
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			fi
			SUCCESS=0
			fi
			TFILE="test_src/1_line_long_0.txt"
			if [ $VALGRIND == 1 ]
			then
			valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S
			else
			./a.out 2 $TFILE > $S
			fi
			if [ $? == 5 ]
			then
			echo "valgrind error!"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 0 ]
			then
			echo "program error"
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 1 ]
			then
			echo "Return value OK!" | tee -a $LOGFILE
			else
			echo "Return value undefined"
			fi
			if [ "$(diff $LFILE $TFILE)" == "" ]
			then
			echo "Diff 4: OK! (\"$TFILE\")" | tee -a $LOGFILE
			else
			echo "Diff 4: KO! (\"$TFILE\")"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			if [ $VALGRIND == 1 ]
			then
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			else
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			fi
			SUCCESS=0
			fi
			TFILE="test_src/1_line_only_nl.txt"
			if [ $VALGRIND == 1 ]
			then
			valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S
			else
			./a.out 2 $TFILE > $S
			fi
			if [ $? == 5 ]
			then
			echo "valgrind error!"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 0 ]
			then
			echo "program error"
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 1 ]
			then
			echo "Return value OK!" | tee -a $LOGFILE
			else
			echo "Return value undefined"
			fi
			if [ "$(diff $LFILE $TFILE)" == "" ]
			then
			echo "Diff 5: OK! (\"$TFILE\")" | tee -a $LOGFILE
			else
			echo "Diff 5: KO! (\"$TFILE\")"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			if [ $VALGRIND == 1 ]
			then
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			else
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			fi
			SUCCESS=0
			fi
			TFILE="test_src/1_line_empty.txt"
			if [ $VALGRIND == 1 ]
			then
			valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S
			else
			./a.out 2 $TFILE > $S
			fi
			if [ $? == 5 ]
			then
			echo "valgrind error!"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 0 ]
			then
			echo "program error"
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 1 ]
			then
			echo "Return value OK!" | tee -a $LOGFILE
			else
			echo "Return value undefined"
			fi
			if [ "$(diff $LFILE $TFILE)" == "" ]
			then
			echo "Diff 6: OK! (\"$TFILE\")" | tee -a $LOGFILE
			else
			echo "Diff 6: KO! (\"$TFILE\")"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			if [ $VALGRIND == 1 ]
			then
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			else
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			fi
			SUCCESS=0
			fi
			TFILE="test_src/2_file_1longline.txt"
			if [ $VALGRIND == 1 ]
			then
			valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S
			else
			./a.out 2 $TFILE > $S
			fi
			if [ $? == 5 ]
			then
			echo "valgrind error!"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 0 ]
			then
			echo "program error"
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 1 ]
			then
			echo "Return value OK!" | tee -a $LOGFILE
			else
			echo "Return value undefined"
			fi
			if [ "$(diff $LFILE $TFILE)" == "" ]
			then
			echo "Diff 7: OK! (\"$TFILE\")" | tee -a $LOGFILE
			else
			echo "Diff 7: KO! (\"$TFILE\")"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			if [ $VALGRIND == 1 ]
			then
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			else
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			fi
			SUCCESS=0
			fi
			TFILE="test_src/2_file_5nl.txt"
			if [ $VALGRIND == 1 ]
			then
			valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S
			else
			./a.out 2 $TFILE > $S
			fi
			if [ $? == 5 ]
			then
			echo "valgrind error!"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 0 ]
			then
			echo "program error"
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 1 ]
			then
			echo "Return value OK!" | tee -a $LOGFILE
			else
			echo "Return value undefined"
			fi
			if [ "$(diff $LFILE $TFILE)" == "" ]
			then
			echo "Diff 8: OK! (\"$TFILE\")" | tee -a $LOGFILE
			else
			echo "Diff 8: KO! (\"$TFILE\")"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			if [ $VALGRIND == 1 ]
			then
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			else
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			fi
			SUCCESS=0
			fi
			TFILE="test_src/2_file_10_long_lines.txt"
			if [ $VALGRIND == 1 ]
			then
			valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S
			else
			./a.out 2 $TFILE > $S
			fi
			if [ $? == 5 ]
			then
			echo "valgrind error!"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 0 ]
			then
			echo "program error"
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 1 ]
			then
			echo "Return value OK!" | tee -a $LOGFILE
			else
			echo "Return value undefined"
			fi
			if [ "$(diff $LFILE $TFILE)" == "" ]
			then
			echo "Diff 9: OK! (\"$TFILE\")" | tee -a $LOGFILE
			else
			echo "Diff 9: KO! (\"$TFILE\")"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			if [ $VALGRIND == 1 ]
			then
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			else
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			fi
			SUCCESS=0
			fi
			TFILE="test_src/2_file_100lines.txt"
			if [ $VALGRIND == 1 ]
			then
			valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S
			else
			./a.out 2 $TFILE > $S
			fi
			if [ $? == 5 ]
			then
			echo "valgrind error!"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			SUCCESS=0
			elif [ $? == 0 ]
			then
			echo "program error"
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			SUCCESS=0
			elif [ $? == 1 ]
			then
			echo "Return value OK!" | tee -a $LOGFILE
			else
			echo "Return value undefined"
			SUCCESS=0
			fi
			if [ "$(diff $LFILE $TFILE)" == "" ]
			then
			echo "Diff 10: OK! (\"$TFILE\")" | tee -a $LOGFILE
			else
			echo "Diff 10: KO! (\"$TFILE\")"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			if [ $VALGRIND == 1 ]
			then
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			else
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			fi
			SUCCESS=0
			fi
			TFILE="test_src/2_file_100nl.txt"
			if [ $VALGRIND == 1 ]
			then
			valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S
			else
			./a.out 2 $TFILE > $S
			fi
			if [ $? == 5 ]
			then
			echo "valgrind error!"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 0 ]
			then
			echo "program error"
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 1 ]
			then
			echo "Return value OK!" | tee -a $LOGFILE
			else
			echo "Return value undefined"
			fi
			if [ "$(diff $LFILE $TFILE)" == "" ]
			then
			echo "Diff 11: OK! (\"$TFILE\")" | tee -a $LOGFILE
			else
			echo "Diff 11: KO! (\"$TFILE\")"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			if [ $VALGRIND == 1 ]
			then
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			else
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			fi
			SUCCESS=0
			fi
			TFILE="test_src/2_file_empty.txt"
			if [ $VALGRIND == 1 ]
			then
			valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S
			else
			./a.out 2 $TFILE > $S
			fi
			if [ $? == 5 ]
			then
			echo "valgrind error!"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 0 ]
			then
			echo "program error"
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 1 ]
			then
			echo "Return value OK!" | tee -a $LOGFILE
			else
			echo "Return value undefined"
			fi
			if [ "$(diff $LFILE $TFILE)" == "" ]
			then
			echo "Diff 12: OK! (\"$TFILE\")" | tee -a $LOGFILE
			else
			echo "Diff 12: KO! (\"$TFILE\")"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			if [ $VALGRIND == 1 ]
			then
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			else
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			fi
			SUCCESS=0
			fi
			TFILE="test_src/1_char.txt"
			if [ $VALGRIND == 1 ]
			then
			valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S
			else
			./a.out 2 $TFILE > $S
			fi
			if [ $? == 5 ]
			then
			echo "valgrind error!"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 0 ]
			then
			echo "program error"
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 1 ]
			then
			echo "Return value OK!" | tee -a $LOGFILE
			else
			echo "Return value undefined"
			fi
			if [ "$(diff $LFILE $TFILE)" == "" ]
			then
			echo "Diff 13: OK! (\"$TFILE\")" | tee -a $LOGFILE
			else
			echo "Diff 13: KO! (\"$TFILE\")"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			if [ $VALGRIND == 1 ]
			then
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			else
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			fi
			SUCCESS=0
			fi
			TFILE="test_src/empty.txt"
			if [ $VALGRIND == 1 ]
			then
			valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S
			else
			./a.out 2 $TFILE > $S
			fi
			if [ $? == 5 ]
			then
			echo "valgrind error!"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 0 ]
			then
			echo "program error"
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			elif [ $? == 1 ]
			then
			echo "Return value OK!" | tee -a $LOGFILE
			else
			echo "Return value undefined"
			fi
			if [ "$(diff $LFILE $TFILE)" == "" ]
			then
			echo "Diff 14: OK! (\"$TFILE\")" | tee -a $LOGFILE
			else
			echo "Diff 14: KO! (\"$TFILE\")"
			echo "cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=$BUFFER_SIZE gnl_tester.c get_next_line.c get_next_line_utils.c" >> $LOGFILE
			if [ $VALGRIND == 1 ]
			then
			echo "valgrind -s --show-leak-kinds=all --error-exitcode=5 --exit-on-first-error=no --leak-check=$LEAK_CHECK ./a.out 2 $TFILE > $S" >> $LOGFILE
			else
			echo "./a.out 2 $TFILE > $S" >> $LOGFILE
			fi
			SUCCESS=0
			fi
			if [ "$SUCCESS" == "1" ]
			then
			echo "All single line tests passed!"
			else
			echo "Some single line tests failed!"
			SF=0
			fi
			((ROUND=ROUND+1))
		done

	fi
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

