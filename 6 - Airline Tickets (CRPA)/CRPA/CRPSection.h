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

@interface CRPSection : NSObject

@property (nonatomic) NSInteger rows;
@property (nonatomic) NSInteger cols;

-(id)initWithAirline:(CRPAirline *)airline withFlight:(CRPFlight *)flight withRows:(NSInteger)rows withCols:(NSInteger)cols;

@end
