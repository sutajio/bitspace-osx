//
//  AppDelegate.m
//  bitspace-osx
//
//  Created by Niklas Holmgren on 2009-12-29.
//  Copyright 2009 Koneko Collective Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import <WebKit/WebView.h>
#import <WebKit/WebFrame.h>


@implementation AppDelegate

-(void) awakeFromNib {
	// Set the user-agent string
	NSString *userAgent = [NSString stringWithFormat:@"%@ %@",
						    [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"],
							[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]];
	[webView setApplicationNameForUserAgent: userAgent];
	
	// Load the player
	WebFrame *mainFrame = [webView mainFrame];
	NSURL *url = [NSURL URLWithString: @"http://bitspace.at/player/"];
	NSURLRequest *request = [NSURLRequest requestWithURL: url];
	[mainFrame loadRequest: request];
}

@end
