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
        self.tvDesciption.text=post.descriptionPost;
    }
    NSMutableString * tagList = [[NSMutableString alloc] init];
    for (NSString *tag in post.arrayTags) {
        if (tag==[post.arrayTags objectAtIndex:0]) {
            [tagList appendString:tag];
        }
        else
        {
        [tagList appendString:[NSString stringWithFormat:@",%@",tag]];
        }
    }
    self.alltags.text=[NSString stringWithFormat:@"[%@]",tagList];
    self.numberOfComment.text=[NSString stringWithFormat:@"%lu COMMENTS", (unsigned long)[post.arrayComments count]];
    self.contentView.layer.borderWidth=1;
    self.contentView.layer.borderColor=[UIColor blackColor].CGColor;

}
@end
