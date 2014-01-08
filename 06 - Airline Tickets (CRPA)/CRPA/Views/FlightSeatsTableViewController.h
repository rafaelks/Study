//
//  FlightSeatsTableViewController.h
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRPSystemManager.h"
#import "CRPFlight.h"

@interface FlightSeatsTableViewController : UITableViewController {
    CRPSystemManager *manager;
}

@property (nonatomic, strong) CRPFlight *flight;

@end
