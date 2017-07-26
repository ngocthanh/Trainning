//
//  MarketPlacePostCollectionViewCell.h
//  NeandrTalk
//
//  Created by dankhanh on 7/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostModel.h"
@interface MarketPlacePostCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *marketPostImage;
@property (weak, nonatomic) IBOutlet UITableView *tableTags;
@property (weak, nonatomic) IBOutlet UILabel *marketPostTitle;
@property (weak, nonatomic) IBOutlet UILabel *marketPostDescription;
@property (weak, nonatomic) IBOutlet UILabel *marketPostPrice;
@property (weak, nonatomic) IBOutlet UILabel *marketPostType;
-(void)getData:(PostModel *)post;
@end
