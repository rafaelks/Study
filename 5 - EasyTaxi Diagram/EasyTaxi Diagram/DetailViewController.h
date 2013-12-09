//
//  DetailViewController.h
//  EasyTaxi Diagram
//
//  Created by Rafael Kellermann Streit on 12/8/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    id _obj;
}

@property (nonatomic, retain) IBOutlet UILabel *labelType;
@property (strong, nonatomic) IBOutlet UILabel *labelName;

- (void)setObject:(id)obj;

@end
