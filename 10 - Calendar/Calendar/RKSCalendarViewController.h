//
//  RKSCalendarViewController.h
//  Calendar
//
//  Created by Rafael Kellermann Streit on 1/8/14.
//  Copyright (c) 2014 Rafael Kellermann Streit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RKSCalendarViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *months;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end
