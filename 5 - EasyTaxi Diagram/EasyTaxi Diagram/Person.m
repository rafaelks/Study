//
//  Person.m
//  EasyTaxi Diagram
//
//  Created by Txai Wieser on 05/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "Person.h"
#import "Driver.h"
#import <MapKit/MapKit.h>

@implementation Person
{
    CLLocationCoordinate2D *_position;
    NSMutableArray *_favorites;
    
}

- (void)setPosition:(CLLocationCoordinate2D *)position
{
    _position = position;
}

- (void)addFavorites:(Driver*)favorite
{
    [_favorites addObject: favorite];
}

- (NSMutableArray*)getFavorites
{
    return _favorites;
}

- (CLLocationCoordinate2D *)getPosition
{
    return _position;
}

@end
