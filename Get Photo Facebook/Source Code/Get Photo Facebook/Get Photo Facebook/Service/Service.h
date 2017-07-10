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
-(void)photoOfUser :(void (^)(NSArray *arrayPhotos))successPhoto failure:(void(^)(NSError* error))failure;
-(void)getUrlOfPhoto:(void (^)(NSArray *arraySourcePhotoWithLargestSize))successUrlSource failure:(void (^)(NSError *error))failure;

-(void)linkForNextPhotoPage :(void (^)(NSString *linkNextPage))successPhoto failure:(void(^)(NSError* error))failure;
@end
