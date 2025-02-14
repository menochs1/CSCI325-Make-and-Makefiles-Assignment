# Author: Mason Enochs
# File Name: Makefile
# Date: 2-14-2025
# Brief: To compile and link the employee files together with one command

CC = g++ #define compiler
TARGET = employee # name of the build target
CFLAGS = -c -Wall -Wextra # warnings and erros

all: $(TARGET)

$(TARGET): main.o Employee.o Officer.o Supervisor.o #links all .o files together
	$(CC) -g -Wall -Wextra -o $(TARGET) main.o Employee.o Officer.o Supervisor.o

Employee.o: Employee.cpp Employee.h #compiles employee
	$(CC) $(CFLAGS) Employee.cpp

Officer.o: Officer.cpp Officer.h #compiles officer
	$(CC) $(CFLAGS) Officer.cpp

Supervisor.o: Supervisor.cpp Supervisor.h #compiles supervisor
	$(CC) $(CFLAGS) Supervisor.cpp

main.o: main.cpp Officer.h Supervisor.h Employee.h #compiles main
	$(CC) $(CFLAGS) main.cpp

clean: #cleans up by removing .o and emacs backup files
	$(RM) $(TARGET) *.o *~
