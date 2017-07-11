//
//  AlbumPhotoViewController.m
//  Get Photo Facebook
//
//  Created by dankhanh on 6/29/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AlbumPhotoViewController.h"
#import "AlbumPhotoCollectionViewCell.h"
#import "DetailPhotoViewController.h"
#import "LazyLoadingService.h"
#import "Service.h"
#import "Helper.h"
@interface AlbumPhotoViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *photoAlbum;
@property (strong,nonatomic) Service *service;
@property (strong,nonatomic) NSMutableArray *arrayPhotos;
@property (strong,nonatomic) AlbumPhotoCollectionViewCell *cell;
@property (strong,nonatomic) Helper *helper;
@property (strong, nonatomic) NSString* codeOfNextPage;

#define nameOfCell @"photoCell"
#define storyBoardName @"Main"
#define identifierOfDetailPhotoView @"detailPhoto"
#define oneUnit 1
#define widthOfMargin 41
#define widthOfItemInRow 3
#define marginBetweenTwoItem 10
#define ratioByWidth 3/4

@end
@implementation AlbumPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self classesInit];
    [self getIdAndLinkOfPhoto];
}
-(void)classesInit{
    _arrayPhotos=[[NSMutableArray alloc] init];
    _service=[[Service alloc]init];
    _cell = [[AlbumPhotoCollectionViewCell alloc] init];
    _helper=[[Helper alloc] init];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)getIdAndLinkOfPhoto{
    [_service getUrlOfPhotoWithLinkAfter:nil Success:^(NSArray *arraySourcePhotoWithLargestSize) {
        _arrayPhotos = arraySourcePhotoWithLargestSize;
        [_photoAlbum reloadData];
    } failure:^(NSError *error) {
        
    }];
    [_service getCodeNextPage:nil Success:^(NSString *linkNextPage) {
        _codeOfNextPage = linkNextPage;
    } failure:^(NSError *error) {
        
    }];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_arrayPhotos count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    _cell = [_photoAlbum dequeueReusableCellWithReuseIdentifier:nameOfCell forIndexPath:indexPath];
    PhotoOfUser *photoOfUser = [_arrayPhotos objectAtIndex:indexPath.row];
    NSString *linkThumblr =  photoOfUser.linkThumbPhoto;
    NSString *idPhoto = [_helper setUpNameForImageAsThumb:photoOfUser.idPhoto ];
    NSString *createdTimeOfPhoto=[_helper formatDateForCell:photoOfUser.created_time];
    
    if (indexPath.row == [_arrayPhotos count]-oneUnit && _codeOfNextPage != nil) {
        [_service loadMoreURLWithLinkAfter:_codeOfNextPage Success:^(NSArray *arraySourcePhotoWithLargestSize) {
            [_arrayPhotos addObjectsFromArray:arraySourcePhotoWithLargestSize];
            [_cell setDataForCellWithUrlImage:linkThumblr IDImage:idPhoto CreatedTime:createdTimeOfPhoto];
            [self.photoAlbum reloadData];
            [_service getCodeNextPage:_codeOfNextPage Success:^(NSString *linkNextPage) {
                _codeOfNextPage = linkNextPage;
            } failure:^(NSError *error) {
                
            }];
        } Failure:^(NSError *error) {
            
        }];
    }
    else
    {
        [_cell setDataForCellWithUrlImage: linkThumblr IDImage:idPhoto CreatedTime:createdTimeOfPhoto];
    }
    
    return _cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoOfUser *photoOfUser = [_arrayPhotos objectAtIndex:indexPath.row];
    UIStoryboard *storyBoard =[UIStoryboard storyboardWithName:storyBoardName bundle:[NSBundle mainBundle]];
    DetailPhotoViewController *detail = [storyBoard instantiateViewControllerWithIdentifier:identifierOfDetailPhotoView];
    detail.photoUser = photoOfUser;
    [self.navigationController pushViewController:detail animated:YES];
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(marginBetweenTwoItem, marginBetweenTwoItem, marginBetweenTwoItem, marginBetweenTwoItem);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.view.frame.size.width - widthOfMargin )/widthOfItemInRow, (self.view.frame.size.width - widthOfMargin)/widthOfItemInRow*ratioByWidth);
}

@end
