//
//  PostModel.h
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostModel : NSObject
@property (strong,nonatomic) NSString *primaryImage;
@property (strong,nonatomic) NSString *postID;
@property (strong,nonatomic) NSString *postIDUserOwner;
@property (strong,nonatomic) NSString *postType;
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *descriptionPost;
@property (strong,nonatomic) NSString *marketType;
@property (strong,nonatomic) NSArray *arrayImages;
@property (strong,nonatomic) NSArray *arrayTags;
@property (strong,nonatomic) NSArray *arrayComments;
@property  NSInteger likes;
@property  NSInteger votes;
@property  NSInteger views;
@property  (strong,nonatomic) NSString *price;
@property  NSInteger stars;
@property  BOOL favorite;
@property  BOOL follow;
@property  BOOL report;
@property  (strong,nonatomic) NSString *featured;
@end
