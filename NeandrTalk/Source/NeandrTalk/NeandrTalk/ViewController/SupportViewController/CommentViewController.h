//
//  CommentViewController.h
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "MasterViewController.h"

@interface CommentViewController : MasterViewController 
@property (strong, nonatomic) NSMutableArray *CommentArray;
@property (weak, nonatomic) IBOutlet UITableView *tbvComment;
@property (weak, nonatomic) IBOutlet UITextField *txtvComment;
- (IBAction)postComment:(id)sender;

@end
