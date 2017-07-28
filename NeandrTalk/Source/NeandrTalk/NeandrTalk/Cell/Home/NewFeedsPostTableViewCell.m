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

#define postListName @"post"
#define marginBetweenTwoItem 2
@implementation NewFeedsPostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self parserPost];
}
-(void) parserPost{
    ParserService *parser=[[ParserService alloc] init];
    _allPostArray =[[NSArray alloc]initWithArray:[parser getList:postListName]];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_allPostArray count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    int i = arc4random() %20;
    if ([[[_allPostArray objectAtIndex:i] valueForKey:@"postType"] isEqualToString:@"blogPost"]) {
        BlogPostCollectionViewCell *cell=[_newfeedCollectionView dequeueReusableCellWithReuseIdentifier:@"blogPostCollectionViewCell" forIndexPath:indexPath];
        [cell getData:[_allPostArray objectAtIndex:i]];
        
        return cell;
    }
    else if ([[[_allPostArray objectAtIndex:i]valueForKey:@"postType"]isEqualToString:@"Discussion"]){
        DiscussionPostCollectionViewCell *cell=[_newfeedCollectionView dequeueReusableCellWithReuseIdentifier:@"discussionPostCollectionViewCell" forIndexPath:indexPath];
        [cell getData:[_allPostArray objectAtIndex:i]];
        return cell;
    }
    else
    {
        MarketPlacePostCollectionViewCell *cell=[_newfeedCollectionView dequeueReusableCellWithReuseIdentifier:@"marketPlacePostCollectionViewCell" forIndexPath:indexPath];
        [cell getData:[_allPostArray objectAtIndex:i]];
        return  cell;
    }
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, marginBetweenTwoItem, marginBetweenTwoItem, marginBetweenTwoItem);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float height = self.contentView.frame.size.height/2;
    float width = self.contentView.frame.size.width;
    return CGSizeMake(width, height);
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
