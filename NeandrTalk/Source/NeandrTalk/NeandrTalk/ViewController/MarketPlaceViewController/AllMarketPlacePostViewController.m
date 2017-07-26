//
//  AllMarketPlacePostViewController.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AllMarketPlacePostViewController.h"
#import "ParserService.h"
#import "MarketPlaceHomeTableViewCell.h"
#import "MarketPlacePostTableViewCell.h"

#define idHomeCell @"homeTableViewCell"
#define idPostCell @"postTableViewCell"
#define idOrderByCell @"oderByCell"

#define postListName @"post"
@interface AllMarketPlacePostViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableMarketPost;
@property (strong, nonatomic) PostModel *post;
@end

@implementation AllMarketPlacePostViewController

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
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return _tableMarketPost.frame.size.height/1.5;
    }
    else if (indexPath.row==2)
    {
        return _tableMarketPost.frame.size.height/1.3;
    }
    else
    {
        return 45;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        MarketPlaceHomeTableViewCell *cell=[_tableMarketPost dequeueReusableCellWithIdentifier:idHomeCell forIndexPath:indexPath];
        
        return  cell;
    }
    else if (indexPath.row==2){
        MarketPlacePostTableViewCell *cell=[_tableMarketPost dequeueReusableCellWithIdentifier:idPostCell forIndexPath:indexPath];
        return cell;
    }
    else
    {
        MarketPlaceHomeTableViewCell *cell=[_tableMarketPost dequeueReusableCellWithIdentifier:idOrderByCell forIndexPath:indexPath];
        return cell;
        
    }
    return nil;
}
-(void) parserPost{
    ParserService *parser=[[ParserService alloc] init];
    _allPostArray =[[NSArray alloc]initWithArray:[parser getList:postListName]];
    _marketPostArray = [_allPostArray subarrayWithRange:NSMakeRange(14, 6)];
    _featuredMarketPostArray=[[NSMutableArray alloc] init];
    for (_post in _marketPostArray) {
        if ([_post.featured isEqualToString:@"1"]) {
            [_featuredMarketPostArray addObject:_post];
        }
    }

}

@end
