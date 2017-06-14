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
    
    [_lblTitle setFont:[UIFont boldSystemFontOfSize:17]];
    _lblTitle.textColor = [UIColor colorWithRed:0.6 green:0.01 blue:0.3 alpha:1];
    _lblTime.textColor = [UIColor colorWithRed:0.6 green:0.01 blue:0.3 alpha:1];
    _lblDescription.textColor =[UIColor colorWithRed:0.6 green:0.01 blue:0.3 alpha:1];
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor colorWithRed:0.6 green:0.01 blue:0.3 alpha:1].CGColor;
}
-(void)getDataForImageAndTitle:(NSString*) title Time:(NSString*) time Description:(NSString*) description LinkURLImage:(NSString*) linkurl {

    //_img.image = [UIImage imageNamed:image];
    [self getImageOnline: linkurl];
    _lblTitle.text = title;
    _lblTime.text = time;
    _lblDescription.text = description;
}
-(void)getImageOnline:(NSString*) linkURL{
    
    NSURL *url = [NSURL URLWithString:[[NSString alloc]  initWithString:linkURL]];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.img.image = image;
                });
            }
        }
    }];
    [task resume];
}

@end
