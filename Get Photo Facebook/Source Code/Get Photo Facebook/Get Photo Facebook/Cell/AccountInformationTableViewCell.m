//
//  AccountInformationTableViewCell.m
//  Get Photo Facebook
//
//  Created by KterKC on 6/27/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AccountInformationTableViewCell.h"
#import "ConstantsSystem.h"


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
    self.imgAvatar.layer.borderColor = [UIColor colorWithRed:0 green:0.1 blue:0.9 alpha:1].CGColor;
    self.imgAvatar.layer.borderWidth = 1;
    
}
-(void)setDataFromViewControllerWithURLImage:(NSString *) urlString FriendsName:(NSString*) name{
    
    [_network getImageOnline:urlString Success:^(NSData *dataImage) {
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

// duplicate function
//-(void)getImageOnline:(NSString*) linkURL{
//    if (![linkURL   isEqual: textIsEmpty]) {
//        NSURL *url = [NSURL URLWithString:[[NSString alloc]  initWithString:linkURL]];
//        NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
////        }];
//        [task resume];
//        
//    }
//}


@end
