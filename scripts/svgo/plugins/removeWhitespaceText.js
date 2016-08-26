'use strict';

exports.type = 'perItem';
exports.active = false;
exports.description = 'removes <text> nodes with only whitespace';

exports.fn = function(item, params) {
  if (item.isElem('text')) {
    const hasContents = item.content.find(child => child.text != '')
    if(!hasContents) return false
  }
  return true
}
