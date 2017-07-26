//
//  LandingPagePostCollectionViewCell.h
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostModel.h"
@interface LandingPagePostCollectionViewCell : UICollectionViewCell <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *titlePost;
@property (weak, nonatomic) IBOutlet UILabel *descriptionPost;
@property (weak, nonatomic) IBOutlet UITableView *tableTags;
@property (weak, nonatomic) IBOutlet UIView *viewColorTag;
@property (strong, nonatomic) NSArray *arrayTag;
@property CGFloat height;
-(void)getData:(PostModel *)post;
@end
