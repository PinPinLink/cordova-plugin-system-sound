#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>
#import <Cordova/CDVPlugin.h>

@interface CDVSystemSound : CDVPlugin {}

- (void)play:(CDVInvokedUrlCommand *)command;

@end
