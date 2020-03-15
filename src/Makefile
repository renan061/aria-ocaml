#
# Makefile
#

RM= rm -f

main: scanner
	ocamlopt scanner.cmx aria.ml
	./a.out

scanner:
	ocamllex scanner.mll
	ocamlopt scanner.mli scanner.ml

clean:
	$(RM) *.o *.out *.cmi *.cmo *.cmx
	$(RM) scanner.ml
