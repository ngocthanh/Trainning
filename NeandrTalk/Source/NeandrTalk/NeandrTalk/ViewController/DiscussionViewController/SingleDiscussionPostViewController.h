//
//  SingleDiscussionPostViewController.h
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "MasterViewController.h"

@interface SingleDiscussionPostViewController : MasterViewController
@property (strong, nonatomic) NSArray *arrayImage;
@property (strong, nonatomic) NSArray *arrayPostRelated;
@property (weak, nonatomic) IBOutlet UITableView *tableImage;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionRelated;

@end
