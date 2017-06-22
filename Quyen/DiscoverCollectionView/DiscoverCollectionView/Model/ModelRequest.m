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
    NSString *baseURL = urlBase;
    _url = [NSString stringWithFormat:stringAddString,baseURL,nameRSS];
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:[[NSURL alloc] initWithString:_url]];
    [parser setDelegate:self];
    [parser parse];
    
    for (int i = 0; i<[self.arrayData count]; i++) {
        [self setArrayDataForCollectionView:i];
    }
    NSArray *all =[[NSArray alloc] initWithObjects:_arrayTitle,_arrayTime,_arrayDescription,_arrayLink, nil];
    return all;
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    if ([elementName isEqualToString:firstCheckString]) {
        _arrayData = [[NSMutableArray alloc] init];
    }
    if ([elementName isEqualToString: secondCheckString]) {
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
    	if ([elementName isEqualToString:thirdCheckString] || [elementName isEqualToString: fourthCheckString]|| [elementName isEqualToString: fifthCheckString] ) {
            [_dictPart setObject:_arrayString forKey:elementName];
        }
        if ([elementName isEqualToString:secondCheckString]) {
            [_arrayData addObject:_dictPart];
            
        }
    _arrayString = nil;
    
}

-(void)setArrayDataForCollectionView:(NSInteger) number{
    NSString *string;
    NSString *result;
    
    string = [[[_arrayData objectAtIndex:number] valueForKey:thirdCheckString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] ;
    [_arrayTitle addObject:string];
    ///-------------------
    
    string = [[[_arrayData objectAtIndex:number] valueForKey:fourthCheckString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] ;
    result = [[Helper alloc]formatDateDDMMYYY:string];
    if (result.length>0) {
        [_arrayTime addObject:result];
    }
    ///-------------------
    
    string = [[[_arrayData objectAtIndex:number] valueForKey:fifthCheckString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] ;
    result = [[Helper alloc]strimString:string Pattern:patternStringLink];
    if (result.length>0) {
        [_arrayLink addObject:result];
    }
    //--------------------
    
    result = [[Helper alloc]strimString:string Pattern:patternStringDescription];
    if (result.length>0) {
        [_arrayDescription addObject:result];
        
    }
    
}


@end


