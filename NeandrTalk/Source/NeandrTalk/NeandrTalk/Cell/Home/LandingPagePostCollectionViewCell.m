//
//  LandingPagePostCollectionViewCell.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "LandingPagePostCollectionViewCell.h"
#import "TagsPostTableViewCell.h"
@implementation LandingPagePostCollectionViewCell
-(void)getData:(PostModel *)post{
    self.img.image = [UIImage imageNamed:post.primaryImage];
    self.titlePost.text = post.title;
    self.descriptionPost.text = post.descriptionPost;
    self.arrayTag = post.arrayTags;
    [_tableTags setDataSource:self];
    [_tableTags setDelegate:self];
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
