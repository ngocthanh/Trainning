//
//  AllDiscussionPostViewController.h
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "MasterViewController.h"

@interface AllDiscussionPostViewController : MasterViewController
@property (strong,nonatomic) NSArray *allPostArray;
@property (strong,nonatomic) NSMutableArray *featuredPostArray;
@property (strong,nonatomic) NSArray *discussionPostArray;

@end
