//
//  LoginViewController.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "LoginViewController.h"
#import "DataForViewController.h"
#import "UserModel.h"
@interface LoginViewController ()
@property (strong,nonatomic) UserModel* userInformation;
@property (strong,nonatomic) DataForViewController* data;
@property (strong,nonatomic) NSMutableArray* userList;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithClass];
    _userList=[_data getUserList:@"user"];

}
-(void) getUserInformationByUserID :(NSInteger)IdOfUser{
    NSString *userAtIndex=[_userList objectAtIndex:IdOfUser];
    _userInformation.userID=[userAtIndex valueForKey:@"userID"];
    _userInformation.email=[userAtIndex valueForKey:@"email"];
    _userInformation.password=[userAtIndex valueForKey:@"password"];
    _userInformation.userType=[userAtIndex valueForKey:@"userType"];
    _userInformation.email=[userAtIndex valueForKey:@"email"];
}
-(void) initWithClass{
    _userInformation=[[UserModel alloc] init];
    _data=[[DataForViewController alloc] init];
    _userList=[[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {

}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{

    if ([identifier isEqualToString:@"loginWithNeandrTalk"]) {
        NSInteger success = 0;
        @try {
            
            if([_txtUserName.text isEqualToString:@""] || [self.txtPassword.text isEqualToString:@""] ) {
                
                [self alertStatus:@"Please enter Email and Password" :@"Login Failed!" :0];
                
                
            } else {
                for (int i=0; i<[_userList count]; i++) {
                    [self getUserInformationByUserID:i];
                    if ([_txtUserName.text isEqualToString:_userInformation.email]||[_txtPassword.text isEqualToString:_userInformation.password]) {
                        success=1;
                    }
                }
                
                if(success == 1)
                {
                    NSLog(@"Login SUCCESS");
                    
                } else {
                    [self alertStatus:@"Your Email or your Password is not correct" :@"Login Failed" :0];
                    
                }
            }
        }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
            [self alertStatus:@"Login Failed." :@"Error!" :0];
        }
        if (success==0) {
            return NO;
        }
        else
            return YES;
    }
    else
        return YES;
}
- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}
@end
