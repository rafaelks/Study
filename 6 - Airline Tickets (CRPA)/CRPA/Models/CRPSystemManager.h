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

@interface CRPSystemManager : NSObject

- (void)addAirportWithCode:(NSString *)code andName:(NSString *)name;

- (NSMutableArray *)getAllAirports;

@end
