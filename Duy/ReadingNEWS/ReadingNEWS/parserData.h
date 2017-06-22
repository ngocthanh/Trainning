//
//  parserData.h
//  ReadingNEWS
//
//  Created by dankhanh on 6/12/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface parserData : NSObject <NSXMLParserDelegate>
- (NSArray*)startParsing : (NSString *)urlLink numberOfItem:(NSInteger) numberOfItem;
-(void) setDataForAllArray;
@property (nonatomic,strong) NSMutableDictionary *dictionaryData;
@property (nonatomic,strong) NSMutableArray *arrayXMLData;
@property (nonatomic,strong) NSMutableString *mstrXMLString;
@property (nonatomic,strong) NSMutableDictionary *mdictXMLPart;
@property (nonatomic,strong) NSMutableArray *allTitle;
@property (nonatomic,strong) NSMutableArray *allDescription;
@property (nonatomic,strong) NSMutableArray *allImageLink;
@property (nonatomic,strong) NSMutableArray *allDate;
@end

