/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: maweiss <maweiss@student.42berlin.de>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/06 15:06:25 by maweiss           #+#    #+#             */
/*   Updated: 2024/02/07 11:32:56 by maweiss          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <fcntl.h>
#include "get_next_line.h"
#include <stdio.h>
#include "libft.h"
#include <dirent.h>

int	single_file(void)
{
	int		read;
	int		log;
	char	line[4096];

	read = open("example.txt", O_RDONLY);
	if (read == -1)
		printf("Error 1: Error while opening file\n");
	else
	{
		while (line != NULL)
		{
			*line = get_next_line(read);
			printf("%s", *line);
			log = open("logfile.txt", O_CREAT, O_WRONLY);
			write(log, *line, ft_strlen(*line));
		}
		if (-1 == close(read))
			printf("Error 2: closing read file error!\n");
		if (-1 == close(log))
			printf("Error 2: closing read file error!\n");
		return (0);
	}
}

int	single_line(void)
{
	char	line[4096];
	int		read;

	read = open("example.txt", O_RDONLY);
	if (read == -1)
		printf("Error 1: Error while opening file\n");
	else
	{
		*line = get_next_line(read);
		printf("%s", *line);
	}
	return (0);
}

int	multiple_files(void)
{
	int				read;
	int				read2;
	int				log;
	unsigned int	sw;
	char			line[4096];

	read = open("example.txt", O_RDONLY);
	if (read == -1)
		printf("Error 1: Error while opening example.txt!\n");
	else
	{
		read2 = open("example2.txt", O_RDONLY);
		if (read2 == -1)
			printf("Error 2: Error while opening example2.txt!\n");
		else
		{
			sw = 1;
			while (sw != 0)
			{
				if (sw == 1)
				{
					*line = get_next_line(read);
					if (line == NULL)
					{
						if (sw == 3)
							sw = 0;
						else
							sw = 3;
					}
				}
				else if (sw == 2)
				{
					*line = get_next_line(read2);
					if (line == NULL)
					{
						if (sw == 4)
							sw = 0;
						else
							sw = 3;
					}
				}
				printf("%s", *line);
				log = open("logfile.txt", O_CREAT, O_WRONLY);
				if (log == -1)
					printf("Error 2: Error while opening log.txt!\n");
				else
				{
					if (!write(log, *line, ft_strlen(*line)))
						printf("Error 3: Error while writing to log.txt!\n");
				}
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
}

int	main(void)
{
	int		success;
	char	choose[5];

	success = 0;
	while (success != 1)
	{
		printf("which test do you want to execute?\n");
		printf("1: read a single line\n");
		printf("2: read a single file\n");
		printf("3: read from multiple files\n");
		printf("0: exit program\n");
		read(0, choose, 1);
		if (choose[0] == '1' && single_line() == 1)
			printf("single line successfully tested\n");
		else if (choose[0] == '2' && single_file() == 1)
			printf("single file successfully tested\n");
		else if (choose[0] == '3' && multiple_files() == 1)
			printf("multiple files successfully tested\n");
		else if (choose[0] == '0' && multiple_files() == 1)
		{
			success = 1;
			printf("Terminating program\n");
		}
		else
			printf("Incorrect input!\n");
	}
}
