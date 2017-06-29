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
    [self setStyle];
 }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setStyle{
    _imgAvatar.layer.cornerRadius = _imgAvatar.frame.size.height/2;
    
}
-(void)getDataFromViewControllerWithURLImage:(NSString *) urlString FriendsName:(NSString*) name{
    
    [self getImageOnline:urlString];
    _lblFriendName.text = name;
    
}
-(void)getImageOnline:(NSString*) linkURL{
    if (![linkURL   isEqual: textIsEmpty]) {
        NSURL *url = [NSURL URLWithString:[[NSString alloc]  initWithString:linkURL]];
        NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (data) {
                UIImage *image = [UIImage imageWithData:data];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        _imgAvatar.image = image;
                    });
                }
            }
        }];
        [task resume];
        
    }
}


@end
