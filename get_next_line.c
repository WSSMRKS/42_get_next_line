/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: maweiss <maweiss@student.42berlin.de>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/05 19:31:20 by maweiss           #+#    #+#             */
/*   Updated: 2024/02/07 18:31:03 by maweiss          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

// Implement a get next line function:

#include "get_next_line.h"


static void	ft_free(char **tofree)
{
	int	i;

	if (!tofree)
		return ;
	i = 0;
	while (tofree[i])
	{
		free((void *)tofree[i]);
		i++;
	}
	free((void *)tofree);
	return ;
}

static size_t	ft_str_len_count(char *str, char del, int mode)
{
	size_t	a;
	size_t	i;

	if (mode == 1)
	{
		i = 0;
		str++;
		while (*str)
		{
			if (*str == del && *(str - 1) != del)
				i++;
			str++;
		}
		if (*str == '\0' && *(str - 1) != del)
			i++;
		return (i);
	}
	a = 0;
	while (*str != del && *str != '\0')
	{
		a++;
		str++;
	}
	return (a);
}

static char	*ft_strdup_split(char *arr, char *s, char c, int *k)
{
	int		i;
	int		len;

	len = ft_str_len_count(&s[*k], c, 2);
	if (len > 0)
	{
		arr = malloc(sizeof(char) * (len + 1));
		if (!arr)
			return (s);
	}
	i = 0;
	while (s[*k] != c && s[*k] != '\0')
	{
		arr[i++] = s[*k];
		*k += 1;
	}
	if (i == 0)
		arr = NULL;
	else
		arr[i] = '\0';
	return (arr);
}

static int	ft_core(char **arr, int count, char *s, char c)
{
	int		i;
	int		k;

	k = 0;
	i = 0;
	while (count > 0)
	{
		if (s[k] == c && c != '\0')
			k++;
		else
		{
			arr[i] = ft_strdup_split(arr[i], (char *)s, c, &k);
			if (arr[i] == s)
			{
				arr[i] = NULL;
				return (10);
			}
			i++;
			count--;
		}
	}
	if (count == 0)
		arr[i] = NULL;
	return (count);
}

char	**ft_split(char const *s, char c)
{
	size_t	count;
	char	**arr;

	if (*s == '\0')
		count = 0;
	else
		count = ft_str_len_count((char *)s, c, 1);
	arr = malloc(sizeof(char *) * (count + 1));
	if (!arr)
	{
		free((void *) arr);
		return (NULL);
	}
	if (ft_core(arr, count, (char *)s, c) > 0)
	{
		ft_free(arr);
		return (NULL);
	}
	return (arr);
}

char	*ft_strdup(char *src)
{
	char	*str;
	char	*ret;
	int		len;

	len = 0;
	str = src;
	len = ft_strlen(str);
	str = malloc(sizeof (char) * len + 1);
	if (!str)
		return (NULL);
	ret = str;
	while (*src)
		*str++ = *src++;
	*str = '\0';
	return (ret);
}

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

char	*ft_strchr(const char *s, int c)
{
	int	i;

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

char	*ft_substr(char const *s, unsigned int start, size_t len)
{
	char	*sub;
	int		i;
	size_t	act_l;
	size_t	s_len;

	i = 0;
	s_len = ft_strlen(s);
	if (s_len < start)
		sub = malloc(sizeof(char));
	else
	{
		act_l = ft_strlen(&s[start]);
		if (s_len >= start && act_l < len)
			sub = malloc(sizeof(char) * (act_l + 1));
		else
			sub = malloc(sizeof(char) * (len + 1));
		if (!sub)
			return (NULL);
		while (act_l-- > 0 && len-- > 0)
			sub[i++] = s[start++];
	}
	if (!sub)
		return (NULL);
	sub[i] = '\0';
	return (sub);
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
			return (2);
		else
			return (1);
}

char	*get_next_line(int fd)
{
	static char	*stbuff[1048576 + 1];
	char		*delloc;
	char		**rsplit;
	char		*ret;

	if (fd == -1)
		//TODO Free everything
	if (stbuff == NULL)
		stbuff[1048576] = malloc(sizeof(char)); //TODO to free
	while (ret == NULL)
	{
		if (stbuff[fd] != NULL)
		{
			rsplit = ft_split_once(stbuff[fd], '\n'); //TODO split once
			if (!rsplit)
			{
				//TODO Free everything;
				//TODO print error;
			}
			else if (rsplit[1] == NULL)
				ft_read_join(stbuff, fd);
				//TODO handle return values right
			else
			{
				stbuff[fd] = rsplit[1];
				ret = rsplit[0];
				free(rsplit);
				return (ret);
				//TODO still stuff to free?
			}
		}
		else
			ft_read_join(stbuff, fd);
			//TODO handle return values right
	}
	free(stbuff[1048576]);
	//TODO free everything;
	return (ret);
}

//TODO Try to replace ft_split_once by ft_strchr & ft_substr & ft_strdup??
