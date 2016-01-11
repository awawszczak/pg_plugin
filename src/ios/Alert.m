#import "Alert.h"

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

- (void)alert:(CDVInvokedUrlCommand*)command
{
    UIAlertView * av = [[UIAlertView alloc] initWithTitle:@"Alert from plugin"
                                                  message:@""
                                                 delegate:self
                                        cancelButtonTitle:@"OK"
                                        otherButtonTitles:nil];
    [av show];
}

@end
