//
//  LandingCommunityTableViewCell.m
//  NeandrTalk
//
//  Created by KterKC on 7/23/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "LandingCommunityTableViewCell.h"
#import "LandingMemberCollectionViewCell.h"
#import "UserModel.h"
#define marginBetweenTwoItem 5

@implementation LandingCommunityTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.collectionMember setDelegate:self];
    [self.collectionMember setDataSource:self];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)getData:(NSArray*)arrayMemeber{
    _arrayMember = [[NSArray alloc ] initWithArray:arrayMemeber];
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_arrayMember count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LandingMemberCollectionViewCell *cell = [_collectionMember dequeueReusableCellWithReuseIdentifier:@"memberCell" forIndexPath:indexPath];
    [cell getDataUser: [_arrayMember objectAtIndex:indexPath.row]];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float height = self.contentView.frame.size.height/2;
    float width = self.contentView.frame.size.width/4;
    return CGSizeMake(width, height);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, marginBetweenTwoItem, marginBetweenTwoItem, marginBetweenTwoItem);
}

@end
