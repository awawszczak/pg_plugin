#import "FanServAd.h"
#import <FanServerFramework/FanServer.h>

@interface FanServAd()

@property (nonatomic, weak) UIView * adView;

@end

@implementation FanServAd

- (void)pluginInitialize
{
    [FanServer setupWithAppID:@"24436b44f3ee49688ddfc508c599c1d6" serverAddress:FanServerProd];
}

- (void)showBannerAd:(CDVInvokedUrlCommand*)command
{
    [FanServer createAdViewWithSize:FanServerAdSizeBanner320x50 success:^(UIView *advertisementView) {
        UIView * view = [[[UIApplication sharedApplication] delegate] window];
        CGRect newFrame = advertisementView.frame;
        newFrame.origin.y = view.frame.size.height - 49 - newFrame.size.height;
        advertisementView.frame = newFrame;
        [view addSubview:advertisementView];
        self.adView = advertisementView;
        NSLog(@"%@", self.adView);

    } failure:^(NSError *error) {
        NSLog(@"Advertismenet view creation failed");
    }];
}

- (void)showInterstitialAd:(CDVInvokedUrlCommand*)command
{
    [FanServer showAdViewWithSize:FanServerAdSizePhoneInterstitial];
}

- (void) hideAd:(CDVInvokedUrlCommand*)command {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.adView && self.adView.superview) {
            [self.adView removeFromSuperview];
        }
    });
}

- (void) setHidden:(CDVInvokedUrlCommand*)command {
    if (self.adView) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                [self.adView setAlpha: 0];
            }];
        });
    }
}

- (void) setVisible:(CDVInvokedUrlCommand*)command {
    if (self.adView) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                [self.adView setAlpha: 1];
            }];
        });
    }
}

@end
