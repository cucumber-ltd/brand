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
They should all have a ™ symbol in font Roboto

When you're done editing, clean it up:

    ./node_modules/.bin/svgo src/THE-SVG.svg

And finally, hand-edit the `<text>` element in the SVG that has the `™` symbol:
* Add `id="™"` so that the build scripts can generate `™`-less logos
* Modify `font-family="Roboto"` (Sketch might make it `font-family="Roboto-Regular, Roboto"`, which doesn't work with `rsvg-convert`)

For example:

```xml
<text id="™" fill="#000" font-family="Roboto" font-size="NN"><tspan x="..." y="...">™</tspan></text>
```

## Generate SVGs, PNGs and JPGs

    ./scripts/make

That's it! You should now have a lot of images in the `images/**` folders.
