C_NAME = client
S_NAME = server
CB_NAME = client_bonus
SB_NAME = server_bonus
NAME = placeholder
CC = gcc
CFLAGS = -Wall -Wextra -Werror
HEADER_FILE = src/minitalk.h
PRINTF = printf/libftprintf.a
C_SRC = src/client.c
S_SRC = src/server.c
CB_SRC = src/client_bonus.c
SB_SRC = src/server_bonus.c

.PHONY: all re clean fclean bonus $(NAME) $(NAME_B)

all: $(NAME)

bonus: $(CB_NAME) $(SB_NAME)

$(NAME): client server

$(NAME_B): client_bonus server_bonus

client: $(C_SRC) $(HEADER_FILE)
	@make -C printf
	$(CC) $(CFLAGS) $(C_SRC) printf/libftprintf.a -o client

server: $(S_SRC) $(HEADER_FILE)
	@make -C printf
	$(CC) $(CFLAGS) $(S_SRC) printf/libftprintf.a -o server

client_bonus:
	@make -C printf
	$(CC) $(CFLAGS) $(CB_SRC) printf/libftprintf.a -o client_bonus

server_bonus:
	@make -C printf
	$(CC) $(CFLAGS) $(SB_SRC) printf/libftprintf.a -o server_bonus

clean:
	@make clean -C printf
	rm -f client server
	rm -f client_bonus server_bonus

fclean: clean
	@make fclean -C printf

re: fclean all