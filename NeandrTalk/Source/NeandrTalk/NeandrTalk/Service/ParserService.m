//
//  ParserService.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "ParserService.h"
#import "NeandrModel.h"
#import "PostModel.h"
#import "UserModel.h"
@implementation ParserService
-(NSMutableArray *)getList:(NSString *)listName{
    NSMutableArray *dicUser = [[NSMutableArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:listName ofType:@"plist"]];
    if ([listName  isEqual: @"neandr"]) {
        return [self parseNeandrModel:dicUser];
    } else {
        return [self parsePostModel:dicUser];
    }
    
}
-(NSArray *)parseNeandrModel:(NSArray *)arrayData{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *neandr in arrayData) {
        
        NeandrModel *neandrModel = [[NeandrModel alloc] init];
        neandrModel.backgroundNameImage = [neandr valueForKey:@"backgroundImage"];
        neandrModel.leftNameImage = [neandr valueForKey:@"leftImage"];
        neandrModel.centerNameImage = [neandr valueForKey:@"centerImage"];
        neandrModel.logoNameImage = [neandr valueForKey:@"logoImage"];
        neandrModel.titleLabel  = [neandr valueForKey:@"titleLabel"];
        neandrModel.titleRelated = [neandr valueForKey:@"titleRelated"];
        neandrModel.descriptionLabel = [neandr valueForKey:@"descriptionLabel"];
        
        [array addObject:neandrModel];
        
    }
    return array;
}
-(NSArray *)parsePostModel:(NSArray *)arrayData{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *poster in arrayData) {
        PostModel *post = [[PostModel alloc] init];
        post.primaryImage = [poster valueForKey:@"primaryImage"];
        post.postID = [poster valueForKey:@"postID"];
        post.postIDUserOwner= [poster valueForKey:@"postIDUserOwner"];
        post.postType = [poster valueForKey:@"postType"];
        post.title = [poster valueForKey:@"title"];
        post.descriptionPost= [poster valueForKey:@"descriptionPost"];
        post.arrayImages= [poster valueForKey:@"arrayImages"];
        post.arrayTags= [poster valueForKey:@"arrayTags"];
        post.arrayComments= [poster valueForKey:@"arrayComments"];
        post.likes = [poster valueForKey:@"likes"];
        post.votes = [poster valueForKey:@"votes"];
        post.views = [poster valueForKey:@"views"];
        post.favorite= [poster valueForKey:@"favorite"];
        post.follow = [poster valueForKey:@"follow"];
        post.report = [poster valueForKey:@"report"];
        post.stars = [poster valueForKey:@"stars"];
        post.featured=[poster valueForKey:@"featured"];
        [array addObject:post];
        
    }
    return array;
}
@end
