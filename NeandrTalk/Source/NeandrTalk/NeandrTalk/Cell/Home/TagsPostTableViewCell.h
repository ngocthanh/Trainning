//
//  TagsPostTableViewCell.h
//  NeandrTalk
//
//  Created by KterKC on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TagsPostTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *tagsLabel;
-(void)getData:(NSString*)tag;

@end
