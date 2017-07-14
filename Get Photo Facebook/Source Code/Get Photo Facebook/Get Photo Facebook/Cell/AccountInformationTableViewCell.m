//
//  AccountInformationTableViewCell.m
//  Get Photo Facebook
//
//  Created by KterKC on 6/27/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AccountInformationTableViewCell.h"
#import "ConstantsSystem.h"
#import "Helper.h"

@implementation AccountInformationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)setDataFromViewControllerWithURLImage:(NSString *) urlString FriendsName:(NSString*) name{
    Helper *helper=[[Helper alloc] init];
    [[NetwokingService sharedInstance ]getImageOnline:urlString Success:^(NSData *dataImage) {
        if (dataImage) {
            UIImage *image = [UIImage imageWithData:dataImage];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    _imgAvatar.image = image;
                });
            }
        }
  
        
    } Failure:^(NSError *error) {
    }];
    _lblFriendName.text = name;
    [helper setStyleForImage:_imgAvatar];
    
}

@end
