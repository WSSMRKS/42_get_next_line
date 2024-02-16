/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line_utils.c                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: maweiss <maweiss@student.42berlin.de>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/05 19:31:20 by maweiss           #+#    #+#             */
/*   Updated: 2024/02/16 19:09:07 by maweiss          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line_bonus.h"

void	ft_free(char **tofree, int mode)
{
	int	i;

	if (!tofree)
		return ;
	i = 0;
	while (i < MAX_FD)
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
	while (s1 && *s1++)
		len++;
	tmp2 = (char *)s2;
	while (s2 && *s2++)
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
	size_t	i;

	i = 0;
	*sign = '0';
	if (!str)
		return (i);
	while (mode == '0' && str[i] != '\0')
		i++;
	while (mode != '0' && str[i] != '\0' && str[i] != '\n')
		i++;
	if (str[i] == '\n')
	{
		*sign = 'n';
		i++;
	}
	return (i);
}