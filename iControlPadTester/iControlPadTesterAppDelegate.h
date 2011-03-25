//
//  iControlPadTesterAppDelegate.h
//  iControlPadTester
//
//  Created by Infinite Sands on 3/24/11.
//

#import <UIKit/UIKit.h>

@class iControlPadTesterViewController;

@interface iControlPadTesterAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet iControlPadTesterViewController *viewController;

@end
