//
//  Driver.h
//  EasyTaxi Diagram
//
//  Created by Txai Wieser on 05/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "User.h"

@interface Driver : User

- (void)setLicence:(NSString *)licence;
- (void)setCar:(NSString *)car;

- (NSString *)getLicence;
- (NSString *)getCar;


@end
