//
//  CustomTableViewCell.h
//  ReadingNEWS
//
//  Created by dankhanh on 6/11/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageCell;
@property (weak, nonatomic) IBOutlet UILabel *titleCell;
@property (weak, nonatomic) IBOutlet UILabel *decriptionCell;
@property (weak, nonatomic) IBOutlet UILabel *dateCell;
@property (weak, nonatomic) IBOutlet UIImageView *imageCell1;
@property (weak, nonatomic) IBOutlet UILabel *titleCell1;
@property (weak, nonatomic) IBOutlet UILabel *decriptionCell1;
@property (weak, nonatomic) IBOutlet UILabel *dateCell1;

-(void)loadIntentForCell :(NSString *)title decription:(NSString *)decription date:(NSString *)date;

@end
