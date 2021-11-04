/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tnard <tnard@student.42lyon.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/04 10:42:26 by tnard             #+#    #+#             */
/*   Updated: 2021/11/04 11:35:59 by tnard            ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"

char *get_next_line(int fd)
{
	static char	*str;
	char		*tmp;
	char		buf[BUFFER_SIZE + 1];
	int			ret;

	if (fd < 0 || read(fd, buf, 0) < 0)
		return (NULL);
	if (str[0] == '\0')
	{
		if ((ret = read(fd, buf, BUFFER_SIZE)) > 0)
		{
			buf[ret] = '\0';
			str = ft_strdup(buf);
		}
		else if (ret == 0)
			return (NULL);
		else
			return (NULL);
	}
	if ((tmp = ft_strchr(str, '\n')))
	{
		*tmp = '\0';
		tmp++;
		return (ft_strdup(str));
	}
	else
	{
		tmp = str;
		str = ft_strdup(tmp);
		ft_strdel(&tmp);
		return (get_next_line(fd));
	}
	return (NULL);
}