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
#define idFeaturedCell @"featuredPostCell"

@interface SingleDiscussionPostViewController ()

@end

@implementation SingleDiscussionPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrayImage = [[NSArray alloc] initWithObjects:@"market3",@"markets",@"Farmers_1",@"FarmersMarketBanner",@"food", nil];
    [self parser];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
        
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_arrayImage count];
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        SinglePostImageTableViewCell *cell = [_tableImage dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
        [cell getData:_arrayImage[indexPath.row]];
        return cell;
        
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.frame.size.height/2.5;
        
   
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view  = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(void)parser{
    ParserService *parser=[[ParserService alloc] init];
    _arrayPostRelated =[[NSArray alloc]initWithArray:[parser getList:@"post"]];
    _arrayPostRelated = [_arrayPostRelated subarrayWithRange:NSMakeRange(9, 6)];
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
