#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "API.h"
#import "APICommons.h"
#import "APIRequest.h"
#import "APIResponseObject.h"

FOUNDATION_EXPORT double APIVersionNumber;
FOUNDATION_EXPORT const unsigned char APIVersionString[];

