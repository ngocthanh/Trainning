//
//  ModelRequest.m
//  DiscoverCollectionView
//
//  Created by KterKC on 6/9/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "ModelRequest.h"

@implementation ModelRequest 

-(NSArray*)getConnection:(NSString*) nameRSS{
    _arrayTitle = [[NSMutableArray alloc] init];
    _arrayTime = [[NSMutableArray alloc] init];
    _arrayDescription = [[NSMutableArray alloc] init];
    _arrayLink = [[NSMutableArray alloc] init];
    NSString *baseURL = @"http://vnexpress.net/rss/";
    _url = [NSString stringWithFormat:@"%@%@",baseURL,nameRSS];

            NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:[[NSURL alloc] initWithString:_url]];
            [parser setDelegate:self];
            [parser parse];

    
    //    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:_url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    //        if (data!= nil) {[
//        }
//        
//    }]resume];
    for (int i = 0; i<[self.arrayData count]; i++) {
        [self setArrayDataForCollectionView:i];
    }
    NSArray *all =[[NSArray alloc] initWithObjects:_arrayTitle,_arrayTime,_arrayDescription,_arrayLink, nil];
    return all;
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

-(void)setArrayDataForCollectionView:(NSInteger) number{
    NSString *string;
    NSString *result;
    
    string = [[[_arrayData objectAtIndex:number] valueForKey:@"title"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] ;
    [_arrayTitle addObject:string];
    ///-------------------
    
    string = [[[_arrayData objectAtIndex:number] valueForKey:@"pubDate"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] ;
    result = [self formatDateDDMMYYY:string];
    if (result.length>0) {
        [_arrayTime addObject:result];
    }
    ///-------------------
    
    string = [[[_arrayData objectAtIndex:number] valueForKey:@"description"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] ;
    result = [self strimString:string Pattern:@"src=\"([^\"]+)"];
    if (result.length>0) {
        [_arrayLink addObject:result];
    }
    //--------------------
    
    result = [self strimString:string Pattern:@"</br>([^&]+)"];
    if (result.length>0) {
        [_arrayDescription addObject:result];
        
    }
    
}
-(NSString*)strimString:(NSString*) stringNeedToStrim Pattern:(NSString*) patternString {
    NSError *error = nil;
    NSString *pattern = patternString;

    NSRange range = NSMakeRange(0, stringNeedToStrim.length);
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSArray *matches = [regex matchesInString:stringNeedToStrim options:0 range:range];
    
    for (NSTextCheckingResult* match in matches) {
        NSRange group1 = [match rangeAtIndex:1];
        return [stringNeedToStrim substringWithRange:group1];
    }
    return nil;
}
-(NSString*)formatDateDDMMYYY:(NSString*) stringDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat =@"EE, d LLLL yyyy HH:mm:ss Z";
    NSDate *date = [dateFormatter dateFromString:stringDate];
    dateFormatter.dateFormat = @"dd/MM/yyyy HH:mm";
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

@end


