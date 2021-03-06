//
//  MarketPlaceFeaturedPostCollectionViewCell.h
//  NeandrTalk
//
//  Created by dankhanh on 7/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostModel.h"
@interface MarketPlaceFeaturedPostCollectionViewCell : UICollectionViewCell <UITableViewDelegate ,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *featuredMarketType;
@property (weak, nonatomic) IBOutlet UIImageView *featuredMarketImage;
@property (weak, nonatomic) IBOutlet UITableView *tableTags;
@property (weak, nonatomic) IBOutlet UILabel *featuredMarketPrice;
@property (weak, nonatomic) IBOutlet UILabel *featuredMarketTitle;
@property (strong, nonatomic) NSArray *arrayTag;
@property CGFloat height;
-(void)getData:(PostModel *)post;
@end
