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
        self.tvDescription.text=post.descriptionPost;
    }
    NSMutableString * tagList = [[NSMutableString alloc] init];
    for (NSString *tag in post.arrayTags) {
        if (tag==[post.arrayTags objectAtIndex: 0]) {
            [tagList appendString:tag];
        }
        else
        {
            [tagList appendString:[NSString stringWithFormat:@",%@",tag]];
        }
    }
    self.marketPlaceTagsList.text=[NSString stringWithFormat:@"[%@]",tagList];
    self.numberOfComment.text=[NSString stringWithFormat:@"%lu COMMENTS", (unsigned long)[post.arrayComments count]];
    self.numberOfItem.text=@" 2 items";
    self.contentView.layer.borderWidth=1;
    self.contentView.layer.borderColor=[UIColor blackColor].CGColor;

}
@end
