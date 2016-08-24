# Contributor Guidelines

## Originals with ™ symbol

All originals live in `src/tm`. These are the only files that should be edited
"by hand", typically with Sketch. When you're done editing, clean them up. Example:

    ./node_modules/.bin/svgo src/tm/cucumber-mark.svg

## Generate SVGs

You need Node.js for this, and a Linux or OS X machine.

    make color-svgs

That's it! Take a look in `svg/tm` and `svg/notm`.

## Generate PNGs

You'll need Cairo:

    http://stackoverflow.com/questions/10393675/rsvg-with-python-3-2-on-ubuntu
    brew install librsvg
    brew install python3
    pip3 install cairosvg==2.0.0rc5
    # If that fails, run `xcode-select --install` and try again

    make color-pngs

## Generate JPGs

You'll need ImageMagick:

    brew install python3
    pip3 install cairosvg==2.0.0rc5

    make color-pngs

## Temporary conversions

* src/notm
* build/notm/*-WxH

## Conversions

Use the following steps when converting SVGs to raster images.

### Create png from svg

* Open SVG in Inkscape
* Select all
* File -> Export Bitmap...
* Bitmap Size: pixels at 400 dpi
* Filename: png/[basename].png
* Export

### Add padding to the pngs with text

* Open png/[basename].png in Gimp
* Using the mouse, find out approx. width/height (should be the same) of the 'c' in pixels
* Add padding via Image -> Canvas size.
  * Width: add 2*n pixels
  * Height: add 1.5*n pixels
  * X: n pixels
  * Y: 0.5n pixels
  * Press Resize
* File -> Overwrite png/[basename].png
