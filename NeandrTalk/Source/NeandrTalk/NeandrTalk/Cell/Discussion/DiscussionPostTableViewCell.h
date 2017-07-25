//
//  DiscussionPostTableViewCell.h
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscussionPostTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *discussionPostCollectionView;


@property (strong,nonatomic) NSArray *allPostArray;
@property (strong,nonatomic) NSArray *discussionPostArray;
@end
