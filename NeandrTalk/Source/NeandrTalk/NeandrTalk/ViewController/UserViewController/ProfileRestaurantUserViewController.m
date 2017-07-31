
//
//  ProfileRestaurantUserViewController.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "ProfileRestaurantUserViewController.h"
#import "ParserService.h"
#import "TimeOpenProfileTableViewCell.h"
#import "UserModel.h"
@interface ProfileRestaurantUserViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *videoAbout;
@property (weak, nonatomic) IBOutlet UIImageView *avatarUserRestaurant;

@end

@implementation ProfileRestaurantUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_videoAbout loadRequest:[[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:@"https://www.youtube.com/embed/MHG3n_-Y33A"]]];
    
    _avatarUserRestaurant.layer.borderColor = [UIColor whiteColor].CGColor;
    _avatarUserRestaurant.layer.borderWidth = 4;
    _avatarUserRestaurant.layer.cornerRadius = _avatarUserRestaurant.frame.size.width/2;
    _avatarUserRestaurant.clipsToBounds = YES;
    NSArray *allUser =  [[NSArray alloc] initWithArray:[[ParserService alloc] getList:@"user"]];
    UserModel *user = [[UserModel alloc] init];
    user = [allUser lastObject];
    _arrayDaysOpen = [[NSArray alloc] initWithArray:user.arrayDaysOpen];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [_arrayDaysOpen count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TimeOpenProfileTableViewCell *cell = [_tableDaysOpen dequeueReusableCellWithIdentifier:@"dayCell" forIndexPath:indexPath];
    [cell getDataUser:_arrayDaysOpen[indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.frame.size.height/7;
}

@end
