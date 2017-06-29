//
//  CustomCellTableViewController.m
//  ReadingNEWS
//
//  Created by dankhanh on 6/11/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import "CustomCellTableViewController.h"
#import "CustomTableViewCell.h"
#import "GetData.h"
#import "parserData.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "defineApp.h"
#import "webViewController.h"



@interface CustomCellTableViewController ()
- (IBAction)loginFacebook:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIProgressView *pgvLogin;

@property (weak, nonatomic) IBOutlet UITableView *tableViewNews;
@property (strong, nonatomic) CustomTableViewCell *cell;
@property (strong, nonatomic) parserData *parse;
@property (strong,nonatomic) GetData *getdata;
@property (strong,nonatomic) NSMutableArray *allNewOnDisplay;
@property float numberProgress;
@property (nonatomic) NSInteger numberOfItemInSection0;
@property (nonatomic) NSInteger numberOfItemInSection1;
@property (nonatomic) NSInteger numberOfItemInSection2;
@property (nonatomic) NSInteger numberOfItemInSection3;
@property (nonatomic) NSInteger numberOfItemInSection4;
@end

@implementation CustomCellTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=titleApp;
    
    //Create customTableViewCell
    _cell = [CustomTableViewCell alloc];
    
    //create parserData by Link;
    _parse =[parserData alloc];
    _getdata =[GetData alloc];
    _allNewOnDisplay = [[NSMutableArray alloc] init];
    
    self.tableViewNews.alwaysBounceVertical=YES;
    self.tableViewNews.hidden=true;
    self.pgvLogin.hidden=true;
    // 1/10/3/7/5
    _numberOfItemInSection0=1;
    _numberOfItemInSection1=10;
    _numberOfItemInSection2=3;
    _numberOfItemInSection3=7;
    _numberOfItemInSection4=5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return numberOfSection;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger numberOfItem = 0;
    
    numberOfItem=[[[_allNewOnDisplay objectAtIndex:section] objectAtIndex:locationOfItemTag]count];
    NSInteger numberOfCell=numberOfItem/numberDivideToGetNumberOfCell;
    if (numberOfCell*doubleRowToGetItemLeftSide==numberOfItem) {
        return numberOfCell;
    }
    else{
        return numberOfCell+oneCell;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _cell = [_tableViewNews dequeueReusableCellWithIdentifier:customCellIdentifier forIndexPath:indexPath];
    /* 
    - hard to read code (use define object,do not use array to manage array)
    -

     */
    /*
     
    -step 1: find objects what need to display
    -step 2: set objects for this cell
    
     */
       //Load information to Cell
    NSUInteger numberOfItems =[[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:locationOfItemTag] count];
    
    if((indexPath.row*doubleRowToGetItemLeftSide) <= numberOfItems){
        [_cell loadIntentForLeftCell:
         [[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:indexOfTitle] objectAtIndex:indexPath.row*doubleRowToGetItemLeftSide]
                     description:
         [[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:indexOfDescription] objectAtIndex:indexPath.row*doubleRowToGetItemLeftSide]
                            link:
         [[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:indexOfImageUrl] objectAtIndex:indexPath.row*doubleRowToGetItemLeftSide]
                            date:
         [[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:indexOfDate] objectAtIndex:indexPath.row*doubleRowToGetItemLeftSide]]
        ;
    }
    if ((indexPath.row*doubleRowToGetItemLeftSide+itemRightSide) < numberOfItems) {
            
        [_cell loadIntentForRightCell:
         [[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:indexOfTitle] objectAtIndex:indexPath.row*doubleRowToGetItemLeftSide+itemRightSide]
                      description:
         [[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:indexOfDescription] objectAtIndex:indexPath.row*doubleRowToGetItemLeftSide+itemRightSide]
                             link:
         [[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:indexOfImageUrl] objectAtIndex:indexPath.row*doubleRowToGetItemLeftSide+itemRightSide]
                             date:
         [[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:indexOfDate] objectAtIndex:indexPath.row*doubleRowToGetItemLeftSide+itemRightSide]];
    }
    else
    {
        [_cell loadIntentForRightCell:blank description:blank link:blank date:blank];
    }
   
    return _cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CGPoint touchPoint = [sender convertPoint:CGPointZero toView:_tableViewNews]; // maintable --> replace your tableview name
    
    NSIndexPath *clickedButtonIndexPath = [_tableViewNews indexPathForRowAtPoint:touchPoint];
//    NSUInteger numberOfItems =[[[_allNewOnDisplay objectAtIndex:clickedButtonIndexPath.section] objectAtIndex:locationOfItemTag] count];
//    if (clickedButtonIndexPath.row*doubleRowToGetItemLeftSide<numberOfItems) {
//        
        if ([segue.identifier isEqualToString:@"leftButtonSegue"]) {
            webViewController *webView = (webViewController *)segue.destinationViewController;
            webView.url=[[[_allNewOnDisplay objectAtIndex:clickedButtonIndexPath.section] objectAtIndex:indexOfUrl] objectAtIndex:clickedButtonIndexPath.row*doubleRowToGetItemLeftSide];
        }
        else if([segue.identifier isEqualToString:@"rightButtonSegue"]){
            webViewController *webView = (webViewController *)segue.destinationViewController;
            webView.url=[[[_allNewOnDisplay objectAtIndex:clickedButtonIndexPath.section] objectAtIndex:indexOfUrl] objectAtIndex:clickedButtonIndexPath.row*doubleRowToGetItemLeftSide+itemRightSide];
        }
//    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return stringHomePage;
            break;
        case 1:
            return stringNews;
            break;
        case 2:
            return stringWorld;
            break;
        case 3:
            return stringHeathy;
            break;
        case 4:
            return stringEducation;
            break;
        default:return blank;
            break;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return heightForRow;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = alphaZero;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = alphaOne;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
}

