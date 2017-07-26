//
//  BlogHomeTableViewCell.m
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "BlogHomeTableViewCell.h"
#import "ParserService.h"
#import "PostModel.h"
#import "BlogFeaturedPostCollectionViewCell.h"

#define idFeaturedCell @"featuredPostCell"
#define postListName @"post"
#define marginBetweenTwoItem 2
@implementation BlogHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self parserPost];
    
}
-(void) parserPost{
    ParserService *parser=[[ParserService alloc] init];
    _allPostArray =[[NSArray alloc]initWithArray:[parser getList:postListName]];
    _blogPostArray=[_allPostArray subarrayWithRange:NSMakeRange(0, 7)];
    _featuredPostArray=[[NSMutableArray alloc] init];
    for (PostModel *post in _blogPostArray) {
        if ([post.featured isEqualToString:@"1"]) {
            [_featuredPostArray addObject:post];
        }
    }
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_featuredPostArray count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BlogFeaturedPostCollectionViewCell *cell= [_featuredCollectionView dequeueReusableCellWithReuseIdentifier:idFeaturedCell forIndexPath:indexPath ];
    [cell getData:[_featuredPostArray objectAtIndex:indexPath.row]];
    return cell;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, marginBetweenTwoItem, marginBetweenTwoItem, marginBetweenTwoItem);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
