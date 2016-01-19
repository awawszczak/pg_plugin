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
    }
};