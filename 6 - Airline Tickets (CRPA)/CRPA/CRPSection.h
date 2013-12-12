//
//  CRPASection.h
//  CRPA
//
//  Created by Gabriel Tondin on 11/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRPAirline.h"
#import "CRPSeatClass.h"

@interface CRPSection : NSObject

@property (nonatomic) NSString *seatClass;
@property (nonatomic) NSInteger rows;
@property (nonatomic) NSInteger cols;

-(id)initWithAirline:(CRPAirline *)airline withRows:(NSInteger)rows withCols:(NSInteger)cols andSeatClass:(NSString *)seatClass;

@end
