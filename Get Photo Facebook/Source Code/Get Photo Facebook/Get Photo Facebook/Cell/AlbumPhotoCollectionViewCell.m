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
@implementation AlbumPhotoCollectionViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)setDataOfPhotoForCellWithLink:(NSString *) linkPhoto {
    if (![linkPhoto   isEqual: textIsEmpty]) {
        NSURL *url = [NSURL URLWithString:[[NSString alloc]  initWithString:linkPhoto]];
        NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (data) {
                UIImage *image = [UIImage imageWithData:data];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.photoInCell.image = image;
                    });
                }
            }
        }];
        [task resume];
    }
}


@end
