//
//  AlbumPhotoCollectionViewCell.m
//  Get Photo Facebook
//
//  Created by dankhanh on 6/29/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AlbumPhotoCollectionViewCell.h"
#import "ConstantsSystem.h"
#import "FileManager.h"
#import "LazyLoadingService.h"

@interface AlbumPhotoCollectionViewCell ()
@property (strong, nonatomic) LazyLoadingService *lazy;

@end
@implementation AlbumPhotoCollectionViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
}


-(void)setDataForCellWithUrlImage:(NSString *) urlString IDImage:(NSString *)idImage  CreatedTime:(NSString *)createdTime{
    
    if (_lazy == nil ) {
        _lazy = [[LazyLoadingService alloc] init];
    }
    self.photoInCell.image = [UIImage imageNamed:@"album"];
    [_lazy imageDataWithIDImage:idImage LinkURL:urlString Success:^(NSData *dataImage) {

        if (dataImage) {
                self.photoInCell.image = [UIImage imageWithData:dataImage];
        }else{
            self.photoInCell.image = [UIImage imageNamed:@"album"];

        }
    } Failure:^(NSError *error) {
    }];
    self.created_time.text=createdTime;
}

@end
