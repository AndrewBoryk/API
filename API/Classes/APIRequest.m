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

#pragma mark - URL Initializers

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
            _url = url;
        }
        
        if ([APICommons notNull:params]) {
            _params = params;
        }
        
        if ([APICommons notNull:header]) {
            _header = header;
        }
    }
    
    return self;
}

#pragma mark - Base/Path Initializers

- (instancetype)initWithBase:(NSString *)base relativePath:(NSString *)relativePath {
    self = [self initWithBase:base version:nil apiKey:nil relativePath:relativePath params:nil header:nil];
    
    return self;
}

- (instancetype)initWithBase:(NSString *)base relativePath:(NSString *)relativePath params:(NSDictionary *)params {
    self = [self initWithBase:base version:nil apiKey:nil relativePath:relativePath params:params header:nil];
    
    return self;
}

- (instancetype)initWithBase:(NSString *)base relativePath:(NSString *)relativePath header:(NSDictionary *)header {
    self = [self initWithBase:base version:nil apiKey:nil relativePath:relativePath params:nil header:header];
    
    return self;
}

- (instancetype)initWithBase:(NSString *)base relativePath:(NSString *)relativePath params:(NSDictionary *)params header:(NSDictionary *)header {
    self = [self initWithBase:base version:nil apiKey:nil relativePath:relativePath params:params header:header];
    
    return self;
}

#pragma mark - Base/Version/Path Initializers

- (instancetype)initWithBase:(NSString *)base version:(NSString *)version relativePath:(NSString *)relativePath {
    self = [self initWithBase:base version:version apiKey:nil relativePath:relativePath params:nil header:nil];
    
    return self;
}

- (instancetype)initWithBase:(NSString *)base version:(NSString *)version relativePath:(NSString *)relativePath params:(NSDictionary *)params {
    self = [self initWithBase:base version:version apiKey:nil relativePath:relativePath params:params header:nil];
    
    return self;
}

- (instancetype)initWithBase:(NSString *)base version:(NSString *)version relativePath:(NSString *)relativePath header:(NSDictionary *)header {
    self = [self initWithBase:base version:version apiKey:nil relativePath:relativePath params:nil header:header];
    
    return self;
}

- (instancetype)initWithBase:(NSString *)base version:(NSString *)version relativePath:(NSString *)relativePath params:(NSDictionary *)params header:(NSDictionary *)header {
    self = [self initWithBase:base version:version apiKey:nil relativePath:relativePath params:params header:header];
    
    return self;
}

#pragma mark - Base/API/Path Initializers

- (instancetype)initWithBase:(NSString *)base apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath {
    self = [self initWithBase:base version:nil apiKey:apiKey relativePath:relativePath params:nil header:nil];
    
    return self;
}

- (instancetype)initWithBase:(NSString *)base apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath params:(NSDictionary *)params {
    self = [self initWithBase:base version:nil apiKey:apiKey relativePath:relativePath params:params header:nil];
    
    return self;
}

- (instancetype)initWithBase:(NSString *)base apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath header:(NSDictionary *)header {
    self = [self initWithBase:base version:nil apiKey:apiKey relativePath:relativePath params:nil header:header];
    
    return self;
}

- (instancetype)initWithBase:(NSString *)base apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath params:(NSDictionary *)params header:(NSDictionary *)header {
    self = [self initWithBase:base version:nil apiKey:apiKey relativePath:relativePath params:params header:header];
    
    return self;
}

#pragma mark - Base/Version/API/Path Initializers

- (instancetype)initWithBase:(NSString *)base version:(NSString *)version apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath {
    self = [self initWithBase:base version:nil apiKey:apiKey relativePath:relativePath params:nil header:nil];
    
    return self;
}

- (instancetype)initWithBase:(NSString *)base version:(NSString *)version apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath params:(NSDictionary *)params {
    self = [self initWithBase:base version:nil apiKey:apiKey relativePath:relativePath params:params header:nil];
    
    return self;
}

- (instancetype)initWithBase:(NSString *)base version:(NSString *)version apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath header:(NSDictionary *)header {
    self = [self initWithBase:base version:nil apiKey:apiKey relativePath:relativePath params:nil header:header];
    
    return self;
}

