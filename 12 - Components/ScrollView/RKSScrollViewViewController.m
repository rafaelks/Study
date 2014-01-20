//
//  RKSScrollViewViewController.m
//  ScrollView
//
//  Created by Rafael Kellermann Streit on 1/20/14.
//  Copyright (c) 2014 Rafael Kellermann Streit. All rights reserved.
//

#import "RKSScrollViewViewController.h"

@interface RKSScrollViewViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation RKSScrollViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int currY = 0;
    
    for (int i = 0; i < 1000; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, currY, 300, 44)];
        
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setText:[NSString stringWithFormat:@"Foobar %d", i]];
        [self.scrollView addSubview:label];
        
        currY += 54;
    }
    
    [self.scrollView setContentSize:CGSizeMake(320, 54*1000)];
}

@end
