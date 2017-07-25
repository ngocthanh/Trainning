//
//  LandingMemberTableViewCell.h
//  NeandrTalk
//
//  Created by KterKC on 7/23/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
@interface LandingMemberCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatarMember;
@property (weak, nonatomic) IBOutlet UIImageView *logoActiveMember;
@property (weak, nonatomic) IBOutlet UILabel *nameMember;
-(void)getDataUser:(UserModel *)user;
@end
