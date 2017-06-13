//
//  parserData.m
//  ReadingNEWS
//
//  Created by dankhanh on 6/12/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import "parserData.h"

@implementation parserData
- (void)startParsing : (NSString *)urlLink{
    NSXMLParser *xmlparser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:urlLink]];
    [xmlparser setDelegate:self];
    [xmlparser parse];
    
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
{
    if([elementName isEqualToString:@"rss"])
        _arrayXMLData = [[NSMutableArray alloc] init];
    if([elementName isEqualToString:@"item"])
        _mdictXMLPart = [[NSMutableDictionary alloc] init];
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
{
    if(!_mstrXMLString)
        _mstrXMLString = [[NSMutableString alloc] initWithString:string];
    else
        [_mstrXMLString appendString:string];
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;
{
    if([elementName isEqualToString:@"title"] || [elementName isEqualToString:@"description"] ||[elementName isEqualToString:@"pubDate"])
    {
        [_mdictXMLPart setObject:_mstrXMLString forKey:elementName];
    }
    if([elementName isEqualToString:@"item"]){
        [_arrayXMLData addObject:_mdictXMLPart];
    }
    _mstrXMLString= nil;
}
@end
