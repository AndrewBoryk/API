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

@interface APIViewController ()

@end

@implementation APIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [API GET:@"" header:nil parameters:nil progress:^(double fractionCompleted) {
        
    } completion:^(APIResponseObject *response, NSError *error) {
        
    }];
    
    [API POST:nil header:nil parameters:nil progress:nil completion:nil];
    
    [API PUT:@"" header:nil parameters:nil completion:^(APIResponseObject *response, NSError *error) {
        
    }];
    
    [API DEL:nil header:nil parameters:nil completion:^(APIResponseObject *response, NSError *error) {
        
    }];
    
    APIRequest *getRequest = [[APIRequest alloc] initWithURL:@""];
    [getRequest GET:^(APIResponseObject *response, NSError *error) {
        
    } withProgress:^(double fractionCompleted) {
        
    }];
    
    APIRequest *postRequest = [[APIRequest alloc] initWithURL:@""];
    [postRequest POST:^(APIResponseObject *response, NSError *error) {
        
    } withProgress:^(double fractionCompleted) {
        
    }];
    
    APIRequest *putRequest = [[APIRequest alloc] initWithBase:@"" version:nil apiKey:nil relativePath:nil];
    [putRequest PUT:^(APIResponseObject *response, NSError *error) {
        
    }];
    
    APIRequest *delRequest = [[APIRequest alloc] initWithBase:@"" version:nil apiKey:nil relativePath:nil];
    
    [delRequest DELETE:^(APIResponseObject *response, NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
