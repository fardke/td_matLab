# Makefile
# generated on Tue Jan 04 15:00:38 +0100 2011
# by Kévin Fardel et Rick Ghanem
# With the Condom lib (version 1.1.0)
# See http://github.com/v0n/condom

FINAL_FILENAME=document
FILENAME=main
VIEWER=xdg-open
RUBBER=$(shell which rubber)

all: $(FILENAME).tex
ifeq ($(RUBBER),)
	@pdflatex $(FILENAME).tex
	@pdflatex $(FILENAME).tex
	@echo -e "\nYou should install the rubber package ;)"
else
	@$(RUBBER) -d $(FILENAME).tex
endif
ifneq ($(FILENAME),$(FINAL_FILENAME))
	@mv $(FILENAME).pdf $(FINAL_FILENAME).pdf
endif

view: all
	@$(VIEWER) $(FINAL_FILENAME).pdf

clean:
	@echo "cleaning..."
	@rm -f *.aux *.log *.out *.toc *.lol *.lof
	@rm -f inc/*.aux
	@rm -f $(FINAL_FILENAME).tar

archive: all clean
	@tar -cf $(FINAL_FILENAME).tar *
	@echo "archived in $(FINAL_FILENAME).tar"
