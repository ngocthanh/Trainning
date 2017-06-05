//
//  ViewController.m
//  StudyObjectC
//
//  Created by KterKC on 02/06/2017.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblText;
@property (weak, nonatomic) IBOutlet UIButton *btnAC;
@property (weak, nonatomic) IBOutlet UIButton *btnDivided;
@property (weak, nonatomic) IBOutlet UIButton *btnSeven;
@property (weak, nonatomic) IBOutlet UIButton *btnEight;
@property (weak, nonatomic) IBOutlet UIButton *btnNine;
@property (weak, nonatomic) IBOutlet UIButton *btnMultiplied;
@property (weak, nonatomic) IBOutlet UIButton *btnFour;
@property (weak, nonatomic) IBOutlet UIButton *btnFive;
@property (weak, nonatomic) IBOutlet UIButton *btnSix;
@property (weak, nonatomic) IBOutlet UIButton *btnMinus;
@property (weak, nonatomic) IBOutlet UIButton *btnOne;
@property (weak, nonatomic) IBOutlet UIButton *btnTwo;
@property (weak, nonatomic) IBOutlet UIButton *btnThree;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UIButton *btnZero;
@property (weak, nonatomic) IBOutlet UIButton *btnComma;
@property (weak, nonatomic) IBOutlet UIButton *btnEqual;
@property (weak, nonatomic) IBOutlet UIButton *btnNegativeOrPositive;
@property (weak, nonatomic) IBOutlet UIButton *btnPercent;
@property (weak, nonatomic) IBOutlet UIView *viewZero;



@end

@implementation ViewController
float number1;
NSString *check;
NSMutableString *string1;
NSMutableString *string2;
bool check1;


- (IBAction)abtnAC:(id)sender {
    _lblText.text = @"0";
    string1 = [[NSMutableString alloc]initWithString:@""];
    string2 = [[NSMutableString alloc]initWithString:@""];
    check = @"";
    check1 = false;
    NSLog(string1, string2);
}
- (IBAction)abtnNegativeOrPositive:(id)sender {
    
}
- (IBAction)abtnPercent:(id)sender {
   

}
- (IBAction)abtnDivided:(id)sender {
    [self setAlgorithm:@"d"];
}


- (IBAction)atbnSeven:(id)sender {
    [self setNumber:@"7"];
}


- (IBAction)abtnEight:(id)sender {
    [self setNumber:@"8"];
}


- (IBAction)abtnNine:(id)sender {
    [self setNumber:@"9"];
}


- (IBAction)abtnMultiplied:(id)sender {
    [self setAlgorithm:@"m"];
}


- (IBAction)abtnFour:(id)sender {
   [self setNumber:@"4"];
}


- (IBAction)abtnFive:(id)sender {
    [self setNumber:@"5"];
}


- (IBAction)abtnSix:(id)sender {
    [self setNumber:@"6"];
}


- (IBAction)abtnMinus:(id)sender {
    [self setAlgorithm:@"mi"];
}


- (IBAction)abtnOne:(id)sender {
    [self setNumber:@"1"];
}


- (IBAction)abtnTwo:(id)sender {
    [self setNumber:@"2"];
}


- (IBAction)abtnThree:(id)sender {
    [self setNumber:@"3"];
}


- (IBAction)abtnAdd:(id)sender {
    [self setAlgorithm:@"a"];
}


- (IBAction)abtnZero:(id)sender {
    [self setNumber:@"0"];
}


- (IBAction)abtnComma:(id)sender {
    [self setNumber:@"."];
}


- (IBAction)abtnEqual:(id)sender {
    [self calculateNumber];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    string1=[[NSMutableString alloc]init];
    [self setStyle];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setStyle{
    _viewZero.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _viewZero.layer.borderWidth = 0.5;
    [self borderForButton: _btnAC];
    [self borderForButton: _btnNegativeOrPositive];
    [self borderForButton: _btnPercent];
    [self borderForButton: _btnDivided];
    [self borderForButton: _btnSeven];
    [self borderForButton: _btnEight];
    [self borderForButton: _btnNine];
    [self borderForButton: _btnMultiplied];
    [self borderForButton: _btnFour];
    [self borderForButton: _btnFive];
    [self borderForButton: _btnSix];
    [self borderForButton: _btnMinus];
    [self borderForButton: _btnOne];
    [self borderForButton: _btnTwo];
    [self borderForButton: _btnThree];
    [self borderForButton: _btnAdd];
    [self borderForButton: _btnComma];
    [self borderForButton: _btnEqual];
    _btnZero.contentEdgeInsets = UIEdgeInsetsMake(0, _btnZero.frame.size.width/4.5, 0, 0);
    
}
- (void)borderForButton:(UIButton *) button{
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
}
- (float)addTwoNumber:(float) number1 AddNumber2:(float) number2{
    float total = number1 + number2;
    return total;
}
- (float)minusTwoNumber:(float) number1 MinusNumber2:(float) number2{
    float equal = number1 - number2;
    return equal;
}
- (float)multipliedTwoNumer:(float) number1 MultipliedNumber2:(float) number2{
    float equal = number1 * number2;
    return equal;
}
- (float)dividedTwoNumer:(float) number1 DividedNumber2:(float) number2{
    float equal = number1 / number2;
    return equal;
}
- (void)setAlgorithm:(NSString *) string{
    check = string;
    check1 = true;
        if (string1 != nil) {
            string2=[[NSMutableString alloc]init];
            number1 = [string1 floatValue];
            _lblText.text = @"0";
        }
    
}
- (void)setNumber:(NSString *) string{
    if (check1 == true) {
        [string2 appendString:string];
        _lblText.text = string2;
    }else{
        [string1 appendString:string];
        _lblText.text = string1;
    }
}
- (void)calculateNumber{
    double number2 = [string2 doubleValue];
    if ([check  isEqual: @"d"]) {
                float result =  [self dividedTwoNumer:number1 DividedNumber2:number2];
                _lblText.text = [NSString stringWithFormat:@"%f",result];
               [string1 appendString:_lblText.text] ;
    }else{
        if ([check  isEqual: @"m"]) {
            
            float result =  [self multipliedTwoNumer:number1 MultipliedNumber2:number2];
            _lblText.text = [NSString stringWithFormat:@"%f",result];
            [string1 appendString:_lblText.text] ;
        }else{
            if ([check  isEqual: @"mi"]) {
                float result =  [self minusTwoNumber:number1 MinusNumber2:number2];
                _lblText.text = [NSString stringWithFormat:@"%f",result];
                [string1 appendString:_lblText.text] ;
            }else{
                float result =  [self addTwoNumber:number1 AddNumber2:number2];
                _lblText.text = [NSString stringWithFormat:@"%f",result];
             
                [string1 appendString:_lblText.text] ;
            }
        }
    }
    check1 = false;
    check = @"";
    string2 = [[NSMutableString alloc] initWithString:@""];
    string1 = [[NSMutableString alloc] initWithString:@""];

}

@end
