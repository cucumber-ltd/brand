# Contributor Guidelines

## Prerequisites

* OS X
* [Sketch](https://www.sketchapp.com/)
* Node.js
* librsvg, to create PNGs from SVGs: `brew install librsvg`
* ImageMagick, to create JPGs from PNGs: `brew install imagemagick`
* Roboto and Insignia fonts installed - see the `fonts` directory

## Editing images (Originals with ® symbol)

Don't edit the files under '/images' - they are generated from source SVGs in
`/src`.

These SVG files should preferrably be edited with [Sketch](https://www.sketchapp.com/).
They should all have a ® symbol unsing the `Roboto` font.

The outer circle of the ® should fit exactly inside a pip. It should be aligned top and right
with the cucumber mark logo.

Text such as `cucumber` and `cukeup` should *always* be in lower case (No, `CukeUp` is not ok).

Export it as SVG by selecting the topmost element and choose `File -> Export -> Export Canvas`

When you're done editing, clean it up:

    npm install
    ./node_modules/.bin/svgo --pretty src/THE-SVG.svg

Verify colours:

* Make sure all colours are in the official palette (see `/Cucumber_Branc_V1.0.pdf`)
* The *variable* colours (which we'll generate into red,green,purple,orange,yellow,black) should be `#000`

## Generate SVGs, PNGs, PDFs and JPGs

    ./scripts/make

That's it! You should now have a lot of images in the `images/**` folders.

The text in the generated SVG files should have been converted to paths, so that they
can be used without the Insignia and Roboto fonts installed.
