//
//  BitspaceApplication.h
//  bitspace-osx
//
//  Created by Niklas Holmgren on 2010-02-16.
//  Copyright 2010 Koneko Collective Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class WebView;
@interface BitspaceApplication : NSApplication {
	IBOutlet WebView *webView;
}

@end
