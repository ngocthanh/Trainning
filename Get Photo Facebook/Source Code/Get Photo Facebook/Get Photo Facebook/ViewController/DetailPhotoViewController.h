//
//  DetailPhotoViewController.h
//  Photo Design
//
//  Created by KterKC on 6/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "Helper.h"
#import "PhotoOfUser.h"
@interface DetailPhotoViewController : UIViewController<UIScrollViewDelegate>
@property (strong, nonatomic) UIImageView *image;

@property (strong, nonatomic) PhotoOfUser *photoUser;
@end


