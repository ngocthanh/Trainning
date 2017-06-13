//
//  HomeViewController.m
//  DiscoverCollectionView
//
//  Created by KterKC on 6/12/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "HomeViewController.h"
#import "DiscoverCollectionViewCell.h"
#import <UIKit/UICollectionViewFlowLayout.h>
#import "CollectionReusableView.h"
#import "ModelRequest.h"
@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *discoverCollectionView;
@property (strong, nonatomic) DiscoverCollectionViewCell *cell;
@property (strong, nonatomic) NSArray *imageName;
@property (strong, nonatomic) NSArray *name;
@property (strong,nonatomic) UICollectionViewFlowLayout *flow;
@property (strong, nonatomic) NSArray *nameSection;
@property (strong, nonatomic) ModelRequest *model;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.0 green:0.65 blue:0.35 alpha:1];
    _nameSection = [NSArray arrayWithObjects:@"Trang Chủ",@"Số Hoá",@"Thể Thao",@"Giáo Dục",@"Xe", nil];
    [[self navigationItem] setTitle:@"VN Express"];
    _name = [NSArray arrayWithObjects:@"CocaCola",@"CocaCola",@"CocaCola",@"CocaCola",@"CocaCola",@"CocaCola", nil];
    _imageName = [NSArray arrayWithObjects:@"batman-silhouette-variant",@"circular-arrow",@"japanese-dragon",@"iris",@"cat",@"eye", nil];
    [_discoverCollectionView registerNib:[UINib nibWithNibName:@"DiscoverCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"homecell"];
    [_discoverCollectionView registerNib:[UINib nibWithNibName:@"CollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"supplementHome"];
    _model = [ModelRequest alloc];
    [_model getConnection:@"tin-moi-nhat.rss"];
    _cell = [DiscoverCollectionViewCell alloc];
    [_discoverCollectionView setDelegate:self];
    [_discoverCollectionView setDataSource:self];
    
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return _nameSection.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    _cell = [_discoverCollectionView dequeueReusableCellWithReuseIdentifier:@"homecell" forIndexPath: indexPath];
    [_cell getDataForImageAndLabel:_imageName[indexPath.row] Title:_name[indexPath.row] Time:_name[indexPath.row] Description:_name[indexPath.row]];
    
    return _cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview;
    CollectionReusableView *collectionSection = [_discoverCollectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"supplementHome" forIndexPath:indexPath];
    [collectionSection getDataForTitleSection:_nameSection[indexPath.section]];
    reusableview=collectionSection;
    return reusableview;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.view.frame.size.width - 30)/2, self.view.frame.size.height/3);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}




@end
