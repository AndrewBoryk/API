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

+ (void)get:(NSString *)path header:(NSDictionary *)header parameters:(NSDictionary *)params progress:(APIProgressBlock)progressBlock completion:(APIResponseBlock)completionBlock {
    
    if ([APICommons isValidPath:path]) {
        AFHTTPSessionManager *manager = [API requestManagerWithHeader:header];
        
        [manager GET:path parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
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

+ (void)post:(NSString *)path header:(NSDictionary *)header parameters:(NSDictionary *)params progress:(APIProgressBlock)progressBlock completion:(APIResponseBlock)completionBlock {
    
    if ([APICommons isValidPath:path]) {
        AFHTTPSessionManager *manager = [API requestManagerWithHeader:header];
        
        [manager POST:path parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
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

+ (void)put:(NSString *)path header:(NSDictionary *)header parameters:(NSDictionary *)params completion:(APIResponseBlock)completionBlock {
    
    if ([APICommons isValidPath:path]) {
        AFHTTPSessionManager *manager = [API requestManagerWithHeader:header];
        
        [manager PUT:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            APIResponseObject *response = [[APIResponseObject alloc] initWithSuccessTask:task responseObject:responseObject];
            
            if(completionBlock) completionBlock(response, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            APIResponseObject *response = [[APIResponseObject alloc] initWithFailureTask:task error:error];
            
            if(completionBlock) completionBlock(response, error);
        }];
    }
    
}

+ (void)del:(NSString *)path header:(NSDictionary *)header parameters:(NSDictionary *)params completion:(APIResponseBlock)completionBlock {
    
    if ([APICommons isValidPath:path]) {
        AFHTTPSessionManager *manager = [API requestManagerWithHeader:header];
        
        [manager DELETE:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
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

@end
