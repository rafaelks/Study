//
//  CRPAirplane.h
//  CRPA
//
//  Created by Rodrigo Nascimento on 12/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRPSection.h"
#import "CRPAirline.h"

@interface CRPAirplane : NSObject

@property NSString *code;
@property NSMutableArray *sections;
@property CRPAirline *airline;


- (id)initWithCode:(NSString *)code withSections:(NSMutableArray *)sections andAirline:(CRPAirline *)airline;

@end
