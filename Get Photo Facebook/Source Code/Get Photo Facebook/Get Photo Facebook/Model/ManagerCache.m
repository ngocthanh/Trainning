//
//  ManagerCache.m
//  Get Photo Facebook
//
//  Created by dankhanh on 7/4/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "ManagerCache.h"
#import "FileManager.h"
#import "NetwokingService.h"
static ManagerCache *sharedInstance;
static FileManager *fileManager;
static NetwokingService *networkService;
@implementation ManagerCache

+(ManagerCache*)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ManagerCache alloc] init];
        
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.cache = [[NSCache alloc] init];
        fileManager = [[FileManager alloc] init];
        networkService = [NetwokingService new];
    }
    return self;
}

- (void)cacheImage:(NSData*)imageData forKey:(NSString*)key {
    [_cache setCountLimit:25];
    [_cache setObject:imageData forKey:key];
    [fileManager storeImageFileToMemory:[fileManager setUpNameForImageAsThumb:key] ImagaData:imageData];
}

- (NSData*)getCachedImageForKey:(NSString*)key {
    if ([_cache objectForKey:key]) {
        return [_cache objectForKey:key] ;
    }else{
        if ([fileManager checkExistImageInMemory:key]) {
            return [fileManager loadImageFileFromMemory:key];
        }else{
            return nil;
        }
    }
    
}
@end
