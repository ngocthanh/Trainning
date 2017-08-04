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
#import "PostModel.h"

#define idFeaturedCell @"featuredPostCell"
#define postListName @"post"
#define marginBetweenTwoItem 2
@interface SingleMarketPlacePostViewController ()
@property (strong,nonatomic) PostModel *post;
@property (strong,nonatomic) NSString *description0;
@property (strong,nonatomic) NSString *description1;

@end

@implementation SingleMarketPlacePostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrayTags =[[NSArray alloc] initWithObjects:@"Equipment",@"Supplies",@"Other", nil];
    _arrayImage = [[NSArray alloc] initWithObjects:@"market3",@"markets",@"Farmers_1",@"FarmersMarketBanner",@"food", nil];
    
    [self parser];
    [self.navigationController setNavigationBarHidden:false];
}
-(void)viewWillAppear:(BOOL)animated{
    [self setDataForSinglePost];
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
            _arrayImage=_post.arrayImages;
            _lblTitle.text=_post.title;
            _description0=_post.descriptionPost;
            _descriptionTextView.text = _description0;
            _salePrice.text=_post.price;
            _realPrice.text=_post.price;
            _marketTypeLbl.text=_post.marketType;
        }
    }
}
- (IBAction)segmentTabs:(id)sender {
    if (_descriptionSegment.selectedSegmentIndex == 1) {
        _descriptionTextView.text =@"more......";
    }
    else
    {
        _descriptionTextView.text=_description0;
    }
}

- (IBAction)abtnComment:(id)sender {
}
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    if (tableView == _tableImage) {
//        return 1;
//        
//    }else{
//        return [_arrayTags count];
//    }
//}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if (tableView == _tableImage) {
//        return [_arrayImage count];
//
//    }else{
//        return 1;
//    }
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (tableView == _tableImage) {
//        SinglePostImageTableViewCell *cell = [_tableImage dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
//        [cell getData:_arrayImage[indexPath.row]];
//        return cell;
//
//    }else{
//        TagsPostTableViewCell *cell = [_tableTags dequeueReusableCellWithIdentifier:@"tagCell" forIndexPath:indexPath];
//        [cell getData:_arrayTags[indexPath.section]];
//        return cell;
//    }
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (tableView == _tableImage) {
//        return tableView.frame.size.height/2.5;
//        
//    }else{
//        return tableView.frame.size.height/6;
//    }
//    
//}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *view  = [[UIView alloc] init];
//    view.backgroundColor = [UIColor clearColor];
//    return view;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    
//    if (tableView == _tableTags) {
//       return 5;
//    }
//    return 0;
//}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if ([collectionView isEqual:_collectionRelated]) {
        return [_arrayPostRelated count];
    }
    else{
        return [_arrayImage count];
    }
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([collectionView isEqual:_collectionRelated]) {
        MarketPlaceFeaturedPostCollectionViewCell *cell= [_collectionRelated dequeueReusableCellWithReuseIdentifier:idFeaturedCell forIndexPath:indexPath ];
        [cell getData:[_arrayPostRelated objectAtIndex:indexPath.row]];
        return cell;
    }
    else
    {
        SinglePostImageTableViewCell *cell=[_collectionviewImage dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
        [cell getData:[_arrayImage objectAtIndex:indexPath.row]];
        return cell;
    }

}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 2, 2, 2);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float height = 0.0;
    float width = 0.0;
    if ([collectionView isEqual:_collectionRelated]) {
        height = (self.collectionRelated.frame.size.height*2)/3;
        width = self.collectionRelated.frame.size.width/2;
    }
    else
    {
        height = self.collectionRelated.frame.size.height*9/10;
        width = self.collectionRelated.frame.size.width*9/10;
    }
    
    return CGSizeMake(width, height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
-(void)parser{
    ParserService *parser=[[ParserService alloc] init];
    _arrayAllPost =[[NSArray alloc]initWithArray:[parser getList:postListName]];
    _arrayPostRelated = [_arrayAllPost subarrayWithRange:NSMakeRange(14, 6)];
}
@end
