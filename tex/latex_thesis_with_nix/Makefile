SRC_DIR=./src
OUT_DIR=./output

.PHONY: build
build:
	latexmk -pdf -lualatex ${SRC_DIR}/main.tex

.PHONY: watch
watch:
	latexmk -pdf -pvc -lualatex ${SRC_DIR}/main.tex

.PHONY: run
run:
	zathura ${OUT_DIR}/main.pdf 2>/dev/null &
