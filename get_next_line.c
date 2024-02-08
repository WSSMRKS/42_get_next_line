/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: maweiss <maweiss@student.42berlin.de>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/05 19:31:20 by maweiss           #+#    #+#             */
/*   Updated: 2024/02/08 11:12:15 by maweiss          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

// Implement a get next line function:

#include "get_next_line.h"

char	*ft_strjoin(char const *s1, char const *s2)
{
	size_t	len;
	char	*res;
	char	*tmp1;
	char	*tmp2;

	len = 0;
	tmp1 = (char *)s1;
	while (*s1++)
		len++;
	tmp2 = (char *)s2;
	while (*s2++)
		len++;
	res = malloc(len + 1);
	if (!res)
		return (NULL);
	while (*tmp1)
		*res++ = *tmp1++;
	while (*tmp2)
		*res++ = *tmp2++;
	*res = '\0';
	return (&res[-len]);
}

size_t	ft_strlen_gnl(const char *str, int mode)
{
	size_t	a;

	a = 0;
	if (mode == 1)
	{
		while (*str)
		{
			a++;
			str++;
		}
		return (a);
	}
	else
	{
		while (*str != '\n' && *str != '\0')
		{
				a++;
				str++;
		}
		if (*str == '\n')
			return (-a);
		else
			return (a);
	}

}

char	*ft_strdup_gnl(char *src, int mode)
{
	char	*str;
	char	*ret;
	int		len;
	int		i;

	len = 0;
	i = 0;
	str = src;
	len = ft_strlen_gnl(str, mode);
	str = malloc(sizeof (char) * len + 1);
	if (!str)
		return (NULL);
	ret = str;
	while (i <= len)
		str[i] = src[i++];
	str[i] = '\0';
	return (ret);
}

int ft_read_join(char **stbuff, int fd)
{
	int		bytes_read;
	char	buffer[BUFFER_SIZE + 1];
	char	res;
	char	*tmp;

	bytes_read = read(fd, buffer, BUFFER_SIZE);
	buffer[bytes_read] = 0;
	if (bytes_read < BUFFER_SIZE && bytes_read == -1)
		return (-1);
	else if (bytes_read < BUFFER_SIZE && bytes_read == 0)
		return (0);
	else
		tmp = stbuff[fd];
		stbuff[fd] = ft_strjoin(stbuff[fd], buffer);
		free(tmp);
		if (bytes_read < BUFFER_SIZE)
			return (1);
		else
			return (2);
}

int ft_split_nl()

char	*get_next_line(int fd)
{
	static char	*stbuff[1048576 + 1];
	char		*delloc;
	char		**rsplit;
	char		*ret;
	int			res_read;

	if (fd == -1)
		ft_free(**stbuff);
	if (stbuff == NULL)
		stbuff[1048576] = malloc(sizeof(char)); //TODO to free
	while (ret == NULL)
	{
		rsplit = ft_split_nl(stbuff[fd], '\n'); //TODO split once
		if (!rsplit)
		{
			ft_free(**stbuff);
			write(1, "Error 1: ft_split_once failed!\n", 31); //TODO Remove (not allowed)
			return (NULL);
		}
		else if (rsplit[1] == NULL)
			res_read = ft_read_join(stbuff, fd);
			if (res_read <= 1)
			{
				write(1, "Error 2: read failed, nothing more to read or EOF!\n", 22); //TODO Remove (not allowed)
				if (stbuff[fd] != NULL)
				{
					ret = stbuff[fd];
					stbuff[fd] == NULL;
					return (ret);
				}
				else
					return (NULL);
			}
		else
		{
			stbuff[fd] = rsplit[1];
			ret = rsplit[0];
			free(rsplit);
			return (ret);
			//TODO still stuff to free?
		}
	}
	//free(stbuff[1048576]);
	//TODO free everything;
	return (ret);
}

//TODO Try to replace ft_split_once by ft_strchr & ft_substr & ft_strdup??
