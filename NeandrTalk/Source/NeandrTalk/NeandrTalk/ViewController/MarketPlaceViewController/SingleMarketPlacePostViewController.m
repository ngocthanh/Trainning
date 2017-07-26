//
//  SingleMarketPlacePostViewController.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "SingleMarketPlacePostViewController.h"
#import "SinglePostImageTableViewCell.h"
#import "TagsPostTableViewCell.h"
#import "ParserService.h"
#import "MarketPlaceFeaturedPostCollectionViewCell.h"

#define idFeaturedCell @"featuredPostCell"
#define postListName @"post"
#define marginBetweenTwoItem 2
@interface SingleMarketPlacePostViewController ()

@end

@implementation SingleMarketPlacePostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrayTags =[[NSArray alloc] initWithObjects:@"Equipment",@"Supplies",@"Other", nil];
    _arrayImage = [[NSArray alloc] initWithObjects:@"market3",@"markets",@"Farmers_1",@"FarmersMarketBanner",@"food", nil];
    [self parser];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)abtnComment:(id)sender {
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == _tableImage) {
        return 1;
        
    }else{
        return [_arrayTags count];
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _tableImage) {
        return [_arrayImage count];

    }else{
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _tableImage) {
        SinglePostImageTableViewCell *cell = [_tableImage dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
        [cell getData:_arrayImage[indexPath.row]];
        return cell;

    }else{
        TagsPostTableViewCell *cell = [_tableTags dequeueReusableCellWithIdentifier:@"tagCell" forIndexPath:indexPath];
        [cell getData:_arrayTags[indexPath.section]];
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _tableImage) {
        return tableView.frame.size.height/3;
        
    }else{
        return tableView.frame.size.height/4;
    }
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_arrayPostRelated count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MarketPlaceFeaturedPostCollectionViewCell *cell= [_collectionRelated dequeueReusableCellWithReuseIdentifier:idFeaturedCell forIndexPath:indexPath ];
    [cell getData:[_arrayPostRelated objectAtIndex:indexPath.row]];
    return cell;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 2, 2, 2);
}
-(void)parser{
    ParserService *parser=[[ParserService alloc] init];
    _arrayPostRelated =[[NSArray alloc]initWithArray:[parser getList:postListName]];
    _arrayPostRelated = [_arrayPostRelated subarrayWithRange:NSMakeRange(14, 6)];
}
@end
