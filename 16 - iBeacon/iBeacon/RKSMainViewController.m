//
//  RKSMainViewController.m
//  iBeacon
//
//  Created by Rafael Kellermann Streit on 6/26/14.
//  Copyright (c) 2014 rafaelks. All rights reserved.
//

#import "RKSMainViewController.h"

#import <CoreLocation/CoreLocation.h>

@interface RKSMainViewController () <CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *beacons;
@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation RKSMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"A3D35CE7-048E-4749-A9EB-5D651191669B"];
    CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:[uuid UUIDString]];
    [self.locationManager startRangingBeaconsInRegion:region];
}

#pragma mark - Lazy

- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    
    return _locationManager;
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status != kCLAuthorizationStatusAuthorized) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sem Permissão"
                                                        message:@"Não é possível identificar Beacons ao seu redor. Vá em Configurações -> Localização e altere as preferências para este aplicativo."
                                                       delegate:nil
                                              cancelButtonTitle:@"Cancelar"
                                              otherButtonTitles:@"OK", nil];
        
        [alert show];
    }
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    [self setBeacons:[[NSMutableArray alloc] initWithArray:beacons]];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.beacons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Beacon"];
    CLBeacon *beacon = [self.beacons objectAtIndex:indexPath.row];
    
    UILabel *uuid = (UILabel *)[cell viewWithTag:100];
    uuid.text = beacon.proximityUUID.UUIDString;
    
    UILabel *description = (UILabel *)[cell viewWithTag:400];
    description.text = beacon.description;
    
    UILabel *minor = (UILabel *)[cell viewWithTag:200];
    minor.text = [NSString stringWithFormat:@"%@", beacon.minor];
    
    UILabel *major = (UILabel *)[cell viewWithTag:300];
    major.text = [NSString stringWithFormat:@"%@", beacon.major];
    
    UILabel *distance = (UILabel *)[cell viewWithTag:500];
    
    if (beacon.proximity == CLProximityUnknown) {
        distance.text = @"Unknown Proximity";
    } else if (beacon.proximity == CLProximityImmediate) {
        distance.text = [NSString stringWithFormat:@"Immediate - %f", beacon.accuracy];
    } else if (beacon.proximity == CLProximityNear) {
        distance.text = [NSString stringWithFormat:@"Near - %f", beacon.accuracy];
    } else if (beacon.proximity == CLProximityFar) {
        distance.text = [NSString stringWithFormat:@"Far - %f", beacon.accuracy];
    }
    
    UILabel *rssi = (UILabel *)[cell viewWithTag:600];
    rssi.text = [NSString stringWithFormat:@"%ld", (long)beacon.rssi];
    
    return cell;
}

@end
