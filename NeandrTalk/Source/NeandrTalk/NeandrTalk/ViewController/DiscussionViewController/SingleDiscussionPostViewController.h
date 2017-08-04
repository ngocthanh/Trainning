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
@property (strong, nonatomic) NSArray *arrayAllPost;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionRelated;
@property (strong,nonatomic) NSMutableString* postID;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionImage;
@property (weak, nonatomic) IBOutlet UILabel *discussionTitle;
@property (weak, nonatomic) IBOutlet UITextView *discussionDescription;

@end
