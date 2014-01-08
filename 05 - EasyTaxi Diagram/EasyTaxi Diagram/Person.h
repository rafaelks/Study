//
//  Person.h
//  EasyTaxi Diagram
//
//  Created by Txai Wieser on 05/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "User.h"
#import "Driver.h"
#import <MapKit/MapKit.h>

@interface Person : User

- (void)setPosition:(CLLocationCoordinate2D*)position;

- (void)addFavorites:(Driver*)favorite;

- (NSMutableArray*)getFavorites;

- (CLLocationCoordinate2D*)getPosition;

@end
