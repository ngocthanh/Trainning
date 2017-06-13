//
//  CustomTableViewCell.m
//  ReadingNEWS
//
//  Created by dankhanh on 6/11/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import "CustomTableViewCell.h"



@interface CustomTableViewCell ()


@end


@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)loadIntentForCell :(NSString *)title decription:(NSString *)decription date:(NSString *)date {
    _titleCell.text= title;
    _decriptionCell.text=decription;
    _dateCell.text=date;
    
    
}


@end
