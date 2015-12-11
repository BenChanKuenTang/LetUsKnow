//
//  PostByAddressViewController.h
//  PublicHealth
//
//  Created by Ben Chan on 12/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import "Base/BaseViewController.h"

@interface PostByAddressViewController : BaseViewController <UITableViewDelegate> {
    IBOutlet UITableView *addressTableView;
    
    NSMutableArray *dataArray;
}

@property (nonatomic, retain) NSString *searchTag;

@end
