//
//  Person.h
//  Hello Objective-C
//
//  Created by Rafael Kellermann Streit on 12/5/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (void)setId:(NSInteger)id;
- (void)setName:(NSString *)name;
- (NSInteger)getId;
- (NSString *)getName;

@end
