# API

[![CI Status](http://img.shields.io/travis/andrewboryk/API.svg?style=flat)](https://travis-ci.org/andrewboryk/API)
[![Version](https://img.shields.io/cocoapods/v/API.svg?style=flat)](http://cocoapods.org/pods/API)
[![License](https://img.shields.io/cocoapods/l/API.svg?style=flat)](http://cocoapods.org/pods/API)
[![Platform](https://img.shields.io/cocoapods/p/API.svg?style=flat)](http://cocoapods.org/pods/API)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

This library is dependant on the pod 'AFNetworking'. In addition:

* Requires Automatic Reference Counting (ARC)
* Requires iOS 8.0 or higher

## Installation

API is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "API"
```

## Usage

There are two ways that API can be used. You can either call the API class methods for making GET, POST, PUT, and DEL requests; or you can create an instance of APIRequest and make the GET, POST, PUT, and DELETE requests through that instance. Both versions will return an instance of APIResponseObject, which has properties for the HTTPStatusCode, Success Data, Success and Failure Tasks, as well as the NSError returned by the AFNetworking request.

### API Class Usage

To make an API request using the class methods, one can call the GET, POST, PUT, or DEL methods of the class, and pass in the URL to make a request to, as well as the header and any parameters. This request has a completion block with an APIResponseObject as well as an NSError if there is one. Progress blocks are available for POST and GET requests.

```objective-c

// GET request for API
+ (void)GET:(NSString *)url header:(NSDictionary *)header parameters:(NSDictionary *)params progress:(APIProgressBlock)progressBlock completion:(APIResponseBlock)completionBlock;

// POST request for API
+ (void)POST:(NSString *)url header:(NSDictionary *)header parameters:(NSDictionary *)params progress:(APIProgressBlock)progressBlock completion:(APIResponseBlock)completionBlock;

// PUT request for API
+ (void)PUT:(NSString *)url header:(NSDictionary *)header parameters:(NSDictionary *)params completion:(APIResponseBlock)completionBlock;

// DEL request for API
+ (void)DEL:(NSString *)url header:(NSDictionary *)header parameters:(NSDictionary *)params completion:(APIResponseBlock)completionBlock;

```

### APIRequest Instance Usage

As an alternative, one can make API requests using an instance of the APIRequest object. This object can be initialized with a full URL, or with each piece of the URL (which includes base, version, apiKey, and relativeString at this time). As well, you can pass in the header and parameters during initialization. There are plenty of options available for mix-and-matching these pieces.

```objective-c

// Initialize an APIRequest with a url, params, and header
- (instancetype)initWithURL:(NSString *)url params:(NSDictionary *)params header:(NSDictionary *)header;

// Initialize an APIRequest with a base and relativePath, along with: version, apiKey, params, header
- (instancetype)initWithBase:(NSString *)base version:(NSString *)version apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath params:(NSDictionary *)params header:(NSDictionary *)header;

```

After creating the APIRequest instance, one can make the API request by calling the GET, POST, PUT and DELETE methods on the instance, or by passing the APIRequest into the GET, POST, PUT and DELETE class methods. Both methods are avaiable to accomodate one's preference. Progress is also available for GET and POST requests

```objective-c

#pragma mark - Instance Methods

// Make an APIRequest with specified type
- (void)request:(ABAPIRequestType)type completion:(APIResponseBlock)completionBlock;

// Make a GET APIRequest
- (void)GET:(APIResponseBlock)completionBlock;

// Make a POST APIRequest
- (void)POST:(APIResponseBlock)completionBlock;

// Make a PUT APIRequest
- (void)PUT:(APIResponseBlock)completionBlock;

// Make a DELETE APIRequest
- (void)DELETE:(APIResponseBlock)completionBlock;

// Make a GET APIRequest with progress block
- (void)GET:(APIResponseBlock)completionBlock withProgress:(APIProgressBlock)progressBlock;

// Make a GET APIRequest with progress block
- (void)POST:(APIResponseBlock)completionBlock withProgress:(APIProgressBlock)progressBlock;

#pragma mark - Class Methods

// Make a request using the given APIRequest with the specified type
+ (void)request:(APIRequest *)request withType:(ABAPIRequestType)type completion:(APIResponseBlock)completionBlock;

// Make a GET request using the given APIRequest
+ (void)GET:(APIRequest *)request completion:(APIResponseBlock)completionBlock;

// Make a POST request using the given APIRequest
+ (void)POST:(APIRequest *)request completion:(APIResponseBlock)completionBlock;

// Make a PUT request using the given APIRequest
+ (void)PUT:(APIRequest *)request completion:(APIResponseBlock)completionBlock;

// Make a DELETE request using the given APIRequest
+ (void)DELETE:(APIRequest *)request completion:(APIResponseBlock)completionBlock;

// Make a GET request using the given APIRequest with a progress block
+ (void)GET:(APIRequest *)request completion:(APIResponseBlock)completionBlock withProgress:(APIProgressBlock)progressBlock;

// Make a POST request using the given APIRequest with a progress block
+ (void)POST:(APIRequest *)request completion:(APIResponseBlock)completionBlock withProgress:(APIProgressBlock)progressBlock;

```

### Customizing AFHTTPSessionManager and AFSecurityPolicy

AFHTTPSessionManager and AFSecurityPolicy have been set up with default settings. If you'd like to customize these settings to your preference, this can be done by adjusting the settings for the manager and policy in the 'requestManagerWithHeader:' method inside the 'API.m' file.

## Author

andrewboryk, andrewcboryk@gmail.com

## License

API is available under the MIT license. See the LICENSE file for more info.
