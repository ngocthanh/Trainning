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

@implementation RequestDataFB

-(void) getInformationOfUserSuccessAccount:(void (^)(UserFacebook *user))successCurrentAccount successFriend:(void (^)(NSMutableArray *arrayFriend))successFriend failure:(void(^)(NSError* error))failure
{
    
    if ([FBSDKAccessToken currentAccessToken]) {
        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                      initWithGraphPath:@"/me"
                                      parameters:@{ @"fields": @"name,birthday,hometown,picture,friends",}
                                      HTTPMethod:@"GET"];
        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            if(!error){
                UserFacebook *information = [[UserFacebook alloc] init];
                information.userName = [result objectForKey:@"name"];
                information.userBirthday=[result objectForKey:@"birthday"];
                information.userHometown=[[result objectForKey:@"hometown"] objectForKey:@"name"];
                information.userUrlPicture=[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",[result objectForKey:@"id"]];
                
                successCurrentAccount(information);
                NSArray * allKeys = [[result valueForKey:@"friends"]objectForKey:@"data"];
                NSMutableArray *arrayFriends = [[NSMutableArray alloc] init];

                for (int i = 0; i<[allKeys count]; i++) {
                    UserFacebook *userFriend = [[UserFacebook alloc] init];
                    NSString *idFriend = [[[[result valueForKey:@"friends"]objectForKey:@"data"] objectAtIndex:i] valueForKey:@"id"];
                    userFriend.userName = [[[[result valueForKey:@"friends"]objectForKey:@"data"] objectAtIndex:i] valueForKey:@"name"];
                    userFriend.userUrlPicture = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=large",idFriend];
                    [arrayFriends addObject:userFriend];
                }
                successFriend(arrayFriends);
            }
            else
            {
                NSLog(@"%@", [error localizedDescription]);
                failure(error);
            }
        }];
    }
}
-(void)getInformationOfUserSuccessAccount{
    if ([FBSDKAccessToken currentAccessToken]) {
        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                      initWithGraphPath:@"/me"
                                      parameters:@{ @"fields": @"name,birthday,hometown,picture,friends",}
                                      HTTPMethod:@"GET"];
        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            if(!error){
                //UserFacebook *information = [UserFacebook alloc];
                _userFacebook.userName = [result objectForKey:@"name"];
                _userFacebook.userBirthday=[result objectForKey:@"birthday"];
                _userFacebook.userHometown=[[result objectForKey:@"hometown"] objectForKey:@"name"];
                _userFacebook.userUrlPicture=[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",[result objectForKey:@"id"]];
                
                //successCurrentAccount(information);
                NSArray * allKeys = [[result valueForKey:@"friends"]objectForKey:@"data"];
                //NSMutableArray *arrayFriends = [[NSMutableArray alloc] init];
                
                for (int i = 0; i<[allKeys count]; i++) {
                    UserFacebook *userFriend = [UserFacebook alloc];
                    NSString *idFriend = [[[[result valueForKey:@"friends"]objectForKey:@"data"] objectAtIndex:i] valueForKey:@"id"];
                    userFriend.userName = [[[[result valueForKey:@"friends"]objectForKey:@"data"] objectAtIndex:i] valueForKey:@"name"];
                    userFriend.userUrlPicture = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=large",idFriend];
                    [_arrayFriends addObject:userFriend];
                }
               // successFriend(arrayFriends);
            }
            else
            {
                NSLog(@"%@", [error localizedDescription]);
                //failure(error);
            }
        }];
    }
}

@end
