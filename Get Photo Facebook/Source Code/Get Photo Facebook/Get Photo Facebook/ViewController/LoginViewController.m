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
#define idTabbarHome @"tabbarHome"

#define alertTitle @"We Need"
#define alertMessage @"Get your information include (public information, friends, photos)."
#define alertActionTitleOK @"OK"
#define alertActionCancel @"Cancel"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)abtnLogin:(id)sender {
//    UIAlertController *errorAlert=[UIAlertController new];
//    errorAlert = [UIAlertController alertControllerWithTitle:alertTitle message:alertMessage preferredStyle: UIAlertControllerStyleAlert];
//    UIAlertAction *ok = [UIAlertAction actionWithTitle:alertActionTitleOK style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        [login
         logInWithReadPermissions: @[publicUserPermission,userPhotoPermission,userFriendsPermission,userBirthdayPermission,userHomeTownPermission]
         fromViewController:self
         handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
             if (error) {
                 
             } else if (result.isCancelled) {
                 
             } else {
                 
                 UITabBarController *tabbar = [self.storyboard instantiateViewControllerWithIdentifier:idTabbarHome];
                 [self presentViewController:tabbar animated:YES completion:nil];
             }
         }];
//    }];
//    UIAlertAction *cancel = [UIAlertAction actionWithTitle:alertActionCancel style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//        
//    }];
//    [errorAlert addAction:ok];
//    [errorAlert addAction:cancel];
//    [self presentViewController:errorAlert animated:YES completion:nil ];

}
@end
