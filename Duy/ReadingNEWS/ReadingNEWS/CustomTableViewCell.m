//
//  CustomTableViewCell.m
//  ReadingNEWS
//
//  Created by dankhanh on 6/11/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import "CustomTableViewCell.h"

#define numberRepresentLeftView 0
#define numberRepresentRightView 1


@interface CustomTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageCellL;
@property (weak, nonatomic) IBOutlet UILabel *titleCellL;
@property (weak, nonatomic) IBOutlet UILabel *descriptionCellL;
@property (weak, nonatomic) IBOutlet UILabel *dateCellL;
@property (weak, nonatomic) IBOutlet UILabel *descriptionCellR;
@property (weak, nonatomic) IBOutlet UILabel *dateCellR;

@property (weak, nonatomic) IBOutlet UIImageView *imageCellR;
@property (weak, nonatomic) IBOutlet UILabel *titleCellR;

@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;

@end


@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _leftView.layer.borderWidth=1;
    _rightView.layer.borderWidth=1;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)loadIntentForLeftCell :(NSString *)title description:(NSString *)description link:(NSString *)linkImage date:(NSString *)date {
    [_leftView setHidden:false];
    _titleCellL.text=title;
    _descriptionCellL.text=description;
    _dateCellL.text=date;
    [self getImageOnline:linkImage:numberRepresentLeftView];
}
-(void)loadIntentForRightCell :(NSString *)title description:(NSString *)description link:(NSString *)linkImage date:(NSString *)date {
    [_rightView setHidden:false];
    _titleCellR.text=title;
    _descriptionCellR.text=description;
    _dateCellR.text=date;
    [self getImageOnline:linkImage :numberRepresentRightView];
}

-(void)getImageOnline:(NSString*) linkURL :(NSInteger) number{
    
    NSURL *url = [NSURL URLWithString:[[NSString alloc]  initWithString:linkURL]];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if(number==numberRepresentRightView){
                        self.imageCellR.image = image;
                    }
                    else{
                        self.imageCellL.image=image;
                    }
                });
            }
        }
    }];
    [task resume];
}
//-(IBAction)goWithURL:(NSString*)Url{
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:Url]];
//}
@end