- (instancetype)initWithBase:(NSString *)base version:(NSString *)version apiKey:(NSString *)apiKey relativePath:(NSString *)relativePath params:(NSDictionary *)params header:(NSDictionary *)header {
    self = [self init];
    
    if (self) {
        _base = base;
        _apiKey = apiKey;
        _version = version;
        _relativePath = relativePath;
        _params = params;
        _header = header;
    }
    
    return self;
}

#pragma mark - Instance Requests

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

- (void)GET:(APIResponseBlock)completionBlock withProgress:(APIProgressBlock)progressBlock {
    [APIRequest GET:self completion:completionBlock withProgress:progressBlock];
}

- (void)POST:(APIResponseBlock)completionBlock withProgress:(APIProgressBlock)progressBlock {
    [APIRequest POST:self completion:completionBlock withProgress:progressBlock];
}

#pragma mark - Class Requests

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

+ (void)GET:(APIRequest *)request completion:(APIResponseBlock)completionBlock {
    [API GET:request.urlString header:request.header parameters:request.params progress:nil completion:completionBlock];
}

+ (void)POST:(APIRequest *)request completion:(APIResponseBlock)completionBlock {
    [API POST:request.urlString header:request.header parameters:request.params progress:nil completion:completionBlock];
}

+ (void)PUT:(APIRequest *)request completion:(APIResponseBlock)completionBlock {
    [API PUT:request.urlString header:request.header parameters:request.params completion:completionBlock];
}

+ (void)DELETE:(APIRequest *)request completion:(APIResponseBlock)completionBlock {
    [API DEL:request.urlString header:request.header parameters:request.params completion:completionBlock];
}

+ (void)GET:(APIRequest *)request completion:(APIResponseBlock)completionBlock withProgress:(APIProgressBlock)progressBlock {
    [API GET:request.urlString header:request.header parameters:request.params progress:progressBlock completion:completionBlock];
}

+ (void)POST:(APIRequest *)request completion:(APIResponseBlock)completionBlock withProgress:(APIProgressBlock)progressBlock {
    [API POST:request.urlString header:request.header parameters:request.params progress:progressBlock completion:completionBlock];
}

#pragma mark - Accessors

- (void)setParams:(NSMutableDictionary *)params {
    _params = (NSMutableDictionary *)params;
}

- (void)setUrl:(NSString *)url {
    if ([APICommons notNull:url]) {
        _url = url;
    } else {
        _url = @"";
    }
}

- (void)setBase:(NSString *)base {
    if ([APICommons notNull:base]) {
        _base = base;
    } else {
        _base = @"";
    }
}

- (NSString *)urlString {
    if ([APICommons isValidPath:self.url]) {
        return self.url;
        
    } else if ([APICommons isValidPath:self.base]) {
        NSString *url = self.base;
        
        if ([APICommons isValidPath:self.version]) {
            NSString *urlEnding = [url substringFromIndex:url.length - 1];
            NSString *versionFront = [self.version substringWithRange:NSMakeRange(0, 1)];
            
            url = [NSString stringWithFormat:@"%@%@", url, self.version];
            
            if (!([urlEnding isEqualToString:@"/"] || [versionFront isEqualToString:@"/"])) {
                NSLog(@"No connecting '/' before version, results in: %@", url);
            }
        }
        
        if ([APICommons isValidPath:self.apiKey]) {
            NSString *urlEnding = [url substringFromIndex:url.length - 1];
            NSString *apiFront = [self.apiKey substringWithRange:NSMakeRange(0, 1)];
            
            url = [NSString stringWithFormat:@"%@%@", url, self.apiKey];
            
            if (!([urlEnding isEqualToString:@"/"] || [apiFront isEqualToString:@"/"])) {
                NSLog(@"No connecting '/' before api, results in: %@", url);
            }
        }
        
        if ([APICommons isValidPath:self.relativePath]) {
            NSString *urlEnding = [url substringFromIndex:url.length - 1];
            NSString *relativeFront = [self.relativePath substringWithRange:NSMakeRange(0, 1)];
            
            url = [NSString stringWithFormat:@"%@%@", url, self.relativePath];
            
            if (!([urlEnding isEqualToString:@"/"] || [relativeFront isEqualToString:@"/"])) {
                NSLog(@"No connecting '/' before relativeString, results in: %@", url);
            }
        }
        
        return url;
        
    } else {
        return @"";
    }
}

@end
