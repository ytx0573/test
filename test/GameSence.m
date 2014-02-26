//
//  GameSence.m
//  test
//
//  Created by Admin on 14-2-26.
//  Copyright (c) 2014年 xo. All rights reserved.
//

#import "GameSence.h"

@implementation GameSence
- (instancetype)initWithSize:(CGSize)size;
{
    self = [super initWithSize:size];
    if (self) {
        self.backgroundColor = [SKColor lightGrayColor];
    }
    return self;
}
- (void)update:(NSTimeInterval)currentTime
{
    
}
@end
