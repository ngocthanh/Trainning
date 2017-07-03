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
@property (strong,nonatomic) NSMutableArray *arrayPhotos;
@end
@implementation AlbumPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrayPhotos=[NSMutableArray new];
    _service=[[Service alloc]init];
    [self GetPhoto]; 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
-(void)GetPhoto{
    
   [_service PhotoOfUser:^(NSArray *arrayPhotos) {
       _arrayPhotos=[[NSMutableArray alloc ] initWithArray:arrayPhotos];
   } failure:^(NSError *error) {
       NSLog(@"------");
   }];
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
