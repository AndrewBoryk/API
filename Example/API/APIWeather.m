//
//  APIWeather.m
//  API
//
//  Created by Andrew Boryk on 3/21/17.
//  Copyright © 2017 andrewboryk. All rights reserved.
//

#import "APIWeather.h"
#import <API/API.h>

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

@implementation APIWeather

+ (void)requestWeather:(APIRequestType)type usingMethod:(APIMethodType)method {
    
    if (type == GET) {
        [APIWeather getUsingMethod:method];
    } else if (type == POST) {
        [APIWeather postUsingMethod:method];
    } else if (type == PUT) {
        [APIWeather putUsingMethod:method];
    } else if (type == DELETE) {
        [APIWeather deleteUsingMethod:method];
    }

}

+ (void)getUsingMethod:(APIMethodType)method {
    if (method == UsingAPI) {
        [API GET:@"" header:nil parameters:nil progress:^(double fractionCompleted) {
            
        } completion:^(APIResponseObject *response, NSError *error) {
            
        }];
    } else {
        APIRequest *getRequest = [[APIRequest alloc] initWithBase:@"https://api.darksky.net/forecast/" version:nil apiKey:@"950e317eea58b38eee95c363e53f040e" relativePath:@"37.8267,-122.4233"];
        [getRequest GET:^(APIResponseObject *response, NSError *error) {
            NSLog(@"API Response: %@", response);
        } withProgress:^(double fractionCompleted) {
            
        }];
    }
}

+ (void)postUsingMethod:(APIMethodType)method {
    if (method == UsingAPI) {
        [API POST:nil header:nil parameters:nil progress:^(double fractionCompleted) {
            
        } completion:^(APIResponseObject *response, NSError *error) {
            
        }];
    } else {
        APIRequest *postRequest = [[APIRequest alloc] initWithURL:@""];
        [postRequest POST:^(APIResponseObject *response, NSError *error) {
            
        } withProgress:^(double fractionCompleted) {
            
        }];
    }
}

+ (void)putUsingMethod:(APIMethodType)method {
    if (method == UsingAPI) {
        [API PUT:@"" header:nil parameters:nil completion:^(APIResponseObject *response, NSError *error) {
            
        }];
    } else {
        APIRequest *putRequest = [[APIRequest alloc] initWithBase:@"" version:nil apiKey:nil relativePath:nil];
        [putRequest PUT:^(APIResponseObject *response, NSError *error) {
            
        }];
    }
}

+ (void)deleteUsingMethod:(APIMethodType)method {
    if (method == UsingAPI) {
        [API DEL:nil header:nil parameters:nil completion:^(APIResponseObject *response, NSError *error) {
            
        }];
    } else {
        APIRequest *delRequest = [[APIRequest alloc] initWithBase:[API base] version:[API version] apiKey:[API apiKey] relativePath:@"test/"];
        
        [delRequest DELETE:^(APIResponseObject *response, NSError *error) {
            
        }];
    }
}

@end
