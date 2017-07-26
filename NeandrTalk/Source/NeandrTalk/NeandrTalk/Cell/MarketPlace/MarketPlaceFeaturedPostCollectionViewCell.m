//
//  MarketPlaceFeaturedPostCollectionViewCell.m
//  NeandrTalk
//
//  Created by dankhanh on 7/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "MarketPlaceFeaturedPostCollectionViewCell.h"

@implementation MarketPlaceFeaturedPostCollectionViewCell
-(void)getData:(PostModel *)post{
    self.featuredMarketImage.image = [UIImage imageNamed:post.primaryImage];
    self.featuredMarketTitle.text = post.title;
    self.featuredMarketType.text=[NSString stringWithFormat:@" %@ ",post.marketType];
    self.featuredMarketPrice.text=[NSString stringWithFormat:@" $%@ ",post.price];

}
@end
