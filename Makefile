NAME = libft
DIR_SRC = ./src
DIR_BUILD = ./build
FUNCTIONS =	ft_isalpha\
						ft_isdigit

OBJECTS = $(addsuffix .o, $(addprefix $(DIR_BUILD)/, $(FUNCTIONS)))

all: $(NAME)

$(NAME): $(OBJECTS)
	echo "TODO: CREATE ARCHIVE FROM OBJECTS"

$(DIR_BUILD)/%.o: $(DIR_SRC)/%.c | $(DIR_BUILD)
	cc -fsanitize=address -Wall -Wextra -Werror -c $^ -o $@

$(DIR_BUILD):
	mkdir $(DIR_BUILD)

clean:
	rm -rf $(DIR_BUILD)

fclean: clean
	rm -f $(NAME)

.PHONY: clean
