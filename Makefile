#
# Makefile
#

RM= rm -f

scanner:
	ocamllex scanner.mll
	ocamlc scanner.ml
	./a.out

clean:
	$(RM) *.out *.cmi *.cmo
	$(RM) scanner.ml
