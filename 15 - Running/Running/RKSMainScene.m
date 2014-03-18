//
//  RKSMainScene.m
//  Running
//
//  Created by Rafael Kellermann Streit on 3/18/14.
//  Copyright (c) 2014 Rafael Kellermann Streit. All rights reserved.
//

#import "RKSMainScene.h"

@implementation RKSMainScene

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        [self setBackgroundColor:[SKColor whiteColor]];
        
        SKSpriteNode *spriteGreen = [SKSpriteNode spriteNodeWithColor:[SKColor greenColor] size:CGSizeMake(100, 100)];
        [spriteGreen setPosition:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
        [self addChild:spriteGreen];
        
        SKSpriteNode *spriteRed = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(100, 100)];
        [spriteRed setPosition:CGPointMake(self.frame.size.width / 2, (self.frame.size.height / 2) + 100)];
        [self addChild:spriteRed];
        
        SKSpriteNode *spriteBlue = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(100, 100)];
        [spriteBlue setPosition:CGPointMake(self.frame.size.width / 2, (self.frame.size.height / 2) + 200)];
        [self addChild:spriteBlue];
    }
    
    return self;
}

@end
