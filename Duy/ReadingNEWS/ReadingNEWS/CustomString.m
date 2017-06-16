//
//  CustomString.m
//  ReadingNEWS
//
//  Created by dankhanh on 6/13/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import "CustomString.h"

@implementation CustomString
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
