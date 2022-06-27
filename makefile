t2:	lex.l parser.y
	clear
	bison -d parser.y
	flex lex.l
	@echo "[+]Compiling..."
	gcc -o main parser.tab.c lex.yy.c -lfl -lm
	@echo "[+]Runnig..."
	./main