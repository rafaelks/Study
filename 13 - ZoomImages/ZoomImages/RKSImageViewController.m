//
//  RKSViewController.m
//  ZoomImages
//
//  Created by Rafael Kellermann Streit on 1/20/14.
//  Copyright (c) 2014 Rafael Kellermann Streit. All rights reserved.
//

#import "RKSImageViewController.h"

@interface RKSImageViewController ()

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UISlider *sliderZoom;
@property (nonatomic, weak) IBOutlet UISwitch *switchZoomEnabled;

@end

@implementation RKSImageViewController

- (void)viewDidLoad
{
    [self setTitle:[self.image objectForKey:@"title"]];
    [self.imageView setImage:[UIImage imageNamed:[self.image objectForKey:@"image"]]];
}

#pragma mark - Components actions

- (IBAction)switchZoomEnabledValueChanged:(UISwitch *)sender {
    if (_switchZoomEnabled.on) {
        [_scrollView setZoomScale:1.0 animated:YES];
        [_scrollView setMinimumZoomScale:1.0];
        [_scrollView setMaximumZoomScale:3.0];
        [_scrollView setScrollEnabled:YES];
        [_sliderZoom setEnabled:YES];
    } else {
        [_scrollView setZoomScale:1.0 animated:YES];
        [_scrollView setMinimumZoomScale:1.0];
        [_scrollView setMaximumZoomScale:1.0];
        [_scrollView setScrollEnabled:NO];
        [_sliderZoom setEnabled:NO];
    }
}

- (IBAction)sliderZoomScaleValueChanged:(UISlider *)sender {
    [_scrollView setZoomScale:_sliderZoom.value animated:YES];
}

#pragma mark - ScrollView delegates

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    [_sliderZoom setValue:_scrollView.zoomScale animated:YES];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

@end
