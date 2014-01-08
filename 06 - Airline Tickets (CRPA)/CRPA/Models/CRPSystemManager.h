//
//  CRPSystemManager.h
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRPAirplane.h"
#import "CRPAirport.h"
#import "CRPFlight.h"
#import "CRPSection.h"

@interface CRPSystemManager : NSObject

+ (id)sharedManager;

- (CRPAirplane *)addAirplanetWithCode:(NSString *)code withSections:(NSArray *)_sections andAirline:(CRPAirline *)airline;
- (CRPAirline *)addAirlineWithName:(NSString *)name;
- (CRPAirport *)addAirportWithCode:(NSString *)code andName:(NSString *)name;
- (CRPSection *)createSectionWithAirline:(CRPAirline *)airline withRows:(NSInteger)rows withCols:(NSInteger)cols andSeatClass:(NSString *)seatClass;
- (NSMutableArray *)getAllAirplanes;
- (NSMutableArray *)getAllAirplanesFromAirline:(CRPAirline *)airline;
- (NSMutableArray *)getAllFlightsFromAirline:(CRPAirline *)airline;
- (NSMutableArray *)getAllAirports;
- (NSMutableArray *)getAllAirlines;
- (NSMutableArray *)getAllFlights;
- (NSMutableArray *)getAllSections;
- (void) displaySystemDetails;
- (BOOL) bookSeatWithFlight:(CRPFlight *) flight withSeatClass:(CRPSeatClass *) seatClass withRow:(NSInteger) row withCol:(char) col;
- (void)createFlightWithAirline:(CRPAirline *)airline withAirplane:(CRPAirplane *)airplane withOrigin:(CRPAirport *)origin withDestiny:(CRPAirport *)destiny withDate:(NSDate *)date withCode:(NSString *)code;

@end
