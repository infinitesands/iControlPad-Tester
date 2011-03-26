//
//  ButtonStates.m
//  TextEditing
//
//  Created by Infinite Sands on 3/25/11.
//

#import "iControlPadReaderView.h"
#import "ButtonStates.h"

@implementation iControlPadReaderView

- (id)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    
    return self;
}

- (BOOL)canBecomeFirstResponder 
{ 
    return YES; 
}

// FIX ME: Is this necessary?
-(void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event 
{
    [self becomeFirstResponder];
} 

- (void) drawRect:(CGRect)rect 
{
    // This space intentionally left blank. Woot.
}

- (UIView*) inputView
{
    return inputView;
}

#pragma mark -
#pragma mark UIKeyInput Protocol Methods

- (BOOL)hasText 
{
    return NO;
}

- (void)insertText:(NSString *)text 
{
    for(int i=0; i<[text length]; i++)
    {
        [ButtonStates handle:[text characterAtIndex:i]];
    }

    [self setNeedsDisplay];
}

- (void)deleteBackward 
{
    // This space intentionally left blank to complete protocol. Woot.
}

@end