- (IBAction)loginFacebook:(UIButton *)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
             [self unHiden];
         }
     }];
}
-(void)unHiden{
    [_allNewOnDisplay addObject:[_parse startParsing:urlHomePage numberOfItem:_numberOfItemInSection0]];
    
    [UIView animateWithDuration:animateDurationOne animations:^{
        [_btnLogin setAlpha:alphaZero];
        
    } completion:^(BOOL finished) {
        self.pgvLogin.hidden=false;
        [UIView animateWithDuration:animateDurationOne animations:^{
            [_pgvLogin setAlpha:alphaOne];
        } completion:^(BOOL finished) {
            [NSTimer  scheduledTimerWithTimeInterval:timerChange target:self selector:@selector(increaseNumber) userInfo:nil repeats:true];
            [NSTimer scheduledTimerWithTimeInterval:timerThree repeats:false block:^(NSTimer * _Nonnull timer) {
                if (_pgvLogin.progress == progressBarStateFull){
                    [_pgvLogin setHidden:true];
                    [_tableViewNews setAlpha:alphaZero];
                    [_lblLogin setAlpha:alphaZero];
                    [_tableViewNews setHidden:false];
                    [_tableViewNews setDelegate:self];
                    [_tableViewNews setDataSource:self];
                    [self.navigationController setNavigationBarHidden:false];
                    [NSThread detachNewThreadSelector:@selector(startTheBackgroundJob) toTarget:self withObject:nil];
                    _cell = [CustomTableViewCell alloc];
                    [_tableViewNews setAutoresizesSubviews:true];
                    [_tableViewNews layoutIfNeeded];
                    [UIView animateWithDuration:animateDurationTwo animations:^{
                        [_tableViewNews setAlpha:alphaOne];
                    }];
                }
            }];
        }];
    }];
}
-(void)startTheBackgroundJob{
    [_allNewOnDisplay addObject:[_parse startParsing:urlNews numberOfItem:_numberOfItemInSection1]];
    [_allNewOnDisplay addObject:[_parse startParsing:urlWorld numberOfItem:_numberOfItemInSection2]];
    [_allNewOnDisplay addObject:[_parse startParsing:urlHeathy numberOfItem:_numberOfItemInSection3]];
    [_allNewOnDisplay addObject:[_parse startParsing:urlEducation numberOfItem:_numberOfItemInSection4]];
}
-(void)increaseNumber{
    if (_pgvLogin.progress != progressBarStateFull) {
        float one = progressBarStateFull;
        float two = [[_allNewOnDisplay objectAtIndex:indexOfHomePage] count]*progressBarLastState;
        _numberProgress += one/two;
        
        [_pgvLogin  setProgress:_numberProgress];
        NSLog(formatFloat,_pgvLogin.progress);
    }
}
@end
