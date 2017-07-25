//
//  AllDiscussionPostViewController.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AllDiscussionPostViewController.h"
#import "ParserService.h"
#import "DiscussionHomeTableViewCell.h"
#import "DiscussionPostTableViewCell.h"
#import "DiscussionPostCollectionViewCell.h"
#import "DiscussionFeaturedPostCollectionViewCell.h"


#define idHomeCell @"homeTableViewCell"
#define idPostCell @"postTableViewCell"
#define idFeaturedCell @"featuredPostCell"
#define idOrderByCell @"oderByCell"


#define numberOfSection 1
#define numberOfRowInSection 3

#define postListName @"post"
@interface AllDiscussionPostViewController ()

@property (strong,nonatomic) PostModel *post;
@property (weak, nonatomic) IBOutlet UITableView *tableDiscussion;

@end

@implementation AllDiscussionPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _post=[[PostModel alloc] init];
    [self parserPost];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return numberOfSection;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return _tableDiscussion.frame.size.height/1.5;
    }
    else if (indexPath.row==2)
    {
        return _tableDiscussion.frame.size.height/1.3;
    }
    else
    {
        return 45;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return numberOfRowInSection;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        DiscussionHomeTableViewCell *cell=[_tableDiscussion dequeueReusableCellWithIdentifier:idHomeCell forIndexPath:indexPath];
        
        return  cell;
    }
    else if (indexPath.row==2){
        DiscussionHomeTableViewCell *cell=[_tableDiscussion dequeueReusableCellWithIdentifier:idPostCell forIndexPath:indexPath];
        return cell;
    }
    else
    {
        DiscussionHomeTableViewCell *cell=[_tableDiscussion dequeueReusableCellWithIdentifier:idOrderByCell forIndexPath:indexPath];
        return cell;

    }
    return nil;
}
-(void) parserPost{
    ParserService *parser=[[ParserService alloc] init];
    _allPostArray =[[NSArray alloc]initWithArray:[parser getList:postListName]];
    _discussionPostArray=[_allPostArray subarrayWithRange:NSMakeRange(8, 6)];
    _featuredPostArray=[[NSMutableArray alloc] init];
    for (_post in _discussionPostArray) {
        if ([_post.featured isEqualToString:@"1"]) {
            [_featuredPostArray addObject:_post];
        }
    }
}
@end
