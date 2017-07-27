//
//  BlogFeaturedPostCollectionViewCell.h
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostModel.h"
@interface BlogFeaturedPostCollectionViewCell : UICollectionViewCell <UITableViewDelegate ,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *imageFeaturedPost;
@property (weak, nonatomic) IBOutlet UILabel *titleFeaturedPost;
@property (weak, nonatomic) IBOutlet UILabel *descriptionFeaturedPost;

@property (weak, nonatomic) IBOutlet UITableView *tableTags;
@property (strong, nonatomic) NSArray *arrayTag;
@property CGFloat height;
-(void)getData:(PostModel *)post;
@end
