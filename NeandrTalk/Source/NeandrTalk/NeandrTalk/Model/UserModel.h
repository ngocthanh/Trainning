//
//  UserModel.h
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property (strong,nonatomic) NSString *userID;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *email;
@property (strong,nonatomic) NSString *zipCode;
@property (strong,nonatomic) NSString *website;
@property (strong,nonatomic) NSString *cuisineType;
@property (strong,nonatomic) NSString *userDescription;
@property (strong,nonatomic) NSString *phone;
@property (strong,nonatomic) NSString *address;
@property (strong,nonatomic) NSData   *avatarData;
@property (strong,nonatomic) NSArray  *arrayDaysOpen;
@property (strong,nonatomic) NSArray  *arrayCategoriesAndTags;

@end
