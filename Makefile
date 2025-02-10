# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gumendes <gumendes@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/15 09:43:19 by gumendes          #+#    #+#              #
#    Updated: 2025/02/10 17:14:21 by gumendes         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Flags
CC				=	cc
RM				=	rm -f
CFLAGS			=	-Wall -Wextra -Werror -g

# Library Paths
LIBFT_PATH		=	../libft

# Libraries
LIBFT			=	$(LIBFT_PATH)/libft.a

# Includes
INCLUDES = -I . -I $(SRC_PATH)

# Output Name
NAME = libftprintf.a

# Source Files
SRC_PATH = src

SRC = $(SRC_PATH)/ft_printf.c $(SRC_PATH)/ft_printlowhexa.c $(SRC_PATH)/ft_printnbr.c $(SRC_PATH)/ft_printptr.c \
	  $(SRC_PATH)/ft_printstr.c $(SRC_PATH)/ft_printuphexa.c $(SRC_PATH)/ft_printutils.c $(SRC_PATH)/ft_printunbr.c

# Object Files
OBJ = $(SRC:.c=.o)

# Libft Object Files
LIBFT_OBJ = $(LIBFT_PATH)/ft_calloc.o $(LIBFT_PATH)/ft_putchar_fd.o \
			$(LIBFT_PATH)/ft_putstr_fd.o $(LIBFT_PATH)/ft_strlen.o \
			$(LIBFT_PATH)/ft_bzero.o

# Build Target
all: checker $(LIBFT) $(NAME)

# Build the libft library
$(LIBFT):
	@$(MAKE) -C $(LIBFT_PATH)

# Build the printf library
$(NAME): $(OBJ) $(LIBFT_OBJ)
	@ar rcs $(NAME) $(OBJ) $(LIBFT_OBJ)

checker:
	@if [ -d "$(LIBFT_PATH)" ]; then echo "$(GREEN)[LIBFT FOLDER FOUND]$(END)"; else make download; fi

download:
	echo "$(GREEN)[CLONING LIBFT]$(END)"
	@git clone git@github.com:PTGus/libft.git $(LIBFT_PATH)

%.o: %.c
	@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	@$(RM) $(OBJ)
	@$(MAKE) -C $(LIBFT_PATH) clean

fclean: clean
	@$(RM) $(NAME)
	@if [ -d "$(LIBFT_PATH)" ]; then rm -rf $(LIBFT_PATH); fi

re: fclean all

.PHONY: all clean fclean re
