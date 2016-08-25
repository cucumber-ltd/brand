# The source SVGs (the only ones that should be edited)
SRC_SVGS = $(wildcard src/*.svg)
# Copies of source SVGs, with ™ symbol removed
NOTM_SRC_SVGS = $(patsubst src/%.svg,src/tmp/notm/%.svg,$(SRC_SVGS))

SVGS = $(wildcard src/*/*.svg)
PNG_DIRS = $(patsubst src/%.svg,images/png/%,$(SVGS))

HEIGHTS = 16 32 64 128 256 512

pngs: $(PNG_DIRS)

images/png/%: src/%.svg
	@mkdir -p $@
	./scripts/create-scaled-pngs $< $@

color-svgs: $(NOTM_SRC_SVGS) ./scripts/create-color-copies
	mkdir -p src/tm
	mkdir -p src/notm

	./scripts/create-color-copies src/cucumber-mark.svg          src/tm
	./scripts/create-color-copies src/tmp/notm/cucumber-mark.svg src/notm
.PHONY: colors

src/tmp/notm/%.svg: src/%.svg node_modules/svgo/plugins/removeTradeMark.js .svgo.yml
	mkdir -p $$(dirname "$@")
	./node_modules/.bin/svgo --config .svgo.yml --output "$@" "$<"

node_modules/svgo/plugins/removeTradeMark.js: scripts/svgo/plugins/removeTradeMark.js ./node_modules/.bin/svgo
	cp $< $@

./node_modules/.bin/svgo:
	npm install

clean:
	rm -Rf src/tmp src/tm src/notm images
.PHONY: clean

clobber: clean
	rm -Rf node_modules
.PHONY: clobber
