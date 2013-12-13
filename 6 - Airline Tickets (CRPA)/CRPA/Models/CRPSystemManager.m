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

- (CRPAirplane *)addAirplanetWithCode:(NSString *)code withSections:(NSArray *)_sections andAirline:(CRPAirline *)airline {
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

- (void)displaySystemDetails
{
    NSLog(@"Relatório de Objetos do Sistema");

    NSLog(@"\nAeroportos:");
    for (CRPAirport *item in airports) {
        NSLog(@"    %@ - %@", item.code, item.name);
    }
    

    NSLog(@"\nCompanhias Aéreas:");
    for (CRPAirline *item in airlines) {
        NSLog(@"    %@", item.name);
    }
    

    NSLog(@"Aeronaves:");
    for (CRPAirplane *item in airplanes) {
        NSLog(@"    %@ - %@", item.code, item.airline.name);
        
        // section
        for (CRPSection *section in item.sections) {
            NSLog(@"        %@ - %ld coluna(s) e %ld linha(s) - %ld assento(s)", [[CRPSeatClass getClasses] objectForKey:section.seatClass], section.cols, section.rows, section.cols * section.rows);
        }
        
        
    }
    
    NSLog(@" ");
    NSLog(@"Flights:");
    for (CRPFlight *item in flights) {
        // 20/12/2013 10:22 AZUL[ASD123] - POA -> FLP - 747 (Assentos livres 22 de 40)
        NSLog(@"%@ %@[%@] - %@ -> %@", item.date, item.airplane.airline.name, item.code, item.origin.code, item.destiny.code);
        NSLog(@" ");
    }
    
}

- (BOOL)bookSeatWithFlight:(CRPFlight *) flight withSeatClass:(NSString *) seatClass withRow:(NSInteger) row withCol:(char) col
{
    for (CRPSeat *seat in flight.classes[seatClass]) {
        if (seat.seatId == [NSString stringWithFormat:@"%ld%c", row, col]) {
            if (seat.isFree){
                seat.seatStatus = false;
                return true;
                NSLog(@"O assento foi reservado!");
            }else{
                NSLog(@"O assento solicitado não existe para esta classe de voo!");
                return false;
            }
        }
    }
    
    NSLog(@"O assento solicitado está indisponível!");

    return false;
}

@end
