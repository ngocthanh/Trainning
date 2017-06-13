//
//  ModelRequest.m
//  DiscoverCollectionView
//
//  Created by KterKC on 6/9/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "ModelRequest.h"

@implementation ModelRequest 
//http://vnexpress.net/rss/oto-xe-may.rss
//http://vnexpress.net/rss/giao-duc.rss
//http://vnexpress.net/rss/so-hoa.rss
//http://vnexpress.net/rss/the-thao.rss
-(void)getConnection:(NSString*) nameRSS{
    NSString *baseURL = @"http://vnexpress.net/rss/";
    _url = [NSString stringWithFormat:@"%@%@",baseURL,nameRSS];
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:_url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        _parser = [[NSXMLParser alloc] initWithData:data];

    }]resume];
    
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
//    if ([elementName isEqualToString:@"rss"]) {
//        marrXMLData = [[NSMutableArray alloc] init];
//    }
//    if ([elementName isEqualToString:@"item"]) {
//        mdictXMLPart = [[NSMutableDictionary alloc] init];
//    }
    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
}
@end
