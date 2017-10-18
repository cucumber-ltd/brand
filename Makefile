SRC_SVGS         = $(wildcard src/*.svg)
NOFONT_NOTM_SVGS = $(patsubst src/%.svg,tmp/notm/%.svg,$(SRC_SVGS))
NOFONT_TM_SVGS   = $(patsubst src/%.svg,tmp/tm/%.svg,$(SRC_SVGS))

SVGS             = $(wildcard images/svg/*/*.svg)
PDF_DIRS         = $(patsubst images/svg/%.svg,images/pdf/%,$(SVGS))
PDFS             = $(wildcard images/pdf/*/*/*.pdf)
PNG_DIRS         = $(patsubst images/svg/%.svg,images/png/%,$(SVGS))
PNGS             = $(wildcard images/png/*/*/*.png)
JPGS             = $(patsubst images/png/%.png,images/jpg/%.jpg,$(PNGS))

pdfs: $(PDF_DIRS)

pngs: $(PNG_DIRS)

jpgs: $(JPGS)

images/jpg/%.jpg: images/png/%.png
	mkdir -p $$(dirname "$@")
	convert -background white -flatten $< $@

images/png/%: images/svg/%.svg
	@mkdir -p $@
	./scripts/rsvg-convert-dir $< $@ png

images/pdf/%: images/svg/%.svg
	@mkdir -p $@
	./scripts/rsvg-convert-dir $< $@ pdf

color-svgs: $(NOFONT_NOTM_SVGS) $(NOFONT_TM_SVGS) ./scripts/create-color-copies
	mkdir -p images/svg/tm
	mkdir -p images/svg/notm

	./scripts/create-color-copies tmp/tm/cucumber-mark.svg   images/svg/tm    red,green,purple,orange,yellow,black,grey
	./scripts/create-color-copies tmp/notm/cucumber-mark.svg images/svg/notm  red,green,purple,orange,yellow,black,grey

	./scripts/create-color-copies tmp/notm/cucumber-mark-transparent-pips.svg images/svg/notm  dark-grey

	./scripts/create-color-copies tmp/tm/cucumber.svg        images/svg/tm   black,white
	./scripts/create-color-copies tmp/notm/cucumber.svg      images/svg/notm black,white

	./scripts/create-color-copies tmp/tm/cucumber-school.svg        images/svg/tm   black,white
	./scripts/create-color-copies tmp/notm/cucumber-school.svg      images/svg/notm black,white

	./scripts/create-color-copies tmp/tm/cucumber-pro.svg        images/svg/tm   black,white
	./scripts/create-color-copies tmp/notm/cucumber-pro.svg      images/svg/notm black,white

	./scripts/create-color-copies tmp/tm/cucumber-ltd.svg        images/svg/tm   black,white
	./scripts/create-color-copies tmp/notm/cucumber-ltd.svg      images/svg/notm black,white

	./scripts/create-color-copies tmp/tm/cukeup.svg        images/svg/tm   black,white
	./scripts/create-color-copies tmp/notm/cukeup.svg      images/svg/notm black,white

	./scripts/create-color-copies tmp/tm/cucumber-mark-transparent-pips.svg        images/svg/tm   black,white
	./scripts/create-color-copies tmp/notm/cucumber-mark-transparent-pips.svg      images/svg/notm black,white

	./scripts/create-color-copies tmp/tm/bdd-kickstart.svg        images/svg/tm   black,white
	./scripts/create-color-copies tmp/notm/bdd-kickstart.svg      images/svg/notm black,white
.PHONY: colors

tmp/notm/%.svg: src/%.svg node_modules/svgo/plugins/removeTradeMark.js node_modules/svgo/plugins/removeWhitespaceText.js node_modules/svgo/plugins/removeWhitespaceText.js node_modules/svgo/plugins/replaceTextWithPath.js .svgo.yml
	mkdir -p $$(dirname "$@")
	./node_modules/.bin/svgo --config .svgo.yml --enable removeTradeMark      --pretty --output "$@.notm" "$<"
	./node_modules/.bin/svgo --config .svgo.yml --enable removeWhitespaceText --pretty --output "$@.notm.nowhitespace" "$@.notm"
	./node_modules/.bin/svgo --config .svgo.yml --enable replaceTextWithPath  --pretty --output "$@" "$@.notm.nowhitespace"
	rm -rf "$@.notm.nowhitespace" "$@.notm"

tmp/tm/%.svg: src/%.svg node_modules/svgo/plugins/removeTradeMark.js node_modules/svgo/plugins/removeWhitespaceText.js node_modules/svgo/plugins/removeWhitespaceText.js node_modules/svgo/plugins/replaceTextWithPath.js .svgo.yml
	mkdir -p $$(dirname "$@")
	./node_modules/.bin/svgo --config .svgo.yml --enable replaceTextWithPath --pretty --output "$@" "$<"

node_modules/svgo/plugins/removeTradeMark.js: scripts/svgo/plugins/removeTradeMark.js ./node_modules/.bin/svgo
	cp $< $@

node_modules/svgo/plugins/removeWhitespaceText.js: scripts/svgo/plugins/removeWhitespaceText.js ./node_modules/.bin/svgo
	cp $< $@

node_modules/svgo/plugins/replaceTextWithPath.js: scripts/svgo/plugins/replaceTextWithPath.js ./node_modules/.bin/svgo
	cp $< $@

./node_modules/.bin/svgo:
	npm install

clean:
	rm -Rf tmp images
.PHONY: clean

clobber: clean
	rm -Rf node_modules
.PHONY: clobber
