//
//  AppDelegate.h
//  bitspace-osx
//
//  Created by Niklas Holmgren on 2009-12-29.
//  Copyright 2009 Sutajio HB. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class WebView;
@class RemoteControl;

@interface AppDelegate : NSObject {
	IBOutlet NSWindow *mainWindow;
	IBOutlet WebView *webView;
	RemoteControl* remoteControl;
}
- (IBAction)togglePlayback:(id)sender;
- (IBAction)nextTrack:(id)sender;
- (IBAction)previousTrack:(id)sender;
- (RemoteControl*) remoteControl;
- (void) setRemoteControl: (RemoteControl*) newControl;
@end
