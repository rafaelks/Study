//
//  NearViewController.h
//  EasyTaxi Diagram
//
//  Created by Rafael Kellermann Streit on 12/6/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NearViewController : UIViewController <MKMapViewDelegate>
{
    IBOutlet MKMapView *mapView;
    NSMutableArray *annotations;
}

@end
