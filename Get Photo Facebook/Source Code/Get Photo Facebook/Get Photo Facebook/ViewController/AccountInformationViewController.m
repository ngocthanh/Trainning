//
//  AccountInformationViewController.m
//  Photo Design
//
//  Created by KterKC on 6/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AccountInformationViewController.h"
#import "UserFacebook.h"
#import "RequestDataFB.h"
#import "AccountInformationTableViewCell.h"
@interface AccountInformationViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *pictureOfUser;
@property (weak, nonatomic) IBOutlet UILabel *lblNameOfUser;
@property (weak, nonatomic) IBOutlet UILabel *lblHometown;
@property (weak, nonatomic) IBOutlet UILabel *lblDateOfBirth;
@property (weak, nonatomic) IBOutlet UITableView *tableListFriend;

@property (strong,nonatomic) RequestDataFB* requestFacebook;
@property (strong,nonatomic) UserFacebook* userFacebook;
@property (strong,nonatomic) NSMutableArray* arrayFriendList;
@property (strong,nonatomic) AccountInformationTableViewCell *cell;
@end

@implementation AccountInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pictureOfUser.layer.cornerRadius=_pictureOfUser.frame.size.height/2.0;
    self.pictureOfUser.clipsToBounds=YES;
    _userFacebook = [[UserFacebook alloc] init];
    _arrayFriendList = [[NSMutableArray alloc] init];
    _requestFacebook = [RequestDataFB alloc];
    [_requestFacebook getInformationOfUserSuccessAccount:
     ^(UserFacebook *user) {
         _userFacebook = user;
         [self displayUserInformation];
     } successFriend:^(NSMutableArray *arrayFriend) {
         
         _arrayFriendList = arrayFriend;
         [_tableListFriend reloadData];
     } failure:^(NSError *error) {
         NSLog(@"%@---------------------",error);
     }];
    [_tableListFriend setDelegate:self];
    [_tableListFriend setDataSource:self];
    _cell= [[AccountInformationTableViewCell alloc] init];


}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_tableListFriend reloadData];


}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [_tableListFriend reloadData];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_arrayFriendList count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   _cell = [_tableListFriend dequeueReusableCellWithIdentifier:@"cellListFriend" forIndexPath:indexPath];
    UserFacebook *friend = [UserFacebook new];
    friend =[_arrayFriendList objectAtIndex:indexPath.row];
    NSString *name = friend.userName ;
    NSString *link = friend.userUrlPicture;
    [_cell getDataFromViewControllerWithURLImage:link FriendsName:name];
    return _cell;
}
- (void)displayUserInformation{
    _lblNameOfUser.text=[NSString stringWithFormat:@"%@",_userFacebook.userName];
    _lblHometown.text=[NSString stringWithFormat:@"Hometown: %@",_userFacebook.userHometown];
    _lblDateOfBirth.text=[NSString stringWithFormat:@"Date of birth: %@",_userFacebook.userBirthday];
    NSData *dataOfPicture=[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_userFacebook.userUrlPicture]]];
    _pictureOfUser.image=[UIImage imageWithData:dataOfPicture];
}


@end
