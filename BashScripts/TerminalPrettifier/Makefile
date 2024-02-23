# gcc -std=c11 -g -Wall -I../include src/problem.c -o ./mysolution -lm
# gcc -std=c11 -g -Wall -I ./terminal_prettifier_script_gen.c -o ./terminal_prettifier_script_gen -lm
all:
	gcc ./terminal_prettifier_script_gen.c -o terminal_prettifier_script_gen
clean:
	rm ./terminal_prettifier_script_gen
	@echo Cleanup complete!
run: all
	./terminal_prettifier_script_gen
test: all
	python ../scripts/sanitycheck.py 
mem: 
	valgrind ./terminal_prettifier_script_gen 5 5
install:
	pip install python-benedict
submit:
	@echo "You are in the wrong folder. cd .. and run make submit from the project directory"