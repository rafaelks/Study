//
//  Person.m
//  EasyTaxi Diagram
//
//  Created by Txai Wieser on 05/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "Person.h"
#import "PositionPoint.h"
#import "Driver.h"

@implementation Person
{
    PositionPoint* _position;
    NSMutableArray* _favorites;
    
}

- (void)setPosition:(PositionPoint*)position
{
    _position = _position;
}

- (void)addFavorites:(Driver*)favorite
{
    [_favorites addObject: favorite];
}

- (NSMutableArray*)getFavorites
{
    return _favorites;
}

- (PositionPoint*)getPosition
{
    return _position;
}

@end
