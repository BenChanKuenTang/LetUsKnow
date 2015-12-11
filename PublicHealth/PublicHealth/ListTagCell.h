//
//  ListTagCell.h
//  PublicHealth
//
//  Created by Ben Chan on 12/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTagCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbCount;

- (void)setData:(NSDictionary *)dict;

@end
