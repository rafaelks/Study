//
//  Person.h
//  Hello Objective-C
//
//  Created by Rafael Kellermann Streit on 12/5/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSInteger idPerson;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int foo;
@property (nonatomic, readonly, getter = isLive) BOOL live;

- (id)initWithLive:(BOOL)live;

@end
