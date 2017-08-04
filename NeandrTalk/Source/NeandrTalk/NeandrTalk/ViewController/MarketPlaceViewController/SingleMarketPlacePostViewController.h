//
//  SingleMarketPlacePostViewController.h
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "MasterViewController.h"

@interface SingleMarketPlacePostViewController : MasterViewController 
@property (weak, nonatomic) IBOutlet UICollectionView *collectionRelated;
@property (weak, nonatomic) IBOutlet UIButton *btnComment;
//@property (weak, nonatomic) IBOutlet UITableView *tableImage;
@property (weak, nonatomic) IBOutlet UILabel *marketTypeLbl;
//@property (weak, nonatomic) IBOutlet UITableView *tableTags;
@property (strong, nonatomic) NSArray *arrayImage;
@property (strong, nonatomic) NSArray *arrayTags;
@property (strong, nonatomic) NSArray *arrayPostRelated;
@property (weak, nonatomic) IBOutlet UISegmentedControl *descriptionSegment;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionviewImage;
@property (strong,nonatomic) NSString *postID;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *realPrice;
@property (weak, nonatomic) IBOutlet UILabel *salePrice;
@property (strong, nonatomic) NSArray *arrayAllPost;
@end
