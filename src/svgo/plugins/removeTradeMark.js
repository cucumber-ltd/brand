'use strict';

exports.type = 'perItem';
exports.active = true;
exports.description = 'removes id="™" elements';
exports.params = {
    text: true,
    tspan: true,
    tref: true
};

exports.fn = function(item, params) {
  const tm = item.attr("id") && item.attr("id").value == "™"
  return !tm
};
