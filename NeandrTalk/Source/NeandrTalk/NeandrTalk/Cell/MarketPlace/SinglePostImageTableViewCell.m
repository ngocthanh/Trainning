//
//  SinglePostImageTableViewCell.m
//  NeandrTalk
//
//  Created by dankhanh on 7/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "SinglePostImageTableViewCell.h"

@implementation SinglePostImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)getData:(NSString *)image{
    _img.image = [UIImage imageNamed:image];
}
@end
