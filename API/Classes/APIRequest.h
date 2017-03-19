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
@property (strong, nonatomic) NSString *url;

/// Base of the URL for the API request
@property (strong, nonatomic) NSString *base;

/// API key to include in the URL for the API request
@property (strong, nonatomic) NSString *apiKey;

/// API version to include in the URL for the API request
@property (strong, nonatomic) NSString *version;

/// Relative path for the ending of the URL for the API request
@property (strong, nonatomic) NSString *relativePath;

/// URL string for the request, made up with all components specified in the request
@property (strong, nonatomic, readonly) NSString *urlString;

#pragma mark - URL Initializers

/// Initialize an APIRequest with a url,
- (instancetype)initWithURL:(NSString *)url;

/// Initialize an APIRequest with a url and params
- (instancetype)initWithURL:(NSString *)url params:(NSDictionary *)params;

/// Initialize an APIRequest with a url and header
- (instancetype)initWithURL:(NSString *)url header:(NSDictionary *)header;

/// Initialize an APIRequest with a url, params, and header
- (instancetype)initWithURL:(NSString *)url params:(NSDictionary *)params header:(NSDictionary *)header;

#pragma mark - Base/Path Initializers

/// Initialize an APIRequest with a base and relativePath
- (instancetype)initWithBase:(NSString *)base relativePath:(NSString *)relativePath;

/// Initialize an APIRequest with a base and relativePath, along with: params
- (instancetype)initWithBase:(NSString *)base relativePath:(NSString *)relativePath params:(NSDictionary *)params;

/// Initialize an APIRequest with a base and relativePath, along with: header
- (instancetype)initWithBase:(NSString *)base relativePath:(NSString *)relativePath header:(NSDictionary *)header;

/// Initialize an APIRequest with a base and relativePath, along with: params, header
- (instancetype)initWithBase:(NSString *)base relativePath:(NSString *)relativePath params:(NSDictionary *)params header:(NSDictionary *)header;

#pragma mark - Base/Version/Path Initializers

/// Initialize an APIRequest with a base and relativePath, along with: version
- (instancetype)initWithBase:(NSString *)base version:(NSString *)version relativePath:(NSString *)relativePath;

/// Initialize an APIRequest with a base and relativePath, along with: version, params
- (instancetype)initWithBase:(NSString *)base version:(NSString *)version relativePath:(NSString *)relativePath params:(NSDictionary *)params;

/// Initialize an APIRequest with a base and relativePath, along with: version, header
- (instancetype)initWithBase:(NSString *)base version:(NSString *)version relativePath:(NSString *)relativePath header:(NSDictionary *)header;

/// Initialize an APIRequest with a base and relativePath, along with: version, params, header
- (instancetype)initWithBase:(NSString *)base version:(NSString *)version relativePath:(NSString *)relativePath params:(NSDictionary *)params header:(NSDictionary *)header;

#pragma mark - Base/API/Path Initializers

/// Initialize an APIRequest with a base and relativePath, along with: apiKey
- (instancetype)initWithBase:(NSString *)base apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath;

/// Initialize an APIRequest with a base and relativePath, along with: apiKey, params
- (instancetype)initWithBase:(NSString *)base apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath params:(NSDictionary *)params;

/// Initialize an APIRequest with a base and relativePath, along with: apiKey, header
- (instancetype)initWithBase:(NSString *)base apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath header:(NSDictionary *)header;

/// Initialize an APIRequest with a base and relativePath, along with: apiKey, params, header
- (instancetype)initWithBase:(NSString *)base apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath params:(NSDictionary *)params header:(NSDictionary *)header;

#pragma mark - Base/Version/API/Path Initializers

/// Initialize an APIRequest with a base and relativePath, along with: version, apiKey
- (instancetype)initWithBase:(NSString *)base version:(NSString *)version apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath;

/// Initialize an APIRequest with a base and relativePath, along with: version, apiKey, params
- (instancetype)initWithBase:(NSString *)base version:(NSString *)version apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath params:(NSDictionary *)params;

/// Initialize an APIRequest with a base and relativePath, along with: version, apiKey, header
- (instancetype)initWithBase:(NSString *)base version:(NSString *)version apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath header:(NSDictionary *)header;

/// Initialize an APIRequest with a base and relativePath, along with: version, apiKey, params, header
- (instancetype)initWithBase:(NSString *)base version:(NSString *)version apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath params:(NSDictionary *)params header:(NSDictionary *)header;

#pragma mark - Instance Requests

/// Make an APIRequest with specified type
- (void)request:(ABAPIRequestType)type completion:(APIResponseBlock)completionBlock;

/// Make a GET APIRequest
- (void)GET:(APIResponseBlock)completionBlock;

/// Make a POST APIRequest
- (void)POST:(APIResponseBlock)completionBlock;

/// Make a PUT APIRequest
- (void)PUT:(APIResponseBlock)completionBlock;

/// Make a DELETE APIRequest
- (void)DELETE:(APIResponseBlock)completionBlock;

/// Make a GET APIRequest with progress block
- (void)GET:(APIResponseBlock)completionBlock withProgress:(APIProgressBlock)progressBlock;

/// Make a GET APIRequest with progress block
- (void)POST:(APIResponseBlock)completionBlock withProgress:(APIProgressBlock)progressBlock;

#pragma mark - Class Requests

/// Make a request using the given APIRequest with the specified type
+ (void)request:(APIRequest *)request withType:(ABAPIRequestType)type completion:(APIResponseBlock)completionBlock;

/// Make a GET request using the given APIRequest
+ (void)GET:(APIRequest *)request completion:(APIResponseBlock)completionBlock;

/// Make a POST request using the given APIRequest
+ (void)POST:(APIRequest *)request completion:(APIResponseBlock)completionBlock;

/// Make a PUT request using the given APIRequest
+ (void)PUT:(APIRequest *)request completion:(APIResponseBlock)completionBlock;

/// Make a DELETE request using the given APIRequest
+ (void)DELETE:(APIRequest *)request completion:(APIResponseBlock)completionBlock;

/// Make a GET request using the given APIRequest with a progress block
+ (void)GET:(APIRequest *)request completion:(APIResponseBlock)completionBlock withProgress:(APIProgressBlock)progressBlock;

/// Make a POST request using the given APIRequest with a progress block
+ (void)POST:(APIRequest *)request completion:(APIResponseBlock)completionBlock withProgress:(APIProgressBlock)progressBlock;

@end
