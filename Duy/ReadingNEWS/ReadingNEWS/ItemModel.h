//
//  ItemModel.h
//  ReadingNEWS
//
//  Created by dankhanh on 6/23/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *itemDescription;
@property (nonatomic,strong) NSDate *date;
@property (nonatomic,strong) NSString *imageUrl;

@end
