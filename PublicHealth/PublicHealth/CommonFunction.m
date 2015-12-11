//
//  CommonFunction.m
//  Test
//
//  Created by Ben Chan on 25/9/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonFunction.h"

@implementation CommonFunction

+ (id)sharedManager {
    static CommonFunction *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

+ (UIStoryboard *)getStoryboard:(NSString *)storyBoard {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyBoard bundle:nil];
    return sb;
}

+ (CGSize)getScreenSize {
    CGSize screenSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    return screenSize;
}

+ (NSDictionary *)jsonToDict:(NSString *)jsonString {
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"(\\w+)\\s*:"
                                                           withString:@"\"$1\":"
                                                              options:NSRegularExpressionSearch
                                                                range:NSMakeRange(0, [jsonString length])];
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    return json;
}

@end
