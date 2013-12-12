//
//  CRPSystemManager.h
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRPAirline.h"
#import "CRPAirport.h"
#import "CRPFlight.h"
#import "CRPSection.h"

@interface CRPSystemManager : NSObject

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

@end
