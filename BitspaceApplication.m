//
//  BitspaceApplication.m
//  bitspace-osx
//
//  Created by Niklas Holmgren on 2010-02-16.
//  Copyright 2010 Koneko Collective Ltd. All rights reserved.
//

#import "BitspaceApplication.h"

#import <WebKit/WebView.h>
#import <WebKit/WebFrame.h>
#import <IOKit/hidsystem/ev_keymap.h>


@implementation BitspaceApplication

- (void)mediaKeyEvent: (int)key state: (BOOL)state repeat: (BOOL)repeat
{
	switch( key )
	{
		case NX_KEYTYPE_PLAY:
			if( state == 0 )
				[webView stringByEvaluatingJavaScriptFromString: @"$('#player').trigger('toggle');"]; 
			break;
			
		case NX_KEYTYPE_FAST:
			if( state == 0 )
				[webView stringByEvaluatingJavaScriptFromString: @"$('#player').trigger('next');"]; 
			break;
			
		case NX_KEYTYPE_REWIND:
			if( state == 0 )
				[webView stringByEvaluatingJavaScriptFromString: @"$('#player').trigger('prev');"]; 
			break;
	}
}

- (void)sendEvent:(NSEvent *)event {
	if( [event type] == NSSystemDefined && [event subtype] == 8 )
	{
		int keyCode = (([event data1] & 0xFFFF0000) >> 16);
		int keyFlags = ([event data1] & 0x0000FFFF);
		int keyState = (((keyFlags & 0xFF00) >> 8)) == 0xA;
		int keyRepeat = (keyFlags & 0x1);
		
		[self mediaKeyEvent: keyCode state: keyState repeat: keyRepeat];
	}
	
	[super sendEvent: event];
} 

@end
