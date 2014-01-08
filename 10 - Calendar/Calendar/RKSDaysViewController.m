//
//  RKSDaysViewController.m
//  Calendar
//
//  Created by Rafael Kellermann Streit on 1/8/14.
//  Copyright (c) 2014 Rafael Kellermann Streit. All rights reserved.
//

#import "RKSDaysViewController.h"
#import "RKSDayViewController.h"

@interface RKSDaysViewController ()

@end

@implementation RKSDaysViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:[_month objectForKey:@"name"]];
    
    NSArray *holidays = [_month objectForKey:@"holidays"];
    float days = [[_month objectForKey:@"days"] floatValue];
    float topSpacing = 15;
    float leftSpacing = 0;
    
    for (int i = 0; i < days; i++) {
        // RKS NOTE: Calculate button position
        if ((i % 8) == 0) {
            if (i != 0) {
                leftSpacing = 0;
                topSpacing += 50;
            }
        } else {
            leftSpacing += 36;
        }

        // RKS NOTE: Create button, set title & configure font
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(leftSpacing, topSpacing, 30, 44)];
        [button setTag:i + 1];
        [button setTitle:[NSString stringWithFormat:@"%i", i + 1] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:14.f]];
        [button addTarget:self action:@selector(showDay:) forControlEvents:UIControlEventTouchUpInside];
        
        
        // RKS NOTE: Verify if day is a holiday
        BOOL isHoliday = NO;
        
        for (NSDictionary *day in holidays) {
            if ([[day objectForKey:@"day"] integerValue] == i + 1) {
                isHoliday = true;
                break;
            }
        }

        if (isHoliday) {
            [button setBackgroundColor:[UIColor redColor]];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        } else {
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        
        // RKS NOTE: Add button to the View
        [self.viewWrapper addSubview:button];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RKSDayViewController *controller = (RKSDayViewController *) segue.destinationViewController;
    [controller setHolidays:[_month objectForKey:@"holidays"]];
    [controller setDay:[sender tag]];
}

- (void)showDay:(id)sender
{
    [self performSegueWithIdentifier:@"showDay" sender:sender];
}

@end
