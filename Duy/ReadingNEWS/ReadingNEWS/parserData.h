//
//  parserData.h
//  ReadingNEWS
//
//  Created by dankhanh on 6/12/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface parserData : NSObject <NSXMLParserDelegate>
- (void)startParsing : (NSString *)urlLink;
@property (nonatomic, strong) NSMutableDictionary *dictionaryData;
@property (nonatomic,strong) NSMutableArray *arrayXMLData;
@property (nonatomic,strong) NSMutableString *mstrXMLString;
@property (nonatomic,strong) NSMutableDictionary *mdictXMLPart;

@end

