//
//  FriendOfUser.h
//  Get Photo Facebook
//
//  Created by KterKC on 7/2/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendOfUser : NSObject
@property (strong,nonatomic) NSString*  friendID;
@property (strong,nonatomic) NSString* friendName;
@property (strong,nonatomic) NSDate* friendBirthday;
@property (strong,nonatomic) NSString* friendHometown;
@property (strong,nonatomic) NSString* friendUrlPicture;
@property (strong,nonatomic) NSMutableArray *arrayPhoto;
@end
