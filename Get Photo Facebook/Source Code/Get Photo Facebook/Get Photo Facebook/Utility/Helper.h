//
//  Helper.h
//  Get Photo Facebook
//
//  Created by dankhanh on 6/30/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Helper : UIViewController
-(void)createAlertWithStringTitle:(NSString *)titleAlert contentAlert:(NSString *)contentAlert;
-(NSString *)setUpNameForImageAsThumb :(NSString *)imageId;
-(void)lazyLoadingForImage:(NSString *) urlString IDImage:(NSString *)idImage Success:(void(^)(NSData* dataImage))success Failure:(void (^)(NSError* error))failure;
-(NSString *)formatDateForCell :(NSString *)inputDate;
@end
