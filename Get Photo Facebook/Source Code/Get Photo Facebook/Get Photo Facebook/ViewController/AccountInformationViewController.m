//
//  AccountInformationViewController.m
//  Photo Design
//
//  Created by KterKC on 6/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AccountInformationViewController.h"
#import "AccountInformationTableViewCell.h"
#import "Service.h"
#import "FileManager.h"

#define titleForAlert @"Oops!"
#define messageOfAlert @"Error with code %@"
#define idTableViewCell @"cellListFriend"
#define parameterOfUserBirthDay @"Date of birth: %@"
#define parameterOfUserHometown @"Hometown: %@"
#define parameterNotFoundHomeTown @"Not Found User's Hometown"

@interface AccountInformationViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *pictureOfUser;
@property (weak, nonatomic) IBOutlet UILabel *lblNameOfUser;
@property (weak, nonatomic) IBOutlet UILabel *lblHometown;
@property (weak, nonatomic) IBOutlet UILabel *lblDateOfBirth;
@property (weak, nonatomic) IBOutlet UITableView *tableListFriend;

@property (strong,nonatomic) UserFacebook* userFacebook;
@property (strong,nonatomic) Service* service;
@property (strong,nonatomic) NSArray* arrayFriendList;
@property (strong,nonatomic) AccountInformationTableViewCell *cell;
@property (strong,nonatomic) __block Helper *helper;

@property (strong,nonatomic) FileManager *file;
@end

@implementation AccountInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self classesInit];
    [self setStyleForAccountInformation];
    [self loadAccountInformation];
    [self loadFriendList];

    
}
-(void)classesInit{
    // code is not enough

    _service = [[Service alloc] init];
    _helper = [[Helper alloc]init];
    _file =[[FileManager alloc] init];

}
-(void) loadAccountInformation{
    [_service privateInformationOfUser:^(UserFacebook *user) {
        _userFacebook = user;
        [self displayUserInformation];
    } failure:^(NSError *error) {
        [_helper createAlertWithStringTitle:titleForAlert contentAlert:[NSString stringWithFormat:messageOfAlert, error]];
    }];
}
-(void) loadFriendList{
    [_service friendListSuccess:^(NSArray *arrayListFriends) {
        _arrayFriendList = [[NSArray alloc] initWithArray:arrayListFriends];
        [_tableListFriend reloadData];
    } failure:^(NSError *error) {
        [_helper createAlertWithStringTitle:titleForAlert contentAlert:[NSString stringWithFormat:messageOfAlert, error]];
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_arrayFriendList count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    _cell= [[AccountInformationTableViewCell alloc] init];
    _cell = [_tableListFriend dequeueReusableCellWithIdentifier: idTableViewCell forIndexPath:indexPath];
    UserFacebook *friend = [[UserFacebook alloc]init];// wrong init style
    friend =[_arrayFriendList objectAtIndex:indexPath.row];
    NSString *name = friend.userName ;
    NSString *link = friend.userUrlPicture;
    [_cell setDataFromViewControllerWithURLImage:link FriendsName:name];
    return _cell;
}
//duplicate code
- (void)displayUserInformation{
    _lblNameOfUser.text=[NSString stringWithFormat:parameterForString,_userFacebook.userName];
    
    _lblDateOfBirth.text=[NSString stringWithFormat:parameterOfUserBirthDay,_userFacebook.userBirthday];
    NSData *dataOfPicture=[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:parameterForString,_userFacebook.userUrlPicture]]];
    _pictureOfUser.image=[UIImage imageWithData:dataOfPicture];
    if (!(_userFacebook.userHometown == nil) ) {
        _lblHometown.text=[NSString stringWithFormat:parameterOfUserHometown,_userFacebook.userHometown];
    }
    else {
        _lblHometown.text=[NSString stringWithFormat:parameterNotFoundHomeTown];
    }
}
-(void)setStyleForAccountInformation{
    self.pictureOfUser.layer.cornerRadius=_pictureOfUser.frame.size.height/2.0;
    self.pictureOfUser.clipsToBounds=YES;
    self.pictureOfUser.layer.borderColor = [UIColor colorWithRed:0 green:0.1 blue:0.9 alpha:1].CGColor;
    self.pictureOfUser.layer.borderWidth = 1;
}

@end
