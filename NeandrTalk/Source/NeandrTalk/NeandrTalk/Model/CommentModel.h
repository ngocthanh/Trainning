//
//  CommentModel.h
//  NeandrTalk
//
//  Created by dankhanh on 8/9/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject
@property (strong,nonatomic) NSString *idComment;
@property (strong,nonatomic) NSString *userName;
@property (strong,nonatomic) NSString *time;
@property (strong,nonatomic) NSString *content;
@property (strong,nonatomic) NSString *imageName;
@end
