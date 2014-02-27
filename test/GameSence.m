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
        SKSpriteNode *hole = [SKSpriteNode spriteNodeWithTexture:[[SKTextureAtlas atlasNamed:@"background"] textureNamed:@"bg_dirt"]];
        hole.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        hole.zPosition = 0;
        [hole setScale:2];
        [self addChild:hole];
        
        SKSpriteNode *top = [SKSpriteNode spriteNodeWithTexture:[[SKTextureAtlas atlasNamed:@"foreground"] textureNamed:@"grass_upper"]];
        top.zPosition = 1;
        top.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
        top.anchorPoint = CGPointMake(0.5, 0);
        [self addChild:top];
        
        SKSpriteNode *bottom = [SKSpriteNode spriteNodeWithTexture:[[SKTextureAtlas atlasNamed:@"foreground"] textureNamed:@"grass_lower"]];
        bottom.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        bottom.anchorPoint = CGPointMake(0.5, 1);
        bottom.zPosition = 3;
        [self addChild:bottom];
        
    }
    return self;
}
- (void)update:(NSTimeInterval)currentTime
{
    
}
@end
