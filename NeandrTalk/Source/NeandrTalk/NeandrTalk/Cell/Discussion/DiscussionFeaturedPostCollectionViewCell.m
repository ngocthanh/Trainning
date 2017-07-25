//
//  DiscussionFeaturedPostCollectionViewCell.m
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "DiscussionFeaturedPostCollectionViewCell.h"

@implementation DiscussionFeaturedPostCollectionViewCell
-(void)getData:(PostModel *)post{
    self.featuredPostImage.image = [UIImage imageNamed:post.primaryImage];
    self.featuredPostTitle.text = post.title;
    if (post.descriptionPost != nil) {
        self.featurePostDescription.text = post.descriptionPost;
    }
    
}
@end
