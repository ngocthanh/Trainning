//
//  TagsPostTableViewCell.m
//  NeandrTalk
//
//  Created by KterKC on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "TagsPostTableViewCell.h"

@implementation TagsPostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)getData:(NSString*)tag{
    _tagsLabel.text = tag;

}
@end
