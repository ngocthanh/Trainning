//
//  Helper.m
//  Get Photo Facebook
//
//  Created by dankhanh on 6/30/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "Helper.h"
#import "ConstantsSystem.h"
#import "LazyLoadingService.h"
#define titleOkOfAlertButton @"OK"
#define nameOfIdImageThumblr @"%@_t"
#define numberCharactorOfDate 10
@implementation Helper
-(void)createAlertWithStringTitle:(NSString *)titleAlert contentAlert:(NSString *)contentAlert{
       UIAlertController *errorAlert=[UIAlertController new];
    errorAlert = [UIAlertController alertControllerWithTitle:titleAlert message:contentAlert preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:titleOkOfAlertButton style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [errorAlert addAction:ok];
}
-(NSString *)setUpNameForImageAsThumb :(NSString *)imageId {
    NSString *imageNameAsThumb;
    imageNameAsThumb=[NSString stringWithFormat:nameOfIdImageThumblr,imageId];
    return imageNameAsThumb;
}
-(void)lazyLoadingForImage:(NSString *) urlString IDImage:(NSString *)idImage Success:(void(^)(NSData* dataImage))success Failure:(void (^)(NSError* error))failure {
    LazyLoadingService *lazy = [LazyLoadingService new];
    [lazy imageDataWithIDImage:idImage LinkURL:urlString Success:^(NSData *dataImage) {
        success(dataImage);
    } Failure:^(NSError *error) {
        failure(error);
    }];
}
-(NSString *)formatDateForCell :(NSString *)inputDate{
    NSString *dateAfterFormat;
    dateAfterFormat=[inputDate substringToIndex:numberCharactorOfDate];

    return dateAfterFormat;
}
-(void)setStyleForImage : (UIImageView *)avatarImage{
    avatarImage.layer.cornerRadius = avatarImage.frame.size.height/roundAvatarRatio;
    avatarImage.clipsToBounds = YES;
    avatarImage.layer.borderColor = [UIColor colorWithRed:redColorNumber green:greenColorNumber blue:blueColorNumber alpha:alphaNumber].CGColor;
    avatarImage.layer.borderWidth = borderWidthNumber;
    
}
-(void)createAlertWith2Button{
//        UIAlertController *errorAlert=[UIAlertController new];
//        errorAlert = [UIAlertController alertControllerWithTitle:alertTitle message:alertMessage preferredStyle: UIAlertControllerStyleAlert];
//        UIAlertAction *ok = [UIAlertAction actionWithTitle:alertActionTitleOK style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        }];
//        UIAlertAction *cancel = [UIAlertAction actionWithTitle:alertActionCancel style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//    
//        }];
//        [errorAlert addAction:ok];
//        [errorAlert addAction:cancel];
//        [self presentViewController:errorAlert animated:YES completion:nil ];
}
@end
