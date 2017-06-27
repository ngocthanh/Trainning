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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)displayUserInformation{
    _lblNameOfUser.text=[NSString stringWithFormat:@"%@",_accountInformationModel.userName];
    _lblHometown.text=[NSString stringWithFormat:@"Hometown: %@",_accountInformationModel.userHometown];
    _lblDateOfBirth.text=[NSString stringWithFormat:@"Date of birth: %@",_accountInformationModel.userBirthday];
    NSData *dataOfPicture=[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_accountInformationModel.userUrlPicture]]];
    _pictureOfUser.image=[UIImage imageWithData:dataOfPicture];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
