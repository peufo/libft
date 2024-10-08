NAME = libft.a
NAME_SO = libft.so
DIR_SRC = ./
DIR_BUILD = build
DIR_TEST = .test
FLAGS = -Wall -Wextra -Werror

SOURCES		=	ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c ft_itoa.c ft_lstadd_back_bonus.c ft_lstadd_front_bonus.c ft_lstclear_bonus.c ft_lstdelone_bonus.c ft_lstiter_bonus.c ft_lstlast_bonus.c ft_lstmap_bonus.c ft_lstnew_bonus.c ft_lstsize_bonus.c ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_putstr.c ft_putstr_fd.c ft_split.c ft_strchr.c ft_strdup.c ft_striteri.c ft_strjoin.c ft_strlcat.c ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c ft_strnstr.c ft_strrchr.c ft_strtrim.c ft_substr.c ft_tolower.c ft_toupper.c 
FUNCTIONS	=	$(subst .c,,$(notdir $(SOURCES)))
OBJECTS		=	$(addsuffix .o, $(addprefix $(DIR_BUILD)/, $(FUNCTIONS)))
TESTS		=	$(addprefix $(DIR_TEST)/$(DIR_BUILD)/, $(FUNCTIONS))

SOURCES_BNS		=	ft_lstadd_back_bonus.c ft_lstadd_front_bonus.c ft_lstclear_bonus.c ft_lstdelone_bonus.c ft_lstiter_bonus.c ft_lstlast_bonus.c ft_lstmap_bonus.c ft_lstnew_bonus.c ft_lstsize_bonus.c 
FUNCTIONS_BNS	=	$(subst .c,,$(notdir $(SOURCES_BNS)))
OBJECTS_BNS		=	$(addsuffix .o, $(addprefix $(DIR_BUILD)/, $(FUNCTIONS_BNS)))
TESTS_BNS		=	$(addprefix $(DIR_TEST)/$(DIR_BUILD)/, $(FUNCTIONS_BNS))

OS			=	$(shell uname -s)
LIBS = -L. -lft
ifeq ($(OS),Linux)
	LIBS += -lbsd -ldl
endif

all: $(NAME) bonus

$(NAME): $(OBJECTS)
	@ar -cr $@ $^

bonus: $(OBJECTS_BNS)
	@ar -cr $(NAME) $(OBJECTS_BNS)

$(DIR_BUILD)/%.o: $(DIR_SRC)/%.c | $(DIR_BUILD)
	@cc $(FLAGS) -c $^ -o $@

$(DIR_BUILD):
	@mkdir $(DIR_BUILD)

so: $(OBJECTS)
	@cc -nostartfiles -shared -o libft.so $(OBJECTS)

test-build: all $(TESTS) $(TESTS_BNS)

test: all $(TESTS) $(TESTS_BNS)
	@./test.zsh

test-v: all $(TESTS) $(TESTS_BNS)
	@./test.zsh -v

$(DIR_TEST)/$(DIR_BUILD)/%: $(DIR_TEST)/%.c $(DIR_BUILD)/%.o | $(DIR_TEST)/$(DIR_BUILD)
	@cc $(FLAGS) -include libft.h -include $(DIR_TEST)/test.h $< -o $@ $(LIBS)

$(DIR_TEST)/$(DIR_BUILD):
	@mkdir $(DIR_TEST)/$(DIR_BUILD)

clean:
	rm -rf $(DIR_BUILD)
	rm -rf $(DIR_TEST)/$(DIR_BUILD)

fclean: clean
	rm -f $(NAME)
	rm -f $(NAME_SO)
	rm -rf $(DIR_TEST)/extern

re: fclean all
