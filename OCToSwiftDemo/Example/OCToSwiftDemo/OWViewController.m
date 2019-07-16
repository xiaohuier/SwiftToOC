//
//  OWViewController.m
//  OCToSwiftDemo
//
//  Created by eastzhou on 07/08/2019.
//  Copyright (c) 2019 eastzhou. All rights reserved.
//

#import "OWViewController.h"
//#import <OCToSwiftDemo/FirstViewController.h>
@import OCToSwiftDemo;

@interface OWViewController ()

@end

@implementation OWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    FirstViewController *vc =[[FirstViewController alloc] init];
    SecondViewController *vc1 = [[SecondViewController alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
