# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gumendes <gumendes@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/15 09:43:19 by gumendes          #+#    #+#              #
#    Updated: 2025/01/21 16:33:09 by gumendes         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Flags
CC				=	cc
RM				=	rm -f
CFLAGS			=	-Wall -Wextra -Werror -g

# Library Paths
LIBFT_PATH		=	Libft/libft

# Libraries
LIBFT			=	$(LIBFT_PATH)/libft.a

# Includes
INCLUDES = -I$(LIBFT_PATH)

# Output Name
NAME = libftprintf.a

# Source Files
SRC = ft_printf.c ft_printlowhexa.c ft_printnbr.c ft_printptr.c \
	  ft_printstr.c ft_printuphexa.c ft_printutils.c ft_printunbr.c

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
	$(MAKE) -C $(LIBFT_PATH)

# Build the printf library
$(NAME): $(OBJ) $(LIBFT_OBJ)
	ar rcs $(NAME) $(OBJ) $(LIBFT_OBJ)

checker:
	@if [ -d "Libft" ]; then echo "$(GREEN)[LIBFT FOLDER FOUND]$(END)"; else make download; fi

download:
	git clone git@github.com:PTGus/Libft.git Libft

clean:
	$(RM) $(OBJ)
	$(MAKE) -C $(LIBFT_PATH) clean

fclean: clean
	$(RM) $(NAME)
	rm -rf Libft

re: fclean all

.PHONY: all clean fclean re
