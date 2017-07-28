//
//  LandingPageViewController.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "LandingPageViewController.h"
#import "LandingTypePostTableViewCell.h"
#import "LandingNeandrTableViewCell.h"
#import "LandingCommunityTableViewCell.h"
#import "LadingHomeImageTableViewCell.h"
#import "NeandrModel.h"
#import "ParserService.h"
#define numberTableSection 1
#define numberTableRowInSection 8

#define idImageCell @"landingHomeCell"
#define idPostCell @"landingPostCell"
#define idComunityCell @"landingComunityCell"
#define idNeandrCell @"landingNeandrCell"
@interface LandingPageViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableLandingPage;
@property (strong,nonatomic) UserModel *user;
@property (strong,nonatomic) PostModel *post;
@property NSArray *arrayNamePost;
@property NSArray *arrayUserMember;
@property NSArray *arrayDiscussion;
@property NSArray *arrayBlog;
@property NSArray *arrayMarketPost;
@property NSArray *arrayNeandr;
@property NSArray *arrayAllPost;
@property NSArray *arrayAllPost1;
@end

@implementation LandingPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _user = [[UserModel alloc] init];
    _post = [[PostModel alloc] init];
    _arrayNamePost = [[NSArray alloc]initWithObjects:@"Discussion",@"Blog Post", @"Market Place", nil];
    [self parse];
    _arrayUserMember = [[NSArray alloc] initWithArray:[self parseUser]];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return numberTableSection;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return numberTableRowInSection;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 || indexPath.row == 4) {
        return _tableLandingPage.frame.size.height/3;
    }
    return _tableLandingPage.frame.size.height/2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    
    if (row == 0) {
        LadingHomeImageTableViewCell *cell = [_tableLandingPage dequeueReusableCellWithIdentifier:idImageCell forIndexPath:indexPath];
        return  cell;
    }else if(row > 0 & row < 4){
        LandingTypePostTableViewCell *cell = [_tableLandingPage dequeueReusableCellWithIdentifier:idPostCell forIndexPath:indexPath];
        [cell getDataWithTitleTypePost:_arrayNamePost[indexPath.row - 1] Posts:_arrayAllPost1[indexPath.row - 1] View:self];
        return cell;
    }else if (row == 4){
        LandingCommunityTableViewCell *cell = [_tableLandingPage dequeueReusableCellWithIdentifier:idComunityCell forIndexPath:indexPath];
        [cell getData:_arrayUserMember];
        return cell;
    }else if(row > 4){
        LandingNeandrTableViewCell *cell = [_tableLandingPage dequeueReusableCellWithIdentifier:idNeandrCell forIndexPath:indexPath];
        [cell getData:_arrayNeandr[row - 5]];
        return cell;
    }
    return nil;
    
    
}

-(NSArray *)parseUser{
    NSMutableArray *dicUser = [[NSMutableArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"user" ofType:@"plist"]];
    NSMutableArray *arrayUser = [[NSMutableArray alloc] init];
    for (NSDictionary *user in dicUser) {
        if (arrayUser.count < 6) {
            UserModel *userModel = [[UserModel alloc] init];
            userModel.demoAvatar = [user valueForKey:@"avatarName"];
            userModel.active = [user valueForKey:@"active"];
            [arrayUser addObject:userModel];
        }
    }
    return arrayUser;
}
-(void)parse{
    ParserService *parse = [[ParserService alloc] init];
    _arrayNeandr = [[NSArray alloc]initWithArray:[parse getList:@"neandr"]];
    _arrayAllPost = [[NSArray alloc]initWithArray:[parse getList:@"post"]];
    _arrayBlog = [_arrayAllPost subarrayWithRange:NSMakeRange(0, 7)];
    _arrayDiscussion = [_arrayAllPost subarrayWithRange:NSMakeRange(8, 6)];
    _arrayMarketPost = [_arrayAllPost subarrayWithRange:NSMakeRange(14, 6)];
    _arrayAllPost1 = [[NSArray alloc] initWithObjects:_arrayDiscussion,_arrayBlog,_arrayMarketPost, nil];
}

@end
