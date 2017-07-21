//
//  DataForViewController.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "DataForViewController.h"

@implementation DataForViewController
-(NSMutableArray *)getUserList:(NSString *)listName{
    NSString *path=[[NSBundle mainBundle] pathForResource:listName ofType:@"plist"];
    NSMutableArray * userArray=[[NSMutableArray alloc] initWithContentsOfFile:path];
    return userArray;
}
@end

