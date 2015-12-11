//
//  ProjManager.m
//  PublicHealth
//
//  Created by Ben Chan on 12/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import "ProjManager.h"

static ProjManager *sharedFunction;

@implementation ProjManager

+ (ProjManager *)shared {
    if (!sharedFunction) {
        sharedFunction = [[ProjManager alloc] init];
    }
    return sharedFunction;
}

@end
