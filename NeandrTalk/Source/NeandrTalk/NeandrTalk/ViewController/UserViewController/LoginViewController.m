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
#import "Helper.h"
@interface LoginViewController ()
@property (strong,nonatomic) UserModel* userInformation;
@property (strong,nonatomic) DataForViewController* data;
@property (strong,nonatomic) Helper* helper;
@property (strong,nonatomic) NSMutableArray* userList;
@property (strong,nonatomic) NSString* btnIdentifier;

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
    _helper=[[Helper alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    _btnIdentifier=@"login";
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    if ([_btnIdentifier isEqualToString:@"login"]) {
        NSInteger success = 0;
        @try {
            
            if([_txtUserName.text isEqualToString:@""] || [self.txtPassword.text isEqualToString:@""] ) {
                
                [_helper createAlertWithStringTitle:@"Login Failed" contentAlert:@"Please enter Email and Password" Handler:^(UIAlertAction *action) {
                    
                } ViewController:self];
                
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
                    [_helper createAlertWithStringTitle:@"Login Failed" contentAlert:@"Your Email or your Password is not correct" Handler:^(UIAlertAction *action) {
                        
                    } ViewController:self];
                    
                }
            }
        }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
            [_helper createAlertWithStringTitle:@"Login Failed" contentAlert:@"Error!" Handler:^(UIAlertAction *action) {
                
            } ViewController:self];
        }
        if (success==0) {
            _btnIdentifier=@"";
            return NO;
        }
        else
            _btnIdentifier=@"";
        return YES;
    }
    else
    {
        _btnIdentifier=@"";
        return YES;
    }
}

@end
