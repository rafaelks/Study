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

@interface CRPASection : NSObject

@property (nonatomic) NSInteger row;
@property (nonatomic) NSInteger col;

-(id)initWithAirline:(CRPAirline *) flight(CRPAFlight *) rows(NSInteger int) Cols(NSInteger int);

@end
