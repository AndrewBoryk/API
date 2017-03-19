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

- (instancetype)initWithURL:(NSString *)url;

- (instancetype)initWithURL:(NSString *)url params:(NSDictionary *)params;

- (instancetype)initWithURL:(NSString *)url header:(NSDictionary *)header;

- (instancetype)initWithURL:(NSString *)url params:(NSDictionary *)params header:(NSDictionary *)header;

#pragma mark - Base/Path Initializers

- (instancetype)initWithBase:(NSString *)base relativePath:(NSString *)relativePath;

- (instancetype)initWithBase:(NSString *)base relativePath:(NSString *)relativePath params:(NSDictionary *)params;

- (instancetype)initWithBase:(NSString *)base relativePath:(NSString *)relativePath header:(NSDictionary *)header;

- (instancetype)initWithBase:(NSString *)base relativePath:(NSString *)relativePath params:(NSDictionary *)params header:(NSDictionary *)header;

#pragma mark - Base/Version/Path Initializers

- (instancetype)initWithBase:(NSString *)base version:(NSString *)version relativePath:(NSString *)relativePath;

- (instancetype)initWithBase:(NSString *)base version:(NSString *)version relativePath:(NSString *)relativePath params:(NSDictionary *)params;

- (instancetype)initWithBase:(NSString *)base version:(NSString *)version relativePath:(NSString *)relativePath header:(NSDictionary *)header;

- (instancetype)initWithBase:(NSString *)base version:(NSString *)version relativePath:(NSString *)relativePath params:(NSDictionary *)params header:(NSDictionary *)header;

#pragma mark - Base/API/Path Initializers

- (instancetype)initWithBase:(NSString *)base apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath;

- (instancetype)initWithBase:(NSString *)base apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath params:(NSDictionary *)params;

- (instancetype)initWithBase:(NSString *)base apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath header:(NSDictionary *)header;

- (instancetype)initWithBase:(NSString *)base apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath params:(NSDictionary *)params header:(NSDictionary *)header;

#pragma mark - Base/Version/API/Path Initializers

- (instancetype)initWithBase:(NSString *)base version:(NSString *)version apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath;

- (instancetype)initWithBase:(NSString *)base version:(NSString *)version apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath params:(NSDictionary *)params;

- (instancetype)initWithBase:(NSString *)base version:(NSString *)version apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath header:(NSDictionary *)header;

- (instancetype)initWithBase:(NSString *)base version:(NSString *)version apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath params:(NSDictionary *)params header:(NSDictionary *)header;

#pragma mark - Instance Requests

- (void)request:(ABAPIRequestType)type completion:(APIResponseBlock)block;

- (void)GET:(APIResponseBlock)block;

- (void)POST:(APIResponseBlock)block;

- (void)PUT:(APIResponseBlock)block;

- (void)DELETE:(APIResponseBlock)block;

#pragma mark - Class Requests

+ (void)request:(APIRequest *)request withType:(ABAPIRequestType)type completion:(APIResponseBlock)block;

+ (void)GET:(APIRequest *)request completion:(APIResponseBlock)block;

+ (void)POST:(APIRequest *)request completion:(APIResponseBlock)block;

+ (void)PUT:(APIRequest *)request completion:(APIResponseBlock)block;

+ (void)DELETE:(APIRequest *)request completion:(APIResponseBlock)block;

@end
