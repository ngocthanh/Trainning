//
//  ModelRequest.h
//  DiscoverCollectionView
//
//  Created by KterKC on 6/9/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelRequest : NSObject <NSXMLParserDelegate>
-(void)getConnection:(NSString*) nameRSS;
@property (strong, nonatomic) NSMutableDictionary *dictPart;
@property (strong, nonatomic) NSMutableArray *arrayData;
@property (strong, nonatomic) NSMutableString *arrayString;
@property (strong, nonatomic) NSMutableArray *arrayTime;
@property (strong, nonatomic) NSMutableArray *arrayDescription;
@property (strong, nonatomic) NSMutableArray *arrayTitle;
@property (strong, nonatomic) NSMutableArray *arrayLink;
@property (strong, nonatomic) NSString *url;
@property (nonatomic) NSInteger numberData;
@property (strong, nonatomic) NSXMLParser *parser;
-(void)setArrayDataForCollectionView:(NSInteger) number;
@end
