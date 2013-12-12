//
//  MenuTableViewController.h
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRPSystemManager.h"

@interface MenuTableViewController : UITableViewController <UITableViewDelegate> {
    CRPSystemManager *manager;
}

@end
