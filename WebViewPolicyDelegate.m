//
//  WebViewPolicyDelegate.m
//  bitspace-osx
//
//  Created by Niklas Holmgren on 2010-02-22.
//  Copyright 2010 Koneko Collective Ltd. All rights reserved.
//

#import "WebViewPolicyDelegate.h"
#import <WebKit/WebView.h>
#import <WebKit/WebPolicyDelegate.h>


@implementation WebViewPolicyDelegate

- (void)webView:(WebView *)sender decidePolicyForNewWindowAction:(NSDictionary *)actionInformation request:(NSURLRequest *)request newFrameName:(NSString *)frameName decisionListener:(id<WebPolicyDecisionListener>)listener {
	[ [ NSWorkspace sharedWorkspace ] openURL:[ request URL ] ];
}

@end
