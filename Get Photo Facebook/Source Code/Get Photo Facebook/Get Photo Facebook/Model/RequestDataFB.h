//
//  RequestDataFB.h
//  Get Photo Facebook
//
//  Created by KterKC on 6/29/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserFacebook.h"
@interface RequestDataFB : NSObject
@property (strong,nonatomic) UserFacebook* userFacebook;
-(void) getInformationOfUserSuccessAccount:(void (^)(UserFacebook *user))successCurrentAccount successFriend:(void (^)(NSMutableArray *arrayFriend))successFriend failure:(void(^)(NSError* error))failure;
-(void) getInformationOfUserSuccessAccount;
@property (strong,nonatomic) NSMutableArray *arrayFriends;
@end
