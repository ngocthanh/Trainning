//
//  AlbumPhotoViewController.m
//  Get Photo Facebook
//
//  Created by dankhanh on 6/29/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AlbumPhotoViewController.h"
#import "AlbumPhotoCollectionViewCell.h"

@interface AlbumPhotoViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *photoAlbum;
@end
@implementation AlbumPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AlbumPhotoCollectionViewCell *cellForCollectionView = [_photoAlbum dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    return cellForCollectionView;
}

@end
