//
//  NewFeedsPostTableViewCell.h
//  NeandrTalk
//
//  Created by dankhanh on 7/27/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewFeedsPostTableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *newfeedCollectionView;
@property (strong,nonatomic) NSArray *allPostArray;
@property (strong,nonatomic) NSMutableArray *random;
@end