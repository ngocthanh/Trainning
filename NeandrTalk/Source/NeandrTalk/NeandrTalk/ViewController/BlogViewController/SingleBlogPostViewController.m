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
#import "PostModel.h"

#define idFeaturedCell @"featuredPostCell"
@interface SingleBlogPostViewController ()
@property (strong,nonatomic) PostModel *post;
@end

@implementation SingleBlogPostViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self parser];
    [self setDataForSinglePost];
    [self.navigationController setNavigationBarHidden:false];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setDataForSinglePost{
    if(!_post)
    {
        _post=[[PostModel alloc] init];
        
    }
    for (_post in _arrayAllPost) {
        if ([_post valueForKey:@"postID"]==_postID) {
            [_blogPostImage setImage:[UIImage imageNamed:_post.primaryImage]];
            _blogPostTitle.text=_post.title;
            _blogPostDescription.text=_post.descriptionPost;
        }
    }
}
-(void)parser{
    ParserService *parser=[[ParserService alloc] init];
    _arrayAllPost =[[NSArray alloc]initWithArray:[parser getList:@"post"]];
    _arrayPostRelated = [_arrayAllPost subarrayWithRange:NSMakeRange(0, 6)];
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
