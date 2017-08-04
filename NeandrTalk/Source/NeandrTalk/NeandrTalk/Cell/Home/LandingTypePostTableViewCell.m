//
//  LandingTypePostTableViewCell.m
//  NeandrTalk
//
//  Created by KterKC on 7/23/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "LandingTypePostTableViewCell.h"
#import "LandingPagePostCollectionViewCell.h"
#import "SingleDiscussionPostViewController.h"
#import "SingleBlogPostViewController.h"
#import "SingleMarketPlacePostViewController.h"


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
-(void)getDataWithTitleTypePost:(NSString*)titleType Posts:(NSArray*)posts View:(LandingPageViewController*) vc{
    _titleTypePost.text = titleType;
    _dataPosts = [[NSArray alloc] initWithArray:posts];
    _home = vc;
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
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storyBoard =[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    if ([_titleTypePost.text  isEqual: @"Discussion"]) {
        SingleDiscussionPostViewController *discussionVC = [storyBoard instantiateViewControllerWithIdentifier:@"loginVC"];
        discussionVC.postID=[[_dataPosts valueForKey:@"postID"] objectAtIndex:indexPath.row];
        [_home.navigationController pushViewController:discussionVC animated:true];
        
    }else if ([_titleTypePost.text  isEqual: @"Market Place"]){
        SingleMarketPlacePostViewController *marketPlaceVC = [storyBoard instantiateViewControllerWithIdentifier:@"marketVC"];
        marketPlaceVC.postID=[[_dataPosts valueForKey:@"postID"] objectAtIndex:indexPath.row];
        [_home.navigationController pushViewController:marketPlaceVC animated:true];
        
    }else{
        SingleBlogPostViewController *blogVC = [storyBoard instantiateViewControllerWithIdentifier:@"blogVC"];
        blogVC.postID=[[_dataPosts valueForKey:@"postID"] objectAtIndex:indexPath.row];
        [_home.navigationController pushViewController:blogVC animated:true];
        
    }
}
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(0, marginBetweenTwoItem, marginBetweenTwoItem, marginBetweenTwoItem);
//}

@end
