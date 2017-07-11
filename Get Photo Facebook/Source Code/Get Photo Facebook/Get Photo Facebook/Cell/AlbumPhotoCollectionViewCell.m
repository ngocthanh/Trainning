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
@implementation AlbumPhotoCollectionViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
}
-(void)setDataForCellWithUrlImage:(NSString *) urlString IDImage:(NSString *)idImage  CreatedTime:(NSString *)createdTime{
    LazyLoadingService *lazy = [LazyLoadingService new];
    [lazy imageDataWithIDImage:idImage LinkURL:urlString Success:^(NSData *dataImage) {
        if (dataImage) {
                self.photoInCell.image = [[UIImage alloc] initWithData:dataImage];
        }
    } Failure:^(NSError *error) {
    }];
    self.created_time.text=createdTime;
}

@end
