//
//  MarketPlacePostTableViewCell.m
//  NeandrTalk
//
//  Created by dankhanh on 7/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "MarketPlacePostTableViewCell.h"
#import "ParserService.h"
#import "PostModel.h"
#import "MarketPlacePostCollectionViewCell.h"

#define idPostCell @"marketPlacePostCollectionViewCell"
#define postListName @"post"
#define marginBetweenTwoItem 2
@implementation MarketPlacePostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self parserPost];
}
-(void) parserPost{
    ParserService *parser=[[ParserService alloc] init];
    _allPostArray =[[NSArray alloc]initWithArray:[parser getList:postListName]];
    _marketPlacePostArray=[_allPostArray subarrayWithRange:NSMakeRange(14, 6)];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_marketPlacePostArray count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MarketPlacePostCollectionViewCell *cell= [_marketPlacePostCollectionView dequeueReusableCellWithReuseIdentifier:idPostCell forIndexPath:indexPath];
    [cell getData:[_marketPlacePostArray objectAtIndex:indexPath.row]];
    
    return cell;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, marginBetweenTwoItem, marginBetweenTwoItem, marginBetweenTwoItem);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float height = self.contentView.frame.size.height/2.5;
    float width = self.contentView.frame.size.width *0.9 ;
    return CGSizeMake(width, height);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
