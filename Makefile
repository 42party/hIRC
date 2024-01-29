NAME      := ircserv
SRCS      := src/main.cpp
HEADER    := src/header/ircserv.hpp
OBJ_DIR   := src/objects
OBJ       := $(SRCS:%=$(OBJ_DIR)/%.o)  # Corrected path
DEPS      := $(OBJS:.o=.d)
CPP       := c++
CFLAGS    := -g -Wall -Wextra -Werror # -fsanitize=leak
RM        := rm -rf

$(OBJ_DIR):
	@mkdir -p $@

$(OBJ_DIR)/%.o: %.cpp $(HEADER) | $(OBJ_DIR)
	@$(CPP) $(CFLAGS) -c $< -o $@

RED			=		\033[0;31m
GREEN		=		\033[0;32m
YELLOW		=		\033[0;33m
BLUE		=		\033[0;34m
MAGENTA		=		\033[0;35m
CYAN		=		\033[0;36m
RESET		=		\033[0m

$(BUILD_DIR)%.cpp.o:	%.cpp
		@mkdir -p $(dir $@)
		@$(CPP) $(CFLAGS) -c $< -o $@

$(NAME):	$(SRCS) $(HEADER)
	@$(CPP) $(CFLAGS) $(SRCS) -o $(NAME)
	@echo "$(GREEN)compiler successfully!!$(RESET)"

all: $(NAME)

run:
	make && clear && ./$(NAME)

val:
	clear && valgrind --memcheck:leak-check=full --show-reachable=yes ./$(NAME)

clean:
	@echo "$(RED)\tCleaning .o ...$(RESET)"
	@$(RM) $(OBJ_DIR)
	@echo "$(GREEN)\tObjects(.o) Deleted...$(RESET)"

fclean: clean
	@echo "$(RED)\tCleaning program and others$(RESET)"
	@$(RM) $(NAME)
	@$(RM) $(NAME).dSYM
	@echo "$(GREEN)\tDone.$(RESET)"

re: fclean all

.PHONY: all clean fclean re
