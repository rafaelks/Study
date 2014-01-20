//
//  RKSViewController.m
//  ZoomImages
//
//  Created by Rafael Kellermann Streit on 1/20/14.
//  Copyright (c) 2014 Rafael Kellermann Streit. All rights reserved.
//

#import "RKSImageViewController.h"

@interface RKSImageViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation RKSImageViewController

- (void)viewDidLoad
{
    [self setTitle:[self.image objectForKey:@"title"]];
    [self.imageView setImage:[UIImage imageNamed:[self.image objectForKey:@"image"]]];
}

@end
