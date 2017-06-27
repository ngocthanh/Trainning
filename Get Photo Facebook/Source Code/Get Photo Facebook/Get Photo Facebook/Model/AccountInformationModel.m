//
//  AccountInformationModel.m
//  Photo Facebook
//
//  Created by dankhanh on 6/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AccountInformationModel.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "ConstantsSystem.h"


@implementation AccountInformationModel

-(AccountInformationModel*) getInformationOfUser{
    AccountInformationModel *information = [AccountInformationModel alloc];
    if ([FBSDKAccessToken currentAccessToken]) {
        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                      initWithGraphPath:@"/me"
                                      parameters:@{ @"fields": @"name,picture,hometown,birthday",}
                                      HTTPMethod:@"GET"];
        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            if(!error){
                information.userName = [NSString stringWithFormat:@"%@",[result objectForKey:@"name"]];
                information.userBirthday=[NSString stringWithFormat:@"%@",[result objectForKey:@"birthday"]];
                information.userHometown=[NSString stringWithFormat:@"%@",[[result objectForKey:@"hometown"] objectForKey:@"name"]];
                information.userUrlPicture=[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",[result objectForKey:@"id"]];
            }
        }];
    }
    return information;
}
@end
