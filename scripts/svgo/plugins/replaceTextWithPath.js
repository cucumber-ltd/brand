const opentype = require('opentype.js')
const insigniaFont = opentype.loadSync('fonts/InsigniaLTStd.otf')
const robotoFont = opentype.loadSync('fonts/Roboto-Regular.ttf')

exports.type = 'perItem'
exports.active = false
exports.description = 'replaces text with path'

exports.fn = function(item, params) {
  if (item.isElem('text')) {
    const fontSize = parseFloat(item.attr('font-size').value)
    const fontFamily = item.attr('font-family').value
    const tspan = item.content.find(child => child.isElem('tspan'))
    const x = parseFloat(tspan.attr('x').value)
    const y = parseFloat(tspan.attr('y').value)
    const text = tspan.content[0].text

    let font
    if(fontFamily.match(/insignia/i)) {
      font = insigniaFont
    } else if(fontFamily.match(/roboto/i)) {
      font = robotoFont
    } else {
      // We'll do a hard exit since SVGO silently ignores exceptions.
      console.error(`Unsupported font: ${fontFamily}`)
      process.exit(1)
    }

    const path = font.getPath(text, x, y, fontSize)

    item.renameElem('path')
    item.addAttr({
      name: 'd',
      prefix: '',
      local: 'd',
      value: path.toPathData()
    })
    item.removeAttr('font-size')
    item.removeAttr('font-family')
    return item
  }
  return true
}
