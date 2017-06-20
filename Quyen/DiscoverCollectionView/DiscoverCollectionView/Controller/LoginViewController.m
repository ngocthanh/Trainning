//
//  LoginViewController.m
//  DiscoverCollectionView
//
//  Created by KterKC on 6/19/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "LoginViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "HomeViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
@interface LoginViewController ()
@property UINavigationController *navi;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    _navi = [[UINavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]];
    [super viewDidLoad];
//    if ([FBSDKAccessToken currentAccessToken]) {
//        // User is logged in, do work such as go to next view controller.
//
//        [self presentViewController:_navi animated:true completion:nil];
//
//    }
    UIButton *myLoginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    myLoginButton.backgroundColor = [UIColor colorWithDisplayP3Red:0.1 green:0.2 blue:0.6 alpha:1];
    myLoginButton.titleLabel.textColor = [UIColor whiteColor];
    myLoginButton.frame=CGRectMake(0,0,180,40);
    myLoginButton.center = self.view.center;
    [myLoginButton setTitle: @"Login With FaceBook" forState: UIControlStateNormal];
    
    // Handle clicks on the button
    [myLoginButton
     addTarget:self
     action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    // Add the button to the view
    [self.view addSubview:myLoginButton];
}

// Once the button is clicked, show the login dialog
-(void)loginButtonClicked
{
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
            [self presentViewController:_navi animated:true completion:nil];
             NSLog(@"Logged in");
         }
     }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
