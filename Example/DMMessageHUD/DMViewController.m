//
//  DMViewController.m
//  DMMessageHUD
//
//  Created by DeveloperiMichael on 08/10/2017.
//  Copyright (c) 2017 DeveloperiMichael. All rights reserved.
//

#import "DMViewController.h"
#import <DMMessageHUD/DMMessageHUD.h>
@interface DMViewController ()

@end

@implementation DMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 120, 40);
    button.center = self.view.center;
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"Show HUD" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
   
}


- (void)buttonAction:(UIButton *)button {
    [DMMessageHUD showHUDInView:self.view message:@"今天中午吃什么饭？" locateStyle:0 hideAfterDelay:3.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
