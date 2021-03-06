//
//  APIViewController.m
//  API
//
//  Created by andrewboryk on 03/18/2017.
//  Copyright (c) 2017 andrewboryk. All rights reserved.
//

#import "APIViewController.h"
#import <API/API.h>
#import <API/APIRequest.h>
#import "APIWeather.h"

@interface APIViewController ()

@end

@implementation APIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [APIWeather requestWeather:GET usingMethod:UsingAPIRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
