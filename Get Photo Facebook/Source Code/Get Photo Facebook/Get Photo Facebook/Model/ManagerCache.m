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

#define numberLimitElemetnCached 1000
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
        [_cache setCountLimit:numberLimitElemetnCached];
    }
    return self;
}

- (void)cacheImage:(NSData*)imageData forKey:(NSString*)key {
    //code wrong location
    [_cache setObject:imageData forKey:key];
    [fileManager storeImageFileToMemory:key ImagaData:imageData];
}

- (NSData*)getCachedImageForKey:(NSString*)key {// recheck ojectforkey
    NSData *data = [_cache objectForKey:key];
    if (data) {
        return data ;
    }else{
        if ([fileManager checkExistImageInMemory:key]) {
            NSData *imageData = [fileManager loadImageFileFromMemory:key];
            [_cache setObject:imageData forKey:key];
            return imageData;
        }else{
            return nil;
        }
    }
    
}
@end
