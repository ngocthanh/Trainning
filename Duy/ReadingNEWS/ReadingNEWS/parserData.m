//
//  parserData.m
//  ReadingNEWS
//
//  Created by dankhanh on 6/12/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import "parserData.h"
#import "defineApp.h"

@implementation parserData
- (NSArray *)startParsing : (NSString *)urlLink numberOfItem: (NSInteger)numberOfItem{
    
    
    _allTitle=[[NSMutableArray alloc] init];
    _allDescription=[[NSMutableArray alloc] init];
    _allImageLink=[[NSMutableArray alloc] init];
    _allDate=[[NSMutableArray alloc] init];
    
    NSXMLParser *xmlparser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:urlLink]];
    [xmlparser setDelegate:self];
    [xmlparser parse];
    [self setDataForAllArray:numberOfItem];
    NSArray *allIn1Section=[[NSArray alloc] initWithObjects:_allTitle,_allDescription,_allImageLink,_allDate, nil];

    return allIn1Section;
     
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
{
    if([elementName isEqualToString:elementRss])
        _arrayXMLData = [[NSMutableArray alloc] init];
    if([elementName isEqualToString:elementItem])
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
    if([elementName isEqualToString:elementTitle] || [elementName isEqualToString:elementDescription] ||[elementName isEqualToString:elementPudDate])
    {
        [_mdictXMLPart setObject:_mstrXMLString forKey:elementName];
    }
    if([elementName isEqualToString:elementItem]){
        [_arrayXMLData addObject:_mdictXMLPart];
    }
    _mstrXMLString = nil;
}
-(void) setDataForAllArray :(NSInteger)numberOfItem{
    NSString *string=blank;
    NSString *result;
    
    for (int number=indexStartup;number<numberOfItem;number++)
    {
        string=[[[_arrayXMLData objectAtIndex:number] valueForKey:elementTitle] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (string.length>noExistValue) {
            [_allTitle addObject:string];
        }
        else
            [_allTitle addObject:blank];
        
    
        string=[NSString stringWithFormat:formatString,[[[_arrayXMLData objectAtIndex:number] valueForKey:elementPudDate] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
        if (string.length>noExistValue) {
            result=[self customDate:string];
            if (result.length>noExistValue) {
                [_allDate addObject:result];
            }
        }
        else
            [_allDate addObject:blank];
    
        string=[[[_arrayXMLData objectAtIndex:number] valueForKey:elementDescription] stringByTrimmingCharactersInSet:                  [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if (string.length>noExistValue) {
            result=[self getDescriptionInString:string];
            if (result.length>noExistValue) {
                [_allDescription addObject:result];
            }
            else{
                [_allDescription addObject:string];
            }
        }
        else
            [_allDescription addObject:blank];
        
        string=[[[_arrayXMLData objectAtIndex:number] valueForKey:elementDescription] stringByTrimmingCharactersInSet:                  [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (string.length>noExistValue) {
            result=[self getImageLinkInString:string];
            if (result.length>noExistValue) {
                [_allImageLink addObject:result];
            }
            else{
                [_allImageLink addObject:urlLogoVnexpress];
            }
        }
        else
            [_allImageLink addObject:urlLogoVnexpress];
    }
}


-(id)customDate:(NSString *)normalDate{
    NSString *substring=[normalDate substringWithRange:NSMakeRange(indexAt5InString, indexAt11InString)];
    NSString *day=[substring substringToIndex:indexAt2InString];
    NSString *month=[substring substringWithRange:NSMakeRange(indexAt3InString, indexAt3InString)];
    NSString *year=[substring substringFromIndex:indexAt7InString];
    month=[self convertMonth:month];
    normalDate = [NSString stringWithFormat:formatCustomDate,year,month,day];
   
    return normalDate;
}
-(id)convertMonth: (NSString *)month{
    NSString *numberAsMonth;
    if ([month isEqualToString:month1String]) {
        numberAsMonth=month1Number;
    }else if ([month isEqualToString:month2String]){
        numberAsMonth=month2Number;
    }else if ([month isEqualToString:month3String]){
        numberAsMonth=month3Number;
    }else if ([month isEqualToString:month4String]){
        numberAsMonth=month4Number;
    }else if ([month isEqualToString:month5String]){
        numberAsMonth=month5Number;
    }else if ([month isEqualToString:month6String]){
        numberAsMonth=month6Number;
    }else if ([month isEqualToString:month7String]){
        numberAsMonth=month7Number;
    }else if ([month isEqualToString:month8String]){
        numberAsMonth=month8Number;
    }else if ([month isEqualToString:month9String]){
        numberAsMonth=month9Number;
    }else if ([month isEqualToString:month10String]){
        numberAsMonth=month10Number;
    }else if ([month isEqualToString:month11String]){
        numberAsMonth=month11Number;
    }else if ([month isEqualToString:month12String]){
        numberAsMonth=month12Number;
    }else
        numberAsMonth=blank;
    return numberAsMonth;
}
-(id)getImageLinkInString:(NSString *)descriptionString{
    NSString *imageLink=blank;
    
    NSError *error = nil;
    NSString *pattern = patternOfImageUrl;
    NSRange range = NSMakeRange(indexAt0InString, descriptionString.length);
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSArray *matches = [regex matchesInString:descriptionString options:numberOfOption range:range];
    for (NSTextCheckingResult* match in matches) {
        NSRange group1 = [match rangeAtIndex:firstLocationAtArray];
        imageLink=[NSString stringWithFormat:formatString, [descriptionString substringWithRange:group1]];
    }
    return imageLink;
    
}
-(id)getDescriptionInString: (NSString*)descriptionString{
    NSString *description=blank;
    NSError *error = nil;
    NSString *pattern = patternOfDescription;
    NSRange range = NSMakeRange(indexAt0InString, descriptionString.length);
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSArray *matches = [regex matchesInString:descriptionString options:numberOfOption range:range];
    for (NSTextCheckingResult* match in matches) {
        NSRange group1 = [match rangeAtIndex:firstLocationAtArray];
        description=[NSString stringWithFormat:formatString, [descriptionString substringWithRange:group1]];
    }
    return description;
}
@end
