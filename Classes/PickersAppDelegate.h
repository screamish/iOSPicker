//
//  PickersAppDelegate.h
//  Pickers
//
//  Created by Simon Fenton on 25/05/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickersAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UITabBarController *rootController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *rootController;

@end

