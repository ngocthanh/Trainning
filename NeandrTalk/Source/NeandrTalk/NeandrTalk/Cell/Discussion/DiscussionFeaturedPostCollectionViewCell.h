//
//  DiscussionFeaturedPostCollectionViewCell.h
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostModel.h"
@interface DiscussionFeaturedPostCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *featuredPostImage;
@property (weak, nonatomic) IBOutlet UILabel *featuredPostTitle;
@property (weak, nonatomic) IBOutlet UILabel *featurePostDescription;
@property (weak, nonatomic) IBOutlet UITableView *tableTags;
-(void)getData:(PostModel *)post;
@end
