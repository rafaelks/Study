//
//  RKSViewController.m
//  ScrollView
//
//  Created by Rafael Kellermann Streit on 1/20/14.
//  Copyright (c) 2014 Rafael Kellermann Streit. All rights reserved.
//

#import "RKSViewController.h"

@interface RKSViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *switchElm;

@end

@implementation RKSViewController


- (IBAction)didTouchSwitch:(UISwitch *)sender
{
    NSLog(@"Switch: %d", [sender isOn]);
}

- (IBAction)didTouchButton:(UIButton *)sender
{
    [self.switchElm setOn:!self.switchElm.on animated:YES];
}


@end
