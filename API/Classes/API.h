//
//  API.h
//  Pods
//
//  Created by Andrew Boryk on 3/18/17.
//
//

#import <Foundation/Foundation.h>
#import "APICommons.h"

@interface API : NSObject

/// GET request for API
+ (void)GET:(NSString *)url header:(NSDictionary *)header parameters:(NSDictionary *)params progress:(APIProgressBlock)progressBlock completion:(APIResponseBlock)completionBlock;

/// POST request for API
+ (void)POST:(NSString *)url header:(NSDictionary *)header parameters:(NSDictionary *)params progress:(APIProgressBlock)progressBlock completion:(APIResponseBlock)completionBlock;

/// PUT request for API
+ (void)PUT:(NSString *)url header:(NSDictionary *)header parameters:(NSDictionary *)params completion:(APIResponseBlock)completionBlock;

/// DEL request for API
+ (void)DEL:(NSString *)url header:(NSDictionary *)header parameters:(NSDictionary *)params completion:(APIResponseBlock)completionBlock;

/// Default base specified in the Info.plist under API-Defaults -> Base
+ (NSString *)base;

/// Default version for the requests, specified in the Info.plist under API-Defaults -> Version
+ (NSString *)version;

/// Default apiKey for the requests, specified in the Info.plist under API-Defaults -> APIKey
+ (NSString *)apiKey;

@end
