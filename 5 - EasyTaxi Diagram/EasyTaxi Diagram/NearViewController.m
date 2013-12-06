//
//  NearViewController.m
//  EasyTaxi Diagram
//
//  Created by Rafael Kellermann Streit on 12/6/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "NearViewController.h"
#import "User.h"

@interface NearViewController ()

@end

@implementation NearViewController

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
    
    [mapView setDelegate: self];

    CLLocationCoordinate2D userLocation;
    userLocation.latitude = 40.831685;
    userLocation.longitude = -73.477453;

    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:userLocation];
    [annotation setTitle:@"Entrance"];
    [annotation setSubtitle:@"Main"];
    [mapView addAnnotation:annotation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma MapKit

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                               reuseIdentifier:nil];

    UIButton *buttonShowDetails = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];

    [buttonShowDetails addTarget:self
                          action:@selector(showDetailsButtonPressed:)
                forControlEvents:UIControlEventTouchUpInside];

    [buttonShowDetails setFrame: CGRectMake(0, 0, 23, 23)];
    [buttonShowDetails setContentVerticalAlignment: UIControlContentVerticalAlignmentCenter];
    [buttonShowDetails setContentHorizontalAlignment: UIControlContentHorizontalAlignmentCenter];
    
    [annotationView setRightCalloutAccessoryView:buttonShowDetails];
    [annotationView setPinColor:MKPinAnnotationColorGreen];
    [annotationView setAnimatesDrop:true];
    [annotationView setCanShowCallout:true];

    return annotationView;
}

- (void)showDetailsButtonPressed:(UIButton *)sender
{
    NSLog(@"Clique");
}

@end
