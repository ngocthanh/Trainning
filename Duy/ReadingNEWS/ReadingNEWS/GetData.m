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
        
        //NSString *dataAsString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }]resume];
}
-(id)dataImageFromUrl : (NSString *)Url{
    NSURL *url = [NSURL URLWithString:Url];
    NSData *data = [NSData dataWithContentsOfURL:url];
    return data;
}

@end


