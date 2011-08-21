//
//  LBUnderlinedLabelAppDelegate.h
//  LBUnderlinedLabel
//
//  Created by Laurin Brandner on 21.08.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LBUnderlinedLabelViewController;

@interface LBUnderlinedLabelAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet LBUnderlinedLabelViewController *viewController;

@end
