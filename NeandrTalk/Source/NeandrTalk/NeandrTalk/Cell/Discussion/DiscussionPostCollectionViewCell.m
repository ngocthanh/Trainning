//
//  DiscussionPostCollectionViewCell.m
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "DiscussionPostCollectionViewCell.h"

@implementation DiscussionPostCollectionViewCell
-(void)getData:(PostModel *)post{
    self.discussionPostIamge.image = [UIImage imageNamed:post.primaryImage];
    self.discussionPostTitle.text = post.title;
    if (post.descriptionPost != nil) {
        self.discussionPostDescription.text = post.descriptionPost;
        self.dvDiscussion.text=post.descriptionPost;
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
