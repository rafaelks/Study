//
//  RKSMainViewController.m
//  iBeacon
//
//  Created by Rafael Kellermann Streit on 6/26/14.
//  Copyright (c) 2014 rafaelks. All rights reserved.
//

#import "RKSMainViewController.h"

#import <CoreLocation/CoreLocation.h>

@interface RKSMainViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

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
    
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    
}

- (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region
{
    /*
     A user can transition in or out of a region while the application is not running. When this happens CoreLocation will launch the application momentarily, call this delegate method and we will let the user know via a local notification.
     */
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    if(state == CLRegionStateInside)
    {
        notification.alertBody = NSLocalizedString(@"You're inside the region", @"");
    }
    else if(state == CLRegionStateOutside)
    {
        notification.alertBody = NSLocalizedString(@"You're outside the region", @"");
    }
    else
    {
        return;
    }
    
    /*
     If the application is in the foreground, it will get a callback to application:didReceiveLocalNotification:.
     If it's not, iOS will display the notification to the user.
     */
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

@end
