//
//  CRPFlight.h
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRPSeatClass.h"

@interface CRPFlight : NSObject{
    NSString *code;
}

@property (nonatomic, strong) NSString *code;
@property NSMutableArray *seatClasses;

- (id)initWithSeatClasses:(NSArray *)seatClasses;

@end
