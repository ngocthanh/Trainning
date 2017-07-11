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

#define nameFieldPhotoInformation @"id,created_time"
#define nameFieldImages @"images,created_time"
#define folderPhotos @"me/photos/uploaded"

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
#define keyGetCreatedTime @"created_time"
#define keyGetPaging @"paging"
#define keyGetCursors @"cursors"
#define keyGetAfter @"after"

#define parameterNotFoundDataPhoto @"Data Photo From Facebook Not Found"
#define noUserHomeTown @"No user's hometown"

#define oneUnit 1
#define indexOfOriginalPhoto 0
@implementation Service

-(void)privateInformationOfUser :(void (^)(UserFacebook *user))successCurrentAccount failure:(void(^)(NSError* error))failure{
    RequestDataFB* request = [[RequestDataFB alloc] init];// code is not enough
    [request requestInformation:folderMeForRequestFB NameField:nameFieldAccountInformation success:^(id data) {
        UserFacebook *information=[[UserFacebook alloc] init];
        NSString *userName=[data objectForKey: nameUser];
        NSDate *userBirthday=[data objectForKey:birthdayUser];
        NSString *userHomeTown=[[data objectForKey: hometownUser] objectForKey:nameUser];
        if (userHomeTown==nil) {
            userHomeTown = noUserHomeTown;
        }
        information.userName = userName;
        information.userBirthday =userBirthday;
        information.userHometown =userHomeTown;
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

-(void)photoOfUserWithLinkAfter:(NSString * _Nullable)linkAfter Success:(void (^)(NSArray* arrayPhotos))successPhoto failure:(void(^)(NSError* error))failure{
    RequestDataFB* request=[RequestDataFB new];
    
    if (linkAfter != nil) {
        [request requestInformationForLoadMore:folderPhotos NameField:nameFieldPhotoInformation NameField1:linkAfter success:^(id data) {
            NSArray *photoDataFromFB = [data objectForKey:keyGetValueData];
            NSArray *arrayPhotos= [self getArrayIDImageWithData:photoDataFromFB];
            
            successPhoto(arrayPhotos);
        } failure:^(NSError *error) {
            failure(error);
            
        }];
        
    }else{
        
        [request requestInformation:folderPhotos NameField:nameFieldPhotoInformation success:^(id data) {
            NSArray *photoDataFromFB = [data objectForKey:keyGetValueData];
            NSArray *arrayPhotos= [self getArrayIDImageWithData:photoDataFromFB];
            successPhoto(arrayPhotos);
        } failure:^(NSError *error) {
            failure(error);
            
        }];
    }
    
}

-(NSArray *)getArrayIDImageWithData:(NSArray* )data{
    NSMutableArray *arrayPhotos=[[NSMutableArray alloc] init];
    for(NSDictionary *photo in data){
        PhotoOfUser *photoOfUser=[PhotoOfUser new] ;
        photoOfUser.idPhoto=[photo valueForKey: keyGetValueIdPhoto];
        [arrayPhotos addObject:photoOfUser];
    }
    return arrayPhotos;
}

-(void)getUrlOfPhotoWithLinkAfter:(NSString * _Nullable)linkAfter Success:(void (^)(NSArray *arraySourcePhotoWithLargestSize))successUrlSource failure:(void (^)(NSError * error))failure{
    [self photoOfUserWithLinkAfter:linkAfter Success:^(NSArray *arrayPhotos) {
        NSMutableArray *arrayUrlSource = [NSMutableArray new];
        if(![arrayPhotos isEqual:nil]){
            for (NSDictionary *photo in arrayPhotos) {
                NSString *idImage = [photo valueForKey:nameIDOfPhotoOfUser];
                [self getOnePhotoUserWithIDImage:idImage Success:^(PhotoOfUser *photo) {
                    [arrayUrlSource addObject:photo];
                    if ([arrayUrlSource count] == [arrayPhotos count]) {
                        successUrlSource(arrayUrlSource);// wrong logic
                    }
                } Failure:^(NSError *error) {
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

-(void)getOnePhotoUserWithIDImage:(NSString *)idImage Success:(void(^)(PhotoOfUser *photo))success Failure:(void(^)(NSError * error))failure{
    RequestDataFB* request=[RequestDataFB new];
    [request requestInformation:idImage NameField:nameFieldImages success:^(id data) {
        PhotoOfUser *photoOfUser=[PhotoOfUser new];
        NSInteger indexOfThumbPhoto=[[data objectForKey: keyGetValueImages]count]-oneUnit;
        photoOfUser.idPhoto=[data valueForKey:keyGetValueIdPhoto];
        photoOfUser.linkOriPhoto=[[[data objectForKey:keyGetValueImages] objectAtIndex:indexOfOriginalPhoto] valueForKey:keyGetSourceLinkPhoto];
        photoOfUser.linkThumbPhoto=[[[data objectForKey:keyGetValueImages] objectAtIndex:indexOfThumbPhoto]valueForKey:keyGetSourceLinkPhoto];
        photoOfUser.created_time=[data valueForKey:keyGetCreatedTime];
        success(photoOfUser);
        
    }failure:^(NSError *error)
     {
         failure(error);
     }];
}

-(void)getCodeNextPage:(NSString * _Nullable)codeAfter Success:(void (^)(NSString *))successCode failure:(void (^)(NSError *))failure{
    RequestDataFB* request=[RequestDataFB new];
    if (codeAfter == nil ) {
        [request requestInformation:folderPhotos NameField:nameFieldImages success:^(id data) {
            
            NSString *codeOfNextPage=[[[data objectForKey:keyGetPaging] objectForKey:keyGetCursors]valueForKey:keyGetAfter];
            successCode(codeOfNextPage);
        } failure:^(NSError *error) {
            
        }];
        
    }else{
        [request requestInformationForLoadMore:folderPhotos NameField:nameFieldImages NameField1:codeAfter success:^(id data) {
            NSString *codeOfNextPage=[[[data objectForKey:keyGetPaging] objectForKey:keyGetCursors]valueForKey:keyGetAfter];
            successCode(codeOfNextPage);
        } failure:^(NSError *error) {
            
            
        }];
    }
    
}
-(void)loadMoreURLWithLinkAfter:(NSString * _Nullable)linkAfter Success:(void (^)(NSArray *arraySourcePhotoWithLargestSize))successUrlSource Failure:(void (^)(NSError * error))failure{
    [self getUrlOfPhotoWithLinkAfter:linkAfter Success:^(NSArray *arraySourcePhotoWithLargestSize) {
        successUrlSource(arraySourcePhotoWithLargestSize);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}
@end
