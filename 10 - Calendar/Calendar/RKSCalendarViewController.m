//
//  RKSCalendarViewController.m
//  Calendar
//
//  Created by Rafael Kellermann Streit on 1/8/14.
//  Copyright (c) 2014 Rafael Kellermann Streit. All rights reserved.
//

#import "RKSCalendarViewController.h"
#import "RKSDaysViewController.h"

@interface RKSCalendarViewController ()

@end

@implementation RKSCalendarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // RKS NOTE: Construct months NSArray
    months = @[@{
        @"name": @"Janeiro",
        @"days": @31,
        @"holidays": @[@{
            @"day": @1,
            @"name": @"Réveillon"
        }]
    },@{
        @"name": @"Fevereiro",
        @"days": @28,
        @"holidays": @[@{
            @"day": @2,
            @"name": @"Nossa Senhora dos Navegantes"
        }]
    },@{
        @"name": @"Março",
        @"days": @31,
        @"holidays": @[@{
            @"day": @4,
            @"name": @"Carnaval"
        }]
    },@{
        @"name": @"Abril",
        @"days": @30,
        @"holidays": @[@{
            @"day": @17,
            @"name": @"Quinta-Feira Santa"
        },@{
            @"day": @18,
            @"name": @"Sexta-Feira Santa"
        },@{
            @"day": @19,
            @"name": @"Sábado de Aleluia"
        },@{
            @"day": @20,
            @"name": @"Páscoa"
        },@{
            @"day": @21,
            @"name": @"Tiradentes"
        }]
    },@{
        @"name": @"Maio",
        @"days": @31,
        @"holidays": @[@{
            @"day": @1,
            @"name": @"Dia do Trabalho"
        }]
    },@{
        @"name": @"Junho",
        @"days": @30,
        @"holidays": @[@{
            @"day": @12,
            @"name": @"Copa do Mundo"
        },@{
            @"day": @17,
            @"name": @"Copa do Mundo"
        },@{
            @"day": @18,
            @"name": @"Copa do Mundo"
        },@{
            @"day": @19,
            @"name": @"Corpus Christi"
        },@{
            @"day": @23,
            @"name": @"Copa do Mundo"
        },@{
            @"day": @25,
            @"name": @"Copa do Mundo"
        },@{
            @"day": @30,
            @"name": @"Copa do Mundo"
        }]
    },@{
        @"name": @"Julho",
        @"days": @31,
        @"holidays": @[]
    },@{
        @"name": @"Agosto",
        @"days": @31,
        @"holidays": @[]
    },@{
        @"name": @"Setembro",
        @"days": @30,
        @"holidays": @[@{
            @"day": @7,
            @"name": @"Independência do Brasil"
        },@{
            @"day": @20,
            @"name": @"Revolução Farroupilha"
        }]
    },@{
        @"name": @"Outubro",
        @"days": @31,
        @"holidays": @[@{
            @"day": @12,
            @"name": @"Nossa Senhora Aparecida"
        },@{
            @"day": @15,
            @"name": @"Dia do Professor"
        }]
    },@{
        @"name": @"Novembro",
        @"days": @30,
        @"holidays": @[@{
            @"day": @2,
            @"name": @"Finados"
        },@{
            @"day": @15,
            @"name": @"Proclamação da República"
        }]
    },@{
        @"name": @"Dezembro",
        @"days": @31,
        @"holidays": @[@{
            @"day": @25,
            @"name": @"Natal"
        }]
    }];
    
    NSDictionary *foo = @{@"1": @{@"1": @"foo"}};

    // RKS NOTE: Create buttons, based on Months array
    int counter = 0;
    float buttonWidth = self.viewWrapper.frame.size.width;
    float topSpacing = 0;
    
    for (NSDictionary *month in months) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, topSpacing, buttonWidth, 50)];
        [button setTag:counter];
        [button setTitle:[month objectForKey:@"name"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:14.f]];
        
        [button addTarget:self
                   action:@selector(showMonthDays:)
         forControlEvents:UIControlEventTouchUpInside];

        [self.viewWrapper addSubview:button];
        
        topSpacing += 30;
        counter++;
    };
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSDictionary *month = [months objectAtIndex:[sender tag]];
    RKSDaysViewController *controller = (RKSDaysViewController *) segue.destinationViewController;
    [controller setMonth:month];
}

#pragma mark - Actions

- (void)showMonthDays:(id)sender
{
    [self performSegueWithIdentifier:@"showDays" sender:sender];
}

@end
