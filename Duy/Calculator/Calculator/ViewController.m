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
@property (weak, nonatomic) NSString *temp;
@property (weak, nonatomic) NSString *operation;

@property (nonatomic) Boolean IsfirstInput;
@property (nonatomic) Boolean IsfirstOperation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _lblDisplay.text=[NSString stringWithFormat:@""];
    _storage=@"0";
    _IsfirstInput=true;
    _IsfirstOperation=false;
}
- (IBAction)btnNum0Clicked:(UIButton *)sender {
    if (!_IsfirstInput || _IsfirstOperation)
    {
        _lblDisplay.text=@"";
        _IsfirstInput=true;
        //_IsfirstOperation=true;
    }
}
- (IBAction)btnNum1Clicked:(UIButton *)sender {
    if (!_IsfirstInput || _IsfirstOperation)
    {
        _lblDisplay.text=@"";
        _IsfirstInput=true;
       // _IsfirstOperation=true;
    }
    _lblDisplay.text=[NSString stringWithFormat:@"%@1",_lblDisplay.text];
}
- (IBAction)btnNum2Clicked:(UIButton *)sender {
    if (!_IsfirstInput || _IsfirstOperation)
    {
        _lblDisplay.text=@"";
        _IsfirstInput=true;
      //  _IsfirstOperation=true;
    }
    _lblDisplay.text=[NSString stringWithFormat:@"%@2",_lblDisplay.text];
}
- (IBAction)btnNum3Clicked:(UIButton *)sender {
    if (!_IsfirstInput || _IsfirstOperation)
    {
        _lblDisplay.text=@"";
        _IsfirstInput=true;
       // _IsfirstOperation=true;
    }
    _lblDisplay.text=[NSString stringWithFormat:@"%@3",_lblDisplay.text];
}
- (IBAction)btnNum4Clicked:(UIButton *)sender {
    if (!_IsfirstInput || _IsfirstOperation)
    {
        _lblDisplay.text=@"";
        _IsfirstInput=true;
       // _IsfirstOperation=true;
    }
    _lblDisplay.text=[NSString stringWithFormat:@"%@4",_lblDisplay.text];
}
- (IBAction)btnNum5Clicked:(UIButton *)sender {
    if (!_IsfirstInput || _IsfirstOperation)
    {
        _lblDisplay.text=@"";
        _IsfirstInput=true;
//_IsfirstOperation=true;
    }
    _lblDisplay.text=[NSString stringWithFormat:@"%@5",_lblDisplay.text];
}
- (IBAction)btnNum6Clicked:(UIButton *)sender {
    if (!_IsfirstInput || _IsfirstOperation)
    {
        _lblDisplay.text=@"";
        _IsfirstInput=true;
       // _IsfirstOperation=true;
    }
    _lblDisplay.text=[NSString stringWithFormat:@"%@6",_lblDisplay.text];
}
- (IBAction)btnNum7Clicked:(UIButton *)sender {
    if (!_IsfirstInput || _IsfirstOperation)
    {
        _lblDisplay.text=@"";
        _IsfirstInput=true;
      //  _IsfirstOperation=true;
    }
    _lblDisplay.text=[NSString stringWithFormat:@"%@7",_lblDisplay.text];
}
- (IBAction)btnNum8Clicked:(UIButton *)sender {
    if (!_IsfirstInput || _IsfirstOperation)
    {
        _lblDisplay.text=@"";
        _IsfirstInput=true;
      //  _IsfirstOperation=true;
    }
    _lblDisplay.text=[NSString stringWithFormat:@"%@8",_lblDisplay.text];
}
- (IBAction)btnNum9Clicked:(UIButton *)sender {
    if (!_IsfirstInput || _IsfirstOperation)
    {
        _lblDisplay.text=@"";
        _IsfirstInput=true;
      //  _IsfirstOperation=true;
    }
    _lblDisplay.text=[NSString stringWithFormat:@"%@9",_lblDisplay.text];
}
- (IBAction)btnCommaClicked:(UIButton *)sender {
    _operation=@"ADD";
}
- (IBAction)btnDivideClicked:(UIButton *)sender {
    if(_IsfirstOperation){
        _temp = _lblDisplay.text;
        _storage=_temp;
        _lblDisplay.text=@"";
        _IsfirstOperation=false;
    }
    else{
        _temp = _lblDisplay.text;
        [self calculate:_storage:_temp];
        _lblDisplay.text=_storage;
        _IsfirstOperation=false;
        _IsfirstInput=false;
    }
    _operation=@"DIVIDE";
}
- (IBAction)btnMultiplyClicked:(UIButton *)sender {
    if(_IsfirstOperation){
        _temp = _lblDisplay.text;
        _storage=_temp;
        _lblDisplay.text=@"";
        _IsfirstOperation=false;
    }
    else{
        _temp = _lblDisplay.text;
        [self calculate:_storage:_temp];
        _lblDisplay.text=_storage;
        _IsfirstOperation=false;
        _IsfirstInput=false;
    }
    _operation=@"MULTIPLY";
}
- (IBAction)btnMinusClicked:(UIButton *)sender {
    
    if(_IsfirstOperation){
        _temp = _lblDisplay.text;
        _storage=_temp;
        _lblDisplay.text=@"";
        _IsfirstOperation=false;
    }
    else{
        _temp = _lblDisplay.text;
        [self calculate:_storage:_temp];
        _lblDisplay.text=_storage;
        _IsfirstOperation=false;
        _IsfirstInput=false;
    }
    _operation=@"MINUS";
}
- (IBAction)btnAddClicked:(UIButton *)sender {
    
    if(_IsfirstOperation){
        _temp = _lblDisplay.text;
        _storage=_temp;
        _lblDisplay.text=@"";
        _IsfirstOperation=false;
        }
    else{
        _temp = _lblDisplay.text;
        [self calculate:_storage:_temp];
        _lblDisplay.text=_storage;
        _IsfirstOperation=false;
        _IsfirstInput=false;
        }
    _operation=@"ADD";
    }
-(void)calculate:(NSString *)FirstNumber :(NSString *)SecondNumber{
    if ([_operation isEqual:@"ADD"]) {
        _storage=[NSString stringWithFormat:@"%f",[FirstNumber doubleValue]+[SecondNumber doubleValue]];
    }
    if ([_operation isEqual:@"MINUS"]) {
        _storage=[NSString stringWithFormat:@"%f",[FirstNumber doubleValue]-[SecondNumber doubleValue]];
    }
    if ([_operation isEqual:@"MULTIPLY"]) {
        _storage=[NSString stringWithFormat:@"%f",[FirstNumber doubleValue]*[SecondNumber doubleValue]];
    }
    if ([_operation isEqual:@"DIVIDE"]) {
        _storage=[NSString stringWithFormat:@"%f",[FirstNumber doubleValue]/[SecondNumber doubleValue]];
    }
}

- (IBAction)btnEqualClicked:(UIButton *)sender {
    if(!_IsfirstOperation){
        _storage=_lblDisplay.text;
        [self calculate:_temp : _storage];
        _lblDisplay.text=[NSString stringWithFormat:@"%@",_storage];
            }
    else
        {
            [self calculate:_storage : _lblDisplay.text];
            _lblDisplay.text=[NSString stringWithFormat:@"%@",_storage];
        }
    _IsfirstOperation=true;
}
- (IBAction)btnClearClicked:(UIButton *)sender {
    _lblDisplay.text=[NSString stringWithFormat:@""];
    _storage=@"0";
    _IsfirstInput=false;
    _IsfirstOperation=true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
