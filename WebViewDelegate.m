//
//  WebViewDelegate.m
//  bitspace-osx
//
//  Created by Niklas Holmgren on 2010-01-14.
//  Copyright 2010 Koneko Collective Ltd. All rights reserved.
//

#import "WebViewDelegate.h"


@class WebView;
@implementation WebViewDelegate

- (void)scriptConfirmSheetDidEnd:(NSWindow *)sheet returnCode:(int)returnCode contextInfo:(int *)contextInfo
{
    *contextInfo = returnCode;
}

- (BOOL)webView:(WebView *)sender runJavaScriptConfirmPanelWithMessage:(NSString *)message
{
    int result = NSNotFound;
    NSBeginInformationalAlertSheet(@"Please confirm", nil, @"Cancel", nil, [sender window], self, @selector(scriptConfirmSheetDidEnd:returnCode:contextInfo:), NULL, &result, message);

    while (result == NSNotFound) {
        NSEvent *nextEvent = [[NSApplication sharedApplication] nextEventMatchingMask:NSAnyEventMask untilDate:[NSDate distantFuture] inMode:NSDefaultRunLoopMode dequeue:YES];
        [[NSApplication sharedApplication] sendEvent:nextEvent];
    }

    return result;
}

@end
