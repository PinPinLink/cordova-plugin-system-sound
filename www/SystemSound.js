var exec = require('cordova/exec');

var PLUGIN_NAME = 'SystemSound';

var SystemSound = {
    play: function(path, count, cb) {
        exec(cb, null, PLUGIN_NAME, 'play', [path, count]);
    },
};

module.exports = SystemSound;
