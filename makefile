t2:	lexer.l parser.y
	bison -d parser.y
	flex lexer.l
	gcc -o teste parser.tab.c lex.yy.c -lfl -lm
	./teste