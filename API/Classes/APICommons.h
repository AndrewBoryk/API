//
//  APICommons.h
//  Pods
//
//  Created by Andrew Boryk on 3/18/17.
//
//

#import <Foundation/Foundation.h>
#import "APIResponseObject.h"

typedef void (^APIProgressBlock)(double fractionCompleted);
typedef void (^APIResponseBlock)(APIResponseObject *response, NSError *error);

@interface APICommons : NSObject

/// Returns true if the object is not null or nil, otherwise returns false
+ (BOOL)notNull:(id)object;

/// Returns true if the object is null or nil, otherwise returns false

+ (BOOL)isNull:(id)object;

/// Returns true if the object is not nil, returns true if the object is null
+ (BOOL)notNil:(id)object;

/// Returns true if the object is nil, returns false if the object is null
+ (BOOL)isNil:(id)object;

/// Returns true if the object is not just spaces or blank, otherwise returns false
+ (BOOL)notBlank: (NSString *) text;

/// Returns true if the path is not null, nil, or blank
+ (BOOL)isValidPath:(NSString *)path;

@end
