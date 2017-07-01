//
//  Service.h
//  Get Photo Facebook
//
//  Created by dankhanh on 6/30/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserFacebook.h"
@class UserFacebook;
@interface Service : NSObject
-(void)privateInformationOfUser :(void (^)(UserFacebook *user))successCurrentAccount failure:(void(^)(NSError* error))failure;
-(void)friendListSuccess :(void (^)(NSArray* arrayListFriends))successFriend failure:(void(^)(NSError* error))failure;
-(void)PhotoOfUser :(void (^)(UserFacebook *user))successPhoto failure:(void(^)(NSError* error))failure;
@end
