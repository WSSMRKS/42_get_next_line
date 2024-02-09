/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: maweiss <maweiss@student.42berlin.de>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/05 19:31:20 by maweiss           #+#    #+#             */
/*   Updated: 2024/02/09 21:15:01 by maweiss          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

// Implement a get next line function:

#include "get_next_line.h"

void ft_free(char **tofree)
{
	int i;

	if (!tofree)
		return;
	i = 0;
	while (tofree[i])
	{
		free((void *)tofree[i]);
		i++;
	}
	free((void *)tofree);
	return;
}

char *ft_strjoin(char const *s1, char const *s2)
{
	size_t len;
	char *res;
	char *tmp1;
	char *tmp2;

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

size_t ft_strlen_gnl(const char *str, char *sign, char mode)
{
	size_t a;

	a = 0;
	if (!str)
	{
		*sign = '0';
		return (a);
	}
	if (mode == '0')
	{
		while (*str++)
			a++;
		return (a);
	}
	else
	{
		while (*str != '\n' && *str++ != '\0')
			a++;
		if (*str == '\n')
			*sign = 'n';
		else
			*sign = '0';
		return (a);
	}
}

char *ft_strdup_gnl(char *src, char mode)
{
	char *str;
	int len;
	int i;

	len = 0;
	i = 0;
	if (!src)
		return (NULL);
	len = ft_strlen_gnl(src, &mode, mode);
	str = malloc(sizeof(char) * len + 1);
	if (!str)
		return (NULL);
	if (len == 0)
		str[0] = '\0';
	while (i <= len)
	{
		str[i] = src[i];
		i++;
	}
	str[i] = '\0';
	return (str);
}

int ft_read_join(char **stbuff, int fd)
{
	int bytes_read;
	char buffer[BUFFER_SIZE + 1];
	char *tmp;

	bytes_read = read(fd, buffer, BUFFER_SIZE);
	buffer[bytes_read] = 0;
	if (bytes_read < BUFFER_SIZE && bytes_read == -1)
		return (-1);
	else if (bytes_read < BUFFER_SIZE && bytes_read == 0)
		return (0);
	else
	{
		tmp = stbuff[fd];
		stbuff[fd] = ft_strjoin(stbuff[fd], buffer);
		free(tmp);
		if (bytes_read < BUFFER_SIZE)
			return (1);
		else
			return (2);
	}
}

char *ft_strchr(const char *s, int c)
{
	int i;

	i = 0;
	while (s[i])
	{
		if (s[i] == (char)c)
			return ((char *)&s[i]);
		i++;
	}
	if ((char)c == 0)
		return ((char *)&s[i]);
	return (NULL);
}

char **ft_split_nl(char *find_nl)
{
	char sign;
	char **ret;

	sign = 0;
	ret = malloc(sizeof(char *) * 2);
	if (!ret)
		return (NULL);
	ret[0] = NULL;
	ret[1] = NULL;
	ft_strlen_gnl(find_nl, &sign, '2');
	if (sign == 'n')
	{
		ret[0] = ft_strdup_gnl(find_nl, '\n');
		printf("I am gonna be returned: \"%s\"\n", ret[0]);
		ret[1] = ft_strdup_gnl(find_nl + ft_strlen_gnl(find_nl, &sign, '\n') + 1, '0'); //[ ] Fehler ret value und position des splits passen nicht.!!!!
		printf("I am gonna be returned: \"%s\"\n", ret[0]);
		printf("I go to Buffer: \"%s\"\n", ret[1]);
	}
	if (sign == '0')
	{
		ret[0] = ft_strdup_gnl(find_nl, '0');
		if (ret[0] == NULL)
		{
			ret[0] = malloc(sizeof(char));
			ret[0][0] = '\0';
		}
	}
	return (ret);
}

char *get_next_line(int fd)
{
	static char *stbuff[1048576 + 1];
	char **rsplit;
	char *ret;
	int res_read;
	char sign_rest;

	if (fd == -1)
		ft_free(stbuff);
	ret = NULL;
	while (ret == NULL)
	{
		rsplit = ft_split_nl(stbuff[fd]);
		if (!rsplit)
		{
			ft_free(stbuff);
			write(1, "Error 1: ft_split_nl failed!\n", 29); // [ ] Remove (not allowed)
			return (NULL);
		}
		else if (rsplit[1] == NULL)
		{
			free(rsplit[1]);
			stbuff[fd] = rsplit[0];
			rsplit[0] = NULL;
			free(rsplit);
			res_read = ft_read_join(stbuff, fd);
			if (res_read <= 1)
			{
				if (res_read < 1)
					return (NULL);
				ft_strlen_gnl(stbuff[fd], &sign_rest, '\n');
				if (sign_rest != 'n')
				{
					ret = stbuff[fd];
					stbuff[fd] = NULL;
					return (ret); // [ ] free regimen of other FDs
				}
			}
		}
		else
		{
			stbuff[fd] = rsplit[1];
			ret = rsplit[0];
			free(rsplit);
			return (ret);
			// [ ] still stuff to free?
		}
	}
	// free(stbuff[1048576]);
	// [ ] free everything;
	return (ret);
}
