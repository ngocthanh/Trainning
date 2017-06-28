//
//  AccountInformationViewController.m
//  Photo Design
//
//  Created by KterKC on 6/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "AccountInformationViewController.h"
#import "AccountInformationModel.h"

@interface AccountInformationViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *pictureOfUser;
@property (weak, nonatomic) IBOutlet UILabel *lblNameOfUser;
@property (weak, nonatomic) IBOutlet UILabel *lblHometown;
@property (weak, nonatomic) IBOutlet UILabel *lblDateOfBirth;

@property (strong,nonatomic) AccountInformationModel* accountInformationModel;
@end

@implementation AccountInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _accountInformationModel=[[AccountInformationModel alloc]init];
     [_accountInformationModel getInformationOfUser];


}
-(void)viewWillAppear:(BOOL)animated{
    self.pictureOfUser.layer.cornerRadius=_pictureOfUser.frame.size.height/2.0;
    self.pictureOfUser.clipsToBounds=YES;
}
-(void)viewDidAppear:(BOOL)animated{
    [self displayUserInformation];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (void)displayUserInformation{
    _lblNameOfUser.text=[NSString stringWithFormat:@"%@",_accountInformationModel.userName];
    _lblHometown.text=[NSString stringWithFormat:@"Hometown: %@",_accountInformationModel.userHometown];
    _lblDateOfBirth.text=[NSString stringWithFormat:@"Date of birth: %@",_accountInformationModel.userBirthday];
    NSData *dataOfPicture=[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_accountInformationModel.userUrlPicture]]];
    _pictureOfUser.image=[UIImage imageWithData:dataOfPicture];
}


@end
