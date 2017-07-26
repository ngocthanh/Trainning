//
//  MarketPlacePostCollectionViewCell.m
//  NeandrTalk
//
//  Created by dankhanh on 7/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "MarketPlacePostCollectionViewCell.h"

@implementation MarketPlacePostCollectionViewCell
-(void)getData:(PostModel *)post{
    self.marketPostImage.image = [UIImage imageNamed:post.primaryImage];
    self.marketPostTitle.text = post.title;
    self.marketPostType.text=[NSString stringWithFormat:@" %@ ",post.marketType];
    self.marketPostPrice.text=[NSString stringWithFormat:@"Price: $%@",post.price];
    if (post.descriptionPost!=nil) {
        self.marketPostDescription.text=post.descriptionPost;
    }
}
@end
