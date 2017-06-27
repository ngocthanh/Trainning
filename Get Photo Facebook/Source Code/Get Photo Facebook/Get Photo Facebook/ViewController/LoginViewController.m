//
//  LoginViewController.m
//  Photo Design
//
//  Created by KterKC on 6/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "LoginViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)abtnLogin:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             UINavigationController *navi = [self.storyboard instantiateViewControllerWithIdentifier:@"naviAccountInformation"];
             [self presentViewController:navi animated:YES completion:nil];
         }
     }];
}



@end
