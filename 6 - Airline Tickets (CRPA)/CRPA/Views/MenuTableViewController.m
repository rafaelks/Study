//
//  MenuTableViewController.m
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "MenuTableViewController.h"
#import "DetailsTableViewController.h"
#import "CRPSystemManager.h"

@interface MenuTableViewController ()

@end

@implementation MenuTableViewController

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
    
    manager = [[CRPSystemManager alloc] init];
    
    CRPAirport *airportPOA = [manager addAirportWithCode:@"POA" andName:@"Porto Alegre, Salgado Filho"];
    CRPAirport *airportFLR = [manager addAirportWithCode:@"FLR" andName:@"Florianópolis, Foobar"];
    [manager addAirportWithCode:@"FOOO" andName:@"Florianópolis"];
    
    NSLog(@"Airports: %@", manager.getAllAirports);
    
    
    CRPAirline *airline = [manager addAirlineWithName:@"AZUL"];
    
    NSLog(@"Airlines: %@", manager.getAllAirlines);
    
    
    [manager createFlightWithAirline:airline
                          withOrigin:airportPOA
                         withDestiny:airportFLR
                            withYear:2013
                           withMonth:12
                             withDay:20
                            withCode:@"AZ123"];
    
    NSLog(@"Flights: %@", manager.getAllFlights);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Storyboard delegates

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailsTableViewController *details = segue.destinationViewController;
    
    if ([[segue identifier] isEqualToString:@"showAirports"]) {
        [details loadData:[manager getAllAirports] withType:@"Airport"];
        return;
    }
    
    if ([[segue identifier] isEqualToString:@"showAirlines"]) {
        [details loadData:[manager getAllAirlines] withType:@"Airline"];
        return;
    }
}


@end
