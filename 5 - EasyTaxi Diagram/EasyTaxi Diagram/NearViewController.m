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
    NSMutableArray *usersarray = [[NSMutableArray alloc] init];
	counter = 0;
    
    [mapView setDelegate: self];


    // Primeira Pessoa
    CLLocationCoordinate2D ponto1;
    ponto1.latitude = 40.831685;
    ponto1.longitude = -73.477453;
    
    Person *pessoa1 = [[Person alloc] init];
    [pessoa1 setName:@"Txai Wieser"];
    [pessoa1 setPosition: &ponto1];
    
    [usersarray addObject:pessoa1];
    
    // Segunda Pessoa
    CLLocationCoordinate2D ponto2;
    ponto2.latitude = 40.831085;
    ponto2.longitude = -73.535453;
    
    Person *pessoa2 = [[Person alloc] init];
    [pessoa2 setName:@"Rafael K. Streit"];
    [pessoa2 setPosition: &ponto2];

    [usersarray addObject:pessoa2];
    
    // Terceira Pessoa
    CLLocationCoordinate2D ponto3;
    ponto3.latitude = 40.931099;
    ponto3.longitude = -73.471499;
    Person *pessoa3 = [[Person alloc] init];
    [pessoa3 setName:@"Fábio Schneider"];
    [pessoa3 setPosition: &ponto3];

    [usersarray addObject:pessoa3];
    
    // Primeiro Carro
    CLLocationCoordinate2D ponto4;
    ponto4.latitude = 40.831090;
    ponto4.longitude = -73.465499;

    Car *carro1;
    carro1 = [[Car alloc] init];
    [carro1 setPosition: &ponto4];
    [carro1 setBigTrunk:TRUE];
    [carro1 setLicence:@"56X669S0G"];
	

	// Primeiro Taxista
    Driver *taxista1 = [[Driver alloc] init];
    [taxista1 setName:@"Taxista 01"];
	[taxista1 setCar:carro1];

    [usersarray addObject:taxista1];

    // Segundo Carro
    CLLocationCoordinate2D ponto5;
    ponto5.latitude = 40.838060;
    ponto5.longitude = -73.410400;
    
    Car *carro2;
    carro2 = [[Car alloc] init];
    [carro2 setPosition: &ponto5];
    [carro2 setBigTrunk:FALSE];
    [carro2 setLicence:@"5838400G"];
	
	// Segundo Taxista
    Driver *taxista2 = [[Driver alloc] init];
    [taxista2 setName:@"Taxista 02"];
	[taxista2 setCar:carro2];

    [usersarray addObject:taxista2];
    
    //[annotations addObject:@{@"title": @"Rafael K. Streit", @"latitude": @40.831685, @"longitude": @-73.477453}];
    //[annotations addObject:@{@"title": @"Foobar", @"latitude": @40.835685, @"longitude": @-73.477453}];
    
    
    for (int i = 0; i < usersarray.count; i++) {
        //NSDictionary *obj = [usersarray objectAtIndex:i];

        CLLocationCoordinate2D *userLocation;
        
        if ([[usersarray objectAtIndex:i] class] == [Driver class]) {
            userLocation = [[[usersarray objectAtIndex:i] getCar] getPosition];
        }else{
            userLocation = [[usersarray objectAtIndex:i] getPosition];
        }
        
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        [annotation setCoordinate:*userLocation];
        [annotation setTitle:[[usersarray objectAtIndex:i] getName]];
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
	[buttonShowDetails setTag:[[[NSNumber alloc] initWithInteger:counter] integerValue]];

    [annotationView setRightCalloutAccessoryView:buttonShowDetails];
    [annotationView setPinColor:MKPinAnnotationColorRed];
    [annotationView setAnimatesDrop:YES];
    [annotationView setCanShowCallout:YES];
	
	counter++;

    return annotationView;
}

- (void)showDetailsButtonPressed:(UIButton *)sender
{
    NSInteger idx = [sender tag];
	NSLog(@"%@", [annotations objectAtIndex:idx]);
}

@end
