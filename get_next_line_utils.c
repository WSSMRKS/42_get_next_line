/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line_utils.c                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: maweiss <maweiss@student.42berlin.de>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/05 19:31:20 by maweiss           #+#    #+#             */
/*   Updated: 2024/02/13 18:05:14 by maweiss          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"

void	ft_free(char **tofree, int mode)
{
	int	i;

	if (!tofree)
		return ;
	i = 0;
	while (i < 1048576 + 1)
	{
		if (tofree[i])
			free((void *)tofree[i]);
		i++;
	}
	if (mode == 1)
		free((void *)tofree);
	return ;
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
	res = malloc(sizeof(char) * (len + 1));
	if (!res)
		return (NULL);
	while (*tmp1)
		*res++ = *tmp1++;
	while (*tmp2)
		*res++ = *tmp2++;
	*res = '\0';
	return (&res[-len]);
}

size_t	ft_strlen_gnl(const char *str, char *sign, char mode)
{
	size_t	a;

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
		while (*str != '\n' && *str != '\0')
		{
			str++;
			a++;
		}
		if (*str == '\n')
		{
			*sign = 'n';
			a++;
		}
		else
			*sign = '0';
		return (a);
	}
}
