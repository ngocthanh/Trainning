//
//  LandingTypePostTableViewCell.m
//  NeandrTalk
//
//  Created by KterKC on 7/23/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "LandingTypePostTableViewCell.h"
#import "LandingPagePostCollectionViewCell.h"
#define marginBetweenTwoItem 5

@implementation LandingTypePostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.postCollection setDelegate:self];
    [self.postCollection setDataSource:self];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
-(void)getDataWithTitleTypePost:(NSString*)titleType Posts:(NSArray*)posts{
    _titleTypePost.text = titleType;
    _dataPosts = [[NSArray alloc] initWithArray:posts];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_dataPosts count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LandingPagePostCollectionViewCell *cell = [_postCollection dequeueReusableCellWithReuseIdentifier:@"landingPostCell" forIndexPath:indexPath];
    [cell getData:_dataPosts[indexPath.row]];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float height = self.contentView.frame.size.height/2;
    float width = self.contentView.frame.size.width/2;
    return CGSizeMake(width, height);
}
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(0, marginBetweenTwoItem, marginBetweenTwoItem, marginBetweenTwoItem);
//}

@end
