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
#import "Service.h"
#import "Helper.h"
@interface AlbumPhotoViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *photoAlbum;
@property (strong,nonatomic) Service *service;
@property (strong,nonatomic) NSArray *arrayPhotos;
@property (strong,nonatomic) AlbumPhotoCollectionViewCell *cell;
@end
@implementation AlbumPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrayPhotos=[NSMutableArray new];
    _service=[[Service alloc]init];
    [self getIdAndLinkOfPhoto];
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
    _cell = [[AlbumPhotoCollectionViewCell alloc] init];
    _cell = [_photoAlbum dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    NSString *linkThumblr = [[_arrayPhotos valueForKey:@"linkThumbPhoto"] objectAtIndex:indexPath.row];
    NSString *idPhoto =[[_arrayPhotos valueForKey:@"idPhoto"] objectAtIndex:indexPath.row];
    [_cell setDataFromViewControllerWithURLImage: linkThumblr
                                                  IDImage:idPhoto];
    
    return _cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storyBoard =[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    DetailPhotoViewController *deTailPhotoVC=[storyBoard instantiateViewControllerWithIdentifier:@"detailPhoto"];
    [self.navigationController pushViewController:deTailPhotoVC animated:YES];

}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.view.frame.size.width - 40 )/3, (self.view.frame.size.height )/5);
}

@end
