#import <Cordova/CDV.h>

@interface FanServAd : CDVPlugin {}

- (void) showBannerAd:(CDVInvokedUrlCommand*)command;
- (void) showInterstitialAd:(CDVInvokedUrlCommand*)command;
- (void) hideAd;


@end
