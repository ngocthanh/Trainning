//
//  LoginViewController.m
//  Photo Design
//
//  Created by KterKC on 6/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "LoginViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#define publicUserPermission @"public_profile"
#define userFriendsPermission @"user_friends"
#define userPhotoPermission @"user_photos"
#define userHomeTownPermission @"user_hometown"
#define userBirthdayPermission @"user_birthday"
#define idNaviControllerAccountInformation @"naviAccountInformation"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([FBSDKAccessToken currentAccessToken]) {
        UINavigationController *navi = [self.storyboard instantiateViewControllerWithIdentifier:idNaviControllerAccountInformation];
        [self presentViewController:navi animated:YES completion:nil];
    }
}
- (IBAction)abtnLogin:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[publicUserPermission,userPhotoPermission,userFriendsPermission,userBirthdayPermission,userHomeTownPermission]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             
         } else if (result.isCancelled) {
             
         } else {
             
             UINavigationController *navi = [self.storyboard instantiateViewControllerWithIdentifier:idNaviControllerAccountInformation];
             [self presentViewController:navi animated:YES completion:nil];
         }
     }];
}
//-(NSString *)loginFacebook{
//    __block NSString *resultManager;
//    
//    return resultManager;
//}



@end
