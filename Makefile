# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yeonhkim <yeonhkim@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/23 03:31:09 by yeonhkim          #+#    #+#              #
#    Updated: 2022/07/23 10:29:20 by yeonhkim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= libft.a

CC		= cc
CFLAG	= -Wall -Wextra -Werror

RM		= rm -f

AR		= ar
ARFLAGS	= crs

INCLUDES	= ./libft.h

SRCS		= ft_strlen.c ft_strlcpy.c ft_strlcat.c		\
		  ft_strchr.c ft_strnstr.c ft_strncmp.c		\
		  ft_strdup.c ft_strrchr.c ft_strnstr.c		\
		  ft_memset.c ft_memcpy.c ft_memmove.c		\
		  ft_memchr.c ft_memcmp.c ft_bzero.c		\
		  ft_atoi.c	ft_calloc.c	ft_isalnum.c		\
		  ft_isalpha.c ft_isascii.c	ft_isdigit.c		\
		  ft_isprint.c ft_strdup.c ft_tolower.c		\
		  ft_toupper.c ft_substr.c ft_strjoin.c		\
		  ft_strtrim.c ft_split.c ft_itoa.c			\
		  ft_strmapi.c ft_striteri.c ft_putchar_fd.c	\
		  ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c	\

BONUS_SRCS = ft_lstnew.c		\
		  ft_lstsize.c		\
		  ft_lstadd_front.c	\
		  ft_lstadd_back.c	\
		  ft_lstclear.c	\
		  ft_lstlast.c		\
		  ft_lstiter.c		\
		  ft_lstmap.c		\
		  ft_lstdelone.c	\

OBJS		= $(SRCS:.c=.o)
BONUS_OBJS	= $(BONUS_SRCS:.c=.o)

ifdef WITH_BONUS
	TOTAL_OBJS = $(OBJS) $(BONUS_OBJS)
else
	TOTAL_OBJS = $(OBJS)
endif

bonus : 
	make WITH_BONUS=1 all

all : $(NAME)

%.o : %.c
	$(CC) $(CFLAG) -c $< -o $@

clean :
	$(RM) $(RMFLAG) $(OBJS) $(BONUS_OBJS)

fclean : clean
	$(RM) $(RMFLAG) $(NAME)

re : 
	make fclean
	make all

$(NAME) : $(TOTAL_OBJS)
	$(AR) $(ARFLAGS) $@ $^

 .PHONY : all bonus clean fclean re
