//
//  PostDetailViewController.h
//  PublicHealth
//
//  Created by Ben Chan on 11/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import "BaseViewController.h"

@interface PostDetailViewController : BaseViewController <UITableViewDelegate> {
    IBOutlet UILabel *lbTitle;
    IBOutlet UITableView *detailTableView;
    IBOutlet UITextField *tfMsg;
    
    NSMutableArray *dataArray;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *case_id;
- (IBAction)btnSendClicked:(id)sender;

@end
