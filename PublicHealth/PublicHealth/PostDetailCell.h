//
//  PostDetailCell.h
//  PublicHealth
//
//  Created by Ben Chan on 12/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostDetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbDetail;

- (void)setData:(NSDictionary *)dict;

@end
