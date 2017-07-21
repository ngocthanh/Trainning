//
//  DataForViewController.h
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "Helper.h"
#import "UserModel.h"
#import "PostModel.h"
@interface DataForViewController : NSObject
@property (strong ,nonatomic) UserModel *user;
@property (strong, nonatomic) PostModel *post;

-(NSMutableArray *) getUserList;
@end
