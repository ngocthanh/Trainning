//
//  Helper.m
//  Get Photo Facebook
//
//  Created by dankhanh on 6/30/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "Helper.h"
#import "ConstantsSystem.h"
#define titleOkOfAlertButton @"OK"
#define nameOfIdImageThumblr @"%@_t"
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

@end
