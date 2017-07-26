//
//  BlogFeaturedPostCollectionViewCell.m
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "BlogFeaturedPostCollectionViewCell.h"

@implementation BlogFeaturedPostCollectionViewCell
-(void)getData:(PostModel *)post{
    self.imageFeaturedPost.image = [UIImage imageNamed:post.primaryImage];
    self.titleFeaturedPost.text = post.title;
    if (post.descriptionPost != nil) {
        self.descriptionFeaturedPost.text = post.descriptionPost;
    }
}
@end
