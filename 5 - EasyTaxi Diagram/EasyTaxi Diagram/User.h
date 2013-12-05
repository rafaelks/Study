//
//  User.h
//  EasyTaxi Diagram
//
//  Created by Rafael Kellermann Streit on 12/5/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

- (void)setId:(NSString *)id;
- (void)setName:(NSString *)name;

- (NSString *)getId;
- (NSString *)getName;

@end
