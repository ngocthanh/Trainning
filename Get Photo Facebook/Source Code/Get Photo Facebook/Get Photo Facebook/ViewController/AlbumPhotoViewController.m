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

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    CGPoint touchPoint = [sender convertPoint:CGPointZero toView:_photoAlbum]; // maintable --> replace your tableview name
    NSIndexPath *clickedButtonIndexPath = [_photoAlbum indexPathForItemAtPoint:touchPoint];
   //check stucture arrayphotos
    PhotoOfUser *photoOfUser = [_arrayPhotos objectAtIndex:clickedButtonIndexPath.row];
    NSString *idPhoto = photoOfUser.idPhoto;
    NSString *linkOri = photoOfUser.linkOriPhoto;

    
    if ([segue.identifier isEqualToString:@"segueDetailPhoto"]) {
        DetailPhotoViewController *detail = (DetailPhotoViewController*)segue.destinationViewController;

        [[[Helper alloc] init] lazyLoadingForImage:linkOri IDImage:idPhoto Success:^(NSData *dataImage) {
            if (dataImage) {
                UIImage *image = [UIImage imageWithData:dataImage];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        detail.image.image = image;
                    });
                }
            }
        } Failure:^(NSError *error) {
            
        }];
        
    }
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.view.frame.size.width - 41 )/3, (self.view.frame.size.height )/5);
}

@end
