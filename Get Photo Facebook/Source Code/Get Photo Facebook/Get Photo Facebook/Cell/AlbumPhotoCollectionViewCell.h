//
//  AlbumPhotoCollectionViewCell.h
//  Get Photo Facebook
//
//  Created by dankhanh on 6/29/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumPhotoCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoInCell;
@property (weak, nonatomic) IBOutlet UILabel *created_time;
-(void)setDataForCellWithUrlImage:(NSString *) urlString IDImage:(NSString *)idImage  CreatedTime:(NSString *)createdTime ;
@end
