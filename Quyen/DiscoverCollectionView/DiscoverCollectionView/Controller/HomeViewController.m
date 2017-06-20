//
//  HomeViewController.m
//  DiscoverCollectionView
//
//  Created by KterKC on 6/12/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "HomeViewController.h"
#import "DiscoverCollectionViewCell.h"
#import <UIKit/UICollectionViewFlowLayout.h>
#import "CollectionReusableView.h"
#import "ModelRequest.h"
#import "LineFlowLayout.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
 
@interface HomeViewController ()
@property (weak,   nonatomic) IBOutlet UICollectionView *discoverCollectionView;
@property (strong, nonatomic) DiscoverCollectionViewCell *cell;
@property (strong, nonatomic) NSArray *imageName;
@property (strong, nonatomic) UICollectionViewFlowLayout *flow;
@property (strong, nonatomic) NSArray *nameSection;
@property (strong, nonatomic) ModelRequest *model;
@property (strong, nonatomic) NSMutableArray *allArray;
@property (weak, nonatomic) IBOutlet UILabel *lblLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIProgressView *progessView;
@property (strong, nonatomic)  LineFlowLayout *lineLayout;
@property float numberProgress;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //General

    self.discoverCollectionView.alwaysBounceVertical = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.6 green:0.01 blue:0.3 alpha:1];
    
    [[self navigationItem] setTitle:titleNavicontroller];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [_discoverCollectionView setHidden:true];
    [self.navigationController setNavigationBarHidden:true];
    [_lblLogin setHidden:false];
    [_btnLogin setHidden:false];
    _model = [ModelRequest alloc];
    _numberProgress = 0.0;
    [_progessView setAlpha:0];
    [_progessView setProgress:0.0 animated:false];
    _allArray = [[NSMutableArray alloc] init];
    if ([FBSDKAccessToken currentAccessToken]) {
                [self unHiden];
    }
}
- (IBAction)abtnLoginFB:(id)sender {
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
             [self unHiden];
             
             NSLog(@"Logged in");
         }
     }];
}

-(void)unHiden{
   
    [_allArray addObject:[_model getConnection:@"tin-moi-nhat.rss"]];
    [UIView animateWithDuration:1 animations:^{
        [_btnLogin setAlpha:0];
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            [_progessView setAlpha:1];
        } completion:^(BOOL finished) {
            [NSTimer  scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(increaseNumber) userInfo:nil repeats:true];
            [NSTimer scheduledTimerWithTimeInterval:3 repeats:false block:^(NSTimer * _Nonnull timer) {
                if (_progessView.progress == 1){
                    [_progessView setHidden:true];
                    [_discoverCollectionView setAlpha:0];
                    [_lblLogin setAlpha:0];
                    [_discoverCollectionView setHidden:false];
                    
                    [self.navigationController setNavigationBarHidden:false];
                    [NSThread detachNewThreadSelector:@selector(startTheBackgroundJob) toTarget:self withObject:nil];
                    _cell = [DiscoverCollectionViewCell alloc];
                    [_discoverCollectionView setAutoresizesSubviews:true];
                    [_discoverCollectionView layoutIfNeeded];
                    [_discoverCollectionView setDelegate:self];
                    [_discoverCollectionView setDataSource:self];
                    _nameSection = [NSArray arrayWithObjects:@"Trang Chủ",@"Số Hoá",@"Thể Thao",@"Giáo Dục",@"Xe", nil];
                    [_discoverCollectionView registerNib:[UINib nibWithNibName:@"DiscoverCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"homecell"];
                    [_discoverCollectionView registerNib:[UINib nibWithNibName:@"CollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"supplementHome"];
                    [UIView animateWithDuration:2 animations:^{
                        [_discoverCollectionView setAlpha:1];
                        //[_lblLogin setAlpha:0];
                        
                    }];
                    
                }

            }];
        }];
        
    }];
    
}
-(void)increaseNumber{
    if (_progessView.progress != 1) {
        float one = 1;
        float two = [[_allArray objectAtIndex:0] count]*10;
        _numberProgress += one/two;
        
        [_progessView  setProgress:_numberProgress];//
        NSLog(@"%f",_progessView.progress);
    }
}
-(void)setLineLayout{
    _lineLayout = [[LineFlowLayout alloc] init];
    _lineLayout.itemSize = CGSizeMake((self.view.frame.size.width -30 )/2, (self.view.frame.size.height - 30)/3);
    _discoverCollectionView.collectionViewLayout = _lineLayout;
}

-(void)startTheBackgroundJob{
    [_allArray addObject:[_model getConnection:@"so-hoa.rss"]];
    [_allArray addObject:[_model getConnection:@"the-thao.rss"]];
    [_allArray addObject:[_model getConnection:@"giao-duc.rss"]];
    [_allArray addObject:[_model getConnection:@"oto-xe-may.rss"]];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_model.arrayData count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    

    return [self.nameSection count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    _cell = [_discoverCollectionView dequeueReusableCellWithReuseIdentifier:@"homecell" forIndexPath: indexPath];
    
    NSLog(@"%ld",(long)indexPath.row);
    [_cell getDataForImageAndTitle:[[[_allArray objectAtIndex:indexPath.section] objectAtIndex:0]objectAtIndex:indexPath.row]
                            Time:[[[_allArray objectAtIndex:indexPath.section] objectAtIndex:1]objectAtIndex:indexPath.row]
                      Description:[[[_allArray objectAtIndex:indexPath.section] objectAtIndex:2]objectAtIndex:indexPath.row]
                     LinkURLImage:[[[_allArray objectAtIndex:indexPath.section] objectAtIndex:3]objectAtIndex:indexPath.row]
     ];
    return _cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview;
    CollectionReusableView *collectionSection = [_discoverCollectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"supplementHome" forIndexPath:indexPath];
    [collectionSection getDataForTitleSection:_nameSection[indexPath.section]];
    
    reusableview = collectionSection;
        return reusableview;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
   // UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    
//    if(orientation == UIInterfaceOrientationPortrait){
//        return CGSizeMake((self.view.frame.size.width - 30)/2, self.view.frame.size.height/3);
//    }else if(orientation == UIInterfaceOrientationLandscapeLeft){
//        NSLog(@"OK Left");
//         return CGSizeMake((self.view.frame.size.height - 40)/3, self.view.frame.size.height/3);
//        
//    }else if(orientation == UIInterfaceOrientationLandscapeRight){
//        NSLog(@"OK Right");
//         return CGSizeMake((self.view.frame.size.height - 40)/3, self.view.frame.size.height/3);
//    }

     return CGSizeMake((self.view.frame.size.width - 30)/2, self.view.frame.size.height/3);;
    
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}


@end
