//
//  CollectionReusableView.h
//  DiscoverCollectionView
//
//  Created by KterKC on 6/12/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionReusableView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
-(void)getDataForTitleSection:(NSString*) title;
@end
