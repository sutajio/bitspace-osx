//
//  WindowDelegate.m
//  bitspace-osx
//
//  Created by Niklas Holmgren on 2010-01-13.
//  Copyright 2010 Koneko Collective Ltd. All rights reserved.
//

#import "WindowDelegate.h"


@implementation WindowDelegate

- (BOOL)windowShouldClose:(id)sender
{
    BOOL result = YES;
    
    if (sender == theWindow) {
        [theWindow orderOut:self];
        result = NO;        
    }
    
    return result;
}

@end
