//
//  DiscussionFeaturedPostCollectionViewCell.m
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "DiscussionFeaturedPostCollectionViewCell.h"
#import "TagsPostTableViewCell.h"

@implementation DiscussionFeaturedPostCollectionViewCell
-(void)getData:(PostModel *)post{
    self.featuredPostImage.image = [UIImage imageNamed:post.primaryImage];
    self.featuredPostTitle.text = post.title;
    if (post.descriptionPost != nil) {
        self.featurePostDescription.text = post.descriptionPost;
    }
    self.arrayTag = post.arrayTags;

    [self setStyle];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = _height/5;
    return height;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TagsPostTableViewCell *cell = [_tableTags dequeueReusableCellWithIdentifier:@"tagCellF" forIndexPath:indexPath];
    [cell getData:_arrayTag[indexPath.section]];
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_arrayTag count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view  = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
-(void)setStyle{
    _tableTags.backgroundColor = nil;
    _height = self.tableTags.frame.size.height;
    
    
}
@end
