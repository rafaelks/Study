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
    BOOL _active;

    NSString *_id;
    NSString *_name;
    NSString *_password;
    NSString *_phone;

    NSDate *_birthday;
    NSDate *_created_at;
}

- (void)setId:(NSString *)id
{
    _id = id;
}

- (void)setName:(NSString *)name
{
    _name = name;
}

- (void)setPassword:(NSString *)password
{
    _password = password;
}

- (void)setPhone:(NSString *)phone
{
    _phone = phone;
}

- (void)setActive:(BOOL)active
{
    _active = active;
}

- (void)setBirthday:(NSDate *)birthday
{
    _birthday = birthday;
}

- (void)setCreatedAt:(NSDate *)date
{
    _created_at = date;
}

- (NSString *)getId
{
    return _id;
}

- (NSString *)getName
{
    return _name;
}

- (NSString *)getPassword
{
    return _password;
}

- (NSString *)getPhone
{
    return _phone;
}

- (NSDate *)getBirthday
{
    return _birthday;
}

- (BOOL)isActive
{
    return _active;
}

@end
