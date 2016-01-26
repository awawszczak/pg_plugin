module.exports = {
    showBannerAd: function (successCallback) {
        cordova.exec(successCallback,
            null, // No failure callback
            "FanServAd",
            "showBannerAd",
            []);
    },
    showInterstitialAd: function (successCallback) {
        cordova.exec(successCallback,
            null, // No failure callback
            "FanServAd",
            "showInterstitialAd",
            []);
    },
    hideAd: function (successCallback) {
        cordova.exec(successCallback,
            null, // No failure callback
            "FanServAd",
            "hideAd",
            []);
    },
    setHidden: function (successCallback) {
        cordova.exec(successCallback,
            null, // No failure callback
            "FanServAd",
            "setHidden",
            []);
    },
    setVisible: function (successCallback) {
        cordova.exec(successCallback,
            null, // No failure callback
            "FanServAd",
            "setVisible",
            []);
    }
};