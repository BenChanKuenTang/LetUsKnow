//
//  ListPostCell.m
//  PublicHealth
//
//  Created by Ben Chan on 5/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import "ListPostCell.h"

@implementation ListPostCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setData:(NSDictionary *)dict {
    postTitle.text = dict[@"title"];
    postTag.text = dict[@"tag"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
