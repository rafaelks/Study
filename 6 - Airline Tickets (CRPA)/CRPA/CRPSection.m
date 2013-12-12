//
//  CRPASection.m
//  CRPA
//
//  Created by Gabriel Tondin on 11/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "CRPSection.h"

@implementation CRPSection

-(id)initWithAirline:(CRPAirline *)airline withRows:(NSInteger)rows withCols:(NSInteger)cols andSeatClass:(NSString *)seatClass
{
    self = [ super init];
    
    if (self) {
        _rows = rows;
        _cols = cols;
        _seatClass = seatClass;
    }
    
    return self;
}

# warning Implement setter of seatClass to validate type

@end
