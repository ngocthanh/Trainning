//
//  AccountInformationModel.m
//  Photo Facebook
//
//  Created by dankhanh on 6/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AccountInformationModel.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "ConstantsSystem.h"


@implementation AccountInformationModel

-(AccountInformationModel*) getInformationOfUser{
    AccountInformationModel *information = [AccountInformationModel alloc];
    if ([FBSDKAccessToken currentAccessToken]) {
        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                      initWithGraphPath:@"/me"
                                      parameters:@{ @"fields": @"name,birthday,hometown,picture",}
                                      HTTPMethod:@"GET"];
        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            if(!error){
                _userName = [result objectForKey:@"name"];
                _userBirthday=[result objectForKey:@"birthday"];
                _userHometown=[[result objectForKey:@"hometown"] objectForKey:@"name"];
                _userUrlPicture=[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",[result objectForKey:@"id"]];
                NSLog(@"%@",_userName);
                NSLog(@"%@",_userBirthday);
                NSLog(@"%@",_userHometown);
                NSLog(@"%@",_userUrlPicture);
            }
            else
            {
                NSLog(@"%@", [error localizedDescription]);
            }
        }];
    }
    return information;
}
@end
