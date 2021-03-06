//
//  AppDelegate.m
//  bitspace-osx
//
//  Created by Niklas Holmgren on 2009-12-29.
//  Copyright 2009 Sutajio HB. All rights reserved.
//

#import "AppDelegate.h"
#import <WebKit/WebView.h>
#import <WebKit/WebFrame.h>
#import "AppleRemote.h"
#import "ANSystemSoundWrapper.h"


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
	
	// Enable the remote control
	AppleRemote* newRemoteControl = [[[AppleRemote alloc] initWithDelegate: self] autorelease];
	[newRemoteControl setDelegate: self];
	[self setRemoteControl: newRemoteControl];
	[remoteControl startListening: self];
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication
					hasVisibleWindows:(BOOL)flag
{
	if( !flag )
		[mainWindow makeKeyAndOrderFront:nil];
	
	return YES;
}

- (void)togglePlayback:(id)sender;
{
	[webView stringByEvaluatingJavaScriptFromString: @"$('#player').trigger('toggle');"];
}

- (void)nextTrack:(id)sender;
{
	[webView stringByEvaluatingJavaScriptFromString: @"$('#player').trigger('next');"];
}

- (void)previousTrack:(id)sender;
{
	[webView stringByEvaluatingJavaScriptFromString: @"$('#player').trigger('prev');"];
}

- (RemoteControl*) remoteControl {
	return remoteControl;
}

- (void) setRemoteControl: (RemoteControl*) newControl {
	[remoteControl autorelease];
	remoteControl = [newControl retain];
}

- (void) sendRemoteButtonEvent: (RemoteControlEventIdentifier) event 
                   pressedDown: (BOOL) pressedDown 
                 remoteControl: (RemoteControl*) remoteControl 
{
    NSLog(@"Button %d pressed down %d", event, pressedDown);
	if(pressedDown == 0) {
		switch (event) {
			case kRemoteButtonPlay:
				[self togglePlayback: NULL];
				break;
			case kRemoteButtonRight:
				[self nextTrack: NULL];
				break;
			case kRemoteButtonLeft:
				[self previousTrack: NULL];
				break;
			case kRemoteButtonPlus:
				[ANSystemSoundWrapper increaseSystemVolumeBy:.05];
				break;
			case kRemoteButtonMinus:
				[ANSystemSoundWrapper decreaseSystemVolumeBy:.05];
				break;
		}
	}
}

- (void) dealloc {
	[remoteControl autorelease];
	[super dealloc];
}

@end
