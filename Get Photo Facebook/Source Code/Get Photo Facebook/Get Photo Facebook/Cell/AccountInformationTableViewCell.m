//
//  AccountInformationTableViewCell.m
//  Get Photo Facebook
//
//  Created by KterKC on 6/27/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AccountInformationTableViewCell.h"
#import "ConstantsSystem.h"

#define redColorNumber 0
#define greenColorNumber 0.1
#define blueColorNumber 0.9
#define alphaNumber 1
#define borderWidthNumber 1

@implementation AccountInformationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
 }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setStyle{
    _imgAvatar.layer.cornerRadius = _imgAvatar.frame.size.height/2;
    _imgAvatar.clipsToBounds = YES;
    self.imgAvatar.layer.borderColor = [UIColor colorWithRed:redColorNumber green:greenColorNumber blue:blueColorNumber alpha:alphaNumber].CGColor;
    self.imgAvatar.layer.borderWidth = borderWidthNumber;
    
}
-(void)setDataFromViewControllerWithURLImage:(NSString *) urlString FriendsName:(NSString*) name{
    
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
    [self setStyle];
    
}




@end
