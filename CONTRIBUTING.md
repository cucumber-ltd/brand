# Contributor Guidelines

## Prerequisites

* OS X
* [Sketch](https://www.sketchapp.com/)
* Node.js
* librsvg, to create PNGs from SVGs: `brew install librsvg`
* ImageMagick, to create JPGs from PNGs: `brew install imagemagick`
* Roboto and Insignia fonts installed - see the `fonts` directory

## Image sources

Image sources are SVG files under `/src`.

All of the images under `/images` are generated from `/src`. Do not manually add or modify
any files under `/images`.

SVG files under `/src` should preferably be edited with [Sketch](https://www.sketchapp.com/).

## The ® symbol

All `/src` logos should have a ® symbol (in the `Roboto` font) next to the Cucumber logo.
There will be generated logos under `/images` with and without the ® symbol.

The outer circle of the ® should fit exactly inside a pip. It should be aligned top and right
with the cucumber mark logo.

## Text colour

Text to the left of the logo should always be `#000` in `/src` images.
Text to the right of the logo (if any) should always be the same colour as the logo.

## Lower case

Text such as `cucumber` and `cukeup` should *always* be in lower case (No, `CukeUp` is not ok).

## Derived logos

New logos derived from existing logos should be approved by Cucumber Ltd. Here is
a non-exhaustive list of guidelines:

* The logo should be usable on white background (use transparent background)
* The pips in the Cucumber logo should always be white (not transparent, not a different colour, just white)
* The logo should not be placed inside, outside or very close to, a different shape or logo

Also see the PDF for guidelines about colours, padding, fonts etc.

## Adding/editing images

If you're adding a new logo, start by making a copy of an existing one from `/src`.

When you're done editing, adjust the width of the entire SVG by dragging the left
(and right) edges of the logo text. The padding should be the width of a 'c' (see `/Cucumber_Brand_V1.0.pdf`).

Export it as SVG by selecting the topmost element and choose `File -> Export -> Export Canvas`.
In the bottom corner, select SVG, then press the big export button to save the SVG.

When you're done editing, clean it up:

    yarn
    ./node_modules/.bin/svgo --pretty src/THE-SVG.svg
    # Manually remove the `<title>` element in the SVG

Verify colours:

* Make sure all colours are in the official palette (see `/Cucumber_Brand_V1.0.pdf`)
* The *variable* colours (which we'll generate into red,green,purple,orange,yellow,black) should be `#000`

## Generate SVGs, PNGs, PDFs and JPGs

If you've added a new logo - you'll also have to add a couple of lines in the `color-svgs`
target in the `Makefile`.

    ./scripts/make

That's it! You should now have a lot of images in the `images/**` folders.

The text in the generated SVG files should have been converted to paths, so that they
can be used without the Insignia and Roboto fonts installed.
