module.exports = {
    alert: function(successCallback) {
        cordova.exec(successCallback,
            null, // No failure callback
            "Alert",
            "alert",
            []);
    }
};