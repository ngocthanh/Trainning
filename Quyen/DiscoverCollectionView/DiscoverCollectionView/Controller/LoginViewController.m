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

    UIButton *myLoginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    myLoginButton.backgroundColor = [UIColor colorWithDisplayP3Red:0.2 green:0.3 blue:0.55 alpha:1];
    myLoginButton.titleLabel.textColor = [UIColor whiteColor];
    myLoginButton.frame=CGRectMake(0,0,180,40);
    myLoginButton.center = self.view.center;
    [myLoginButton setTitle: titleLoginFB forState: UIControlStateNormal];
    
    [myLoginButton
     addTarget:self
     action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:myLoginButton];
}

-(void)loginButtonClicked
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[permissionFBProfile]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {

         } else if (result.isCancelled) {
             
         } else {
            [self presentViewController: _navi animated:true completion:^{
                
            }];
         }
     }];
}


@end
