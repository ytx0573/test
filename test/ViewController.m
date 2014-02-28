//
//  ViewController.m
//  nimeiya
//
//  Created by Admin on 14-2-26.
//  Copyright (c) 2014年 xo. All rights reserved.
//

#import "ViewController.h"
#import "GameSence.h"



@implementation ViewController
- (void)loadView
{
    [super loadView];
    
    SKView *skView = [[SKView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = skView;
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];

}
- (void)viewWillLayoutSubviews
{
    SKView * skView = (SKView *)self.view;
    if (!skView.scene) {
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
        skView.showsDrawCount = YES;
        
        // Create and configure the scene.
        SKScene * scene = [GameSence sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        // Present the scene.
        [skView presentScene:scene];
    }
}
- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        [self.view setFrame:CGRectMake(0, 0, 480, 320)];
    }
    else
    {
        [self.view setFrame:CGRectMake(0, 0, 320, 480)];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
