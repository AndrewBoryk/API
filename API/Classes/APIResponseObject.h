//
//  APIResponseObject.h
//  Pods
//
//  Created by Andrew Boryk on 3/18/17.
//
//

#import <Foundation/Foundation.h>

@interface APIResponseObject : NSObject

/// Status code received from the HTTP Request
@property (nonatomic) NSInteger statusCode;

/// Data received from successful request
@property (strong, nonatomic) id successData;

/// Task received from successful request
@property (strong, nonatomic) NSURLSessionDataTask *successTask;

/// Error received from failed request
@property (strong, nonatomic) NSError *failureError;

/// Operation received from failed request
@property (strong, nonatomic) NSURLSessionDataTask *failureTask;

/// Description string for the success part of the response object
@property (strong, nonatomic, readonly) NSString *successDescription;

/// Description string for the failure part of the response object
@property (strong, nonatomic, readonly) NSString *failureDescription;

/// Initializes a ABResponseObject using the success task and the success data response
- (instancetype)initWithSuccessTask:(NSURLSessionDataTask *)task responseObject:(id)responseObject;

/// Initializes an ABResponseObject using the failure task and the error
- (instancetype)initWithFailureTask:(NSURLSessionDataTask *)task error:(NSError *)error;

/// Print the description string for the success part of the response object
- (void)printSuccessDescription;

/// Print the description string for the failure part of the response object
- (void)printFailureDescription;

/// Print the description string for the response
- (void)printDescription;

@end
