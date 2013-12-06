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
#import "Person.h"
#import "Driver.h"
#import "Car.h"

@interface NearViewController ()

@end

@implementation NearViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    annotations = [[NSMutableArray alloc] init];
    
    [mapView setDelegate: self];

    [annotations addObject:@{@"title": @"Rafael K. Streit", @"latitude": @40.831685, @"longitude": @-73.477453}];
    [annotations addObject:@{@"title": @"Foobar", @"latitude": @40.835685, @"longitude": @-73.477453}];
    
    
    // Primeira Pessoa
    
    PositionPoint *ponto1 = [[PositionPoint alloc] init];
    [ponto1 setLatitude: 40.831685];
    [ponto1 setLongitude: -73.477453];
    
    Person *pessoa1 = [[Person alloc] init];
    [pessoa1 setName:@"Txai Wieser"];
    [pessoa1 setPosition: ponto1];
    
    
    // Segunda Pessoa
    
    PositionPoint *ponto2 = [[PositionPoint alloc] init];
    [ponto2 setLatitude: 40.831085];
    [ponto2 setLongitude: -73.475453];
    
    Person *pessoa2 = [[Person alloc] init];
    [pessoa2 setName:@"Rafael Streit"];
    [pessoa2 setPosition: ponto2];

    
    // Terceira Pessoa
    
    PositionPoint *ponto3 = [[PositionPoint alloc] init];
    [ponto3 setLatitude: 40.831000];
    [ponto3 setLongitude: -73.475499];
    
    Person *pessoa3 = [[Person alloc] init];
    [pessoa3 setName:@"Fábio Schneider"];
    [pessoa3 setPosition: ponto3];
    
    
    // Primeiro Taxista
    
    Driver *taxista1 = [[Driver alloc] init];
    [taxista1 setName:@"Fábio Schneider"];
    
    // Primeiro Carro
    
    PositionPoint *ponto4 = [[PositionPoint alloc] init];
    [ponto4 setLatitude: 40.831000];
    [ponto4 setLongitude: -73.475499];

    Car *carro1;
    carro1 = [[Car alloc] init];
    
    
    [carro1 setPosition:ponto4];
    [carro1 setBigTrunk:TRUE];
    [carro1 ]
    
    
    for (int i = 0; i < annotations.count; i++) {
        NSDictionary *obj = [annotations objectAtIndex:i];

        CLLocationCoordinate2D userLocation;
        userLocation.latitude = [[obj valueForKey:@"latitude"] doubleValue];
        userLocation.longitude = [[obj valueForKey:@"longitude"] doubleValue];
        
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        
        [annotation setCoordinate:userLocation];
        [annotation setTitle:[obj valueForKey:@"title"]];
        [mapView addAnnotation:annotation];
    }
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

    [buttonShowDetails setFrame:CGRectMake(0, 0, 23, 23)];
    [buttonShowDetails setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [buttonShowDetails setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [buttonShowDetails setTag:1];

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
