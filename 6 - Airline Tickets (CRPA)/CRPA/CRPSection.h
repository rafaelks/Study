//
//  CRPASection.h
//  CRPA
//
//  Created by Gabriel Tondin on 11/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRPAirline.h"
#import "CRPFlight.h"
#import "CRPSeat.h"

@interface CRPSection : NSObject

@property (nonatomic) NSInteger rows;
@property (nonatomic) NSInteger cols;
@property (nonatomic, strong) NSArray *seats;

-(id)initWithAirline:(CRPAirline *)airline withFlight:(CRPFlight *)flID withRows:(NSInteger)rows withCols:(NSInteger)cols;


@end
