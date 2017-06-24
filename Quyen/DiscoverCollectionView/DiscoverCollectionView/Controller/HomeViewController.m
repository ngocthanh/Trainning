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
#import "DisplayedNewsViewController.h"

@interface HomeViewController()

@property (weak, nonatomic) IBOutlet UICollectionView *discoverCollectionView;
@property (weak, nonatomic) IBOutlet UIProgressView *progessView;
@property (weak, nonatomic) IBOutlet UILabel *lblLogin;

@property (strong, nonatomic) UICollectionViewFlowLayout *flow;
@property (strong, nonatomic) NSMutableArray *allArray;
@property (strong, nonatomic) NSArray *imageName;
@property (strong, nonatomic) NSArray *nameSection;

@property (strong, nonatomic) DiscoverCollectionViewCell *cell;
@property (strong, nonatomic) LineFlowLayout *lineLayout;
@property (strong, nonatomic) ModelRequest *model;


@property float numberProgress;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.barTintColor = [DefineColor colorPrimary];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationController setNavigationBarHidden:true];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    _model = [ModelRequest alloc];
    _allArray = [[NSMutableArray alloc] init];
    _numberProgress = floatNumberZero;
    
    [_progessView setAlpha:intZero];
    [_progessView setProgress:floatNumberZero animated:false];
    [_discoverCollectionView setHidden:true];

    if ([FBSDKAccessToken currentAccessToken]) {
        if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
            self.edgesForExtendedLayout = UIRectEdgeNone;

                [self unHiden];
    }
}



-(void)unHiden{
   
    [_allArray addObject:[_model getConnection:urlSecond]];

    if ([[_allArray objectAtIndex:intZero] count] != 0) {
        [UIView animateWithDuration:intOne animations:^{
            [_progessView setAlpha:intOne];
            _lblLogin.text = titleDownloadData;
        } completion:^(BOOL finished) {
            [NSTimer  scheduledTimerWithTimeInterval:timeRepeatForProgress target:self selector:@selector(increaseNumber) userInfo:nil repeats:true];
            [NSThread detachNewThreadSelector:@selector(startTheBackgroundJob) toTarget:self withObject:nil];
            [NSTimer scheduledTimerWithTimeInterval:intThree repeats:false block:^(NSTimer * _Nonnull timer) {
                if (_progessView.progress == intOne){
                    [self.navigationController setNavigationBarHidden:false];
                    _cell = [DiscoverCollectionViewCell alloc];
                    _nameSection = [NSArray arrayWithObjects:titleSecond,titleFirst,titleThird,titleFourth,titleFifth, nil];
                    [_progessView setHidden:true];
                    [_lblLogin setAlpha:intZero];
                    [_discoverCollectionView setHidden:false];
                    [_discoverCollectionView setAlpha:intZero];
                    [_discoverCollectionView layoutIfNeeded];
                    [_discoverCollectionView setDelegate:self];
                    [_discoverCollectionView setDataSource:self];
                    [_discoverCollectionView registerNib:[UINib nibWithNibName: nameCell bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier: idCell];
                    [_discoverCollectionView registerNib:[UINib nibWithNibName: nameSuplementary bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier: idSuplementary];
                    [UIView animateWithDuration:intTwo animations:^{
                        [_discoverCollectionView setAlpha:intOne];
                    }];
                    
                }
                
            }];
        }];
    }
}// 1 ,10,3 ,7 5
-(void)increaseNumber{
    if (_progessView.progress != intOne) {
        float one = intOne;
        float two = [[_allArray objectAtIndex:intZero] count]*intTen;
        _numberProgress += one/two;
        
        [_progessView  setProgress:_numberProgress];
    }
}
//-(void)setLineLayout{
//    _lineLayout = [[LineFlowLayout alloc] init];
//    _lineLayout.itemSize = CGSizeMake((self.view.frame.size.width -30 )/2, (self.view.frame.size.height - 30)/3);
//    _discoverCollectionView.collectionViewLayout = _lineLayout;
//}

-(void)startTheBackgroundJob{
    [_allArray addObject:[_model getConnection: urlFirst]];

    [_allArray addObject:[_model getConnection:urlThird]];
    [_allArray addObject:[_model getConnection:urlFourth]];
    [_allArray addObject:[_model getConnection:urlFifth]];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return [self.nameSection count];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return  [[Helper alloc] setNumberOfRowsInSection:section];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    _cell = [_discoverCollectionView dequeueReusableCellWithReuseIdentifier:idCell forIndexPath: indexPath];
    
    [_cell getDataForImageAndTitle:[[[_allArray objectAtIndex:indexPath.section] objectAtIndex:objectTitle]objectAtIndex:indexPath.row]
                              Time:[[[_allArray objectAtIndex:indexPath.section] objectAtIndex:objectTime]objectAtIndex:indexPath.row]
                       Description:[[[_allArray objectAtIndex:indexPath.section] objectAtIndex:objectDescription]objectAtIndex:indexPath.row]
                      LinkURLImage:[[[_allArray objectAtIndex:indexPath.section] objectAtIndex:objectLinkImage]objectAtIndex:indexPath.row]
                          LinkNews:[[[_allArray objectAtIndex:indexPath.section] objectAtIndex:objectLinkNews]objectAtIndex:indexPath.row]
     ];
    return _cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview;
    CollectionReusableView *collectionSection = [_discoverCollectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:idSuplementary forIndexPath:indexPath];
    [collectionSection getDataForTitleSection:_nameSection[indexPath.section]];
    
    reusableview = collectionSection;
        return reusableview;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DisplayedNewsViewController *displayedViewController = [DisplayedNewsViewController alloc];
    displayedViewController.url = [[[_allArray objectAtIndex:indexPath.section] objectAtIndex:objectLinkNews]objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:displayedViewController animated:YES];
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

     return CGSizeMake((self.view.frame.size.width - intTotalSpaceBetween2Rows)/intTwo, self.view.frame.size.height/intThree);;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return intTen;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(intTen, intTen, intTen, intTen);
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.title = titleVNExpress;

}
-(void)viewWillDisappear:(BOOL)animated{
    self.title = textNil;

}

@end
