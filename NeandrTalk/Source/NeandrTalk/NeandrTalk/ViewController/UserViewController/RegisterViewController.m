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
    [self initWithClass];
    [self getAllUserType];
}
- (void) initWithClass{
    _allUserType=[[NSArray alloc] init];
    [self.navigationController setNavigationBarHidden:false];
}
-(void)getAllUserType{
    _allUserType=@[@"Personal",@"Restaurant"];
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
//-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    return _allUserType[row];
//}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
}
- (IBAction)signUp:(id)sender {
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* tView = (UILabel*)view;
    if (!tView){
        tView = [[UILabel alloc] init];
        tView.font = [UIFont fontWithName:@"System" size:12];
        [tView setTextAlignment:NSTextAlignmentCenter];
    }
    tView.text = _allUserType[row];
    return tView;
}
-(void)setStyle{
    
}

@end
