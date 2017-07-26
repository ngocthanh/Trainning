//
//  LandingMemberTableViewCell.m
//  NeandrTalk
//
//  Created by KterKC on 7/23/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "LandingMemberCollectionViewCell.h"
@implementation LandingMemberCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setStyle];

}
-(void)getDataUser:(UserModel *)user{
    self.avatarMember.image = [UIImage imageNamed:user.demoAvatar];
    if (user.active ==  1) {
        self.logoActiveMember.image = [UIImage imageNamed:@"active"];
    }
}
-(void)setStyle{
    self.contentView.layer.borderColor = [UIColor blackColor].CGColor;
    self.contentView.layer.borderWidth = 1;
}
@end
