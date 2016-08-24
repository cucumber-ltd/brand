TM_FILES = $(shell find src/tm -type f -name "*.svg")
NOTM_FILES = $(patsubst src/tm/%.svg,src/notm/%.svg,$(TM_FILES))

colors: notms ./src/create-color-copies
	mkdir -p svg/tm
	./src/create-color-copies src/tm/cucumber-mark.svg svg/tm

	mkdir -p svg/notm
	./src/create-color-copies src/notm/cucumber-mark.svg svg/notm
.PHONY: colors

notms: $(NOTM_FILES)

src/notm/%.svg: src/tm/%.svg node_modules/svgo/plugins/removeTradeMark.js
	mkdir -p $$(dirname "$@")
	./node_modules/.bin/svgo --config .svgo.yml --output "$@" "$<"

node_modules/svgo/plugins/removeTradeMark.js: src/svgo/plugins/removeTradeMark.js ./node_modules/.bin/svgo
	cp $< $@

./node_modules/.bin/svgo:
	npm install

clean:
	rm -Rf node_modules src/notm/* svg/tm/* svg/notm/*
.PHONY: clean
