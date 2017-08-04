//
//  SingleDiscussionPostViewController.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "SingleDiscussionPostViewController.h"
#import "SinglePostImageTableViewCell.h"
#import "ParserService.h"
#import "DiscussionFeaturedPostCollectionViewCell.h"
#import "PostModel.h"
#define idFeaturedCell @"featuredPostCell"

@interface SingleDiscussionPostViewController ()
@property (strong,nonatomic) PostModel* post;
@end

@implementation SingleDiscussionPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrayImage = [[NSArray alloc] init];
    [self parser];
    
    [self.navigationController setNavigationBarHidden:false];
}
-(void)viewWillAppear:(BOOL)animated{
    [self setDataForSinglePost];
}
-(void)setDataForSinglePost{
    if(!_post)
    {
        _post=[[PostModel alloc] init];
        
    }
    for (_post in _arrayAllPost) {
        if ([_post valueForKey:@"postID"]==_postID) {
            _arrayImage=_post.arrayImages;
            _discussionTitle.text=_post.title;
            _discussionDescription.text=_post.descriptionPost;
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)parser{
    ParserService *parser=[[ParserService alloc] init];
    _arrayAllPost=[[NSArray alloc]initWithArray:[parser getList:@"post"]];
    _arrayPostRelated = [_arrayAllPost subarrayWithRange:NSMakeRange(9, 6)];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if ([collectionView isEqual:_collectionRelated]) {
        return [_arrayPostRelated count];
    }
    else if ([collectionView isEqual:_collectionImage]){
        return [_arrayImage count];
    }
    else
    {
        return 0;
    }
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([collectionView isEqual:_collectionRelated]) {
        DiscussionFeaturedPostCollectionViewCell *cell= [_collectionRelated dequeueReusableCellWithReuseIdentifier:idFeaturedCell forIndexPath:indexPath ];
        [cell getData:[_arrayPostRelated objectAtIndex:indexPath.row]];
        return cell;
    }
    else
    {
        SinglePostImageTableViewCell *cell=[_collectionImage dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
        [cell getData:[_arrayImage objectAtIndex:indexPath.row]];
        return cell;
    }
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 2, 2, 2);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float height;
    float width;
    if ([collectionView isEqual:_collectionRelated]) {
        height = (self.collectionRelated.frame.size.height*2)/3;
        width = self.collectionRelated.frame.size.width/2;
    }
    else{
        if ([_arrayImage count]>1) {
            height = self.collectionImage.frame.size.height*9/10;
            width = self.collectionImage.frame.size.width*9/10;
        }
        else
        {
            height = self.collectionImage.frame.size.height;
            width = self.collectionImage.frame.size.width;
        }

    }
    return CGSizeMake(width, height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}


@end
