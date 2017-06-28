//
//  AccountInformationTableViewCell.h
//  Get Photo Facebook
//
//  Created by KterKC on 6/27/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountInformationTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgAvatar;
@property (weak, nonatomic) IBOutlet UILabel *lblFriendName;
-(void)getDataFromViewControllerWithURLImage:(NSString *) urlString FriendsName:(NSString*) name;
@end