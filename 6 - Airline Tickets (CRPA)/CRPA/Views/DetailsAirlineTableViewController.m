//
//  DetailsAirlineTableViewController.m
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "DetailsAirlineTableViewController.h"

@interface DetailsAirlineTableViewController ()

@end

@implementation DetailsAirlineTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
    // Dispose of any resources that can be recreated.
}


- (void)setManager:(CRPSystemManager *)manager forAirline:(CRPAirline *)airline
{
    _airline = airline;
    _manager = manager;
    
    [self setTitle:[_airline name]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
