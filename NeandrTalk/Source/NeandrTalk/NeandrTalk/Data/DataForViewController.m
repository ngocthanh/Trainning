//
//  DataForViewController.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "DataForViewController.h"

@implementation DataForViewController
-(NSMutableArray *)getUserList{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"user" ofType:@"plist"];
    NSMutableArray * userArray=[[NSMutableArray alloc] initWithContentsOfFile:path];
    
    NSLog(@"%@",userArray);
    return userArray;
}
@end

