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
#import "CustomString.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#define heightForRow 250
#define numberOfSection 5
#define indexOfNext 1
#define stringHomePage @"Trang chủ"
#define stringNews @"Thời sự"
#define stringWolrd @"Thế giới"
#define stringHeathy @"Sức khoẻ"
#define stringEducation @"Giáo dục"
#define blank @""
#define oneCell 1
#define titleApp @"VN Express"


@interface CustomCellTableViewController ()
- (IBAction)loginFacebook:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIProgressView *pgvLogin;

@property (weak, nonatomic) IBOutlet UITableView *tableViewNews;
@property (strong, nonatomic) CustomTableViewCell *cell;
@property (strong, nonatomic) parserData *parse;
@property (strong,nonatomic) GetData *getdata;
@property (strong,nonatomic) CustomString *custom;
@property (strong,nonatomic) NSMutableArray *allNewOnDisplay;

@property float numberProgress;

@end

@implementation CustomCellTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=titleApp;
    
    //Create customTableViewCell
    _cell = [CustomTableViewCell alloc];
    
    //create parserData by Link;
    _parse =[parserData alloc];
    _custom=[CustomString alloc];
    _getdata =[GetData alloc];
    _allNewOnDisplay = [[NSMutableArray alloc] init];
    
    self.tableViewNews.alwaysBounceVertical=YES;
    self.tableViewNews.hidden=true;
    self.pgvLogin.hidden=true;
    
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
    
    NSInteger numberOfItem;
    
    numberOfItem=[[[_allNewOnDisplay objectAtIndex:section] objectAtIndex:0]count];
    NSInteger numberOfCell=numberOfItem/2;
    if (numberOfCell*2==numberOfItem) {
        return numberOfCell;
    }
    else{
        
        return numberOfCell+oneCell;
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _cell = [_tableViewNews dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
       //Load information to Cell
    NSUInteger numberOfItems=[[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:0] count];
    if((indexPath.row*2) <= numberOfItems){
        [_cell loadIntentForLeftCell:
         [[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:0] objectAtIndex:indexPath.row*2]
                     description:
         [[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:1] objectAtIndex:indexPath.row*2]
                            link:
         [[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:2] objectAtIndex:indexPath.row*2]
                            date:
         [[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:3] objectAtIndex:indexPath.row*2]];
       
    }
    
    
    if ((indexPath.row*2+indexOfNext) < numberOfItems) {
            
        [_cell loadIntentForRightCell:
         [[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:0] objectAtIndex:indexPath.row*2+indexOfNext]
                      description:
         [[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:1] objectAtIndex:indexPath.row*2+indexOfNext]
                             link:
         [[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:2] objectAtIndex:indexPath.row*2+indexOfNext]
                             date:
         [[[_allNewOnDisplay objectAtIndex:indexPath.section] objectAtIndex:3] objectAtIndex:indexPath.row*2+indexOfNext]];
    }
    else
    {
        [_cell loadIntentForRightCell:nil description:blank link:blank date:blank];
    }
   
    return _cell;
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
            return stringWolrd;
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
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
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
    
    [_allNewOnDisplay addObject:[_parse startParsing:@"http://vnexpress.net/rss/tin-moi-nhat.rss"]];
    
    [UIView animateWithDuration:1 animations:^{
        [_btnLogin setAlpha:0];
        
    } completion:^(BOOL finished) {
        self.pgvLogin.hidden=false;
        [UIView animateWithDuration:1 animations:^{
            [_pgvLogin setAlpha:1];
        } completion:^(BOOL finished) {
            [NSTimer  scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(increaseNumber) userInfo:nil repeats:true];
            [NSTimer scheduledTimerWithTimeInterval:3 repeats:false block:^(NSTimer * _Nonnull timer) {
                if (_pgvLogin.progress == 1){
                    [_pgvLogin setHidden:true];
                    [_tableViewNews setAlpha:0];
                    [_lblLogin setAlpha:0];
                    [_tableViewNews setHidden:false];
                    [_tableViewNews setDelegate:self];
                    [_tableViewNews setDataSource:self];
                    [self.navigationController setNavigationBarHidden:false];
                    [NSThread detachNewThreadSelector:@selector(startTheBackgroundJob) toTarget:self withObject:nil];
                    _cell = [CustomTableViewCell alloc];
                    [_tableViewNews setAutoresizesSubviews:true];
                    [_tableViewNews layoutIfNeeded];
                    [UIView animateWithDuration:2 animations:^{
                        [_tableViewNews setAlpha:1];
                        
                        
                    }];
                }
            }];
        }];
    }];
}
-(void)startTheBackgroundJob{
    [_allNewOnDisplay addObject:[_parse startParsing:@"http://vnexpress.net/rss/thoi-su.rss"]];
    [_allNewOnDisplay addObject:[_parse startParsing:@"http://vnexpress.net/rss/the-gioi.rss"]];
    [_allNewOnDisplay addObject:[_parse startParsing:@"http://vnexpress.net/rss/suc-khoe.rss"]];
    [_allNewOnDisplay addObject:[_parse startParsing:@"http://vnexpress.net/rss/giao-duc.rss"]];
}
-(void)increaseNumber{
    if (_pgvLogin.progress != 1) {
        float one = 1;
        float two = [[_allNewOnDisplay objectAtIndex:0] count]*10;
        _numberProgress += one/two;
        
        [_pgvLogin  setProgress:_numberProgress];//
        NSLog(@"%f",_pgvLogin.progress);
    }
}
@end
