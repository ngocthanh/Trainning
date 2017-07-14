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
    //performent not good --> return data on 2 thread  ---- Had Fix
    NSData *dataOfImage =[[ManagerCache sharedInstance] getCachedImageForKey:key];
    if (dataOfImage) {//---1
        success(dataOfImage);
    }else{
        [[NetwokingService sharedInstance] getImageOnline:linkURL Success:^(NSData *dataImage) {
            //---2
            [[ManagerCache sharedInstance] cacheImage:dataImage forKey:key];
            NSData *data = [[ManagerCache sharedInstance ] getCachedImageForKey:key];
            if(data){
                dispatch_async(dispatch_get_main_queue(), ^{
                    success(data);
                });
            }
        } Failure:^(NSError *error) {
            failure(error);
        }];
        
    }
}
@end

