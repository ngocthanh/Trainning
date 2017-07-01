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
-(void)setDataOfPhotoForCellWithLink:(NSString *) linkPhoto;
@end
