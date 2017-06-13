//
//  GetData.m
//  ReadingNEWS
//
//  Created by dankhanh on 6/12/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import "GetData.h"
@interface GetData() <NSURLSessionDelegate>

@end
@implementation GetData
-(void)connectWithLink :(NSString *)urlLink {
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlLink] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSString *dataAsString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",dataAsString);
        
//        NSMutableDictionary *dictionaryOfContentWeb=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"%@",dictionaryOfContentWeb);

//        NSLog(@"response %@",response);
//        NSLog(@"data %@",data);
    }]resume];
}

@end


