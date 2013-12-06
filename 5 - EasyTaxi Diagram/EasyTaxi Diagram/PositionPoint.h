//
//  Point.h
//  EasyTaxi Diagram
//
//  Created by Txai Wieser on 05/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PositionPoint : NSObject

- (void)setLatitude:(double)latitude;
- (void)setLongitude:(double)longitude;

- (double)getLongitude;
- (double)getLatitude;

@end
