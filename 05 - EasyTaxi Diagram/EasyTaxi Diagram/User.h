//
//  User.h
//  EasyTaxi Diagram
//
//  Created by Rafael Kellermann Streit on 12/5/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

- (void)setActive:(BOOL)active;
- (void)setId:(NSString *)id;
- (void)setName:(NSString *)name;
- (void)setPassword:(NSString *)password;
- (void)setPhone:(NSString *)phone;
- (void)setBirthday:(NSDate *)birthday;
- (void)setCreatedAt:(NSDate *)date;

- (NSString *)getId;
- (NSString *)getName;
- (NSString *)getPassword;
- (NSString *)getPhone;
- (NSDate *)getBirthday;
- (BOOL)isActive;

@end
