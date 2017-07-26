//
//  BlogPostCollectionViewCell.h
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostModel.h"
@interface BlogPostCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageBlogPost;
@property (weak, nonatomic) IBOutlet UILabel *descriptionBlogPost;
@property (weak, nonatomic) IBOutlet UILabel *titleBlogPost;
@property (weak, nonatomic) IBOutlet UITableView *arrayTags;
-(void)getData:(PostModel *)post;
@end
