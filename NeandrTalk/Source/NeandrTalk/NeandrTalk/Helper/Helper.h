//
//  Helper.h
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "ConstantSystem.h"
#import <UIKit/UIKit.h>
@interface Helper : UIViewController
-(void)createAlertWithStringTitle:(NSString *)titleAlert contentAlert:(NSString *)contentAlert Handler:(void (^)(UIAlertAction *action))handler ViewController:(UIViewController *)vc;
-(void)createAlert2ButtonWithTitle:(NSString *)titleAlert contentAlert:(NSString *)contentAlert Handler:(void (^)(UIAlertAction *action))handler ViewController:(UIViewController *)vc;
@end
