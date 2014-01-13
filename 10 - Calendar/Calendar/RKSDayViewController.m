//
//  RKSDayViewController.m
//  Calendar
//
//  Created by Rafael Kellermann Streit on 1/8/14.
//  Copyright (c) 2014 Rafael Kellermann Streit. All rights reserved.
//

#import "RKSDayViewController.h"

@interface RKSDayViewController ()

@end

@implementation RKSDayViewController

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
    [self setTitle:[NSString stringWithFormat:@"Dia %ld", _day]];
    
    float topSpacing = 0;
    
    for (NSDictionary *holiday in _holidays) {
        if ([[holiday objectForKey:@"day"] integerValue] == _day) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, topSpacing, 280, 50)];
            [label setTextColor:[UIColor blackColor]];
            [label setText:[holiday objectForKey:@"name"]];
            
            topSpacing += 70;
            
            [self.viewWrapper addSubview:label];
        }
    }
    
    if (topSpacing == 0) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, topSpacing, 280, 50)];
        [label setTextColor:[UIColor blackColor]];
        [label setText:@"Nenhum feriado neste dia."];
        
        [self.viewWrapper addSubview:label];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
