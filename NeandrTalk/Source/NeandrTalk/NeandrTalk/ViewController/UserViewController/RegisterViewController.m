//
//  RegisterViewController.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (strong,nonatomic) NSArray *allUserType;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_txtUserType setEnabled:NO];
    [self initWithClass];
    [self getAllUserType];
}
- (void) initWithClass{
    _allUserType=[[NSArray alloc] init];
    [self.navigationController setNavigationBarHidden:false];
}
-(void)getAllUserType{
    _allUserType=@[@"Admin",@"Personal",@"Restaurant"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_allUserType count];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _allUserType[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _txtUserType.text=[_allUserType objectAtIndex:row];
}
- (IBAction)signUp:(id)sender {
}
@end
