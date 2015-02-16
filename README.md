# Cucumber Brand

All Cucumber logos are © Cucumber Limited.

## Conversions

Use the following steps when converting images

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
