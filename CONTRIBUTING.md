# Contributor Guidelines

## Prerequisites

* OS X
* Fonts
  * [Roboto](https://fonts.google.com/specimen/Roboto) for the ™ symbol
  * [Insignia](https://drive.google.com/drive/u/1/folders/0Bz4oWc7BivPTZVNUMjByWVRpbDQ) for the logotype
* [Sketch](https://www.sketchapp.com/)
* Node.js
* librsvg, to create PNGs from SVGs: `brew install librsvg`
* ImageMagick, to create JPGs from PNGs: `brew install imagemagick`

## Editing images (Originals with ™ symbol)

Don't edit the files under '/images' - they are generated from source SVGs in
`/src`.

These SVG files shouls preferrably be edited with [Sketch](https://www.sketchapp.com/).
They should all have a ™ symbol unsing the `Roboto` font.

Text such as `cucumber` and `cukeup` should *always* be in lower case (No, `CukeUp` is not ok).

When you're done editing, clean it up:

    ./node_modules/.bin/svgo --pretty src/THE-SVG.svg

Modify fonts:

* Change `font-family="Roboto-Regular, Roboto"` to `font-family="Roboto"`
* Change `font-family="InsigniaLTStd, Insignia LT Std"` to `font-family="Insignia LT Std"`

(Sketch sets `font-family`, which doesn't work with `rsvg-convert` until the part before the comma is removed).

Verify colours:

* Make sure all colours are in the official palette (see `/Cucumber_Branc_V1.0.pdf`)
* The *variable* colours (which we'll generate into red,green,purple,orange,yellow,black) should be `#000`

## Generate SVGs, PNGs and JPGs

    ./scripts/make

That's it! You should now have a lot of images in the `images/**` folders.

## TODO

* Add the Insignia font to git
* Write SVGO plugins for the TM id, font correction and verifying colours
* Improve Makefile so it doesn't rebuild everything every time
