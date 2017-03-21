//
//  APIWeather.h
//  API
//
//  Created by Andrew Boryk on 3/21/17.
//  Copyright © 2017 andrewboryk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <API/APIRequest.h>

typedef NS_ENUM(NSInteger, APIMethodType) {
    UsingAPI,
    UsingAPIRequest,
};

@interface APIWeather : NSObject

/// Make a request type for testing weather
+ (void)requestWeather:(APIRequestType)type usingMethod:(APIMethodType)method;

@end
