//
//  DetailViewController.m
//  EasyTaxi Diagram
//
//  Created by Rafael Kellermann Streit on 12/8/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "DetailViewController.h"
#import "Person.h"
#import "Driver.h"

@interface DetailViewController ()
@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setObject:(id)obj
{
    _obj = obj;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"view loaded");
    NSLog(@"%@", _labelType);
	// Do any additional setup after loading the view.
    
    if ([_obj isKindOfClass:[Driver class]]) {
        [_labelType setText:@"Taxista"];
    } else {
        [_labelType setText:@"Usuário"];
    }
    
    [_labelName setText:[_obj getName]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
