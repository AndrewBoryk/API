//
//  APIRequest.m
//  Pods
//
//  Created by Andrew Boryk on 3/18/17.
//
//

#import "APIRequest.h"
#import "API.h"

@implementation APIRequest

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.params = [[NSMutableDictionary alloc] init];
        self.header = [[NSDictionary alloc] init];
        self.url = @"";
        self.base = nil;
        self.apiKey = nil;
        self.version = nil;
        self.relativePath = nil;
    }
    
    return self;
}

- (instancetype)initWithURL:(NSString *)url {
    self = [self initWithURL:url params:nil header:nil];
    
    return self;
}

- (instancetype)initWithURL:(NSString *)url params:(NSDictionary *)params {
    self = [self initWithURL:url params:params header:nil];
    
    return self;
}

- (instancetype)initWithURL:(NSString *)url header:(NSDictionary *)header {
    self = [self initWithURL:url params:nil header:header];
    
    return self;
}

- (instancetype)initWithURL:(NSString *)url params:(NSDictionary *)params header:(NSDictionary *)header {
    self = [self init];
    
    if (self) {
        
        if ([APICommons notNull:url]) {
            self.url = url;
        }
        
        if ([APICommons notNull:params]) {
            self.params = params;
        }
        
        if ([APICommons notNull:header]) {
            self.header = header;
        }
    }
    
    return self;
}

- (void)request:(ABAPIRequestType)type completion:(APIResponseBlock)block {
    [APIRequest request:self withType:type completion:^(APIResponseObject *response, NSError *error) {
        if (block) block(response, error);
    }];
}

- (void)GET:(APIResponseBlock)block {
    [self request:GET completion:^(APIResponseObject *response, NSError *error) {
        if (block) block(response, error);
    }];
}

- (void)POST:(APIResponseBlock)block {
    [self request:POST completion:^(APIResponseObject *response, NSError *error) {
        if (block) block(response, error);
    }];
}

- (void)PUT:(APIResponseBlock)block {
    [self request:PUT completion:^(APIResponseObject *response, NSError *error) {
        if (block) block(response, error);
    }];
}

- (void)DELETE:(APIResponseBlock)block {
    [self request:DELETE completion:^(APIResponseObject *response, NSError *error) {
        if (block) block(response, error);
    }];
}

+ (void)request:(APIRequest *)request withType:(ABAPIRequestType)type completion:(APIResponseBlock)block {
    switch (type) {
            
        case GET: {
            [APIRequest GET:request completion:block];
            break; }
            
        case POST: {
            [APIRequest POST:request completion:block];
            break; }
            
        case PUT: {
            [APIRequest PUT:request completion:block];
            break; }
            
        case DELETE: {
            [APIRequest DELETE:request completion:block];
            break; }
            
        default:
            NSLog(@"Invalid Request Type (Must be GET, POST, PUT, or DELETE)");
            break;
    }
}

+ (void)GET:(APIRequest *)request completion:(APIResponseBlock)block {
    [API get:request.url setHeader:request.header setParameter:request.params completion:block];
}

+ (void)POST:(APIRequest *)request completion:(APIResponseBlock)block {
    [API post:request.url setHeader:request.header setParameter:request.params completion:block];
}

+ (void)PUT:(APIRequest *)request completion:(APIResponseBlock)block {
    [API put:request.url setHeader:request.header setParameter:request.params completion:block];
}

+ (void)DELETE:(APIRequest *)request completion:(APIResponseBlock)block {
    [API del:request.url setHeader:request.header setParameter:request.params completion:block];
}

- (void)setParams:(NSMutableDictionary *)params {
    _params = (NSMutableDictionary *)params;
}

- (void)setUrl:(NSDictionary *)url {
    if ([APICommons notNull:url]) {
        _url = url;
    } else {
        _url = @"";
    }
}

- (void)setBase:(NSDictionary *)base {
    if ([APICommons notNull:base]) {
        _base = base;
    } else {
        _base = @"";
    }
}

@end
