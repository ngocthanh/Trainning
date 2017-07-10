//
//  Service.h
//  Get Photo Facebook
//
//  Created by dankhanh on 6/30/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "RequestDataFB.h"

@interface Service : NSObject
-(void)privateInformationOfUser :(void (^)(UserFacebook *user))successCurrentAccount failure:(void(^)(NSError* error))failure;
-(void)friendListSuccess :(void (^)(NSArray* arrayListFriends))successFriend failure:(void(^)(NSError* error))failure;
-(void)getCodeNextPage :(void (^)(NSString *linkNextPage))successPhoto failure:(void(^)(NSError* error))failure;
-(void)getUrlOfPhotoWithLinkAfter:(NSString * _Nullable)linkAfter Success:(void (^)(NSArray *arraySourcePhotoWithLargestSize))successUrlSource failure:(void (^)(NSError * error))failure;
-(void)loadMoreURLWithLinkAfter:(NSString * _Nullable)linkAfter Success:(void (^)(NSArray *arraySourcePhotoWithLargestSize))successUrlSource Failure:(void (^)(NSError * error))failure;


@end
