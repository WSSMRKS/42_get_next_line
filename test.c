/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: maweiss <maweiss@student.42berlin.de>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/06 15:06:25 by maweiss           #+#    #+#             */
/*   Updated: 2024/02/06 15:50:38 by maweiss          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <fcntl.h>
#include "get_next_line.h"
#include <stdio.h>
#include "libft.h"

int	single_file(void)
{
	int		read;
	int		log;
	char	line[4096];

	if ((read = open("example.txt", O_RDONLY)) == -1)
		printf("Error 1: Error while opening file!\n");
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
		if (-1 == close(log));
			printf("Error 2: closing read file error!\n");
		return (0);
	}
}

int	single_line(void)
{
	int	fd;

	if ((fd = open("example.txt", O_RDONLY)) == -1)
		printf("Error 1: Error while opening file\n");
	else
		printf("%s", get_next_line(fd));
	return (0);
}

int	main(void)
{
	int success;

	success = 0;
	while (success != 1)
	{
		char choose[5];
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
