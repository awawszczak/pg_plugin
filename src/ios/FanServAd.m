#import "FanServAd.h"

@implementation FanServAd

- (void)pluginInitialize
{
    [FanServer setupWithAppID:@"24436b44f3ee49688ddfc508c599c1d6" serverAddress:FanServerProd];
    [FanServer setDisplayingDelegate:self];
}

- (void)showBannerAd:(CDVInvokedUrlCommand*)command
{
    [FanServer showAdViewWithSize:FanServerAdSizePhoneInterstitial];
    return;
    [FanServer createAdViewWithSize:FanServerAdSizeBanner320x50 success:^(UIView *advertisementView) {
        UIView * view = [[[UIApplication sharedApplication] delegate] window];
        CGRect newFrame = advertisementView.frame;
        newFrame.origin.y = view.frame.size.height - 49 - newFrame.size.height;
        advertisementView.frame = newFrame;
        [view addSubview:advertisementView];
    } failure:^(NSError *error) {
        NSLog(@"Advertismenet view creation failed");
    }];
}

- (void)showInterstitialAd:(CDVInvokedUrlCommand*)command
{
    [FanServer showAdViewWithSize:FanServerAdSizePhoneInterstitial];
}

- (void) hideAd {
    UIViewController * vc = [UIViewController new];
    [vc viewWillDisappear:YES];
    [vc viewDidDisappear:YES];
}


@end
