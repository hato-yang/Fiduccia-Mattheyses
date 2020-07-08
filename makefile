#Note, -g flag enabled by default

all: main.o dll_structure.o basic_objects.o populate_partitions.o data_input.o
	gcc -o main.out main.o dll_structure.o basic_objects.o populate_partitions.o data_input.o -g
	rm *.o
	./main.out

main: main.c main.h
	gcc -c main.c main.h

dll_structure: dll_structure.c dll_structure.h
	gcc -c dll_structure.c dll_structure.h

basic_objects: basic_objects.c basic_objects.h
	gcc -c basic_objects.c basic_objects.h

populate_partitions: populate_partitions.c populate_partitions.h
	gcc -c populate_partitions.c populate_partitions.h

data_input: data_input.c data_input.h
	gcc -c data_iput.c data_input.h



#Debug and memory checking commands
debug: all
	gdb ./main.out

valgrind: all 
	valgrind --leak-check=full --track-origins=yes ./main.out
	
