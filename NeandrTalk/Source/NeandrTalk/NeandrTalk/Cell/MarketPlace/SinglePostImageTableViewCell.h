//
//  SinglePostImageTableViewCell.h
//  NeandrTalk
//
//  Created by dankhanh on 7/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SinglePostImageTableViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
-(void)getData:(NSString*)image;


@end
