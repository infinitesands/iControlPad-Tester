//
//  VirtualControlPad.m
//  iControlPadTester
//
//  Created by Infinite Sands on 3/25/11.
//

#import "VirtualControlPad.h"

#import "ButtonStates.h"

@implementation VirtualControlPad

//                      1    2   3    4    5    6    7    8    9    10   11   12
static int xlocs[]   = {30,  80, 120, 80,  180, 250, 300, 350, 400, 350, -50, 430};
static int ylocs[]   = {120, 70, 120, 160, 60,  60,  120, 70,  120, 170, 250, 250};
static int widths[]  = {60,  50, 60,  50,  50,  50,  50,  50,  50,  50,  100, 100};
static int heights[] = {50,  60, 50,  60,  20,  20,  50,  50,  50,  50,  100, 100};


- (void) drawRect:(CGRect)rect
{
    CGRect buttonRect;
    CGRect textRect = CGRectMake(0, 250, 480, 100);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    UIFont *buttonFont = [UIFont fontWithName:@"Helvetica" size:26];
    UIFont *startFont = [UIFont fontWithName:@"Helvetica" size:8];
    
    CGContextSetRGBFillColor(contextRef, 1.0, 1.0, 1.0, 1.0);
    CGContextSetRGBStrokeColor(contextRef, 0, 0, 1.0, 1.0);
    CGContextFillRect(contextRef, rect);
    
    CGContextSetRGBFillColor(contextRef, 0.0, 0.0, 0.0, 0.1);
    CGContextSetRGBStrokeColor(contextRef, 0.0, 0.0, 0.0, 0.1);
    CGContextFillEllipseInRect(contextRef, CGRectMake(xlocs[0]-4, ylocs[1]-4, 50*3+8, 50*3+8));
    CGContextFillEllipseInRect(contextRef, CGRectMake(xlocs[7]-widths[7]/2, ylocs[8]-heights[8]/2, widths[7]*2, heights[7]*2));
    
    for(int i=0; i<12; i++)
    {
        buttonRect = CGRectMake(xlocs[i], ylocs[i], widths[i], heights[i]);
        
        CGContextSetRGBFillColor(contextRef, 1.0, 1.0, 1.0, 1.0);
        CGContextFillEllipseInRect(contextRef, buttonRect);
        
        CGContextSetRGBFillColor(contextRef, 0, 0, 1.0, 1.0);
        CGContextSetRGBStrokeColor(contextRef, 0, 0, 1.0, 1.0);
        
        if([ButtonStates getState:i]) CGContextFillEllipseInRect(contextRef, buttonRect);
        else CGContextStrokeEllipseInRect(contextRef, buttonRect);
        
        
        if(i > 9)
        {
            if(i > 10) buttonRect = CGRectOffset(buttonRect, buttonRect.size.width/4, buttonRect.size.height/4-4);
            else buttonRect = CGRectOffset(buttonRect, buttonRect.size.width/4*2+4, buttonRect.size.height/4-4);
            
            if([ButtonStates getState:i])
            {
                CGContextSetRGBFillColor(contextRef, 1.0, 1.0, 1.0, 1.0);
                CGContextSetRGBStrokeColor(contextRef, 1.0, 1.0, 1.0, 1.0);
            }
            else
            {
                CGContextSetRGBFillColor(contextRef, 0, 0, 0, 1.0);
                CGContextSetRGBStrokeColor(contextRef, 0, 0, 0, 1.0);
            }
            
            [[ButtonStates getName:i] drawInRect:buttonRect withFont:buttonFont];
        }
        else if(i > 5)
        {
            buttonRect = CGRectOffset(buttonRect, buttonRect.size.width/3, buttonRect.size.height/4-4);
            
            if([ButtonStates getState:i])
            {
                CGContextSetRGBFillColor(contextRef, 1.0, 1.0, 1.0, 1.0);
                CGContextSetRGBStrokeColor(contextRef, 1.0, 1.0, 1.0, 1.0);
            }
            else
            {
                CGContextSetRGBFillColor(contextRef, 0, 0, 0, 1.0);
                CGContextSetRGBStrokeColor(contextRef, 0, 0, 0, 1.0);
            }
            
            [[ButtonStates getName:i] drawInRect:buttonRect withFont:buttonFont];
        }
        else if(i > 3)
        {
            buttonRect = CGRectOffset(buttonRect, 0, buttonRect.size.height/3-2);
            
            if([ButtonStates getState:i])
            {
                CGContextSetRGBFillColor(contextRef, 1.0, 1.0, 1.0, 1.0);
                CGContextSetRGBStrokeColor(contextRef, 1.0, 1.0, 1.0, 1.0);
            }
            else
            {
                CGContextSetRGBFillColor(contextRef, 0, 0, 0, 1.0);
                CGContextSetRGBStrokeColor(contextRef, 0, 0, 0, 1.0);
            }
            
            [[ButtonStates getName:i] drawInRect:buttonRect withFont:startFont lineBreakMode:UILineBreakModeClip alignment:UITextAlignmentCenter];
        }
    }
    
    CGContextSetRGBFillColor(contextRef, 0.0, 0.0, 0.0, 1.0);
    CGContextSetRGBStrokeColor(contextRef, 0.0, 0.0, 0.0, 1.0);
    
    [@"iControlPad Tester" drawInRect:textRect withFont:buttonFont lineBreakMode:UILineBreakModeClip alignment:UITextAlignmentCenter];
    textRect = CGRectOffset(textRect, 0.0, 26);
    [@"Brought to you by Infinite Sands" drawInRect:textRect withFont:startFont lineBreakMode:UILineBreakModeClip alignment:UITextAlignmentCenter];
    textRect = CGRectOffset(textRect, 0.0, 8);
    [@"http://www.infinitesands.com" drawInRect:textRect withFont:startFont lineBreakMode:UILineBreakModeClip alignment:UITextAlignmentCenter];
}
@end
