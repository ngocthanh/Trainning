//
//  DiscoverCollectionViewCell.m
//  DiscoverCollectionView
//
//  Created by KterKC on 6/8/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "DiscoverCollectionViewCell.h"

@implementation DiscoverCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setStyle];
}
- (void)setStyle{
    _img.layer.borderColor = [UIColor colorWithDisplayP3Red:0.1 green:0.5 blue:0.4 alpha:1].CGColor;
    _img.layer.cornerRadius = 5;
    [_lblTitle setFont:[UIFont boldSystemFontOfSize:17]];
    self.layer.borderWidth = 1;
//    self.backgroundColor =[UIColor colorWithRed:0 green:0.65 blue:0.35 alpha:1];
    self.layer.borderColor = [UIColor colorWithRed:0.0 green:0.65 blue:0.35 alpha:1].CGColor;
}
-(void)getDataForImageAndLabel:(NSString*) image Title:(NSString*) title Time:(NSString*) time Description:(NSString*) description {
    _img.image = [UIImage imageNamed:image];
    _lblTitle.text = title;
    _lblTime.text = time;
    _lblDescription.text = description;
}

@end
