//
//  AllBlogPostViewController.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AllBlogPostViewController.h"
#import "ParserService.h"
#import "BlogHomeTableViewCell.h"
#import "BlogPostTableViewCell.h"

#define idHomeCell @"homeTableViewCell"
#define idPostCell @"postTableViewCell"
#define idOrderByCell @"oderByCell"

#define postListName @"post"
@interface AllBlogPostViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableBlogPost;
@property (strong, nonatomic) PostModel *post;
@end

@implementation AllBlogPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _post=[[PostModel alloc] init];
//    [self parserPost];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return _tableBlogPost.frame.size.height/1.5;
    }
    else if (indexPath.row==2)
    {
        return _tableBlogPost.frame.size.height/1.4;
    }
    else
    {
        return 45;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        BlogHomeTableViewCell *cell=[_tableBlogPost dequeueReusableCellWithIdentifier:idHomeCell forIndexPath:indexPath];
        
        return  cell;
    }
    else if (indexPath.row==2){
        BlogHomeTableViewCell *cell=[_tableBlogPost dequeueReusableCellWithIdentifier:idPostCell forIndexPath:indexPath];
        return cell;
    }
    else
    {
        BlogHomeTableViewCell *cell=[_tableBlogPost dequeueReusableCellWithIdentifier:idOrderByCell forIndexPath:indexPath];
        return cell;
        
    }
    return nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void) parserPost{
//    ParserService *parser=[[ParserService alloc] init];
//    _allPostArray =[[NSArray alloc]initWithArray:[parser getList:postListName]];
//    _blogPostArray=[_allPostArray subarrayWithRange:NSMakeRange(8, 6)];
//    _featuredBlogPostArray=[[NSMutableArray alloc] init];
//    for (_post in _blogPostArray) {
//        if ([_post.featured isEqualToString:@"1"]) {
//            [_featuredBlogPostArray addObject:_post];
//        }
//    }
//}


@end
