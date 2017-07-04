//
//  AlbumPhotoViewController.m
//  Get Photo Facebook
//
//  Created by dankhanh on 6/29/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AlbumPhotoViewController.h"
#import "AlbumPhotoCollectionViewCell.h"
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
    [_cell setDataOfPhotoForCellWithLink:[[_arrayPhotos valueForKey:@"linkThumbPhoto"] objectAtIndex:indexPath.row]];
    
    return _cell;
}

@end
