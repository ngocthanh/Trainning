//
//  BlogPostTableViewCell.m
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "BlogPostTableViewCell.h"
#import "ParserService.h"
#import "PostModel.h"
#import "BlogPostCollectionViewCell.h"

#define idPostCell @"blogPostCollectionViewCell"
#define postListName @"post"
#define marginBetweenTwoItem 2

@implementation BlogPostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self parserPost];
    
}
-(void) parserPost{
    ParserService *parser=[[ParserService alloc] init];
    _allPostArray =[[NSArray alloc]initWithArray:[parser getList:postListName]];
    _blogPostArray=[_allPostArray subarrayWithRange:NSMakeRange(0, 7)];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_blogPostArray count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BlogPostCollectionViewCell *cell= [_blogPostCollectionView dequeueReusableCellWithReuseIdentifier:idPostCell forIndexPath:indexPath];
    [cell getData:[_blogPostArray objectAtIndex:indexPath.row]];
    
    return cell;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, marginBetweenTwoItem, marginBetweenTwoItem, marginBetweenTwoItem);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float height = self.contentView.frame.size.height/3;
    float width = self.contentView.frame.size.width*0.9;
    return CGSizeMake(width, height);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
