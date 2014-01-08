//
//  RKSDayViewController.h
//  Calendar
//
//  Created by Rafael Kellermann Streit on 1/8/14.
//  Copyright (c) 2014 Rafael Kellermann Streit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RKSDayViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *holidays;
@property (nonatomic, assign) NSInteger day;
@property (nonatomic, strong) IBOutlet UIView *viewWrapper;

@end
