//
//  ButtonStates.h
//  TextEditing
//
//  Created by Infinite Sands on 3/25/11.
//

#import <Foundation/Foundation.h>

#define BUTTON_LEFT     0
#define BUTTON_UP       1
#define BUTTON_RIGHT    2
#define BUTTON_DOWN     3
#define BUTTON_SELECT   4
#define BUTTON_START    5
#define BUTTON_A        6
#define BUTTON_Y        7
#define BUTTON_B        8
#define BUTTON_X        9
#define BUTTON_L        10
#define BUTTON_R        11

#define MIN_BUTTON      0
#define MAX_BUTTON      11

@interface ButtonStates : NSObject 
{
    
}

+ (int) getState:(int)button;
+ (void) setState:(int)button value:(int)value;
+ (void) handle:(char)c;
+ (NSString*) getName:(int)button;

@end
