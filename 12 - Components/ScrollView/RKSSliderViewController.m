//
//  RKSSliderViewController.m
//  ScrollView
//
//  Created by Rafael Kellermann Streit on 1/20/14.
//  Copyright (c) 2014 Rafael Kellermann Streit. All rights reserved.
//

#import "RKSSliderViewController.h"

@interface RKSSliderViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelSlider;

@end

@implementation RKSSliderViewController

- (IBAction)didTouchSlider:(UISlider *)sender
{
    self.labelSlider.text = [NSString stringWithFormat:@"%.02f", sender.value];
}

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
