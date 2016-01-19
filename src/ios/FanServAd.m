#import "FanServAd.h"

@implementation Alert
- (void)pluginInitialize
{
    UIAlertView * av = [[UIAlertView alloc] initWithTitle:@"Plugin initialized"
                                                  message:@""
                                                 delegate:self
                                        cancelButtonTitle:@"OK"
                                        otherButtonTitles:nil];
    [av show];
}

- (void)showBannerAd:(CDVInvokedUrlCommand*)command
{
    UIAlertView * av = [[UIAlertView alloc] initWithTitle:@"showBannerAd"
                                                  message:@""
                                                 delegate:self
                                        cancelButtonTitle:@"OK"
                                        otherButtonTitles:nil];
    [av show];
}

- (void)showInterstitialAd:(CDVInvokedUrlCommand*)command
{
    UIAlertView * av = [[UIAlertView alloc] initWithTitle:@"showInterstitialAd"
                                                  message:@""
                                                 delegate:self
                                        cancelButtonTitle:@"OK"
                                        otherButtonTitles:nil];
    [av show];
}

@end
