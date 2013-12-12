//
//  DetailsTableViewController.h
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRPSystemManager.h"

@interface DetailsTableViewController : UITableViewController <UITableViewDataSource>

@property (nonatomic, strong) CRPSystemManager *manager;
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSString *type;

- (void)loadData:(NSMutableArray *)data withType:(NSString *)type;

@end
