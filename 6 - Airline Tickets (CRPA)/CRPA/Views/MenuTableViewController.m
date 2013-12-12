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
    
    
    CRPAirline *airlineGOL  = [manager addAirlineWithName:@"GOL"];
    CRPAirline *airlineAZUL = [manager addAirlineWithName:@"AZUL"];
    CRPAirline *airlineTAM  = [manager addAirlineWithName:@"TAM"];
    NSLog(@"Airlines: %@", manager.getAllAirlines);
    
    
    
    CRPAirport *airportPOA = [manager addAirportWithCode:@"POA" andName:@"Porto Alegre"];
    CRPAirport *airportFLR = [manager addAirportWithCode:@"FLR" andName:@"Florianópolis"];
    [manager addAirportWithCode:@"FOOO" andName:@"Florianópolis"];
    NSLog(@"Airports: %@", manager.getAllAirports);
    
    
    [manager createFlightWithAirline:airlineAZUL
                          withOrigin:airportPOA
                         withDestiny:airportPOA
                            withDate:[[NSDate alloc] init]
                            withCode:@"AZ123"];


    
    [manager createFlightWithAirline:airlineGOL
                          withOrigin:airportFLR
                         withDestiny:airportPOA
                            withDate:[[NSDate alloc] init]
                            withCode:@"GO812"];
    
    
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
    [details setManager:manager];
    
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
