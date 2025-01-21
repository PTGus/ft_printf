/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gumendes <gumendes@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/21 15:29:22 by gumendes          #+#    #+#             */
/*   Updated: 2025/01/21 12:22:01 by gumendes         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H

# include <string.h>
# include <unistd.h>
# include <stdio.h>
# include <stdlib.h>
# include <stddef.h>
# include <stdarg.h>

/* printf necessities */
void		*ft_calloc(size_t count, size_t size);
void		ft_putchar_fd(char c, int fd);
void		ft_putstr_fd(char *s, int fd);
size_t		ft_strlen(const char *s);
void		ft_bzero(void *ptr, size_t len);

/* printf main */
int			ft_printf(const char *str, ...);
int			ft_printlowhexa(unsigned int nbr);
int			ft_printuphexa(unsigned int nbr);
int			ft_printnbr(int nbr);
int			ft_printptr(void *add);
int			ft_printstr(char *str);
char		*helperlow(unsigned int nbr);
char		*helperup(unsigned int nbr);
int			ft_intlen(unsigned int nbr);
int			ft_printunbr(unsigned int nbr);

#endif
