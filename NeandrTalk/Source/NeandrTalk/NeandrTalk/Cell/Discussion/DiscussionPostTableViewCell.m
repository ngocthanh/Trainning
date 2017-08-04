//
//  DiscussionPostTableViewCell.m
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "DiscussionPostTableViewCell.h"
#import "ParserService.h"
#import "PostModel.h"
#import "DiscussionPostCollectionViewCell.h"
#import "SingleDiscussionPostViewController.h"


#define idPostCell @"discussionPostCollectionViewCell"
#define postListName @"post"
#define marginBetweenTwoItem 2
@implementation DiscussionPostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self parserPost];
}

-(void) parserPost{
    ParserService *parser=[[ParserService alloc] init];
    _allPostArray =[[NSMutableArray alloc]initWithArray:[parser getList:postListName]];
    _discussionPostArray=[_allPostArray subarrayWithRange:NSMakeRange(8, 6)];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_discussionPostArray count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DiscussionPostCollectionViewCell *cell= [_discussionPostCollectionView dequeueReusableCellWithReuseIdentifier:idPostCell forIndexPath:indexPath];
    [cell getData:[_discussionPostArray objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storyBoard =[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    NSDictionary *itemAtIndexPath=[_discussionPostArray objectAtIndex:indexPath.row];
    SingleDiscussionPostViewController *discussionVC = [storyBoard instantiateViewControllerWithIdentifier:@"loginVC"];
    discussionVC.postID=[itemAtIndexPath valueForKey:@"postID"];
    [_discussionPost.navigationController pushViewController:discussionVC animated:true];
}
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if([segue.identifier isEqualToString:@"toSingleDiscussion"])
//    {
//        NSMutableString *selectedItem=[[_discussionPostArray valueForKey:@"postID"]objectAtIndex:self.selected];
//        SingleDiscussionPostViewController *sigleDiscussionPostVC=[segue destinationViewController];
//        sigleDiscussionPostVC.postID=selectedItem;
//   
//    }
//}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float height = self.contentView.frame.size.height/3;
    float width = self.contentView.frame.size.width *0.9;
    return CGSizeMake(width, height);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, marginBetweenTwoItem, marginBetweenTwoItem, marginBetweenTwoItem);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
