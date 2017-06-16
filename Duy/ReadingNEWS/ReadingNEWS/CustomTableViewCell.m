//
//  CustomTableViewCell.m
//  ReadingNEWS
//
//  Created by dankhanh on 6/11/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import "CustomTableViewCell.h"



@interface CustomTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;

@end


@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [_leftView setHidden:true];
    [_rightView setHidden:true];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)loadIntentForLeftCell :(NSString *)title description:(NSString *)description link:(NSString *)linkImage date:(NSString *)date {
    [_leftView setHidden:false];
    _titleCell1.text=title;
    _decriptionCell1.text=description;
    _dateCell1.text=date;
    [self getImageOnline:linkImage:0];
}
-(void)loadIntentForRightCell :(NSString *)title description:(NSString *)description link:(NSString *)linkImage date:(NSString *)date {
    [_rightView setHidden:false];
    _titleCell.text=title;
    _decriptionCell.text=description;
    _dateCell.text=date;
    [self getImageOnline:linkImage :1];
}
-(void)getImageOnline:(NSString*) linkURL :(NSInteger) number{
    
    NSURL *url = [NSURL URLWithString:[[NSString alloc]  initWithString:linkURL]];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if(number==1){
                        self.imageCell.image = image;
                    }
                    else{
                        self.imageCell1.image=image;
                    }
                });
            }
        }
    }];
    [task resume];
}
@end
