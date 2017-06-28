//
//  AccountInformationModel.h
//  Photo Facebook
//
//  Created by dankhanh on 6/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountInformationModel : NSObject

@property (strong,nonatomic) NSString* userName;
@property (strong,nonatomic) NSString* userBirthday;
@property (strong,nonatomic) NSString* userHometown;
@property (strong,nonatomic) NSString* userUrlPicture;
@property (strong,nonatomic) NSMutableArray *arrayFriends;
-(AccountInformationModel*) getInformationOfUser;
@end
