//
//  ProjManager.h
//  PublicHealth
//
//  Created by Ben Chan on 12/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjManager : NSObject

@property (nonatomic, retain) NSMutableArray *caseArray;

+ (ProjManager *)shared;

@end
