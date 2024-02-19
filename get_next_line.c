/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: maweiss <maweiss@student.42berlin.de>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/19 14:35:10 by maweiss           #+#    #+#             */
/*   Updated: 2024/02/19 18:06:24 by maweiss          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */


#include "get_next_line.h"

static char	*ft_fill_buffer(char *full_buff, char *nl)
{
	char	*tmp;

	tmp = ft_substr(*nl, 0, ft_strlen(*nl));
	free(full_buff);
	return (tmp);
}

static char	*ft_ret_val(char *full_buff, char *nl)
{
	char	*ret;

	*nl = ft_strchr(full_buff, '\n') - full_buff + 1; // +1??
	printf("%d", *nl);
	return (ft_substr(full_buff, 0, *nl));
}

static char	*ft_read_if_no_nl(char *full_buff, int fd)
{
	int		len;
	int		res_read;
	char	*buffer;
	char	*to_free;

	len = ft_strlen(full_buff);
	res_read = 1;
	while (!ft_strchr(full_buff, '\n') && res_read != 0)
	{
		buffer = malloc(sizeof(char) * BUFFER_SIZE + 1);
		res_read = read(fd, *buffer, BUFFER_SIZE);
		to_free = full_buff;
		full_buff = ft_strjoin(full_buff, buffer);
		free(to_free);
		free(buffer);
	}
	return (full_buff);
}

char	*get_next_line(int fd)
{
	char	*stbuff[MAX_FD + 1];
	int		nl;
	char	*ret;

	if (fd < 0)
		return (NULL);
	stbuff[fd] = ft_read_if_no_nl(stbuff[fd], fd);
	ret = ft_ret_val(stbuff[fd], &nl);
	stbuff[fd] = ft_fill_buffer(stbuff[fd], &nl);
}

/*
Concept:
- Validate fd:
	fd < 0 Free everything, return NULL
	fd >= 0 valid start processing
- Analyze buffer:
	search for '\n' in existing buffer. (strchr \n)
		Found:	take string including nl sign (strchr \n).
				Put rest to buffer res (strchr \0),
				return
		Not Found: read_join repeat search for '\n'
		repeat
*/
