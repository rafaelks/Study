//
//  RKSImagesTableViewController.m
//  ZoomImages
//
//  Created by Rafael Kellermann Streit on 1/20/14.
//  Copyright (c) 2014 Rafael Kellermann Streit. All rights reserved.
//

#import "RKSImagesTableViewController.h"
#import "RKSImageViewController.H"

@interface RKSImagesTableViewController ()

@property (nonatomic, strong) NSArray *images;

@end

@implementation RKSImagesTableViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}


- (NSArray *)images
{
    if (!_images) {
        _images = @[@{
            @"title": @"Miyagi 01",
            @"image": @"Miyagi-01.png"
        },@{
            @"title": @"Miyagi 02",
            @"image": @"Miyagi-02.png"
        },@{
            @"title": @"Silvio Santos",
            @"image": @"Silvio-Santos.jpg"
        }];
    }
    
    return _images;
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.images.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *image = [self.images objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Image" forIndexPath:indexPath];
    
    UILabel *labelTitle = (UILabel *) [cell viewWithTag:100];
    [labelTitle setText:[image objectForKey:@"title"]];
    
    UIImageView *imageView = (UIImageView *) [cell viewWithTag:200];
    [imageView setImage:[UIImage imageNamed:[image objectForKey:@"image"]]];
    
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSDictionary *image = [self.images objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
    RKSImageViewController *controller = (RKSImageViewController *) segue.destinationViewController;
    [controller setImage:image];
}


@end
