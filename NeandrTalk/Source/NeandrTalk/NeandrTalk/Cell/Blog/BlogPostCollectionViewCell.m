//
//  BlogPostCollectionViewCell.m
//  NeandrTalk
//
//  Created by dankhanh on 7/25/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "BlogPostCollectionViewCell.h"
#import "TagsPostTableViewCell.h"

@implementation BlogPostCollectionViewCell
-(void)getData:(PostModel *)post{
    self.imageBlogPost.image = [UIImage imageNamed:post.primaryImage];
    self.titleBlogPost.text = post.title;
    if (post.descriptionPost != nil) {
        self.descriptionBlogPost.text = post.descriptionPost;
        self.tvDesciption.text=post.descriptionPost;
    }
    NSMutableString * tagList = [[NSMutableString alloc] init];
    for (NSString *tag in post.arrayTags) {
        if (tag==[post.arrayTags objectAtIndex:0]) {
            [tagList appendString:tag];
        }
        else
        {
        [tagList appendString:[NSString stringWithFormat:@",%@",tag]];
        }
    }
    self.alltags.text=[NSString stringWithFormat:@"[%@]",tagList];
    self.numberOfComment.text=[NSString stringWithFormat:@"%lu COMMENTS", (unsigned long)[post.arrayComments count]];
    self.contentView.layer.borderWidth=1;
    self.contentView.layer.borderColor=[UIColor blackColor].CGColor;

    self.arrayTag = post.arrayTags;

    [self setStyle];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = _height/5;
    return height;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TagsPostTableViewCell *cell = [_tableTags dequeueReusableCellWithIdentifier:@"tagCell" forIndexPath:indexPath];
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
