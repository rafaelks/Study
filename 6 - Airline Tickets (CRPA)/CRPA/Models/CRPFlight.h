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

@interface CRPFlight : NSObject{

}

@property NSMutableArray *seatClasses;

@property CRPAirline *airLine;
@property CRPAirport *origin;
@property CRPAirport *destiny;
@property NSDate     *date;
@property NSString   *code;

- (id)initWithSeatClasses:(NSArray *)seatClasses;

- (id)initWithAirline:(CRPAirline *)airLine
           withOrigin:(CRPAirport *)origin
          withDestiny:(CRPAirport *)destiny
             withDate:(NSDate     *)date
             withCode:(NSString   *)code;


@end
