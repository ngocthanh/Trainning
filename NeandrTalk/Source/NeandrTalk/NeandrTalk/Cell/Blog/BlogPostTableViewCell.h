//
//  BlogPostTableViewCell.h
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllBlogPostViewController.h"
@interface BlogPostTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong,nonatomic) AllBlogPostViewController *allBLogPostVC;
@property (strong,nonatomic) NSArray *allPostArray;
@property (strong,nonatomic) NSArray *blogPostArray;

@property (weak, nonatomic) IBOutlet UICollectionView *blogPostCollectionView;

@end
