//
//  Helper.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "Helper.h"
#define titleOkOfAlertButton @"OK"

@implementation Helper
-(void)createAlertWithStringTitle:(NSString *)titleAlert contentAlert:(NSString *)contentAlert Handler:(void (^)(UIAlertAction *))handler ViewController:(UIViewController *)vc{
    UIAlertController *errorAlert=[UIAlertController new];
    errorAlert = [UIAlertController alertControllerWithTitle:titleAlert message:contentAlert preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:titleOkOfAlertButton style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        handler(action);
    }];
    [errorAlert addAction:ok];
    [vc presentViewController:errorAlert animated:YES completion:nil ];

}
-(void)createAlert2ButtonWithTitle:(NSString *)titleAlert contentAlert:(NSString *)contentAlert Handler:(void (^)(UIAlertAction *))handler ViewController:(UIViewController *)vc{
    UIAlertController *errorAlert=[UIAlertController new];
    errorAlert = [UIAlertController alertControllerWithTitle:titleAlert message:contentAlert preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:titleOkOfAlertButton style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        handler(action);
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [errorAlert addAction:ok];
    [errorAlert addAction:cancel];
    [vc presentViewController:errorAlert animated:YES completion:nil ];
}

@end
