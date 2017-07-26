//
//  BlogHomeTableViewCell.h
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlogHomeTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *featuredCollectionView;

@property (strong,nonatomic) NSArray *allPostArray;
@property (strong,nonatomic) NSMutableArray *featuredPostArray;
@property (strong,nonatomic) NSArray *blogPostArray;
@end
