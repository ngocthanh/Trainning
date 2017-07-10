//
//  RequestDataFB.h
//  Get Photo Facebook
//
//  Created by KterKC on 6/29/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "ConstantsSystem.h"
#import "UserFacebook.h"
#import "FriendOfUser.h"
#import "PhotoOfUser.h"
@interface RequestDataFB : NSObject

-(void)requestInformationForLoadMore:(NSString *)nameGraphPath NameField:(NSString *) nameFields NameField1:(NSString * ) nameFields1 success:(void (^)(id data))success  failure:(void(^)(NSError* error))failure;
-(void)requestInformation:(NSString *)nameGraphPath NameField:(NSString *) nameFields success:(void (^)(id data))success  failure:(void(^)(NSError* error))failure;

@end
