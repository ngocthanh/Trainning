	//
//  Service.m
//  Get Photo Facebook
//
//  Created by dankhanh on 6/30/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "Service.h"
@implementation Service

-(void)privateInformationOfUser :(void (^)(UserFacebook *user))successCurrentAccount failure:(void(^)(NSError* error))failure{
    RequestDataFB* request = [RequestDataFB alloc];
    [request requestInformation:@"id,name,birthday,hometown,picture" success:^(id data) {
        UserFacebook *information=[[UserFacebook alloc]init];
        information.userName = [data objectForKey:@"name"];
        information.userBirthday=[data objectForKey:@"birthday"];
        information.userHometown=[[data objectForKey:@"hometown"] objectForKey:@"name"];
        information.userUrlPicture=[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",[data objectForKey:@"id"]];
        successCurrentAccount(information);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)friendListSuccess :(void (^)(NSArray* arrayListFriends))successFriend failure:(void(^)(NSError* error))failure{
    RequestDataFB* request = [RequestDataFB alloc];
    [request requestInformation:@"friends" success:^(id data) {
    NSArray * allKeys = [[data valueForKey:@"friends"]objectForKey:@"data"];
    NSMutableArray *arrayFriends = [[NSMutableArray alloc] init];
    
    for (NSDictionary *friend in allKeys) {
        UserFacebook *userFriend = [[UserFacebook alloc] init];
        NSString *idFriend = [friend valueForKey:@"id"];
        userFriend.userName = [friend valueForKey:@"name"];
        userFriend.userUrlPicture = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=large",idFriend];
        [arrayFriends addObject:userFriend];
    }
    successFriend([arrayFriends copy]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)PhotoOfUser :(void (^)(NSArray* arrayPhotos))successPhoto failure:(void(^)(NSError* error))failure{
    RequestDataFB* request=[RequestDataFB new];
    [request requestInformation:@"photos{id,link}" success:^(id data) {
        NSArray *allKeys =[[data objectForKey:@"photos"] objectForKey:@"data"];
        NSMutableArray *arrayPhotos=[[NSMutableArray alloc] init];
        for(NSDictionary *photo in allKeys){
            PhotoOfUser *photoOfUser=[PhotoOfUser new] ;
            photoOfUser.idPhoto=[photo valueForKey:@"id"];
            photoOfUser.linkPhoto=[photo valueForKey:@"link"];
            [arrayPhotos addObject:photoOfUser];
        }
    successPhoto(arrayPhotos);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
@end
