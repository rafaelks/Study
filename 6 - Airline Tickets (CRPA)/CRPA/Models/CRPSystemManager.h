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

- (CRPAirplane *)addAirplanetWithCode:(NSString *)code andSections:(NSMutableArray *)sections;

- (NSMutableArray *)getAllAirplanes;


- (CRPAirport *)addAirportWithCode:(NSString *)code andName:(NSString *)name;

- (NSMutableArray *)getAllAirports;


- (CRPAirline *)addAirlineWithName:(NSString *)name;

- (NSMutableArray *)getAllAirlines;


- (void)createFlightWithAirline:(CRPAirline *)airLine
                     withOrigin:(CRPAirport *)origin
                    withDestiny:(CRPAirport *)destiny
                       withDate:(NSDate     *)date
                       withCode:(NSString   *)code;

- (NSMutableArray *)getAllFlights;

@end
