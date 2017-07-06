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
-(void)setImageWithURLImage:(NSString *) urlString IDImage:(NSString *)idImage;
-(void)dataForOriginalPhoto:(NSString *) urlString IDImage:(NSString *)idImage Success:(void(^)(NSData* dataImage))success Failure:(void(^)(NSError *error))failure;
@end
