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
    }
    
}
@end
