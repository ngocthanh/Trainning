//
//  ProfileRestaurantUserViewController.h
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "MasterViewController.h"

@interface ProfileRestaurantUserViewController : MasterViewController
@property (weak, nonatomic) IBOutlet UITableView *tableDaysOpen;
@property (strong, nonatomic) NSArray *arrayDaysOpen;
@end
