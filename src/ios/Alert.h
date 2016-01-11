#import <Cordova/CDV.h>

@interface Alert : CDVPlugin <UIAlertViewDelegate> {}
- (void)alert:(CDVInvokedUrlCommand*)command;
@end
