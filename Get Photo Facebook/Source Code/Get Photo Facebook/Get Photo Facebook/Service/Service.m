	//
//  Service.m
//  Get Photo Facebook
//
//  Created by dankhanh on 6/30/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "Service.h"


#define nameFieldAccountInformation @"id,name,birthday,hometown,picture"
#define nameFieldFriendInfomation @"friends"
#define nameFieldPhotoInformation @"id,link,type:uploaded"//"albums{photos{id,link}}"
#define nameFieldImages @"images"
#define folderPhotos @"me/photos"
#define folderMeForRequestFB @"me"
#define idUser @"id"
#define nameUser @"name"
#define birthdayUser @"birthday"
#define hometownUser @"hometown"
#define pictureParameterLink @"https://graph.facebook.com/%@/picture?type=large"
#define ketGetValueAlbum @"albums"
#define keyGetValuePhoto @"photos"
#define keyGetValueIdPhoto @"id"
#define keyGetValueLinkPhoto @"link"
#define nameIDOfPhotoOfUser @"idPhoto"
#define keyGetValueFriends @"friends"
#define keyGetValueData @"data"
#define keyGetValueImages @"images"
#define keyGetSourceLinkPhoto @"source"

#define parameterNotFoundDataPhoto @"Data Photo From Facebook Not Found"
@implementation Service

-(void)privateInformationOfUser :(void (^)(UserFacebook *user))successCurrentAccount failure:(void(^)(NSError* error))failure{
    RequestDataFB* request = [[RequestDataFB alloc] init];// code is not enough
    [request requestInformation:folderMeForRequestFB NameField: nameFieldAccountInformation success:^(id data) {
        UserFacebook *information=[[UserFacebook alloc] init];
        information.userName = [data objectForKey: nameUser];
        information.userBirthday = [data objectForKey:birthdayUser];
        information.userHometown = [[data objectForKey: hometownUser] objectForKey:nameUser];
        information.userUrlPicture = [NSString stringWithFormat:pictureParameterLink,[data objectForKey:idUser]];
        successCurrentAccount(information);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)friendListSuccess :(void (^)(NSArray* arrayListFriends))successFriend failure:(void(^)(NSError* error))failure{
    RequestDataFB* request = [RequestDataFB alloc];
    [request requestInformation:folderMeForRequestFB NameField:nameFieldFriendInfomation success:^(id data) {
    NSArray * friendDataFromFB = [[data valueForKey: keyGetValueFriends]objectForKey:keyGetValueData]; // wrong name value
    NSMutableArray *arrayFriends = [[NSMutableArray alloc] init];
    
    for (NSDictionary *friend in friendDataFromFB) {
        UserFacebook *userFriend = [[UserFacebook alloc] init];
        NSString *idFriend = [friend valueForKey:idUser];
        userFriend.userName = [friend valueForKey:nameUser];
        userFriend.userUrlPicture = [NSString stringWithFormat:pictureParameterLink,idFriend];
        [arrayFriends addObject:userFriend];
    }
    successFriend([arrayFriends copy]);// why use copy here
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)photoOfUser :(void (^)(NSArray* arrayPhotos))successPhoto failure:(void(^)(NSError* error))failure{
    RequestDataFB* request=[RequestDataFB new];
    [request requestInformation:folderPhotos NameField:nameFieldPhotoInformation success:^(id data) {
        NSArray *photoDataFromFB = [data objectForKey:keyGetValueData];
        //NSArray *photoDataFromFB =[[[[[data objectForKey:ketGetValueAlbum] objectForKey:keyGetValueData]objectAtIndex:0] objectForKey:keyGetValuePhoto] objectForKey:keyGetValueData];
        NSMutableArray *arrayPhotos=[[NSMutableArray alloc] init];
        
        for(NSDictionary *photo in photoDataFromFB){
            PhotoOfUser *photoOfUser=[PhotoOfUser new] ;
            photoOfUser.idPhoto=[photo valueForKey: keyGetValueIdPhoto];
            [arrayPhotos addObject:photoOfUser];
        }
    successPhoto(arrayPhotos);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
-(void)getUrlOfPhoto:(void (^)(NSArray *arraySourcePhotoWithLargestSize))successUrlSource failure:(void (^)(NSError * error))failure{
    RequestDataFB* request=[RequestDataFB new];
    [self photoOfUser:^(NSArray *arrayPhotos) {
        NSMutableArray *arrayUrlSource = [NSMutableArray new];
        if(![arrayPhotos isEqual:nil]){
            for (int i = 0 ; i<[arrayPhotos count];i++) {
                
                [request requestInformation:[[arrayPhotos objectAtIndex:i] valueForKey:nameIDOfPhotoOfUser] NameField: nameFieldImages success:^(id data) {
                    PhotoOfUser *photoOfUser=[PhotoOfUser new];
                    NSInteger indexOfThumbPhoto=[[data objectForKey: keyGetValueImages]count]-1;
                    photoOfUser.idPhoto=[data valueForKey:keyGetValueIdPhoto];
                    photoOfUser.linkOriPhoto=[[[data objectForKey:keyGetValueImages] objectAtIndex:0] valueForKey:keyGetSourceLinkPhoto];
                    photoOfUser.linkThumbPhoto=[[[data objectForKey:keyGetValueImages] objectAtIndex:indexOfThumbPhoto]valueForKey:keyGetSourceLinkPhoto];
                    [arrayUrlSource addObject:photoOfUser];
                    if (i == [arrayPhotos count]-1) {
                        successUrlSource(arrayUrlSource);// wrong logic
                    }
                }failure:^(NSError *error)
                 {
                     failure(error);
                 }];
            }
        }else{
            NSError *errorArrayNil;
            errorArrayNil = [[NSError alloc] initWithDomain:parameterNotFoundDataPhoto code:120 userInfo:nil];
            failure(errorArrayNil);
        }

    } failure:^(NSError *error) {
        failure(error);
    }];
    
}



@end
