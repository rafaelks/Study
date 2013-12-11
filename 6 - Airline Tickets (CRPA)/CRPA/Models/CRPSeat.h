//
//  CRPSeat.h
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRPSeat : NSObject

@property (nonatomic, strong) NSString *seatId;
@property (nonatomic, getter = isFree) bool seatStatus;

- (id)initWithId:(NSString *)seatId;

@end
