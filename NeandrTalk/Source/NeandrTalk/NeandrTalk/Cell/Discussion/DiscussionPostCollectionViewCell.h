//
//  DiscussionPostCollectionViewCell.h
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostModel.h"
@interface DiscussionPostCollectionViewCell : UICollectionViewCell <UITableViewDelegate ,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *discussionPostIamge;
@property (weak, nonatomic) IBOutlet UILabel *discussionPostDescription;
@property (weak, nonatomic) IBOutlet UILabel *discussionPostTitle;
@property (weak, nonatomic) IBOutlet UITextView *dvDiscussion;

@property (weak, nonatomic) IBOutlet UILabel *alltags;
@property (weak, nonatomic) IBOutlet UILabel *numberOfComment;


@property (weak, nonatomic) IBOutlet UITableView *tableTags;
@property (strong, nonatomic) NSArray *arrayTag;
@property CGFloat height;
-(void)getData:(PostModel *)post;
@end
