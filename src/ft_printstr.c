/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printstr.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gumendes <gumendes@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/06 10:51:35 by gumendes          #+#    #+#             */
/*   Updated: 2025/01/07 16:59:43 by gumendes         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"
/** @brief Prints a string given as the parameter
 *  @param str the string that will be printed
 *  @return the size of the string printed
*/
int	ft_printstr(char *str)
{
	int	i;

	i = 0;
	if (!str)
	{
		ft_putstr_fd("(null)", 1);
		return (6);
	}
	while (str[i])
	{
		ft_putchar_fd(str[i], 1);
		i++;
	}
	return (i);
}
