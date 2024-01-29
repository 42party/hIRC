NAME		=		ircserv

SRCS		=		src/main.c								\

HEADER 		= 		src/header/ircserv.h

OBJ_DIR		=		objects/

OBJ			=		$(addprefix $(OBJ_DIR), $(SRC:.c=.o))

CC			=		cc

CFLAGS		=		-g -Wall -Wextra -Werror #-fsanitize=leak

RM			=		rm -f

RED			=		\033[0;31m
GREEN		=		\033[0;32m
YELLOW		=		\033[0;33m
BLUE		=		\033[0;34m
MAGENTA		=		\033[0;35m
CYAN		=		\033[0;36m
RESET		=		\033[0m

$(OBJ_DIR)%.o:	%.c
		@mkdir -p $(OBJ_DIR)
		@$(CC) $(CFLAGS) -c $< -o $@

$(NAME):	$(SRCS) $(HEADER)
	@$(CC) $(CFLAGS) $(SRCS) -o $(NAME)
	@echo "$(GREEN)compiler successfully!!$(RESET)"

all: $(NAME)

run:
	make && clear && ./$(NAME)

val:
	clear && valgrind --memcheck:leak-check=full --show-reachable=yes ./$(NAME)

clean:
	@echo "$(MAGENTA)\tCleaning .o ...$(RESET)"
	@$(RM) $(OBJS)
	@echo "$(GREEN)\tObjects(.o) Deleted...$(RESET)"

fclean: clean
	@echo "$(RED)\tCleaning program and others$(RESET)"
	@$(RM) $(NAME)
	@$(RM) -r $(NAME).dSYM
	@echo "$(RED)\tDone.$(RESET)"

re: fclean all

.PHONY: all clean fclean re
