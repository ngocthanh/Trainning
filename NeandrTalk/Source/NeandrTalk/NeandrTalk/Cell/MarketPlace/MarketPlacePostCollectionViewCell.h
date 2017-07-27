//
//  MarketPlacePostCollectionViewCell.h
//  NeandrTalk
//
//  Created by dankhanh on 7/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostModel.h"

@interface MarketPlacePostCollectionViewCell : UICollectionViewCell <UITableViewDelegate ,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *marketPostImage;
@property (weak, nonatomic) IBOutlet UITableView *tableTags;
@property (weak, nonatomic) IBOutlet UILabel *marketPostTitle;
@property (weak, nonatomic) IBOutlet UILabel *marketPostDescription;
@property (weak, nonatomic) IBOutlet UILabel *marketPostPrice;
@property (weak, nonatomic) IBOutlet UILabel *marketPostType;
@property (weak, nonatomic) IBOutlet UILabel *marketPlaceTagsList;

@property (weak, nonatomic) IBOutlet UITextView *tvDescription;
@property (weak, nonatomic) IBOutlet UILabel *numberOfItem;

@property (weak, nonatomic) IBOutlet UILabel *numberOfComment;
@property (strong, nonatomic) NSArray *arrayTag;
@property CGFloat height;
-(void)getData:(PostModel *)post;
@end
