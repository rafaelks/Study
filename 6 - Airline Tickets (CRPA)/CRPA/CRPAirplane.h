//
//  CRPAirplane.h
//  CRPA
//
//  Created by Rodrigo Nascimento on 12/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRPSection.h"

@interface CRPAirplane : NSObject

@property NSString *code;
@property NSMutableArray *sections;


- (id)initWithCode:(NSString *)code andSections:(NSMutableArray *)sections;

@end
