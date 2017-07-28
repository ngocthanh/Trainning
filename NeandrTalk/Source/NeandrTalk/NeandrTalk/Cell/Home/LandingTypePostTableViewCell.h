//
//  LandingTypePostTableViewCell.h
//  NeandrTalk
//
//  Created by KterKC on 7/23/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LandingPageViewController.h"

@interface LandingTypePostTableViewCell : UITableViewCell<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *postCollection;
@property (weak, nonatomic) IBOutlet UILabel *titleTypePost;
@property (weak, nonatomic) IBOutlet UILabel *descriptionTypePost;
@property (strong ,nonatomic) NSArray *dataPosts;
-(void)getDataWithTitleTypePost:(NSString*)titleType Posts:(NSArray*)posts View:(LandingPageViewController*) vc;
@property (strong ,nonatomic) LandingPageViewController *home;
@end
