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
    [self setStyle:tag];
}
-(void)setStyle:(__strong NSString *)tag1{
    if ([tag1  isEqual: @"seafood"]) {
        _tagsLabel.backgroundColor = [UIColor blueColor];
    }else if([tag1  isEqual: @"cooking"]){
        _tagsLabel.backgroundColor = [UIColor orangeColor];
    }else if([tag1  isEqual: @"personal"]){
        _tagsLabel.backgroundColor = [UIColor grayColor];
    }else if([tag1  isEqual: @"help"]||[tag1 isEqualToString:@"Helper"]){
        _tagsLabel.backgroundColor = [UIColor redColor];
    }else if([tag1  isEqual: @"grass"]){
        _tagsLabel.backgroundColor = [UIColor greenColor];
    }else if([tag1  isEqual: @"teach"]){
        _tagsLabel.backgroundColor = [UIColor cyanColor];
    }else if([tag1  isEqual: @"tool"]){
        _tagsLabel.backgroundColor = [UIColor purpleColor];
    }else if([tag1  isEqual: @"create"]){
        _tagsLabel.backgroundColor = [UIColor magentaColor];
    }else if([tag1  isEqual: @"chicken"]){
        _tagsLabel.backgroundColor = [UIColor blackColor];
    }else{
            _tagsLabel.backgroundColor = [UIColor brownColor];
        
    }
}
@end
