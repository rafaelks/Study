//
//  RKSViewController.m
//  Running
//
//  Created by Rafael Kellermann Streit on 3/18/14.
//  Copyright (c) 2014 Rafael Kellermann Streit. All rights reserved.
//

#import "RKSViewController.h"
#import "RKSMainScene.h"

@implementation RKSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    SKView *skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    skView.showsDrawCount = YES;
    skView.showsPhysics = YES;
    
    SKScene *scene = [RKSMainScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    [skView presentScene:scene];
}

@end
