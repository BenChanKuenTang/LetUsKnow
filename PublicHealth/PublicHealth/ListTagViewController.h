//
//  ListTagViewController.h
//  PublicHealth
//
//  Created by Ben Chan on 11/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import "BaseViewController.h"

@interface ListTagViewController : BaseViewController <UITableViewDelegate> {
    IBOutlet UITableView *tagTableView;
    
    NSMutableArray *tagArray;
//    NSMutableDictionary *tagDict;
}

@end
