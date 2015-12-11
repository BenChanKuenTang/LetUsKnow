//
//  ListPostViewController.h
//  PublicHealth
//
//  Created by Ben Chan on 4/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import "BaseViewController.h"

@interface ListPostViewController : BaseViewController <UITableViewDelegate> {
    IBOutlet UITableView *postTableView;
    
    NSArray *dataArray;
}

@end
