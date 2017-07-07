//
//  RequestDataFB.m
//  Get Photo Facebook
//
//  Created by KterKC on 6/29/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "RequestDataFB.h"
#define fieldsParameters @"fields"
#define addString @"/%@"
#define getRequest @"GET"
#define failGetTokenDevice @"failToken"
@implementation RequestDataFB


-(void)requestInformation:(NSString *)nameGraphPath NameField:(NSString *) nameFields success:(void (^)(id data))success  failure:(void(^)(NSError* error))failure{
    if ([FBSDKAccessToken currentAccessToken]) {
        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                      initWithGraphPath: [NSString stringWithFormat:addString, nameGraphPath]
                                      parameters:@{ fieldsParameters: nameFields,}
                                      HTTPMethod: getRequest];
        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            if(!error){
                success(result);
            }
            else{
                failure(error);
            }
        }];
    }else{
        NSError *errorToken= [[NSError alloc] initWithDomain:failGetTokenDevice code:110 userInfo:nil];
        
        failure(errorToken);
    }
}
@end
