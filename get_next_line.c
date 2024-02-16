/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: maweiss <maweiss@student.42berlin.de>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/05 19:31:20 by maweiss           #+#    #+#             */
/*   Updated: 2024/02/16 22:42:34 by maweiss          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

// Implement a get next line function:

#include "get_next_line.h"

char	*ft_strdup_gnl(char *src, char mode)
{
	char	*str;
	int		len;
	int		i;

	len = 0;
	i = 0;
	if (!src)
		return (NULL);
	len = ft_strlen_gnl(src, &mode, mode);
	str = malloc(sizeof(char) * (len + 1)); //[ ] Malloc1
	if (!str)
		return (NULL);
	while (i < len)
	{
		str[i] = src[i];
		i++;
	}
	str[i] = '\0';
	return (str);
}

int	ft_read_join(char **stbuff, int fd)
{
	int		bytes_read;
	char	*buffer;
	char	*tapered_buffer;
	char	*tmp;

	buffer = malloc(sizeof(char) * (BUFFER_SIZE + 1));
	bytes_read = read(fd, buffer, BUFFER_SIZE);
	if (bytes_read < BUFFER_SIZE && bytes_read == -1)
	{
		free(buffer);
		free(stbuff[fd]);
		return (-1);
	}
	else if (bytes_read < BUFFER_SIZE && bytes_read == 0)
	{
		free(buffer);
		return (0);
	}
	buffer[bytes_read] = 0;
	if (bytes_read < BUFFER_SIZE)
	{
		tapered_buffer = ft_strdup_gnl(buffer, '0');
		free(buffer);
		buffer = tapered_buffer;
	}
	tmp = stbuff[fd];
	stbuff[fd] = ft_strjoin(stbuff[fd], buffer);
	free(tmp);
	free(buffer);
	if (bytes_read < BUFFER_SIZE)
		return (1);
	else
		return (2);
}

char	**ft_split_nl(char *find_nl)
{
	char	sign;
	char	**ret;

	sign = 0;
	ret = malloc(sizeof(char *) * 2);
	if (!ret)
	{
		free(find_nl);
		return (NULL);
	}
	ret[0] = NULL;
	ret[1] = NULL;
	ft_strlen_gnl(find_nl, &sign, '2');
	if (sign == 'n')
	{
		ret[0] = ft_strdup_gnl(find_nl, '\n');
		ret[1] = ft_strdup_gnl(find_nl
				+ ft_strlen_gnl(find_nl, &sign, '\n'), '0');
	}
	if (sign == '0')
		ret[0] = ft_strdup_gnl(find_nl, '0');
	free(find_nl);
	return (ret);
}

char	*get_next_line(int fd)
{
	static char	*stbuff[MAX_FD + 1];
	char		**rsplit;
	char		*ret;
	int			res_read;

	if (fd == -2)
		ft_free(stbuff, 0);
	ret = NULL;
	while (ret == NULL)
	{
		rsplit = ft_split_nl(stbuff[fd]);
		if (!rsplit)
		{
			ft_free(stbuff, 0);
			return (NULL);
		}
		else if (rsplit[1] == NULL)
		{
			free(rsplit[1]);
			stbuff[fd] = rsplit[0];
			rsplit[0] = NULL;
			free(rsplit);
			res_read = ft_read_join(stbuff, fd);
			if (res_read < 1)
			{
				if (res_read == -1)
				{
					free(stbuff[fd]);
					return (NULL);
				}
				if (res_read == 0)
				{
					if (stbuff[fd] && stbuff[fd][0] != 0)
					{
						ret = stbuff[fd];
						stbuff[fd] = NULL;
					}
					else
						ret = NULL;
					return (ret);
				}
			}
		}
		else
		{
			stbuff[fd] = rsplit[1];
			ret = rsplit[0];
			free(rsplit);
			return (ret);
		}
	}
	return (ret);
}
