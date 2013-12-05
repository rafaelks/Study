//
//  Person.m
//  Hello Objective-C
//
//  Created by Rafael Kellermann Streit on 12/5/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "Person.h"

@implementation Person
{
    NSInteger idPerson;
    NSString *namePerson;
}

- (instancetype)init
{
    return self;
}

- (NSInteger)getId
{
    return idPerson;
}

- (NSString *)getName
{
    return namePerson;
}

- (void)setId:(NSInteger)id;
{
    idPerson = id;
}

- (void)setName:(NSString *)name
{
    namePerson = name;
}

@end
