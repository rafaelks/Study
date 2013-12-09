//
//  DetailViewController.m
//  EasyTaxi Diagram
//
//  Created by Rafael Kellermann Streit on 12/8/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "DetailViewController.h"
#import "Person.h"
#import "Driver.h"

@interface DetailViewController ()
@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)buttonAskDriverPressed:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Solicitação enviada!"
                                                    message:[NSString stringWithFormat:@"Enviamos a solicitação para o Taxista de placa: %@", [[_obj getCar] getLicence]]
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    
    [alert show];
}

- (void)setObject:(id)obj
{
    _obj = obj;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"view loaded");
    NSLog(@"%@", _labelType);
	// Do any additional setup after loading the view.
    
    if ([_obj isKindOfClass:[Driver class]]) {
        [_labelType setText:@"Taxista"];
    } else {
        [_labelType setText:@"Usuário"];
    }
    
    [_labelName setText:[_obj getName]];
    
    // Hide button when is User
    if ([_obj isKindOfClass:[Person class]]) {
        [_buttonAskDriver setHidden:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
