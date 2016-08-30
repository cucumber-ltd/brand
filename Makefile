SRC_SVGS      = $(wildcard src/*.svg)
NOTM_SRC_SVGS = $(patsubst src/%.svg,src/tmp/notm/%.svg,$(SRC_SVGS))

SVGS          = $(wildcard images/svg/*/*.svg)
PNG_DIRS      = $(patsubst images/svg/%.svg,images/png/%,$(SVGS))
PNGS          = $(wildcard images/png/*/*/*.png)
JPGS          = $(patsubst images/png/%.png,images/jpg/%.jpg,$(PNGS))

jpgs: $(JPGS)

pngs: $(PNG_DIRS)

images/jpg/%.jpg: images/png/%.png
	mkdir -p $$(dirname "$@")
	convert -background white -flatten $< $@

images/png/%: images/svg/%.svg
	@mkdir -p $@
	./scripts/create-scaled-pngs $< $@

color-svgs: $(NOTM_SRC_SVGS) ./scripts/create-color-copies
	mkdir -p images/svg/tm
	mkdir -p images/svg/notm

	./scripts/create-color-copies src/cucumber-mark.svg          images/svg/tm    red,green,purple,orange,yellow,black
	./scripts/create-color-copies src/tmp/notm/cucumber-mark.svg images/svg/notm  red,green,purple,orange,yellow,black

	./scripts/create-color-copies src/cucumber.svg               images/svg/tm   black,white
	./scripts/create-color-copies src/tmp/notm/cucumber.svg      images/svg/notm black,white

	./scripts/create-color-copies src/cucumber-school.svg               images/svg/tm   black,white
	./scripts/create-color-copies src/tmp/notm/cucumber-school.svg      images/svg/notm black,white

	./scripts/create-color-copies src/cucumber-pro.svg               images/svg/tm   black,white
	./scripts/create-color-copies src/tmp/notm/cucumber-pro.svg      images/svg/notm black,white

	./scripts/create-color-copies src/cukeup.svg               images/svg/tm   black,white
	./scripts/create-color-copies src/tmp/notm/cukeup.svg      images/svg/notm black,white

	./scripts/create-color-copies src/cucumber-mark-transparent-pips.svg               images/svg/tm   black,white
	./scripts/create-color-copies src/tmp/notm/cucumber-mark-transparent-pips.svg      images/svg/notm black,white
.PHONY: colors

src/tmp/notm/%.svg: src/%.svg node_modules/svgo/plugins/removeTradeMark.js node_modules/svgo/plugins/removeWhitespaceText.js .svgo.yml
	mkdir -p $$(dirname "$@")
	./node_modules/.bin/svgo --config .svgo.yml --enable removeTradeMark --enable removeWhitespaceText --pretty --output "$@" "$<"

node_modules/svgo/plugins/removeTradeMark.js: scripts/svgo/plugins/removeTradeMark.js ./node_modules/.bin/svgo
	cp $< $@

node_modules/svgo/plugins/removeWhitespaceText.js: scripts/svgo/plugins/removeWhitespaceText.js ./node_modules/.bin/svgo
	cp $< $@

./node_modules/.bin/svgo:
	npm install

clean:
	rm -Rf src/tmp images
.PHONY: clean

clobber: clean
	rm -Rf node_modules
.PHONY: clobber
