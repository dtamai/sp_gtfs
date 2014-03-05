DATA_DIR=./data/tmp
TSV_DIR=$(DATA_DIR)/tsv
JSON_DIR=$(DATA_DIR)/json

all: init split shrink

init:
	mkdir -p $(TSV_DIR)
	mkdir -p $(JSON_DIR)

split: init
	Rscript -e 'source("shapes.R"); split.shapes();'

shrink: init split
	./shrink_shapes

clean:
	rm -rf $(TSV_DIR)
	rm -rf $(JSON_DIR)

