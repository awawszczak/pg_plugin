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
    } failure:^(NSError *error) {
        NSLog(@"Advertismenet view creation failed");
    }];
}

- (void)showInterstitialAd:(CDVInvokedUrlCommand*)command
{
    [FanServer showAdViewWithSize:FanServerAdSizePhoneInterstitial];
}

- (void) hideAd:(CDVInvokedUrlCommand*)command {
    UIViewController * vc = [UIViewController new];
    [vc viewWillDisappear:YES];
    [vc viewDidDisappear:YES];
}

- (void) setHidden:(CDVInvokedUrlCommand*)command {
    if (self.adView) {
        [self.adView setHidden: YES];
    }
}

- (void) setVisible:(CDVInvokedUrlCommand*)command {
    if (self.adView) {
        [self.adView setHidden: NO];
    }
}

@end
