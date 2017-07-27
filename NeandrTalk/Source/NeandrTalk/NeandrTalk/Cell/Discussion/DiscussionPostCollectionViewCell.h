//
//  DiscussionPostCollectionViewCell.h
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostModel.h"
@interface DiscussionPostCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *discussionPostIamge;
@property (weak, nonatomic) IBOutlet UILabel *discussionPostDescription;
@property (weak, nonatomic) IBOutlet UILabel *discussionPostTitle;
@property (weak, nonatomic) IBOutlet UITextView *dvDiscussion;

@property (weak, nonatomic) IBOutlet UILabel *alltags;
@property (weak, nonatomic) IBOutlet UILabel *numberOfComment;

-(void)getData:(PostModel *)post;
@end
