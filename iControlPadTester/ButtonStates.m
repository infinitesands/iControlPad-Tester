//
//  ButtonStates.m
//  TextEditing
//
//  Created by Infinite Sands on 3/25/11.
//

#import "ButtonStates.h"


@implementation ButtonStates

static int LEFT_BYTE[] = {BUTTON_UP, BUTTON_RIGHT, BUTTON_LEFT, BUTTON_DOWN, BUTTON_L, BUTTON_SELECT};
static int RIGHT_BYTE[] = {BUTTON_START, BUTTON_Y, BUTTON_A, BUTTON_X, BUTTON_B, BUTTON_R};
static NSString* names[] = {@"LEFT", @"UP", @"RIGHT", @"DOWN", @"SELECT", @"START", @"A", @"Y", @"B", @"X", @"L", @"R"};

static int buttons[256];
static char buffer[256];
static int pos = 0;


+ (int) getState:(int)button
{
    return buttons[button];
}

+ (void) setState:(int)button value:(int)value
{
    buttons[button] = value;
}

+ (void) handle:(char)c
{
    char left;
    char right;
    
    buffer[pos++] = c;
    
    while(pos > 2 && buffer[0] != 'm')
    {
        for(int i=1; i<pos; i++) buffer[i-1] = buffer[i];
        
        pos--;
    }
    
    if(pos > 2 && buffer[0] == 'm')
    {
        left = buffer[1] - 32;
        right = buffer[2] - 32;
        
        for(int i=0; i<6; i++)
        {
            [ButtonStates setState:LEFT_BYTE[i] value:(left & 0x01)];
            left >>= 1;
        }
        
        for(int i=0; i<6; i++)
        {
            [ButtonStates setState:RIGHT_BYTE[i] value:(right & 0x01)];
            right >>= 1;
        }
        
        for(int i=3; i<pos; i++) buffer[i-3] = buffer[i];
        
        pos -= 3;
    }
    
    if(pos > 10) NSLog(@"Possible error - %i characters queued!", pos);
    if(pos >= 256) pos = 0;
}

+ (NSString*) getName:(int)button
{
    return names[button];
}

@end
