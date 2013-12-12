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

@property (nonatomic) NSString *code;
@property (nonatomic) NSMutableArray *sections;
@property (nonatomic) CRPAirline *airline;


- (id)initWithCode:(NSString *)code withSections:(NSMutableArray *)sections andAirline:(CRPAirline *)airline;

@end
