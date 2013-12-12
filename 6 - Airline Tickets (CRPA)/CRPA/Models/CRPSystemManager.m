//
//  CRPSystemManager.m
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "CRPSystemManager.h"

@implementation CRPSystemManager {
    NSMutableArray *airplanes;
    NSMutableArray *airports;
    NSMutableArray *airlines;
    NSMutableArray *flights;
    NSMutableArray *sections;
}

- (instancetype)init
{
    self = [super init];
    
    airplanes = [[NSMutableArray alloc] init];
    airports = [[NSMutableArray alloc] init];
    airlines = [[NSMutableArray alloc] init];
    flights = [[NSMutableArray alloc] init];
    sections = [[ NSMutableArray alloc] init];

    return self;
}

+ (id)sharedManager {
    static CRPSystemManager *shared = nil;
    shared = [[self alloc] init];
    return shared;
}


# pragma Airplane

- (CRPAirplane *)addAirplanetWithCode:(NSString *)code withSections:(NSMutableArray *)_sections andAirline:(CRPAirline *)airline {
    CRPAirplane *airplane = [[CRPAirplane alloc] initWithCode:code withSections:_sections andAirline:airline];
    
    if (airplane != nil) {
        [airplanes addObject:airplane];
    }
    
    return airplane;
}

- (NSMutableArray *)getAllAirplanes {
    return airplanes;
}

- (NSMutableArray *)getAllAirplanesFromAirline:(CRPAirline *)airline {
    NSMutableArray *airplanesOfAirline = [[NSMutableArray alloc] init];
    
    for (CRPAirplane *item in airplanes) {
        if (item.airline == airline) {
            [airplanesOfAirline addObject:item];
        }
    }
    
    return airplanesOfAirline;
}

# pragma Airport

- (CRPAirport *)addAirportWithCode:(NSString *)code andName:(NSString *)name {
    CRPAirport *airport = [[CRPAirport alloc] initWithCode:code andName:name];
    
    if (airport != nil) {
        [airports addObject:airport];
    }
    
    return airport;
}

- (NSMutableArray *)getAllAirports
{
    return airports;
}

# pragma Airline

- (CRPAirline *)addAirlineWithName:(NSString *)name {
    CRPAirline *airline = [[CRPAirline alloc] initWithName:name];
    
    if (airline != nil) {
        [airlines addObject:airline];
    }
    
    return airline;
}

- (NSMutableArray *)getAllAirlines
{
    return airlines;
}


# pragma Flight

- (void)createFlightWithAirline:(CRPAirline *)airline
                   withAirplane:(CRPAirplane *)airplane
                     withOrigin:(CRPAirport *)origin
                    withDestiny:(CRPAirport *)destiny
                       withDate:(NSDate     *)date
                       withCode:(NSString   *)code
{
    CRPFlight *flight = [[CRPFlight alloc] initWithAirplane:airplane
                                                 withOrigin:origin
                                                withDestiny:destiny
                                                   withDate:date
                                                   withCode:code];
    
    if (flight != nil) {
        [flights addObject:flight];
    }
}

- (NSMutableArray *)getAllFlights
{
    return flights;
}

- (NSMutableArray *)getAllFlightsFromAirline:(CRPAirline *)airline {
    NSMutableArray *fligthsOfAirline = [[NSMutableArray alloc] init];
    
    for (CRPFlight *item in flights) {
        if ([item.airplane airline] == airline) {
            [fligthsOfAirline addObject:item];
        }
    }
    
    return fligthsOfAirline;
}

#pragma Section

- (CRPSection *)createSectionWithAirline:(CRPAirline *)airline withRows:(NSInteger)rows withCols:(NSInteger)cols andSeatClass:(NSString *)seatClass
{
    CRPSection *section = [[CRPSection alloc] initWithAirline:airline withRows:rows withCols:cols andSeatClass:seatClass];
    if (section != nil)
    {
        [sections addObject:section];
    }
    return section;
}

- (NSMutableArray *)getAllSections
{
    return sections;
}

- (NSMutableArray *)findAvailableFlightFromAirport:(CRPAirport *)originAirport
                                         toAirport:(CRPAirport *)destinyAirport
                                           andDate:(NSDate *)flightDate
{
    NSMutableArray *availableFlights;
    for (CRPFlight *flight in flights ) {
        if (flight.origin == originAirport || flight.destiny == destinyAirport || [flight.date isEqualToDate:flightDate])
        {
            if ([flight countOfAvailableSeats] ) {
                [availableFlights addObject:flight];
            }
        }
        
    }
    return availableFlights;
}
            
@end
