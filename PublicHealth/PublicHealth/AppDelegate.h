//
//  AppDelegate.h
//  PublicHealth
//
//  Created by Ben Chan on 4/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Base/BaseNavigationController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) BaseNavigationController *navigationController;

@end

