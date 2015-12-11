//
//  BaseViewController.h
//  Test
//
//  Created by Ben Chan on 23/9/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface BaseViewController : UIViewController <MBProgressHUDDelegate> {
    MBProgressHUD *HUD;
}
- (void)showHUDWithTitle:(NSString *)title;
- (void)hideHUD;

@property (nonatomic, weak) UIStoryboard *mainSB;

@end

