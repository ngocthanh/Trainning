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

    [_lblTitle setFont:[UIFont boldSystemFontOfSize:frontSizeMinium]];
    _lblTitle.textColor = [DefineColor colorPrimary];
    _lblTime.textColor = [DefineColor colorPrimary];
    _lblDescription.textColor =[DefineColor colorPrimary];
    self.layer.borderWidth = intOne;
    self.layer.borderColor = [DefineColor colorPrimary].CGColor;
    
}
-(void)getDataForImageAndTitle:(NSString*) title Time:(NSString*) time Description:(NSString*) description LinkURLImage:(NSString*) linkurl LinkNews:(NSString*) linknews {

    //_img.image = [UIImage imageNamed:image];
//    if ((title || time || description || linkurl ) == nil) {
//        [self getImageOnline: textNil];
//        _lblTitle.text = textNil;
//        _lblTime.text = textNil;
//        _lblDescription.text = textNil;
//    }
    [self getImageOnline: linkurl];
    _lblTitle.text = title;
    _lblTime.text = time;
    _lblDescription.text = description;
    _linkNews = linknews;
    
}
-(void)getImageOnline:(NSString*) linkURL{
    if (![linkURL   isEqual: textNil]) {
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
}

@end
