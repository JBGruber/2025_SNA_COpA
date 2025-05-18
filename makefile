.PHONY: all check-extension

# Default target to build both output files
all: check-extension Social-Network-Analysis-II-4py.ipynb Social-Network-Analysis-II-4r.ipynb

# Check if extension exists, install if not
check-extension:
	@if [ ! -d "_extensions/jbgruber/targetlang" ]; then \
		echo "Installing required Quarto extension..."; \
		quarto add jbgruber/quarto-targetlang; \
	else \
		echo "Quarto extension already installed."; \
	fi

# Rule for Python output
Social-Network-Analysis-II-4py.ipynb: Social-Network-Analysis-II.qmd
	quarto render $< --no-execute --to targetlang-ipynb -o $@ --metadata target_lang:python

# Rule for R output
Social-Network-Analysis-II-4r.ipynb: Social-Network-Analysis-II.qmd
	quarto render $< --no-execute --to targetlang-ipynb -o $@ --metadata target_lang:r

# Clean target to remove generated files
.PHONY: clean
clean:
	rm -f Social-Network-Analysis-II-4py.ipynb Social-Network-Analysis-II-4r.ipynb