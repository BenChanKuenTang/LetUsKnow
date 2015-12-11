//
//  CommonFunction.h
//  PublicHealth
//
//  Created by Ben Chan on 25/9/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonFunction : NSObject

+ (id)sharedManager;
+ (UIStoryboard *)getStoryboard:(NSString *)storyBoard;
+ (CGSize)getScreenSize;
+ (NSDictionary *)jsonToDict:(NSString *)jsonString;

@end
