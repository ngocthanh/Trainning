//
//  ModelRequest.h
//  DiscoverCollectionView
//
//  Created by KterKC on 6/9/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelRequest : NSObject <NSXMLParserDelegate>
@property (strong, nonatomic) NSMutableArray *arrayTitle;
@property (strong, nonatomic) NSMutableArray *arrayImage;
@property (strong, nonatomic) NSMutableArray *arrayTime;
@property (strong, nonatomic) NSMutableArray *arrayDescription;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSXMLParser *parser;

-(void)getConnection:(NSString*) nameRSS;

@end
