var exec = require('cordova/exec');

exports.collectData = function(successCallback, errorCallback) {
    exec(successCallback, errorCallback,  'CredoLabPlugin', 'collectData');
};