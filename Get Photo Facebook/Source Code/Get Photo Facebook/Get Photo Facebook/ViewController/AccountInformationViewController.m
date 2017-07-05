//
//  AccountInformationViewController.m
//  Photo Design
//
//  Created by KterKC on 6/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AccountInformationViewController.h"
#import "UserFacebook.h"
#import "AccountInformationTableViewCell.h"
#import "Service.h"
#import "FileManager.h"
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
    
    
    _service = [Service alloc];
    _helper = [Helper alloc];
    [self setStyleForAccountInformation];	
    [self loadAccountInformation];
    [self loadFriendList];
    _file =[FileManager alloc];
//    [_file getdata];
    
}

-(void) loadAccountInformation{
    [_service privateInformationOfUser:^(UserFacebook *user) {
        _userFacebook = user;
        [self displayUserInformation];
    } failure:^(NSError *error) {
        [_helper createAlertWithStringTitle:@"Oops!" contentAlert:[NSString stringWithFormat:@"Error with code %@", error]];
    }];
}
-(void) loadFriendList{
    [_service friendListSuccess:^(NSArray *arrayListFriends) {
        _arrayFriendList = [[NSArray alloc] initWithArray:arrayListFriends];
        [_tableListFriend reloadData];
    } failure:^(NSError *error) {
        [_helper createAlertWithStringTitle:@"Oops!" contentAlert:[NSString stringWithFormat:@"Error with code %@", error]];
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
    _cell = [_tableListFriend dequeueReusableCellWithIdentifier:@"cellListFriend" forIndexPath:indexPath];
    UserFacebook *friend = [UserFacebook new];
    friend =[_arrayFriendList objectAtIndex:indexPath.row];
    NSString *name = friend.userName ;
    NSString *link = friend.userUrlPicture;
    [_cell setDataFromViewControllerWithURLImage:link FriendsName:name];
    return _cell;
}

- (void)displayUserInformation{
    if (!(_userFacebook.userHometown == nil) ) {
        _lblNameOfUser.text=[NSString stringWithFormat:@"%@",_userFacebook.userName];
        _lblHometown.text=[NSString stringWithFormat:@"Hometown: %@",_userFacebook.userHometown];
        _lblDateOfBirth.text=[NSString stringWithFormat:@"Date of birth: %@",_userFacebook.userBirthday];
        NSData *dataOfPicture=[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_userFacebook.userUrlPicture]]];
        _pictureOfUser.image=[UIImage imageWithData:dataOfPicture];
    }else {
        _lblHometown.text=[NSString stringWithFormat:@"Not Found User's Hometown"];
        _lblNameOfUser.text=[NSString stringWithFormat:@"%@",_userFacebook.userName];
        _lblDateOfBirth.text=[NSString stringWithFormat:@"Date of birth: %@",_userFacebook.userBirthday];
        NSData *dataOfPicture=[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_userFacebook.userUrlPicture]]];
        _pictureOfUser.image=[UIImage imageWithData:dataOfPicture];
    }
    
}
-(void)setStyleForAccountInformation{
    self.pictureOfUser.layer.cornerRadius=_pictureOfUser.frame.size.height/2.0;
    self.pictureOfUser.clipsToBounds=YES;
    self.pictureOfUser.layer.borderColor = [UIColor colorWithRed:0 green:0.1 blue:0.9 alpha:1].CGColor;
    self.pictureOfUser.layer.borderWidth = 1;
}

@end
