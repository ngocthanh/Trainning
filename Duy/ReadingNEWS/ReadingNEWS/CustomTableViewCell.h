//
//  CustomTableViewCell.h
//  ReadingNEWS
//
//  Created by dankhanh on 6/11/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *btnLeft;
@property (weak, nonatomic) IBOutlet UIButton *btnRight;
-(void)loadIntentForRightCell :(NSString *)title description:(NSString *)description link:(NSString *)linkImage date:(NSString *)date;
-(void)loadIntentForLeftCell :(NSString *)title description:(NSString *)description link:(NSString *)linkImage date:(NSString *)date;
@end
