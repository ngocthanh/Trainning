//
//  NetwokingService.m
//  Get Photo Facebook
//
//  Created by KterKC on 7/5/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "NetwokingService.h"
#import "ConstantsSystem.h"
static NetwokingService *sharedInstance;
@implementation NetwokingService
+(NetwokingService*)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        
    });
    return sharedInstance;
}
-(void)getImageOnline:(NSString*) linkURL Success:(void(^)(NSData* dataImage))success Failure:(void (^)(NSError* error))failure{
    if (![linkURL   isEqual: textIsEmpty]) {
        NSURL *url = [NSURL URLWithString:linkURL];
        NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (data) {
                success(data);
            }else{
                failure(error);
            }
        }];
        [task resume];
    }
    else{
        NSError * error;
        failure(error);
    }
}
@end
