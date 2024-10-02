/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memmove.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jvoisard <jvoisard@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/09/23 20:55:54 by jvoisard          #+#    #+#             */
/*   Updated: 2024/10/01 22:27:04 by jvoisard         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

void	*ft_memmove(void *dst, const void *src, t_size n)
{
	char	*_dst;
	char	*_src;

	_src = (char *)src;
	_dst = (char *)dst;
	if (_dst < _src)
	{
		while (n--)
			*(_dst++) = *(_src++);
	}
	else
	{
		_src += n;
		_dst += n;
		while (n--)
			*(--_dst) = *(--_src);
	}
	return (dst);
}
