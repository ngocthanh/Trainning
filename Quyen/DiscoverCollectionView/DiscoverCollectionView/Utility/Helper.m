//
//  Helper.m
//  DiscoverCollectionView
//
//  Created by KterKC on 6/22/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "Helper.h"

@implementation Helper
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
    dateFormatter.dateFormat = formatDate;
    NSDate *date = [dateFormatter dateFromString:stringDate];
    dateFormatter.dateFormat = formatDateVN;
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}
-(NSInteger)setNumberOfRowsInSection:(NSInteger) number{
    switch (number) {
        case 0:
            return 3;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 10;
            break;
        case 3:
            return 7;
            break;
        case 4:
            return 5;
            break;
 
    }
    return  0;//number + intThree + intOne;
}

-(void)loadWebViewWithURL:(NSString*) stringURL WebView:(UIWebView*) webview{
    if (![stringURL isEqual: textNil]) {
        NSURL *url = [[NSURL alloc] initWithString:stringURL];
        
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        
        [webview loadRequest:request];
            
    }
}


@end
