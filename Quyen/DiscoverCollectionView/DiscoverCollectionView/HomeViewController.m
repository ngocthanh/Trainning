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
@property (weak,   nonatomic) IBOutlet UICollectionView *discoverCollectionView;
@property (strong, nonatomic) DiscoverCollectionViewCell *cell;
@property (strong, nonatomic) NSArray *imageName;
@property (strong, nonatomic) UICollectionViewFlowLayout *flow;
@property (strong, nonatomic) NSArray *nameSection;
@property (strong, nonatomic) ModelRequest *model;
@property (strong, nonatomic) NSMutableArray *allArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.discoverCollectionView.alwaysBounceVertical = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.6 green:0.01 blue:0.3 alpha:1];
    _nameSection = [NSArray arrayWithObjects:@"Trang Chủ",@"Số Hoá",@"Thể Thao",@"Giáo Dục",@"Xe", nil];
    [[self navigationItem] setTitle:@"VN Express"];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [_discoverCollectionView registerNib:[UINib nibWithNibName:@"DiscoverCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"homecell"];
    [_discoverCollectionView registerNib:[UINib nibWithNibName:@"CollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"supplementHome"];
    
    _model = [ModelRequest alloc];
    _allArray = [[NSMutableArray alloc] init];
    [_discoverCollectionView layoutIfNeeded];
    [_allArray addObject:[_model getConnection:@"tin-moi-nhat.rss"]];
    [_allArray addObject:[_model getConnection:@"so-hoa.rss"]];
    [_allArray addObject:[_model getConnection:@"the-thao.rss"]];
    [_allArray addObject:[_model getConnection:@"giao-duc.rss"]];
    [_allArray addObject:[_model getConnection:@"oto-xe-may.rss"]];
    _cell = [DiscoverCollectionViewCell alloc];
    [_discoverCollectionView setDelegate:self];
    [_discoverCollectionView setDataSource:self];
    
    
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_model.arrayData count];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    

    return [self.nameSection count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    _cell = [_discoverCollectionView dequeueReusableCellWithReuseIdentifier:@"homecell" forIndexPath: indexPath];
    //[_model setArrayDataForCollectionView:indexPath.row];
    


    ;
    NSLog(@"%ld",(long)indexPath.row)  ;
    [_cell getDataForImageAndTitle:[[[_allArray objectAtIndex:indexPath.section] objectAtIndex:0]objectAtIndex:indexPath.row]
                              Time:[[[_allArray objectAtIndex:indexPath.section] objectAtIndex:1]objectAtIndex:indexPath.row]
                       Description:[[[_allArray objectAtIndex:indexPath.section] objectAtIndex:2]objectAtIndex:indexPath.row]
                      LinkURLImage:[[[_allArray objectAtIndex:indexPath.section] objectAtIndex:3]objectAtIndex:indexPath.row]
     ];
   
    return _cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview;
    CollectionReusableView *collectionSection = [_discoverCollectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"supplementHome" forIndexPath:indexPath];
    [collectionSection getDataForTitleSection:_nameSection[indexPath.section]];
    
    reusableview = collectionSection;
        return reusableview;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.view.frame.size.width - 30)/2, self.view.frame.size.height/3);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}






@end
