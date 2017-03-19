//
//  APIRequest.h
//  Pods
//
//  Created by Andrew Boryk on 3/18/17.
//
//

#import <Foundation/Foundation.h>
#import "APICommons.h"

typedef NS_ENUM(NSInteger, ABAPIRequestType) {
    GET,
    POST,
    PUT,
    DELETE
};

@interface APIRequest : NSObject

/// Parameters for the API Request
@property (strong, nonatomic) NSMutableDictionary *params;

/// Header for the API request
@property (strong, nonatomic) NSDictionary *header;

/// URL for the API request
@property (strong, nonatomic) NSDictionary *url;

/// Base of the URL for the API request
@property (strong, nonatomic) NSDictionary *base;

/// API key to include in the URL for the API request
@property (strong, nonatomic) NSDictionary *apiKey;

/// API version to include in the URL for the API request
@property (strong, nonatomic) NSDictionary *version;

/// Relative path for the ending of the URL for the API request
@property (strong, nonatomic) NSDictionary *relativePath;

/// URL string for the request, made up with all components specified in the request
@property (strong, nonatomic, readonly) NSString *urlString;

/// GET request for API
- (void)GET:(APIResponseBlock)block;

/// POST request for API
- (void)POST:(APIResponseBlock)block;

/// PUT request for API
- (void)PUT:(APIResponseBlock)block;

/// DELETE request for API
- (void)DELETE:(APIResponseBlock)block;

/// GET request for API
+ (void)GET:(APIRequest *)request completion:(APIResponseBlock)block;

/// POST request for API
+ (void)POST:(APIRequest *)request completion:(APIResponseBlock)block;

/// PUT request for API
+ (void)PUT:(APIRequest *)request completion:(APIResponseBlock)block;

/// DELETE request for API
+ (void)DELETE:(APIRequest *)request completion:(APIResponseBlock)block;

@end
