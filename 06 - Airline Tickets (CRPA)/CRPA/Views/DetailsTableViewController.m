//
//  DetailsTableViewController.m
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "DetailsTableViewController.h"
#import "DetailsAirlineTableViewController.h"
#import "FlightSeatsTableViewController.h"

@interface DetailsTableViewController ()

@end

@implementation DetailsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];

    if (self) {
        
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
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_data != nil) {
        return [_data count];
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self type] forIndexPath:indexPath];
    
    // Airports
    if ([[self type] isEqualToString:@"Airport"]) {
        CRPAirport *obj = [_data objectAtIndex:indexPath.row];

        UILabel *labelCode = (UILabel *) [cell viewWithTag:100];
        [labelCode setText:[obj code]];
        
        UILabel *labelName = (UILabel *) [cell viewWithTag:200];
        [labelName setText:[obj name]];

    // Airlines
    } else if ([[self type] isEqualToString:@"Airline"]) {
        CRPAirline *obj = [_data objectAtIndex:indexPath.row];
        
        UILabel *labelName = (UILabel *) [cell viewWithTag:100];
        [labelName setText:[obj name]];
    
    // Flights
    } else if ([[self type] isEqualToString:@"Flight"]) {
        CRPFlight *obj = [_data objectAtIndex:indexPath.row];
        
        UILabel *labelAirline = (UILabel *) [cell viewWithTag:100];
        UILabel *labelCode = (UILabel *) [cell viewWithTag:200];
        UILabel *labelOrigin = (UILabel *) [cell viewWithTag:300];
        UILabel *labelDestiny = (UILabel *) [cell viewWithTag:400];
        UILabel *labelDate = (UILabel *) [cell viewWithTag:500];
        
        NSString *airline = [[[obj airplane] airline] name];
        NSString *airplaneCode = [[obj airplane] code];
        
        NSString *airportOriginCode = [[obj origin] code];
        NSString *airportOriginName = [[obj origin] name];
        
        NSString *airportDestinyCode = [[obj destiny] code];
        NSString *airportDestinyName = [[obj destiny] name];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd/mm/yyyy"];
        
        NSString *date = [[formatter stringFromDate:[obj date]] lowercaseString];

        
        [labelAirline setText:[[NSString alloc] initWithFormat:@"%@ - %@", airline, airplaneCode]];
        [labelCode setText:[obj code]];
        [labelOrigin setText:[[NSString alloc] initWithFormat:@"%@ - %@", airportOriginCode, airportOriginName]];
        [labelDestiny setText:[[NSString alloc] initWithFormat:@"%@ - %@", airportDestinyCode, airportDestinyName]];
        
        [labelDate setText:date];
    }
    
    return cell;
}


#pragma mark Utils

- (void)loadData:(NSMutableArray *)data withType:(NSString *)type
{
    [self setType:type];
    [self setData:data];
    
    if ([[self type] isEqualToString:@"Airport"]) {
        [self setTitle:@"Aeroportos"];
        return;
    }
    
    if ([[self type] isEqualToString:@"Airline"]) {
        [self setTitle:@"Companhias"];
        return;
    }
    
    if ([[self type] isEqualToString:@"Flight"]) {
        [self setTitle:@"Voôs"];
        return;
    }
}

#pragma mark Storyboard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showFlight"]) {
        CRPFlight *obj = [_data objectAtIndex:[[[self tableView] indexPathForSelectedRow] row]];
        FlightSeatsTableViewController *details = segue.destinationViewController;
        [details setFlight:obj];
    } else {
        CRPAirline *obj = [_data objectAtIndex:[[[self tableView] indexPathForSelectedRow] row]];
        DetailsAirlineTableViewController *details = segue.destinationViewController;
        [details setAirline:obj];
    }
}

@end
