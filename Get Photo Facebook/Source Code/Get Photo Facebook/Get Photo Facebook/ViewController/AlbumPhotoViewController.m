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
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    CGPoint touchPoint = [sender convertPoint:CGPointZero toView:_photoAlbum]; // maintable --> replace your tableview name
    NSIndexPath *clickedButtonIndexPath = [_photoAlbum indexPathForItemAtPoint:touchPoint];
    
    NSString *idPhoto =[[_arrayPhotos valueForKey:@"idPhoto"] objectAtIndex:clickedButtonIndexPath.row];
    NSString *linkOri = [[_arrayPhotos valueForKey:@"linkOriPhoto"] objectAtIndex:clickedButtonIndexPath.row];
    
    if ([segue.identifier isEqualToString:@"segueDetailPhoto"]) {
        DetailPhotoViewController *detail = (DetailPhotoViewController*)segue.destinationViewController;
        [_cell DataForOriginalPhoto:linkOri IDImage:idPhoto Success:^(NSData *dataImage) {
            detail.dataImage =dataImage;
            
        } Failure:^(NSError *error) {
            
        }];

    }
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.view.frame.size.width - 40 )/3, (self.view.frame.size.height )/5);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
@end
