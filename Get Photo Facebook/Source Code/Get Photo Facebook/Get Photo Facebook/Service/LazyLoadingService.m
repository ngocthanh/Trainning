//
//  LazyLoadingService.m
//  Get Photo Facebook
//
//  Created by KterKC on 7/5/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "LazyLoadingService.h"

#import "ManagerCache.h"
#import "NetwokingService.h"
@implementation LazyLoadingService
-(void)imageDataWithIDImage:(NSString*)key LinkURL:(NSString *) linkURL Success:(void(^)(NSData* dataImage))success Failure:(void (^)(NSError* error))failure{
    NSData *dataImage =[[ManagerCache sharedInstance] getCachedImageForKey:key];
    if (dataImage) {
        success(dataImage);
    }else{
        [[NetwokingService sharedInstance] getImageOnline:linkURL Success:^(NSData *dataImage) {
            [[ManagerCache sharedInstance] cacheImage:dataImage forKey:key];
            NSData *dataForImage = [[ManagerCache sharedInstance] getCachedImageForKey:key];
            success(dataForImage);
        } Failure:^(NSError *error) {
            failure(error);
        }];
    }
    
}
@end
