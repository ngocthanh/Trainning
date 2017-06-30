//
//  RequestDataFB.m
//  Get Photo Facebook
//
//  Created by KterKC on 6/29/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "RequestDataFB.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "ConstantsSystem.h"
#import "UserFacebook.h"
@implementation RequestDataFB


-(void)requestInformation: (NSString *) nameFields success:(void (^)(id data))success  failure:(void(^)(NSError* error))failure{
    if ([FBSDKAccessToken currentAccessToken]) {
        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                      initWithGraphPath:@"/me"
                                      parameters:@{ @"fields": nameFields,}
                                      HTTPMethod:@"GET"];
        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            if(!error){
                success(result);
            }
            else{
                failure(error);
            }
        }];
    }else{
        NSError *errorToken= [[NSError alloc] initWithDomain:@"failToken" code:110 userInfo:nil];
        
        failure(errorToken);
    }
}


@end
