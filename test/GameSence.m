//
//  GameSence.m
//  test
//
//  Created by Admin on 14-2-26.
//  Copyright (c) 2014年 xo. All rights reserved.
//

#import "GameSence.h"

#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface GameSence ()
{
    NSMutableArray *arrayWithMole;
    NSArray *arrayWithLaugh;
    NSArray *arrayWithThump;
    UIButton *button;
    BOOL gameover;
}
@property (nonatomic,retain) SKLabelNode *labelScore;
@property (nonatomic,retain) SKLabelNode *labelGameOver;
@property (nonatomic,assign) NSInteger score;
@property (nonatomic,assign) NSInteger totalSpawns;

@end

@implementation GameSence
- (instancetype)initWithSize:(CGSize)size;
{
    self = [super initWithSize:size];
    if (self) {
        self.backgroundColor = [SKColor lightGrayColor];
        SKSpriteNode *hole = [SKSpriteNode spriteNodeWithTexture:[[self getAtlas:@"background"] textureNamed:@"bg_dirt"]];
        hole.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        hole.zPosition = 0;
        [hole setScale:2];
        [self addChild:hole];
        
        SKSpriteNode *top = [SKSpriteNode spriteNodeWithTexture:[[self getAtlas:@"foreground"] textureNamed:@"grass_upper"]];
        top.zPosition = 1;
        top.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
        top.anchorPoint = CGPointMake(0.5, 0);
        [self addChild:top];
        
        SKSpriteNode *bottom = [SKSpriteNode spriteNodeWithTexture:[[self getAtlas:@"foreground"] textureNamed:@"grass_lower"]];
        bottom.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        bottom.anchorPoint = CGPointMake(0.5, 1);
        bottom.zPosition = 3;
        [self addChild:bottom];
        
        [self createMole];
        
        self.labelScore = [[SKLabelNode alloc]initWithFontNamed:@"Chalkduster"];
        self.labelScore.position = CGPointMake(10, 10);
        self.labelScore.text = @"score:0";
        self.labelScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
        self.labelScore.fontSize = 15;
        self.labelScore.zPosition = 4;
        [self addChild:self.labelScore];
        
        self.labelGameOver = [[SKLabelNode alloc]initWithFontNamed:@"Chalkduster"];
        self.labelGameOver.fontSize = 35;
        self.labelGameOver.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
        self.labelGameOver.zPosition = -10;
        self.labelGameOver.text = @"- Game Over -";
        [self addChild:self.labelGameOver];
        
    }
    return self;
}
- (void)createMole
{
    arrayWithMole = [[NSMutableArray alloc]initWithCapacity:3];
   // 86 242 395
    SKSpriteNode *moleone = [SKSpriteNode spriteNodeWithTexture:[[self getAtlas:@"sprites"] textureNamed:@"mole_1"]];
    moleone.position = CGPointMake(86, 100);
    moleone.zPosition = 2;
    [self addChild:moleone];
    [arrayWithMole addObject:moleone];
    
    SKSpriteNode *moletwo = [SKSpriteNode spriteNodeWithTexture:[[self getAtlas:@"sprites"] textureNamed:@"mole_1"]];
    moletwo.position = CGPointMake(242, 100);
    moletwo.zPosition = 2;
    [self addChild:moletwo];
    [arrayWithMole addObject:moletwo];
    
    SKSpriteNode *molethree = [SKSpriteNode spriteNodeWithTexture:[[self getAtlas:@"sprites"] textureNamed:@"mole_1"]];
    molethree.position = CGPointMake(395, 100);
    molethree.zPosition = 2;
    [self addChild:molethree];
    [arrayWithMole addObject:molethree];
    
    
    moleone.name = @"mole";
    molethree.name = @"mole";
    moletwo.name = @"mole";
}
- (SKAction*)laughAction
{
    arrayWithLaugh = @[[[self getAtlas:@"sprites"]textureNamed:@"mole_laugh1"],[[self getAtlas:@"sprites"]textureNamed:@"mole_laugh2"],[[self getAtlas:@"sprites"]textureNamed:@"mole_laugh3"]];
    //float overTime = 1 / 3;
    return [SKAction animateWithTextures:arrayWithLaugh timePerFrame:0.1 resize:NO restore:YES];
}
- (SKAction*)thumpAction
{
    arrayWithThump = @[[[self getAtlas:@"sprites"]textureNamed:@"mole_thump1"],[[self getAtlas:@"sprites"]textureNamed:@"mole_thump2"],[[self getAtlas:@"sprites"]textureNamed:@"mole_thump3"],[[self getAtlas:@"sprites"]textureNamed:@"mole_thump4"]];
    //float overTime = 1 / 4;
    return [SKAction animateWithTextures:arrayWithThump timePerFrame:0.3 resize:NO restore:YES];
}
- (void)restart
{
    self.totalSpawns = 0;
    [button setHidden:YES];
    self.labelGameOver.zPosition = -10;
    self.score = 0;
    gameover = NO;
}
- (void)popMole:(SKSpriteNode*)mole
{
    if (gameover) return;
    if (self.totalSpawns > 10)
    {
        self.labelGameOver.scale = 0.1;
        self.labelGameOver.zPosition = 20;
        [self.labelGameOver runAction:[SKAction scaleTo:1.5 duration:0.3] completion:^{
            [self.labelGameOver removeAllActions];
        }];
        if (!button) {
            button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [self.view addSubview:button];
        }
        [button setFrame:CGRectMake(200, 200, 100, 60)];
        [button setTitle:@"重新开始" forState:UIControlStateNormal];
        button.layer.zPosition = 200;
        button.center = self.view.center;
        [button addTarget:self action:@selector(restart) forControlEvents:UIControlEventTouchUpInside];
        [button setHidden:NO];
        
        gameover = YES;
        
        return;
    }
    gameover = NO;
    self.totalSpawns ++;
    
    SKAction *actionout = [SKAction moveToY:180 duration:0.1];
    actionout.timingMode = SKActionTimingEaseInEaseOut;
    
    //SKAction *actionwait = [SKAction waitForDuration:0.5];
    
    SKAction *actionin = [SKAction moveToY:100 duration:0.1];
    actionin.timingMode = SKActionTimingEaseInEaseOut;
    
    
    SKAction *setTappable = [SKAction runBlock:^{
        [mole.userData setObject:@0 forKey:@"tappable"];
    }];
    
    SKAction *setUnTappable = [SKAction runBlock:^{
        [mole.userData setObject:@1 forKey:@"tappable"];
    }];
    
    [mole runAction:[SKAction sequence:@[actionout,setTappable,[self laughAction],setUnTappable,actionin]] completion:^{
        [mole removeAllActions];
    }];

}
- (SKTextureAtlas *)getAtlas:(NSString *)filename
{
    SKTextureAtlas *atlas = nil;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        atlas = [SKTextureAtlas atlasNamed:[NSString stringWithFormat:@"%@-ipad",filename]];
    }
    else
    {
        if ([UIScreen mainScreen].bounds.size.height == 568) {
            atlas = [SKTextureAtlas atlasNamed:[NSString stringWithFormat:@"%@-568",filename]];
        }
        else
        {
            atlas = [SKTextureAtlas atlasNamed:filename];
        }
    }
    return atlas;
}
- (void)update:(NSTimeInterval)currentTime
{
    int delay = arc4random() % 5;
    if (delay != 0)
        return;

    int x = arc4random() % 3;
    if (![arrayWithMole[x] hasActions])
        [self popMole:arrayWithMole[x]];

}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:point];
    if ([node.name isEqualToString:@"mole"])
    {
        if ([[node.userData objectForKey:@"tappable"] boolValue])
            return;
        self.score += 10;
        [self.labelScore setText:[NSString stringWithFormat:@"score:%d",self.score]];
        [node.userData setObject:@0 forKey:@"tappable"];
        //[node removeAllActions];
        
        
        SKAction *actiondown = [SKAction moveToY:100 duration:0.1];
        actiondown.timingMode = SKActionTimingEaseInEaseOut;
        //actiondown.speed = 12;
        
        [node runAction:[SKAction sequence:@[[self thumpAction],actiondown]]];
    }
}
@end
