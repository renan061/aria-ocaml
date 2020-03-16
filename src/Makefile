#
# Makefile
#

RM= rm -f

main: ast scanner parser
	ocamlopt ast.cmx parser.cmx scanner.cmx aria.ml
	./a.out

scanner: parser
	ocamllex scanner.mll
	ocamlopt parser.cmx scanner.ml

parser: ast
	menhir parser.mly
	ocamlopt ast.cmx parser.mli parser.ml

ast:
	ocamlopt ast.ml

clean:
	$(RM) *.o *.out *.cmi *.cmo *.cmx
	$(RM) scanner.ml parser.mli parser.ml
