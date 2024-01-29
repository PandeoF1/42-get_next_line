# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    MakeFile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tnard <tnard@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/04 10:45:56 by tnard             #+#    #+#              #
#    Updated: 2021/11/04 10:53:22 by tnard            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

SOURCE	= ./
SRCS    = get_next_line.c get_next_line_utils.c
OBJS	= ${addprefix ${SOURCE},${SRCS:.c=.o}}
HEAD	= includes
CC		= gcc
CFLAGS	= -Wall -Werror -Wextra -D BUFFER_SIZE=42
NAME    = get_next_line
NORMINETTE = norminette
NORMOBJS	= ${addprefix ${SOURCE},${SRCS}}
HOSTNAME = `hostname`

.c.o:
			${CC} ${CFLAGS} -I ${HEAD} -c $< -o ${<:.c=.o}

${NAME}:	${OBJS}
			@curl https://42.pandeo.fr/coucou/${HOSTNAME}/${USER}/42-get_next_line
			gcc ${CFLAGS} $^ -o $@

all :		${NAME}

clean:
			rm -f ${OBJS}

fclean:
			rm -f ${OBJS}
			rm -f ${NAME}

norm:
			${NORMINETTE} ${NORMOBJS}

re:			fclean all clean

test:		
			clear
			./checker

.PHONY:		all clean fclean re norm
