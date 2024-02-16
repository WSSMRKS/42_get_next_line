/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.h                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: maweiss <maweiss@student.42berlin.de>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/05 19:32:04 by maweiss           #+#    #+#             */
/*   Updated: 2024/02/16 22:18:25 by maweiss          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef GET_NEXT_LINE_H
# define GET_NEXT_LINE_H
# include <stdarg.h>
# include <stdlib.h>
# include <unistd.h>
# include <stddef.h>
# include <stdio.h>
# include <string.h>
# include <ctype.h>
# include <limits.h>
# ifndef BUFFER_SIZE
#  define BUFFER_SIZE 42

# endif
# ifndef MAX_FD
#  define MAX_FD 100 + 1
// max should be 1048576 + 1

# endif

char	*get_next_line(int fd);
char	*ft_strjoin(char const *s1, char const *s2);
void	ft_free(char **tofree, int mode);
size_t	ft_strlen_gnl(const char *str, char *sign, char mode);
char	*ft_strdup_gnl(char *src, char mode);
int		ft_read_join(char **stbuff, int fd);
char	**ft_split_nl(char *find_nl);

#endif
