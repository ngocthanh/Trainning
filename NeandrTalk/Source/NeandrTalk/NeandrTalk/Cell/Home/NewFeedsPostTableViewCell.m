//
//  NewFeedsPostTableViewCell.m
//  NeandrTalk
//
//  Created by dankhanh on 7/27/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "NewFeedsPostTableViewCell.h"
#import "MarketPlacePostCollectionViewCell.h"
#import "BlogPostCollectionViewCell.h"
#import "DiscussionPostCollectionViewCell.h"
#import "ParserService.h"
#import "SingleDiscussionPostViewController.h"
#import "SingleBlogPostViewController.h"
#import "SingleMarketPlacePostViewController.h"
#define postListName @"post"
#define marginBetweenTwoItem 2
@implementation NewFeedsPostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self parserPost];
    [self randomNumber];
    
}
-(void) parserPost{
    ParserService *parser=[[ParserService alloc] init];
    _allPostArray =[[NSArray alloc]initWithArray:[parser getList:postListName]];
}
-(void)getData:(NewFeedViewController*)vc{
    _newsFeed=vc;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_allPostArray count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([[[_allPostArray objectAtIndex:[_random[indexPath.row] integerValue]] valueForKey:@"postType"] isEqualToString:@"blogPost"]) {
        BlogPostCollectionViewCell *cell=[_newfeedCollectionView dequeueReusableCellWithReuseIdentifier:@"blogPostCollectionViewCell" forIndexPath:indexPath];
        [cell getData:[_allPostArray objectAtIndex:[_random[indexPath.row] integerValue]]];
        
        return cell;
    }
    else if ([[[_allPostArray objectAtIndex:[_random[indexPath.row] integerValue]]valueForKey:@"postType"]isEqualToString:@"Discussion"]){
        DiscussionPostCollectionViewCell *cell=[_newfeedCollectionView dequeueReusableCellWithReuseIdentifier:@"discussionPostCollectionViewCell" forIndexPath:indexPath];
        [cell getData:[_allPostArray objectAtIndex:[_random[indexPath.row] integerValue]]];
        return cell;
    }
    else
    {
        MarketPlacePostCollectionViewCell *cell=[_newfeedCollectionView dequeueReusableCellWithReuseIdentifier:@"marketPlacePostCollectionViewCell" forIndexPath:indexPath];
        [cell getData:[_allPostArray objectAtIndex:[_random[indexPath.row] integerValue]]];
        return  cell;
    }
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, marginBetweenTwoItem, marginBetweenTwoItem, marginBetweenTwoItem);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float height = self.contentView.frame.size.height/2;
    float width = self.contentView.frame.size.width *0.9;
    return CGSizeMake(width, height);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storyBoard =[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    if ([[[_allPostArray objectAtIndex:[_random[indexPath.row] integerValue]] valueForKey:@"postType"] isEqualToString:@"Discussion"]) {
        SingleDiscussionPostViewController *discussionVC = [storyBoard instantiateViewControllerWithIdentifier:@"loginVC"];
        [_newsFeed.navigationController pushViewController:discussionVC animated:true];
        
    }else if ([[[_allPostArray objectAtIndex:[_random[indexPath.row] integerValue]]valueForKey:@"postType"]isEqualToString:@"blogPost"]){
        SingleBlogPostViewController *blogVC = [storyBoard instantiateViewControllerWithIdentifier:@"blogVC"];
        [_newsFeed.navigationController pushViewController:blogVC animated:true];
        
    }else{
        SingleMarketPlacePostViewController *marketPlaceVC = [storyBoard instantiateViewControllerWithIdentifier:@"marketVC"];
        [_newsFeed.navigationController pushViewController:marketPlaceVC animated:true];

        
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)randomNumber{
    _random = [[NSMutableArray alloc] init];
    do {
        int i = arc4random() % 20;
        BOOL duplicate = NO;
        for (NSString * j in _random ) {
            if ([j intValue] == i) {
                duplicate = YES;
                break;
            }
        }
        if (duplicate == NO) {
            [_random addObject:[[NSString alloc] initWithFormat:@"%d",i]];
            NSLog(@"%@",_random);
        }
    }while ([_random count] < 20);
        
    
}
@end
