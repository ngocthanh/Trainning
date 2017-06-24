//
//  DiscoverCollectionViewCell.h
//  DiscoverCollectionView
//
//  Created by KterKC on 6/8/17.
//  Copyright © 2017 KterKC. All rights reserved.
//


#import "DefineColor.h"
@interface DiscoverCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property NSString * linkNews;
-(void)getDataForImageAndTitle:(NSString*) title Time:(NSString*) time Description:(NSString*) description LinkURLImage:(NSString*) linkurl LinkNews:(NSString*) linknews;

@end
