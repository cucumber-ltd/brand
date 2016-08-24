TM_FILES = $(shell find src/tm -type f -name "*.svg")
NOTM_FILES = $(patsubst src/tm/%.svg,src/notm/%.svg,$(TM_FILES))

color-svgs: notms ./src/create-color-copies
	mkdir -p svg/tm
	mkdir -p svg/notm

	./src/create-color-copies src/tm/cucumber-mark.svg   svg/tm
	./src/create-color-copies src/notm/cucumber-mark.svg svg/notm

	./src/create-color-copies src/tm/cucumber.svg   svg/tm
	./src/create-color-copies src/notm/cucumber.svg svg/notm
.PHONY: colors

notms: $(NOTM_FILES)

src/notm/%.svg: src/tm/%.svg node_modules/svgo/plugins/removeTradeMark.js .svgo.yml
	mkdir -p $$(dirname "$@")
	./node_modules/.bin/svgo --config .svgo.yml --output "$@" "$<"

node_modules/svgo/plugins/removeTradeMark.js: src/svgo/plugins/removeTradeMark.js ./node_modules/.bin/svgo
	cp $< $@

./node_modules/.bin/svgo:
	npm install

clean:
	rm -Rf src/notm/* svg/tm/* svg/notm/*
.PHONY: clean

clobber: clean
	rm -Rf node_modules
.PHONY: clobber
