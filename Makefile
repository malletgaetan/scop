NAME=scop
CC=g++
AR=ar rcs
CFLAGS=-Wall -Wextra -Werror
SHARED_LIBS=-lglfw -lGL -lX11 -lpthread -lXrandr -lXi -ldl
GLADLIB=glad/libglad.a
GLADLIB_INC=-L . -l:./glad/libglad.a

SRCS=main.cpp
OBJS=main.o

all: $(NAME)

$(GLADLIB): glad
	$(CC) $(CFLAGS) -c glad/glad.c -o glad/glad.o
	$(AR) $@ glad/glad.o

$(NAME): $(GLADLIB) $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(GLADLIB_INC) $(SHARED_LIBS)

%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@ $(GLADLIB_INC) $(SHARED_LIBS)

clean:
	rm -rf **.o

fclean:	clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
