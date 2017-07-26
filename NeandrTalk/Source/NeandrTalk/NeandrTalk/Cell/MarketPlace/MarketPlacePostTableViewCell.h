//
//  MarketPlacePostTableViewCell.h
//  NeandrTalk
//
//  Created by dankhanh on 7/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarketPlacePostTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *marketPlacePostCollectionView;
@property (strong,nonatomic) NSArray *allPostArray;
@property (strong,nonatomic) NSArray *marketPlacePostArray;
@end
