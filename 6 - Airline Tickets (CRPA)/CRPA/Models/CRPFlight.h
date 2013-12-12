//
//  CRPFlight.h
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRPSeatClass.h"
#import "CRPAirline.h"
#import "CRPAirport.h"
#import "CRPAirplane.h"
#import "CRPSeat.h"

@interface CRPFlight : NSObject{

}

@property NSMutableArray *seatClasses;

@property (nonatomic) CRPAirline  *airline;
@property (nonatomic) CRPAirplane *airplane;
@property (nonatomic) CRPAirport  *origin;
@property (nonatomic) CRPAirport  *destiny;
@property (nonatomic) NSDate      *date;
@property (nonatomic) NSString    *code;
@property (nonatomic) NSMutableDictionary *classes;

- (id)initWithSeatClasses:(NSArray *)seatClasses;

- (id)initWithAirline:(CRPAirline *)airline
         withAirplane:(CRPAirplane *)airplane
           withOrigin:(CRPAirport *)origin
          withDestiny:(CRPAirport *)destiny
             withDate:(NSDate     *)date
             withCode:(NSString   *)code;

- (int) countOfAvailableSeats;

@end
