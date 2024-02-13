/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   gnl_main.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: maweiss <maweiss@student.42berlin.de>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/13 20:00:16 by maweiss           #+#    #+#             */
/*   Updated: 2024/02/13 20:38:16 by maweiss          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <fcntl.h>
#include "get_next_line.h"
#include <stdio.h>
#include <dirent.h>

size_t	ft_strlen(const char *str)
{
	size_t	a;

	a = 0;
	while (*str)
	{
		a++;
		str++;
	}
	return (a);
}

int	single_file(char *file)
{
	int		read;
	int		log;
	char	*line;
	int		done;

	done = 0;
	read = open(file, O_RDONLY);
	log = open("logfile.txt", O_WRONLY | O_CREAT | O_TRUNC, 0666);
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
			if (!line)
				done = 1;
			else
			{
				printf("%s", line);
				write(log, line, ft_strlen(line));
			}
		}
		if (-1 == close(read))
			printf("Error 2: closing read file error!\n");
		if (-1 == close(log))
			printf("Error 2: closing read file error!\n");
		return (1);
	}
}

int	single_line(char *file)
{
	char	*line;
	int		read;
	int		log;

	read = open(file, O_RDONLY);
	log = open("logfile.txt", O_WRONLY | O_CREAT | O_TRUNC, 0666);
	if (read == -1)
		printf("Error 1: Error while opening %s\n", file);
	else
	{
		line = get_next_line(read);
		write(log, line, ft_strlen(line));
		printf("%s", line);
		return (1);
	}
	return (0);
}

int	multiple_files(char *file1, char *file2)
{
	int				read;
	int				read2;
	int				log;
	unsigned int	sw;
	char			*line;
	char			place;

	read = open(file1, O_RDONLY);
	read2 = open(file2, O_RDONLY);
	log = open("logfile.txt", O_WRONLY | O_CREAT | O_TRUNC, 0666);
	if (read == -1 || read2 == -1 || log == -1)
	{
		if (read == -1)
			printf("Error 1: Error while opening file %s!\n", file1);
		if (read2 == -1)
			printf("Error 2: Error while opening file %s!\n", file2);
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
				else if (sw == 1)
					sw = 2;
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
				else if (sw == 2)
					sw = 1;
			}
			if (line)
			{
				printf("%s", line);
				if (!write(log, line, ft_strlen_gnl(line, &place, '2')))
				{
					printf("Error 3: Error while writing to log.txt!\n");
					get_next_line(-1);
					return (0);
				}
			}
		}
		if (-1 == close(read))
			printf("Error 3: closing read file error!\n");
		if (-1 == close(read2))
			printf("Error 4: closing read2 file error!\n");
		if (-1 == close(log))
			printf("Error 5: closing log file error!\n");
		return (1);
	}
	return (0);
}

int	main(int argc, char **argv)
{
	int		success;
	char	choose;

	setbuf(stdout, NULL);
	success = 0;
	if (argc < 3)
	{
		printf("Too few arguments!\n");
		return (0);
	}
	while (success == 0)
	{
		choose = argv[1][0];
		if (choose == '1' && single_line(argv [2]) == 1)
		{
			printf("single line successfully tested\n");
			success = 1;
		}
		else if (choose == '2' && single_file(argv[2]) == 1)
		{
			printf("single file successfully tested\n");
			success = 1;
		}
		else if (choose == '3' && multiple_files(argv[2], argv[3]) == 1)
		{
			printf("multiple files successfully tested\n");
			success = 1;
		}
		else if (choose == '0')
		{
			printf("Terminating program\n");
			return (0);
		}
		else
		{
			if (choose >= '0' && choose <= '3')
			{
				printf("test went wrong!\n");
				return (0);
			}
			else
				printf("Incorrect input!\n");
		}
	}
	return (1);
}

// How to use this file:
// ./a.out [Number of preferred test] [file1] [file2 (optional)]
