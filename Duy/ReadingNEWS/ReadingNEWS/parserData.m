//
//  parserData.m
//  ReadingNEWS
//
//  Created by dankhanh on 6/12/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import "parserData.h"

@implementation parserData
- (NSArray *)startParsing : (NSString *)urlLink{
    
    
    _allTitle=[[NSMutableArray alloc] init];
    _allDescription=[[NSMutableArray alloc] init];
    _allImageLink=[[NSMutableArray alloc] init];
    _allDate=[[NSMutableArray alloc] init];
    
    NSXMLParser *xmlparser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:urlLink]];
    [xmlparser setDelegate:self];
    [xmlparser parse];
    [self setDataForAllArray];
    NSArray *allIn1Section=[[NSArray alloc] initWithObjects:_allTitle,_allDescription,_allImageLink,_allDate, nil];

    return allIn1Section;
     
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
    _mstrXMLString = nil;
}
-(void) setDataForAllArray{
    NSString *string;
    NSString *result;
    
    for (int number=0;number<[_arrayXMLData count];number++)
    {
        string=[[[_arrayXMLData objectAtIndex:number] valueForKey:@"title"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [_allTitle addObject:string];
    
        string=[NSString stringWithFormat:@"%@",[[[_arrayXMLData objectAtIndex:number] valueForKey:@"pubDate"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
        result=[self customDate:string];
    
        if(result.length>0)
        {
            [_allDate addObject:result];
        }
    
        string=[[[_arrayXMLData objectAtIndex:number] valueForKey:@"description"] stringByTrimmingCharactersInSet:                  [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        result=[self getDescriptionInString:string];
        if (result.length>0) {
            [_allDescription addObject:result];
        }
        
        string=[[[_arrayXMLData objectAtIndex:number] valueForKey:@"description"] stringByTrimmingCharactersInSet:                  [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        result=[self getImageLinkInString:string];
        if (result.length>0) {
            [_allImageLink addObject:result];
        }
    }
}


-(id)customDate:(NSString *)normalDate{
    NSString *substring=[normalDate substringWithRange:NSMakeRange(5, 11)];
    NSString *day=[substring substringToIndex:2];
    NSString *month=[substring substringWithRange:NSMakeRange(3, 3)];
    NSString *year=[substring substringFromIndex:7];
    month=[self convertMonth:month];
    normalDate = [NSString stringWithFormat:@"%@/%@/%@",year,month,day];
   
    return normalDate;
}
-(id)convertMonth: (NSString *)month{
    NSString *numberAsMonth;
    if ([month isEqualToString:@"Jan"]) {
        numberAsMonth=@"01";
    }else if ([month isEqualToString:@"Feb"]){
        numberAsMonth=@"02";
    }else if ([month isEqualToString:@"Mar"]){
        numberAsMonth=@"03";
    }else if ([month isEqualToString:@"Apr"]){
        numberAsMonth=@"04";
    }else if ([month isEqualToString:@"May"]){
        numberAsMonth=@"05";
    }else if ([month isEqualToString:@"Jun"]){
        numberAsMonth=@"06";
    }else if ([month isEqualToString:@"Aug"]){
        numberAsMonth=@"07";
    }else if ([month isEqualToString:@"Sep"]){
        numberAsMonth=@"08";
    }else if ([month isEqualToString:@"Oct"]){
        numberAsMonth=@"09";
    }else if ([month isEqualToString:@"Sep"]){
        numberAsMonth=@"10";
    }else if ([month isEqualToString:@"Nov"]){
        numberAsMonth=@"11";
    }else
        numberAsMonth=@"12";
    return numberAsMonth;
}
-(id)getImageLinkInString:(NSString *)descriptionString{
    NSString *imageLink=@"";
    
    NSError *error = nil;
    NSString *pattern = @"src=\"([^\"]+)";
    NSRange range = NSMakeRange(0, descriptionString.length);
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSArray *matches = [regex matchesInString:descriptionString options:0 range:range];
    for (NSTextCheckingResult* match in matches) {
        NSRange group1 = [match rangeAtIndex:1];
        imageLink=[NSString stringWithFormat:@"%@", [descriptionString substringWithRange:group1]];
    }
    return imageLink;
    
}
-(id)getDescriptionInString: (NSString*)descriptionString{
    NSString *description=@"";
    NSError *error = nil;
    NSString *pattern = @"</br>([^&]+)";
    NSRange range = NSMakeRange(0, descriptionString.length);
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSArray *matches = [regex matchesInString:descriptionString options:0 range:range];
    for (NSTextCheckingResult* match in matches) {
        NSRange group1 = [match rangeAtIndex:1];
        description=[NSString stringWithFormat:@"%@", [descriptionString substringWithRange:group1]];
    }
    return description;
}
@end
