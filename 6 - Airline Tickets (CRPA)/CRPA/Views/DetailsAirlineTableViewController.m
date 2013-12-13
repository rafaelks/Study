//
//  DetailsAirlineTableViewController.m
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "DetailsAirlineTableViewController.h"
#import "FlightSeatsTableViewController.h"

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
    
    manager = [CRPSystemManager sharedManager];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setAirline:(CRPAirline *)airline
{
    _airline = airline;
    
    [self setTitle:[_airline name]];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{    
    CRPFlight *obj = (CRPFlight *) [[manager getAllFlightsFromAirline:_airline] objectAtIndex:0];
    FlightSeatsTableViewController *details = segue.destinationViewController;
    [details setFlight:obj];
}

@end
