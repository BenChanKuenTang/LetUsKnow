//
//  BaseViewController.m
//  Test
//
//  Created by Ben Chan on 23/9/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)showHUDWithTitle:(NSString *)title {
    if (self.view) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
        
        if (HUD.hidden || HUD == nil) {
            HUD = [[MBProgressHUD alloc] initWithView:self.view];
            HUD.delegate = self;
        }
        [self.view addSubview:HUD];
        HUD.labelText = title;
        [HUD show:YES];
    }
}

- (void)hudWasHidden:(MBProgressHUD *)hud {
    [self hideHUD];
}

- (void)hideHUD {
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
    HUD = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
