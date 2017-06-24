//
//  LineFlowLayout.m
//  DiscoverCollectionView
//
//  Created by KterKC on 6/16/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "LineFlowLayout.h"

@implementation LineFlowLayout
-(void)prepareLayout{
    [super prepareLayout];
    _arrayAttributes = [[NSMutableArray alloc] initWithObjects:[UICollectionViewLayoutAttributes alloc], nil];
}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *superLayoutAttributes = [[NSArray alloc] initWithObjects:[UICollectionViewLayoutAttributes alloc], nil];
    superLayoutAttributes = [super layoutAttributesForElementsInRect:rect];
    double collecViewCenterY = rect.size.height * 0.5;
    UICollectionViewLayoutAttributes * attributes;
    for ( attributes in superLayoutAttributes) {
         UICollectionViewLayoutAttributes * coppy = attributes.copy;
        int deltaY = fabs(collecViewCenterY - (coppy.center.y - rect.origin.y));
        if (deltaY < rect.size.height) {
            double scale = 1.0 - deltaY/collecViewCenterY;
            coppy.transform = CGAffineTransformMakeScale(scale, scale);
        }
        [_arrayAttributes addObject:coppy];
    }return _arrayAttributes;
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}
@end
