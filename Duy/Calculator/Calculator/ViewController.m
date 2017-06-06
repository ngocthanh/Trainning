//
//  ViewController.m
//  Calculator
//
//  Created by dankhanh on 02/06/2017.
//  Copyright © 2017 duy. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblDisplay;
@property (weak, nonatomic) NSString *storage;
@property (weak, nonatomic) NSString *operation;

@property (nonatomic) Boolean userIsInputingNumber;
@end

@implementation ViewController
NSString *MyDot=@".";
float _temp;
//int _time;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _lblDisplay.text=[NSString stringWithFormat:@"0"];
    _storage=@"0";
}
- (IBAction)btnNum0Clicked:(UIButton *)sender {
    [self AppendNumber:@"0"];
}
- (IBAction)btnNum1Clicked:(UIButton *)sender {
    [self AppendNumber:@"1"];
}
- (IBAction)btnNum2Clicked:(UIButton *)sender {
    [self AppendNumber:@"2"];
}
- (IBAction)btnNum3Clicked:(UIButton *)sender {
    [self AppendNumber:@"3"];
}
- (IBAction)btnNum4Clicked:(UIButton *)sender {
    [self AppendNumber:@"4"];
}
- (IBAction)btnNum5Clicked:(UIButton *)sender {
    [self AppendNumber:@"5"];
}
- (IBAction)btnNum6Clicked:(UIButton *)sender {
    [self AppendNumber:@"6"];
}
- (IBAction)btnNum7Clicked:(UIButton *)sender {
    [self AppendNumber:@"7"];
}
- (IBAction)btnNum8Clicked:(UIButton *)sender {
    [self AppendNumber:@"8"];
}
- (IBAction)btnNum9Clicked:(UIButton *)sender {
    [self AppendNumber:@"9"];
}
- (IBAction)btnCommaClicked:(UIButton *)sender {
    NSString *currentText = _lblDisplay.text;
    if ([currentText rangeOfString:@"." options:NSBackwardsSearch].length == 0) {
        [self AppendNumber:@"."];
    }
}
- (IBAction)btnDivideClicked:(UIButton *)sender {
    _temp=[[self DisplayValue] floatValue];
    _operation=@"DIVIDE";
    _userIsInputingNumber = true;
}
- (IBAction)btnMultiplyClicked:(UIButton *)sender {
    _temp=[[self DisplayValue] floatValue];
    _operation=@"MULTIPLY";
    _userIsInputingNumber = true;
}
- (IBAction)btnMinusClicked:(UIButton *)sender {
    _temp=[[self DisplayValue] floatValue];
    _operation=@"MINUS";
    _userIsInputingNumber = true;
}
- (IBAction)btnAddClicked:(UIButton *)sender {
    _temp=[[self DisplayValue] floatValue];
    _operation=@"ADD";
    _userIsInputingNumber = true;
    }
-(void)calculate{
    //_time=[self numberOfTimesBtnEqualClicked];
    
    float running=[[self DisplayValue] floatValue];
    _storage=_lblDisplay.text;
    if(_temp==0)
        _storage=[NSString stringWithFormat:@"%f",_temp];
    else
        {if ([_operation isEqual:@"ADD"]) {
            _storage=[NSString stringWithFormat:@"%f",_temp+running];
        }else if ([_operation isEqual:@"MINUS"]) {
            _storage=[NSString stringWithFormat:@"%f",_temp-running];
        }else if ([_operation isEqual:@"MULTIPLY"]) {
            _storage=[NSString stringWithFormat:@"%f",_temp*running];
        }else if([_operation isEqual:@"DIVIDE"]) {
            _storage=[NSString stringWithFormat:@"%f",(running ==0.0)?0.0:_temp/running];
            }
        }
}
- (IBAction)btnEqualClicked:(UIButton *)sender {
    [self calculate];
    _lblDisplay.text=[NSString stringWithFormat:@"%@",_storage];
    _operation=@"";
    _userIsInputingNumber=true;
    //_time+=1;
}
- (IBAction)btnClearClicked:(UIButton *)sender {
    _storage=0;
    _lblDisplay.text=@"0";
    _operation=@"";
    _userIsInputingNumber=false;
//    _time=0;
}
- (void)AppendNumber:(NSString *)Number{
    if ([_lblDisplay.text isEqualToString:@"0"] && ![Number isEqualToString:@"."]) {
        _lblDisplay.text=Number;
    }else if (_userIsInputingNumber){
            _lblDisplay.text=Number;
            _userIsInputingNumber=false;
    }else{
        _lblDisplay.text=[_lblDisplay.text stringByAppendingString:Number];
    }
}
- (NSNumber *)DisplayValue{
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    return [f numberFromString:self.lblDisplay.text];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(int)numberOfTimesBtnEqualClicked{
//    return _time;
//}
@end
