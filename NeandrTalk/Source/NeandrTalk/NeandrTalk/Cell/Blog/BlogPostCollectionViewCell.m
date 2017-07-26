//
//  BlogPostCollectionViewCell.m
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "BlogPostCollectionViewCell.h"

@implementation BlogPostCollectionViewCell
-(void)getData:(PostModel *)post{
    self.imageBlogPost.image = [UIImage imageNamed:post.primaryImage];
    self.titleBlogPost.text = post.title;
    if (post.descriptionPost != nil) {
        self.descriptionBlogPost.text = post.descriptionPost;
    }
}
@end
