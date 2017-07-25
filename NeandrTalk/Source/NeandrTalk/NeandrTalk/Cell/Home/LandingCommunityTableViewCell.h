//
//  LandingCommunityTableViewCell.h
//  NeandrTalk
//
//  Created by KterKC on 7/23/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LandingCommunityTableViewCell : UITableViewCell <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionMember;
@property (strong, nonatomic) NSArray *arrayMember;
-(void)getData:(NSArray*)arrayMemeber;
@end
