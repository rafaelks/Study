//
//  CRPAirport.h
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRPAirport : NSObject

@property (nonatomic, strong) NSString *name;

- (id)initWithName:(NSString *)name;

@end
