//
//  iControlPadTesterAppDelegate.h
//  iControlPadTester
//
//  Created by Jerason Banes on 3/24/11.
//  Copyright 2011 Infinite Sands. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iControlPadTesterViewController;

@interface iControlPadTesterAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet iControlPadTesterViewController *viewController;

@end
