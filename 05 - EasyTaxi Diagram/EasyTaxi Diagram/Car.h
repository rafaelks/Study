//
//  Car.h
//  EasyTaxi Diagram
//
//  Created by fabioschneider on 06/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Payment.h"
#import <MapKit/MapKit.h>

@interface Car : NSObject

- (void)setLicence:(NSString *)licence;
- (void)setModel:(NSString *)model;
- (void)setPayment:(Payment *)payment;
- (void)setActive:(BOOL)active;
- (void)setBigTrunk:(BOOL)bigtrunk;
- (void)setPosition:(CLLocationCoordinate2D *)position;


- (NSString *)getLicence;
- (NSString *)getModel;
- (Payment *)getPayment;
- (BOOL)getActive;
- (BOOL)getBigTrunk;
- (CLLocationCoordinate2D *)getPosition;

@end
