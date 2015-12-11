//
//  ListPostCell.h
//  PublicHealth
//
//  Created by Ben Chan on 5/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

@interface ListPostCell : UITableViewCell {
    IBOutlet UILabel *postTitle;
    IBOutlet UILabel *postTag;
}

@property (nonatomic, retain) IBOutlet UIImageView *postImage;

- (void)setData:(NSDictionary *)dict;

@end
