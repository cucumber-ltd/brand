'use strict';

exports.type = 'perItem';

exports.active = true;

exports.description = 'removes <text id="™"> elements';

exports.params = {
    text: true,
    tspan: true,
    tref: true
};

exports.fn = function(item, params) {
    return item.attr("id") == "™"
};
