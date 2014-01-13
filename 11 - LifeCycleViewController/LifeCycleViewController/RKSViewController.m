//
//  RKSViewController.m
//  LifeCycleViewController
//
//  Created by Rafael Kellermann Streit on 1/13/14.
//  Copyright (c) 2014 Rafael Kellermann Streit. All rights reserved.
//

#import "RKSViewController.h"

@interface RKSViewController ()

@end

@implementation RKSViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    NSLog(@"1 - awakeFromNib: %@", _label.text);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"2 - viewDidLoad: %@", _label.text);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"3 - viewWillAppear: %@", _label.text);
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"4 - viewWillLayoutSubviews: %@", _label.text);
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"5 - viewDidLayoutSubviews: %@", _label.text);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"6 - viewDidAppear: %@", _label.text);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"10 - viewWillDisappear: %@", _label.text);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"11 - viewDidDisappear: %@", _label.text);
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    NSLog(@"7 - willRotateToInterfaceOrientation: %@", _label.text);
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    NSLog(@"8 - willAnimateRotationToInterfaceOrientation: %@", _label.text);
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    NSLog(@"9 - didRotateFromInterfaceOrientation: %@", _label.text);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"12 - didReceiveMemoryWarning");
}

- (IBAction)buttonShowView03Clicked:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard  storyboardWithName:@"Second" bundle:nil];
    UIViewController *controller = [storyboard instantiateInitialViewController];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
