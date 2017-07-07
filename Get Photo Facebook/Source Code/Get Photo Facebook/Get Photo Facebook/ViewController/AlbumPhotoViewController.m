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
@property (strong,nonatomic) NSArray *arrayPhotos;
@property (strong,nonatomic) AlbumPhotoCollectionViewCell *cell;
@property (strong,nonatomic) Helper *helper;
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
    _cell = [AlbumPhotoCollectionViewCell alloc];
    _helper=[[Helper alloc] init];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
-(void)getIdAndLinkOfPhoto{
    
   [_service getUrlOfPhoto:^(NSArray *arraySourcePhotoWithLargestSize) {
       _arrayPhotos = arraySourcePhotoWithLargestSize;
       [_photoAlbum reloadData];
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
    // check logic code
    _cell = [_photoAlbum dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    // check name function method
    PhotoOfUser *photoOfUser = [_arrayPhotos objectAtIndex:indexPath.row];
    NSString *linkThumblr =  photoOfUser.linkThumbPhoto;
    NSString *idPhoto = [_helper setUpNameForImageAsThumb:photoOfUser.idPhoto ];
    NSString *createdTimeOfPhoto=[_helper formatDateForCell:photoOfUser.created_time];
    [_cell setDataForCellWithUrlImage: linkThumblr IDImage:idPhoto CreatedTime:createdTimeOfPhoto];
    return _cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoOfUser *photoOfUser = [_arrayPhotos objectAtIndex:indexPath.row];
    UIStoryboard *storyBoard =[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    DetailPhotoViewController *detail = [storyBoard instantiateViewControllerWithIdentifier:@"detailPhoto"];
    detail.photoUser = photoOfUser;
    [self.navigationController pushViewController:detail animated:YES];
    

}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.view.frame.size.width - 41 )/3, (self.view.frame.size.height )/5);
}

@end
