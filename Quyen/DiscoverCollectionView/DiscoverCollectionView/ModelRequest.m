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

            NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:[[NSURL alloc] initWithString:_url]];
            [parser setDelegate:self];
            [parser parse];
    NSLog(@"%@",_arrayData);
    
    //    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:_url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    //        if (data!= nil) {[
//        }
//        
//    }]resume];
    
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    if ([elementName isEqualToString:@"rss"]) {
        _arrayData = [[NSMutableArray alloc] init];
    }
    if ([elementName isEqualToString:@"item"]) {
        _dictPart = [[NSMutableDictionary alloc] init];
    }
    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if (!_arrayString) {
        _arrayString = [[NSMutableString alloc] initWithString:string];
    }else {
        [_arrayString appendString:string];
    }
    
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    	if ([elementName isEqualToString:@"title"] || [elementName isEqualToString:@"pubDate" ]|| [elementName isEqualToString:@"description"] ) {
            [_dictPart setObject:_arrayString forKey:elementName];
        }
        if ([elementName isEqualToString:@"item"]) {
            [_arrayData addObject:_dictPart];
            
        }
    _arrayString = nil;
    
}
//-(void)setData{
//    [[[_arrayData objectAtIndex:] valueForKey:@"title"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
//}

@end
