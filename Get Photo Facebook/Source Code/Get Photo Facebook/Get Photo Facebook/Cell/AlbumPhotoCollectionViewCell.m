//
//  AlbumPhotoCollectionViewCell.m
//  Get Photo Facebook
//
//  Created by dankhanh on 6/29/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AlbumPhotoCollectionViewCell.h"
#import "ConstantsSystem.h"
@implementation AlbumPhotoCollectionViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
}
-(void)setDataOfPhotoForCellWithLink:(NSString *) linkPhoto {
    if(![linkPhoto isEqualToString:textIsEmpty])
    {
        NSURL *urlOfPhoto=[NSURL URLWithString:[[NSString alloc]  initWithString:linkPhoto]];
        NSURLSessionTask *task=[[NSURLSession sharedSession] dataTaskWithURL:urlOfPhoto completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (data) {
                UIImage *photo = [UIImage imageWithData:data];
                if (photo) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.photoInCell.image=photo;
                    });
                }
            }
        }];
        [task resume];

    }
}
@end
