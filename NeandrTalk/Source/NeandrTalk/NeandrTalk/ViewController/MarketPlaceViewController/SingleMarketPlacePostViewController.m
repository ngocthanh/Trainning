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
    [self.navigationController setNavigationBarHidden:false];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)segmentTabs:(id)sender {
    if (_descriptionSegment.selectedSegmentIndex == 1) {
        _descriptionTextView.text = @"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum.\n\nAliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat. \n\nPraesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.";
    }else{
        _descriptionTextView.text =@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";
    }
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
        return tableView.frame.size.height/2.5;
        
    }else{
        return tableView.frame.size.height/6;
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view  = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (tableView == _tableTags) {
       return 5;
    }
    return 0;
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
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float height = (self.collectionRelated.frame.size.height*2)/3;
    float width = self.collectionRelated.frame.size.width/2;
    return CGSizeMake(width, height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
-(void)parser{
    _tableTags.backgroundColor = nil;

    ParserService *parser=[[ParserService alloc] init];
    _arrayPostRelated =[[NSArray alloc]initWithArray:[parser getList:postListName]];
    _arrayPostRelated = [_arrayPostRelated subarrayWithRange:NSMakeRange(14, 6)];
}
@end
