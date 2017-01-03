exports.type = 'perItem'
exports.active = false
exports.description = 'removes ® text and empty text'

exports.fn = function(item, params) {
  if (item.isElem('tspan')) {
    if(
      item.content &&
      item.content[0] &&
      item.content[0].text == "®"
    ) {
      return false
    }
  }
  return true
}
