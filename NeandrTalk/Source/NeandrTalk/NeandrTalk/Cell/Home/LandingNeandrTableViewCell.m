//
//  LandingNeandrTableViewCell.m
//  NeandrTalk
//
//  Created by KterKC on 7/23/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "LandingNeandrTableViewCell.h"

@implementation LandingNeandrTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
-(void)getData:( NeandrModel *)neandr{
    _titleRelated.text = neandr.titleRelated;
//    _titleLabel.text = neandr.titleLabel;
//    _descriptionLabel.text = neandr.descriptionLabel;
    _leftImage.image = [UIImage imageNamed:neandr.leftNameImage];
    _centerImage.image = [UIImage imageNamed:neandr.centerNameImage];
    _logoImage.image = [UIImage imageNamed:neandr.logoNameImage];
    _backgroundImage.image = [UIImage imageNamed:neandr.backgroundNameImage];
}
@end
