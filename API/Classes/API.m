//
//  API.m
//  Pods
//
//  Created by Andrew Boryk on 3/18/17.
//
//

#import "API.h"
#import <AFNetworking/AFNetworking.h>

@implementation API

+ (void)GET:(NSString *)url header:(NSDictionary *)header parameters:(NSDictionary *)params progress:(APIProgressBlock)progressBlock completion:(APIResponseBlock)completionBlock {
    
    if ([APICommons isValidPath:url]) {
        AFHTTPSessionManager *manager = [API requestManagerWithHeader:header];
        
        [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            if (progressBlock) progressBlock(downloadProgress.fractionCompleted);
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            APIResponseObject *response = [[APIResponseObject alloc] initWithSuccessTask:task responseObject:responseObject];
            
            if(completionBlock) completionBlock(response, nil);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            APIResponseObject *response = [[APIResponseObject alloc] initWithFailureTask:task error:error];
            
            if(completionBlock) completionBlock(response, error);
            
        }];
    }
    
}

+ (void)POST:(NSString *)url header:(NSDictionary *)header parameters:(NSDictionary *)params progress:(APIProgressBlock)progressBlock completion:(APIResponseBlock)completionBlock {
    
    if ([APICommons isValidPath:url]) {
        AFHTTPSessionManager *manager = [API requestManagerWithHeader:header];
        
        [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            if (progressBlock) progressBlock(uploadProgress.fractionCompleted);
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            APIResponseObject *response = [[APIResponseObject alloc] initWithSuccessTask:task responseObject:responseObject];
            
            if(completionBlock) completionBlock(response, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            APIResponseObject *response = [[APIResponseObject alloc] initWithFailureTask:task error:error];
            
            if(completionBlock) completionBlock(response, error);
        }];
    }
    
}

+ (void)PUT:(NSString *)url header:(NSDictionary *)header parameters:(NSDictionary *)params completion:(APIResponseBlock)completionBlock {
    
    if ([APICommons isValidPath:url]) {
        AFHTTPSessionManager *manager = [API requestManagerWithHeader:header];
        
        [manager PUT:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            APIResponseObject *response = [[APIResponseObject alloc] initWithSuccessTask:task responseObject:responseObject];
            
            if(completionBlock) completionBlock(response, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            APIResponseObject *response = [[APIResponseObject alloc] initWithFailureTask:task error:error];
            
            if(completionBlock) completionBlock(response, error);
        }];
    }
    
}

+ (void)DEL:(NSString *)url header:(NSDictionary *)header parameters:(NSDictionary *)params completion:(APIResponseBlock)completionBlock {
    
    if ([APICommons isValidPath:url]) {
        AFHTTPSessionManager *manager = [API requestManagerWithHeader:header];
        
        [manager DELETE:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            APIResponseObject *response = [[APIResponseObject alloc] initWithSuccessTask:task responseObject:responseObject];
            
            if(completionBlock) completionBlock(response, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            APIResponseObject *response = [[APIResponseObject alloc] initWithFailureTask:task error:error];
            
            if(completionBlock) completionBlock(response, error);
        }];
    }
    
}

+ (AFHTTPSessionManager *)requestManagerWithHeader:(NSDictionary *)header {
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    policy.allowInvalidCertificates = YES;
    [policy setValidatesDomainName:NO];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = policy;
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSString *userAgent = [manager.requestSerializer valueForHTTPHeaderField:@"User-Agent"];
    NSString *strApplicationUUID = [API userAgent];
    
    if ([APICommons notNull:strApplicationUUID]) {
        userAgent = strApplicationUUID;
    }
    
    [manager.requestSerializer setValue:userAgent forHTTPHeaderField:@"User-Agent"];
    
    //    NSMutableIndexSet *acceptedCodes = [[NSMutableIndexSet alloc]
    //                                        initWithIndexSet:manager.responseSerializer.acceptableStatusCodes];
    //    [acceptedCodes addIndex:404];
    //    [acceptedCodes addIndex:409];
    //
    //    manager.responseSerializer.acceptableStatusCodes = [acceptedCodes copy];
    
    if ([APICommons notNull:header]) {
        for(id key in header) {
            if ([APICommons notNull:[header objectForKey:key]]) {
                [manager.requestSerializer setValue:[header objectForKey:key] forHTTPHeaderField:key];
            }
        }
    }
    
    
    return manager;
}

+ (NSString *)userAgent {
    return nil;
}

+ (NSDictionary *)defaults {
    NSString *path = [[NSBundle mainBundle] pathForResource: @"Info" ofType: @"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile: path];
    if ([APICommons notNull:[dict objectForKey: @"API-Defaults"]] && [[dict objectForKey: @"API-Defaults"] isKindOfClass:[NSDictionary class]]) {
        NSDictionary *defaults = [dict objectForKey: @"API-Defaults"];
        
        return defaults;
    }
    
    return [[NSDictionary alloc] init];
}

+ (NSString *)base {
    
    if ([APICommons notNull:[[API defaults] objectForKey:@"Base"]]) {
        NSString *base = [[API defaults] objectForKey:@"Base"];
        return base;
    }
    
    return @"";
    
}

+ (NSString *)version {
    if ([APICommons notNull:[[API defaults] objectForKey:@"Version"]]) {
        NSString *version = [[API defaults] objectForKey:@"Version"];
        return version;
    }
    
    return @"";
}

+ (NSString *)apiKey {
    if ([APICommons notNull:[[API defaults] objectForKey:@"APIKey"]]) {
        NSString *apiKey = [[API defaults] objectForKey:@"APIKey"];
        return apiKey;
    }
    
    return @"";
}

@end
