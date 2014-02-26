//
//  ViewController.m
//  test
//
//  Created by Admin on 14-2-26.
//  Copyright (c) 2014年 xo. All rights reserved.
//

#import "ViewController.h"
#import "GameSence.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    ;
    SKView *skView = [[SKView alloc]initWithFrame:self.view.frame];// (SKView*)self.view;
    [self.view addSubview:skView];
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    skView.showsDrawCount = YES;
    
    SKScene *scene = [GameSence sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    [skView presentScene:scene];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
