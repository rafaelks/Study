//
//  User.m
//  EasyTaxi Diagram
//
//  Created by Rafael Kellermann Streit on 12/5/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "User.h"

@implementation User
{
    NSString *_id;
    NSString *_name;
}

- (void)setId:(NSString *)id
{
    _id = id;
}

- (void)setName:(NSString *)name
{
    _name = name;
}

- (NSString *)getId
{
    return _id;
}

- (NSString *)getName
{
    return _name;
}

@end
