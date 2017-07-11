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
#import "ConstantsSystem.h"
#import "Helper.h"

#define titleForAlert @"Oops!"
#define messageOfAlert @"Error with code %@"
#define idTableViewCell @"cellListFriend"
#define parameterOfUserBirthDay @"Date of birth: %@"
#define parameterOfUserHometown @"Hometown: %@"
#define numberOfSection 1


@interface AccountInformationViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *pictureOfUser;
@property (weak, nonatomic) IBOutlet UILabel *lblNameOfUser;
@property (weak, nonatomic) IBOutlet UILabel *lblHometown;
@property (weak, nonatomic) IBOutlet UILabel *lblDateOfBirth;
@property (weak, nonatomic) IBOutlet UITableView *tableListFriend;

@property (strong,nonatomic) UserFacebook* userFacebook;
@property (strong,nonatomic) Service* service;
@property (strong,nonatomic) NSMutableArray* arrayFriendList;
@property (strong,nonatomic) AccountInformationTableViewCell *cell;
@property (strong,nonatomic) Helper *helper;
@property (strong,nonatomic) FileManager *file;

@property (strong,nonatomic) NSString *codeAfter;

@end

@implementation AccountInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self classesInit];
    [_helper setStyleForImage:_pictureOfUser];
    [self loadAccountInformation];
    [self loadFriendList];
    
}
-(void)classesInit{
    // code is not enough
    
    _service = [[Service alloc] init];
    _helper = [[Helper alloc]init];

    _file = [[FileManager alloc] init];
    _arrayFriendList = [[NSMutableArray alloc] init];

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
        [_arrayFriendList addObjectsFromArray:arrayListFriends];
        [_tableListFriend reloadData];
    } failure:^(NSError *error) {
        [_helper createAlertWithStringTitle:titleForAlert contentAlert:[NSString stringWithFormat:messageOfAlert, error]];
    }];
    
    [_service loadCodeAfter:nil Success:^(NSString *linkNextPage) {
        _codeAfter =linkNextPage;
    } failure:^(NSError *error) {
        
    }];
   
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return numberOfSection;
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
    if (indexPath.row == [_arrayFriendList count] && _codeAfter != nil) {
        [_service loadCodeAfter:_codeAfter Success:^(NSString *linkNextPage) {
            _codeAfter = linkNextPage;
        } failure:^(NSError *error) {
            
        }];
        [_service loadMoreFriendWithCodeAfter:_codeAfter Success:^(NSArray *arrayListFriends) {
            [_arrayFriendList addObjectsFromArray:arrayListFriends];
            [_cell setDataFromViewControllerWithURLImage:link FriendsName:name];
        } failure:^(NSError *error) {
            
        }];
    }
    return _cell;
}
//duplicate code
- (void)displayUserInformation{
    _lblNameOfUser.text=[NSString stringWithFormat:parameterForString,_userFacebook.userName];
    NSData *dataOfPicture=[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:parameterForString,_userFacebook.userUrlPicture]]];
    _pictureOfUser.image=[UIImage imageWithData:dataOfPicture];
    _lblHometown.text=[NSString stringWithFormat:parameterOfUserHometown,_userFacebook.userHometown];
    _lblDateOfBirth.text=[NSString stringWithFormat:parameterOfUserBirthDay,_userFacebook.userBirthday];

}


@end
