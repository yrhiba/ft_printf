# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yrhiba <yrhiba@student.1337.ma>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 01:30:17 by yrhiba            #+#    #+#              #
#    Updated: 2022/10/31 03:37:52 by yrhiba           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

FILES = ft_printf  ft_init_tab \
		ft_strdup ft_strjoin ft_strlen ft_atoi ft_isnum \
		ft_check_format ft_check_flags ft_check_flags_utils \
		ft_format_c ft_format_s ft_format_s_utils \

OBJS_DIR = objs/
INC = ft_printf.h
SRCS = $(FILES:=.c)
OBJS = $(addprefix $(OBJS_DIR), $(FILES:=.o))
CC = cc
CFLAGS = -Wall -Wextra -Werror

$(NAME) : $(OBJS)
	ar rcs $(NAME) $(OBJS)

$(OBJS_DIR)%.o : %.c $(INC)
	@mkdir -p $(OBJS_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

all : $(NAME)

clean :
	rm -rf $(OBJS_DIR)

fclean : clean
	rm -f $(NAME)

re : fclean all

t : all
	cc main.c -L . -l ftprintf

tclean :
	rm -rf a.out

tfclean : tclean
	rm -rf main.c

bonus : all

.PHONEY : all clean fclean re bonus
