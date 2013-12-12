//
//  CRPSystemManager.m
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "CRPSystemManager.h"
#import "CRPAirport.h"

@implementation CRPSystemManager {
    NSMutableArray *airports;
    NSMutableArray *airlines;
    NSMutableArray *flights;
    NSMutableArray *sections;
}

- (instancetype)init
{
    self = [super init];
    
    airports = [[NSMutableArray alloc] init];
    airlines = [[NSMutableArray alloc] init];
    flights = [[NSMutableArray alloc] init];
    sections = [[ NSMutableArray alloc] init];

    return self;
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

- (void)createFlightWithAirline:(CRPAirline *)airLine
                     withOrigin:(CRPAirport *)origin
                    withDestiny:(CRPAirport *)destiny
                       withYear:(int)year
                      withMonth:(int)month
                        withDay:(int)day
                       withCode:(NSString *)code
{
    CRPFlight *flight = [[CRPFlight alloc] initWithAirline:(CRPAirline *)airLine
                                                withOrigin:(CRPAirport *)origin
                                               withDestiny:(CRPAirport *)destiny
                                                  withYear:(int)year
                                                 withMonth:(int)month
                                                   withDay:(int)day
                                                  withCode:(NSString *)code];
    
    if (flight != nil) {
        [flights addObject:flight];
    }
}

- (NSMutableArray *)getAllFlights
{
    return flights;
}

# pragma Section

- (void)createSectionWithAirline:(CRPAirline *)airline andFlight:(CRPFlight *)flID andRows:(NSInteger)rows andCols:(NSInteger)cols
{
    CRPSection *section = [[CRPSection alloc] initWithAirline:(CRPAirline *)airline andFlight:(CRPFlight *)flID andRows:(NSInteger)rows andCols:(NSInteger)cols];
    if (section != nil)
    {
        [sections addObject:section];
    }
}

- (NSMutableArray *)getAllSections
    {
        return sections;
    }

@end
