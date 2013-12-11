//
//  CRPSeatClass.h
//  CRPA
//
//  Created by Rodrigo Nascimento on 11/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRPSeatClass : NSObject

- (NSDictionary *)getClasses;

+ (id)sharedManager;

@end
