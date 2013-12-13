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
    CRPAirline *airlineAVIANCA  = [manager addAirlineWithName:@"AVIANCA"];
    
    
    // Airports
    CRPAirport *airportPOA = [manager addAirportWithCode:@"POA" andName:@"Porto Alegre"];
    CRPAirport *airportFLN = [manager addAirportWithCode:@"FLN" andName:@"Florianópolis"];
    CRPAirport *airportGIG = [manager addAirportWithCode:@"GIG" andName:@"Rio - Galeão"];
    CRPAirport *airportREC = [manager addAirportWithCode:@"REC" andName:@"Recife"];
    CRPAirport *airportBSB = [manager addAirportWithCode:@"BSB" andName:@"Brasília"];
    CRPAirport *airportEZE = [manager addAirportWithCode:@"EZE" andName:@"Buenos Aires"];
    
    
    // Sections
    CRPSection *section1Azul747 = [manager createSectionWithAirline:airlineAZUL
                                                           withRows:10
                                                           withCols:4
                                                       andSeatClass:@"first-class"];

    CRPSection *section2Azul747 = [manager createSectionWithAirline:airlineTAM
                                                           withRows:40
                                                           withCols:6
                                                       andSeatClass:@"executive"];
    
    CRPSection *sectionGol737 = [manager createSectionWithAirline:airlineGOL
                                                         withRows:30
                                                         withCols:6
                                                     andSeatClass:@"executive"];
    
    CRPSection *section1TAMAirbus = [manager createSectionWithAirline: airlineTAM
                                                            withRows: 10
                                                            withCols: 6
                                                        andSeatClass:@"first-class"];
    
    CRPSection *section2TAMAirbus = [manager createSectionWithAirline:airlineTAM
                                                             withRows:30
                                                             withCols:6
                                                         andSeatClass:@"executive"];
    
    // Airplanes
    CRPAirplane *airplane747 = [manager addAirplanetWithCode:@"747"
                                                withSections:@[section1Azul747, section2Azul747]
                                                  andAirline:airlineAZUL];
    
    CRPAirplane *airplane737 = [manager addAirplanetWithCode:@"737"
                                                withSections:@[sectionGol737]
                                                  andAirline:airlineGOL];
    
    CRPAirplane *airplaneAirbus = [manager addAirplanetWithCode:@"Airbus"
                                               withSections:@[section1TAMAirbus, section2TAMAirbus]
                                                    andAirline:airlineTAM];
    
    // Flights
    [manager createFlightWithAirline:airlineAZUL
                        withAirplane:airplane747
                          withOrigin:airportPOA
                         withDestiny:airportFLN
                            withDate:[[NSDate alloc] init]
                            withCode:@"AZ123"];
    
    [manager createFlightWithAirline:airlineAZUL
                        withAirplane:airplane747
                          withOrigin:airportREC
                         withDestiny:airportPOA
                            withDate:[[NSDate alloc] init]
                            withCode:@"AZ123"];

    
    [manager createFlightWithAirline:airlineGOL
                        withAirplane:airplane747
                          withOrigin:airportFLN
                         withDestiny:airportPOA
                            withDate:[[NSDate alloc] init]
                            withCode:@"GO812"];
    
    [manager createFlightWithAirline:airlineTAM
                        withAirplane:airplane737
                          withOrigin:airportPOA
                         withDestiny:airportGIG
                            withDate:[[NSDate alloc] init]
                            withCode:@"TA852"];

    [manager createFlightWithAirline:airlineAZUL
                        withAirplane:airplane737
                          withOrigin:airportPOA
                         withDestiny:airportBSB
                            withDate:[[NSDate alloc] init]
                            withCode:@"AZ852"];
    
    [manager createFlightWithAirline:airlineTAM
                        withAirplane:airplaneAirbus
                          withOrigin:airportGIG
                         withDestiny:airportREC
                            withDate:[[NSDate alloc] init]
                            withCode:@"TA853"];
    
    [manager createFlightWithAirline:airlineTAM
                        withAirplane:airplaneAirbus
                          withOrigin:airportPOA
                         withDestiny:airportEZE
                            withDate:[[NSDate alloc] init]
                            withCode:@"TA854"];
    
    [manager displaySystemDetails];
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
