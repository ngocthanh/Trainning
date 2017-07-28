//
//  SingleBlogPostViewController.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "SingleBlogPostViewController.h"
#import "SingleDiscussionPostViewController.h"
#import "SinglePostImageTableViewCell.h"
#import "ParserService.h"
#import "DiscussionFeaturedPostCollectionViewCell.h"
#define idFeaturedCell @"featuredPostCell"
@interface SingleBlogPostViewController ()

@end

@implementation SingleBlogPostViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    _arrayImage = [[NSArray alloc] initWithObjects:@"market3",@"markets",@"Farmers_1",@"FarmersMarketBanner",@"food", nil];
    [self parser];
    [self.navigationController setNavigationBarHidden:false];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)parser{
    ParserService *parser=[[ParserService alloc] init];
    _arrayPostRelated =[[NSArray alloc]initWithArray:[parser getList:@"post"]];
    _arrayPostRelated = [_arrayPostRelated subarrayWithRange:NSMakeRange(0, 6)];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_arrayPostRelated count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DiscussionFeaturedPostCollectionViewCell *cell= [_collectionRelated dequeueReusableCellWithReuseIdentifier:idFeaturedCell forIndexPath:indexPath ];
    [cell getData:[_arrayPostRelated objectAtIndex:indexPath.row]];
    return cell;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 2, 2, 2);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float height = (self.collectionRelated.frame.size.height*2)/3;
    float width = self.collectionRelated.frame.size.width/2;
    return CGSizeMake(width, height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}


@end
