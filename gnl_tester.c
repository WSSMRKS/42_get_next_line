/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   gnl_tester.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: maweiss <maweiss@student.42berlin.de>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/13 20:00:16 by maweiss           #+#    #+#             */
/*   Updated: 2024/02/16 22:00:42 by maweiss          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <fcntl.h>
#include "get_next_line.h"
#include <stdio.h>
#include <dirent.h>

static size_t	ft_strlen(const char *str)
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
	log = open("tmp.txt", O_WRONLY | O_CREAT | O_TRUNC, 0666);
	if (read == -1 || log == -1)
	{
		printf("Error 1: Error while opening file\n");
		if (log == -1)
			close(read);
		else
			close(log);
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
				free(line);
			}
		}
		if (-1 == close(read))
			printf("Error 2: closing read file error!\n");
		if (-1 == close(log))
			printf("Error 2: closing read file error!\n");
		close(log);
		close(read);
		return (1);
	}
}

int	inval_fd(char *file)
{
	int		read;
	int		log;
	char	*line;
	int		done;

	done = 0;
	read = open(file, O_RDONLY);
	close(read);
	log = open("tmp.txt", O_WRONLY | O_CREAT | O_TRUNC, 0666);
	if (read == -1 || log == -1)
	{
		printf("Error 1: Error while opening file\n");
		if (log == -1)
			close(read);
		else
			close(log);
		return (0);
	}
	else
	{
		while (done != 1)
		{
			line = get_next_line(read);
			printf("%s", get_next_line(-1));
			if (!line)
				done = 1;
			else
			{
				printf("%s", line);
				write(log, line, ft_strlen(line));
				free(line);
			}
		}
		if (-1 == close(read))
			printf("Error 2: closing read file error!\n");
		if (-1 == close(log))
			printf("Error 2: closing read file error!\n");
		close(log);
		close(read);
		return (1);
	}
}

int	single_line(char *file)
{
	char	*line;
	int		read;
	int		log;

	read = open(file, O_RDONLY);
	log = open("tmp.txt", O_WRONLY | O_CREAT | O_TRUNC, 0666);
	if (read == -1)
	{
		printf("Error 1: Error while opening %s\n", file);
		close(log);
		close(read);
	}
	else
	{
		line = get_next_line(read);
		if (!line)
		{
			printf("Error 2: Error while reading file %s\n", file);
			close(log);
			close(read);
			return (0);
		}
		write(log, line, ft_strlen(line));
		printf("%s", line);
		free(line);
		if (-1 == close(read))
			printf("Error 3: closing read file error!\n");
		if (-1 == close(log))
			printf("Error 5: closing log file error!\n");
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

	read = open(file1, O_RDONLY);
	read2 = open(file2, O_RDONLY);
	log = open("tmp.txt", O_WRONLY | O_CREAT | O_TRUNC, 0666);
	if (read == -1 || read2 == -1 || log == -1)
	{
		if (read == -1)
			printf("Error 1: Error while opening file %s!\n", file1);
		if (read2 == -1)
			printf("Error 2: Error while opening file %s!\n", file2);
		if (log == -1)
			printf("Error 3: Error while opening tmp.txt!\n");
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
				if (!write(log, line, ft_strlen(line)))
				{
					printf("Error 3: Error while writing to log.txt!\n");
					get_next_line(-1);
					free(line);
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
	char	choose;

	setbuf(stdout, NULL);
	if (argc < 3 || (argc < 4 && argv[1][0] == '3'))
	{
		printf("Too few arguments!\n");
		return (0);
	}
	choose = argv[1][0];
	if (choose == '1' && single_line(argv[2]) == 1)
		printf("single line successfully tested\n");
	else if (choose == '2' && single_file(argv[2]) == 1)
		printf("single file successfully tested\n");
	else if (choose == '3' && multiple_files(argv[2], argv[3]) == 1)
		printf("multiple files successfully tested\n");
	else if (choose == '4' && inval_fd(argv[2]) == 1)
		printf("single file successfully tested\n");
	else if (choose == '0')
	{
		printf("The return value of get_next_line with fd = -1 is:\n\"%s\"\n", get_next_line(-1));
		printf("Terminating program\n");
	}
	else
	{
		if (choose >= '0' && choose <= '3')
			printf("test went wrong!\n");
		else
			printf("Incorrect input!\n");
		return (0);
	}
	return (1);
}

// How to use this file:
// ./a.out [Number of preferred test] [file1] [file2 (optional)]
