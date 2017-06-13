//
//  CollectionReusableView.m
//  DiscoverCollectionView
//
//  Created by KterKC on 6/12/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "CollectionReusableView.h"

@implementation CollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)getDataForTitleSection:(NSString*) title{
    _lblTitle.text = title;
}
@end
