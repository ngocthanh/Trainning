//
//  loginFacebook.m
//  ReadingNEWS
//
//  Created by dankhanh on 6/22/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import "loginFacebook.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface loginFacebook ()
@property (weak, nonatomic) IBOutlet UIProgressView *pgvLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UILabel *lblLogin;

@end

@implementation loginFacebook

- (void)viewDidLoad {
    [super viewDidLoad];

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
