/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: maweiss <maweiss@student.42berlin.de>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/06 15:06:25 by maweiss           #+#    #+#             */
/*   Updated: 2024/02/08 13:12:16 by maweiss          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <fcntl.h>
#include "get_next_line.h"
#include <stdio.h>
#include "libft/libft.h"
#include <dirent.h>

int	single_file(void)
{
	int		read;
	int		log;
	char	*line;
	int		done;

	done = 0;
	read = open("example.txt", O_RDONLY);
	if (read == -1)
	{
		printf("Error 1: Error while opening file\n");
		return (0);
	}
	else
	{
		while (done != 1)
		{
			line = get_next_line(read);
			printf("%s", line);
			log = open("logfile.txt", O_CREAT, O_WRONLY);
			write(log, line, ft_strlen(line));
			if (!line)
				done = 1;
		}
		if (-1 == close(read))
			printf("Error 2: closing read file error!\n");
		if (-1 == close(log))
			printf("Error 2: closing read file error!\n");
		return (1);
	}
}

int	single_line(void)
{
	char	*line;
	int		read;

	read = open("example.txt", O_RDONLY);
	if (read == -1)
		printf("Error 1: Error while opening file\n");
	else
	{
		line = get_next_line(read);
		printf("%s", line);
		return (1);
	}
	return (0);
}

int	multiple_files(void)
{
	int				read;
	int				read2;
	int				log;
	unsigned int	sw;
	char			*line;

	read = open("example.txt", O_RDONLY);
	read2 = open("example2.txt", O_RDONLY);
	log = open("logfile.txt", O_CREAT, O_WRONLY);
	if (read == -1 || read2 == -1 || log == -1)
	{
		if (read == -1)
			printf("Error 1: Error while opening example.txt!\n");
		if (read2 == -1)
			printf("Error 2: Error while opening example2.txt!\n");
		if (log == -1)
			printf("Error 3: Error while opening logfile.txt!\n");
		return (0);
	}
	else
	{
		sw = 1;
		while (sw != 0)
		{
			if (sw == 1 || sw == 3)
			{
				line = get_next_line(read);
				if (line == NULL)
				{
					if (sw == 3)
						sw = 0;
					else
						sw = 4;
				}
			}
			else
			{
				line = get_next_line(read2);
				if (line == NULL)
				{
					if (sw == 4)
						sw = 0;
					else
						sw = 3;
				}
			}
			printf("%s", line);
			if (!write(log, line, ft_strlen(line)))
			{
				printf("Error 3: Error while writing to log.txt!\n");
				get_next_line(-1);
				return (0);
			}
			return (1);
		}
		if (-1 == close(read))
			printf("Error 3: closing read file error!\n");
		if (-1 == close(read2))
			printf("Error 4: closing read2 file error!\n");
		if (-1 == close(log))
			printf("Error 5: closing log file error!\n");
	}
	return (0);
}

int	main(void)
{
	int		success;
	char	choose;
	int		ret_read;

	setbuf(stdout, NULL);
	success = 0;
	while (success != 1)
	{
		printf("which test do you want to execute?\n");
		printf("1: read a single line\n");
		printf("2: read a single file\n");
		printf("3: read from multiple files\n");
		printf("0: exit program\n");
		ret_read = read(0, &choose, 1);
		printf("This is the return value of read: %d\n", ret_read);
		if (ret_read == -1)
		{
			printf("Error: read went wrong!\n");
			return (0);
		}
		printf("This is the state of the Variable choose: %c\n", choose);
		if (choose == '1' && single_line() == 1)
			printf("single line successfully tested\n");
		else if (choose == '2' && single_file() == 1)
			printf("single file successfully tested\n");
		else if (choose == '3' && multiple_files() == 1)
			printf("multiple files successfully tested\n");
		else if (choose == '0' && multiple_files() == 1)
		{
			success = 1;
			printf("Terminating program\n");
		}
		else
		{
			if (choose >= '0' && choose <= '3')
				printf("test went wrong!\n");
			else
				printf("Incorrect input!\n");
		}
	}
}

// TODO read from stdin
