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

- (CRPAirplane *)addAirplanetWithCode:(NSString *)code withSections:(NSMutableArray *)_sections andAirline:(CRPAirline *)airline;

- (NSMutableArray *)getAllAirplanes;

- (NSMutableArray *)getAllAirplanesFromAirline:(CRPAirline *)airline;


- (CRPAirport *)addAirportWithCode:(NSString *)code andName:(NSString *)name;

- (NSMutableArray *)getAllAirports;


- (CRPAirline *)addAirlineWithName:(NSString *)name;

- (NSMutableArray *)getAllAirlines;


- (void)createFlightWithAirline:(CRPAirline *)airLine
                     withOrigin:(CRPAirport *)origin
                    withDestiny:(CRPAirport *)destiny
                       withYear:(int)year
                      withMonth:(int)month
                        withDay:(int)day
                       withCode:(NSString *)code;

- (NSMutableArray *)getAllFlights;

- (CRPSection *)createSectionWithAirline:(CRPAirline *)airline andFlight:(CRPFlight *)flID andRows:(NSInteger)rows andCols:(NSInteger)cols;

- (NSMutableArray *)getAllSections;

@end
