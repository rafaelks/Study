//
//  FlightSeatsTableViewController.m
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "FlightSeatsTableViewController.h"

@interface FlightSeatsTableViewController ()

@end

@implementation FlightSeatsTableViewController

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
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"Flight: %@", _flight);

    if (_flight) {
        return [[_flight classes] count];
    }
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *idx = [[NSNumber alloc] initWithInteger:indexPath.row];
    UITableViewCell *cell;
    
    if ([idx intValue] < 7) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Free" forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Busy" forIndexPath:indexPath];
    }
    
    UILabel *labelCode = (UILabel *) [cell viewWithTag:100];
    
    [labelCode setText:@"123A"];

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Econômica";
    } else if (section == 1) {
        return @"Executiva";
    }
    
    return @"Primeira Classe";
}


@end
