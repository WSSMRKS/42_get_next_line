#!/bin/bash
# Bash script to test project get_next_line from 42 Core Curriculum, by maweiss | https://github.com/WSSMRKS

cc -g -Wall -Werror -Wextra -D BUFFER_SIZE=1 test.c get_next_line.c get_next_line_utils.c
./a.out


