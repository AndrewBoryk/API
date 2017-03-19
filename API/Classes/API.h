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
+ (void)GET:(NSString *)url header:(NSDictionary *)header parameters:(NSDictionary *)params completion:(APIResponseBlock)block;

/// POST request for API
+ (void)POST:(NSString *)url header:(NSDictionary *)header parameters:(NSDictionary *)params completion:(APIResponseBlock)block;

/// PUT request for API
+ (void)PUT:(NSString *)url header:(NSDictionary *)header parameters:(NSDictionary *)params completion:(APIResponseBlock)block;

/// DEL request for API
+ (void)DEL:(NSString *)url header:(NSDictionary *)header parameters:(NSDictionary *)params completion:(APIResponseBlock)block;

@end
