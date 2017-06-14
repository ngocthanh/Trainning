//
//  DiscoverCollectionViewCell.h
//  DiscoverCollectionView
//
//  Created by KterKC on 6/8/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoverCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
-(void)getDataForImageAndTitle:(NSString*) title Time:(NSString*) time Description:(NSString*) description LinkURLImage:(NSString*) linkurl;

@end
