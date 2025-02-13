/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printunbr.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marvin <marvin@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/12 10:34:49 by gumendes          #+#    #+#             */
/*   Updated: 2025/02/13 12:56:45 by marvin           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"
/** @brief Prints an unsigned integer
 *  @param nbr The integer to be printed
 *  @return Returns the length of the printed integer
*/
int	ft_printunbr(unsigned int nbr)
{
	unsigned int	i;
	int				len;

	i = nbr;
	len = 0;
	if (i >= 1 && i <= 9)
	{
		ft_putchar_fd(i + '0', 1);
		len++;
	}
	if (i > 9)
	{
		len += ft_printnbr(i / 10);
		len += ft_printnbr(i % 10);
	}
	return (len);
}
