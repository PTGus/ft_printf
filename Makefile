# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/15 09:43:19 by gumendes          #+#    #+#              #
#    Updated: 2025/02/13 13:11:13 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Flags
CC				=	cc
RM				=	rm -rf
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
	@if [ -d "$(LIBFT_PATH)" ]; then echo "$(GREEN)[LIBFT DEPENDENCIES FOUND]$(END)"; else make download; fi

download:
	echo "$(GREEN)[CLONING LIBFT]$(END)"
	@git clone git@github.com:PTGus/libft.git $(LIBFT_PATH)

%.o: %.c
	@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	@$(RM) $(OBJ)
	@$(RM) $(LIBFT_PATH)/.build

fclean: clean
	@$(RM) $(NAME)
	@if [ -d "$(LIBFT_PATH)" ]; then rm -rf $(LIBFT_PATH); fi

re: fclean all

.PHONY: all clean fclean re

#==============================================================================#
#                                  UTILS                                       #
#==============================================================================#

# Colors
#
# Run the following command to get list of available colors
# bash -c 'for c in {0..255}; do tput setaf $c; tput setaf $c | cat -v; echo =$c; done'
#
B  		= $(shell tput bold)
BLA		= $(shell tput setaf 0)
RED		= $(shell tput setaf 1)
GRN		= $(shell tput setaf 2)
YEL		= $(shell tput setaf 3)
BLU		= $(shell tput setaf 4)
MAG		= $(shell tput setaf 5)
CYA		= $(shell tput setaf 6)
WHI		= $(shell tput setaf 7)
GRE		= $(shell tput setaf 8)
BRED 	= $(shell tput setaf 9)
BGRN	= $(shell tput setaf 10)
BYEL	= $(shell tput setaf 11)
BBLU	= $(shell tput setaf 12)
BMAG	= $(shell tput setaf 13)
BCYA	= $(shell tput setaf 14)
BWHI	= $(shell tput setaf 15)
D 		= $(shell tput sgr0)
BEL 	= $(shell tput bel)
CLR 	= $(shell tput el 1)
